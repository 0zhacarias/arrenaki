<template>
    <PortalLayout>
        <v-card elevation="0">
            <v-card-text>
                <v-stepper flat v-model="e1">
                    <v-stepper-header>
                        <v-stepper-step class="text-uppercase" :complete="e1 > 1" step="1">Dados do
                            Imovel</v-stepper-step>
                        <v-divider></v-divider>
                        <v-stepper-step class="text-uppercase" step="2" :complete="e1 > 2">Finalização
                            do Imóvel</v-stepper-step>
                    </v-stepper-header>
                    <v-row>
                        <v-col sm="0" md="1" lg="2"></v-col>
                        <v-col sm="12" md="9" lg="8">
                            <v-stepper-items flat>
                                <v-stepper-content step="1">
                                    <v-card class="mb-2 elevation-1" flat>
                                        <v-form ref="form" lazy-validation>
                                            <v-container>
                                                <v-row>
                                                    <v-col cols="6">
                                                        <v-card class="elevation-11">
                                                            <v-card-title>Informações da casa</v-card-title>
                                                            <v-card-actions class="pa-7">
                                                                <v-row dense class="pa-3">
                                                                    <!-- <span class="text-h6 "> Detalhes sobre o seu imóvel</span><br />
                                                    <span class="subtitle pa-2">Essas informações são importantes para
                                                        que seu anúncio apareça corretamente nas buscas dos interessados.
                                                    </span> -->
                                                                    <v-col cols="12" sm="6" md="6">
                                                                        <v-autocomplete outlined dense :rules="CampoRules"
                                                                            label="Tipo de Imovel*" v-model="imovel.categoria_imoveis_id
                                                                                " :items="tipoImoveis" item-text="designacao"
                                                                            @change="getTipologia(imovel.categoria_imoveis_id)"
                                                                            item-value="id"
                                                                            item-color="red"></v-autocomplete>
                                                                    </v-col>
                                                                    <v-col cols="12" sm="6" md="6">
                                                                        <v-autocomplete outlined dense :rules="CampoRules"
                                                                            required label="Tipologia*" v-model="imovel.tipologia_id
                                                                                " :items="tipologiaImoveis" item-text="designacao"
                                                                            item-value="id"></v-autocomplete>
                                                                    </v-col>
                                                                    <v-col cols="12" md="12">
                                                                        <v-textarea v-model="imovel.designacao"
                                                                            label="titulo do Anúcio*" outlined rows="2"
                                                                            :rules="CampoRules">

                                                                        </v-textarea>
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-autocomplete :items="this.mobiliados"
                                                                            item-value="designacao" item-text="designacao"
                                                                            v-model="imovel.mobiliado" label="Mobiliado*"
                                                                            dense outlined>

                                                                        </v-autocomplete>
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-text-field v-model="imovel.preco" type="number"
                                                                            outlined dense :rules="CampoRules"
                                                                            label="Valor a ser Arrendado do Imovel*"></v-text-field>
                                                                    </v-col>

                                                                    <v-col cols="12">
                                                                        <v-text-field v-model="imovel.iban" type="TEXT"
                                                                            outlined dense :rules="CampoRules"
                                                                            label="IBAN"></v-text-field>
                                                                    </v-col>
                                                                </v-row>
                                                            </v-card-actions>
                                                        </v-card>
                                                    </v-col>
                                                    <v-col cols="6">
                                                        <v-card class="elevation-11">
                                                            <v-card-title>Localização da casa</v-card-title>
                                                            <v-card-actions class="pa-7">
                                                                <v-row>
                                                                    <v-col cols="12">
                                                                        <v-autocomplete v-model="imovel.provincia_id" dense
                                                                            :items="this.provincias" item-value="id"
                                                                            item-text="designacao" label="Provincia**"
                                                                            @change="getMunicipio()" outlined
                                                                            :rules="CampoRules">

                                                                        </v-autocomplete>
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-autocomplete :items="this.municipios"
                                                                            item-value="id" item-text="designacao"
                                                                            v-model="imovel.municipio_id" label="Cidades*"
                                                                            dense outlined>

                                                                        </v-autocomplete>
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-text-field v-model="imovel.rua_bairro" dense
                                                                            label="Rua, Bairo" outlined type="gps">

                                                                        </v-text-field>
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-text-field v-model="imovel.numero_casa" dense
                                                                            label="Numero da casa" outlined type="text">

                                                                        </v-text-field>
                                                                    </v-col>
                                                                    <span class="text-h6">Fotos do Imóvel</span><br />
                                                                    <v-col cols="12" class="pb-10">
                                                                        <template>
                                                                            <v-file-input accept="image/*"
                                                                                label="Foto principal" outlined dense chips
                                                                                counter show-size truncate-length="4"
                                                                                v-model="imovel.foto_principal"
                                                                                :rules="CampoRules"></v-file-input>
                                                                        </template>
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <template>
                                                                            <v-file-input accept="image/*"
                                                                                label="Fotos do Imóvel 4 fotos no máximo."
                                                                                outlined chips close counter multiple
                                                                                show-size truncate-length="15" dense
                                                                                v-model="imovel.mutiplaImagem"
                                                                                :rules="CampoRules"></v-file-input>
                                                                        </template>
                                                                    </v-col>
                                                                </v-row>
                                                            </v-card-actions>
                                                        </v-card>
                                                    </v-col>
                                                </v-row>
                                                <v-row>
                                                    <v-divider></v-divider>
                                                    <v-divider></v-divider>
                                                    <v-card-actions>
                                                        <v-spacer />
                                                        <!-- <v-btn color="warning" outlined @click="e1 = 2">Voltar</v-btn> -->
                                                        <v-btn color="#6A1B9A" outlined @click="continuar(2, 'form')">
                                                            Continuar
                                                        </v-btn>
                                                    </v-card-actions>
                                                </v-row>.

                                            </v-container>
                                        </v-form>
                                    </v-card>
                                </v-stepper-content>
                                <v-stepper-content step="2">
                                    <v-card flat>
                                        <v-form ref="form4" lazy-validation>
                                            <v-container class="py-15 ma-8">
                                                <v-row dense>
                                                    <template>
                                                        <span>
                                                            <v-card-text class="text-center text-h4">Entraremos em contacto
                                                                com o senhor: <b>{{ user.name }}</b> para conferir a
                                                                veracidade do seu imóvel.</v-card-text>

                                                        </span><br />
                                                        <v-card-text class="text-center text-h6">
                                                            Ao divulgarmos as fotos e documentações iremos colocar
                                                            marca d'água no documento para proteger as informações.
                                                        </v-card-text>

                                                    </template>
                                                </v-row>
                                            </v-container>
                                        </v-form>
                                        <v-card-actions>
                                            <v-spacer />
                                            <v-btn color="warning" outlined @click="e1 = 1">Voltar</v-btn>


                                            <v-btn color="#6A1B9A" outlined @click="salvarImovel()">
                                                {{
                                                    editedIndex > -1
                                                    ? "Actualizar"
                                                    : "Guardar"
                                                }}
                                            </v-btn>
                                        </v-card-actions>
                                    </v-card>


                                </v-stepper-content>
                            </v-stepper-items>
                        </v-col>
                        <v-col sm="0" md="2" lg="2"></v-col>
                    </v-row>

                </v-stepper>

            </v-card-text>
            <template>
                <div class="text-center">
                    <v-snackbar v-model="snackbar" :multi-line="multiLine" :timeout="8000" outlined
                        color="deep-purple accent-4">
                        {{ text }}
                        <v-btn color="indigo" text @click="snackbar = false">
                            Close
                        </v-btn>
                    </v-snackbar>
                </div>
            </template>
        </v-card>
    </PortalLayout>
