<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profil extends Model
{
    use HasFactory;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'slug',
        'user_id',
        'category_id',
        'waktu_kerja',
        'description',
        'address',
        'kategori',
        'posisi_usaha',
        // 'status',
        'phone',
        'email',
        'website',
        'instagram',
        'facebook',
        'tokopedia',
        'tiktok',
        'gofood',
        'grabfood',
        'shopeefood',
        'perizinan_usaha',
        'sertifikat_usaha',
        'longitude',
        'latitude',
        'status_approval'
    ];

    /**
     * user
     *
     * @return void
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * category
     *
     * @return void
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * images
     *
     * @return void
     */
    public function images()
    {
        return $this->hasMany(ProfilImage::class);
    }


    public function getPerizinanUsahaAttribute()
    {
        if (isset($this->attributes['perizinan_usaha'])) {
            return asset('storage/profils/' . $this->attributes['perizinan_usaha']);
        }
        return null;
    }

    public function getSertifikatUsahaAttribute()
    {
        if (isset($this->attributes['sertifikat_usaha'])) {
            return asset('storage/profils/' . $this->attributes['sertifikat_usaha']);
        }
        return null;
    }
}
