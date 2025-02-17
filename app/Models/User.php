<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

     /**
     * sliders
     *
     * @return void
     */
    public function sliders()
    {
        return $this->hasMany(Slider::class);
    }

    /**
     * categories
     *
     * @return void
     */
    public function categories()
    {
        return $this->hasMany(Category::class);
    }

    /**
     * places
     *
     * @return void
     */
    public function profils()
    {
        return $this->hasMany(Profil::class);
    }

    /**
    * @return \Illuminate\Database\Eloquent\Relations\HasMany
    */
    // public function socialAccounts()
    // {
    // return $this->hasMany(SocialAccount::class);
    // }
}
