<?php

namespace App\Http\Controllers;

use App\Services\AzureT2S;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class AzureT2SController extends Controller
{
    private $api;
    private $merge_files;
    private $user;

    public function __construct()
    {
    }


    /**
     * Display a listing of the resource. 
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
    }


    /**
     * Process text synthesize request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function synthesize(Request $request)
    {
        $input = json_decode(request('input_text'), true);

        // if ($request->ajax()) {

        // request()->validate([
        //     'title' => 'nullable|string|max:255',
        // ]);

        # Check if user has access to ai chat feature



        # Count characters based on vendor requirements
        $total_characters = mb_strlen(request('input_text_total'), 'UTF-8');

        # Protection from over usage of credits



        # Check if user has enough characters to proceed



        # Variables for recording
        $total_text = '';
        $total_text_raw = '';
        $total_text_characters = 0;
        $inputAudioFiles = [];
        $plan_type = null;

        # Audio Format
        if (request('format') == 'mp3') {
            $audio_type = 'audio/mpeg';
        } elseif (request('format') == 'wav') {
            $audio_type = 'audio/wav';
        } elseif (request('format') == 'ogg') {
            $audio_type = 'audio/ogg';
        } elseif (request('format') == 'webm') {
            $audio_type = 'audio/webm';
        }

        # Process each textarea row
        // foreach ($input as $key => $value) {



        # Count characters based on vendor requirements


        # Check if user has characters available to proceed



        # Name and extention of the result audio file
        $temp_file_name = Str::random(10) . '.mp3';
        // if (request('format') === 'mp3') {
        //     $temp_file_name = Str::random(10) . '.mp3';
        // } elseif (request('format') === 'ogg') {
        //     $temp_file_name = Str::random(10) . '.ogg';
        // } elseif (request('format') === 'webm') {
        //     $temp_file_name = Str::random(10) . '.webm';
        // } elseif (request('format') === 'wav') {
        //     $temp_file_name = Str::random(10) . '.wav';
        // } else {
        //     return response()->json(["error" => __("Unsupported audio file extension was selected")], 422);
        // }

        $azure = new AzureT2S;
        $azure->synthesizeSpeech($voice = null, 'Hello are you here', 'mp3', $temp_file_name);
        // $response = $this->processText();
        // dd($response);
        // }

        # Process multi voice merge process

        // }
    }


    /**
     * Process text synthesizes based on the vendor/voice selected
     */
    private function processText($voice, $text, $format, $file_name)
    {
        $azure = new AzureT2S;
        $azure->synthesizeSpeech($voice, $text, $format, $file_name);
    }
}
