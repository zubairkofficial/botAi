<?php

namespace App\Http\Controllers\Backend\AI;

use Carbon\Carbon;
use App\Traits\Language;
use Illuminate\Support\Str;
use App\Models\TextToSpeech;
use Illuminate\Http\Request;
use App\Traits\GenerateVoice;
use App\Models\GoogleTTSSettings;
use App\Models\SubscriptionHistory;
use App\Models\SubscriptionPackage;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class GenerateT2SController extends Controller
{
    use Language;
    use GenerateVoice;

    public function __construct()
    {
        if (getSetting('enable_text_to_speech') == '0') {
            redirect()->route('writebot.dashboard')->send();
        }
    }

    # t2s
    public function index()
    {
        // $data = json_encode($this->languageVoicesData());

        $user = auth()->user();
        if ($user->user_type == "customer") {
            $package = optional(activePackageHistory())->subscriptionPackage ?? new SubscriptionPackage;
            if ($package->allow_text_to_speech == 0) {
                abort(403);
            }
        } else {
            if (!auth()->user()->can('speech_to_text')) {
                abort(403);
            }
        }
        $data = $this->loadData();


        return view('backend.pages.templates.generate-t2s', $data);
    }

    # generate t2s
    public function generate(Request $request)
    {
        $user = auth()->user();
        $speeches = json_decode($request->speeches, true);

        $data['empty'] = '';
        $data += $this->loadData();

        if (env('DEMO_MODE') == 'On') {
            $response = [
                'status'    => false,
                'message'   => localize('In demo mode, this feature is disabled'),
                'view'      => view('backend.pages.templates.inc.voice-list', $data)->render()
            ];
            return response()->json(compact('response'));
        }
        // check enable voice over
        if (voiceOverEnable() == false) {
            $response = [
                'status'    => false,
                'message'   => localize('Please Enable Voice Over from Voice Settings'),
                'view'      => view('backend.pages.templates.inc.voice-list', $data)->render()
            ];
            return response()->json(compact('response'));
        }

        # 2. verify if user has access to the template [template available in subscription package]
        if ($user->user_type == "customer") {
            $data = activePackageBalance('allow_text_to_speech');
            if (!empty($data)) {

                $response = [
                    'status'    => $data['status'],
                    'message'   => $data['message'],
                    'view'      => view('backend.pages.templates.inc.voice-list', $data)->render()
                ];
                return response()->json(compact('response'));
            }
            // check word limit  
            if (availableDataCheck('words') <= 0) {
                $response = [
                    'status'    => false,
                    'message'   => localize('Your word balance is low, please upgrade you plan'),
                    'view'      => view('backend.pages.templates.inc.voice-list', $data)->render()
                ];
                return response()->json(compact('response'));
            }
        }
        
        $formData = $this->formatParams($request);
        TextToSpeech::create($formData);
        $newData =  $this->loadData();
        $response = [
            'status'    => true,
            'message'   => localize('Speech generate Successfully'),
            'view'      => view('backend.pages.templates.inc.voice-list', $newData)->render()
        ];
        return response()->json(compact('response'));
    }

    public function edit($id)
    {
        // 
    }
    // update
    public function update(Request $request)
    {
        $model = TextToSpeech::findOrFail($request->id);
        $formData = $this->formatParams($request, $request->id);
        $model->update($formData);
    }
    // format data 
    private function formatParams($request, $model_id = null): array
    {
        $user = auth()->user();
        $speeches = json_decode($request->speeches, true);
        // generate voice for enable voice over
        if (getSetting('default_voiceover') == 'google') {
            $voiceData = $this->googleVoiceGenerate($voice = $request->voice, $lang = $request->lang, $pace = $request->speed, $break = $request->b_reak, $speeches);
        } elseif (getSetting('default_voiceover') == 'azure') {
            $voiceData = $this->azureVoiceGenerate($voice = $request->voice, $lang = $request->lang, $pace = $request->speed, $break = $request->b_reak, $format = 'mp3', $speeches);
        }
        
        $params = [
            'title'     => $request->title,
            'language'     => $request->lang,
            'voice'     => $request->voice,
            'speed'      => $request->speed,
            'break'      => $request->b_reak,
            'slug'      => Str::random(20) . Str::slug($request->title),
            'text'      => $request->speeches,
            'response'  => json_encode($voiceData['langsAndVoices']),
            'speech'    => $voiceData['audioName'],
            'file_path' => $voiceData['file_path'],
            'credits'   => $voiceData['wordCount'],
            'words'     => $voiceData['wordCount'],
            'storage_type'     => $voiceData['storage_type'],
            'type'      => getSetting('default_voiceover')
        ];

        $this->updateUserT2S($voiceData['wordCount'], auth()->user());

        if ($model_id) {
            $params['updated_by'] = $user->id;
        } else {
            $params['created_by'] = $user->id;
            $params['hash'] = Str::random(256);
        }
        return $params;
    }
    // load data
    private function loadData(): array
    {
        $data = [];
        $data['voiceLists'] = TextToSpeech::latest()->where('created_by', auth()->user()->id)->paginate(paginationNumber());
        $data['languages'] = $this->languageList();

        $data['languages_voices'] = $this->languageVoicesData();

        $data['status'] = voiceOverEnable();
        return $data;
    }
    // delete text to speech
    public function delete($id)
    {

        $textToVoice = TextToSpeech::findOrFail($id);
   
        $exit_file_path = base_path('public/' . $textToVoice->file_path);
        if (file_exists($exit_file_path)) {
            unlink($exit_file_path);
        }
        if($textToVoice->storage_type == 'aws') {
            Storage::disk('s3')->delete($textToVoice->speech);
        }
        $textToVoice->delete();

        flash(localize('Generate Voice has been deleted successfully'))->success();
        return redirect()->route('t2s.index');
    }

    # updateUserT2S - take token as word
    public function updateUserT2S($tokens, $user)
    {
        if ($user->user_type == "customer") {
            updateDataBalance('words', $tokens, $user);
        }
    }
}
