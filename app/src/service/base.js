var DB = require('../dao/db');
var util = require('../util/util');

class BaseService {
  constructor() {
    this.safeModules = ['login'];
  }

  preProcess(req) {
    let data = Object.assign({}, req.query, req.body);
    let module = data._module;
    let action = data._action;
    if (!/^[a-zA-Z0-9\.]+$/.test(module) || !/^[a-zA-Z0-9]+$/.test(action)) {
      return {
        code: 1,
        msg: '请求不合法'
      };
    }
    if (this.safeModules.indexOf(module) < 0 && !req.session.user) {
      return {
        code: -1,
        msg: '尚未登录或登录已超时'
      };
    }
    module = module.replace(/\./g, '/');
    let controller, method;
    try {
      controller = require('../controller/' + module);
      method = controller[action];
      if (!method) throw new Error('No such method');
    } catch (err) {
      return {
        code: 1,
        msg: '请求的模块或方法不存在'
      };
    }
    let rules = controller.rules;
    if (rules && rules[action]) {
      for (let key in rules[action]) {
        let rule = rules[action][key];
        if ((rule instanceof RegExp && !rule.test(data[key]))
          || (rule instanceof Function && !rule.call(controller, data[key]))) {
          return {
            code: 1,
            msg: '输入的参数不符合要求'
          };
        }
      }
    }
    delete data._module;
    delete data._action;
    return {
      code: 0,
      controller: controller,
      method: method,
      data: data
    };
  }

  async writeLog(file, category, content, operator) {
    let db = new DB();
    await db.insert('base_log', {
      module: util.getPath(file),
      category: category,
      content: content,
      created_by: operator
    });
  }
}

module.exports = new BaseService();