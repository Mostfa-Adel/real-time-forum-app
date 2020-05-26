<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Question;

class Category extends Model
{
    protected $table="categories";
    //
    protected $guarded=[];
    public $timestamps=false;
    

    // public function getRouteKeyName(){
    //     return "slug";
    // }

    public function questions(){
        return $this->hasMany(Question::class);
    }
}
