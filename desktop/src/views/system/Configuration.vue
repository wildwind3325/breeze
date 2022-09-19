<template>
  <div style="display: flex;">
    <div style="width: 200px;">
      <el-button-group>
        <el-button type="success" icon="Plus" @click="addGroup" />
        <el-button type="warning" icon="Edit" @click="editGroup" />
        <el-button type="danger" icon="Delete" @click="removeGroup" />
      </el-button-group>
      <div style="height: 10px;"></div>
      <el-scrollbar style="height: calc(100vh - 142px);">
        <el-table highlight-current-row :data="groups" @current-change="selectGroup">
          <el-table-column prop="label" label="分组" />
        </el-table>
      </el-scrollbar>
    </div>
    <div style="flex-grow: 1;">
      <div class="toolbar">
        <div class="toolbar-function">
          <el-button type="success" icon="Plus" @click="add">新建</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { listGroup, addGroup, editGroup, removeGroup, list, add, edit, remove } from '../../api/system/configuration';
export default {
  name: 'Configuration',
  data() {
    return {
      groups: [],
      selectedItem: null,
      formGroup: {
        id: 0,
        label: ''
      },
      list: [],
      form: {
        id: 0,
        group_id: 0,
        code: '',
        label: '',
        value: '',
        memo: ''
      }
    };
  },
  async mounted() {
    try {
      let res = await listGroup();
      if (res.data.code !== 0) {
        this.$message({
          type: 'error',
          message: '获取数据失败：' + res.data.msg
        });
      } else {
        this.groups = res.data.data;
      }
    } catch (err) {
      this.$message({
        type: 'error',
        message: '获取数据失败：' + err.message
      });
    }
  },
  methods: {
    selectGroup(currentRow, oldCurrentRow) {
      this.selectedItem = currentRow;
    },
    addGroup() {
      this.formGroup = {
        id: 0,
        label: ''
      };
      this.saveGroup();
    },
    editGroup() {
      if (!this.selectedItem) return;
      this.formGroup = {
        id: this.selectedItem.id,
        label: this.selectedItem.label
      };
      this.saveGroup();
    },
    removeGroup() {
      if (!this.selectedItem) return;
      this.$confirm('是否确认删除？', '系统提示')
        .then(async () => {
          try {
            let res = await removeGroup(this.selectedItem.id);
            if (res.data.code !== 0) {
              this.$message({
                type: 'error',
                message: '操作失败：' + res.data.msg
              });
            } else {
              this.groups.splice(this.groups.indexOf(this.selectedItem), 1);
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
    saveGroup() {
      this.$prompt('请输入名称', { inputValue: this.formGroup.label })
        .then(async ret => {
          if (!ret.value) {
            this.$message({
              type: 'warning',
              message: '请将信息填写完整'
            });
            return;
          }
          if (this.formGroup.label === ret.value) return;
          this.formGroup.label = ret.value;
          try {
            let res;
            if (this.formGroup.id === 0) {
              res = await addGroup(this.formGroup);
            } else {
              res = await editGroup(this.formGroup);
            }
            if (res.data.code !== 0) {
              this.$message({
                type: 'error',
                message: '操作失败：' + res.data.msg
              });
            } else {
              if (this.formGroup.id === 0) {
                this.groups.push(res.data.data);
              } else {
                this.selectedItem.label = this.formGroup.label;
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
    },
    add() {
    }
  }
}
</script>