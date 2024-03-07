<template>
    <PortalLayout>


        <v-container class=" alinnharcentro">

            <v-card align="center" justify="center" elevation="0" class="w-50">

                <v-card-text class="text-h3">Arrendaki</v-card-text>
                <v-card-text fluid class="justify-center">
                    <v-form v-model="isValid">
                        <v-row class="justify-center">
                            <v-col cols="12">
                                <v-text-field :rules="[rules.required]" placeholder="Email ou telefone" outlined
                                    dense label="Email" name="email" v-model="user.email"
                                    prepend-icon="mdi-account-circle" />
                            </v-col>
                            <v-col cols="12">
                                <v-text-field :rules="[rules.required]" outlined dense id="password" label="Palavra-Passe"
                                    v-model="user.password" name="password" prepend-icon="mdi-lock" :append-icon="showPassword
                                        ? 'mdi-eye'
                                        : 'mdi-eye-off'
                                        " :type="showPassword ? 'text' : 'password'
        " v-on:keyup.enter="login" @click:append="
        showPassword = !showPassword
        " required />
                            </v-col>
                            <v-col>

                            <v-alert outlined dismissible transition="scale-transition" text v-if="alert.type == 'success'"
                                type="success">
                                {{ alert.text }}
                            </v-alert>
                            <v-alert dismissible transition="scale-transition" outlined v-if="alert.type == 'error'"
                                type="error">
                                {{ $message}}
                            </v-alert>

                            <v-btn block color="#FF5E00" dense dark x-large @click="setLogin()" >
                                <v-icon>login</v-icon> Iniciar
                                Sessão
                            </v-btn>
                            </v-col>
                            <div v-if="errors.length > 0">
            <ul>
                <li v-for="error in errors" :key="error">{{ error }}</li>
            </ul>
        </div>
                            <v-col cols="12" md="12">
                                <div >
                    <p class="ml-4 pb-1 subtitle">
                        <a href="/reset-password" class="linkstilo">
                            Esqueci a minha senha!</a><br />
                        Não possui uma conta?<a href="/RegistrarConta" class="linkstilo">
                            Cadastra AQUI!</a>
                    </p>
                </div>
                            </v-col>
                        </v-row>
                    </v-form>
                </v-card-text>

            </v-card>
        </v-container>

    </PortalLayout>
</template>

<script>
import PortalLayout from "../../Templates/PortalLayout";
// import GoogleLogin from 'Vue-google-login';
export default {

    components: {
        PortalLayout,
        // GoogleLogin
    },

    data: () => ({
        // authUrl: '$authUrl', // Substitua $authUrl pelo valor real
        // linkText: "Login google",
        alert: {
            text: "",
            type: ""
        },
        errors: [],
        showPassword: false,
        isValid: true,
        overlay: false,
        user: {},
        previousUrls: [],
        rules: {
            required: (value) => !!value || "Campos obrigatório.",
        },
        params: {
            client_id: "390506223983-2km69qu9r8v3o9fu8mt5vqpgudpqgf9n.apps.googleusercontent.com"
        },
        // only needed if you want to render the button with the google ui
        renderParams: {
            width: 250,
            height: 50,
            longtitle: true
        },
    }),
    computed: {},

    created() {
        // setTimeout(() => {
        //     this.overlay = false;
        // }, 2000);
        // alert(JSON.stringify(response.data))
        // alert(JSON.stringify($root.$on('store-previous-url', this.storePreviousUrl)))
        this.$root.$on('store-previous-url', this.storePreviousUrl);
    },
    mounted() { },

    methods: {
        loginWithGoogle() {
            // Redirecionar para a rota de login do Laravel
            window.location.href = '/login/google';
        },
        onSuccess(googleUser) {
            console.log(googleUser);

            // This only gets the user information: id, name, imageUrl and email
            console.log(googleUser.getBasicProfile());
        },
        storePreviousUrl(url) {
            // Adiciona a nova URL à frente do array
            this.previousUrls.unshift(url);
            // alert(url);
            // Garante que o array tenha no máximo duas URLs armazenadas
            if (this.previousUrls.length > 2) {
                this.previousUrls.pop(); // Remove a URL mais antiga
            }
        },
        async  setLogin() {
            try {
                const { data } = await this.$inertia.post('/login', this.user);
                this.$inertia.visit(data);

               alert(1)
                // Redirecionar para a página de dashboard após o login bem-sucedido
                //this.$inertia.visit(data);
            } catch (error) {
                if (error.response.status === 422) {
                    this.error = error.response.data.errors.email[0];
                } else {
                    this.error = 'Ocorreu um erro durante o processo de login. Por favor, tente novamente.';
                }
                }
            }
          /*  this.$inertia.post(
                "/login", this.user,
                        {
                        }

                    );
*/
        //    this.$inertia.post("/login", this.user, {});

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
    /* Define a altura total da janela para centralizar verticalmente */
}

.linkstilo {
    text-decoration: none !important;
    color: #4527A0;

}
</style>
