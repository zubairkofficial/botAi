<?php

namespace App\Http\Controllers\Backend\AI;

use App\Http\Controllers\Controller;
use App\Models\AiBlogWizard;
use App\Models\AiBlogWizardArticle;
use App\Models\AiBlogWizardArticleLog;
use App\Models\Language;
use App\Models\SubscriptionPackage;
use App\Traits\PopulateWizardData;
use Illuminate\Http\Request; 

class BlogWizardController extends Controller
{
    use PopulateWizardData;

    public function __construct()
    {
        if (getSetting('enable_blog_wizard') == '0') {
            flash(localize('AI Blog Wizard is not available'))->info();
            redirect()->route('writebot.dashboard')->send();
        }
    }

    # blog wizard index
    public function index(Request $request)
    {  
        
        $user = auth()->user();
        if ($user->user_type == "customer") {
            $package = optional(activePackageHistory())->subscriptionPackage ?? new SubscriptionPackage;
            if ($package->allow_blog_wizard == 0) {
                abort(403);
            }
        } else {
            if (!auth()->user()->can('blog_wizard')) {
                abort(403);
            }
        }

        $blogs = AiBlogWizard::latest();
        $blogs = $blogs->where('user_id', auth()->user()->id);
        $blogs = $blogs->paginate(paginationNumber());

        return view('backend.pages.blogWizard.index',compact('blogs'));
    }

    # return view of create form
    public function create(Request $request)
    {
        $user = auth()->user();
        if ($user->user_type == "customer") {
            $package = optional(activePackageHistory())->subscriptionPackage ?? new SubscriptionPackage;
            if ($package->allow_blog_wizard == 0) {
                abort(403);
            }
        } else {
            if (!auth()->user()->can('blog_wizard')) {
                abort(403);
            }
        }
        $aiBlogWizard = null;
        if($request->uuid){
            $aiBlogWizard = AiBlogWizard::where('uuid', $request->uuid)->where('user_id', $user->id)->first();
        }
        $languages = Language::isActiveForTemplate()->latest()->get(); 
        return view('backend.pages.blogWizard.create',compact('languages', 'aiBlogWizard'));
    }  

