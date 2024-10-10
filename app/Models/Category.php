<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'name', 'slug', 'images'
    ];

    /**
     * profils
     *
     * @return void
     */
    public function profils()
    {
        return $this->hasMany(Profil::class);
    }

    /**
     * getImageAttribute
     *
     * @param  mixed $image
     * @return void
     */
    public function getImageAttribute($images)
    {
        return asset('storage/categories/' . $images);
    }
}