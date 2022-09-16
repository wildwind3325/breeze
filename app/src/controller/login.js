var config = require('../config/config');
var DB = require('../dao/db');
var util = require('../util/util');

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
    let rows = await db.find('select * from `base_user` where `status` = 0 and `account` = :account', {
      account: account
    });
    if (rows.length === 0) {
      res.send({
        code: 1,
        msg: '该用户不存在或已被停用'
      });
    } else {
      if (rows[0].password !== util.md5(password + account)) {
        res.send({
          code: 1,
          msg: '密码错误'
        });
      } else {
        req.session.user = rows[0];
        res.send({ code: 0 });
      }
    }
  }

  logout(req, res, data) {
    req.session.destroy(err => { });
    res.clearCookie(config.cookie_name);
    res.send({ code: 0 });
  }

  status(req, res, data) {
    if (req.session.user) {
      res.send({
        code: 0,
        data: { loggedIn: true }
      });
    } else {
      res.send({
        code: 0,
        data: { loggedIn: false }
      });
    }
  }
}

module.exports = new LoginController();