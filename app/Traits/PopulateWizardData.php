<?php

namespace App\Traits;

use App\Http\Controllers\Backend\AI\GenerateContentsController;
use App\Http\Controllers\Backend\AI\ParsePromptsController;
use App\Models\SubscriptionPackage;
use Illuminate\Http\Request;
use Orhanerday\OpenAi\OpenAi;
use App\Models\AiBlogWizard;
use App\Models\AiBlogWizardArticle;
use App\Models\AiBlogWizardImage;
use App\Models\AiBlogWizardKeyWord;
use App\Models\AiBlogWizardOutline;
use App\Models\AiBlogWizardTitle;
use Str;
use  App\Http\Services\GenerateImage;
trait PopulateWizardData
{ 
    # open ai instance for blog wizard
    public function openAiInstance(){ 
        $status   = true;
        $message  = '';
        $open_ai  = new OpenAi(openAiKey());

        $return   = [
            'status'    =>$status,
            'open_ai'   =>$open_ai,
            'message'   =>$message
        ];

        # verify if user has access to the template [template available in subscription package]
        $user = auth()->user();
        if ($user->user_type == "customer") { 
            $package = optional(activePackageHistory())->subscriptionPackage ?? new SubscriptionPackage;

            if ($package->allow_blog_wizard == 0) {
                $return   = [
                    'status'    => $status ,
                    'open_ai'   => $open_ai,
                    'message'   => localize('You are not allowed to use blog wizard')
                ];
            }

            // check package balance
            $checkBalanceData = activePackageBalance();
            if (!empty($checkBalanceData)) {
                return $return;
            }
         
            // check word limit  
            if (availableDataCheck('words') <= 0) { 
                $return   = [
                    'status'    =>  false,
                    'open_ai'   =>  $open_ai,
                    'message'   =>  localize('Your word balance is low, please upgrade you plan')
                ]; 
            }
            $return['activePackageHistory'] = activePackageHistory(); 
        } 
        return $return;
    }
    
