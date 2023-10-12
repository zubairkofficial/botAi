<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SystemSetting;
use App\Mail\EmailManager;
use App\Models\Currency;
use App\Models\GeneralSetupLocalization;
use Artisan;
use Mail;
use App;

class SettingsController extends Controller
{
    # construct
    public function __construct()
    {
        $this->middleware(['permission:general_settings'])->only('index');
        $this->middleware(['permission:smtp_settings'])->only('smtpSettings');
        $this->middleware(['permission:payment_settings'])->only(['paymentMethods', 'updatePaymentMethods']);
    }

    # admin general settings
    public function index(Request $request)
    {
        $data['lang_key'] =  $request->lang_key ?? env('DEFAULT_LANGUAGE');
        return view('backend.pages.systemSettings.general', $data);
    }

    # open ai settings
    public function openAi()
    {
        return view('backend.pages.systemSettings.openAiSettings');
    }


    # smtp settings
    public function smtpSettings()
    {
        return view('backend.pages.systemSettings.smtp');
    }

    # update env values
    public function envKeyUpdate(Request $request)
    {
        foreach ($request->types as $key => $type) {
            writeToEnvFile($type, $request[$type]);
        }
        flash(localize("Settings updated successfully"))->success();
        return back();
    }

    # test email
    public function testEmail(Request $request)
    {
        $array['view'] = 'emails.bulkEmail';
        $array['subject'] = "SMTP Test";
        $array['from'] = env('MAIL_FROM_ADDRESS');
        $array['content'] = "This is a test email.";
        try {
            Mail::to($request->email)->queue(new EmailManager($array));
        } catch (\Exception $e) {
            dd($e);
        }

        flash(localize('An email has been sent.'))->success();
        return back();
    }

    # update settings
    public function update(Request $request)
    {
     
        if (env('DEMO_MODE') == "On") {
            flash(localize("This is turned off in demo"))->warning();
            return back();
        }
        $typesForLocalizations =['hero_title', 'how_it_works_1_title', 'cta_heading_title', 'homepage_trusted_by_title', 'feature_image_1_title', 'cta_colored_title'];
        foreach ($request->types as $key => $type) {
            // for currency rate
            if ($type == 'DEFAULT_CURRENCY') {
                $currency = Currency::where('code', $request[$type])->first();
                writeToEnvFile('DEFAULT_CURRENCY', $currency->code);
                writeToEnvFile('DEFAULT_CURRENCY_RATE', $currency->rate);
                writeToEnvFile('DEFAULT_CURRENCY_SYMBOL', $currency->symbol);
                writeToEnvFile('DEFAULT_CURRENCY_SYMBOL_ALIGNMENT', $currency->alignment);
            }

            # web maintenance mode
            if ($type == 'enable_maintenance_mode') {
                # maintenance 
                if ($request[$type] == "1") {
                    Artisan::call('down');
                } else {
                    Artisan::call('up');
                }
            }

            # timezone
            if ($type == 'timezone') {
                writeToEnvFile('APP_TIMEZONE', $request[$type]);
            } else if ($type == "GOOGLE_CLIENT_ID" || $type == "GOOGLE_CLIENT_SECRET" || $type == "FACEBOOK_APP_ID" || $type == "FACEBOOK_APP_SECRET" || $type == "RECAPTCHA_SITE_KEY" || $type == "RECAPTCHA_SECRET_KEY") {
                writeToEnvFile($type, $request[$type]);
            } else if ($type == "OPENAI_SECRET_KEY" || $type == "SD_API_KEY") {
                if ($request[$type] != null) {
                    writeToEnvFile($type, $request[$type]);
                }
            } else {
                $value = $request[$type];
                $reqLang = $request->language_key ?? null;
                if (checkLanguage($reqLang) || is_null($reqLang)) {
                    
                    if ($type == 'system_title') {
                        writeToEnvFile('APP_NAME', $value);
                    }

                    $settings = SystemSetting::where('entity', $type)->first();

                    if ($settings != null) {
                        if (gettype($value) == 'array') {
                            $settings->value = json_encode($value);
                        } else {
                            $settings->value = $value;
                        }
                    } else {
                        $settings = new SystemSetting;
                        $settings->entity = $type;
                        if (gettype($value) == 'array') {
                            $settings->value = json_encode($value);
                        } else {
                            $settings->value = $value;
                        }
                    }
                    if(in_array($type, $typesForLocalizations)) {
                         $this->storeLocalizationData($request);
                    }
                   
                    $settings->save();
                } else {
                    if ($request->filled('language_key')) {                      
                        $this->storeLocalizationData($request);
                    }
                }
            }
        }

        cacheClear();
        flash(localize("Settings updated successfully"))->success();
        return back();
    }

