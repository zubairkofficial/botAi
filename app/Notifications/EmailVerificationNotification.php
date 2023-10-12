<?php

namespace App\Notifications;

use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\URL;
use App\Mail\EmailManager;
use Auth;
use App\Models\User;

class EmailVerificationNotification extends Notification
{
    use Queueable;

    public function __construct()
    {
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        $notifiable->verification_code = rand(100000, 999999);
        $notifiable->save();

        $array['view'] = 'emails.verification';
        $array['subject'] = localize('Email Verification');
        $array['content'] = localize('Please click the button below to verify your email address.');
        $array['link'] = route('email.verification.confirmation', encrypt($notifiable->verification_code));

        return (new MailMessage)
            ->view('emails.verification', ['array' => $array])
            ->subject(localize('Email Verification - ') . env('APP_NAME'));
    }

    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
