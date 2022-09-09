require('./src/config/env')();
var baseService = require('./src/service/base');
var DB = require('./src/dao/db');

(async () => {
  let db = new DB();
  await db.insert('base_user', {
    account: 'administrator',
    password: '726d9408f446069b821235264f42ad5a',
    code: '',
    name: '系统管理员',
    gender: '',
    birthday: '',
    email: '',
    mobile: '',
    roles: '[]',
    status: 0,
    is_admin: 1,
    memo: '',
    created_by: 'SYSTEM',
    updated_by: 'SYSTEM'
  });
})();