<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use \App\Question;

class QuestionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if($this->method()=='POST'){
            return [
                'title'=>'required',
                'body'=>'required',
                'slug'=>'required|unique:questions',
                'category_id'=>'required'
            ];            
        }
        else{
            return [
                'title'=>'required',
                'body'=>'required',
                'category_id'=>'required'
            ];
        }
        
    }
}
