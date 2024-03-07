<template>
    <PortalLayout>
        <template>
            <div class="card-carousel" @mouseover="stopTimer" @mouseleave="restartTimer">

                <div class="thumbnails">
                    <div v-for="(image, index) in  images" :key="image.id"
                        :class="['thumbnail-image', (activeImage == index) ? 'active' : '']">
                        <img :src="'/storage/' + image.foto">
                    </div>
                </div>
            </div>
        </template>
        <v-div class="deep-purple lighten-2">
            <card class="white">
                <v-row>
                    <v-col md="8" offset-md="2">

                        <v-card-text class="text-h5 ">
                            <v-divider></v-divider>

                            <p class="text-h3 text-center deep-orange--text">{{
                                formatValor(imoveis.preco) }}</p>
                            <v-card-subtitle>
                                Descrição do Imóvel: {{ imoveis.descricao }} AKZ
                            </v-card-subtitle>
                            <v-divider></v-divider>
                            <v-card class="pa-6 elevation-0 grey lighten-2">
                                <v-row>

                                    <v-col cols="6" sm="6" md="6" class="center">
                                        <span class="text-caption">Tipologia : {{imoveis.tipologia_imoveis.designacao }}</span><br />
                                        <span class="text-caption">Municipio : {{imoveis.municipio.designacao}}</span><br />
                                        <span class="text-caption">Endereço : {{imoveis.rua_bairro }}</span><br />
                                    </v-col>
                                    <v-col sm="4" md="4" class="center">
                                        <span class="text-caption">Provincia : {{imoveis.municipio.provincia.designacao }}</span><br />
                                        <span class="text-caption">Mobiliado : {{imoveis.mobiliado}}</span><br />
                                        <span class="text-caption">Estado do imóvel : {{imoveis.estado_imoveis.designacao}}</span><br />


                                    </v-col>

                                </v-row>
                            </v-card>
                            <v-row justify="space-around" class="pt-6">
                                <v-col cols="12">
                                    <v-autocomplete :disabled="imoveis.estado_imoveis_id==7 || imoveis.estado_imoveis_id==8"  :rules="required" outlined
                                        label="Tipo de contrato (Meses)" v-model="visitar.tipo_contrato" @change="getMunicipio()"
                                        name="tipo_utilizador" dense item-text="designacao" item-value="id"
                                        :items="contratos" item-color="indigo" required />
                                </v-col>
                                <v-col cols="12" v-if="visitar.tipo_contrato">
                                    <v-text-field :rules="required" placeholder="Data de nascimento*" outlined dense
                                        label="Data de inicio de contrato*" name="name" v-model="visitar.data_contrato"
                                        type="date"/>
                                </v-col>
                                <v-col cols="12">

                                    <v-btn :disabled="visitar.data_contrato==null" class="white--text" block x-large color="#FF5E00"
                                        @click="marcarVisita()">

                                        {{ 'Arrendar' }}

                                    </v-btn>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                        </v-card-text>
                    </v-col>

                </v-row>
            </card>
            <template>

                <v-row justify="space-around">
                    <v-overlay v-if="overlay">
                        <v-progress-circular indeterminate size="64"></v-progress-circular>
                    </v-overlay>
                    <template>
                        <div class="text-center">
                            <v-snackbar v-model="snackbar" :multi-line="multiLine" :timeout="4000" outlined
                                color="deep-purple accent-4">
                                {{ text }}
                                <v-btn color="indigo" text @click="snackbar = false">
                                    Close
                                </v-btn>
                            </v-snackbar>
                        </div>
                    </template>
                </v-row>
            </template>

        </v-div>
    </PortalLayout>
</template>

