<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Municipios extends Model
{
    use HasFactory,SoftDeletes;
    protected $table="municipios";
    protected $guarded=['id'];
    public function provincia() {
        return $this->belongsTo(Provincias::class,'provincia_id');
    }
}
