<?php

use App\Models\User;
use App\Models\OpenAiKey;
use App\Models\Localization;
use App\Models\MediaManager;
use App\Models\SystemSetting;
use App\Models\SubscriptionHistory;
use App\Models\TextToSpeechSetting;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Config;
use App\Models\GeneralSetupLocalization;
use App\Models\StorageManager;
use App\Models\SubscriptionLog;
use App\Models\SubscriptionPackage;
use App\Models\WrNotification;
use Lunaweb\RecaptchaV3\Facades\RecaptchaV3;

if (!function_exists('getTheme')) {
    # get system theme
    function getTheme()
    {
        if (session('theme') != null && session('theme') != '') {
            return session('theme');
        }
        return Config::get('app.theme');
    }
}

if (!function_exists('getView')) {
    # get view of theme
    function getView($path, $data = [])
    {
        return view('frontend.' . getTheme() . '.' . $path, $data);
    }
}

if (!function_exists('getViewRender')) {
    # get view of theme with render
    function getViewRender($path, $data = [])
    {
        return view('frontend.' . getTheme() . '.' . $path, $data)->render();
    }
}

if (!function_exists('cacheClear')) {
    # clear server cache
    function cacheClear()
    {
        try {
            Artisan::call('cache:forget spatie.permission.cache');
        } catch (\Throwable $th) {
            //throw $th;
        }

        Artisan::call('cache:clear');
        Artisan::call('view:clear');
        Artisan::call('config:clear');
    }
}

if (!function_exists('clearPaymentSession')) {
    # clear session cache
    function clearPaymentSession()
    {
        session()->forget('package_id');
        session()->forget('amount');
        session()->forget('payment_method');
        session()->forget('admin_customer');
        session()->forget('active_now');
    }
}

if (!function_exists('csrfToken')) {
    #  Get the CSRF token value. 
    function csrfToken()
    {
        $session = app('session');

        if (isset($session)) {
            return $session->token();
        }
        throw new RuntimeException('Session store not set.');
    }
}

if (!function_exists('paginationNumber')) {
    # return number of data per page
    function paginationNumber($value = null)
    {
        return $value != null ? $value : env('DEFAULT_PAGINATION');
    }
}

if (!function_exists('areActiveRoutes')) {
    # return active class
    function areActiveRoutes(array $routes, $output = "active")
    {
        foreach ($routes as $route) {
            if (Route::currentRouteName() == $route) return $output;
        }
        return '';
    }
}

if (!function_exists('validatePhone')) {
    # validatePhone
    function validatePhone($phone)
    {
        $phone = str_replace(' ', '', $phone);
        $phone = str_replace('-', '', $phone);
        return $phone;
    }
}

if (!function_exists('staticAsset')) {
    # return path for static assets
    function staticAsset($path, $secure = null)
    {
        if (str_contains(url('/'), '.test') || str_contains(url('/'), 'http://127.0.0.1:')) {
            return app('url')->asset('' . $path, $secure) . '?v=' . env('APP_VERSION');
        }
        return app('url')->asset('public/' . $path, $secure) . '?v=' . env('APP_VERSION');
    }
}

if (!function_exists('uploadedAsset')) {
    #  Generate an asset path for the uploaded files. 
    function uploadedAsset($fileId)
    {
        $mediaFile = MediaManager::find($fileId);
        if (!is_null($mediaFile)) {
            if (str_contains(url('/'), '.test') || str_contains(url('/'), 'http://127.0.0.1:')) {
                return app('url')->asset('' . $mediaFile->media_file);
            }
            return app('url')->asset('public/' . $mediaFile->media_file);
        }
        return '';
    }
}

