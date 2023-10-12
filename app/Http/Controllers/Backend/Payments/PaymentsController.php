<?php

namespace App\Http\Controllers\Backend\Payments;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Backend\Payments\Duitku\DuitkuController;
use App\Http\Controllers\Backend\Payments\Flutterwave\FlutterwaveController;
use App\Http\Controllers\Backend\Payments\FreeKassa\FreeKassaPaymentController;
use App\Http\Controllers\Backend\Payments\IyZico\IyZicoController;
use App\Http\Controllers\Backend\Payments\Mercadopago\MercadopagoPaymentController;
use App\Http\Controllers\Backend\Payments\Midtrans\MidtransController;
use App\Http\Controllers\Backend\Payments\Molile\MolilePaymentController;
use App\Http\Controllers\Backend\Payments\Paypal\PaypalController;
use App\Http\Controllers\Backend\Payments\Paystack\PaystackController;
use App\Http\Controllers\Backend\Payments\Stripe\StripePaymentController;
use App\Http\Controllers\Backend\Payments\Paytm\PaytmPaymentController;
use App\Http\Controllers\Backend\Payments\Razorpay\RazorpayController;
use App\Http\Controllers\Backend\Payments\Yookassa\YookassaPaymentController;
use App\Models\AffiliateEarning;
use App\Models\SubscriptionHistory;
use App\Models\SubscriptionPackage;
use App\Models\User;

class PaymentsController extends Controller
{
    # init payment gateway
    public function initPayment()
    {
        $payment_method = session('payment_method');
        if ($payment_method == 'paypal') {
            return (new PaypalController())->initPayment();
        } else if ($payment_method == 'stripe') {
            return (new StripePaymentController())->initPayment();
        } else if ($payment_method == 'paytm') {
            return (new PaytmPaymentController())->initPayment();
        } else if ($payment_method == 'razorpay') {
            return (new RazorpayController())->initPayment();
        } else if ($payment_method == 'iyzico') {
            return (new IyZicoController)->initPayment();
        } else if ($payment_method == 'paystack') {
            return (new PaystackController)->initPayment();
        } else if ($payment_method == 'flutterwave') {
            return (new FlutterwaveController)->initPayment();
        } else if ($payment_method == 'duitku') {
            return (new DuitkuController)->initPayment();
        } else if ($payment_method == 'yookassa') {
            return (new YookassaPaymentController)->initPayment();
        } else if ($payment_method == 'freekassa') {
            return (new FreeKassaPaymentController)->initPayment();
        } else if ($payment_method == 'molile') {
            return (new MolilePaymentController)->initPayment();
        } else if ($payment_method == 'mercadopago') {
            return (new MercadopagoPaymentController)->initPayment();
        } else if ($payment_method == 'midtrans') {
            return (new MidtransController)->initPayment();
        }
        # todo::[update versions] more gateways
        return $this->payment_success();
    }

