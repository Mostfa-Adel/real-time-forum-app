<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReplyResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'=>$this->id,
            'body'=>$this->body,
            // 'question_id'=>$this->question_id,
            'username'=>$this->user->name,
            'created_at'=>$this->created_at->diffForHumans(),
            'likes'=>$this->likes,
            'userLikedIt'=>($this->likes()->where('user_id',auth()->id())->first())?true:false,
        ];
    }
}
