<template>
    <PortalLayout>


        <v-row align="center" justify="center">

            <v-col cols="12" md="5">

                <v-container class=" alinnharcentro">

                    <v-card align="center" justify="center" elevation="0" class="w-50 border-3">
                        <v-stepper v-model="e1">
                            <v-stepper-items>
                                <v-stepper-content step="1">
                                    <v-card elevation="0">
                                        <v-form v-model="isValid"  ref="form" lazy-validation>
                                            <h1>Login</h1>
                                            <v-row class="pa-3">
                                                Dados Pessoais
                                                <v-col cols="12">

                                                    <v-text-field :rules="[rules.required]" placeholder="Nome completo*"
                                                        outlined dense label="Nome completo*" name="name"
                                                        v-model="user.name" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                <v-col cols="12">

                                                    <v-text-field :rules="docRules" placeholder="Identidade*"
                                                        outlined dense label="Identidade*" name="name"
                                                        v-model="user.numero_identificacao" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                <v-col cols="12">

                                                    <v-text-field :rules="[rules.required]"
                                                        placeholder="Data de nascimento*" outlined dense
                                                        label="Data de nascimento*" name="name" v-model="user.data_nascimento"
                                                        type="date" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                <v-col cols="12" md="12">
                                                    <v-col cols="12">

                                                        <v-btn block color="#FF5E00" dark
                                                        @click="continuar(2, 'form')"
                                                           >
                                                            <v-icon></v-icon> Continuar
                                                          <!--   @click="e1 = 2" -->
                                                        </v-btn>
                                                    </v-col>

                                                </v-col>
                                            </v-row>
                                        </v-form>
                                    </v-card>
                                </v-stepper-content>

                                <v-stepper-content step="2">

                                        <v-form v-model="isValid" ref="form2" lazy-validation>
                                            <v-row class="pa-3">
                                                Utilizador
                                                <v-col cols="12">
                                                    <v-text-field :rules="[rules.required]" placeholder="Nome de Utilizador*" outlined
                                                        dense label="Nome de utilizador*" name="name"
                                                        v-model="user.username" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-text-field :rules="emailRules" placeholder="Email/ nº telefone*"
                                                        outlined dense label="Email ou Nº Telefone" name="email"
                                                        v-model="user.email" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-text-field :rules="passwordRules" outlined dense
                                                        id="Palavra-Passe" label="Palavra-Passe" v-model="user.password"
                                                        name="password" prepend-icon="mdi-lock" :append-icon="showPassword
                                                            ? 'mdi-eye'
                                                            : 'mdi-eye-off'
                                                            " :type="showPassword ? 'text' : 'password'
        " v-on:keyup.enter="login" @click:append="
        showPassword = !showPassword
        " required />
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-autocomplete :rules="[rules.required]" outlined id="espacotrabalho"
                                                        label="Tipo de utilizador" v-model="user.tipo_user_id"
                                                        item-value="id"
                                                        item-text="designacao"
                                                        dense
                                                        :items="tipo_utilizadores" prepend-icon="mdi-lock"
                                                        item-color="indigo" required />
                                                </v-col>
                                                    <v-col cols="12">
                                                        <v-btn block color="#FF5E00" dark
                                                        @click="continuar(3, 'form2')"
                                                          ><v-icon></v-icon> Continuar
                                                        </v-btn>
                                                        <v-btn  color="#FF5E00" dark class="my-3" icon
                                                            @click="e1 = 1"><v-icon>fa fa-arrow-left </v-icon>
                                                        </v-btn>
                                      </v-col>
                                            </v-row>
                                        </v-form>

                               </v-stepper-content>

                                <v-stepper-content step="3">

                                    <v-form v-model="isValid" ref="form3" lazy-validation>
                                            <v-row class="pa-3">
                                                Utilizador
                                                <v-col cols="12">
                                                    <v-autocomplete :rules="[rules.required]" outlined id="espacotrabalho"
                                                        label="Provincia" v-model="user.provincia_id"  @change="getMunicipio()"
                                                        name="tipo_utilizador" dense
                                                        item-text="designacao"
                                                        item-value="id"
                                                        :items="provincias" prepend-icon="mdi-lock"
                                                        item-color="deep-orange" required />
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-autocomplete :rules="[rules.required]" outlined id="espacotrabalho"
                                                        label="Município" v-model="user.municipio_id"
                                                        item-text="designacao"
                                                        item-value="id"
                                                        dense :items="municipios" prepend-icon="mdi-lock"
                                                        item-color="indigo" required />
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-text-field :rules="[rules.required]" placeholder="Bairro*" outlined
                                                        dense label="Bairro*" name="name"
                                                        v-model="user.bairro" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-text-field placeholder="Rua*" :rules="[rules.required]"
                                                        outlined dense label="Rua" name="rua"
                                                        v-model="user.rua" prepend-icon="mdi-account-circle" />
                                                </v-col>
                                                    <v-col cols="12">
                                                        <v-btn block color="#FF5E00" dark class="my-2"
                                                            @click="setLogin()"><v-icon>login</v-icon> Cadastrar
                                                        </v-btn>
                                                        <v-btn  color="#FF5E00" dark icon
                                                            @click="e1 = 2"><v-icon> fa fa-arrow-left </v-icon>
                                                        </v-btn>
                                                    </v-col>

                                            </v-row>
                                        </v-form>

                                </v-stepper-content>
                            </v-stepper-items>
                        </v-stepper>
                    </v-card>
                </v-container>
            </v-col>
            <template>

            </template>
        </v-row>
    </PortalLayout>
