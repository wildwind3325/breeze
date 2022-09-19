var express = require('express');
var log4js = require('log4js');

var router = express.Router();
var logger = log4js.getLogger();

var safeModules = ['login'];

router.post('/common', async function (req, res, next) {
  try {
    let data = Object.assign({}, req.query, req.body);
    let module = data._module;
    let action = data._action;
    if (!/^[a-zA-Z\.]+$/.test(module) || !/^[a-zA-Z]+$/.test(action)) {
      res.send({
        code: 1,
        msg: '请求不合法'
      });
      return;
    }
    if (safeModules.indexOf(module) < 0 && !req.session.user) {
      res.send({
        code: -1,
        msg: '尚未登录或登录已超时'
      });
      return;
    }
    module = module.replace(/\./g, '/');
    let controller, method;
    try {
      controller = require('./controller/' + module);
      method = controller[action];
      if (!method) throw new Error('No such method');
    } catch (err) {
      logger.error(err.message, err);
      res.send({
        code: 1,
        msg: '请求的模块或方法不存在'
      });
      return;
    }
    let rules = controller.rules;
    if (rules && rules[action]) {
      for (let key in rules[action]) {
        let rule = rules[action][key];
        if ((rule instanceof RegExp && !rule.test(data[key]))
          || (rule instanceof Function && !rule.call(controller, data[key]))) {
          res.send({
            code: 1,
            msg: '输入的参数不符合要求'
          });
          return;
        }
      }
    }
    delete data._module;
    delete data._action;
    method.call(controller, req, res, data);
  } catch (err) {
    logger.error(err.message, err);
    res.send({
      code: 1,
      msg: '请求处理时发生异常'
    });
  }
});

module.exports = router;