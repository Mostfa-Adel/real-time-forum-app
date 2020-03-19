<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\{Like, User, Question};

class Reply extends Model
{

    
    public $guarded=[];    
    //relations
    public function likes(){
        return $this->hasMany(Like::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function question(){
        return $this->belongsTo(Question::class);
    }
}
