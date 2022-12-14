var DB = require('../dao/db');
var util = require('../util/util');

class BaseService {
  constructor() {
    this.safeModules = ['login', 'data'];
  }

  preProcess(req) {
    let data = Object.assign({}, req.query, req.body);
    let module = data._module;
    let action = data._action;
    if (!/^[a-zA-Z0-9\.]+$/.test(module) || !/^[a-zA-Z0-9]+$/.test(action)) {
      return {
        code: 1,
        msg: 'system.msg.wrongRequest'
      };
    }
    if (this.safeModules.indexOf(module) < 0) {
      if (!req.session.user) {
        return {
          code: -1,
          msg: 'system.msg.unauthorized'
        };
      }
      if (req.session.user.is_admin === 0) {
        if (!require('./security').hasPrivilege(req.session.user, module + '.' + action)) {
          return {
            code: 1,
            msg: 'system.msg.permissionDenied'
          };
        }
      }
    }
    module = module.replace(/\./g, '/');
    let controller, method;
    try {
      controller = require('../controller/' + module);
      method = controller[action];
    } catch (err) { }
    if (!method || !method instanceof Function) {
      return {
        code: 1,
        msg: 'system.msg.nonexistent'
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
            msg: 'system.msg.wrongParam'
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

  async getConfig(code) {
    let db = new DB();
    let list = await db.find('select `value` from `base_config` where `code` = :code', { code: code });
    if (list.length > 0) return list[0].value;
    return null;
  }

  getTree(list, item) {
    item.children = [];
    for (let i = list.length - 1; i >= 0; i--) {
      if (list[i].parent_id === item.id) {
        item.children.push(list[i]);
        list.splice(i, 1);
      }
    }
    item.children.reverse();
    for (let i = 0; i < item.children.length; i++) {
      this.getTree(list, item.children[i]);
    }
  }

  getTreeWithDepth(list, item, maxDepth, depth) {
    if (depth > maxDepth) return;
    item.children = [];
    for (let i = list.length - 1; i >= 0; i--) {
      if (list[i].parent_id === item.id) {
        item.children.push(list[i]);
        list.splice(i, 1);
      }
    }
    item.children.reverse();
    for (let i = 0; i < item.children.length; i++) {
      this.getTreeWithDepth(list, item.children[i], maxDepth, depth + 1);
    }
  }
}

module.exports = new BaseService();