<?php

namespace App\Http\Controllers\Backend\Payments\Midtrans;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Backend\Payments\PaymentsController;
use Illuminate\Http\Request;
use Str;

class MidtransController extends Controller
{
    # init payment
    public function initPayment()
    {
        $user = auth()->user();
        $amount = session('amount');

        try {
            // Set your Merchant Server Key
            \Midtrans\Config::$serverKey = env('MIDTRANS_SERVER_KEY');
            // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
            \Midtrans\Config::$isProduction =  getSetting('midtrans_sandbox') == 0 ? true : false;
            // Set sanitization on (default)
            \Midtrans\Config::$isSanitized = true;
            // Set 3DS transaction for credit card to true
            \Midtrans\Config::$is3ds = true;
            $callback = \Midtrans\Config::$overrideNotifUrl = route('midtrans.callback');

            $order_id = Str::random(10);
            $params = array(
                'transaction_details' => array(
                    'order_id' => $order_id,
                    'gross_amount' => round($amount),
                ),
                'customer_details' => array(
                    'first_name' => auth()->user()->name,
                    'last_name' => '',
                    'phone' => auth()->user()->phone ?? '',
                ),
            );
            $snapToken = \Midtrans\Snap::getSnapToken($params);
            // $paymentUrl = \Midtrans\Snap::createTransaction($params)->redirect_url;
            // return redirect($paymentUrl);
           
            return view('payments.midtrans', compact('snapToken'));
        } catch (\Exception $e) {
            dd($e);
            return (new PaymentsController)->payment_failed();
        }
    }

    # callback  
    public function callback(Request $request)
    {       
        $transaction_status =  'capture';
        if ($transaction_status == 'capture') {          
            $payment = ["status" => "Success"];
            return (new PaymentsController)->payment_success(json_encode($payment));              
        } else {
            return (new PaymentsController)->payment_failed();
        }
    }
}