if (!function_exists('localize')) {
    # add / return localization 
    function localize($key, $lang = null, $localize = true)
    {
        if ($localize == false) {
            return $key;
        }

        if ($lang == null) {
            $lang = App::getLocale();
        }

        $t_key = preg_replace('/[^A-Za-z0-9\_]/', '', str_replace(' ', '_', strtolower($key)));

        $localization_english = Cache::rememberForever('localizations-en', function () {
            return Localization::where('lang_key', 'en')->pluck('t_value', 't_key');
        });

        if (!isset($localization_english[$t_key])) {
            # add new localization
            newLocalization('en', $t_key, $key);
        }

        # return user session lang
        $localization_user = Cache::rememberForever("localizations-{$lang}", function () use ($lang) {
            return Localization::where('lang_key', $lang)->pluck('t_value', 't_key')->toArray();
        });

        if (isset($localization_user[$t_key])) {
            return trim($localization_user[$t_key]);
        }

        return isset($localization_english[$t_key]) ? trim($localization_english[$t_key]) : $key;
    }
}

if (!function_exists('newLocalization')) {
    # new localization
    function newLocalization($lang, $t_key, $key, $type = null)
    {
        $localization = new Localization;
        $localization->lang_key = $lang;
        $localization->t_key = $t_key;
        $localization->t_key = $t_key;
        $localization->t_value = str_replace(array("\r", "\n", "\r\n"), "", $key);
        $localization->save();

        # clear cache
        Cache::forget('localizations-' . $lang);

        return trim($key);
    }
}

if (!function_exists('writeToEnvFile')) {
    # write To Env File
    function writeToEnvFile($type, $val)
    {
        $path = base_path('.env');
        if (file_exists($path)) {
           
            $val = '"' . trim($val) . '"';
            if (is_numeric(strpos(file_get_contents($path), $type)) && strpos(file_get_contents($path), $type) >= 0) {
                file_put_contents($path, str_replace(
                    $type . '="' . env($type) . '"',
                    $type . '=' . $val,
                    file_get_contents($path)
                ));
                
            } else {
                file_put_contents($path, file_get_contents($path) . "\r\n" . $type . '=' . $val);
            }
        }
       
    }
}

if (!function_exists('getFileType')) {
    #  Get file Type
    function getFileType($type)
    {
        $fileTypeArray = [
            // audio
            "mp3"       =>  "audio",
            "wma"       =>  "audio",
            "aac"       =>  "audio",
            "wav"       =>  "audio",

            // video
            "mp4"       =>  "video",
            "mpg"       =>  "video",
            "mpeg"      =>  "video",
            "webm"      =>  "video",
            "ogg"       =>  "video",
            "avi"       =>  "video",
            "mov"       =>  "video",
            "flv"       =>  "video",
            "swf"       =>  "video",
            "mkv"       =>  "video",
            "wmv"       =>  "video",

            // image 
            "png"       =>  "image",
            "svg"       =>  "image",
            "gif"       =>  "image",
            "jpg"       =>  "image",
            "jpeg"      =>  "image",
            "webp"      =>  "image",

            // document 
            "doc"       =>  "document",
            "txt"       =>  "document",
            "docx"      =>  "document",
            "pdf"       =>  "document",
            "csv"       =>  "document",
            "xml"       =>  "document",
            "ods"       =>  "document",
            "xlr"       =>  "document",
            "xls"       =>  "document",
            "xlsx"      =>  "document",

            // archive  
            "zip"       =>  "archive",
            "rar"       =>  "archive",
            "7z"        =>  "archive"
        ];
        return isset($fileTypeArray[$type]) ? $fileTypeArray[$type] : null;
    }
}

if (!function_exists('fileDelete')) {
    # file delete 
    function fileDelete($file)
    {
        if (File::exists('public/' . $file)) {
            File::delete('public/' . $file);
        }
    }
}

if (!function_exists('getSetting')) {
    # return system settings value
    function getSetting($key, $default = null)
    {
        try {
            $settings = Cache::remember('settings', 86400, function () {
                return SystemSetting::all();
            });

            $setting = $settings->where('entity', $key)->first();

            return $setting == null ? $default : $setting->value;
        } catch (\Throwable $th) {
            return $default;
        }
    }
}

