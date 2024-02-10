<template>
    <PortalLayout>

        <template class="pb-0 ">

            <v-toolbar-title class="darken-3 elevation-0 ">
                <v-img gradient="to top right, rgba(55,5,201,.1), rgba(25,32,72,.6)"
                    :style="'white-space:nowrap; padding:0;max-width: 100%;height:75vh; position:relative;top:10px;'"
                    src="/img/angola.jpg">
                    <v-row class="p-0">
                        <v-col cols="12" sm="2" md="2" :style="' white-space:nowrap; padding:0; '">
                        </v-col>
                        <v-col cols="12" sm="10" md="10" class="container--fluid">
                            <v-card elevation="0" color="transparent" class="white--text textotela pt-15 center">

                                <h1 class="text-h1 my-6 py-6 "> Encontre a casa que você deseja</h1>
                                <p class="text-h2 my-6 text-center mb-12" >Arrende conosco.</p>
                                <v-btn color="#FF5E00 " class="white--text center py-6 ">
                                    Arrendar agora
                                </v-btn>
                            </v-card>
                        </v-col>

                    </v-row>
                </v-img>
            </v-toolbar-title>
        </template>
        <!-- Lançamentos mais recentes -->
        <template>
            <v-container>
                <v-row no-gutters justify="pt-15" :style="'justify-content: center;'" class="pt-14">
                    <v-card-text class="center text-h6 px-12">

                        <span class="">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione voluptate doloremque neque
                            facilis doloribus
                            sint aliquid dolorem rem optio inventore nobis eaque quasi molestiae, quos architecto quod
                            laboriosam, esse amet.</span>
                    </v-card-text>
                    <v-col v-for="item in novos_imoveis" :key="item.id" cols="12" sm="12" md="6" lg="6"
                        :style="'max-width: min-content;'" >
                        <v-hover v-slot="{ hover }">

                            <v-card class="mx-5 my-12 elevation-10" max-width="420" @click="findImoveis(item.id)"
                                :elevation="hover ? 10 : 1">
                                <v-img height="250" :src="'/storage/' + item.foto_principal"></v-img>
                              <!--   <v-card-text class="mb-0 pb-0 black--text center"> Código: {{ item.codigo_imovel }}</v-card-text> -->
                                <v-card-text class="mt-0 py-0 deep-orange--text text-h4  center">
                                    {{ formatValor(item.preco) }} AKZ
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Tipologia:
                                    <span class="my-0 py-0 deep-orange--text" v-text="item.tipologia_imoveis.designacao"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Provincia:
                                    <span class="my-0 py-0 black--text" v-text="item.municipio.provincia.designacao"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Municipio:
                                    <span class="my-0 py-0 black--text" v-text="item.municipio.designacao"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Enderenço:
                                    <span class="my-0 py-0 black--text" v-text="item.rua_bairro"></span>
                                </v-card-text>
                                <v-card-text class="my-0 py-0 center"> Mobiliado:
                                    <span class="my-0 py-0 black--text" v-text="item.mobiliado"></span>
                                </v-card-text>


                                <v-card-text class="my-0 py-0 center" > Estado:
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
                                <v-card-text>
                                    <v-btn class="ml-auto white--text " block  dense color="#FF5E00" @click="marcarVisita()">
                                        Detalhes

                                    </v-btn>
                                </v-card-text>
                                <v-divider class="mx-4"></v-divider>
                            </v-card>
                        </v-hover>
                    </v-col>
                    <v-row class="mb-10" justify="end">
<!--                         <v-col cols="7">

                        </v-col> -->
                        <v-spacer />
                        <v-col cols="5">
                            <v-pagination @input="paginacao(page)" color="#FF5E00" v-model="page" :length="last_page" circle></v-pagination>
                        </v-col>
                    </v-row>

                </v-row>
            </v-container>
        </template>

    </PortalLayout>
</template>

