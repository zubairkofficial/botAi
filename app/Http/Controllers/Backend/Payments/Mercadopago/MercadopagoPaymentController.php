<?php

namespace App\Http\Controllers\Backend\Payments\Mercadopago;

use App\Http\Controllers\Backend\Payments\PaymentsController;
use App\Http\Controllers\Controller;
use MercadoPago;
use Illuminate\Support\Carbon;

class MercadopagoPaymentController extends Controller
{
    public function initPayment()
    {
        $amount = session('amount');
        $amount = priceToUsd($amount);

        try {
            //Payment
            MercadoPago\SDK::setAccessToken(env('MERCADOPAGO_SECRET_KEY'));
            $preference = new MercadoPago\Preference();
            $payer = new MercadoPago\Payer();
            $payer->name = auth()->user()->name;
            $payer->email = auth()->user()->email ? auth()->user()->email : "email@email.com";
            $payer->date_created = Carbon::now();

            $url = route('mercadopago.redirect');

            $preference->back_urls = array(
                "success" => $url,
                "failure" => route('mercadopago.failed'),
                "pending" => $url,
            );

            $preference->auto_return = "approved";

            // Create a preference item
            $item = new MercadoPago\Item();
            $item->title = 'Package Subscription Payment';
            $item->quantity = 1;
            $item->unit_price = $amount;

            $preference->items = array($item);
            $preference->payer = $payer;
            $preference->save();

            $redirectUrl = getSetting('mercadopago_sandbox') == 1 ? $preference->sandbox_init_point : $preference->init_point;

            return redirect($redirectUrl);
        } catch (\Throwable $th) {
            return (new PaymentsController)->payment_failed();
        }
    }

    public function redirect()
    {
        $response = Request()->all();
        if ($response['status'] == 'approved') {

            $payment = ["status" => "Success"];
            return (new PaymentsController)->payment_success(json_encode($payment));
        } else {

            return (new PaymentsController)->payment_failed();
        }
    }

    public function failed()
    {
        return (new PaymentsController)->payment_failed();
    }
}
