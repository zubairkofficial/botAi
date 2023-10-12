<?php

namespace App\Http\Controllers\Backend\AI;

use App\Http\Controllers\Controller;
use App\Mail\EmailManager;
use App\Models\AiChat;
use App\Models\AiChatCategory;
use App\Models\AiChatMessage;
use App\Models\AiChatPrompt;
use App\Models\AiChatPromptGroup;
use App\Models\SubscriptionPackage;
use App\Notifications\EmailChatMessages;
use Illuminate\Http\Request;
use Orhanerday\OpenAi\OpenAi;
use Mail;
use Str;

class AiChatController extends Controller
{
    public function __construct()
    {
        if (getSetting('enable_ai_chat') == '0') {
            flash(localize('AI chat is not available'))->info();
            redirect()->route('writebot.dashboard')->send();
        }
    }

    # chat index
    public function index(Request $request)
    {
        $searchKey = null;
        $user = auth()->user();
        if ($user->user_type == "customer") {
            $package = optional(activePackageHistory())->subscriptionPackage ?? new SubscriptionPackage;
            if ($package->allow_ai_chat == 0) {
                abort(403);
            }
        } else {
            if (!auth()->user()->can('ai_chat')) {
                abort(403);
            }
        }

        $chatExpertIds = [];
        if ($user->user_type != "customer") {
            $chatExpertIds = AiChatCategory::oldest()->pluck('id');
            $chatExperts = AiChatCategory::oldest()->get();
        } else {
            $chatExpertIds = AiChatCategory::oldest()->where('is_active', 1)->pluck('id');
            $chatExperts = AiChatCategory::oldest()->where('is_active', 1)->get();
        }

        $chatListQuery = AiChat::orderBy('updated_at', 'DESC')->where('user_id', $user->id)->whereIn('ai_chat_category_id', $chatExpertIds);

        if ($request->search != null) {
            $chatListQuery = $chatListQuery->where('title', 'like', '%' . $request->search . '%');
            $searchKey = $request->search;
        }

        if ($request->expert != null) {
            $chatList     = $chatListQuery->where('ai_chat_category_id', $request->expert)->get();
        } else {
            $chatList     = $chatListQuery->where('ai_chat_category_id', 1)->get();
        }

        
        $promptGroups       = AiChatPromptGroup::oldest(); 
        $promptGroups       = $promptGroups->get();  
        $prompts            = AiChatPrompt::latest()->get();

        $conversation = $chatListQuery->first();
        return view('backend.pages.aiChat.index', compact('chatExperts', 'chatList', 'conversation', 'searchKey','promptGroups', 'prompts'));
    }

    # new conversation
    public function store(Request $request)
    {
        $user = auth()->user();
        if ($user->user_type == "customer") {
            $package = optional(activePackageHistory())->subscriptionPackage ?? new SubscriptionPackage;
            if ($package->allow_ai_chat == 0) {
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => localize('AI Chat is not available in this package, please upgrade you plan'),
                ];
                return $data;
            }
        }
        $expert = AiChatCategory::whereId((int)$request->ai_chat_category_id)->first();

        $conversation                      = new AiChat;
        $conversation->user_id             = $user->id;
        $conversation->ai_chat_category_id = $request->ai_chat_category_id;
        $conversation->title               = $expert->name . localize(' Chat');
        $conversation->save();

        $message = new AiChatMessage;
        $message->ai_chat_id = $conversation->id;
        $message->user_id    = $user->id;
        if ($expert->role == 'default') {
            $result =  localize("Hello! I am $expert->name, and I'm here to answer your all questions.");
        } else {
            $result =  localize("Hello! I am $expert->name, and I'm $expert->role. $expert->assists_with.");
        }
        $message->response   = $result;
        $message->result   = $result;
        $message->save();

        $chatList = AiChat::latest();
        $chatList = $chatList->where('ai_chat_category_id', $expert->id)->where('user_id', $user->id)->get();
 
        $promptGroups       = AiChatPromptGroup::oldest(); 
        $promptGroups       = $promptGroups->get();  
        $prompts            = AiChatPrompt::latest()->get();

