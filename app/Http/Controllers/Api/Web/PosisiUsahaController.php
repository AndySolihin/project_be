<?php

namespace App\Http\Controllers\Api\Web;

use App\Http\Controllers\Controller;
use App\Http\Resources\PosisiResource;
use App\Models\PosisiUsaha;
use Illuminate\Http\Request;

class PosisiUsahaController extends Controller
{
    public function index()
    {
        //get posisi
        $posisi = PosisiUsaha::latest()->get();

        //return with Api Resource
        return new PosisiResource(true, 'List Data posisi usaha', $posisi);
    }

}