if (!function_exists('renderStarRating')) {
    # render ratings
    function renderStarRating($rating, $maxRating = 5)
    {
        $fullStar = "<i data-feather='star' width='16' height='16' class='text-primary'></i>";

        $rating = $rating <= $maxRating ? $rating : $maxRating;
        $fullStarCount = (int)$rating;

        $html = str_repeat($fullStar, $fullStarCount);
        echo $html;
    }
}

if (!function_exists('renderStarRatingFront')) {
    # render ratings frontend
    function renderStarRatingFront($rating, $maxRating = 5)
    {
        $fullStar = '<li><i class="las la-star text-warning"></i></li>';

        $rating = $rating <= $maxRating ? $rating : $maxRating;
        $fullStarCount = (int)$rating;

        $html = str_repeat($fullStar, $fullStarCount);
        echo $html;
    }
}

if (!function_exists('formatWords')) {
    # format Words 
    function formatWords($words)
    {
        if ($words < 10000) {
            // less than 10 thousands
            $words = $words;
        } else if ($words < 1000000) {
            // less than a million
            $words = $words / 1000  . 'k';
        } else if ($words < 1000000000) {
            // less than a billion
            $words = $words / 1000000 . 'M';
        } else {
            // at least a billion
            $words = $words / 1000000000 . 'B';
        }

        return $words;
    }
}

if (!function_exists('formatPrice')) {
    //formats price - truncate price to 1M, 2K if activated by admin 
    function formatPrice($price, $truncate = false, $forceTruncate = false, $addSymbol = true, $decimalSeparator = true)
    {
        // convert amount equal to local currency
        if (Session::has('currency_code') && Session::has('local_currency_rate')) {
            $price = floatval($price) / (floatval(env('DEFAULT_CURRENCY_RATE')) || 1);
            $price = floatval($price) * floatval(Session::get('local_currency_rate'));
        }

        // truncate price
        if ($truncate) {
            if (getSetting('truncate_price') == 1 || $forceTruncate == true) {
                if ($price < 1000000) {
                    // less than a million
                    $price = number_format($price, getSetting('no_of_decimals'));
                } else if ($price < 1000000000) {
                    // less than a billion
                    $price = number_format($price / 1000000, getSetting('no_of_decimals')) . 'M';
                } else {
                    // at least a billion
                    $price = number_format($price / 1000000000, getSetting('no_of_decimals')) . 'B';
                }
            }
        } else {
            if ($decimalSeparator) {
                // decimals
                if (getSetting('no_of_decimals') > 0) {
                    $price = number_format($price, getSetting('no_of_decimals'));
                } else {
                    $price = number_format($price, getSetting('no_of_decimals'), '.', ',');
                }
            }
        }

        if ($addSymbol) {
            // currency symbol
            $symbol             = Session::has('currency_symbol')           ? Session::get('currency_symbol')           : env('DEFAULT_CURRENCY_SYMBOL');
            $symbolAlignment    = Session::has('currency_symbol_alignment') ? Session::get('currency_symbol_alignment') : env('DEFAULT_CURRENCY_SYMBOL_ALIGNMENT');

            if ($symbolAlignment == 0) {
                return $symbol . $price;
            } else if ($symbolAlignment == 1) {
                return $price . $symbol;
            } else if ($symbolAlignment == 2) {
                # space
                return $symbol . ' ' . $price;
            } else {
                # space
                return $price . ' ' .  $symbol;
            }
        }

        return $price;
    }
}

if (!function_exists('priceToUsd')) {
    // price to usd
    function priceToUsd($price)
    {
        // convert amount equal to local currency
        if (Session::has('currency_code') && Session::has('local_currency_rate')) {
            $price = floatval($price) / floatval(Session::get('local_currency_rate'));
        }

        return $price;
    }
}

if (!function_exists('getProjectIcon')) {
    // getProjectIcon
    function getProjectIcon($type)
    {
        $icon = '';
        switch ($type) {
            case 'image':
                $icon = "image";
                break;
            case 'code':
                $icon = "code";
                break;
            case 'speech':
                $icon = "mic";
                break;
            default:
                $icon = "file-text";
                break;
        }
        return $icon;
    }
}

