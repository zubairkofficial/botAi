<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AiBlogWizard extends Model
{
    use HasFactory;

    public function aiBlogWizardKeyword(){
        return $this->hasOne(AiBlogWizardKeyWord::class);
    }

    public function aiBlogWizardTitle(){
        return $this->hasOne(AiBlogWizardTitle::class);
    }
 
    public function aiBlogWizardImages(){
        return $this->hasMany(AiBlogWizardImage::class);
    }
    
    public function aiBlogWizardOutlines(){
        return $this->hasMany(AiBlogWizardOutline::class);
    }
    
    public function aiBlogWizardArticle(){
        return $this->hasOne(AiBlogWizardArticle::class);
    }
}
