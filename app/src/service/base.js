var DB = require('../dao/db');
var util = require('../util/util');

class BaseService {
  constructor() {
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