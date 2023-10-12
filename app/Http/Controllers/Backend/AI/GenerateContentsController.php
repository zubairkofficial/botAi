<?php

namespace App\Http\Controllers\Backend\AI;

use App\Http\Controllers\Controller;
use App\Models\CustomTemplate;
use App\Models\Project;
use App\Models\ProjectLog;
use App\Models\Template;
use App\Models\TemplateUsage;
use Illuminate\Http\Request;
use Orhanerday\OpenAi\OpenAi;
use Str;

class GenerateContentsController extends Controller
{
    # generate contents
    public function generate(Request $request)
    {
        $user = auth()->user();

        $template = Template::where('code', $request->template_code)->first();
        if (empty($template)) {
            abort(404);
        }

        # 2. verify if user has access to the template [template available in subscription package]
        if ($user->user_type == "customer") {
            // check package balance
            $checkBalanceData = activePackageBalance();
            if (!empty($checkBalanceData)) {
                return $checkBalanceData;
            }
            // check word limit  
            if (availableDataCheck('words') <= 0) {
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => localize('Your word balance is low, please upgrade you plan'),
                ];
                return $data;
            }
        }

        # 4. generate prompt in selected language 
        $max_tokens     = getSetting('default_max_result_length', -1);

        if ($request->max_tokens != null) {
            $max_tokens     = (int)$request->max_tokens;
        }
        $inputAll = $request->all();
        $inputAll['max_tokens'] = $max_tokens;

        $parsePromptsController = new ParsePromptsController;
        $prompt                 = $parsePromptsController->index($inputAll);
        
        if (preg_match("/bad_words_found/i", $prompt) == 1) {
            $badWords =  explode('_#themeTags', rtrim($prompt, ","));
            $data = [
                'status'  => 400,
                'success' => false,
                'message' => localize('Please remove these words from your inputs') . '-' . $badWords[1],
            ];
            return $data;
        }

        # 5. apply openAi model based on admin configuration  
        $model = getSetting('default_open_ai_model') ?? 'gpt-3.5-turbo'; // default model
        if ($user->user_type == "customer" && activePackageHistory() && activePackageHistory()->subscriptionPackage) {
            $model = activePackageHistory()->subscriptionPackage->openai_model->key;
        }

        # 6. generate contents
        $temperature    = (float)$request->creativity; 

        // ai params
        $aiParams = [
            'model'             => $model,
            'temperature'       => $temperature, 
            'presence_penalty'  => 0.6,
            'frequency_penalty' => 0,
            'stream'            => true
        ];

        if ($max_tokens != -1) {
            $aiParams['max_tokens'] = $max_tokens;
        } 
        # opts
        $aiParams['messages'] = [[
            "role" => "user",
            "content" => $prompt
        ]];

        if($request->project_id != null){ 
            $project = Project::whereId($request->project_id)->first();
            $request->session()->put('project_id', $project->id);
        }else{ 
            $projectTitle = "Untitled Project - " . date("Y-m-d");
            $project = new Project;
            $project->user_id       = $user->id;
            $project->template_id   = $template->id;
            $project->model_name    = $aiParams['model'];
            $project->title         = $projectTitle;
            $project->slug          = preg_replace('/\s+/', '-', trim($projectTitle)) . '-' . strtolower(Str::random(5)); 
            $project->content_type  = 'content'; 
            $project->save();
            $request->session()->put('project_id', $project->id);
        }  

        session()->put('template_id', $template->id);
        session()->put('aiParams', $aiParams); 