<script>
// import  Carousel from "../Carousel"
import PortalLayout from "../../Templates/PortalLayout";
import PortalIndex from './PortalIndex.vue';
export default {
    props: ["imoveis", 'startingImage', 'autoSlideInterval', 'showProgressBar', 'msg'],
    components: {
        PortalLayout,

    },
    data: () => ({
        rules: {
            required: (value) => !!value || "Campos obrigatório.",
        },
        selection: null,
        showPassword: false,
        isValid: true,
        overlay: false,
        rating: 4.3,
        usuario: {},
        alert: {
            text: "",
            type: ""
        },
        dialogLogin: false,

        dialogMarcarVisita: false,
        dias_data: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substring(0, 10),
        images: null,
        visitar: {
            data_visita: null,
            hora_visita: null
        },
        contratos: ['1', '3', '6',
            '12', '24'],
        //Index of the active image
        activeImage: 0,
        //Hold the timeout, so we can clear it when it is needed
        autoSlideTimeout: null,
        //If the timer is stopped e.g. when hovering over the carousel
        stopSlider: false,
        //Hold the time left until changing to the next image
        timeLeft: 0,
        //Hold the interval so we can clear it when needed
        timerInterval: null,
        //Every 10ms decrease the timeLeft
        countdownInterval: 10,
        multiLine: true,
        snackbar: false,
        text: `Obrigado por fazer a marcação responderemos o mais rápido possível..`,
        vertical: true,
        // dias_data:'',
        DatePickerFormat: 'dd/MM/yyyy',
        disabledDates: {
            to: new Date(Date.now() - 8640000)
        }
    }),

    mounted() {
        this.overlay = false
    },
    computed: {
        user() {
            return this.$page.props.auth.user;
        },
        currentImage() {
            this.timeLeft = this.autoSlideInterval;
            return this.images[this.activeImage].foto;
        },
        progressBar() {
            //Calculate the width of the progressbar
            return 100 - (this.timeLeft / this.autoSlideInterval) * 100;
        }
    },

    created() {
        // alert(this.dias_data)
        this.images = this.imoveis.fotos_imoveis
        //Check if startingImage prop was given and if the index is inside the images array bounds
        if (this.startingImage && this.startingImage >= 0
            && this.startingImage < this.images.length) {
            this.activeImage = this.startingImage;
        }

        //Check if autoSlideInterval prop was given and if it is a positive number
        if (this.autoSlideInterval
            && this.autoSlideInterval > this.countdownInterval) {
            //Start the timer to go to the next image
            this.startTimer(this.autoSlideInterval);
            this.timeLeft = this.autoSlideInterval;
            //Start countdown to show the progressbar
            this.startCountdown();
        }

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

            return valorFormatado;
        },
        nextImage() {
            var active = this.activeImage + 1;
            if (active >= this.images.length) {
                active = 0;
            }
            this.activateImage(active);
        },
        // Go backwards on the images array
        // or go at the last image
        prevImage() {
            var active = this.activeImage - 1;
            if (active < 0) {
                active = this.images.length - 1;
            }
            this.activateImage(active);
        },
        activateImage(imageIndex) {
            this.activeImage = imageIndex;
        },
        //Wait until 'interval' and go to the next image;
        startTimer(interval) {
            if (interval && interval > 0 && !this.stopSlider) {
                var self = this;
                clearTimeout(this.autoSlideTimeout);
                this.autoSlideTimeout = setTimeout(function () {
                    self.nextImage();
                    self.startTimer(self.autoSlideInterval);
                }, interval);
            }
        },
        //Stop the timer when hovering over the carousel
        stopTimer() {
            clearTimeout(this.autoSlideTimeout);
            this.stopSlider = true;
            clearInterval(this.timerInterval);
        },
        //Restart the timer(with 'timeLeft') when leaving from the carousel
        restartTimer() {
            this.stopSlider = false;
            clearInterval(this.timerInterval);
            this.startCountdown();
            this.startTimer(this.timeLeft);
        },
        //Start countdown from 'autoSlideInterval' to 0
        startCountdown() {
            if (!this.showProgressBar) return;
            var self = this;
            this.timerInterval = setInterval(function () {
                self.timeLeft -= self.countdownInterval;
                if (self.timeLeft <= 0) {
                    self.timeLeft = self.autoSlideInterval;
                }
            }, this.countdownInterval);
        },

        say() {
            this.dialogN = true
        },
        findimoveis(id) {
            window.location.href = "/portal/imovel-selecionado/" + btoa(btoa(btoa(id)));
            // alert(id);
        },
        marcarVisita() {
            this.overlay = true
            setTimeout(() => {
                this.overlay = false
                if (this.$page.props.auth.user !== null) {
                    this.visitar.imoveis_id = this.imoveis.id,
              this.$inertia.get(`/portal/arrendar-visita`, this.visitar, {
                onFinish: () => {
                    if (this.$page.props.flash.success != null) {
                        this.snackbar = true
                        this.dialogMarcarVisita = false;
                    }
                    if (this.$page.props.flash.error != null) {
                        Vue.toasted.global.defaultError({
                            msg: "" + this.$page.props.flash.error,
                        });
                    }

                },
            });
                } else {
                    window.location.href = "/login";
                }
            }, 3000)
        },
        enviarSolicitacao() {

            this.visitar.imoveis_id = this.imoveis.id,
                // alert(this.imoveis.actividade_imoveis[0].id )
                this.visitar.actividade_imoveis_id = this.imoveis.actividade_imoveis[0].id
            // this.visitar.actividade_imoveis_id=this.imovel.actividade_imoveis[0].operacao_imoveis.i
            // :href="`/portal/Solicitar-visita/${this.imovel.id}` "
            // window.location.href = "/portal/Solicitar-visita/"+this.visitar;
            this.$inertia.post("/portal/solicitar-visita/", this.visitar, {
                onFinish: () => {
                    if (this.$page.props.flash.success != null) {
                        this.snackbar = true
                        this.dialogMarcarVisita = false;
                    }
                    if (this.$page.props.flash.error != null) {
                        Vue.toasted.global.defaultError({
                            msg: "" + this.$page.props.flash.error,
                        });
                    }

                },
            });

            // window.location.href = "/portal/Solicitar-visita/" + btoa(btoa(btoa(this.imovel.id)));
            // alert(this.imovel.id);
        },

        getdados() {
            axios
                .get("/imoveis/filtrar-imoveis", {
                    params: this.query,
                })
                .then((response) => {
                    this.dadostickets = response.data.ticket.data;
                    this.mensagem_lida = response.data.ticket.resposta_count;
                    this.empresas = response.data.empresas;
                    // this.resposta_nao = response.data.resposta_nao;
                    this.funcionario_tecnicos =
                        response.data.tecnicos_projectos;
                    this.funcionario_operadores =
                        response.data.funcionario_operadores;
                    this.modulos_projectos = response.data.modulos_projectos;
                    this.last_page = response.data.ticket.last_page;
                    this.totalTicket = response.data.ticket.total;
                })
                .catch((error) => {
                    //toastr.warning('Houve uma falha ao carregar os dados!...');
                });
        },
    },
};
</script>

