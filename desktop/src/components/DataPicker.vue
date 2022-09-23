<template>
  <el-cascader :options="list" clearable :show-all-levels="false" />
</template>

<script>
export default {
  name: 'DataPicker',
  props: {
    code: String,
    depth: Number,
    props: Object
  },
  data() {
    return {
      list: []
    };
  },
  mounted() {
  }
}
</script>