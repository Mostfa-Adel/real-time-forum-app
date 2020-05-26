<?php

namespace App\Http\Controllers;

use App\Http\Requests\LikeRequest;
use Illuminate\Http\Response;
use App\Http\Resources\LikeResource;
use App\{Like, Reply, Question};
use Illuminate\Http\Request;

class LikeController extends Controller
{


    public function index(Reply $reply)
    {
        $data['likes']=LikeResource::collection($reply->likes);
        return response($data,Response::HTTP_OK) ;
    }


    public function store(Reply $reply, Request $request)
    {
        $like_data=[
            'user_id'=>auth()->id(),
            'reply_id'=>$reply->id,
        ];
        $data['message']='Like created before that!';
        if(! $this->isUserLiked($reply)){
            Like::create($like_data);
            $data['message']='Like created successfully';
        }
        return response()->json($data,Response::HTTP_CREATED);
    }
    
    

    public function destroy(Reply $reply)
    {
        $like=$this->isUserLiked($reply);
        $this->authorize('can_change', $like);
        
        $like->delete();
        $data['message']='Like removed successfully';
        return response()->json($data,Response::HTTP_NO_CONTENT);
    }

    private function isUserLiked($reply)
    {
        $like_data=[
            'user_id'=>auth()->id(),
            'reply_id'=>$reply->id,
        ];
        return Like::where($like_data)->first();
        
    }
}
