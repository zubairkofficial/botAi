<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use ZipArchive;
use App\Traits\UploadTheme;
use App\Models\SystemSetting;
use Carbon\Carbon;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Backend\Templates\TemplatesController;
use App\Models\AiChatCategory;

class SystemUpdateController extends Controller
{
    use UploadTheme;
    public function index()
    {
        if(auth()->user()->user_type != 'admin') {
            abort(403);
        }
        ini_set('memory_limit', '-1');
        
        try {
            $name = 'VersionUpdate.zip';     
            $currentVersion = currentVersion();
            $latestVersion  = latestVersion(true);
            if($currentVersion ==  $latestVersion) {
                flash('You are already using latest version. Thanks!!')->warning();
                return redirect()->back();
            }
            $versionList = versionList();
            foreach($versionList as $version) {
                if($currentVersion < $version) {
                    $updateFile = 'https://themetags.net/versionFile/'.$version.'/update_v'.$version;
                    $basePath   = base_path('/storage/app/public/temp_update/');   
       
                   if(!file_exists($basePath)) {
                       mkdir($basePath, 0777);
                   }
                   // download file and put into directory
                   file_put_contents( $basePath. $name, fopen($updateFile, 'r'));
           
                   $zip = new ZipArchive;
                   $res = $zip->open($basePath . $name);
                 
                   if ($res === true) {
                       $zip->extractTo($basePath);
                       $zip->close();
                   } else {
                       abort(500, 'Error! Could not open File');
                   
                   }
           
                   $src = storage_path('app/public/temp_update');
                   $dst = base_path('/');           
                   $this->recurse_copy($src, $dst);   
                }
            }

            if (storage_path('app/public/temp_update')) {
                $this->delete_directory(storage_path('app/public/temp_update'));
            }
            if (storage_path('app/public/temp_update')) {
                $this->delete_directory(storage_path('app/public/temp_update'));
            }
            $this->__dbMigration();
            SystemSetting::updateOrCreate([
                'entity'=>'software_version'
            ], [
                'value'=> latestVersion(true)]
            );

           

            SystemSetting::updateOrCreate([
                'entity'=>'last_update'
            ], [
                'value'=> Carbon::now()]
            );

            Artisan::call('cache:clear');
            Artisan::call('view:clear');
            Artisan::call('config:clear');
            Artisan::call('optimize:clear');
            
            flash("Your system successfully updated")->success();
            return redirect()->back();

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
}
