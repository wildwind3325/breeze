<template>
  <div class="toolbar">
    <div class="toolbar-function">
      <el-button type="success" icon="Plus" @click="add">新建</el-button>
    </div>
  </div>
  <el-table :data="list">
    <el-table-column prop="label" label="名称" />
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
</template>

<script>
import { list, add, edit, remove } from '../../api/system/station';
export default {
  name: 'Station',
  data() {
    return {
      list: [],
      form: {
        id: 0,
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
        if (res.data.code !== 0) {
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
    add() {
      this.form = {
        id: 0,
        label: ''
      };
      this.save();
    },
    edit(row) {
      this.form = {
        id: row.id,
        label: row.label
      };
      this.save(row);
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
    save(row) {
      this.$prompt('请输入名称', { inputValue: this.form.label })
        .then(async ret => {
          if (!ret.value) {
            this.$message({
              type: 'warning',
              message: '请将信息填写完整'
            });
            return;
          }
          if (this.form.label === ret.value) return;
          this.form.label = ret.value;
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
                row.label = this.form.label;
              }
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
    }
  }
}
</script>