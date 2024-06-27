import { createApp } from "vue";
import { createPinia } from "pinia";
import axios from "axios";

// Vuetify
import "vuetify/styles";
import { createVuetify } from "vuetify";
import * as components from "vuetify/components";
import * as directives from "vuetify/directives";

const vuetify = createVuetify({
  components,
  directives,
});

import App from "./App.vue";
import router from "./router";

const app = createApp(App);

app.use(createPinia());
app.use(vuetify);
app.use(router);

// Add Axios to Vue
app.config.globalProperties.$axios = axios;

app.mount("#app");
