import { createApp } from 'vue';
// import { createI18n } from 'vue-i18n';
import axios from 'axios';
import App from './App.vue';
import router from './router';
import './util/enhance';
import ViewUIPlus from 'view-ui-plus';
// import en from './i18n/en';
// import zh from './i18n/zh';
// import ViewUIPlusEn from 'view-ui-plus/dist/locale/en-US';
// import ViewUIPlusZh from 'view-ui-plus/dist/locale/zh-CN';
import i18n from './i18n/index';
import 'view-ui-plus/dist/styles/viewuiplus.css';
import './main.css';

axios.interceptors.request.use(function (config) {
  config.url = '/' + config.url;
  if (config.headers.Spin !== 'false') window.$Spin.show();
  return config;
}, function (error) {
  window.$Spin.hide();
  return Promise.reject(error);
});

axios.interceptors.response.use(function (response) {
  window.$Spin.hide();
  if (response.data.code < 0 && router.currentRoute.path !== '/') {
    localStorage.setItem('target_uri', router.currentRoute.fullPath);
    router.replace('/');
  }
  return response;
}, function (error) {
  window.$Spin.hide();
  return Promise.reject(error);
});

// let locale = '';
// let lang = (navigator.language || navigator.browserLanguage).toLowerCase();
// if (lang.indexOf('zh') >= 0) {
//   locale = 'zh';
// } else {
//   locale = 'en';
// }
// locale = localStorage.getItem('lang') || locale;
// localStorage.setItem('lang', locale);

// let i18n = createI18n({
//   allowComposition: true,
//   globalInjection: true,
//   legacy: false,
//   locale: locale,
//   messages: {
//     en: Object.assign(en, ViewUIPlusEn),
//     zh: Object.assign(zh, ViewUIPlusZh)
//   }
// });

createApp(App).use(router).use(i18n).use(ViewUIPlus, { i18n }).mount('#app');