var DB = require('../../dao/db');

class StationController {
  constructor() {
    this.rules = {
      list: {},
      add: {
        label: /^.{1,32}$/
      },
      edit: {
        id: /^[1-9]\d*$/,
        label: /^.{1,32}$/
      },
      remove: {
        id: /^[1-9]\d*$/
      }
    };
  }

  async list(req, res, data) {
    let db = new DB();
    let list = await db.find('select * from `base_station`');
    res.send({
      code: 0,
      data: list
    });
  }

  async add(req, res, data) {
    let db = new DB();
    let item = Object.assign({
      created_at: new Date(),
      created_by: req.session.user.account,
      updated_at: new Date(),
      updated_by: req.session.user.account
    }, data);
    await db.insert('base_station', item);
    res.send({
      code: 0,
      data: item
    });
  }

  async edit(req, res, data) {
    let db = new DB();
    let item = Object.assign({ updated_by: req.session.user.account }, data);
    await db.update('base_station', item);
    res.send({ code: 0 });
  }

  async remove(req, res, data) {
    let db = new DB();
    let item = await db.findById('base_department', data.id);
    if (item.parent_id === 0) {
      res.send({
        code: 1,
        msg: '无法删除顶级节点'
      });
      return;
    }
    let countSub = await db.find('select count(*) total from `base_department` where `parent_id` = :id', { id: data.id });
    let countUser = await db.find('select count(*) total from `base_user_org` where `department_id` = :id', { id: data.id });
    if (countSub[0].total > 0 || countUser[0].total > 0) {
      res.send({
        code: 1,
        msg: '该对象不为空，无法直接删除。'
      });
      return;
    }
    await db.delete('base_department', data.id);
    res.send({ code: 0 });
  }
}

module.exports = new StationController();