    # init article
    public function initArticle(Request $request){   
        $user                       = auth()->user(); 
        $checkOpenAiInstance        = $this->openAiInstance(); 

        if($checkOpenAiInstance['status'] == true){
            $outlines       = collect($request->outlines)->implode(' ');
            $prompt         = "$request->title. $request->keywords. $outlines";

            // filter bad words  
            $parsePromptController = new ParsePromptsController;
            $foundBadWords = $parsePromptController->filterBadWords(["prompt" => $prompt]);  
            if ($foundBadWords != '') {
                $prompt = "bad_words_found_#themeTags" . $foundBadWords;
                if (preg_match("/bad_words_found/i", $prompt) == 1) {
                    $badWords =  explode('_#themeTags', rtrim($prompt, ","));
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('Please remove these words from your inputs') . '-' . $badWords[1],
                    ];
                    return $data;
                }
            }   

            $aiBlogWizardArticle = AiBlogWizardArticle::where('ai_blog_wizard_id', $request->ai_blog_wizard_id)->first();
            if(is_null($aiBlogWizardArticle)){
                $aiBlogWizardArticle = new AiBlogWizardArticle;
                $aiBlogWizardArticle->ai_blog_wizard_id = $request->ai_blog_wizard_id;
                $aiBlogWizardArticle->title             = $request->title;
                $aiBlogWizardArticle->keywords          = $request->keywords;
                $aiBlogWizardArticle->outlines          = json_encode($request->outlines);
                $aiBlogWizardArticle->created_by        = $user->id;
            }else{
                $aiBlogWizardArticle->title             = $request->title;
                $aiBlogWizardArticle->keywords          = $request->keywords;
                $aiBlogWizardArticle->outlines          = json_encode($request->outlines); 
                $aiBlogWizardArticle->num_of_copies     += 1;
            } 
            $aiBlogWizardArticle->value = null;
            if($request->image != null){ 
                $aiBlogWizardArticle->image             = $request->image;
            }
            $aiBlogWizardArticle->updated_by = null;

            if($user->user_type == "customer"){
                try {
                    $activePackageHistory = $checkOpenAiInstance['activePackageHistory'];
                    $aiBlogWizard = $aiBlogWizardArticle->aiBlogWizard;
                    $aiBlogWizard->subscription_history_id = $activePackageHistory->id;
                    $aiBlogWizard->save(); 
                    
                    $request->session()->put('subscription_history_id', $activePackageHistory->id);
                } catch (\Throwable $th) {
                    //throw $th;
                }
            } 

            $aiBlogWizardArticle->save();

            $request->session()->put('ai_blog_wizard_article_id', $aiBlogWizardArticle->id);
            $request->session()->put('outlines', json_encode($request->outlines));
            $request->session()->put('title', $request->title);
            $request->session()->put('keywords', $request->keywords);
            $request->session()->put('lang', $request->lang);
            
            $data = [
                'status'            => 200,
                'success'           => true,
                'message'           => '',
                'articleId'         => $aiBlogWizardArticle->id, 
                'article'           => view('backend.pages.blogWizard.stepsData.article', ['article'=> $aiBlogWizardArticle])->render(),
                'usedPercentage'    => view('backend.pages.templates.inc.used-words-percentage')->render(),
            ]; 
            return $data;  
        }else{
            return $checkOpenAiInstance;
        }
    }

    # generate article
    public function generateArticle(){   
        $aiBlogWizardArticle        = AiBlogWizardArticle::where('id', session('ai_blog_wizard_article_id'))->first();
        $user                       = auth()->user(); 
        $checkOpenAiInstance        = $this->openAiInstance();
            
        # ai prompt
        $promptOutlines = session('outlines');
        $title          = session('title');
        $keywords       = session('keywords');
        $lang           = session('lang');
        
        $prompt = "This is the title: $title. These are the keywords: $keywords. This is the heading list: $promptOutlines. Expand each heading section to generate article in $lang language. Do not add other headings or write more than the specific headings. Give the heading output in bold font."; 

        
        $model =  getSetting('ai_blog_wizard_model') ?? 'gpt-3.5-turbo-16k'; 

        $opts = [
            'model'     => $model,
            'messages'  => [[
                "role" => "user",
                "content" => $prompt
            ]],
            'temperature' => 1.0,
            'presence_penalty' => 0.6,
            'frequency_penalty' => 0,
            'stream' => true
        ]; 

        session()->put('ai_blog_wizard_article_id_for_balance', $aiBlogWizardArticle->id);
        # make api call to openAi  
        return response()->stream(function () use ($checkOpenAiInstance, $opts, $user, $aiBlogWizardArticle){   
            # 1. init openAi
            $open_ai = $checkOpenAiInstance['open_ai'];  
            $text = ""; 
            $open_ai->chat($opts, function ($curl_info, $data) use (&$text, &$aiBlogWizardArticle, & $user) {
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

                        $aiBlogWizardArticle->value         = $text;
                        $words                              = count(explode(' ', ($text))); // todo:: add user input counter 
                        $aiBlogWizardArticle->total_words   = $words;
                        $aiBlogWizardArticle->save();  
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
            
            $words = count(explode(' ', ($text))); // todo:: add user input counter
            if ($user->user_type == "customer") {
                updateDataBalance('words', $words, $user);
            }
             
            $aiBlogWizardArticle->save(); 

            $aiBlogWizard = $aiBlogWizardArticle->aiBlogWizard;
            $aiBlogWizard->completed_step = 5;
            $aiBlogWizard->total_words += $words;
            $aiBlogWizard->save();

            // log
            $aiBlogWizardArticleLog = new AiBlogWizardArticleLog;
            $aiBlogWizardArticleLog->user_id = $user->id;
            $aiBlogWizardArticleLog->ai_blog_wizard_id = $aiBlogWizard->id;
            $aiBlogWizardArticleLog->ai_blog_wizard_article_id = $aiBlogWizardArticle->id;
            $aiBlogWizardArticleLog->subscription_history_id = session('subscription_history_id');
            $aiBlogWizardArticleLog->total_words = $aiBlogWizardArticle->total_words;
            $aiBlogWizardArticleLog->save();

        }, 200, [
            'Cache-Control' => 'no-cache',
            'Content-Type' => 'text/event-stream',
        ]);
    }
    # updateBalanceStopGeneration
    public function updateBalanceStopGeneration(Request $request)
    {
        
        $id = session()->put('ai_blog_wizard_article_id_for_balance');
        
        $user = auth()->user();
        if($id && $user->user_type == "customer") {
            $aiBlogWizardAritcle = AiBlogWizardArticle::where('id', $id)->where('created_by', $user->id)->first();          
            if($aiBlogWizardAritcle){
                $words = $aiBlogWizardAritcle->total_words;
                updateDataBalance('words', $words, $user);
                session()->forget('ai_blog_wizard_article_id_for_balance');
                return response()->json(['success'=>true]);
            }
        }
        
        return response()->json(['success'=>false]);
    }
    # show
    public function show($uuid){
        $aiBlogWizard = AiBlogWizard::where('uuid', $uuid)->first(); 
        $article = $aiBlogWizard->aiBlogWizardArticle;  
        return view('backend.pages.blogWizard.show',compact('article'));
    }

    # edit
    public function edit($uuid){
        $aiBlogWizard = AiBlogWizard::where('uuid', $uuid)->first(); 
        $article = $aiBlogWizard->aiBlogWizardArticle;  
        return view('backend.pages.blogWizard.edit',compact('article'));
    }

    # update
    public function update(Request $request){ 
        $article = AiBlogWizardArticle::where('id', $request->ai_blog_wizard_article_id)->first(); 
        $article->title = $request->title;
        $article->value = $request->article;
        $article->updated_by = auth()->user()->id;
        $article->save();
        return [
            'status'    => 200,
            'success'   => true
        ]; 
    }
    

    # delete blog wizard
    public function delete($uuid){
        $aiBlogWizard = AiBlogWizard::where('uuid', $uuid)->first();
        if($aiBlogWizard->aiBlogWizardKeyword){
            $aiBlogWizard->aiBlogWizardKeyword->delete();
        }
        if($aiBlogWizard->aiBlogWizardTitle){
            $aiBlogWizard->aiBlogWizardTitle->delete();
        }

        $aiBlogWizard->aiBlogWizardImages()->delete();
         
        $aiBlogWizard->aiBlogWizardOutlines()->delete();
      
        if($aiBlogWizard->aiBlogWizardArticle){
            $aiBlogWizard->aiBlogWizardArticle->delete();
        }
        $aiBlogWizard->delete();
        flash(localize('Blog has been deleted successfully'))->success();
        return back();
    }
}
