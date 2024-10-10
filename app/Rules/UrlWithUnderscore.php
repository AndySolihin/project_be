<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class UrlWithUnderscore implements Rule
{
    public function passes($attribute, $value)
    {
        // Add your custom URL validation logic here
        return preg_match('~^https?://(?:[a-z0-9-]+(\.[a-z0-9-]+)*|\d{1,3}(?:\.\d{1,3}){3})(?::\d+)?(?:/.*)?$~i', $value);
    }

    public function message()
    {
        return 'The :attribute format is invalid.';
    }
}