if (!function_exists('availableDataCheck')) {
    // availableDataCheck
    function availableDataCheck($dataType)
    {
        $user = auth()->user();
        $latestPackage = activePackageHistory();
        if (is_null($latestPackage)) {
            return 0;
        }

        $available = 0;
        switch ($dataType) {
            case 'words':
                $available = $latestPackage->new_word_balance == -1 ? 1000 : $latestPackage->this_month_available_words;
                break;

            case 'images':
                $available = $latestPackage->new_image_balance == -1 ? 1000 :  $latestPackage->this_month_available_images;
                break;

            case 's2t':
                $available = $latestPackage->new_s2t_balance == -1 ? 1000 : $latestPackage->this_month_available_s2t;
                break;

            default:
                # code...
                break;
        }
        return  $available;
    }
}

if (!function_exists('updateDataBalance')) {
    // updateDataBalance
    function updateDataBalance($dataType, $tokens, $user)
    {
        $latestPackage = activePackageHistory();
        if (is_null($latestPackage)) {
            return;
        } else {
            switch ($dataType) {
                case 'words':
                    $latestPackage->this_month_used_words        += (int) $tokens;
                    $latestPackage->this_month_available_words   -= (int) $tokens;
                    $latestPackage->total_used_words             += (int) $tokens;
                    break;

                case 'images':
                    $latestPackage->this_month_used_images       += (int) $tokens;
                    $latestPackage->this_month_available_images  -= (int) $tokens;
                    $latestPackage->total_used_images            += (int) $tokens;

                    break;

                case 's2t':
                    $latestPackage->this_month_used_s2t        += 1;
                    $latestPackage->this_month_available_s2t   -= 1;
                    $latestPackage->total_used_s2t             += 1;
                    break;

                default:
                    # code...
                    break;
            }
            $latestPackage->save();
        }
    }
}

if (!function_exists('getUsedWordsPercentage')) {
    // getUsedWordsPercentage
    function getUsedWordsPercentage()
    {
        $user = auth()->user();
        $latestPackage = activePackageHistory();
        if (is_null($latestPackage)) {
            return 0;
        }
        $total = $latestPackage->this_month_available_words + $latestPackage->this_month_used_words;
        if ($total == 0) {
            $total = 1;
        }
        $usedPercent = (100 * $latestPackage->this_month_used_words) / $total;
        return $usedPercent > 100 ? 100 : round($usedPercent);
    }
}

if (!function_exists('getUsedImagesPercentage')) {
    // getUsedImagesPercentage
    function getUsedImagesPercentage()
    {
        $user = auth()->user();

        $latestPackage = activePackageHistory();
        if (is_null($latestPackage)) {
            return 0;
        }

        $total = $latestPackage->this_month_used_images + $latestPackage->this_month_available_images;
        if ($total == 0) {
            $total = 1;
        }
        $usedPercent = (100 * $latestPackage->this_month_used_images) / $total;
        return $usedPercent > 100 ? 100 : round($usedPercent);
    }
}

if (!function_exists('getUsedS2TPercentage')) {
    // getUsedS2TPercentage
    function getUsedS2TPercentage()
    {
        $user = auth()->user();
        $latestPackage = activePackageHistory();
        if (is_null($latestPackage)) {
            return 0;
        }
        $total = $latestPackage->this_month_available_s2t + $latestPackage->this_month_used_s2t;
        if ($total == 0) {
            $total = 1;
        }
        $usedPercent = (100 * $latestPackage->this_month_used_s2t) / $total;
        return $usedPercent > 100 ? 100 : round($usedPercent);
    }
}

if (!function_exists('checkLanguage')) {
    function checkLanguage($lang_key)
    {
        return  env('DEFAULT_LANGUAGE') == $lang_key ? true : false;
    }
}

if (!function_exists('systemSetting')) {
    function systemSetting($key)
    {
        $settings = Cache::remember('settings', 86400, function () {
            return SystemSetting::all();
        });

        $setting = $settings->where('entity', $key)->first();
        return $setting;
    }
}

