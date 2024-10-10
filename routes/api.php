<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\SocialiteController;

//group route with prefix "admin"
Route::prefix('admin')->group(function () {

    //route login
    Route::post('/login', App\Http\Controllers\Api\Admin\LoginController::class, ['as' => 'admin']);

    //group route with middleware "auth:api"
    Route::group(['middleware' => 'auth:api'], function() {

    //route user logged in
    Route::get('/user', function (Request $request) {
        return $request->user();
    })->name('user');

    //route logout
    Route::post('/logout', App\Http\Controllers\Api\Admin\LogoutController::class, ['as' => 'admin']);

    //dashboard
    Route::get('/dashboard', App\Http\Controllers\Api\Admin\DashboardController::class, ['as' => 'admin']);

    //categories resource
    Route::apiResource('/categories', App\Http\Controllers\Api\Admin\CategoryController::class, ['except' => ['create', 'edit'], 'as' => 'admin']);

    //profils resource
    Route::apiResource('/profils', App\Http\Controllers\Api\Admin\ProfilController::class, ['except' => ['create', 'edit'], 'as' => 'admin']);

    // approve profil
    Route::put('/profils/{id}/approve', [App\Http\Controllers\Api\Admin\ProfilController::class, 'approve']);
    // reject profil
    Route::delete('/profils/{id}/reject', [App\Http\Controllers\Api\Admin\ProfilController::class, 'reject']);

    //sliders resource
    Route::apiResource('/sliders', App\Http\Controllers\Api\Admin\SliderController::class, ['except' => ['create', 'show', 'edit', 'update'], 'as' => 'admin']);

    //users resource
    Route::apiResource('/users', App\Http\Controllers\Api\Admin\UserController::class, ['except' => ['create', 'edit'], 'as' => 'admin']);
    });

});

//group route with prefix "web"
Route::prefix('web')->group(function () {

    //route categories index
    Route::get('/categories', [App\Http\Controllers\Api\Web\CategoryController::class, 'index', ['as' => 'web']]);
    //route posisi index
    Route::get('/posisi', [App\Http\Controllers\Api\Web\PosisiUsahaController::class, 'index', ['as' => 'web']]);

    //route categories show
    Route::get('/categories/{slug?}', [App\Http\Controllers\Api\Web\CategoryController::class, 'show', ['as' => 'web']]);

    //route profils index
    Route::get('/profils', [App\Http\Controllers\Api\Web\ProfilController::class, 'index', ['as' => 'web']]);

    Route::post('/profils', [App\Http\Controllers\Api\Web\ProfilController::class, 'store', ['as' => 'web']]);

    //route all profils index
    Route::get('/profils/all', [App\Http\Controllers\Api\Web\ProfilController::class, 'all_profils', ['as' => 'web']]);

    //route profils show
    Route::get('/profils/{slug?}', [App\Http\Controllers\Api\Web\ProfilController::class, 'show', ['as' => 'web']]);

    //route sliders
    Route::get('/sliders', [App\Http\Controllers\Api\Web\SliderController::class, 'index', ['as' => 'web']]);
});
