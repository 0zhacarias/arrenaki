@extends('layouts.app')

@section('content')
<div class="">
    <div class="row justify-content-center">
        <div class="col-md-6 ">
            <div class="alinnharcentro">
                <div class="card">
                    <div class="card-header">
                        <h5  class=" text-md-center">
                            LOGIN NO ARRENDAKI
                        </h5>
                    </div>
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="row mx-1">
                            <label for="email" class="col-md-12 col-form-label">{{ __('Email Address') }}</label>

                            <div>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mx-1">
                            <label for="password" class="col-md-12 col-form-label">{{ __('Password') }}</label>

                            <div class="col-md-12">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password"  placeholder="Palavra-Passe">

                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>

                     <!--    <div class="row mb-3">
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div> -->

                        <div class="row mb-0 mx-1">
                            <div class="d-grid gap-2 ">
                                <button type="submit" class="btn btn-danger">
                                    {{ __('Login') }}
                                </button>

                             <!--    @if (Route::has('password.request'))
                                <a class="btn btn-link" href="{{ route('password.request') }}">
                                    {{ __('Forgot Your Password?') }}
                                </a>
                                @endif -->
                            </div>
                        </div>
                    </form>
                    <div class="card-body">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--    <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div class="row mx-3">
                                <div>
                                <label for="password" class="col-md-4 col-form-label">{{ __('Email') }}</label>

                                    <input id="email" class="form-control" placeholder=" Email " type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mx-3">
                                <label for="password" class="col-md-4 col-form-label">{{ __('Password') }}</label>
                                <div class="col-md-12">
                                    <input id="password" placeholder="Palavra-Passe" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                    @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="d-grid gap-2 mt-3">
                                    <button class="btn btn-danger" type="submit">{{ __('Login') }}</button>

                                </div>
                        </form> -->
@endsection
<style scoped>
    body {
        font-family: 'Poppins-Regular';
    }

    .alinnharcentro {
        display: flex;
        align-items: center;
        justify-content: center;
        /* Define a altura total da janela para centralizar verticalmente */
    }

    .linkstilo {
        text-decoration: none !important;
        color: #4527A0;

    }
</style>
