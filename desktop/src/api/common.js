import axios from './index';

export const login = (account, password) => {
  return axios({
    method: 'POST',
    url: 'api/common/login',
    data: {
      account: account,
      password: password
    }
  });
};

export const logout = () => {
  return axios({
    method: 'POST',
    url: 'api/common/logout'
  });
};

export const status = () => {
  return axios({
    method: 'POST',
    url: 'api/common/status'
  });
};