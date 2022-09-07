<template>
  <div>
    Home
    <el-popover title="所有图标" :width="400" trigger="click" v-model:visible="showIcons">
      <template #reference>
        <el-input v-model="icon" :prefix-icon="icon" readonly style="width: 400px;" />
      </template>
      <el-scrollbar height="200px">
        <el-icon v-for="(item, index) in icons" :key="index" :size="32" class="icon" @click="setIcon(item)">
          <component :is="item"></component>
        </el-icon>
      </el-scrollbar>
    </el-popover>
  </div>
</template>

<script>
import * as ElementPlusIconsVue from '@element-plus/icons-vue';
export default {
  name: 'Home',
  data() {
    return {
      showIcons: false,
      icon: '',
      icons: []
    };
  },
  mounted() {
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
      this.icons.push(key);
    }
  },
  methods: {
    setIcon(val) {
      this.icon = val;
      this.showIcons = false;
    }
  }
}
</script>

<style scoped>
.icon {
  cursor: pointer;
  margin: 0px 5px 5px 0px;
}
</style>