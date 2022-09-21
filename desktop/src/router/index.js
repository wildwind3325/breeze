import { createRouter, createWebHashHistory } from 'vue-router';
import Login from '../views/Login.vue';
import Master from '../views/Master.vue';
import Home from '../views/Home.vue';
import NotFound from '../views/NotFound.vue';

const routes = [{
  path: '/',
  name: 'Login',
  component: Login
}, {
  path: '/home',
  name: 'Master',
  component: Master,
  children: [{
    path: '',
    name: 'Home',
    component: Home
  }, {
    path: '/system/orgnization',
    name: 'Orgnization',
    component: () => import('../views/system/Orgnization.vue')
  }, {
    path: '/system/station',
    name: 'Station',
    component: () => import('../views/system/Station.vue')
  }, {
    path: '/system/configuration',
    name: 'Configuration',
    component: () => import('../views/system/Configuration.vue')
  }, {
    path: '/system/i18n',
    name: 'I18n',
    component: () => import('../views/system/I18n.vue')
  }]
}, {
  path: '/:pathMatch(.*)',
  name: 'NotFound',
  component: NotFound
}];

const router = createRouter({
  history: createWebHashHistory(),
  routes
});

export default router;