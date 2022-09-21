var DB = require('../../dao/db');

class StationController {
  constructor() {
    this.rules = {
      list: {},
      add: {
        code: /^[a-zA-Z0-9\.]{1,64}$/,
        text_en: /^.{1,512}$/,
        text_zh: /^.{1,512}$/
      },
      edit: {
        id: /^[1-9]\d*$/,
        code: /^[a-zA-Z0-9\.]{1,64}$/,
        text_en: /^.{1,512}$/,
        text_zh: /^.{1,512}$/
      },
      remove: {
        id: /^[1-9]\d*$/
      }
    };
  }

  async list(req, res, data) {
    let db = new DB();
    let sql = 'select * from `base_i18n`';
    let params = {};
    if (data.keyword) {
      sql += ' where `code` like :keyword or `text_en` like :keyword or `text_zh` like :keyword';
      params.keyword = '%' + data.keyword + '%';
    }
    let list = await db.find(sql, params);
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
    await db.insert('base_i18n', item);
    res.send({
      code: 0,
      data: item
    });
  }

  async edit(req, res, data) {
    let db = new DB();
    let item = Object.assign({ updated_by: req.session.user.account }, data);
    await db.update('base_i18n', item);
    res.send({ code: 0 });
  }

  async remove(req, res, data) {
    let db = new DB();
    await db.delete('base_i18n', data.id);
    res.send({ code: 0 });
  }

  async download(req, res, data) {
    let db = new DB();
    let list = await db.find('select * from `base_i18n`');
  }
}

module.exports = new StationController();