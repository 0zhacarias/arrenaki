<template>
    <v-app>
        <v-toolbar flat class="header1 elevation-0 py-0" color="white ">
            <v-toolbar-title><a href="/" style="text-decoration: none"><v-avatar size="40"
                        color="deep-purple darken-3"><v-icon color="white" large>home</v-icon></v-avatar>
                    <span class="deep-purple--text hidden-xs-only text-bold"> Arrendaki</span>
                </a>
            </v-toolbar-title>
    <v-spacer class=""></v-spacer>
            <v-toolbar-items>
                <v-btn
                    class="d-none d-lg-flex btn-custom-nm ml-5" color="#000"  href="/" 
                    elevation="0" text>
                    Inicio
                </v-btn>
                <v-btn @click="storePreviousUrl('/portal/listaImoveisArrendamentos')"
                    class="d-none d-lg-flex btn-custom-nm ml-5" color="#000" href="/portal/listaImoveisArrendamentos"
                    elevation="0" text>
                    Casa
                </v-btn>

                <v-btn dense v-if="user == null" @click="anuncios()" class="d-none d-lg-flex btn-custom-nm ml-5" color="#000"
                    elevation="0" text>
                    Cadastrar Casa
                </v-btn>
                <v-btn dense v-if="user !== null && user.can['Cadastrar Casa']" @click="anuncios()"
                    class="d-none d-lg-flex btn-custom-nm ml-5" color="#000" elevation="0" text>
                    Cadastrar Casas
                </v-btn>
            
            </v-toolbar-items>
           
            <v-toolbar-items>
                <v-btn v-if="user == null" class="d-none d-lg-flex btn-custom-nm ml-5" color="#000" href="/logar"  
                    elevation="0" text>
                    Login
                </v-btn>
                <v-btn v-if="user == null" class="d-none d-lg-flex btn-custom-nm ml-5 white--text" color="#7B1FA2" href="/RegistrarConta"                     
                elevation="0" >
                    Cadastra-me
                </v-btn>
                <v-btn v-if="user !== null &&  user.can['Gerir Anúncios']" class="d-none d-lg-flex btn-custom-nm ml-5"  href="/clientes/meus-anuncios"                     
                elevation="0" text>
                    Gerir casas
                </v-btn>
                <v-btn v-if="user !== null &&  user.can['Gerir Pedidos']" class="d-none d-lg-flex btn-custom-nm ml-5"  href="/clientes/meus-processo"                     
                elevation="0" text>
                    Meus pedidos
                </v-btn>
                <v-btn v-if="user !== null && user.can['Gerir Funcionario']" class="d-none d-lg-flex btn-custom-nm ml-5 "  href="/pessoa"                     
                elevation="0"  text>
                Funcionarios
                </v-btn>
                <v-btn v-if="user !== null && user.can['Gerir Relatórios']" class="d-none d-lg-flex btn-custom-nm ml-5 "  href="/clientes/permissoes"                     
                elevation="0"  text>
                    Relatório 
                </v-btn>
                <v-btn v-if="user !== null && user.can['Gerir Permissões']" class="d-none d-lg-flex btn-custom-nm ml-5 "  href="/clientes/permissoes"                     
                elevation="0"  text>
                    Permissões
                </v-btn>
                <v-btn dense class="d-none d-lg-flex btn-custom-nm ml-5 " color="#000" href="/sobre-nos" elevation="0" text>
                    Sobre Nós
                </v-btn>
                <v-btn v-if="user !== null" text href="/clientes/meu-perfil" dense class="d-none d-lg-flex btn-custom-nm ml-5 "
                    color="#000">
                    <v-icon class="mdi mdi-account-reactivate white--text" title="Perfil">

                    </v-icon>
                   perfil<br />
                    <!-- {{ user.email}} -->
                </v-btn>
               
                <v-btn class="hidden-xs-only" text v-if="user !== null" @click="logout" title="Terminar Sessão"> {{ user.name}}
                    <v-icon>mdi-export{{ }}</v-icon>
                </v-btn>
            </v-toolbar-items>
            <v-spacer class=""></v-spacer>
            <div class="hidden-sm-and-up">
                <v-menu offset-y>
                    <template v-slot:activator="{ on }">
                        <v-app-bar-nav-icon v-on="on" class="white--text"></v-app-bar-nav-icon>
                    </template>
                    <v-list class="responsiveMenu">
                        <v-list-item>
                            <v-list-item-title><router-link to="/">Inicio</router-link></v-list-item-title>
                        </v-list-item>
                        <v-list-item>
                            <v-list-item-title><router-link to="/about">Casa</router-link></v-list-item-title>
                        </v-list-item>
                        <v-list-item>
                            <v-list-item-title><router-link to="/contact">Anuciar</router-link></v-list-item-title>
                        </v-list-item>
                        <v-list-item>
                            <v-list-item-title><router-link to="/logout">sair</router-link></v-list-item-title>
                        </v-list-item>
                        <v-list-item>
                            <v-list-item-title href="/sobre-nos" ><router-link to="/sobre-nos">sair</router-link></v-list-item-title>
                        </v-list-item>
                    </v-list>
                </v-menu>
            </div>
        </v-toolbar>


        <v-main class="scroll-y pb-0" fluid>
            <!-- <v-container> -->
            <slot />
            <!-- </v-container> -->
        </v-main>
          <v-container>
                        <v-dialog transition="dialog-top-transition" v-model="dialogVerificarInformacoes" max-width="600" v-if="this.dialogVerificarInformacoes == true">
                                <v-card>
                                    <v-toolbar color="primary" dark>Opening from the top</v-toolbar>
                                    <v-card-text>
                                        <div class="text-h4 pa-12">Para poderes fazer o anúncio deves prencher alguns campos importante!!</div>
                                    </v-card-text>
                                    <v-card-actions class="justify-end">
                                        <v-btn text @click="this.dialogVerificarInformacoes.value = false">Close</v-btn>
                                        <v-btn text href="/clientes/meu-perfil" >Ir no Perfil</v-btn>
                                    </v-card-actions>
                                </v-card>
                        </v-dialog>


            <v-card-text class="text-center">
                <v-btn v-for="icon in icons" :key="icon" icon>
                    <v-icon color="#6A1B9A" size="24px">{{ icon }}</v-icon>
                </v-btn>
            </v-card-text>
            <v-card-text class="text-center">
                Kubicos é um site classificado para facilitar a compra, venda e aluguel de residências habitacionais em
                zonas u
                rbanas de Angola.
                <v-divider></v-divider>
                {{ new Date().getFullYear() }}-
                <strong>SIG-VAI
                    <span class="font-weight-light">(Sistema de Gestão de Venda e Arrendamento de Imóveis)</span>
                </strong>
            </v-card-text>

        </v-container>
    </v-app>
