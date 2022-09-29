require('../src/config/env')();
var DB = require('../src/dao/db');
var service = require('../src/service/security');

(async () => {
  await service.init();
})();