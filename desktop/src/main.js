import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import './util/enhance';
import i18n from './i18n/index';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
import './main.css';

createApp(App).use(router).use(i18n).use(ElementPlus).mount('#app');