if (!function_exists('systemSettingsLocalization')) {
    function systemSettingsLocalization($entity, $lang_key = null)
    {
        if ($lang_key == null) {
            $lang_key = App::getLocale();
        }
        $settings = systemSetting($entity);
        $default_lang = getSetting($entity);
        $lang = $default_lang;
        if ($settings) {
            $data = $settings->collectLocalization($entity, $lang_key);

            $lang = $data ?? $default_lang;
        }
        return $lang;
    }
}
if (!function_exists('openAiKey')) {
    #get Api key
    function openAiKey($engine = "openai")
    {
        $key = $engine == "openai" ? config('services.open-ai.key') : config('services.stable-ai.key');

        $uses_key =  $engine == "openai" ? getSetting('api_key_use') : getSetting('sd_api_key_use');

        if (!$uses_key) return $key;

        $activeKeys = [];

        if ($uses_key) {
            if ($uses_key == 'random') {
                // get all active key
                if ($engine == "openai") {
                    $activeKeys = OpenAiKey::isActive()->where('engine', 1)->pluck('api_key')->toArray();
                } else {
                    $activeKeys = OpenAiKey::isActive()->where('engine', 2)->pluck('api_key')->toArray(); // stable diffusion
                }
            }
        }

        // merge main key and active key
        array_push($activeKeys, $key);
        $key = $activeKeys[array_rand($activeKeys, 1)];
        return $key;
    }
}


//Count Words
function countWords($text)
{

    $encoding = mb_detect_encoding($text);

    if ($encoding === 'UTF-8') {
        // Count Chinese words by splitting the string into individual characters
        $words = preg_match_all('/\p{Han}|\p{L}+|\p{N}+/u', $text);
    } else {
        // For other languages, use str_word_count()
        $words = str_word_count($text, 0, $encoding);
    }

    return (int)$words;
}
// file upload
if (!function_exists('fileUpload')) {
    function fileUpload($path, $file, $change_name = false)
    {
        $fileName = '';
        if (!$file) {
            return $fileName;
        }

        $original_name = $file->getClientOriginalName();
        if ($change_name) {
            $name = $original_name;
        } else {
            $str = str_replace(' ', '-', $original_name);
            $name = time() . '_' . $str;
        }

        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }

        $file->move($path, $name);
        $fileName = $path . $name;

        return $fileName;
    }
}
// file update 
if (!function_exists('fileUpdate')) {
    function fileUpdate($databaseFile, $path, $file)
    {

        $fileName = "";


        if ($file) {
            $fileName = fileUpload($path, $file);

            if ($databaseFile && file_exists($databaseFile)) {

                unlink($databaseFile);
            }
        } elseif (!$file and $databaseFile) {
            $fileName = $databaseFile;
        }


        return $fileName;
    }
}
// voice over setting enable 
if (!function_exists('voiceOverEnable')) {
    function voiceOverEnable()
    {
        $enableVoiceOver = getSetting('default_voiceover');
        if (!$enableVoiceOver) return false;
        if ($enableVoiceOver) {
            $settings = TextToSpeechSetting::where('type', $enableVoiceOver)->first();
            if ($enableVoiceOver == 'google') {
                return $settings->file_name ? true : false;
            }
            if ($enableVoiceOver == 'azure') {
                return $settings->key && $settings->region ? true : false;
            }
        }
        return false;
    }
}
// voice of enable method credentials

