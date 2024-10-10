<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProfilImage extends Model
{
    use HasFactory;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'profil_id', 'images'
    ];

    /**
     * getImageAttribute
     *
     * @param  mixed $images
     * @return void
     */
    public function getImagesAttribute($images)
    {
        return asset('storage/profils/' . $images);
    }
    
}
