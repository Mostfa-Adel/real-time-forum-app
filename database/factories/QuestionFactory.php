<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\{Question, User, Category};
use Faker\Generator as Faker;

$factory->define(Question::class, function (Faker $faker) {
    $title=$faker->word();
    return [
        'title'=> $title,
        'slug' =>Str::slug($title),
        'body' => $faker->text(),
        'user_id'=>User::all()->random()->id,
        'category_id'=>Category::all()->random()->id,
    ];
});
