<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profil_images', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('profil_id');
            $table->string('images');
            $table->timestamps();
      
            //relationship place
            $table->foreign('profil_id')->references('id')->on('profils');
         });
      }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('profil_images');
    }
}