if (!function_exists('voiceSettingCredential')) {
    function voiceSettingCredential()
    {
        $enableVoiceOver = getSetting('default_voiceover');
        if (!$enableVoiceOver) return false;
        return TextToSpeechSetting::where('type', $enableVoiceOver)->first();
    }
}
// active subscription package
if (!function_exists('activePackageHistory')) {
    function activePackageHistory($user_id = null)
    {
        $user_id = $user_id ?? auth()->user()->id;
        $activePackage = SubscriptionHistory::latest()->where('subscription_status', 1)->where('user_id', $user_id)->first();
        return $activePackage;
    }
}
// active package balance validation
// return status, message, success array
if (!function_exists('activePackageBalance')) {
    function activePackageBalance($type = null, $user_id = null): array
    {
        $user_id = $user_id ?? auth()->user()->id;
        $user = User::findOrFail($user_id);
        $data = [];
        if ($user->user_type == "customer") {

            $activePackageHistory = activePackageHistory($user_id);

            if ($activePackageHistory == null) {
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => localize('Please upgrade your subscription plan'),
                ];
                return $data;
            }

            // package
            $package = $activePackageHistory->subscriptionPackage;
            # 3. validity of the package & verify if the user has word limit

            //  check if allow images is enabled
            if ($type == 'allow_speech_to_text') {
                if ((int) $package->allow_speech_to_text == 0) {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('Speech to text is not available in this package, please upgrade you plan'),
                    ];
                    return $data;
                }
            }
            //  check if allow_text_to_speech is enabled
            if ($type == 'allow_text_to_speech') {
                if ((int) $package->allow_text_to_speech == 0) {
                    $data = [
                        'status'    => 400,
                        'success'    => false,
                        'message'   => localize('Text to speech is not available in this package, please upgrade you plan'),
                    ];
                    return $data;
                }
            }
            //  check if allow images is enabled
            if ($type == 'allow_ai_code') {
                if ((int) $package->allow_ai_code == 0) {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('AI Code is not available in this package, please upgrade you plan'),
                    ];
                    return $data;
                }
            }
            // check if allow custom template content is enabled
            if ($type == 'allow_custom_templates') {
                if ((int) $package->allow_custom_templates == 0) {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('Custom template is not available in this package, please upgrade you plan'),
                    ];
                    return $data;
                }
            }
            //  check if allow images is enabled
            if ($type == 'allow_images') {
                if ((int) $package->allow_images == 0) {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('AI Images is not available in this package, please upgrade you plan'),
                    ];
                    return $data;
                }
            }
           
            //  check if allow sd images is enabled
            if ($type == 'allow_sd_images') {
                if ((int) $package->allow_sd_images == 0) {
                    $data = [
                        'status'  => 400,
                        'success' => false,
                        'message' => localize('Stable Diffusion Image is not available in this package, please upgrade you plan'),
                    ];
                    return $data;
                }
            }

            if (empty($activePackageHistory)) {
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => localize('Please upgrade your subscription plan'),
                ];
                return $data;
            }

            // check validity
            $days = 30;
            $today = date('Y-m-d');
            if ($package->package_type == "yearly") {
                $days = 365; // 1 year
            }

            if ($package->package_type == "lifetime" || $package->package_type == "prepaid") {
                $days = 365 * 100; // 100 years
            }

            if (($activePackageHistory->end_date && $today > $activePackageHistory->end_date) || ($activePackageHistory->expire_by_admin_date && $today > $activePackageHistory->expire_by_admin_date)) {
                $data = [
                    'status'  => 400,
                    'success' => false,
                    'message' => localize('Your subscription is expired, please upgrade you plan'),
                ];
                return $data;
            }
        }
        return $data;
    }
}
// package types
if (!function_exists('package_types')) {
    function package_types(): array
    {
        return [
            'starter' => 'Starter',
            'monthly' => 'Monthly',
            'yearly' => 'Yearly',
            'lifetime' => 'LifeTime',
            'prepaid' => 'Prepaid'
        ];
    }
}
// subscription log
if (!function_exists('subscriptionLogs')) {
    function subscriptionLogs($total_text, $type, $total_balance, $promptsToken = null, $completionToken = null)
    {
        // types  ,words, tts, images
        if (auth()->user()->user_type == 'customer') {

            $activePackageHistory = activePackageHistory();
            $log = new SubscriptionLog();
            $log->subscription_history_id = $activePackageHistory->id;
            $log->subscription_package_id = $activePackageHistory->subscription_package_id;
            $log->type = $type;
            $log->total_text = $total_text;
            $log->user_id = $activePackageHistory->user_id;
            $log->created_by = auth()->user()->id;
            $log->save();
            return true;
        }
        return false;
    }
}
// limit package purchase
if (!function_exists('limitPurchasePackage')) {
    function limitPurchasePackage()
    {
        $user = auth()->user();
        if ($user->user_typ == 'customer') {
            $package_count = SubscriptionHistory::where('user_id', $user->id)->whereIn('subscription_status', [1, 3])->count();
            if ($package_count > 2) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }
}
// Subscription Status 
if (!function_exists('subscriptionStatus')) {
    function subscriptionStatus(): array
    {
        return [
            '1' => 'Active',
            '2' => 'Expired',
            '3' => 'Subscribed',
        ];
    }
}
// Subscription Status 
if (!function_exists('getSubscriptionStatusName')) {
    function getSubscriptionStatusName($status_id)
    {
        $list = subscriptionStatus();
        if (array_key_exists($status_id, $list)) {
            return $list[$status_id];
        }
        return 'Invalid Status';
    }
}

// package price
if(!function_exists('packageSellPrice')){
    function packageSellPrice($package_id)
    {
        $package = SubscriptionPackage::where('id', $package_id)->first();
        $price = 0;
        if($package){
            if($package->discount_status == 1 && $package->discount) {
                $price = $package->discount_price;
            }else{
                $price = $package->price;
            }
        }
        return $price;
    }
}

//  package discount status
if(!function_exists('packageDiscountStatus')){
    function packageDiscountStatus($package_id)
    {
        $package = SubscriptionPackage::where('id', $package_id)->first();
        if($package->discount_status == 1 && $package->discount)
        {
            return true;
        }
        return false;
    }
}
// check storage manager active
if(!function_exists('activeStorage')){
    function activeStorage($type = null)
    {
       $storage_type = $type ?? getSetting('active_storage');
       if(!$storage_type) {
            $storage_type= 'local';
       }
       $data = StorageManager::when($storage_type, function($q) use ($storage_type){
            $q->where('type', $storage_type);
        })->where('is_active', 1)->first();
        if($data){
            return true;
        }
        return false;
    }
}
// store notification

if(!function_exists('saveNotification')){
    function saveNotification(string $title, string $url = null, string $user_role = null, int $user_id = null, int $role_id = null, string $type = null , $description)
    {
        $notification = new WrNotification();
        $notification->title = $title;
        $notification->url = $url;
        $notification->user_role = $user_role;
        $notification->user_id = $user_id;
        $notification->role_id = $role_id;
        $notification->type = $type;
        $notification->description = $description;
        $notification->save();
    }
}

if (!function_exists('recaptchaValidation')) {
    // recaptchaValidation
    function recaptchaValidation($request)
    { 
        $score = 1;
        if (getSetting('enable_recaptcha') == 1){
            $score = RecaptchaV3::verify($request->get('g-recaptcha-response'), 'recaptcha_token');        
        } 
        return $score;
    }
}

// latest version check
if(!function_exists('latestVersion')) {
    function latestVersion($versionNumber =false)
    {
        $status = false;
        if(empty(versionList())) {
            return $status;
        }
        $array_key_last = array_key_last(versionList());
        $latestVersionNumber = versionList()[$array_key_last];
        $currentVersion = currentVersion();
        if($versionNumber) {
            return $latestVersionNumber;
        }
        if($currentVersion < $latestVersionNumber) {
            $status = true;
        }
        return $status;
    }
}
// version list
if(!function_exists('versionList')) {
    function versionList()
    {
        $allVersionsOfArray = [];
        $versionList = 'https://themetags.net/versionFile/versionList.json';
            
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $versionList);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $allVersions = curl_exec($curl);
        curl_close($curl); 
      
        if($allVersions) {
            $allVersions = json_decode($allVersions);           
            $allVersionsOfArray = $allVersions->versions;            
        }
        return $allVersionsOfArray;
    }
}
if(!function_exists('currentVersion')) {
    function currentVersion()
    {
        $version = env('APP_VERSION') ? str_replace('v', '', env('APP_VERSION')) : null;
        $settings = SystemSetting::where('entity', 'software_version')->first();
        if($settings) {
            $version = $settings->value;
        }
        return $version;
    }
}