    # generate keywords
    public function generateKeywords(Request $request){
        $user                = auth()->user();
        $checkOpenAiInstance = $this->openAiInstance();

        if($checkOpenAiInstance['status'] == true){
            // generate here
            $prompt         = $request->topic;

            // filter bad words  
            $parsePromptController = new ParsePromptsController;
            $foundBadWords = $parsePromptController->filterBadWords($request->all());  
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
            
            # ai prompt
            $prompt = "Generate $request->number_of_results seo friendly keywords in $request->lang language based on this topic: $request->topic, each keywords must be an array element, give the output as an array.";

            # apply openAi model based on admin configuration   
            $model =  getSetting('ai_blog_wizard_model') ?? 'gpt-3.5-turbo-16k'; 
            //  
            $num_of_results = 1;
            $temperature    = 1; // high
            $aiParams = [
                'model' => $model,
                'temperature' => $temperature,
                'n' => $num_of_results, 
                'messages' => [
                    [
                        "role" => "user",
                        "content" => $prompt
                    ]
                ]
            ];  
           
            # make api call to openAi 
            $open_ai = $checkOpenAiInstance['open_ai']; 
            $aiParams['messages'] = [[
                "role" => "user",
                "content" => $prompt
            ]];
            $result = $open_ai->chat($aiParams); 

            $result = json_decode($result, true);

            $outputContents = '';
            if (isset($result['choices'])) { 
                $outputContents = $result['choices'][0]['message']['content'];  

                $tokens = $result['usage']['total_tokens'];

                if(!empty($request->ai_blog_wizard_id)){
                    $keyword                    = AiBlogWizardKeyWord::where('ai_blog_wizard_id', $request->ai_blog_wizard_id)->first();
                    $oldValues                  = json_decode($keyword->values);
                    $aiBlogWizard               = $keyword->aiBlogWizard;
                    if(is_null($aiBlogWizard)){
                        $aiBlogWizard           = $this->__newBlogWizard($user); 
                        $keyword->ai_blog_wizard_id = $aiBlogWizard->id; 
                    }
                    $values                     = array_merge($oldValues, json_decode($outputContents));
                    $keyword->topic             = $request->topic;
                    $keyword->num_of_copies     += 1;
                    $keyword->values            = json_encode($values);
                }else{
                    $aiBlogWizard               = $this->__newBlogWizard($user);  
                    $keyword                    = new AiBlogWizardKeyWord;
                    $keyword->created_by        = $user->id;
                    $keyword->ai_blog_wizard_id = $aiBlogWizard->id; 
                    $keyword->topic             = $request->topic;
                    $keyword->values            = $outputContents;
                }
                
                $keyword->total_words  += $tokens;
                $keyword->save();

                $aiBlogWizard->completed_step  = 1;
                $aiBlogWizard->total_words     += $keyword->total_words;
                $aiBlogWizard->save();
    
                # 8. update word limit for user or admin/staff
                $generateContentsController = new GenerateContentsController;
                $generateContentsController->updateUserWords($tokens, $user);
      
                $data = [
                    'status'                    => 200,
                    'success'                   => true,
                    'ai_blog_wizard_id'         => $keyword->ai_blog_wizard_id ?? '',
                    'keywords'                  => json_decode($keyword->values),
                    'output'                    => view('backend.pages.blogWizard.stepsData.keywords', ['keywords'=> json_decode($keyword->values)])->render(),
                    'usedPercentage'            => view('backend.pages.templates.inc.used-words-percentage')->render(),
                ];
                return $data;
            } else {
                if (isset($result['error']['message'])) {
                    $message = $result['error']['message'];
                } else {
                    $message = localize('There is an issue with the open ai account');
                }
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => $message
                ];
                return $data;
            }  
        }else{
            return $checkOpenAiInstance;
        }
    }

    # new blog wizard
    private function __newBlogWizard($user){
        $aiBlogWizard = new AiBlogWizard;
        $aiBlogWizard->user_id      = $user->id;
        $aiBlogWizard->created_by   = $user->id;
        $aiBlogWizard->uuid         = Str::uuid();
        $aiBlogWizard->save(); 
        return $aiBlogWizard;
    } 
    
    # generate titles
    public function generateTitles(Request $request){
        $user                = auth()->user();
        $checkOpenAiInstance = $this->openAiInstance();

        if($checkOpenAiInstance['status'] == true){
            // generate here
            $prompt         = "Topic: $request->topic. Keywords: $request->keywords";

            // filter bad words  
            $parsePromptController = new ParsePromptsController;
            $foundBadWords = $parsePromptController->filterBadWords($request->all());  
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
            
            # ai prompt
            $prompt = "Generate $request->number_of_results seo friendly titles in $request->lang language based on these topic & keywords. Topic: $request->topic, Keywords: $request->keywords, each titles must be an array element, give the output as an array."; 

            # apply openAi model based on admin configuration  
            $model =  getSetting('ai_blog_wizard_model') ?? 'gpt-3.5-turbo-16k'; 
 
            //  
            $num_of_results = 1;
            $temperature    = 1; // high
            $aiParams = [
                'model' => $model,
                'temperature' => $temperature,
                'n' => $num_of_results, 
                'messages' => [
                    [
                        "role" => "user",
                        "content" => $prompt
                    ]
                ]
            ];  
        

            # make api call to openAi 
            $open_ai = $checkOpenAiInstance['open_ai']; 
            $aiParams['messages'] = [[
                "role" => "user",
                "content" => $prompt
            ]];
            $result = $open_ai->chat($aiParams);
             
            $result = json_decode($result, true);
            
            $outputContents = '';
            if (isset($result['choices'])) {
                 
                $outputContents = $result['choices'][0]['message']['content'];  

                $tokens = $result['usage']['total_tokens'];

                if(!empty($request->ai_blog_wizard_id)){
                    $aiBlogWizard               = AiBlogWizard::whereId($request->ai_blog_wizard_id)->first();
                    $title                      = AiBlogWizardTitle::where('ai_blog_wizard_id', $request->ai_blog_wizard_id)->first(); 
                    if(!is_null($title)){
                        $oldValues                  = json_decode($title->values) ?? [];  
                        $values                     = array_merge($oldValues, json_decode($outputContents));
                        $title->num_of_copies       += 1;
                        $title->values              = json_encode($values);
                    }else{
                        $title               = new AiBlogWizardTitle; 
                        $title->values       = $outputContents;
                        $title->created_by   = $user->id;
                        $title->ai_blog_wizard_id = $aiBlogWizard->id; 
                    } 
                } else{
                    $aiBlogWizard               = $this->__newBlogWizard($user);  
                    $title                      = new AiBlogWizardTitle; 
                    $title->values              = $outputContents;
                    $title->created_by          = $user->id;
                    $title->ai_blog_wizard_id   = $aiBlogWizard->id; 
                }
                
                $title->topic             = $request->topic;
                $title->keywords          = $request->keywords; 
                $title->total_words       += $tokens;
                $title->save();

                $aiBlogWizard->completed_step  = 2;
                $aiBlogWizard->total_words     += $title->total_words;
                $aiBlogWizard->save();
    
                # 8. update word limit for user
                $generateContentsController = new GenerateContentsController;
                $generateContentsController->updateUserWords($tokens, $user);
      
                $data = [
                    'status'                    => 200,
                    'success'                   => true, 
                    'ai_blog_wizard_id'         => $title->ai_blog_wizard_id ?? '',
                    'titles'                    => json_decode($title->values),
                    'output'                    => view('backend.pages.blogWizard.stepsData.titles', ['titles'=> json_decode($title->values)])->render(),
                    'usedPercentage'            => view('backend.pages.templates.inc.used-words-percentage')->render(),
                ];
                return $data;
            } else {
                if (isset($result['error']['message'])) {
                    $message = $result['error']['message'];
                } else {
                    $message = localize('There is an issue with the open ai account');
                }
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => $message
                ];
                return $data;
            }  
        }else{
            return $checkOpenAiInstance;
        }
    }

    # generate images
    public function generateImages(Request $request)
    { 
        if (env('DEMO_MODE') == "On") {
            $data = [
                'status'  => false,
                'success' => false,
                'message' => localize('Image generation is turned off in demo')
            ];
            return $data;
        }
        $user                = auth()->user();
        $checkOpenAiInstance = $this->openAiInstance();

        if($checkOpenAiInstance['status'] == true){ 
            # verify if user has access [available in subscription package]
            if ($user->user_type == "customer") {
                // check package balance
                $checkBalanceData = activePackageBalance('allow_images');
                if (!empty($checkBalanceData)) {
                    return $checkBalanceData;
                }

                // check images limit  
                if (availableDataCheck('images')  < (int)$request->num_of_results) {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('Your limit is low, please upgrade you plan'),
                    ];
                    return $data;
                }
            }

            # get image generator type
            $imageGenerateType = getSetting('generate_image_option') ?? 'dall_e_2';
            # service class
            $generateImageService = new GenerateImage();
            if($imageGenerateType == 'dall_e_2') {            
                $generateImage = $generateImageService->generateImageByOpenAi($request);
            }elseif($imageGenerateType == 'stable_diffusion'){
                $generateImage = $generateImageService->generateImageByOpenAiStableDiffusion($request->merge(
                    [
                        'type'=>'text-to-image',
                        "diffusion_samples" => "none",
                        "preset" => "NONE",
                        "negative_prompts" => null,
                        "titleImage" => null,
                        "titleUpscale" => null,
                    ]));
            }

           if(!empty($generateImage)) {
                if(!empty($generateImage['files'])) {
                    foreach($generateImage['files'] as $key=>$fileInfo) {
                       
                        $aiBlogWizardImage = new AiBlogWizardImage; 
                        $aiBlogWizardImage->storage_type        = getSetting('active_storage') ?? 'local';
                        $aiBlogWizardImage->created_by          = $user->id;
                        $aiBlogWizardImage->ai_blog_wizard_id   = $request->ai_blog_wizard_id; 
                        $aiBlogWizardImage->title               = $request->title . '-' . ($key + 1);
                        $aiBlogWizardImage->resolution          = $generateImage['resolution'];
                        $aiBlogWizardImage->value               = $fileInfo['file_path'];
                        $aiBlogWizardImage->save();
                    }
                }
                if($generateImage['success'] == true) {
                    try {
                        $aiBlogWizard                  = AiBlogWizard::whereId($request->ai_blog_wizard_id)->first();
                        $aiBlogWizard->completed_step  = 3; 
                        $aiBlogWizard->save();
                    } catch (\Throwable $th) {
                        //throw $th;
                    }
                    # Update credit balance
                    if ($user->user_type == "customer") {
                        updateDataBalance('images', $generateImage['n'], $user);
                    }
                    $imagesArray = AiBlogWizardImage::where('ai_blog_wizard_id', $request->ai_blog_wizard_id)->latest();
                    $imageIds = $imagesArray->pluck('id');
                    $images = $imagesArray->get();
    
                    $data = [
                        'status'            => 200,
                        'success'           => true,
                        'imageIds'           => $imageIds,
                        'images'            => view('backend.pages.blogWizard.stepsData.images', compact('images'))->render(),
                        'usedPercentage'    => view('backend.pages.templates.inc.used-images-percentage')->render(),
                    ];
                    return $data;
                }
                #return if fail
                return $generateImage;
           }
        }else{
            return $checkOpenAiInstance;
        } 
    } 
    
    # generate outlines
    public function generateOutlines(Request $request){
        $user                = auth()->user();
        $checkOpenAiInstance = $this->openAiInstance();

        if($checkOpenAiInstance['status'] == true){
            // generate here
            $prompt         = "Title: $request->title. Keywords: $request->keywords";

            // filter bad words  
            $parsePromptController = new ParsePromptsController;
            $foundBadWords = $parsePromptController->filterBadWords($request->all());  
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
            
            # ai prompt 
            $prompt = "Generate section headings only to write a blog in $request->lang language based on these title & keywords. Title: $request->title, Keywords: $request->keywords, each section headings must be an array element, give the output as an array."; 

            # apply openAi model based on admin configuration  
            $model =  getSetting('ai_blog_wizard_model') ?? 'gpt-3.5-turbo-16k'; 

            //  
            $num_of_results = (int) $request->num_of_results;
            $temperature    = 1; // high
            $aiParams = [
                'model' => $model,
                'temperature' => $temperature,
                'n' => $num_of_results, 
                'messages' => [
                    [
                        "role" => "user",
                        "content" => $prompt
                    ]
                ]
            ];   

            # make api call to openAi 
            $open_ai = $checkOpenAiInstance['open_ai']; 
            $aiParams['messages'] = [[
                "role" => "user",
                "content" => $prompt
            ]];
            $result = $open_ai->chat($aiParams);
            
            $result = json_decode($result, true);
            
            $outputContents = '';
            if (isset($result['choices'])) { 
                $aiBlogWizard               = AiBlogWizard::whereId($request->ai_blog_wizard_id)->first(); 
                 
                if (count($result['choices']) > 1) {
                    foreach ($result['choices'] as $value) {
                        $outputContents = $value['message']['content']; 
                        // new outline  
                        $this->__newOutline($user, $aiBlogWizard, $outputContents, $request->title, $request->keywords);
                    }
                } else {
                    $outputContents = $result['choices'][0]['message']['content']; 
                    // new outline  
                    $this->__newOutline($user, $aiBlogWizard, $outputContents, $request->title, $request->keywords);
                } 
 
                $tokens = $result['usage']['total_tokens']; 

                $aiBlogWizard->completed_step  = 4;
                $aiBlogWizard->total_words     += $tokens;
                $aiBlogWizard->save();
    
                # 8. update word limit for user
                $generateContentsController = new GenerateContentsController;
                $generateContentsController->updateUserWords($tokens, $user);

                $outlines = AiBlogWizardOutline::where('ai_blog_wizard_id', $aiBlogWizard->id)->latest()->get();
      
                $data = [
                    'status'                    => 200,
                    'success'                   => true, 
                    'ai_blog_wizard_id'         => $request->ai_blog_wizard_id ?? '',
                    'outlines'                  => $outlines,
                    'output'                    => view('backend.pages.blogWizard.stepsData.outlines', ['outlines'=> $outlines])->render(),
                    'usedPercentage'            => view('backend.pages.templates.inc.used-words-percentage')->render(),
                ];
                return $data;
            } else {
                if (isset($result['error']['message'])) {
                    $message = $result['error']['message'];
                } else {
                    $message = localize('There is an issue with the open ai account');
                }
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => $message
                ];
                return $data;
            }  
        }else{
            return $checkOpenAiInstance;
        }
    }

    # new blog outline
    private function __newOutline($user, $aiBlogWizard, $outputContents, $title, $keywords){
        $outline                    = new AiBlogWizardOutline; 
        $outline->values            = $outputContents;
        $outline->created_by        = $user->id;
        $outline->ai_blog_wizard_id = $aiBlogWizard->id;  
        $outline->title             = $title;
        $outline->keywords          = $keywords;
        $outlineWords               = str_word_count(collect(json_decode($outputContents))->implode(' '));  
        $outline->total_words       = $outlineWords;
        $outline->save();
    }

    # populate keywords data
    public function populateKeywordsData(Request $request)
    { 
        $data = $request->generatedKeywords ?? [];
        return [
            'html'  => view('backend.pages.blogWizard.stepsData.keywords', ['keywords' => $data])->render()
        ];
    }

    # populate titles data
    public function populateTitlesData(Request $request)
    { 
        $data = $request->generatedTitles ?? [];
        return [
            'html'  => view('backend.pages.blogWizard.stepsData.titles', ['titles' => $data])->render()
        ];
    }

    # populate images data
    public function populateImagesData(Request $request)
    { 
        $data = $request->generatedImages ?? []; 
        $images = AiBlogWizardImage::whereIn('id', $data)->get();
        return [ 
            'html'  => view('backend.pages.blogWizard.stepsData.images', compact('images'))->render()
        ];
    } 
 
    # populate outlines data
    public function populateOutlinesData(Request $request)
    { 
        $data = $request->generatedOutlines ?? [];  
        return [ 
            'html'  => view('backend.pages.blogWizard.stepsData.outlines', ['outlines' => $data== null ? [] : $data])->render()
        ];
    } 
 
    # populate article data
    public function populateArticleData(Request $request)
    { 
        $data = $request->generatedArticle ?? null;
        $article = AiBlogWizardArticle::where('id', $data)->first();
        return [
            'html'  => view('backend.pages.blogWizard.stepsData.article', ['article' => $article])->render(),
            'id'    => $article->id ?? null,
            'contents' => $article->value ?? ""
        ];
    }
}
