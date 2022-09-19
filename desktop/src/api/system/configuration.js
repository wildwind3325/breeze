import request from '../../util/request';

export const listGroup = () => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.configuration&_action=listGroup'
  });
};

export const addGroup = form => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.configuration&_action=addGroup',
    data: form
  });
};

export const editGroup = form => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.configuration&_action=editGroup',
    data: form
  });
};

export const removeGroup = id => {
  return request({
    method: 'POST',
    url: '/api/common?_module=system.configuration&_action=removeGroup',
    data: { id: id }
  });
};