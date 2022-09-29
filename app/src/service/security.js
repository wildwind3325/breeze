var DB = require('../dao/db');

class SecurityService {
  constructor() {
    this.menus = {};
    this.roles = {};
  }

  async init() {
    let db = new DB();
    let menus = await db.findByTable('base_menu', [], '', '', {});
    this.menus = {};
    for (let i = 0; i < menus.length; i++) {
      this.menus[menus[i].id + ''] = menus[i];
    }
    let roles = await db.findByTable('base_role', [], '', '', {});
    this.roles = {};
    for (let i = 0; i < roles.length; i++) {
      let role = {
        menus: [],
        privileges: []
      };
      let role_menus = JSON.parse(roles[i].menus);
      for (let j = 0; j < role_menus.length; j++) {
        let menu = this.menus[role_menus[j] + ''];
        if (menu.type === 0) role.menus.push(menu.route);
        else role.privileges.push(menu.code);
      }
      this.roles[roles[i].id + ''] = role;
    }
    console.log(this.roles);
  }

  hasPrivilege(user, code) {
  }
}

module.exports = new SecurityService();