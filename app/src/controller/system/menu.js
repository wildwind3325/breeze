var DB = require('../../dao/db');

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
      this.getMenu(list, tree[i]);
    }
    res.send({
      code: 0,
      data: tree
    });
  }

  getMenu(list, item) {
    item.children = [];
    for (let i = list.length - 1; i >= 0; i--) {
      if (list[i].parent_id === item.id) {
        item.children.push(list[i]);
        list.splice(i, 1);
      }
    }
    item.children.reverse();
    for (let i = 0; i < item.children.length; i++) {
      this.getMenu(list, item.children[i]);
    }
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
    await db.delete('base_menu', data.id);
    res.send({ code: 0 });
  }
}

module.exports = new MenuController();