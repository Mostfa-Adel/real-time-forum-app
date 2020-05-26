<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\Http\Requests\CategoryRequest;
use Illuminate\Http\Response;
use App\Http\Resources\CategoryResource;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['categories']= CategoryResource::collection(Category::get());
        return response($data,Response::HTTP_OK) ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoryRequest $request)
    {
        //
        // return response()->json($request,Response::HTTP_CREATED);
        $category=Category::create($request->all());
        $data['message']='category created successfully';
        $data['category']=$category;
        return response()->json($data,Response::HTTP_CREATED);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        $data['category']=new CategoryResource($category);
        return response()->json($data,Response::HTTP_FOUND);
    
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryRequest $request,$category_slug)
    {
        $category=Category::where('slug',$category_slug)->firstOrFail();
        $category->update($request->all(['name']));
        $data['message']="Updated Successfully";
        return response()->json($data,Response::HTTP_ACCEPTED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy( $category_slug)
    {
        $category=Category::where('slug',$category_slug)->firstOrFail();
        $category->delete();
        $data['message']="Deleted Successfully";
        return response($data,Response::HTTP_NO_CONTENT);
    }
}
