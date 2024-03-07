<template>
<PortalLayout>

  <v-container>
    <v-row align="center" justify="center">

<v-col cols="12" md="5">

    <v-container class=" alinnharcentro">

        <v-card align="center" justify="center" elevation="0" class="w-75 border-3">
            <v-img height="250" :src="'/storage/' + casa_selecionada.foto_principal"></v-img>
                                <v-card-text class="mt-0 py-0 deep-orange--text text-h4  center">
                                    {{ formatValor(casa_selecionada.preco) }} AKZ
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Tipologia:
                                    <span class="my-0 py-0 deep-orange--text" v-text="casa_selecionada.tipologia_imoveis.designacao"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Provincia:
                                    <span class="my-0 py-0 black--text" v-text="casa_selecionada.municipio.provincia.designacao"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Municipio:
                                    <span class="my-0 py-0 black--text" v-text="casa_selecionada.municipio.designacao"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Enderenço:
                                    <span class="my-0 py-0 black--text" v-text="casa_selecionada.rua_bairro"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Mobiliado:
                                    <span class="my-0 py-0 black--text" v-text="casa_selecionada.mobiliado"></span>
                                </v-card-text>
                             <!--    <v-card-title class="my-0 py-0 justify-content-center" > Designação:
                                    <span class="my-0 py-0 black--text" v-text="casa_selecionada.designacao"></span>
                                </v-card-title> -->
                                <v-divider></v-divider>
                                <v-card-text class="my-0 py-0 justify-content-center" > Data Inicial de contrato:
                                    <span class="my-0 py-0 black--text" v-text="data_contrato"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 justify-content-center" > Data final de contrato:
                                    <span class="my-0 py-0 black--text" v-text="data_contrato_fim"></span>
                                </v-card-text>
                                <v-card-text>
                                    <v-btn class="ml-auto white--text " block  dense color="#FF5E00" @click="imprimirContrato()">
                                        Imprimir recibo

                                    </v-btn>
                                </v-card-text>
                                <v-divider class="mx-4"></v-divider>
        </v-card>
    </v-container>
</v-col>
<template>

</template>
</v-row>
  </v-container>



</PortalLayout>
</template>

<script>
import PortalLayout from "../../../Templates/PortalLayout";
//import AdminLayout from "../../../Templates/AdminLayout";
// import Perfil from "../Clientes/Perfil";
// import PerfilCliente from "../Clientes/PerfilCliente";
export default {
    props: ["casa_selecionada",'data_contrato_fim','data_contrato'],
    components: {
        //AdminLayout,
        PortalLayout,
    },
    data: () => ({
        dados_casa:{},
    }),

    computed: {
        user() {
            return this.$page.props.auth.user;
        },

    },

    created() {
        setTimeout(() => {
            this.overlay = false;
        }, 2000);
    },

    watch: {
        steps(val) {
            if (this.e1 > val) {
                this.e1 = val;
            }
        },
    },

    methods: {
        initialize() { },
        imprimirContrato(){
            this.dados_casa.id=this.casa_selecionada.id
            this.dados_casa.data_contrato=this.data_contrato
            this.dados_casa.data_contrato_fim=this.data_contrato_fim
            window.open(
                "/pdf-contrato/"+ this.casa_selecionada.id
            );
          //  this.$inertia.get(`/pdf-contrato`, this.dados_casa);
        },
        formatValor: function (atual) {
            const valorFormatado = Intl.NumberFormat("pt-br", {
                style: "currency",
                currency: "AOA",
            }).format(atual);

            return valorFormatado;
        },
    },
};
</script>
<style>
.item-selected {
  background-color: #885cda;
}
</style>
