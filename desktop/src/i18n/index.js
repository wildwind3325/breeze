import { createI18n } from 'vue-i18n';
import en from './en';
import zh from './zh';
import ViewUIPlusEn from 'view-ui-plus/dist/locale/en-US';
import ViewUIPlusZh from 'view-ui-plus/dist/locale/zh-CN';

let locale = '';
let lang = (navigator.language || navigator.browserLanguage).toLowerCase();
if (lang.indexOf('zh') >= 0) {
  locale = 'zh';
} else {
  locale = 'en';
}
locale = localStorage.getItem('lang') || locale;
localStorage.setItem('lang', locale);

let i18n = createI18n({
  allowComposition: true,
  globalInjection: true,
  legacy: false,
  locale: locale,
  messages: {
    en: Object.assign(en, ViewUIPlusEn),
    zh: Object.assign(zh, ViewUIPlusZh)
  }
});

export default i18n;