<?php

namespace App\Http\Controllers\Backend\AI;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\TextToSpeechSetting;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\TTSRequestForm;
use App\Models\SystemSetting;
use Illuminate\Support\Facades\Storage;

class VoiceSettingController extends Controller
{
    //index 
    public function index()
    {
        $allVoiceSettings = TextToSpeechSetting::where('is_active', 1)->get();
        $gtsSetting = TextToSpeechSetting::where('type', 'google')->first();
        $azureSetting = TextToSpeechSetting::where('type', 'azure')->first();

        return view('backend.pages.voiceOverSetting.index', compact('gtsSetting', 'azureSetting', 'allVoiceSettings'));
    }

    // update or create voice setting
    public function update(TTSRequestForm $request)
    {
        $type = $request->type;
        $file = $request->file;
        $path = 'public/uploads/tts/';
        $countVoiceSetting = TextToSpeechSetting::all()->count();
        $voiceSetting = TextToSpeechSetting::where('type', $type)->first();
        if ($file && $voiceSetting) {
            $exit_file_path = base_path('storage/' . $voiceSetting->file_name);
            if (file_exists($exit_file_path)) {
                unlink($exit_file_path);
            }
        }
        if (!$voiceSetting) {
            $voiceSetting = new TextToSpeechSetting();
        }
        if ($type == 'google' && $file) {
            $voiceSetting->file_name = $file->getClientOriginalName();
            $voiceSetting->path = fileUpload($path, $file, true);
        }
        if ($request->filled('project_name')) {
            $voiceSetting->project_name = $request->project_name;
        }
        if ($type == 'azure') {
            $voiceSetting->key = $request->azure_key;
            $voiceSetting->region = $request->azure_region;
        }
        $voiceSetting->type = $request->type;
        $voiceSetting->maximum_character = $request->maximum_character;
        $voiceSetting->created_by = auth()->user()->id;
        $voiceSetting->save();

        // move file for google
        if ($type == 'google' && $file) {
            File::move(public_path('uploads/tts/' . $voiceSetting->file_name), base_path('storage/' . $voiceSetting->file_name));
        }

        if ($type == 'google') {
            $message = localize('Google TTS Configuration successfully');
        } elseif ($type == 'azure') {
            $message = localize('Azure Configuration successfully');
        } else {
            $message = localize('Operation successfully');
        }
        // enable default voice over at first if not have any data
        if ($countVoiceSetting == 0) {
            $this->activeVoiceSettings($request->type);
        }

        flash($message)->success();
        return back();
    }

    // default voice over request
    public function defaultVoiceOver(Request $request)
    {
        if (env('DEMO_MODE') == "On") {
            return [
                'status' => 'success',
                'message' => localize('This is turned off in demo')
            ];
        }
        if (!$request->method) {
            $exitDefaultVoiceover = SystemSetting::where('entity', 'default_voiceover')->first();
            if ($exitDefaultVoiceover) {
                $exitDefaultVoiceover->delete();
                $status = 'success';
                $message = localize('Disable Voice over Method successfully');
                cacheClear();
            } else {
                $status = 'warning';
                $message = localize('No Enable Voice Method Found');
            }

            return [
                'status' => $status,
                'message' => $message
            ];
        }
        $this->activeVoiceSettings($request->method);

        return [
            'status' => 'success',
            'message' => localize('Enable Voice over Method successfully')
        ];
    }

    //enable voice over system settings
    private function activeVoiceSettings($method)
    {
        SystemSetting::updateOrCreate(
            [
                'entity' => 'default_voiceover'
            ],

            ['value' => $method]
        );
        cacheClear();
    }
}