<script>
import AdminLayout from "../../Templates/AdminLayout";
import PortalLayout from "../../Templates/PortalLayout";
export default {
    props: ['startingImage', 'autoSlideInterval', 'showProgressBar'],

    components: {
        AdminLayout,
        PortalLayout,
    },
    data: () => ({
        page: 1,
        pageProximo: 1,
        last_page: 1,
        last_page_proximo: 1,
        total_imoveis_proximos: 1,
        provincias: [],
        tipo_imoveis: [],
        total_tmoveis: 0,
        novos_imoveis: [],
        mais_proximos: [],
        filtrar: {},
        valid: true,
        name: "",
        overlay: false,

        nameRules: [
            (v) => !!v || "Name is required",
            (v) =>
                (v && v.length <= 10) || "Name must be less than 10 characters",
        ],
        email: "",
        emailRules: [
            (v) => !!v || "Email é obrigatório!",
            (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
        ],
        message: "",
        messageRules: [
            (v) => !!v || "Mensagem é obrigatório!",
            (v) => (v && v.length >= 10) || "Deve conter mais de 10 caracteres",
        ],

    }),
    watch: {
        overlay(val) {
            val && setTimeout(() => {
                this.overlay = false
            }, 3000)
        },
    },
    mounted() { },
    created() {
        this.paginacao()
        this.paginacaoImovelProximo()
        this.getcor(estado_imoveis_id)

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
        findImoveis(id) {
            this.overlay = true
            setTimeout(() => {
                this.overlay = false
                window.location.href = "/portal/imovel-selecionado/" + btoa(btoa(btoa(id)));
            }, 2000)
        },
        findImoveisProvincia(id) {
            this.overlay = true
            setTimeout(() => {
                this.overlay = false
                window.location.href = "/portal/imoveis-provincia/" + id;
            }, 2000)

        },
        FiltrarImoveis() {
            this.overlay = true
            setTimeout(() => {
                this.overlay = false
                this.$inertia.get("/portal/filtrar-imoveis-portal", this.filtrar, {});
                // window.location.href = "/portal/filtra-imoveis-portal/" + this.filtrar;
            }, 2000)
            // window.location.href = "/portal/imoveis-provincia/" + id;
        },
        validate() {
            if (this.$refs.form.validate()) {
                this.snackbar = true;
            }
        },
        // reset() {
        //     this.$refs.form.reset();
        // },
        paginacao(page = 1) {
            axios
                .get("/portal/imoveisPaginacao?page=" + page, {
                })
                .then((response) => {
                    // alert(JSON.stringify(response.data.data))
                    this.novos_imoveis = response.data.novos_imoveis.data;
                    this.last_page = response.data.novos_imoveis.last_page;
                    this.total_imoveis = response.data.novos_imoveis.total;
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        paginacaoImovelProximo(pageProximo = 1) {
            axios
                .get("/portal/imoveisProximoPaginacao?page=" + pageProximo, {
                })
                .then((response) => {
                    // alert(JSON.stringify(response.data.data))

                    this.mais_proximos = response.data.mais_proximos.data;
                    this.last_page_proximo = response.data.mais_proximos.last_page;
                    // this.total_imoveis_proximos = response.data.mais_proximos.total;
                    this.provincias = response.data.provincias;
                    this.tipo_imoveis = response.data.tipo_imoveis;

                })
                .catch((error) => {
                    console.log(error);
                });
        },
    },
    computed: {
        user() {
            return this.$page.props.auth.user;
        },
        col() {
            switch (this.$vuetify.breakpoint.name) {
                case "xs":
                    return 12;
                case "sm":
                    return 6;
                case "md":
                    return 3;
                case "lg":
                    return 3;
                case "xl":
                    return 3;
            }
        },

    },
};
</script>

<style>
table {
    font-weight: bolder;
}

.container {
    position: relative;
}

 .center {
  text-align: center;
}
.borda-white {
    border: 2px solid rgb(255, 255, 255)
}

.imoveisListado {
    background-image: linear-gradient(to bottom right, #0077c2, #0093ff);
    margin: 0;

}

.Centralizar-linha {
    /* display: flex; */
    align-items: center;
    justify-content: center;
    color: aliceblue;
    font-size: 2rem;
    /* max-width: max-content; */

}

/* div.container6 p {
  margin: 0 } */
.circulo {
    border-bottom-right-radius: 10px;
    /* background-image:linear-gradient(to bottom right, #0077c2, #0093ff) */
}

@media(max-width: 768px) {
    .textotela>h1 {
        color: #6943af;
        padding: 5%;
        font-size: 3.5rem;
    }

    .textotela>h2 {
        padding-left: 5%;
        font-size: 1srem;
    }

    .textotela>p {
        padding-left: 5%;
        font-size: 1px !important;
    }

    .tamanhotela {
        display: none;

    }

    .imagens {
        border-radius: 0px 0px 0px 20px;
        height: 70vh;
        /* border-radius: 0px 0px 0px 100px; */
        /* display: none; */
    }
}

;

@media(min-width: 769px) and (max-width: 1024px) {

    .imagens {
        border-radius: 0px 0px 0px 350px;
        height: 70vh;
        /* border-radius: 0px 0px 0px 100px; */
        /* display: none; */
    }
}

;

@media(min-width: 1025px) {

    .imagens {
        border-radius: 0px 0px 0px 350px;
        height: 70vh;
        /* border-radius: 0px 0px 0px 100px; */
        /* display: none; */
    }
}

;</style>
