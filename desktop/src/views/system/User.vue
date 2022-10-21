<template>
  <div class="toolbar">
    <div class="toolbar-function">
      <el-button type="success" icon="Plus" @click="add">新建</el-button>
    </div>
    <div class="toolbar-search">
      <el-tree-select v-model="department_id" :data="departments" clearable placeholder="组织" check-strictly
        value-key="id" />
      <el-select v-model="station_id" clearable placeholder="职位" style="margin-left: 12px;">
        <el-option v-for="(item, index) in stations" :key="item.id" :label="item.label" :value="item.id" />
      </el-select>
      <el-select v-model="status" clearable placeholder="状态" style="margin-left: 12px;">
        <el-option label="正常" :value="0" />
        <el-option label="停用" :value="1" />
      </el-select>
      <el-input v-model="keyword" prefix-icon="Search" clearable placeholder="请输入关键字"
        style="width: 250px; margin-left: 12px;" />
      <el-button type="primary" style="margin-left: 12px;" @click="query(1)">搜索</el-button>
    </div>
  </div>
  <el-table :data="list">
    <el-table-column prop="name" label="姓名" width="180" align="center" />
    <el-table-column prop="department_name" label="组织" />
    <el-table-column prop="station_name" label="职位" width="180" align="center" />
    <el-table-column prop="status" label="状态" width="120" align="center">
      <template #default="scope">
        <span>{{ scope.row.status === 0 ? '正常' : '停用' }}</span>
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
  <el-pagination v-model:current-page="pageNumber" :page-size="8" background layout="->, prev, pager, next"
    :total="total" style="margin-top: 10px;" @current-change="query" />
  <el-dialog v-model="showDialog" title="用户管理" top="5vh">
    <el-form :model="form" :label-width="60" label-position="left">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="账号">
            <el-input v-model="form.account" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="密码">
            <el-input v-model="form.password" type="password" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="工号">
            <el-input v-model="form.code" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="姓名">
            <el-input v-model="form.name" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="邮箱">
            <el-input v-model="form.email" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="手机">
            <el-input v-model="form.mobile" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="组织">
            <el-tree-select v-model="form.department_id" :data="departments" clearable check-strictly value-key="id"
              style="width: 100%;" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="职位">
            <el-select v-model="form.station_id" clearable style="width: 100%;">
              <el-option v-for="(item, index) in stations" :key="item.id" :label="item.label" :value="item.id" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="角色">
            <el-select v-model="form.roles" clearable multiple style="width: 100%;">
              <el-option v-for="(item, index) in roles" :key="item.id" :label="item.label" :value="item.id" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态">
            <el-switch v-model="form.status" :active-value="0" :inactive-value="1" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="管理员">
            <el-switch v-model="form.is_admin" :active-value="1" :inactive-value="0" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="备注">
            <el-input v-model="form.memo" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <template #footer>
      <el-button @click="showDialog = false">取消</el-button>
      <el-button type="primary" @click="save">确认</el-button>
    </template>
  </el-dialog>
</template>

<script>
import * as orgnization from '../../api/system/orgnization';
import * as station from '../../api/system/station';
import * as role from '../../api/system/role';
import * as user from '../../api/system/user';
export default {
  name: 'User',
  data() {
    return {
      department_id: '',
      departments: [],
      station_id: '',
      stations: [],
      status: '',
      roles: [],
      keyword: '',
      list: [],
      pageNumber: 1,
      total: 0,
      showDialog: false,
      form: {
        id: 0,
        account: '',
        password: '',
        code: '',
        name: '',
        email: '',
        mobile: '',
        department_id: '',
        station_id: '',
        roles: [],
        status: 0,
        is_admin: 0,
        memo: ''
      }
    };
  },
  async mounted() {
    try {
      let res = await orgnization.list();
      if (res.data.code === 0) this.departments = res.data.data;
      res = await station.list();
      if (res.data.code === 0) this.stations = res.data.data;
      res = await role.list();
      if (res.data.code === 0) this.roles = res.data.data;
      await this.query();
    } catch (err) { }
  },
  methods: {
    async query(pageNumber) {
      try {
        let res = await user.list({
          department_id: this.department_id,
          station_id: this.station_id,
          status: this.status,
          keyword: this.keyword,
          pageSize: 8,
          pageNumber: pageNumber || this.pageNumber
        });
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
        account: '',
        password: '',
        code: '',
        name: '',
        email: '',
        mobile: '',
        department_id: '',
        station_id: '',
        roles: [],
        status: 0,
        is_admin: 0,
        memo: ''
      };
      this.showDialog = true;
    },
    edit(row) {
      this.form = {
        id: row.id,
        account: row.account,
        password: '',
        code: row.code,
        name: row.name,
        email: row.email,
        mobile: row.mobile,
        department_id: row.department_id ? row.department_id : '',
        station_id: row.station_id ? row.station_id : '',
        roles: JSON.parse(row.roles),
        status: row.status,
        is_admin: row.is_admin,
        memo: row.memo
      };
      this.showDialog = true;
    },
    remove(row, index) {
      this.$confirm('是否确认删除？', '系统提示')
        .then(async () => {
          try {
            let res = await user.remove(row.id);
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
      if (!this.form.account || !this.form.name || (!this.form.password && this.form.id === 0)) {
        this.$message({
          type: 'warning',
          message: '请将信息填写完整'
        });
        return;
      }
      try {
        let res;
        let item = {
          id: this.form.id,
          account: this.form.account,
          password: this.form.password,
          code: this.form.code,
          name: this.form.name,
          email: this.form.email,
          mobile: this.form.mobile,
          department_id: this.form.department_id || 0,
          station_id: this.form.station_id || 0,
          roles: JSON.stringify(this.form.roles),
          status: this.form.status,
          is_admin: this.form.is_admin,
          memo: this.form.memo
        };
        if (this.form.id === 0) {
          res = await user.add(item);
        } else {
          res = await user.edit(item);
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