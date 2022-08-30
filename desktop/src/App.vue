<template>
  <el-config-provider :locale="locale">
    <router-view v-slot="{ Component }" v-loading.fullscreen.lock="loading">
      <transition name="router-fade" mode="out-in">
        <keep-alive v-if="$route.meta.keepAlive">
          <component :is="Component" />
        </keep-alive>
        <component :is="Component" v-else />
      </transition>
    </router-view>
  </el-config-provider>
</template>

<script>
import { ElConfigProvider } from 'element-plus';
import en from 'element-plus/es/locale/lang/en';
import zh from 'element-plus/es/locale/lang/zh-cn';
export default {
  name: 'App',
  components: {
    ElConfigProvider
  },
  data() {
    return {
      locale: en,
      loading: false
    };
  },
  mounted() {
    window.$locale = {
      set: val => {
        if (val === 'zh') this.locale = zh;
        else this.locale = en;
      }
    };
    window.$spin = {
      show: () => { this.loading = true; },
      hide: () => { this.loading = false; }
    };
  }
};
</script>