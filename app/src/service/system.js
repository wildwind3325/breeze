class SystemService {
  constructor() {
  }

  getOrgnization(list, item) {
    item.children = [];
    for (let i = list.length - 1; i >= 0; i--) {
      if (list[i].parent_id === item.id) {
        item.children.push(list[i]);
        list.splice(i, 1);
      }
    }
    for (let i = 0; i < item.children.length; i++) {
      this.getOrgnization(list, item.children[i]);
    }
  }
}

module.exports = new SystemService();