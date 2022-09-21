import request from '../../util/request';

export const list = keyword => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.i18n&_action=list',
    data: { keyword: keyword }
  });
};

export const add = form => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.i18n&_action=add',
    data: form
  });
};

export const edit = form => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.i18n&_action=edit',
    data: form
  });
};

export const remove = id => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.i18n&_action=remove',
    data: { id: id }
  });
};