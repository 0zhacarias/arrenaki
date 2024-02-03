<?php

namespace App\Http\Controllers;

use App\Mail\EmailSolicitarVisitas;
use App\Models\Imoveis;
use App\Models\Pessoa;
use App\Models\SolicitarImoveis;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;
use PDF;

class SolicitarImoveisController extends Controller
{
    protected $emailFuncionario;
   public function __construct()
   {

      $this->emailFuncionario = new ActividadeImoveisController();
   }

    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SolicitarImoveis  $solicitarImoveis
     * @return \Illuminate\Http\Response
     */
    public function show(SolicitarImoveis $solicitarImoveis)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SolicitarImoveis  $solicitarImoveis
     * @return \Illuminate\Http\Response
     */
    public function edit(SolicitarImoveis $solicitarImoveis)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SolicitarImoveis  $solicitarImoveis
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SolicitarImoveis $solicitarImoveis)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SolicitarImoveis  $solicitarImoveis
     * @return \Illuminate\Http\Response
     */
    public function destroy(SolicitarImoveis $solicitarImoveis)
    {
        //
    }
    public function solicitar_visita_imovel(Request $request)
    {
      /* $funcionario=Pessoa::whereHas('usuario',function($query) {
                $query->where('tipo_user_id',1);
            })->get();
        $mensagem="O Imovel XXXXX foi solicitado uma visita pelo cliente XX";
        $solicitar_visita = SolicitarImoveis::create([
            'designacao' => $request->get('designacao'),
            'hora_visita' => $request->get('hora_visita'),
            'data_visita' => $request->get('data_visita'),
            'actividade_imoveis_id' => $request->get('actividade_imoveis_id'),
            'imoveis_id' => $request->get('imoveis_id'),
            'estado_imoveis_id' => 4,
            'user_marca_visita' => auth()->user()->id,
            
            ]);*/
        $solicitavisita = SolicitarImoveis::with('usuario_marca_visita')
            ->where('imoveis_id', $request->imoveis_id)->where('user_marca_visita', null)->first();
               $solicitavisita->create(
                ['funcionario_id' => auth()->user()->id,
                'imoveis_id'=>$request->imoveis_id]
               );
            $data_auxiliar = strtotime($request->data_contrato . "+" . $request->tipo_contrato . "months");
        $data_finalizada = date('Y-m-d', $data_auxiliar);

            $casa=Imoveis::with('usuario','tipologiaImoveis','municipio.provincia','fotosImoveis', 'condicaoImoveis', 'actividadeImoveis.operacaoImoveis', 'estadoImoveis')
            ->find($request->imoveis_id);
            $casa->update([
            'data_contrato_fim'=>$request->get('data_contrato_fim'),
            'data_contrato'=>$request->get('data_contrato'),
            'estado_imoveis_id'=>7,

            ]);
            $data['casa_selecionada']=$casa;
       
            $data['data_contrato']=$casa->data_contrato;
            $data['tipo_contrato']=$casa->tipo_contrato;
            $data['data_contrato_fim']=date('Y-m-d', $data_auxiliar);
         
        return Inertia::render('Admin/Clientes/SolicitarVisista',$data);
    }
    public function pdf_contrato($id)
    {
            $username=User::where('id',auth()->user()->id)->pluck('name')->first();
            $contrato=Imoveis::with('usuario','tipologiaImoveis','municipio.provincia','fotosImoveis', 'condicaoImoveis', 'actividadeImoveis.operacaoImoveis', 'estadoImoveis')
            ->find($id);
       // $contrato = User::where('id', $userLog->id)->get();
        $pdf = PDF::loadView('contratoPDF', [
            'contratoPDF' => $contrato,
            'nome' => $username,
            'datatime' => date('Y-m-d'),
         
            // 'quantidade_modulo_projecto'=>$quantidade,
        ]);
       
         return $pdf->stream('Contrato.pdf');
        //return $pdf->stream('Listas tipo de problemas projecto.pdf');
        # code...
    }
    public function emailValidar($solicitavisita, $mensagem)
    {
        $emailfuncionarios=[];
        foreach($solicitavisita as $funcionario ){
            $emailfuncionarios=$funcionario->email;
        }
      //  dd($emailfuncionario,$mensagem);

        $email_marca_visita = $solicitavisita->usuario_marca_visita->email;
        $nome_marca_visita = $solicitavisita->usuario_marca_visita->name;
        // Imovel
        $designacao_imovel = $solicitavisita->imovel->designacao;
        $localizacao = $solicitavisita->imovel->localizacao;
        $preco = $solicitavisita->imovel->preco;
        $condicao_imovel = $solicitavisita->imovel->condicaoImoveis->designacao;
        //Informação da visita
        $data_visita = $solicitavisita->data_visita;
        $hora_visita = $solicitavisita->hora_visita;
        $url = action([ImoveisController::class, 'portal_imovel']);
        // dd($solicitavisita);
      
        foreach($emailfuncionarios as $emailfuncionario){
             Mail::to('zhacarias50@outlook.com')->send(new EmailSolicitarVisitas(
            $mensagem,
            $nome_marca_visita,
            $url,
            $designacao_imovel,
            $localizacao,
            $preco,
            $condicao_imovel,
            $data_visita,
            $hora_visita
        ));};
    }


}