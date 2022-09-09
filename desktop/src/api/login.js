import request from '../util/request';

export const login = (account, password) => {
  return request({
    method: 'POST',
    url: 'api/login/login',
    data: {
      account: account,
      password: password
    }
  });
};

export const logout = () => {
  return request({
    method: 'POST',
    url: 'api/login/logout'
  });
};

export const status = () => {
  return request({
    method: 'POST',
    url: 'api/login/status'
  });
};