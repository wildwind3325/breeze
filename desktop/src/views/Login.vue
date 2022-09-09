<template>
  <div class="div-center login-page">
    <div class="div-center login-box">
      <div class="login-box-title">用户登录</div>
      <div class="login-box-item">
        <el-radio-group v-model="locale" @change="lang">
          <el-radio label="zh">中文</el-radio>
          <el-radio label="en">English</el-radio>
        </el-radio-group>
      </div>
      <div class="login-box-item">
        <el-input v-model="account" prefix-icon="User" placeholder="请输入账号" />
      </div>
      <div class="login-box-item">
        <el-input v-model="password" type="password" prefix-icon="Lock" placeholder="请输入密码"
          @keyup.enter.native="login" />
      </div>
      <div class="login-box-item">
        <el-button type="primary" style="width: 100%;" @click="login">登录</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import { login, status } from '../api/login';
export default {
  name: 'Login',
  data() {
    return {
      locale: localStorage.getItem('lang') || 'zh',
      account: '',
      password: ''
    };
  },
  async mounted() {
    window.$locale.set(this.locale);
    try {
      let target = localStorage.getItem('target_uri') || '/home';
      let res = await status();
      if (res.data.code === 0 && res.data.data.loggedIn) {
        localStorage.removeItem('target_uri');
        this.$router.replace(target);
      }
    } catch (err) {
      alert('初始化时发生错误：' + err.message);
    }
  },
  methods: {
    lang() {
      this.$i18n.locale = this.locale;
      window.$locale.set(this.locale);
      localStorage.setItem('lang', this.locale);
    },
    async login() {
      if (!this.account || !this.password) {
        this.$message({
          type: 'warning',
          message: '请先输入账号和密码信息'
        });
        return;
      }
      try {
        let res = await login(this.account, this.password);
        if (res.data.code !== 0) {
          this.$message({
            type: 'error',
            message: '登录失败：' + res.data.msg
          });
          return;
        }
        this.$router.replace('/home');
      } catch (err) {
        this.$message({
          type: 'error',
          message: '登录失败：' + err.message
        });
      }
    }
  }
}
</script>

<style scoped>
.login-page {
  height: 100vh;
  background-color: #2d3a4b;
}

.login-box {
  width: 300px;
  flex-direction: column;
}

.login-box-title {
  font-size: 32px;
  color: #ffffff;
}

.login-box-item {
  width: 100%;
  margin-top: 20px;
}
</style>