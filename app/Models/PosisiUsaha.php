<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosisiUsaha extends Model
{
    use HasFactory;

    protected $table = 'posisi_usaha';
    protected $fillable = [
        'posisi_usaha', 'deskripsi', 'color'
    ];

    public function profils()
    {
        return $this->hasMany(Profil::class);
    }

}
