<template>
  <div class="container">
    <div class="sider">
      <div class="sider-header div-center">
        <img alt="" src="../assets/img/logo.png" class="sider-header-logo" />
        <span class="sider-header-title">Breeze</span>
      </div>
      <div class="sider-menu">
        <el-scrollbar>
          <el-menu active-text-color="#409eff" background-color="#304156" text-color="#f4f4f5">
            <el-menu-item index="1">
              <el-icon>
                <Star />
              </el-icon>
              <span>首頁</span>
            </el-menu-item>
            <el-menu-item index="2">
              <el-icon>
                <Setting />
              </el-icon>
              <span>功能</span>
            </el-menu-item>
          </el-menu>
        </el-scrollbar>
      </div>
    </div>
    <div style="flex-grow: 1;">
      <div class="header">Header</div>
      <div class="content">
        <el-scrollbar>
          Content
        </el-scrollbar>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Master',
  data() {
    return {
    };
  },
  mounted() {
  },
  methods: {
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
  height: 60px;
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
  height: calc(100vh - 60px);
}

.el-menu {
  border-right: 0px;
}

.header {
  width: 100%;
  height: 60px;
  overflow: hidden;
}

.content {
  width: 100%;
  height: calc(100vh - 60px);
}
</style>