        $data = [
            'status'                 => 200,
            'chatList'               => view('backend.pages.aiChat.inc.chat-list', compact('chatList'))->render(),
            'messagesContainer'      => view('backend.pages.aiChat.inc.messages-container', compact('conversation','promptGroups', 'prompts'))->render(),
        ];
        return $data;
    }

    # update conversation
    public function update(Request $request)
    {
        $conversation = AiChat::whereId((int) $request->chatId)->first();
        $conversation->title = $request->value;
        $conversation->save();
    }

    # delete conversation
    public function delete($id)
    {
        $conversation = AiChat::findOrFail((int)$id);
        AiChatMessage::where('ai_chat_id', $conversation->id)->delete();
        $conversation->delete();
        flash(localize('Chat has been deleted successfully'))->success();
        return back();
    }

    # new message
    public function newMessage(Request $request)
    {
        $chat = AiChat::where('id', $request->chat_id)->first();
        $category = AiChatCategory::where('id', $request->category_id)->first();

        $user = auth()->user();

        // check word limit  
        if ($user->user_type == 'customer' && availableDataCheck('words') <= 0) {
            $data = [
                'status'  => 400,
                'success' => false,
                'message' => localize('Your word balance is low, please upgrade you plan'),
            ];
            return $data;
        }


        $prompt = $request->prompt;
        $total_used_tokens = 0;

        $message                = new AiChatMessage;
        $message->ai_chat_id    = $chat->id;
        $message->user_id       = $user->id;
        $message->prompt        = $prompt;
        $message->result        = $prompt;
        $message->save();

        $message->aiChat->touch(); // updated at

        $chat_id = $chat->id;
        $message_id = $message->id;

        $request->session()->put('chat_id', $chat_id);
        $request->session()->put('message_id', $message_id);

        $data = [
            'status'  => 200,
            'success' => false,
            'message' => '',
        ];
        return $data;
    }

    # ai response
    public function process()
    {
        $chat_id    = session('chat_id');
        $message_id = session('message_id');

        $message    = AiChatMessage::whereId((int)$message_id)->first();

        $chat                   = AiChat::whereId((int) $chat_id)->first();
        $lastThreeMessageQuery    = $chat->messages()->where('prompt', null)->latest()->take(4);
        $lastThreeMessage         = $lastThreeMessageQuery->get()->reverse();

        
        $expert = $chat->category;
        $expert->chat_training_data = str_replace(array("\r", "\n"), '', $expert->chat_training_data ) ?? null;

        
        $prompt    = '';
        $newPrompt = [];  
        
        if($expert->chat_training_data !=null){ 
            $trainedData = json_decode(json_decode($expert->chat_training_data));  
            foreach ($trainedData as $data) { 
                $msg = [
                    "role"      => $data->role,
                    "content"   => $data->content,
                ];
                $history[] = $msg; 
            }
            $prompt = "You will now play a character and respond as that character (You will never break character). Your name is $expert->short_name. I want you to act as a $expert->role. As a $expert->role please answer this, $message->prompt. Do not include your name, role in your answer.";
        }else{  
            $prompt    = $message->prompt;
            $history[] = ["role" => "system", "content" => "You are a helpful assistant."];
        }

        if (count($lastThreeMessage) > 1) {
            foreach ($lastThreeMessage as $key => $threeMessage) {
               if($key!=0){
                if ($threeMessage->prompt != null) {
                    $history[] = ["role" => "user", "content" => $threeMessage->prompt];
                } else {
                    $history[] = ["role" => "assistant", "content" => $threeMessage->response];
                }
               }else{
                $newPrompt = ["role" => "user", "content" => $prompt];
               }
            }
        } else {  
            $newPrompt = ["role" => "user", "content" => $prompt];
        } 

        $history[] = $newPrompt; 
    
        $model =  getSetting('ai_chat_model') ?? 'gpt-3.5-turbo';
        
        # 1. init openAi
        $open_ai = new OpenAi(openAiKey());
        $user = auth()->user();  
        $opts = [
            'model' => $model,
            'messages' => $history,
            'temperature' => 1.0,
            'presence_penalty' => 0.6,
            'frequency_penalty' => 0,
            'stream' => true
        ];
        $random_number = rand(1,100000000);
        session()->put('random_number', $random_number);
        return response()->stream(function () use ($history, $chat_id, $model, $open_ai, $user, $opts, $random_number){     

            
            $text = "";
            $output = "";
            $open_ai->chat($opts, function ($curl_info, $data) use (&$text, $chat_id, $user, $random_number) {
               
             
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
                        $words = count(explode(' ', ($text))); // todo:: add user input counter
           
                        $output     = str_replace(["\r\n", "\r", "\n"], "<br>", $text); 
                     
                        $message = AiChatMessage::updateorCreate([
                            'random_number'=>$random_number
                        ],[
                            'ai_chat_id'=>$chat_id,
                            'user_id'=>$user->id,
                            'response'=>$text,
                            'result'=>$output,
                            'words'=>$words,
                        ]);
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


            # Update credit balance
            $words = count(explode(' ', ($text))); // todo:: add user input counter
            $this->updateUserWords($words, $user);

            $output     = str_replace(["\r\n", "\r", "\n"], "<br>", $text); 
         
            $message = AiChatMessage::updateorCreate([
                'random_number'=>$random_number
            ],[
                'ai_chat_id'=>$chat_id,
                'user_id'=>$user->id,
                'response'=>$text,
                'result'=>$output,
                'words'=>$words,
            ]);
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
    # updateBalanceStopGeneration
    public function updateBalanceStopGeneration(Request $request)
    {
      
        $random_number = session()->get('random_number');
        
        $user = auth()->user();
        if($random_number && $user->user_type == "customer") {
            $aiChatmessage = AiChatMessage::where('random_number', $random_number)->where('user_id', $user->id)->first();          
            if($aiChatmessage){
                $words = $aiChatmessage->words;
                $this->updateUserWords($words, $user);
                session()->forget('random_number');
                return response()->json(['success'=>true]);
            }
        }
        
        return response()->json(['success'=>false]);
    }
    # get messages
    public function getMessages(Request $request)
    {
        $conversation = AiChat::whereId((int) $request->chatId)->first();
        if (is_null($conversation)) {
            $data = [
                'status'                 => 400
            ];
            return $data;
        }

        
        $promptGroups       = AiChatPromptGroup::oldest(); 
        $promptGroups       = $promptGroups->get();  
        $prompts            = AiChatPrompt::latest()->get();

        $data = [
            'status'                 => 200,
            'messagesContainer'      => view('backend.pages.aiChat.inc.messages-container', compact('conversation', 'promptGroups', 'prompts'))->render(),
        ];
        return $data;
    }

    # get conversations
    public function getConversations(Request $request)
    {
        $conversationsQuery = AiChat::where('ai_chat_category_id', (int) $request->ai_chat_category_id)->where('user_id', auth()->user()->id)->latest('updated_at');

        $chatList = $conversationsQuery->get();
        $conversation = $conversationsQuery->first();

        
        $promptGroups       = AiChatPromptGroup::oldest(); 
        $promptGroups       = $promptGroups->get();  
        $prompts            = AiChatPrompt::latest()->get();

        $data = [
            'status'                 => 200,
            'chatRight'      => view('backend.pages.aiChat.inc.chat-right', compact('conversation', 'chatList', 'conversation', 'promptGroups', 'prompts'))->render(),
        ];
        return $data;
    }

    # SEND IN EMAIL
    public function sendInEmail(Request $request)
    {
        if ($request->email == null) {
            flash(localize('Please type an email'))->error();
            return back();
        }

        $conversation = AiChat::findOrFail((int) $request->conversation_id);
        if (is_null($conversation)) {
            flash(localize('Chat not found'))->error();
            return back();
        }

        try {
            $array['view'] = 'emails.chat';
            $array['from'] = env('MAIL_FROM_ADDRESS');
            $array['subject'] = $conversation->title;
            $array['conversation'] = $conversation;
            $array['messages'] = $conversation->messages;

            Mail::to($request->email)->queue(new EmailManager($array));
            flash(localize('Chat successfully sent to email'))->success();
        } catch (\Throwable $th) {
            flash(localize('Something went wrong'))->error();
        }
        return back();
    }
}
