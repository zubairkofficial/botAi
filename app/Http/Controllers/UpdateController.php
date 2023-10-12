<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Backend\Templates\TemplatesController;
use App\Models\AiChatCategory;
use Carbon\Carbon;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\SystemSetting;
use DB;
use ZipArchive;
use App\Traits\UploadTheme;

class UpdateController extends Controller
{
    use UploadTheme;
    # init update 
    public function init()
    {
        return view('update.init');
    }

    # update complete
    public function complete()
    {
        # add new data as required
        $this->__dbMigration();

        if(!empty(env('RECAPTCHA_SITE_KEY'))){ 
            writeToEnvFile('RECAPTCHAV3_SITEKEY', env('RECAPTCHA_SITE_KEY')); 
        }

        if(!empty(env('RECAPTCHA_SECRET_KEY'))){ 
            writeToEnvFile('RECAPTCHAV3_SECRET', env('RECAPTCHA_SECRET_KEY')); 
        } 

        # latest version
        writeToEnvFile('APP_VERSION', 'v2.9.0');

        cacheClear();
        $oldRouteServiceProvider        = base_path('app/Providers/RouteServiceProvider.php');
        $setupRouteServiceProvider      = base_path('app/Providers/SetupServiceComplete.php');
        copy($setupRouteServiceProvider, $oldRouteServiceProvider);
        return view('update.complete');
    }

    # db migration
    private function __dbMigration()
    {
        try {
            # artisan cmd
            Artisan::call('migrate');
        } catch (\Throwable $th) {
            //throw $th;
        }

        try {
            # seeders
            Artisan::call('db:seed --class=PermissionsTableSeeder');
            Artisan::call('db:seed --class=OpenAiModelTableSeeder');

            if (AiChatCategory::withTrashed()->count() < 1) {
                Artisan::call('db:seed --class=AiChatCategoryTableSeeder');
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        try {
            # import templates
            $templatesController = new TemplatesController();
            $templatesController->store();
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
    #about system update
    public function about()
    {
 
        return view('backend.pages.systemSettings.system_update');
    }

    public function versionUpdateInstall(Request $request){
       if (env('DEMO_MODE') == "On") {
            flash('Restricted in demo mode')->warning();
            return back();
        }
        ini_set('memory_limit', '-1');

        try {

            $request->validate([
                'updateFile' => ['required', 'mimes:zip'],
            ]);

            if ($request->hasFile('updateFile')) {
                // $path = $request->updateFile->store('updateFile');
                 //Move Uploaded File  

                $zip_file = $request->file('updateFile');
                $basePath = base_path('/storage/app/public/temp_update/');
                if(!file_exists($basePath)) {
                    mkdir($basePath, 0777);
                }
                $res = $zip_file->move($basePath, $zip_file->getClientOriginalName());
                
                $zip = new ZipArchive;
                $res = $zip->open($basePath . $zip_file->getClientOriginalName());
             
                if ($res === true) {
                    $zip->extractTo($basePath);
                    $zip->close();
                } else {
                    abort(500, 'Error! Could not open File');
                }
            
                $str = @file_get_contents($basePath . '/config.json', true);
                if ($str === false) {
                    abort(500, 'The update file is corrupt.');
                }

                $json = json_decode($str, true);

                if (!empty($json)) {
                    if (empty($json['version']) || empty($json['release_date'])) {
                        flash('Config File Missing')->error();
                        return redirect()->back();
                    }
                } else {
                    flash('Config File Missing')->error();
                    return redirect()->back();
                }
                $software_version = systemSetting('software_version');

                $current_version = Storage::exists('.version') && Storage::get('.version') ? rtrim(Storage::get('.version'), '\n') : $software_version;

                // if ($current_version < $json['min']) {
                //     flash($json['min'] . ' or greater is  required for this version')->error();
                //     return redirect()->back();
                // }

                $src = storage_path('app/public/temp_update');
                $dst = base_path('/');

                $this->recurse_copy($src, $dst);

                if (isset($json['migrations']) & !empty($json['migrations'])) {
                    foreach ($json['migrations'] as $migration) {

                        Artisan::call('migrate',
                            array(
                                '--path' => $migration,
                                '--force' => true));
                    }
                }
                SystemSetting::updateOrCreate([
                    'entity'=>'software_version'
                ], [
                    'value'=> $json['version']]
                );

                SystemSetting::updateOrCreate([
                    'entity'=>'last_update'
                ], [
                    'value'=> Carbon::now()]
                );

            }


            if (storage_path('app/public/temp_update')) {
                $this->delete_directory(storage_path('app/public/temp_update'));
            }
            if (storage_path('app/public/temp_update')) {
                $this->delete_directory(storage_path('app/public/temp_update'));
            }

            Artisan::call('cache:clear');
            Artisan::call('view:clear');
            Artisan::call('config:clear');
            Artisan::call('optimize:clear');

            flash("Your system successfully updated")->success();
            return redirect()->route('update.init');
        } catch (\Exception $e) {
        
            if (storage_path('app/public/temp_update')) {
                $this->delete_directory(storage_path('app/public/temp_update'));
            }
            if (storage_path('app/tempUpdate')) {
                $this->delete_directory(storage_path('app/public/temp_update'));
            }

            flash($e->getMessage())->error();
            return redirect()->back();
        }
    }
    public function recurse_copy($src, $dst)
    {

        try {
            $dir = opendir($src);
            @mkdir($dst);
            while (false !== ($file = readdir($dir))) {
                if (($file != '.') && ($file != '..')) {
                    if (is_dir($src . '/' . $file)) {
                        $this->recurse_copy($src . '/' . $file, $dst . '/' . $file);
                    } else {
                        copy($src . '/' . $file, $dst . '/' . $file);
                    }
                }
            }
            closedir($dir);
        } catch (\Exception $e) {
            flash('Operation Failed')->error();
            return redirect()->back();
        }
    }
}
