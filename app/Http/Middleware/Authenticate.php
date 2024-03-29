<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return route('indexs');
        }
    }
    //REPLICANDO A FUNÇÃO REDIRECTTO E USANDO A VARIAVEL PERFIL PARA OMPREENDER O REDIRECIONAMENTO.
    protected function redirectPe($request)
    {
        if (! $request->expectsJson()) {
            return route('index');
        }
    }
}
