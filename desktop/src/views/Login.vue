<template>
  <div class="div-center login-page">
    <div class="div-center login-box">
      <div class="login-box-title">用户登录{{ $t('message') }}</div>
      <div class="login-box-item" style="color: white;">
        <RadioGroup v-model="locale" @on-change="changeLang">
          <Radio label="zh"><span>中文</span></Radio>
          <Radio label="en"><span>English</span></Radio>
        </RadioGroup>
      </div>
      <div class="login-box-item">
        <Input v-model="account" prefix="md-person" placeholder="请输入账号" />
      </div>
      <div class="login-box-item">
        <Input v-model="password" prefix="md-lock" type="password" placeholder="请输入密码" @on-enter="login" />
      </div>
      <div class="login-box-item">
        <Button type="primary" @click="login" long>登录</Button>
      </div>
    </div>
    <div>
      <Page :total="100" show-sizer />
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
  },
  methods: {
    changeLang() {
      this.$i18n.locale = this.locale;
      localStorage.setItem('lang', this.locale);
    },
    async login() {
      console.log('登录');
    }
  }
}
</script>

<style>
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