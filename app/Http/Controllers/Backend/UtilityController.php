<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UtilityController extends Controller
{
    public function index()
    {
        return view('backend.pages.systemSettings.utilities');
    }
    #clear cache
    public function clearCache()
    {
        cacheClear();
        flash(localize("Your System Optimization Successfully Complete"))->success();
        return redirect()->back();
    }
    #clear log
    public function clearLog()
    {
        file_put_contents(storage_path('logs/laravel.log'),'');
        $message = "Your System Log File Is Cleared";
        flash(localize($message))->success();
        return redirect()->back();
    }
    #enable/disable app debug
    public function debug()
    {
        
        if(env('APP_DEBUG')) {
            $message = 'Debug Mode Disable Successfully';
            self::writeToEnvFile([
                // 'APP_ENV' => 'Production',
                'APP_DEBUG'     => 'false',
            ]);
        }else{
            $message = 'Debug Mode Disable Successfully';
            self::writeToEnvFile([
                // 'APP_ENV' => 'Production',
                'APP_DEBUG'     => 'true',
            ]);
        }
       
       
        flash(localize($message))->success();
        return redirect()->back();
    }
    # overwrite env file
    private static function writeToEnvFile($data)
    {

        foreach ($data as $key => $value) {
            if (env($key) === $value) {
                unset($data[$key]);
            }
        }

        if (!count($data)) {
            return false;
        }


        $env = file_get_contents(base_path() . '/.env');
        $env = explode("\n", $env);
        foreach ((array) $data as $key => $value) {
            foreach ($env as $env_key => $env_value) {
                $entry = explode("=", $env_value, 2);
                if ($entry[0] === $key) {
                    $env[$env_key] = $key . "=" . (is_string($value) ? '"' . $value . '"' : $value);
                } else {
                    $env[$env_key] = $env_value;
                }
            }
        }
        $env = implode("\n", $env);
        file_put_contents(base_path() . '/.env', $env);

    }
}
