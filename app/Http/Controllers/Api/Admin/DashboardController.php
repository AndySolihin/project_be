<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\User;
use App\Models\Profil;
use App\Models\Slider;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        //count categories
        $categories = Category::count();

        //count places
        $profils = Profil::count();

        //count sliders
        $sliders = Slider::count();

        //count users
        $users = User::count();

        return response()->json([
            'success'   => true,
            'message'   => 'Statistik Data',
            'data'      => [
                'categories' => $categories,
                'profils'     => $profils,
                'sliders'   => $sliders,
                'users'  => $users
            ]
        ]);
    }
}