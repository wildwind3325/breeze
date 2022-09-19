var DB = require('../../dao/db');

class ConfigurationController {
  constructor() {
    this.rules = {
      listGroup: {},
      addGroup: {
        label: /^.{1,32}$/
      },
      editGroup: {
        id: /^[1-9]\d*$/,
        label: /^.{1,32}$/
      },
      removeGroup: {
        id: /^[1-9]\d*$/
      }
    };
  }

  async listGroup(req, res, data) {
    let db = new DB();
    let list = await db.find('select * from `base_config_group`');
    res.send({
      code: 0,
      data: list
    });
  }

  async addGroup(req, res, data) {
    let db = new DB();
    let item = Object.assign({
      created_at: new Date(),
      created_by: req.session.user.account,
      updated_at: new Date(),
      updated_by: req.session.user.account
    }, data);
    await db.insert('base_config_group', item);
    res.send({
      code: 0,
      data: item
    });
  }

  async editGroup(req, res, data) {
    let db = new DB();
    let item = Object.assign({ updated_by: req.session.user.account }, data);
    await db.update('base_config_group', item);
    res.send({ code: 0 });
  }

  async removeGroup(req, res, data) {
    let db = new DB();
    let count = await db.find('select count(*) total from `base_config` where `group_id` = :id', { id: data.id });
    if (count[0].total > 0) {
      res.send({
        code: 1,
        msg: '该对象不为空，无法直接删除。'
      });
      return;
    }
    await db.delete('base_config_group', data.id);
    res.send({ code: 0 });
  }
}

module.exports = new ConfigurationController();