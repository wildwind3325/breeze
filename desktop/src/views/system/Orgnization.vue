<template>
  <div class="toolbar">
    <div class="toolbar-function">
      <el-button type="success">新建</el-button>
      <el-button type="warning">编辑</el-button>
    </div>
    <div class="toolbar-search">
      <el-input v-model="keyword" prefix-icon="Search" placeholder="请输入关键字" style="width: 250px;" />
      <el-button type="primary" style="margin-left: 12px;">搜索</el-button>
    </div>
  </div>
  <el-table row-key="id" :data="list">
    <el-table-column prop="label" label="名称" />
    <el-table-column prop="created_at" label="创建时间" width="180" align="center">
      <template #default="scope">
        <span>{{ new Date(scope.row.created_at).format('yyyy-MM-dd HH:mm:ss') }}</span>
      </template>
    </el-table-column>
    <el-table-column label="操作" width="200" align="center">
      <template #default="scope">
        <el-button-group>
          <el-button type="success" icon="Plus" @click="add(scope.row)" />
          <el-button type="warning" icon="Edit" @click="edit(scope.row)" />
          <el-button v-if="scope.row.parent_id > 0" type="danger" icon="Delete" @click="remove(scope.row)" />
        </el-button-group>
      </template>
    </el-table-column>
  </el-table>
  <el-dialog v-model="showDialog" title="部门管理">
    <el-form :model="form" :label-width="80">
      <el-form-item label="上级部门" v-if="form.parent_id > 0">
        <el-tree-select v-model="form.parent_id" :data="list" check-strictly value-key="id" />
      </el-form-item>
      <el-form-item label="名称">
        <el-input v-model="form.label" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="showDialog = false">取消</el-button>
      <el-button type="primary" @click="save">确认</el-button>
    </template>
  </el-dialog>
</template>

<script>
import { list, add, edit, remove } from '../../api/system/orgnization';
export default {
  name: 'Orgnization',
  data() {
    return {
      keyword: '',
      list: [],
      showDialog: false,
      form: {
        id: 0,
        parent_id: 0,
        label: ''
      }
    };
  },
  mounted() {
    this.query();
  },
  methods: {
    async query() {
      try {
        let res = await list();
        if (res.data.code > 0) {
          this.$message({
            type: 'error',
            message: '获取数据失败：' + res.data.msg
          });
        } else {
          this.list = res.data.data;
        }
      } catch (err) {
        this.$message({
          type: 'error',
          message: '获取数据失败：' + err.message
        });
      }
    },
    add(row) {
      this.form = {
        id: 0,
        parent_id: row.id,
        label: ''
      };
      this.showDialog = true;
    },
    edit(row) {
      this.form = {
        id: row.id,
        parent_id: row.parent_id,
        label: row.label
      };
      this.showDialog = true;
    },
    remove(row) {
      this.$confirm('是否确认删除？')
        .then(async () => {
          try {
            let res = await remove(row.id);
            if (res.data.code > 0) {
              this.$message({
                type: 'error',
                message: '操作失败：' + res.data.msg
              });
            } else {
              await this.query();
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
      if (!this.form.label) {
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
        if (res.data.code > 0) {
          this.$message({
            type: 'error',
            message: '操作失败：' + res.data.msg
          });
        } else {
          await this.query();
          this.$message({
            type: 'success',
            message: '操作成功'
          });
          this.showDialog = false;
        }
      } catch (err) {
        this.$message({
          type: 'error',
          message: '操作失败：' + err.message
        });
      }
    }
  }
}
</script>