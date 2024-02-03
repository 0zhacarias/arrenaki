<template>
  <PortalLayout>
    <v-row>
      <v-col cols="12" sm="0" md="2" lg="1">

      </v-col>
      <v-col cols="12" sm="12" md="8" lg="10">
        <v-main>
          <slot align="center" justify="center" />
        </v-main>
      </v-col>
      <v-col cols="12" sm="0" md="2" lg="1">

</v-col>
    </v-row>
  </PortalLayout>
</template>

<script>
import PortalLayout from "../../../Templates/PortalLayout";

export default {
  props: ["meus_imoveis", "imoveis_processos", "cliente","provincias"],
  components: {
    PortalLayout,
  },
  data: () => ({
    items: [{
      text: "Início",
      disabled: false,
      href: "/home",
    },
    {
      text: "Listar Moradores",
      disabled: true,
      href: "/",
    },
    ],
    e1: 1,
    steps: 3,
    editedIndex: -1,
    dialogNovoCadastro: false,
    linhaSelecionado: null,
    meusDados: 1,
    meusAnuncios: 2,
    imoveisProcesso: 3,
    meusPagamentos: 4,
    selectedItem: null,
    items: [
      { text: 'Real-Time', icon: 'mdi-clock' },
      { text: 'Audience', icon: 'mdi-account' },
      { text: 'Conversions', icon: 'mdi-flag' },
    ],
  }),

  computed: {
    user() {
      return this.$page.props.auth.user;
    },
    formTitle() {
      return this.editedIndex === -1 ? "Novo Cadastro" : "Editar ";
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

    novo_registo() {
      this.dialogNovoCadastro = true;
    },
    meuPerfil() {
      alert(1);
    },
    selectItem(item) {
      this.linhaSelecionado = item;
      //   alert(item)
    },
    continuar(stepe, form) {
      if (this.$refs[form].validate()) {
        this.e1 = stepe;
      }
    },
    continuar2(stepe, form) {
      if (this.$refs[form].validate()) {
        this.e1 = stepe;
      }
    },

    validate() {
      this.$refs.form.validate();
      this.$refs.form2.validate();
    },

    close() {
      this.morador = {};
      this.dialogNovoCadastro = false;
      this.$nextTick(() => {
        this.morador = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
      setTimeout(() => {
        this.overlay = false;
      }, 2000);
    },
  },
};
</script>

<style>
.item-selected {
  background-color: #885cda;
}
</style>
