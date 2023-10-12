<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AiChatMessage extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function aiChat()
    {
        return $this->belongsTo(AiChat::class);
    }
}
