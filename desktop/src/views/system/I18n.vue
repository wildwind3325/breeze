<template>
  <div class="toolbar">
    <div class="toolbar-function">
      <el-button type="success" icon="Plus" @click="add">新建</el-button>
      <el-button type="warning" icon="Download" @click="download">导出</el-button>
    </div>
    <div class="toolbar-search">
      <el-input v-model="keyword" prefix-icon="Search" clearable placeholder="请输入关键字" style="width: 250px;" />
      <el-button type="primary" style="margin-left: 12px;" @click="query(1)">搜索</el-button>
    </div>
  </div>
  <el-table :data="list">
    <el-table-column prop="code" label="代码" />
    <el-table-column prop="text_zh" label="中文" width="250" />
    <el-table-column prop="text_en" label="英文" width="250" />
    <el-table-column prop="created_at" label="创建时间" width="180" align="center">
      <template #default="scope">
        <span>{{ new Date(scope.row.created_at).format('yyyy-MM-dd HH:mm:ss') }}</span>
      </template>
    </el-table-column>
    <el-table-column label="操作" width="120" align="center">
      <template #default="scope">
        <el-button-group>
          <el-button type="warning" icon="Edit" size="small" @click="edit(scope.row)" />
          <el-button type="danger" icon="Delete" size="small" @click="remove(scope.row, scope.$index)" />
        </el-button-group>
      </template>
    </el-table-column>
  </el-table>
  <el-pagination v-model:current-page="pageNumber" background layout="->, prev, pager, next" :total="total"
    style="margin-top: 10px;" @current-change="query" />
  <el-dialog v-model="showDialog" title="国际化管理">
    <el-form :model="form" :label-width="80">
      <el-form-item label="代码">
        <el-input v-model="form.code" />
      </el-form-item>
      <el-form-item label="中文">
        <el-input v-model="form.text_zh" />
      </el-form-item>
      <el-form-item label="英文">
        <el-input v-model="form.text_en" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="showDialog = false">取消</el-button>
      <el-button type="primary" @click="save">确认</el-button>
    </template>
  </el-dialog>
</template>

<script>
import { list, add, edit, remove } from '../../api/system/i18n';
export default {
  name: 'I18n',
  data() {
    return {
      keyword: '',
      list: [],
      pageNumber: 1,
      total: 0,
      showDialog: false,
      form: {
        id: 0,
        code: '',
        text_en: '',
        text_zh: ''
      },
      currentRow: null
    };
  },
  mounted() {
    this.query();
  },
  methods: {
    async query(pageNumber) {
      try {
        let res = await list(this.keyword, pageNumber || this.pageNumber);
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
    add() {
      this.form = {
        id: 0,
        code: '',
        text_en: '',
        text_zh: ''
      };
      this.showDialog = true;
    },
    edit(row) {
      this.form = {
        id: row.id,
        code: row.code,
        text_en: row.text_en,
        text_zh: row.text_zh
      };
      this.currentRow = row;
      this.showDialog = true;
    },
    remove(row, index) {
      this.$confirm('是否确认删除？', '系统提示')
        .then(async () => {
          try {
            let res = await remove(row.id);
            if (res.data.code !== 0) {
              this.$message({
                type: 'error',
                message: '操作失败：' + res.data.msg
              });
            } else {
              this.list.splice(index, 1);
              this.$message({
                type: 'success',
                message: '操作成功'
              });
            }
          } catch (err) {
            this.$message({
              type: 'error',
              message: '操作失败：' + err.message
            });
          }
        })
        .catch(() => { });
    },
    async save() {
      if (!this.form.code || !this.form.text_en || !this.form.text_zh) {
        this.$message({
          type: 'warning',
          message: '请将信息填写完整'
        });
        return;
      }
      try {
        let res;
        if (this.form.id === 0) {
          res = await add(this.form);
        } else {
          res = await edit(this.form);
        }
        if (res.data.code !== 0) {
          this.$message({
            type: 'error',
            message: '操作失败：' + res.data.msg
          });
        } else {
          if (this.form.id === 0) {
            this.list.push(res.data.data);
          } else {
            this.currentRow.code = this.form.code;
            this.currentRow.text_en = this.form.text_en;
            this.currentRow.text_zh = this.form.text_zh;
          }
          this.currentRow = null;
          this.showDialog = false;
          this.$message({
            type: 'success',
            message: '操作成功'
          });
        }
      } catch (err) {
        this.$message({
          type: 'error',
          message: '操作失败：' + err.message
        });
      }
    },
    download() {
      window.open('/api/download?_module=system.i18n&_action=download');
    }
  }
}
</script>