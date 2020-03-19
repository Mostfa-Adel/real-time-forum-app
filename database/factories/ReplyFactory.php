<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\{Reply, User, Question};
use Faker\Generator as Faker;

$factory->define(Reply::class, function (Faker $faker) {
    return [
        'body' => $faker->text(),
        'user_id'=>User::all()->random()->id,
        'question_id'=>Question::all()->random()->id,
    ];
});
