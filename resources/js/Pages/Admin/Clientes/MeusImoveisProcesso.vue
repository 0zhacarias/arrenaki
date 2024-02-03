<template>
    <Cliente>
        <v-container class="w-90 justify-space-around">
            <!-- <v-subheader class="text-h5 text-bold mt-10 ">Minhas solicitações: {{ imoveis_processos.length }}</v-subheader>  -->

            <v-row>
                <v-col cols="12" md="12" class="pa-0  mt-15 purple">
                    <v-card-actions>
                        <span class=" white--text text-bold text-h5">
                            Minhas solicitações: {{ imoveis_processos.length }}
                        </span>

                        <v-spacer></v-spacer>
                        <v-card-title>
                            <v-text-field v-model="search" append-icon="mdi-magnify" label="Pesquisar" outlined dense dark
                                single-line hide-details></v-text-field>
                        </v-card-title>
                        <!-- <v-text-field v-model="imobiliaria.pesquisar" outlined dense label="Contacto*" type="text">
                        </v-text-field> -->
                        <v-btn icon elevation="5" color="indigo" class="white" outlined rounded title="Pesquisar"
                            @click="carregarDialogimobiliaria(item)">
                            <v-icon>
                                mdi-magnify
                            </v-icon>

                        </v-btn>
                        <v-btn icon color="indigo" outlined rounded class="white" title="Emitir Relatório do processo"
                            @click="emitirRelatoriosProcesso(item)">
                            <v-icon>
                                mdi mdi-file-document-multiple
                            </v-icon>
                        </v-btn>
                    </v-card-actions>
                </v-col>
                <v-col v-for="item in imoveis_processos" :key="item.id" cols="12" sm="6" md="4"
                    :lg="imoveis_processos.length <= 2 ? 6 : 4">
                    <v-hover v-slot="{ hover }">

<v-card :loading="!loading" class=" elevation-10 pa-2 ma-3 border" :elevation="hover ? 10 : 0">
    <!-- <v-img height="150" src="/img/pexels-dids-2969915.jpg"></v-img> -->
    <v-img height="200" gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.2)" :src="'/storage/' +
        item.foto_principal"></v-img>
    <v-divider class="mx-1"></v-divider>

    <!-- <v-card-title v-text="item.designacao"></v-card-title> -->
    <v-card-text class="mb-0 pb-0 black--text text-center"> Código: {{
        item.codigo_imovel }}</v-card-text>
    <v-card-text class="mt-0 py-0 purple--text text-h4  text-center">
        {{ formatValor(item.preco) }} AKZ
    </v-card-text>
    <v-card-text class="my-0 py-0 text-center"> Tipologia:
        <span class="my-0 py-0 purple--text text-h6 text-bold"
            v-text="item.tipologia_imoveis.designacao"></span>
    </v-card-text>
    <v-card-text class="my-0 py-0 text-center"> Provincia:
        <span class="my-0 py-0 black--text" v-text="item.municipio.provincia.designacao"></span>
    </v-card-text>
    <v-card-text class="my-0 py-0 text-center"> Municipio:
        <span class="my-0 py-0 black--text" v-text="item.municipio.designacao"></span>
    </v-card-text>
    <v-card-text class="my-0 py-0 text-center"> Enderenço:
        <span class="my-0 py-0 black--text" v-text="item.rua_bairro"></span>
    </v-card-text>
    <v-card-text class="my-0 py-0 text-center"> Mobiliado:
        <span class="my-0 py-0 black--text" v-text="item.mobiliado"></span>
    </v-card-text>
    <!--          <v-card-title class="my-0 py-0 justify-content-center"> Designação:
                        <span class="my-0 py-0 black--text" v-text="item.designacao"></span>
                    </v-card-title> -->
    <v-card-text class="my-0 py-0 text-center"> Estado:
        <v-chip title="estado do imóvel" dense outlined class="white--text"
            :color="getcor(item.estado_imoveis_id)">
            <span v-if="item.estado_imoveis_id == 1" class="mdi mdi-archive-lock-open "></span>
            <span v-if="item.estado_imoveis_id == 2" class="mdi mdi-archive-remove"></span>
            <span v-if="item.estado_imoveis_id == 3" class="mdi mdi-archive-cog "></span>
            <span v-if="item.estado_imoveis_id == 4" class="mdi mdi-archive-eye"></span>
            <span v-if="item.estado_imoveis_id == 5" class="mdi mdi-archive-refresh"></span>

            {{ item.estado_imoveis.designacao }}</v-chip>
        <!--    <span class="my-0 py-0 black--text" v-text="item.estado_imoveis.designacao"></span> -->
    </v-card-text>

    <v-card-actions class="justify-end">
        <!-- <v-btn icon v-if="item.estado_imoveis_id == 4" color="indigo" outlined rounded
            title="Aprovar a visita do imóvel" @click="naoValidarProcesso(item.id)"
            v-model="validar_processo.aprovaVisita">
            <v-icon>
                mdi mdi-thumb-up-outline
            </v-icon>
        </v-btn> -->
        <v-btn v-if="user.tipo_user_id == 1 && item.estado_imoveis_id == 3" icon color="indigo"
            outlined rounded title="Validar processo do imóvel" @click="validaProcesso(item.id)">
            <v-icon>
                mdi mdi-handshake
            </v-icon>
        </v-btn>
        <v-btn v-if="user.tipo_user_id == 1 && item.estado_imoveis_id == 3" icon color="red"
            outlined rounded title="Não Validar o imóvel" @click="naoValidaProcesso(item.id)">
            <v-icon>
                mdi mdi-handshake
            </v-icon>
        </v-btn>
        <v-btn v-if="item.estado_imoveis_id == 1" icon color="deep-purple lighten-2" outlined
            rounded title="Editar Imóvel" @click="carregarDialogEditarImovel(item)">
            <v-icon>
                mdi mdi-pencil-outline
            </v-icon>
        </v-btn>
        <v-btn icon
            v-if="item.estado_imoveis_id !== 6 && item.estado_imoveis_id !== 7 && item.estado_imoveis_id !== 8"
            color="red" outlined rounded title="Remover o Imóvel" @click="deleteImovel(item)">
            <v-icon>
                mdi mdi-delete-outline
            </v-icon>
        </v-btn>
        <v-btn icon color="indigo" outlined rounded title="Emitir pdf do Imóvel"
            @click="emitirPDFAnuncio(item.id)">
            <v-icon>
                mdi mdi-file-document-multiple
            </v-icon>
        </v-btn>

    </v-card-actions>
