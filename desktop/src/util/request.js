import axios from 'axios';

const request = axios.create({ timeout: 5000 });

request.interceptors.request.use(function (config) {
  config.url = '/' + config.url;
  if (config.headers.Spin !== 'false') window.$spin.show();
  return config;
}, function (error) {
  window.$spin.hide();
  return Promise.reject(error);
});

request.interceptors.response.use(function (response) {
  window.$spin.hide();
  if (response.data.code < 0 && router.currentRoute.path !== '/') {
    localStorage.setItem('target_uri', router.currentRoute.fullPath);
    router.replace('/');
  }
  return response;
}, function (error) {
  window.$spin.hide();
  return Promise.reject(error);
});

export default request;