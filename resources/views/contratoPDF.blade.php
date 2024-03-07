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
            <h3 class="siste">Arrendaki (Contrato da casa)</h3>
            <!--     <h5>Contrato da casa</h5> -->
            </div>
            <p  class="texto">

            Recebemos a solicitação de arrendamento do sr: {{ $nome }}  para arrendar o imóvel {{ $contratoPDF->designacao }} ,localizado no munícipio de
             {{ $contratoPDF->municipio->descricao }}, com preço {{ $contratoPDF->preco }}, para que seja confirmada  aguardamos o comprovativo.
             </p>
             <p class="assinaturas">Ib an 1: <b>AO06 0000 0000 0000 0000 0000</b></p>
             <p class="assinaturas">Iban 2: <b>AO06 0000 0000 0000 0000 0000</b></p>
Arrendaki

            <br/>
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
