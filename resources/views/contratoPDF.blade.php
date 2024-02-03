<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Declaração do imóvel</title>
</head>

<header class="clearfix main-content1">
</header>

<body>
    <div id="details" class="main-content">
        <div class="invoice-container">
            <div id="invoice">
            <h3 class="siste">Arrendaaki (Contrato da casa<)</h3>
            <!--     <h5>Contrato da casa</h5> -->
            </div>
            <p  class="texto">
                Para efito de um contrato de compromisso, nós Arrendaki, 
                informamos ao senhor: {{ $nome }} que o contrato da casa com o código: {{ $contratoPDF->codigo_imovel }}, foi fechado o contrato com as seguintes propriedades
                 descrições da casa{{  $contratoPDF->descricao }}, tipologia {{  $contratoPDF->tipologiaImoveis->descricao }} , provincia
              {{  $contratoPDF->municipio->provincia->descricao }} Municipio, {{ $contratoPDF->municipio->descricao }} Endereço {{  $contratoPDF->rua_bairro }} Data inicial do contrado, {{  $contratoPDF->data_contrato   }}
                Data final do contrato {{ $contratoPDF->data_contrato_fim }} 
            </p><br/>
        </div>

            <p class="assinaturas">Assinatura do proprietario :<u> <b>{{ $contratoPDF->usuario->name}}</b></u></p>
            <p  class="assinaturas">Assinatura do Cliente: <u> <b>{{$nome}}</b></u></p>

            <div class="note">Nós confirmamos que esta declaração foi gerada pelo nosso sistema.</div>
        <div class="note">Luanda : {{ $datatime }}</div>

    </div>
</body>

</html>
<style>
    #invoice{
        font-size: 1.2rem;
        text-align: center;
    }
    .assinaturas{
        text-align: center;
    }
    .note{
        font-size: 0.6rem;
        text-align: center;
        font-weight: 100;
        color: grey;
    }
    .texto{
        text-align: justify;
        font-size: 1.1rem;

    }
</style>