        $data = [
            'status'            => 200,
            'success'           => true,
            'title'             => $project->title,
            'project_id'        => $project->id ?? ''
        ];
        return $data;
    }

    # generate contents
    public function generateCustom(Request $request)
    {
        $user = auth()->user(); 

        $template = CustomTemplate::where('code', $request->template_code)->first();
        if (empty($template)) {
            abort(404);
        }

        # 2. verify if user has access to the template [template available in subscription package]
        if ($user->user_type == "customer") {
            // check package balance

            $checkBalanceData = activePackageBalance('allow_custom_templates');
            if (!empty($checkBalanceData)) {
                return $checkBalanceData;
            }
            // check word limit  
            if (availableDataCheck('words') <= 0) {
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => localize('Your word balance is low, please upgrade you plan'),
                ];
                return $data;
            }
        }

        # 4. generate prompt
        $prompt  = $template->prompt;
 
        foreach ($request->all() as $name => $inpVal) {
            if ($name != '_token' && $name != 'project_id' && $name != 'max_tokens') {
                $name = '{_' . $name . '_}';
                if (!is_null($inpVal) && !is_null($name)) {
                    $prompt = str_replace($name, $inpVal, $prompt);
                } else {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('Your input does not match with the custom prompt'),
                    ];
                    return $data;
                }
            }
        } 

        # 5. apply openAi model based on admin configuration  
        $model = getSetting('default_open_ai_model') ?? 'gpt-3.5-turbo';
        if ($user->user_type == "customer" && activePackageHistory() && activePackageHistory()->subscriptionPackage) {
            $model = activePackageHistory()->subscriptionPackage->openai_model->key;
        }

        # 6. generate contents
        $temperature    = (float)$request->creativity;
        $max_tokens     =  getSetting('default_max_result_length', -1);

        if ($request->max_tokens != null) {
            $max_tokens     = (int)$request->max_tokens;
        }  
 
        // ai params
        $aiParams = [
            'model'             => $model,
            'temperature'       => $temperature, 
            'presence_penalty'  => 0.6,
            'frequency_penalty' => 0,
            'stream'            => true
        ]; 
        if ($max_tokens != -1) {
            $aiParams['max_tokens'] = $max_tokens; 
            $prompt .= 'Write in ' . $request->lang . ' language.'  . ' The tone of voice should be ' . $request->tone . ' and the output must be completed in ' . $max_tokens . ' words. Do not write translations.';
        }  else{ 
            $prompt .= 'Write in ' . $request->lang . ' language.'  . ' The tone of voice should be ' . $request->tone . '. Do not write translations.';
        } 

        # opts
        $aiParams['messages'] = [[
            "role" => "user",
            "content" => $prompt
        ]];

        if($request->project_id != null){ 
            $project = Project::whereId($request->project_id)->first();
            $request->session()->put('project_id', $project->id);
        }else{ 
            $projectTitle = "Untitled Project - " . date("Y-m-d");
            $project = new Project;
            $project->user_id       = $user->id;
            $project->custom_template_id   = $template->id;
            $project->model_name    = $aiParams['model'];
            $project->title         = $projectTitle;
            $project->slug          = preg_replace('/\s+/', '-', trim($projectTitle)) . '-' . strtolower(Str::random(5)); 
            $project->content_type  = 'content'; 
            $project->save();
            $request->session()->put('project_id', $project->id);
        }   
        
        $request->session()->put('template_id', $template->id);
        $request->session()->put('aiParams', $aiParams);

        $data = [
            'status'            => 200,
            'success'           => true,
            'title'             => $project->title,
            'project_id'        => $project->id ?? ''
        ];
        return $data; 
    }

    # processContents
    public function processContents(){ 
        $user            = auth()->user();  
        $opts            = session('aiParams'); 
        $project_id      = session('project_id');
        $project         = Project::where('id', $project_id)->first(); 

        # 1. init openAi
        $open_ai = new OpenAi(openAiKey());

        return response()->stream(function () use ($project, $open_ai, $user, $opts){     

            $text = "";
            $output = "";

            $open_ai->chat($opts, function ($curl_info, $data) use (&$text, &$project, &$user) {
                if ($obj = json_decode($data) and $obj->error->message != "") {
                    error_log(json_encode($obj->error->message));
                } else { 
                     
                    $dataJson = str_replace("data: ", "", $data);
                    $dataJson = preg_split('/\r\n|\r|\n/', $dataJson);
                    if(str_contains($data, 'data: [DONE]')){ 
                        echo 'data: [DONE]';
                    } else if(!empty($dataJson)) {
                        $singlePartResponse = "";
                        
                        foreach($dataJson as $singleData) {
                            $tempResponse = json_decode($singleData, true);
                            if ($data != "data: [DONE]\n\n" and isset($tempResponse["choices"][0]["delta"]["content"])) { 
                                $responseText = str_replace(["\r\n", "\r", "\n"], "<br>", $tempResponse["choices"][0]["delta"]["content"]);
                                $text .= $responseText;
                                $singlePartResponse .= $responseText;
                            }
                        }

                        $project->content = $text;
                        $project->words   = count(explode(' ', ($text)));
                        $project->save();
                        echo 'data: ' . $singlePartResponse;
                    }
                }

                echo PHP_EOL;
                
                if (ob_get_level() < 1) {
                    ob_start();
                } 
                echo "\n\n";
                ob_flush();
                flush();
                return strlen($data);
            });
            
            $this->updateUserWords($project->words, $user);

            $output         = str_replace(["\r\n", "\r", "\n"], "<br>", $text);

            $promptsToken   = count(explode(' ', $opts['messages'][0]['content']));
            $completionToken = count(explode(' ', $output));
            $tokens = $promptsToken + $completionToken; 

            $latestPackage      = activePackageHistory();
            $previousBalance    = $latestPackage ?  $latestPackage->this_month_available_words : null;
            $after_balance      = $latestPackage ? $latestPackage->this_month_available_words - $project->words : null;

            # keep log
            $logData = [
                'user_id' => $project->user_id,
                'project_id' => $project->id,
                'subscription_history_id' => $latestPackage? $latestPackage->id : null,
                'subscription_package_id' =>  $latestPackage? $latestPackage->subscription_package_id : null,
                'template_id' => $project->template_id !=null ? $project->template_id : null,
                'custom_template_id' =>$project->custom_template_id !=null ? $project->custom_template_id : null,
                'model_name' => $project->model_name,
                'content' => $output,
                'content_type' => $project->content_type,
                'words' => $project->words,
                'prompt_words' => $promptsToken,
                'completion_words' => $completionToken,
                'previous_balance' => $previousBalance,
                'after_balance' => $after_balance
            ];
            $this->createLog($logData); 
            # update template usage
            if(!is_null($project->template_id)){
                $template = Template::whereId($project->template_id)->first();
                $this->updateTemplateUsages($tokens, $template, $user);
            }else{
                $template = CustomTemplate::whereId($project->custom_template_id)->first();
                $this->updateTemplateUsages($tokens, $template, $user, true);
            } 
        }, 200, [
            'Cache-Control' => 'no-cache',
            'Content-Type' => 'text/event-stream',
        ]);
    }

    # updateUserWords - take token as word
    public function updateUserWords($tokens, $user)
    {
        if ($user->user_type == "customer") {
            updateDataBalance('words', $tokens, $user);
        }
    }

    # updateTemplateUsages - take token as word
    public function updateTemplateUsages($tokens, $template, $user, $customTemplate = false)
    {
        // user wise template usage
        $template->total_words_generated += (int) $tokens;
        $template->save();

        // user wise template usage
        $templateUsage                      = new TemplateUsage;
        $templateUsage->user_id             = $user->id;
        if ($customTemplate) {
            $templateUsage->custom_template_id         = $template->id;
        } else {
            $templateUsage->template_id         = $template->id;
        }
        $templateUsage->total_used_words    = (int) $tokens;
        $templateUsage->save(); 

    }

    # keep log
    public function createLog($data)
    {
        ProjectLog::create($data);
    }
}
