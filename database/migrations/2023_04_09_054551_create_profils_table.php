<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profils', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('category_id');
            $table->string('waktu_kerja');
            $table->string('kategori')->nullable();
            $table->string('posisi_usaha')->nullable();
            $table->text('description');
            $table->text('address');
            // $table->string('status')->nullable();
            $table->string('email')->nullable();
            $table->string('phone');
            $table->string('website');
            $table->string('instagram');
            $table->string('facebook');
            $table->string('perizinan_usaha')->nullable();
            $table->string('sertifikat_usaha')->nullable();
            $table->string('longitude');
            $table->string('lattitude');
            $table->timestamps();

            //relationship category
            $table->foreign('category_id')->references('id')->on('categories');

            //relationship user
            $table->foreign('user_id')->references('id')->on('users');
         });
      }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('profils');
    }
}
