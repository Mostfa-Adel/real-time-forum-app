<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLikesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('likes', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->refrences('id')->on('users')->oncascade('delete');

            $table->integer('reply_id')->unsigned();
            $table->foreign('reply_id')->refrences('id')->on('replies')->oncascade('delete');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('likes');
    }
}
