<template>
  <div class="div-center login-page">
    <div class="div-center login-box">
      <div class="login-box-title">用户登录</div>
      <div class="login-box-item" style="color: white;">
        <el-radio-group v-model="locale" @change="changeLang">
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
export default {
  name: 'Login',
  data() {
    return {
      locale: localStorage.getItem('lang') || 'zh',
      account: '',
      password: ''
    };
  },
  mounted() {
    window.$locale.set(this.locale);
  },
  methods: {
    changeLang() {
      this.$i18n.locale = this.locale;
      window.$locale.set(this.locale);
      localStorage.setItem('lang', this.locale);
    },
    async login() {
      this.$router.push('/home');
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