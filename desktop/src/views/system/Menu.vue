<template>
  <div class="toolbar">
    <div class="toolbar-function">
      <el-button type="success" @click="add">新建</el-button>
    </div>
    <div class="toolbar-search">
    </div>
  </div>
  <el-table row-key="id" :data="list">
    <el-table-column prop="label" label="名称" />
    <el-table-column prop="type" label="类型" width="120" align="center">
      <template #default="scope">
        {{ scope.row.type === 0 ? '菜单' : '权限' }}
      </template>
    </el-table-column>
    <el-table-column prop="icon" label="图标" width="60" align="center">
      <template #default="scope">
        <el-icon :size="24">
          <component :is="scope.row.icon"></component>
        </el-icon>
      </template>
    </el-table-column>
    <el-table-column prop="created_at" label="创建时间" width="180" align="center">
      <template #default="scope">
        <span>{{ new Date(scope.row.created_at).format('yyyy-MM-dd HH:mm:ss') }}</span>
      </template>
    </el-table-column>
    <el-table-column label="操作" width="180" align="center">
      <template #default="scope">
        <el-button-group>
          <el-button type="success" icon="Plus" size="small" @click="add(scope.row)" />
          <el-button type="warning" icon="Edit" size="small" @click="edit(scope.row)" />
          <el-button type="danger" icon="Delete" size="small" @click="remove(scope.row)" />
        </el-button-group>
      </template>
    </el-table-column>
  </el-table>
  <el-dialog v-model="showDialog" title="菜单管理">
    <el-form :model="form" :label-width="80">
      <el-form-item label="上级菜单">
        <el-tree-select v-model="form.parent_id" :data="list" clearable check-strictly value-key="id" />
      </el-form-item>
      <el-form-item label="图标">
        <el-popover title="所有图标" :width="600" trigger="click" v-model:visible="showIcons">
          <template #reference>
            <el-input v-model="form.icon" :prefix-icon="form.icon" />
          </template>
          <el-scrollbar height="200px">
            <el-icon v-for="(item, index) in icons" :key="index" :size="24" class="icon" @click="setIcon(item)">
              <component :is="item"></component>
            </el-icon>
          </el-scrollbar>
        </el-popover>
      </el-form-item>
      <el-form-item label="名称">
        <el-input v-model="form.label" />
      </el-form-item>
      <el-form-item label="类型">
        <el-select v-model="form.type">
          <el-option label="菜单" :value="0" />
          <el-option label="权限" :value="1" />
        </el-select>
      </el-form-item>
      <el-form-item label="路由" v-show="form.type === 0">
        <el-input v-model="form.route" />
      </el-form-item>
      <el-form-item label="代码" v-show="form.type === 1">
        <el-input v-model="form.code" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="showDialog = false">取消</el-button>
      <el-button type="primary" @click="save">确认</el-button>
    </template>
  </el-dialog>
</template>

<script>
import * as ElementPlusIconsVue from '@element-plus/icons-vue';
import { list, add, edit, remove } from '../../api/system/menu';
export default {
  name: 'SystemMenu',
  data() {
    return {
      keyword: '',
      list: [],
      showDialog: false,
      form: {
        id: 0,
        parent_id: 0,
        label: '',
        type: 0,
        route: '',
        icon: '',
        code: ''
      },
      showIcons: false,
      icons: []
    };
  },
  mounted() {
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
      this.icons.push(key);
    }
    this.query();
  },
  methods: {
    setIcon(val) {
      this.form.icon = val;
      this.showIcons = false;
    },
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
    add(row) {
      this.form = {
        id: 0,
        parent_id: row ? row.id : 0,
        label: '',
        type: 0,
        route: '',
        icon: '',
        code: ''
      };
      this.showDialog = true;
    },
    edit(row) {
      this.form = {
        id: row.id,
        parent_id: row.parent_id,
        label: row.label,
        type: row.type,
        route: row.route,
        icon: row.icon,
        code: row.code
      };
      this.showDialog = true;
    },
    remove(row) {
      this.$confirm('是否确认删除？')
        .then(async () => {
          try {
            let res = await remove(row.id);
            if (res.data.code !== 0) {
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
      if (!this.form.parent_id) this.form.parent_id = 0;
      if (!this.form.label) {
        this.$message({
          type: 'warning',
          message: '请将信息填写完整'
        });
        return;
      }
      if (this.form.type === 0) {
        this.form.code = '';
        if (!this.form.route) {
          this.$message({
            type: 'warning',
            message: '菜单必须提供路由地址'
          });
          return;
        }
      } else {
        this.form.route = '';
        if (!this.form.code) {
          this.$message({
            type: 'warning',
            message: '功能必须提供代码'
          });
          return;
        }
      }
      if (this.form.id == this.form.parent_id && this.form.id !== 0) {
        this.$message({
          type: 'warning',
          message: '上级不可以设置为自身'
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

<style scoped>
.icon {
  cursor: pointer;
  margin: 0px 5px 5px 0px;
}
</style>