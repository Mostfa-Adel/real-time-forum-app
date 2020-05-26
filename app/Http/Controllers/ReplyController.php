<?php

namespace App\Http\Controllers;

use App\Http\Requests\ReplyRequest;
use Illuminate\Http\Response;
use App\Http\Resources\ReplyResource;
use App\{Reply, Question};
use Illuminate\Http\Request;

class ReplyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Question $question)
    {
        $data['replies']=ReplyResource::collection($question->replies);
        return response($data,Response::HTTP_OK);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Question $question, ReplyRequest $request)
    {
        $question_data['user_id']=auth()->user()->id;
        $question_data['question_id']=$question->id;
        $question_data=array_merge($request->all(), $question_data);
        $reply=Reply::create($question_data);
        $data['reply']=new ReplyResource($reply);
        $data['message']='Reply created successfully';
        return response()->json($data,Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Reply  $reply
     * @return \Illuminate\Http\Response
     */
    public function show($question, Reply $reply)
    {
        $data['reply']=new ReplyResource($reply);
        return response()->json($data,Response::HTTP_FOUND);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Reply  $reply
     * @return \Illuminate\Http\Response
     */
    public function update(ReplyRequest $request,Question $question ,Reply $reply)
    {
        $this->authorize('update', $reply);
        $reply->update($request->all(['body']));
        $data['message']="Updated Successfully";
        return response()->json($data,Response::HTTP_ACCEPTED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Reply  $reply
     * @return \Illuminate\Http\Response
     */
    public function destroy(Question $question, Reply $reply)
    {
        //TODO
        //test for authorization
        $this->authorize('delete', $reply);
        $reply->delete();
        $data['message']="Deleted Successfully";
        return response($data,Response::HTTP_NO_CONTENT);
    }
}
