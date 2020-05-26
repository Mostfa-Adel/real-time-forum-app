<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\{Category, User, Reply};

class Question extends Model
{
    //
    //protected $fillable=['title', 'slug', 'body', 'user_id', 'category_id'];
    protected $guarded =[];

    // static protected function boot()
    // {
    //     parent::boot();
    //     static::creating(function($question){
    //         return $question->slug=\Str::slug($question->title); 
    //     });
    // }

    public function getPathAttribute(){
        return "question/".$this->slug;
    }

    public function getRouteKeyName(){
        return "slug";
    } 

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function replies(){
        return $this->hasMany(Reply::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }    

}