</template>

<script>
import PortalLayout from "../../Templates/PortalLayout";
export default {
    props:['tipo_utilizadores','provincias'],

    components: {
        PortalLayout,

    },

    data: () => ({
        alert: false,
        e1: 1,
        alertError: false,
        showPassword: false,
        isValid: true,
        overlay: false,
        getimobiliaria: false,
        getcorrector: false,
        id_provincia: {},
        municipios: {},
        user: {
            zona_trabalho: null,
            // tipo_user_id:2,
        },
        rules: {
            required: (value) => !!value || "Campos obrigatório.",
        },
        emailRules: [
            (value) => /.+@.+\..+/.test(value) || /^\d{9}$/.test(value) || "E-mail ou numero de telefone válido",
        ],
        passwordRules: [
            (value) => (!!value && value.length >=8) || "A palvra-passe de possuir no minimo 8 caracter",
        ],
        docRules: [
                (value)=>( !!value && value.length == 14 && /^\d{9}[A-Z]{2}\d{3}$/.test(value) ) || "O nº de documento não corresponde com o padrão!!!"
                        ],


        placa: ['Rangel', 'Benfica', 'Cazenga'],

        tipoImoveis: ['Imooliveira', 'AAfrica',
            'KindaHome', 'ImoBeto'],
    }),
    computed: {},

    // created() {
    //     setTimeout(() => {
    //         this.overlay = false;
    //     }, 2000);
    // },
    mounted() { },

    methods: {
        continuar(stepe, form) {
            if (this.$refs[form].validate()) {
                this.e1 = stepe;
            }
        },
        getMunicipio() {
            this.id_provincia.id = this.user.provincia_id
            axios
                .post("/portal/municipios", this.id_provincia)
                .then((response) => {
                    // this.loading = false;
                     //alert(JSON.stringify(response.data));
                    this.municipios = response.data
                })
                .catch(() => {
                    // alert(JSON.stringify(response.data));

                    //   console.log('Falha ao registar os dados na base de dados!...')
                });
        },
        setLogin() {
            // alert(this.user.tipo_user_id)
            if (this.$refs["form3"].validate()) {


            if (this.user.tipo_user_id == null) {
                this.alertError = true
            } else {
                this.$inertia.post("register", this.user, {

                });
            }
        }
            // window.sessionStorage.setItem('redirectRoute', this.$route.fullPath),

            // if(response.status === 201){
            //     this.alert(1)
            // }
            // alert(1)
        },
    },
};
</script>
<style scoped>
/* @import "vuetify/dist/vuetify.min.css"; */

/* @import "./assets/scss/_custom-variable.scss";
@import "./assets/scss/style.scss"; */
body {
    font-family: 'Poppins-Regular';
}

.alinnharcentro {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    /* Define a altura total da janela para centralizar verticalmente */
}

.linkstilo {
    text-decoration: none !important;
    color: #4527A0;

}
</style>
