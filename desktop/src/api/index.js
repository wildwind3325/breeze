import axios from 'axios';

axios.interceptors.request.use(function (config) {
  config.url = '/' + config.url;
  if (config.headers.Spin !== 'false') window.$spin.show();
  return config;
}, function (error) {
  window.$spin.hide();
  return Promise.reject(error);
});

axios.interceptors.response.use(function (response) {
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

export default axios;