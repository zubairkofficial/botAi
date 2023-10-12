<?php

namespace App\Http\Controllers\Backend\Payments\FreeKassa;

use App\Http\Controllers\Backend\Payments\PaymentsController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Redirect;
use Maksa988\FreeKassa\Facades\FreeKassa;

class FreeKassaPaymentController extends Controller
{
    public function initPayment()
    {
        try {
            
            $amount = session('amount');
            $order_id = session('package_id');
            $user = auth()->user();

            $rows = [
                'time' => Carbon::now(),
                'info' => 'Local payment'
            ];
           
            $url = FreeKassa::getPayUrl($amount, $order_id);

            $redirect = FreeKassa::redirectToPayUrl($amount, $order_id);
            return Redirect::to($url);
           
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::info('Failed payment FreeKasa');
            dd($e);
            return (new PaymentsController)->payment_failed();
        }
    }


    public function searchOrder(Request $request, $order_id)
    {
        // $order = Order::where('id', $order_id)->first();

        // if($order) {
        //     $order['_orderSum'] = $order->sum;

        //     // If your field can be `paid` you can set them like string
        //     $order['_orderStatus'] = $order['status'];

        //     // Else your field doesn` has value like 'paid', you can change this value
        //     $order['_orderStatus'] = ('1' == $order['status']) ? 'paid' : false;

        //     return $order;
        // }

        // return false;
    }

    /**
     * When paymnet is check, you can paid your order
     *
     * @param Request $request
     * @param $order
     * @return bool
     */
    public function paidOrder(Request $request, $order)
    {
        // $order->status = 'paid';
        // $order->save();

        //

        return true;
    }

    /**
     * Start handle process from route
     *
     * @param Request $request
     * @return mixed
     */
    public function handlePayment(Request $request)
    {
        return FreeKassa::handle($request);
    }
}
