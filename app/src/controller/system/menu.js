var DB = require('../../dao/db');

var baseService = require('../../service/base');

class MenuController {
  constructor() {
    this.rules = {
      list: {},
      add: {
        parent_id: /^\d+$/,
        label: /^.{1,32}$/,
        type: /^[01]{1}$/,
        route: /.{0,128}/,
        icon: /.{0,32}/,
        code: /[a-zA-Z0-9\.]{0,512}/
      },
      edit: {
        id: /^[1-9]\d*$/,
        parent_id: /^\d+$/,
        label: /^.{1,32}$/,
        type: /^[01]{1}$/,
        route: /.{0,128}/,
        icon: /.{0,32}/,
        code: /[a-zA-Z0-9\.]{0,512}/
      },
      remove: {
        id: /^[1-9]\d*$/
      }
    };
  }

  async list(req, res, data) {
    let db = new DB();
    let tree = await db.find('select * from `base_menu` where `parent_id` = 0');
    let list = await db.find('select * from `base_menu` where `parent_id` <> 0');
    for (let i = 0; i < tree.length; i++) {
      baseService.getTree(list, tree[i]);
    }
    res.send({
      code: 0,
      data: tree
    });
  }

  async add(req, res, data) {
    let db = new DB();
    let item = Object.assign({
      created_by: req.session.user.account,
      updated_by: req.session.user.account
    }, data);
    await db.insert('base_menu', item);
    res.send({ code: 0 });
  }

  async edit(req, res, data) {
    let db = new DB();
    let item = Object.assign({ updated_by: req.session.user.account }, data);
    await db.update('base_menu', item);
    res.send({ code: 0 });
  }

  async remove(req, res, data) {
    let db = new DB();
    let count = await db.find('select count(*) total from `base_menu` where `parent_id` = :id', { id: data.id });
    if (count[0].total > 0) {
      res.send({
        code: 1,
        msg: '该对象不为空，无法直接删除。'
      });
      return;
    }
    let roles = await db.find('select * from `base_role`');
    for (let i = 0; i < roles.length; i++) {
      let menus = JSON.parse(roles[i].menus);
      let pos = menus.indexOf(data.id);
      if (pos >= 0) {
        menus.splice(pos, 1);
        roles[i].menus = JSON.stringify(menus);
        await db.update('base_role', roles[i]);
      }
    }
    await db.delete('base_menu', data.id);
    res.send({ code: 0 });
  }
}

module.exports = new MenuController();