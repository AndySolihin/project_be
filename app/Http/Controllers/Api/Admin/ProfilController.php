<?php

namespace App\Http\Controllers\Api\Admin;

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
        //get profil
        $profils = Profil::with(['category', 'images'])->when(request()->q, function($profils) {
            $profils = $profils->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(5);

        //return with Api Resource
        return new ProfilResource(true, 'List Data Profils', $profils);
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
            'status'                 => 'required',
            'phone'                  => 'required',
            'website'                => ['nullable', new UrlWithUnderscore],
            'instagram'              => ['nullable', new UrlWithUnderscore],
            'facebook'               => ['nullable', new UrlWithUnderscore],
            'tokopedia'              => ['nullable', new UrlWithUnderscore],
            'tiktok'                 => ['nullable', new UrlWithUnderscore],
            'gofood'                 => ['nullable', new UrlWithUnderscore],
            'grabfood'               => ['nullable', new UrlWithUnderscore],
            'shopeefood'             => ['nullable', new UrlWithUnderscore],
            'perizinan_usaha'        => 'nullable',
            // 'perizinan_usaha'        => 'nullable|required|mimes:pdf|max:2000',
            'sertifikat_usaha'       => 'nullable',
            // 'sertifikat_usaha'       => 'nullable|required|mimes:pdf|max:2000',
            'latitude'               => 'required',
            'longitude'              => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        // $perizinan_usaha = $request->file('perizinan_usaha');
        // $sertifikat_usaha = $request->file('sertifikat_usaha');
        //create profil
        $profil = Profil::create([
            'title'                  => $request->title,
            'slug'                   => Str::slug($request->title, '-'),
            'user_id'                => auth()->guard('api')->user()->id,
            'category_id'            => $request->category_id,
            'waktu_kerja'            => $request->waktu_kerja,
            'description'            => $request->description,
            'address'                => $request->address,
            'status'                 => $request->status,
            'phone'                  => $request->phone,
            'website'                => $request->website ? $request->website : '',
            'instagram'              => $request->instagram ? $request->instagram : '',
            'facebook'               => $request->facebook ? $request->facebook : '',
            'tokopedia'              => $request->tokopedia ? $request->tokopedia : '',
            'tiktok'                 => $request->tiktok ? $request->tiktok : '',
            'gofood'                 => $request->gofood ? $request->gofood : '',
            'grabfood'               => $request->grabfood ? $request->grabfood : '',
            'shopeefood'             => $request->shopeefood ? $request->shopeefood : '',
            'perizinan_usaha'        => $request->perizinan_usaha ? $request->perizinan_usaha : '',
            'sertifikat_usaha'       => $request->sertifikat_usaha ? $request->sertifikat_usaha : '',
            // 'perizinan_usaha'        => $perizinan_usaha ? $perizinan_usaha->getClientOriginalName() : null,
            // 'sertifikat_usaha'       => $sertifikat_usaha ? $sertifikat_usaha->getClientOriginalName() : null,
            'latitude'               => $request->latitude,
            'longitude'              => $request->longitude,
        ]);

        //check request file
        if($request->hasFile('images')) {

            //get request file images
            $images = $request->file('images');

            //loop file image
            foreach($images as $images) {

                //move to storage folder
                $images->storeAs('public/profils', $images->hashName());

                //insert database
                $profil->images()->create([
                    'images'     => $images->hashName(),
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

        if($profil) {
            //return success with Api Resource
            return new ProfilResource(true, 'Data profil Berhasil Disimpan!', $profil);
        }

        //return failed with Api Resource
        return new ProfilResource(false, 'Data profil Gagal Disimpan!', null);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $profil = Profil::with('images')->whereId($id)->first();

        if($profil) {
            //return success with Api Resource
            return new ProfilResource(true, 'Detail Data profil!', $profil);
        }

        //return failed with Api Resource
        return new ProfilResource(false, 'Detail Data profil Tidak Ditemukan!', null);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Profil $profil)
    {
        $validator = Validator::make($request->all(), [
            'title'                  => 'required|unique:profils,title,'.$profil->id,
            'category_id'            => ['required', new CategoryExists],
            'waktu_kerja'            => 'required',
            'description'            => 'required',
            'address'                => 'required',
            'status'                 => 'required',
            'phone'                  => 'required',
            'website'                => ['nullable', new UrlWithUnderscore],
            'instagram'              => ['nullable', new UrlWithUnderscore],
            'facebook'               => ['nullable', new UrlWithUnderscore],
            'tokopedia'              => ['nullable', new UrlWithUnderscore],
            'tiktok'                 => ['nullable', new UrlWithUnderscore],
            'gofood'                 => ['nullable', new UrlWithUnderscore],
            'grabfood'               => ['nullable', new UrlWithUnderscore],
            'shopeefood'             => ['nullable', new UrlWithUnderscore],
            'perizinan_usaha'        => 'nullable|required|mimes:pdf|max:2000',
            'sertifikat_usaha'       => 'nullable|required|mimes:pdf|max:2000',
            'latitude'               => 'required',
            'longitude'              => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $perizinan_usaha = $request->file('perizinan_usaha');
        $sertifikat_usaha = $request->file('sertifikat_usaha');
        //update profil
        $profil->update([
            'title'                  => $request->title,
            'slug'                   => Str::slug($request->title, '-'),
            'user_id'                => auth()->guard('api')->user()->id,
            'category_id'            => $request->category_id,
            'waktu_kerja'            => $request->waktu_kerja,
            'description'            => $request->description,
            'address'                => $request->address,
            'status'                 => $request->status,
            'phone'                  => $request->phone,
            'website'                => $request->website ? $request->website : '',
            'instagram'              => $request->instagram ? $request->instagram : '',
            'facebook'               => $request->facebook ? $request->facebook : '',
            'tokopedia'              => $request->tokopedia ? $request->tokopedia : '',
            'tiktok'                 => $request->tiktok ? $request->tiktok : '',
            'gofood'                 => $request->gofood ? $request->gofood : '',
            'grabfood'               => $request->grabfood ? $request->grabfood : '',
            'shopeefood'             => $request->shopeefood ? $request->shopeefood : '',
            'perizinan_usaha'        => $perizinan_usaha ? $perizinan_usaha->getClientOriginalName() : null,
            'sertifikat_usaha'       => $sertifikat_usaha ? $sertifikat_usaha->getClientOriginalName() : null,
            'latitude'               => $request->latitude,
            'longitude'              => $request->longitude,
        ]);

        //check request file
        if($request->hasFile('images')) {

            //get request file images
            $images = $request->file('images');

            //loop file image
            foreach($images as $images) {

                //move to storage folder
                $images->storeAs('public/profils', $images->hashName());

                //insert database
                // $profil->images()->create([
                //     'images'     => $images->hashName(),
                //     'profil_id'  => $profil->id
                // ]);

            }
        }

        // Handle perizinan_usaha PDF upload
        if ($request->hasFile('perizinan_usaha')) {
            $perizinan_usaha = $request->file('perizinan_usaha');
            $perizinan_usaha->storeAs('public/profils', $perizinan_usaha->getClientOriginalName());
        }

        // Handle sertifikat_usaha PDF upload
        if ($request->hasFile('sertifikat_usaha')) {
            $sertifikat_usaha = $request->file('sertifikat_usaha');
            $sertifikat_usaha->storeAs('public/profils', $sertifikat_usaha->getClientOriginalName());
        }

        if($profil) {
            //return success with Api Resource
            return new ProfilResource(true, 'Data profil Berhasil Diupdate!', $profil);
        }

        //return failed with Api Resource
        return new ProfilResource(false, 'Data profil Gagal Diupdate!', null);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //find profil by ID
        $profil = Profil::findOrFail($id);

        //loop image from relationship
        foreach($profil->images()->get() as $images) {

            //remove images
            Storage::disk('local')->delete('public/profils/'.basename($images->images));

            //remove child relation
            $images->delete();

        }

        if($profil->delete()) {
            //return success with Api Resource
            return new ProfilResource(true, 'Data Profil Berhasil Dihapus!', null);
        }

        //return failed with Api Resource
        return new ProfilResource(false, 'Data Profil Gagal Dihapus!', null);
    }

        public function approve($id)
    {
        $profil = Profil::find($id);
        if ($profil) {
            $profil->status_approval = 'approved';
            $profil->save();

            return new ProfilResource(true, 'Profil Berhasil Diapprove!', $profil);
        }

        return new ProfilResource(false, 'Profil Tidak Ditemukan!', null);
    }

    public function reject($id)
    {
        $profil = Profil::find($id);
        if ($profil) {
            $profil->status_approval = 'rejected';
            $profil->delete();

            return new ProfilResource(true, 'Profil Berhasil Ditolak dan Dihapus!', null);
        }

        return new ProfilResource(false, 'Profil Tidak Ditemukan!', null);
    }

}
