<?php

use Illuminate\Database\Seeder;
use App\{User,Category, Question, Reply, Like};

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        factory(User::class,10)->create();
        factory(Category::class,5)->create();
        factory(Question::class,20)->create();
        factory(Reply::class,40)->create();
        factory(Like::class,20)->create();
    }
}
