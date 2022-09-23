<template>
  <div class="toolbar">
    <div class="toolbar-function">
    </div>
    <div class="toolbar-search">
      <el-input v-model="module" clearable placeholder="模块" style="width: 180px;" />
      <el-select v-model="category" clearable placeholder="分类" style="margin-left: 12px;">
        <el-option label="调试" value="DEBUG" />
        <el-option label="信息" value="INFO" />
        <el-option label="警告" value="WARN" />
        <el-option label="错误" value="ERROR" />
      </el-select>
      <el-input v-model="keyword" clearable placeholder="请输入关键字" style="width: 180px; margin-left: 12px;" />
      <el-date-picker v-model="created_at" type="daterange" placeholder="创建时间" style="margin-left: 12px;" />
      <el-button type="primary" style="margin-left: 12px;" @click="query(1)">搜索</el-button>
    </div>
  </div>
  <el-table :data="list">
    <el-table-column prop="module" label="模块" width="180" />
    <el-table-column prop="category" label="分类" width="60" align="center">
      <template #default="scope">
        {{ getTitle(scope.row.category) }}
      </template>
    </el-table-column>
    <el-table-column prop="content" label="内容" />
    <el-table-column prop="created_at" label="创建时间" width="180" align="center">
      <template #default="scope">
        <span>{{ new Date(scope.row.created_at).format('yyyy-MM-dd HH:mm:ss') }}</span>
      </template>
    </el-table-column>
  </el-table>
  <el-pagination v-model:current-page="pageNumber" background layout="->, prev, pager, next" :total="total"
    style="margin-top: 10px;" @current-change="query" />
</template>

<script>
import { list } from '../../api/system/log';
export default {
  name: 'Log',
  data() {
    return {
      module: '',
      category: '',
      keyword: '',
      created_at: [],
      list: [],
      pageNumber: 1,
      total: 0
    };
  },
  mounted() {
    this.query();
  },
  methods: {
    async query(pageNumber) {
      try {
        let from = this.created_at && this.created_at.length > 0 ? this.created_at[0] : '';
        let to = this.created_at && this.created_at.length > 1 ? this.created_at[1] : '';
        let res = await list(this.module, this.category, this.keyword, from, to, pageNumber || this.pageNumber);
        if (res.data.code !== 0) {
          this.$message({
            type: 'error',
            message: '获取数据失败：' + res.data.msg
          });
        } else {
          this.total = res.data.data.total;
          this.pageNumber = res.data.data.pageNumber;
          this.list = res.data.data.rows;
        }
      } catch (err) {
        this.$message({
          type: 'error',
          message: '获取数据失败：' + err.message
        });
      }
    },
    getTitle(category) {
      switch (category) {
        case 'DEBUG':
          return '调试';
        case 'INFO':
          return '信息';
        case 'WARN':
          return '警告';
        case 'ERROR':
          return '错误';
        default:
          return '';
      }
    }
  }
}
</script>