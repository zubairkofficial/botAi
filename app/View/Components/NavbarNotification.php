<?php

namespace App\View\Components;

use App\Models\WrNotification;
use Illuminate\View\Component;

class NavbarNotification extends Component
{

    public function render()
    {
        $user = auth()->user();
        $newMsgCount = WrNotification::where('is_read', 0)->when($user->user_type == 'admin', function($q){
            $q->where('user_role', 'admin');
        })->when($user->user_type == 'customer', function($q) use($user){
            $q->where('user_role', 'customer')->where('user_id', $user->id);
        })
        ->count();
 
        return view('components.navbar-notification', compact('newMsgCount'));
    }
}
