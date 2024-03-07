<?php

namespace App\Http\Controllers;

use App\Models\ArrendarImoveis;
use App\Models\Imoveis;
use App\Models\Municipios;
use App\Models\Provincias;
use App\Models\TipoImoveis;
use App\Models\Tipologia;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use PDF;

class ArrendarImoveisController extends Controller
{
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
     * @param  \App\Models\ArrendarImoveis  $arrendarImoveis
     * @return \Illuminate\Http\Response
     */
    public function show(ArrendarImoveis $arrendarImoveis)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ArrendarImoveis  $arrendarImoveis
     * @return \Illuminate\Http\Response
     */
    public function edit(ArrendarImoveis $arrendarImoveis)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ArrendarImoveis  $arrendarImoveis
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ArrendarImoveis $arrendarImoveis)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ArrendarImoveis  $arrendarImoveis
     * @return \Illuminate\Http\Response
     */
    public function destroy(ArrendarImoveis $arrendarImoveis)
    {
        //
    }
    public function arrendar_imovel(Request $request)
    {
        if (auth()->user()) {

            $data_auxiliar = strtotime($request->data_contrato . "+" . $request->tipo_contrato . "months");
            $data_finalizada = date('Y-m-d', $data_auxiliar);

            $casa = Imoveis::with('usuario', 'tipologiaImoveis', 'municipio.provincia', 'fotosImoveis', 'condicaoImoveis', 'actividadeImoveis.operacaoImoveis', 'estadoImoveis')
                ->find($request->imoveis_id);
                if($casa->estado_imoveis_id !=8){
                    $solicitavisita = ArrendarImoveis::create(
                [
                    'user_marca_visita' => auth()->user()->id,
                    'imoveis_id' => $request->imoveis_id
                ]
            );
            $casa->update([
                'data_contrato_fim' => $request->get('data_contrato_fim'),
                'data_contrato' => $request->get('data_contrato'),
                'estado_imoveis_id' => 8,
            ]);
            $data['casa_selecionada'] = $casa;
            $data['data_contrato'] = $casa->data_contrato;
            $data['tipo_contrato'] = $casa->tipo_contrato;
            $data['data_contrato_fim'] = date('Y-m-d', $data_auxiliar);
            return Inertia::render('Admin/Clientes/SolicitarVisista', $data);
                }else{

                }


        }else{

            $dados['provincias'] = Provincias::all();
        $dados['municipios'] = Municipios::all();
        $dados['tipologiaImoveis'] = Tipologia::all();
        $dados['tipoImoveis'] = TipoImoveis::all();
        // $dados['novos_imoveis']=Imoveis::with('fotosImoveis','condicaoImoveis','actividadeImoveis.operacaoImoveis','estadoImoveis')->orderBy('created_at','desc')->get();
        // $dados['mais_proximos']=Imoveis::with('fotosImoveis','condicaoImoveis','actividadeImoveis.operacaoImoveis','estadoImoveis')->get();
        // // dd($dados);
        return Inertia::render('Portal/PortalIndex', $dados);
        }
    }
    public function pdf_contrato($id)
    {
        $username = User::where('id', auth()->user()->id)->pluck('name')->first();
        $contrato = Imoveis::with('usuario', 'tipologiaImoveis', 'municipio.provincia', 'fotosImoveis', 'condicaoImoveis', 'actividadeImoveis.operacaoImoveis', 'estadoImoveis')
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
}
