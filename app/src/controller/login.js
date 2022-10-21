var config = require('../config/config');
var DB = require('../dao/db');
var util = require('../util/util');
var baseService = require('../service/base');
var feishuService = require('../service/feishu');

class LoginController {
  constructor() {
    this.rules = {
      login: {
        account: /^.{1,32}$/,
        password: /^.{1,32}$/
      },
      logout: {},
      status: {}
    };
  }

  async login(req, res, data) {
    let account = data.account;
    let password = data.password;
    let db = new DB();
    let list = await db.find('select * from `base_user` where `status` = 0 and `account` = :account', {
      account: account
    });
    if (list.length === 0) {
      res.send({
        code: 1,
        msg: 'system.login.userNotFound'
      });
    } else {
      if (list[0].password !== util.md5(password + account)) {
        res.send({
          code: 1,
          msg: 'system.login.wrongPassword'
        });
      } else {
        let user = await db.findById('view_base_user', list[0].id, false);
        user.department_name = user.department_name || '';
        user.station_name = user.station_name || '';
        user.roles = JSON.parse(user.roles);
        req.session.user = user;
        res.send({ code: 0 });
      }
    }
  }

  async loginByFeishu(req, res, data) {
    if (!feishuService.app_id) {
      let app_id = await baseService.getConfig('login.feishu.app_id');
      let app_secret = await baseService.getConfig('login.feishu.app_secret');
      await feishuService.setup(app_id, app_secret);
    }
    let result = await feishuService.login(data.code);
    if (result.code !== 0) {
      res.send({
        code: 1,
        msg: 'system.login.feishuFailed'
      });
    } else {
      let db = new DB();
      let list = await db.find('select * from `view_base_user` where `email` = :email', { email: result.data.email });
      if (list.length === 0) {
        res.send({
          code: 1,
          msg: 'system.login.userNotFound'
        });
      } else {
        let user = list[0];
        user.department_name = user.department_name || '';
        user.station_name = user.station_name || '';
        user.roles = JSON.parse(user.roles);
        req.session.user = user;
        res.send({ code: 0 });
      }
    }
  }

  logout(req, res, data) {
    req.session.destroy(err => { });
    res.clearCookie(config.cookie_name);
    res.send({ code: 0 });
  }

  async status(req, res, data) {
    if (req.session.user) {
      res.send({
        code: 0,
        data: { loggedIn: true }
      });
    } else {
      let flag = await baseService.getConfig('login.feishu.enable');
      if (flag === '1') {
        let app_id = await baseService.getConfig('login.feishu.app_id');
        res.send({
          code: 0,
          data: {
            loggedIn: false,
            feishu_app_id: app_id
          }
        });
      } else {
        res.send({
          code: 0,
          data: { loggedIn: false }
        });
      }
    }
  }
}

module.exports = new LoginController();