    # social login
    public function socialLogin()
    {
        return view('backend.pages.systemSettings.socialLogin');
    }

    # activation
    public function updateActivation(Request $request)
    {
        $setting = SystemSetting::where('entity', $request->entity)->first();
        if ($setting != null) {
            $setting->value = $request->value;
            $setting->save();
        } else {
            $setting = new SystemSetting;
            $setting->entity = $request->entity;
            $setting->value = $request->value;
            $setting->save();
        }
        cacheClear();
        return 1;
    }

    # admin payment Methods settings
    public function paymentMethods()
    {
        return view('backend.pages.systemSettings.paymentMethods');
    }

    # update payment methods
    public function updatePaymentMethods(Request $request)
    {
    
        foreach ($request->types as $type) {
            writeToEnvFile($type, $request[$type]);
        }

        foreach ($request->payment_methods as $payment_method) {
            if ($request->has(['enable_' . $payment_method])) {
                $activationSetting = SystemSetting::where('entity', 'enable_' . $payment_method)->first();
                $value = $request['enable_' . $payment_method];

                if ($activationSetting != null) {
                    $activationSetting->value = $value;
                    $activationSetting->save();
                } else {
                    $activationSetting = new SystemSetting;
                    $activationSetting->entity = 'enable_' . $payment_method;
                    $activationSetting->value = $value;
                    $activationSetting->save();
                }
               
            }

            if ($request->has($payment_method . '_sandbox')) {
                $setting = SystemSetting::where('entity', $payment_method . '_sandbox')->first();
                $value = $request[$payment_method . '_sandbox'];

                if ($setting != null) {
                    $setting->value = $value;
                    $setting->save();
                } else {
                    $setting = new SystemSetting;
                    $setting->entity = $payment_method . '_sandbox';
                    $setting->value = $value;
                    $setting->save();
                }
            }

            if ($request->has('offline_image')) {
                $setting = SystemSetting::where('entity', 'offline_image')->first();
                $value = $request['offline_image'];
                if ($setting != null) {
                    $setting->value = $value;
                    $setting->save();
                } else {
                    $setting = new SystemSetting;
                    $setting->entity = 'offline_image';
                    $setting->value = $value;
                    $setting->save();
                }
            }
        }

        cacheClear();
        flash(localize("Payment settings updated successfully"))->success();
        return back();
    }

    # auth  settings
    public function authSettings(Request $request)
    {
        $lang_key = $request->lang_key ?? env('DEFAULT_LANGUAGE');
        return view('backend.pages.systemSettings.authSettings', compact('lang_key'));
    }

    # otp  settings
    public function otpSettings()
    {
        return view('backend.pages.systemSettings.otpSettings');
    }

    private function storeLocalizationData($request)
    {
        $lang_key = $request->language_key ?? App::getLocale();
        foreach ($request->types as $type) {
            $settings = SystemSetting::where('entity', $type)->first();

            $system_setting_id = $settings ? $settings->id : null;
            $value = $request[$type];
            if (gettype($value) == 'array') {
                $value = json_encode($value);
            }

            if (!is_null($system_setting_id)) {
                GeneralSetupLocalization::updateOrCreate([
                    'lang_key' => $lang_key,
                    'entity' => $type
                ], [
                    'value' => $value,
                    'system_setting_id' => $system_setting_id
                ]);
            }
        }
    }

    // cron job list
    public function cronJobList()
    {
        return view('backend.pages.systemSettings.cron_list');
    }
}
