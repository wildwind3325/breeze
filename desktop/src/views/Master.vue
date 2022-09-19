<template>
  <div class="container">
    <div class="sider">
      <div class="sider-header div-center">
        <img alt="" src="../assets/img/logo.png" class="sider-header-logo" />
        <span class="sider-header-title">Breeze</span>
      </div>
      <el-scrollbar class="sider-menu">
        <el-menu active-text-color="#409eff" background-color="#304156" text-color="#f4f4f5" :default-active="path"
          @select="selectMenu">
          <el-menu-item index="/home">
            <el-icon>
              <Star />
            </el-icon>
            <span>首頁</span>
          </el-menu-item>
          <el-sub-menu index="/system">
            <template #title>
              <el-icon>
                <Setting />
              </el-icon>
              <span>系统管理</span>
            </template>
            <el-menu-item index="/system/orgnization">
              <el-icon>
                <Setting />
              </el-icon>
              <span>部门管理</span>
            </el-menu-item>
            <el-menu-item index="/system/station">
              <el-icon>
                <Setting />
              </el-icon>
              <span>岗位管理</span>
            </el-menu-item>
            <el-menu-item index="/system/configuration">
              <el-icon>
                <Setting />
              </el-icon>
              <span>配置管理</span>
            </el-menu-item>
          </el-sub-menu>
        </el-menu>
      </el-scrollbar>
    </div>
    <div style="flex-grow: 1;">
      <div class="header">
        <el-button type="primary" @click="updateScroll">管理员</el-button>
        <el-button type="warning" @click="logout">注销</el-button>
      </div>
      <div class="navibar">
        <el-scrollbar ref="navibar">
          <div class="navibar-tags">
            <el-tag v-for="(item, index) in tags" :key="index" :type="item.path === path ? '' : 'info'"
              :effect="item.path === path ? 'dark' : 'light'" :closable="index > 0"
              style="cursor: pointer; margin-left: 5px;" @click="navi(item)" @close="close(item, index)">
              {{ item.label }}
            </el-tag>
          </div>
        </el-scrollbar>
      </div>
      <el-scrollbar class="content">
        <router-view />
      </el-scrollbar>
    </div>
  </div>
</template>

<script>
import { logout } from '../api/login';
export default {
  name: 'Master',
  data() {
    return {
      path: '',
      tags: [{
        path: '/home',
        label: '首页'
      }]
    };
  },
  mounted() {
    this.fixMenu();
  },
  updated() {
    if (this.path !== this.$route.path) {
      this.fixMenu();
    }
  },
  methods: {
    fixMenu() {
      this.path = this.$route.path;
      let found = false;
      for (let i = 0; i < this.tags.length; i++) {
        if (this.path === this.tags[i].path) {
          found = true;
          break;
        }
      }
      if (!found) {
        this.tags.push({
          path: this.path,
          label: '未知'
        });
      }
    },
    selectMenu(val) {
      for (let i = 0; i < this.tags.length; i++) {
        if (val === this.tags[i].path) {
          this.$router.push(val);
          return;
        }
      }
      this.$router.push(val);
    },
    updateScroll() {
      this.$refs.navibar.update();
    },
    async logout() {
      try {
        await logout();
        this.$router.replace('/');
      } catch (err) { }
    },
    navi(item) {
      this.$router.push(item.path);
    },
    close(item, index) {
      if (item.path === this.path) {
        this.$router.push(this.tags[index - 1].path);
      }
      this.tags.splice(index, 1);
    }
  }
}
</script>

<style scoped>
.container {
  width: 100vw;
  height: 100vh;
  display: flex;
}

.sider {
  width: 200px;
  height: 100vh;
  background-color: #304156;
}

.sider-header {
  width: 200px;
  height: 50px;
}

.sider-header-logo {
  display: block;
  width: 32px;
  height: 32px;
}

.sider-header-title {
  display: block;
  font-size: 24px;
  font-weight: bold;
  color: white;
  margin-left: 10px;
}

.sider-menu {
  width: 200px;
  height: calc(100vh - 50px);
}

.el-menu {
  border-right: 0px;
}

.header {
  width: calc(100vw - 200px);
  height: 50px;
  padding: 0px 20px;
  box-sizing: border-box;
  overflow: hidden;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  box-shadow: 0 1px 4px rgba(0, 21, 41, .08);
}

.navibar {
  width: calc(100vw - 200px);
  height: 30px;
  padding: 0px 20px 0px 15px;
  box-sizing: border-box;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .12), 0 0 3px 0 rgba(0, 0, 0, .04);
}

.navibar-tags {
  height: 30px;
  display: flex;
  align-items: center;
}

.content {
  width: calc(100vw - 240px);
  height: calc(100vh - 100px);
  padding: 10px 20px;
}
</style>