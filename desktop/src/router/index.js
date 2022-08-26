import { createRouter, createWebHashHistory } from 'vue-router';
import Login from '../views/Login.vue';
import Home from '../views/Home.vue';
import NotFound from '../views/NotFound.vue';

const routes = [{
  path: '/',
  component: Login
}, {
  path: '/home',
  component: Home
}, {
  path: '/:pathMatch(.*)',
  component: NotFound
}];

const router = createRouter({
  history: createWebHashHistory(),
  routes
});

export default router;