<style scoped>
.custom-autocomplete .v-input__control {
    background-color: #ff0000;
    /* Substitua pelo código de cor desejado */
    color: #ffffff;
    /* Substitua pelo código de cor desejado */
}

.card-carousel {
    margin-top: 0.2%;
    user-select: none;
    position: relative;
}

.progressbar {
    display: block;
    width: 100%;
    height: 5px;
    position: absolute;
    background-color: rgba(221, 221, 221, 0.25);
    z-index: 1;
}

.progressbar>div {
    background-color: rgba(255, 255, 255, 0.52);
    height: 100%;
}

.thumbnails {
    display: flex;
    justify-content: center;
    flex-direction: row;
}

.thumbnail-image {
    display: flex;
    align-items: center;
    cursor: pointer;
    padding: 15px;
}

.thumbnail-image>img {
    width: 100%;
    height: 20rem;
    padding: 3px;
    border-radius: 5%;
    transition: all 250ms;
}

.thumbnail-image:hover>img,
.thumbnail-image.active>img {
    opacity: 0.6;
    box-shadow: 2px 2px 6px 1px rgba(0, 0, 0, 0.5);
}

.card-img {
    /* position: relative;
    margin-bottom: 1px; */
    width: auto;
}

.card-img>img {
    display: block;
    margin: auto;
    height: 60vh;
}

.actions {
    font-size: 1.5em;
    height: 40px;
    position: absolute;
    top: 50%;
    margin-top: -20px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: #423397;
}

.actions>span {
    cursor: pointer;
    transition: all 250ms;
    font-size: 45px;
}

.actions>span.prev {
    margin-left: 5px;
}

.actions>span.next {
    margin-right: 5px;
}

.actions>span:hover {
    color: #eee;
}
</style>
