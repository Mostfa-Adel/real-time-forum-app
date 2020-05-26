<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Contracts\Providers\Auth;

class AuthController extends Controller
{
    public function login(Request $request){
        //validate
        $request->validate([
            'email'=>"required|email",
            'password'=>"required"
        ]);
        //attempt to login
        $credintials=request(["email",'password']);
        if(! $token=auth()->attempt($credintials)){
            $data["message"]='Not valid credintials';
            return response()->json([$data],Response::HTTP_UNAUTHORIZED);
        }
        return $this->respondWithToken($token);
    }


    public function signup(Request $request){
        //validate
        $request->validate([
            'name'=>"required",
            'email'=>"required|email|unique:users",
            'password'=>"required|confirmed|min:6",
        ]);
        // create new user
        $user=User::create($request->all());
        $token=auth()->login($user);
        return $this->respondWithToken($token);
    }

    public function logout(){
        auth()->logout();
        return response()->json(["message"=>"logged out successfully", ]);
    }


    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'username'=>auth()->user()->name
        ]);
    }   
}
