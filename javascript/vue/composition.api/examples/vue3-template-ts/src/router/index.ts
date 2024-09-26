import { createRouter, createWebHistory } from "vue-router";
import HomeView from "@/views/HomeView.vue";
import AboutView from "@/views/AboutView.vue";
import PiniaView from "@/views/PiniaView.vue";
import VuetifyView from "@/views/VuetifyView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/about",
      name: "about",
      component: AboutView,
    },
    {
      path: "/pinia",
      name: "pinia",
      component: PiniaView,
    },
    {
      path: "/vuetify",
      name: "vuetify",
      component: VuetifyView,
    },
  ],
});

export default router;