</template>

<script>
import PortalLayout from "../../Templates/PortalLayout";
export default {
    props: ["provincias", 'tipologiaImoveis', 'tipoImoveis', 'startingImage', 'autoSlideInterval', 'showProgressBar'],
    components: {
        PortalLayout,
    },
    data: () => ({
        multiLine: true,
        snackbar: false,
        text: `O seu anuncio foi cadastrado com sucesso`,
        vertical: true,
        qquarto: "1",
        getarrendar: false,
        getvender: false,
        getImposto: false,
        getcolaborador: false,
        getProprietario: false,
        mostrarMobiliado: false,

        mobiliados: [{
            id: 1,
            designacao: "SIM"
        },
        {
            id: 2,
            designacao: "NÃO"
        },
        ],

        tipo_regimes: [{
            id: 1,
            designacao: "2 Meses"
        },
        {
            id: 2,
            designacao: "3 Meses"
        },
        {
            id: 3,
            designacao: "6 Meses"
        },
        {
            id: 4,
            designacao: "1 Ano"
        },
        {
            id: 5,
            designacao: "2 Anos"
        },
        {
            id: 6,
            designacao: "3 Anos"
        },
        {
            id: 7,
            designacao: "4 Anos"
        },
        {
            id: 8,
            designacao: "5 Anos"
        },
        {
            id: 9,
            designacao: "10 Anos"
        },
        {
            id: 10,
            designacao: "15 Anos"
        },
        ],
        tipo_clientes: [{
            id: 1,
            designacao: "SINGULAR"
        },
        {
            id: 2,
            designacao: "EMPRESA"
        },
        ],
        loading: null,
        msg: null,
        imovel: {
            condicao_imoveis_id: null,
            colaborador_id: null,
            proprietario_id: null,
            venda_id: null,
            arrendamento_id: null,
            croquis: null,
            tituloPropriedade: null,
            localizacao: null,
            descricao: null,
            tipologia_id: null,
            categoria_imoveis_id: null,
            numero_quartos: 0,
            numero_cozinha: 0,
            numero_banheiro: 0,
            numero_garagem: 0,
            numero_andar: 0,
            numero_sala_estar: 0,
            tempo_arrendar: 0,
            metros: 0,
            designacao: null,
            rua_bairro: null,
            provincia_id: null,
            cidades: null,
            simImP: null,
            naoImP: null,
            tempo_arrendar: 0,
            quantidade_prestacoes: 0,
            // estado_nao_acabado: null,

            imposto_predial: null,
            mesa_cadeira: null,
            armario_embutido: null,
            // armario_cozinha: null,
            piscina: null,
            elevador: 0,
            rechao: 0,
            // sofa: null,

        },
        defautImovel: {
            condicao_imovel: null,
            colaborador_id: null,
            proprietario_id: null,
            venda_id: null,
            arrendamento_id: null,
            croquis: null,
            tituloPropriedade: null,
            localizacao: null,
            descricao: null,
            tipologia_id: null,
            categoria_imoveis_id: null,
            numero_quartos: 0,
            numero_cozinha: 0,
            numero_banheiro: 0,
            numero_garagem: 0,
            numero_andar: 0,
            metros: 0,
            designacao: null,
            rua_bairro: null,
            provincia: null,
            cidades: null,
            simImP: null,
            naoImP: null,
            tempo_arrendar: 0,
            quantidade_prestacoes: 0,
            // estado_nao_acabado: null,

            imposto_predial: null,
            mesa_cadeira: null,
            armario_embutido: null,
            // armario_cozinha: null,
            piscina: null,
            // sofa: null,

        },
        id_provincia: {},
        id_tipo_imovel: {},
        // items: [{
        //     text: "Início",
        //     disabled: false,
        //     href: "/home",
        // },
        // {
        //     text: "Listar Condomínios",
        //     disabled: true,
        //     href: "/",
        // },
        // ],
        e1: 1,
        steps: 3,
        editedIndex: -1,
        dialogAddimovel: false,
        municipios: null,
        morador: {},
        erros: [],
        rules: {
            required: (value) => !!value || "Campos obrigatório.",
            max: (v) => v.length == 9 || "Tem que ter 9 caracteres",
            emailMatch: () => `The email and password you entered don't match`,
        },

        CampoRules: [(value) => !!value || "Campos obrigatório."],
        emailRules: [(v) => /.+@.+\..+/.test(v) || "E-mail deve ser válido"],
        telefoneRules: [
            (v) => !!v || "Campo telefone obrigatório.",
            (v) => (v && v.length == 9) || "Tem que ter 9 caracteres",
        ],
        documentoRules: [(v) => !!v || "Campo telefone obrigatório."],
        dateNascRules: [
            (v) => !!v || "Data é Obrigatório",
            (v) =>
                v < new Date().toISOString().substr(0, 10) ||
                "Data de Nascimento deve ser Menor que a Data Actual!",
            (v) =>
                new Date().getFullYear() - new Date(v).getFullYear() >= 18 ||
                "Idade informada é Inferior a 18",
        ],
    }),

    mounted() {
        this.loading = true;
        setTimeout(function () {
            this.loading = false;
        }, 4000);
        // alert(this.imovels);
    },
    computed: {
        user() {
            return this.$page.props.auth.user;
        },
        formTitle() {
            return this.editedIndex === -1 ? "Novo Condomínio" : "Editar ";
        },
    },

    created() {
    },

    watch: {
        overlay(val) {
            val && setTimeout(() => {
                this.overlay = false
            }, 3000)
        },
    },

    methods: {

        validate() {
            this.$refs.form.validate();

            // this.$refs.form4.validate();
        },
        continuar(stepe, form) {
            if (this.$refs[form].validate()) {
                this.e1 = stepe;
            }
        },
        caracteristicas(item) {
            alert(item);
        },
        getMunicipio() {
            this.id_provincia.id = this.imovel.provincia_id
            axios
                .post("/portal/municipios", this.id_provincia)
                .then((response) => {
                    // this.loading = false;
                    // alert(JSON.stringify(this.municipos));
                    this.municipios = response.data
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));

                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
        },
        getTipologia(item) {

            this.id_tipo_imovel.id = item
            axios
                .post("/portal/tipo-tipologia", this.id_tipo_imovel)
                .then((response) => {
                    // this.loading = false;
                    // alert(JSON.stringify(this.municipos));
                    this.tipologiaImoveis = response.data
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));

                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
        },
        salvarImovel() {

            // this.loading = true;

            // alert(JSON.stringify(this.imovel)); // this.$inertia.post("/imovels", this.imovel, {});

            // axios
            //     .post("/portal/imoveis", this.imovel)
            //     .then((response) => {
            //         // this.loading = false;
            //         // alert(JSON.stringify(response.data));
            //         //   this.resposta = response.data
            //     })
            //     .catch(() => {
            //         // alert(JSON.stringify(response.data));

            //         //   console.log('Falha ao registar os dados na base de dados!...')
            //     });

            this.$inertia.post(
                "/portal/imoveis",
                this.imovel,
                {

                    onFinish: () => {
                        this.snackbar = true
                        this.imovel = Object.assign({}, this.defautImovel);
                        this.e1 = 1
                        if (this.$page.props.flash.success != null) {
                            Vue.toasted.global.defaultSuccess({
                                msg:
                                    "" + this.$page.props.flash.success,
                            });


                        }
                        if (this.$page.props.flash.error != null) {
                            Vue.toasted.global.defaultError({
                                msg: "" + this.$page.props.flash.error,
                            });
                        }

                    },

                }

            );
            this.imovel=Object.assign({}, this.defaultItem);
        },
        showDialogAddimovel() {
            this.dialogAddimovel = true;

        },


        close() {
            this.morador = {};
            this.dialogAddimovel = false;
            this.$nextTick(() => {
                this.morador = Object.assign({}, this.defaultItem);
                this.editedIndex = -1;
            });
            setTimeout(() => {
                this.overlay = false;
            }, 2000);
        },

        increaseValue() {
            var value = parseInt(document.getElementById("idquarto").value, 10);
            value = isNaN(value) ? 0 : value;
            value++;
            document.getElementById("idquarto").value = value;
        },

        decreaseValue() {
            var value = parseInt(document.getElementById("idquarto").value, 10);
            value = isNaN(value) ? 0 : value;
            value < 1 ? (value = 1) : "";
            if (value > 1) {
                value--;
            }
            document.getElementById("idquarto").value = value;
        },

        incrementquarto() {
            this.imovel.numero_quartos++;
        },
        decrementquarto() {
            if (this.imovel.numero_quartos > 0) {
                this.imovel.numero_quartos--;
            }
        },
        incrementnumero_andar() {
            this.imovel.numero_andar++;
        },
        decrementnumero_andar() {
            if (this.imovel.numero_andar > 0) {
                this.imovel.numero_andar--;
            }
        },
        incrementnumero_cozinha() {
            this.imovel.numero_cozinha++;
        },
        decrementnumero_cozinha() {
            if (this.imovel.numero_cozinha > 0) {
                this.imovel.numero_cozinha--;
            }
        },
        incrementbanheiro() {
            this.imovel.numero_banheiro++;
        },
        decrementbanheiro() {
            if (this.imovel.numero_banheiro > 0) {
                this.imovel.numero_banheiro--;
            }
        },
        decrementSalaEstar() {
            if (this.imovel.numero_sala_estar > 0) {
                this.imovel.numero_sala_estar--;
            }
        },
        incrementSalaEstar() {
            this.imovel.numero_sala_estar++;
        },

        decrementGaragem() {
            if (this.imovel.numero_garagem > 0) {
                this.imovel.numero_garagem--;
            }
        },
        incrementGaragem() {
            this.imovel.numero_garagem++;
        },
        increMentmetros() {
            this.imovel.metros++;
        },
        decrementMetros() {
            if (this.imovel.metros > 0) {
                this.imovel.metros--;
            }
        }

    },
};
</script>

<style>
.no-padding-messages .v-messages.theme--light,
.no-padding-details .v-text-field__details {
    padding: 0 !important;
    margin: 0px 0 0 0 !important;

}

;</style>