</v-card>
</v-hover>
                </v-col>
            </v-row>
            <div class="text-center">
                <v-snackbar v-model="snackbar" :multi-line="multiLine" :timeout="8000" outlined
                    color="deep-purple accent-4">
                    {{ textvalidado }}
                    <v-btn color="indigo" text @click="snackbar = false">
                        Close
                    </v-btn>
                </v-snackbar>
            </div>
            <!-- :multi-line="multiLine" -->
            <div class="text-center">
                <v-snackbar v-model="snackbarNaovalidado" :multi-line="multiLine" :timeout="8000" outlined
                    color="deep-purple accent-4">
                    {{ textnaovalidado }}
                    <v-btn color="indigo" text @click="snackbarNaovalidado = false">
                        Close
                    </v-btn>
                </v-snackbar>
            </div>
        </v-container>
    </Cliente>
</template>

<script>
import Cliente from "../Clientes/Cliente";
export default {

    props: ["imoveis_processos"],
    components: {
        Cliente
    },
    data: () => ({
        found: false, 
        loading: null,
        snackbar: false,
        textnaovalidado: `Descontinuidade do processo da negociação do Imóvel`,
        textvalidado: `Confirmaste a continuação da negociação do Imóvel Confirmaste a continuação da negociação do Imóvel`,
        snackbarNaovalidado: false,
        validar_processo: {},
        validar_gostar: {},
        dadoscarregado: [],
    }),


    mounted() {
        this.loading = true;
        setTimeout(function () {
            this.loading = false;
        }, 2000);

        for (let i = 0; i < this.item.solicitacao_imoveis.length; i++) {
      const item = this.items[i];
      if (!this.found) {
        if (this.solicitacao.user_marca_visita !== this.user.id && this.solicitacao.imoveis_id == item.id) {
          this.found = true; // Define a variável de controle para true e quebra o loop
        }
      }
    }
        // alert(this.condominios);
    },
    computed: {
        user() {
            return this.$page.props.auth.user;
        },
    },

    created() {
        this.getcor(estado_imoveis_id)
        // this.getImoveisprocesso()
        setTimeout(() => {
            this.overlay = false;
        }, 2000);
    },

    watch: {

    },

    methods: {
        getcor(estado_imoveis_id) {
            if (estado_imoveis_id == 1) {
                return 'green'
            } else if (estado_imoveis_id == 2) {
                return 'deep-orange darken-4'
            } else if (estado_imoveis_id == 3) {
                return 'blue-grey darken-4'
            } else if (estado_imoveis_id == 4) {
                return 'yellow darken-3'
            } else if (estado_imoveis_id == 5) {
                return 'deep-purple darken-2'
            } else if (estado_imoveis_id == 6) {
                return 'red darken-4'
            } else if (estado_imoveis_id == 7) {
                return 'red darken-4'
            } else if (estado_imoveis_id == 8) {
                return 'amber accent-4'
            }
        },
        formatValor: function (atual) {
            const valorFormatado = Intl.NumberFormat("pt-br", {
                style: "currency",
                currency: "AOA",
            }).format(atual);
            const valorNumerico = valorFormatado.replace(/AOA/g, '').trim();
            return valorNumerico;
        },
        getImoveisprocesso() {
            this.loading = true;
            this.validar_processo.imovel_id = item
            axios
                .get("/carregar-imoveis-processo")
                .then((response) => {
                    this.dadoscarregado = response.data;
                    this.snackbar = true;
                    alert(JSON.stringify(response.data));
                })
                .catch(() => {
                    alert(JSON.stringify(response.data));
                });
        },
        gostarImovel(item) {
            this.loading = true;
            this.validar_gostar.imovel_id = item
            // alert(JSON.stringify( this.validar_processo));
            axios
                .post("/gostar-imovel", this.validar_gostar)
                .then((response) => {
                    this.loading = true;
                    this.snackbar = true;
                    alert(JSON.stringify(response.data));
                })
                .catch(() => {
                    alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
        },
        naogostarImovel(item) {
            this.loading = true;
            this.validar_gostar.imovel_id = item
            axios
                .post("/nao-gostar-imovel", this.validar_gostar)
                .then((response) => {
                    this.loading = true;
                    this.snackbarNaovalidado = true;
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
            location.reload();
        },
        validaVisita(item) {

            this.loading = true;
            this.validar_processo.imovel_id = item
            // alert(JSON.stringify( this.validar_processo));
            axios
                .post("/validar-processo", this.validar_processo)
                .then((response) => {
                    this.loading = true;
                    this.snackbar = true;
                    alert(JSON.stringify(response.data));
                })
                .catch(() => {
                    alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
        },
        naoValidarVisita(item) {

            this.loading = true;
            this.validar_processo.imovel_id = item
            axios
                .post("/nao-validar-processo", this.validar_processo)
                .then((response) => {
                    this.loading = true;
                    this.snackbarNaovalidado = true;
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
            location.reload();
        },
        naoAprovarImovel(item) {
            this.loading = true;
            this.validar_processo.imovel_id = item
            axios
                .post("/nao-validar-imovel", this.validar_processo)
                .then((response) => {
                    this.loading = true;
                    this.snackbarNaovalidado = true;
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
            location.reload();
        },
        aprovarImovel(item) {
            this.loading = true;
            this.validar_processo.imovel_id = item
            // alert(JSON.stringify( this.validar_processo));
            axios
                .post("/validar-imovel", this.validar_processo)
                .then((response) => {
                    this.loading = true;
                    this.snackbar = true;

                })
                .catch(() => {
                    alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
            // location.reload();
        },

        cancelarProcessoNegociacao(item) {
            this.loading = true;
            this.validar_processo.imovel_id = item
            axios
                .post("/cancelar-processo", this.validar_processo)
                .then((response) => {
                    this.loading = true;
                    this.snackbarNaovalidado = true;
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));
                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
            // location.reload();
        },
        imprirDadosImovel: function () {
            window.open(
                // alert(JSON.stringify(this.query)),
                "/pdfs/listar-pdf-funcionarios/"
            );
        },
        imprirDadosImovel(item) {
            window.open(
                "/imprimir-documentacao/" + item
            )
            // this.loading = true;
            // this.validar_processo.imovel_id = item
            // axios
            //     .post("/imprimir-documentacao", this.validar_processo)
            //     .then((response) => {
            //         this.loading = true;
            //         this.snackbarNaovalidado = true;
            //     })
            //     .catch(() => {
            //         // alert(JSON.stringify(response.data));
            //         //   console.log('Falha ao registar os dados na base de dados!...')
            //     });
            // // location.reload();
        },
        emitirRelatoriosProcesso() {
            window.open(
                "/emitir-relatorios-processo"
            )
        }

    },
};
</script>
<style></style>