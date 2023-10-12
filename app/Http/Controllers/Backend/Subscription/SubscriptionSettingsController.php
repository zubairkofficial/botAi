<?php

namespace App\Http\Controllers\Backend\Subscription;

use Illuminate\Http\Request;
use App\Models\SystemSetting;
use App\Http\Controllers\Controller;

class SubscriptionSettingsController extends Controller
{
    //
    public function index()
    {
        return view('backend.pages.subscribers.settings');
    }
    //
    public function store(Request $request)
    {

        try {
            SystemSetting::updateOrCreate([
                'entity' => $request->type
            ], [
                'value' => $request->is_active
            ]);
            cacheClear();           
            
            return 1;
        } catch (\Throwable $th) {
            return 0;
        }
    }
}
