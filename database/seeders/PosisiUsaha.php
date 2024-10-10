<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PosisiUsaha extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $csvFile = database_path('seeders\csv\posisi_usaha.csv'); // Tentukan jalur ke file CSV Anda

        $csvData = array_map('str_getcsv', file($csvFile));

        $header = array_shift($csvData); // Mengambil header

        foreach ($csvData as $row) {
            $data = array_combine($header, $row);

            DB::table('posisi_usaha')->insert([
                'posisi_usaha' => $data['posisi_usaha'], 
                'deskripsi' => $data['deskripsi'], 
                'color' => $data['color'], 
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
