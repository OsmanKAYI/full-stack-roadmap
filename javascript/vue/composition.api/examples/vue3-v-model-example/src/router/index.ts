import { createRouter, createWebHistory } from "vue-router";
import MyComponentView from "@/views/MyComponentView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "myComponent",
      component: MyComponentView,
    },
  ],
});

export default router;
