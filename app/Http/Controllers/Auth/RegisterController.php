<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Imobiliaria;
use App\Models\Pessoa;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    //REPLICANDO A FUNÇÃO REDIRECTTO E USANDO A VARIAVEL PERFIL PARA OMPREENDER O REDIRECIONAMENTO.
    // protected $redirectPe = RouteServiceProvider::PERFIL;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
       // dd($data);
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            // 'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
            'tipo_user_id' => ['required'],
        ]);
    }
    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        $bairro_rua=$data['bairro']. $data['rua'];
        //dd( $bairro_rua);
        if(is_numeric($data['email'])){

            $user = User::create([
                'name' => $data['name'],
                'telefone' => $data['email'],
                'username' => $data['username'],
                'tipo_user_id' => $data['tipo_user_id'],
                'password' => Hash::make($data['password']),
            ]);

            Pessoa::create([
                'nome'=>$data['name'],
                'sobre_nome'=>$data['name'],
                'numero_telefone' => $data['email'],
                'user_id'=>$user->id,
                'bairro'=>$bairro_rua,
            ]);
        }else{
            $user = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'username' => $data['username'],
                'tipo_user_id' => $data['tipo_user_id'],
                'password' => Hash::make($data['password']),
            ]);
            // dd($user,$user->assignRole('Funcionario'));
            Pessoa::create([
                'nome'=>$data['name'],
                'sobre_nome'=>$data['name'],
                'email' => $data['email'],
                'user_id'=>$user->id,
                'bairro'=>$bairro_rua,

            ]);
        };

       if($data['tipo_user_id']== 1){
        $user->assignRole('Funcionario');

       }elseif ($data['tipo_user_id']== 2) {
        $user->assignRole('Locatario');

       }elseif ($data['tipo_user_id']== 3) {
        $user->assignRole('Proprietários');
       }else{
        $user->assignRole('Locatario');
       }

        return $user;

    }

}
