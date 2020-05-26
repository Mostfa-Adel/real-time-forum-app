<?php

use App\Http\Controllers\LikeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('/category', 'CategoryController@index');
Route::get('/question', 'QuestionController@index');
Route::get('category/{category}/question','QuestionController@getCategorized');

Route::post('auth/login','AuthController@login');
Route::post('auth/signup','AuthController@signup');
Route::middleware('auth:api')->group(function(){
    // Route::group([],function(){
    Route::apiResource('category', 'CategoryController')->except('index');
    Route::apiResource('question/{question}/reply','ReplyController');    
    Route::apiResource('question', 'QuestionController')->except('index');
    Route::post('reply/{reply}/like','LikeController@store');
    Route::delete('reply/{reply}/like','LikeController@destroy');
    Route::get('user/question','QuestionController@userQuestions');
});
