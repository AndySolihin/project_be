<?php

namespace App\Http\Controllers\Api\Web;

use App\Models\Profil;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\ProfilResource;
use App\Rules\UrlWithUnderscore;
use App\Rules\CategoryExists;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProfilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //get profils
        $profils = Profil::with('category', 'images')->when(request()->q, function ($profils) {
            $profils = $profils->where('title', 'like', '%' . request()->q . '%');
        })->latest()->paginate(8);

        //return with Api Resource
        return new ProfilResource(true, 'List Data profils', $profils);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $profil = Profil::with('category', 'images')->where('slug', $slug)->first();

        if ($profil) {
            //return success with Api Resource
            return new ProfilResource(true, 'Detail Data Profil : ' . $profil->title, $profil);
        }

        //return failed with Api Resource
        return new ProfilResource(false, 'Data Profil Tidak Ditemukan!', null);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function all_profils()
    {
        //get profils
        $profils = Profil::with('category', 'images')->latest()->get();

        //return with Api Resource
        return new ProfilResource(true, 'List Data Profil', $profils);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title'                  => 'required|unique:profils',
            'category_id'            => ['required', new CategoryExists],
            'waktu_kerja'            => 'required',
            'description'            => 'required',
            'address'                => 'required',
            'kategori'               => 'nullable',
            'posisi_usaha'           => 'nullable',
            // 'status'                 => 'nullable',
            'phone'                  => 'required',
            'email'                  => 'nullable',
            'website'                => ['nullable', new UrlWithUnderscore],
            'instagram'              => ['nullable', new UrlWithUnderscore],
            'facebook'               => ['nullable', new UrlWithUnderscore],
            'tokopedia'              => ['nullable', new UrlWithUnderscore],
            'tiktok'                 => ['nullable', new UrlWithUnderscore],
            'gofood'                 => ['nullable', new UrlWithUnderscore],
            'grabfood'               => ['nullable', new UrlWithUnderscore],
            'shopeefood'             => ['nullable', new UrlWithUnderscore],
            'perizinan_usaha'        => 'nullable',
            'sertifikat_usaha'       => 'nullable',
            // 'perizinan_usaha'        => 'nullable|required|mimes:pdf|max:2000',
            // 'sertifikat_usaha'       => 'nullable|required|mimes:pdf|max:2000',
            'latitude'               => 'required',
            'longitude'              => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $perizinan_usaha = $request->file('perizinan_usaha');
        $sertifikat_usaha = $request->file('sertifikat_usaha');

        $perizinan_usaha_name = null;
        if ($request->hasFile('perizinan_usaha')) {
            $perizinan_usaha = $request->file('perizinan_usaha');
            $perizinan_usaha_name = $perizinan_usaha->getClientOriginalName();
            $perizinan_usaha->storeAs('public/profils', $perizinan_usaha_name);
        }

        // Handle sertifikat_usaha PDF upload
        $sertifikat_usaha_name = null;
        if ($request->hasFile('sertifikat_usaha')) {
            $sertifikat_usaha = $request->file('sertifikat_usaha');
            $sertifikat_usaha_name = $sertifikat_usaha->getClientOriginalName();
            $sertifikat_usaha->storeAs('public/profils', $sertifikat_usaha_name);
        }
        //create profil
        $profil = Profil::create([
            'title'                  => $request->title,
            'slug'                   => Str::slug($request->title, '-'),
            'user_id'                => 1,
            'category_id'            => $request->category_id,
            'waktu_kerja'            => $request->waktu_kerja,
            'description'            => $request->description,
            'address'                => $request->address,
            'kategori'               => $request->kategori,
            'posisi_usaha'           => $request->posisi_usaha,
            // // 'status'                 => $request->status,
            'email'                  => $request->email,
            'phone'                  => $request->phone,
            'website'                => $request->website ? $request->website : '',
            'instagram'              => $request->instagram ? $request->instagram : '',
            'facebook'               => $request->facebook ? $request->facebook : '',
            'tokopedia'              => $request->tokopedia ? $request->tokopedia : '',
            'tiktok'                 => $request->tiktok ? $request->tiktok : '',
            'gofood'                 => $request->gofood ? $request->gofood : '',
            'grabfood'               => $request->grabfood ? $request->grabfood : '',
            'shopeefood'             => $request->shopeefood ? $request->shopeefood : '',
            'perizinan_usaha'        => $perizinan_usaha,
            'sertifikat_usaha'       => $sertifikat_usaha,
            // 'perizinan_usaha'        => $perizinan_usaha ? $perizinan_usaha->getClientOriginalName() : null,
            // 'sertifikat_usaha'       => $sertifikat_usaha ? $sertifikat_usaha->getClientOriginalName() : null,
            'latitude'               => $request->latitude,
            'longitude'              => $request->longitude,
            // 'status_approval'        => 'pending',
        ]);

        //check request file
        // if ($request->hasFile('images')) {

        //     //get request file images
        //     $images = $request->file('images');

        //     //loop file image
        //     foreach ($images as $images) {

        //         //move to storage folder
        //         $images->storeAs('public/profils', $images->hashName());

        //         //insert database
        //         $profil->images()->create([
        //             'images'     => $images->hashName(),
        //             'profil_id'  => $profil->id
        //         ]);
        //     }
        // }
        if ($request->hasFile('images')) {
            // Get request file images
            $images = $request->file('images');
            // Loop file image
            foreach ($images as $image) {
                // Move to storage folder
                $image->storeAs('public/profils', $image->hashName());
                // Insert database
                $profil->images()->create([
                    'images'     => $image->hashName(),
                    'profil_id'  => $profil->id
                ]);
            }
        }
        // // Handle perizinan_usaha PDF upload
        // if ($request->hasFile('perizinan_usaha')) {
        //     $perizinan_usaha = $request->file('perizinan_usaha');
        //     $perizinan_usaha->storeAs('public/profils', $perizinan_usaha->getClientOriginalName());
        // }

        // // Handle sertifikat_usaha PDF upload
        // if ($request->hasFile('sertifikat_usaha')) {
        //     $sertifikat_usaha = $request->file('sertifikat_usaha');
        //     $sertifikat_usaha->storeAs('public/profils', $sertifikat_usaha->getClientOriginalName());
        // }

        if ($profil) {
            //return success with Api Resource
            return new ProfilResource(true, 'Data profil Berhasil Disimpan!', $profil);
        }

        //return failed with Api Resource
        return new ProfilResource(false, 'Data profil Gagal Disimpan!', null);
    }
}