</template>
<script>
// import { Link } from "@inertiajs/inertia-vue";
import { required, digits, email, regex } from 'vee-validate/dist/rules'
import { extend, ValidationObserver, ValidationProvider, setInteractionMode } from 'vee-validate'
setInteractionMode('eager')

extend('digits', {
    ...digits,
    message: '{_field_} precisa de  {length} digitos e deve começar com número 9. ({_value_})',
})

extend('required', {
    ...required,
    message: 'O campo não pode estar vazio',
})
extend('regex', {
    ...regex,
    message: '{_field_} {_value_} Não compre com as restrições (990987634)',
})

extend('email', {
    ...email,
    message: 'Email invalido',
})
export default {
    props: ['provincias', 'startingImage', 'autoSlideInterval', 'showProgressBar', 'msg', 'tipoUsuario'],
    components: {
        ValidationProvider,
        ValidationObserver,
    },
    data() {
        return {
            usuario: {},
            icons: [
                "fab fa-facebook",
                "fab fa-twitter",
                "fab fa-google-plus",
                "fab fa-linkedin",
                "fab fa-instagram",
            ],
            dialogContacto: false,
            drawer: true,
            mini: true,
            totalNotificacoes: 0,

            dialogLogin: false,
            dialogVerificarInformacoes: false,
            notifications: false,
            sound: true,
            widgets: false,

            rules: {
                required: (value) => !!value || "Campos obrigatório.",
            },
            showPassword: false,
            isValid: true,
            overlay: false,

            alert: {
                text: "",
                type: ""
            },
        };
    },

    mounted() {

    },

    computed: {
        user() {
            return this.$page.props.auth.user;
        },
    },
    created() {


    },
    methods: {
        // storePreviousUrl(url) {
        // Emite um evento global com a URL
        // this.$root.$emit('store-previous-url', url);
        // },
        loginDialog() {

            this.dialogLogin = true;
        },
        anuncios() {
            if (this.$page.props.auth.user !== null) {
                if (this.user.pessoa) {
                    this.$inertia.get('/portal/imoveis').then((response) => {
                }).catch((error) => {
                    console.log(error);
  
                });
                }else{ 
                     
                   this.dialogVerificarInformacoes = true
                }

 
            } else {
                window.location.href = "/logar" ;
            }

        },

        logar() {
            this.$inertia.get("/logar").then((response) => {
                // window.location.reload();
            }).catch((error) => {
                console.log(error);
                // Tratamento de erro, se necessário
            });
            // href="/logar"
        },
        setLogin() {
            this.$inertia.post("/login", this.usuario, {
                // preserveState: true,
                // preserveScroll: true,
            });
            this.dialogLogin = false;
        },
        logout() {
            axios.post("/logout").then((response) => {
                window.location.reload();
            }).catch((error) => {
                console.log(error);
                // Tratamento de erro, se necessário
            });
        },
        perfilUsuario() {
            axios.get("/perfil-usuario").then((response) => {
                window.location.reload();
            }).catch((error) => {
                console.log(error);
                // Tratamento de erro, se necessário
            });
            // this.$inertia.post("/login", this.usuario, {});
        }
    },
};
</script>
<style>
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