    # payment successful
    public function payment_success(
        $payment_details = null,
        $user_ = null,
        $package_id_ = null,
        $amount_ = null,
        $payment_method_ = null
    ) {
        $user = $user_ ?? auth()->user();
        $package_id = $package_id_ ?? session('package_id');
        $amount = $amount_ ?? session('amount');
        $payment_method = $payment_method_ ?? session('payment_method');
        $forcefully_active = session('active_now') ?? false;
        // update subscription package & others 
        $package = SubscriptionPackage::where('id', $package_id)->first();

        $today = date('Y-m-d');
        $end_date = null;

        if ($package->package_type == 'monthly') {
            $end_date = date('Y-m-d', strtotime($today . ' + 1 months'));
        } elseif ($package->package_type == 'yearly') {
            $end_date = date('Y-m-d', strtotime($today . ' + 1 years'));
        }
        # subscription history
        $subscriptionHistory = new SubscriptionHistory;
        $subscriptionHistory->user_id = $user->id;
        $subscriptionHistory->old_subscription_package_id = optional(activePackageHistory())->subscription_package_id;
        $subscriptionHistory->subscription_package_id = $package->id;

        # add balance for the user 

        $carriedWords = 0;
        $carriedImages = 0;
        $carriedS2t = 0;

        $oldPackageHistory = activePackageHistory();
        if (!is_null($oldPackageHistory)) {
            $oldSubscriptionPackage = SubscriptionPackage::where('id', $oldPackageHistory->subscription_package_id)->first();
            // (check the package type: prepaid or lifetime) and (current package not prepaid or lifetime)
            if (in_array($oldSubscriptionPackage->package_type, ['prepaid', 'lifetime']) && !in_array($package->package_type, ['prepaid', 'lifetime']) || $forcefully_active == true) {
                // 1. if yes, expire current package
                $oldPackageHistory->subscription_status = 2;
                $oldPackageHistory->end_date            = date('Y-m-d');;
                $oldPackageHistory->save();

                // 2. active new subscription package
                $subscriptionHistory->subscription_status = 1;
            } else {
                $subscriptionHistory->subscription_status = 3;
            }
            if ($oldSubscriptionPackage->package_type == $package->package_type && getSetting('carry_forward') == 1) {
                $subscriptionHistory->is_carried_over = 1;
                $carriedWords    = $oldPackageHistory->this_month_available_words;
                $carriedImages   = $oldPackageHistory->this_month_available_images;
                $carriedS2t      = $oldPackageHistory->this_month_available_s2t;
            }
        } else {
            $subscriptionHistory->subscription_status = 1;
        }
        # add balance for the user 

        $subscriptionHistory->new_word_balance = $package->total_words_per_month;
        $subscriptionHistory->new_image_balance = $package->total_images_per_month;
        $subscriptionHistory->new_s2t_balance = $package->total_speech_to_text_per_month;

        $subscriptionHistory->carried_over_words                = $carriedWords;
        $subscriptionHistory->carried_over_images               = $carriedImages;
        $subscriptionHistory->carried_over_speech_to_text       = $carriedS2t;

        $subscriptionHistory->this_month_available_words   = (int) $package->total_words_per_month + $carriedWords;
        $subscriptionHistory->this_month_available_images  = (int) $package->total_images_per_month + $carriedImages;
        $subscriptionHistory->this_month_available_s2t     = (int) $package->total_speech_to_text_per_month + $carriedS2t;

        $subscriptionHistory->payment_status = 1;
        $subscriptionHistory->start_date = date('Y-m-d', strtotime($today));
        $subscriptionHistory->end_date = $end_date;

        $subscriptionHistory->price                     = $amount;
        $subscriptionHistory->package_price             = $package->price;
        if(packageDiscountStatus($package_id)) {
            $subscriptionHistory->discount_type         = $package->discount_type;
            $subscriptionHistory->discount              = $package->discount;
        }
        $subscriptionHistory->forcefully_active = $forcefully_active;

        $subscriptionHistory->payment_method = $payment_method;
        $subscriptionHistory->payment_details = !is_null($payment_details) ? json_encode($payment_details) : null;
        $subscriptionHistory->save();
        // check affiliate & calculate commissions
        if (getSetting('enable_affiliate_system') == '1') {
            if (!is_null($user->referred_by)) {

                $giveCommission = false;
                if (getSetting('enable_affiliate_continuous_commission') == "1") {
                    $giveCommission = true;
                    $user->is_commission_calculated = 0;
                } else if ($user->is_commission_calculated == 0) {
                    $giveCommission = true;
                }

                if ($giveCommission) {
                    $referredBy = User::where('id', $user->referred_by)->first();
                    if (!is_null($referredBy)) {
                        $earning = new AffiliateEarning;
                        $earning->user_id = $user->id;
                        $earning->referred_by = $referredBy->id;
                        $earning->subscription_history_id = $subscriptionHistory->id;
                        $earning->amount = ((float) $subscriptionHistory->price * (float) getSetting('affiliate_commission')) / 100;
                        $earning->commission_rate = getSetting('affiliate_commission');
                        $earning->save();

                        $referredBy->user_balance += (float) $earning->amount;
                        $referredBy->save();
                    }
                }
            }
        }

        # user
        activePackageHistory()->subscription_package_id = $package->id;

        $user->save();
        
        try {
            flash(localize('Subscription package updated successfully'))->success();
            $title = 'Purchase package using '. $payment_method;
            saveNotification($title, 'dashboard/subscriptions', 'admin', null, null, null, null);
        } catch (\Throwable $th) {
            throw $th;
        }
        clearPaymentSession();
        return redirect()->route('writebot.dashboard');
    }

    # payment failed
    public function payment_failed()
    {
        try {
            flash(localize('Payment failed, please try again'))->error();
        } catch (\Throwable $th) {
            throw $th;
        }
        clearPaymentSession();
        return redirect()->route('subscriptions.index');
    }
}
