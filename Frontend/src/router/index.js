import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import AdminPage from "../views/AdminPage.vue";
import Login from "../views/Login.vue";
import Event from "../views/event.vue";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/admin",
      name: "admin",
      component: AdminPage,
    },
    {
      path: "/login",
      name: "login",
      component: Login,
    },
    {
      path: "/event",
      name: "event",
      component: Event,
    },
  ],
});

export default router;
