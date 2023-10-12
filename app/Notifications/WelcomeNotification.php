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

class WelcomeNotification extends Notification
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
        $array['view'] = 'emails.registrationSuccessful';
        $array['subject'] = localize('Registration Successful');
        $array['content'] = localize('Thanks for joining us. Your registration has been successfully completed.');

        return (new MailMessage)
            ->view('emails.verification', ['array' => $array])
            ->subject(localize('Registration Successful - ') . env('APP_NAME'));
    }

    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
