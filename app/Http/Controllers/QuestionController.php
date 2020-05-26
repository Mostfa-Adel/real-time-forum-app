<?php

namespace App\Http\Controllers;

use App\{Question,Category};
use Illuminate\Http\Request;
use App\Http\Requests\QuestionRequest;
use Illuminate\Http\Response;
use App\Http\Resources\QuestionResource;

class QuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function userQuestions()
    {
        $data['questions']=QuestionResource::collection(auth()->user()->questions()->latest()->paginate(10));
        $data['pagination']=$this->paginateQuestions($data['questions']);        
        return response($data,Response::HTTP_OK) ;
    }

    
     public function getCategorized(Category $category)
    {
        $data['questions']=QuestionResource::collection($category->questions()->latest()->paginate(10));
        $data['pagination']=$this->paginateQuestions($data['questions']);
        
        return response($data,Response::HTTP_OK) ;
    }
    public function index()
    {
        $data['questions']= QuestionResource::collection(Question::latest()->paginate(15));
        $data['pagination']=$this->paginateQuestions($data['questions']);
        return response($data,Response::HTTP_OK) ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(QuestionRequest $request)
    {
        //create
        $user=auth()->user();
        $user->questions()->create($request->all());
        $data['message']='question created successfully';
        return response()->json($data,Response::HTTP_CREATED);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function show(Question $question)
    {
        $data['question']=new QuestionResource($question);
        return response()->json($data,Response::HTTP_OK);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function update(QuestionRequest $request, Question $question)
    {
        $question->update($request->all());
        $data['message']="Updated Successfully";
        $data['question']=$question;
        return response()->json($data,Response::HTTP_ACCEPTED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function destroy(Question $question)
    {
        $question->delete();
        $data['message']="Deleted Successfully";
        return response($data,Response::HTTP_NO_CONTENT);
    }

    private function paginateQuestions($questions)
    {
        
        return[
            'total'=>$questions->total(),
            'perPage'=>$questions->perPage(),
            'currentPage'=>$questions->currentPage(),
            'lastPage'=>$questions->lastPage(),
            'firstItem'=>$questions->firstItem(),
            'lastItem'=>$questions->lastItem(),
        ];
        
    }
}
