<template>
  <div class="page">
    <el-card>
      <el-row class="filter-container">
        <el-input
          placeholder="字典名称"
          v-model="query.name"
          size="small"
          style="width: 200px;"
          class="filter-item"
        />
        <el-button
          type="primary"
          size="small"
          class="filter-item"
          icon="el-icon-search"
          style="margin-left: 10px;"
          @click="handleSearch"
        >
          查询
        </el-button>
        <el-button
          type="primary"
          size="small"
          class="filter-item"
          icon="el-icon-plus"
          @click="handleAdd"
        >
          新增
        </el-button>
      </el-row>
      <el-row>
        <el-table
          :data="tableData"
          border
          highlight-current-row
          fit
          :height="maxHeight"
          style="width: 100%"
          header-cell-class-name="table-header-custom"
          v-loading="tableLoading"
          size="small"
          ref="table"
        >
          <el-table-column label="字典编码" prop="code" />
          <el-table-column label="字典名称" prop="name" />
          <el-table-column label="字典描述" prop="description" />
          <el-table-column label="操作" align="center" width="200">
            <template slot-scope="scope">
              <el-button type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
              <el-button type="danger" size="mini" @click="handleRemove(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="page.page"
          :page-size="page.pageSize"
          :page-sizes="page.pageSizes"
          :total="page.total"
          background
          layout="total, sizes, prev, pager, next, jumper, slot"
        >
          <el-button size="mini" icon="el-icon-refresh" @click="refresh" plain>刷新</el-button>
        </el-pagination>
      </el-row>
    </el-card>

    <el-dialog
      :title="title"
      :visible.sync="dialogFormVisible"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      :show-close="false"
      width="50%"
    >
      <el-form
        :model="form"
        ref="form"
        :rules="rules"
        size="small"
        :label-width="labelWidth"
        style="width: 100%;"
      >
        <el-row>
          <el-col :span="12">
            <el-form-item label="字典编码" prop="code">
              <el-input type="string" v-model="form.code" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="字典名称" prop="name">
              <el-input type="string" v-model="form.name" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="字典描述" prop="description">
              <el-input type="textarea" :rows="2" v-model="form.description" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <el-button type="text" @click="handleAddItem">添加</el-button>
      <el-table
        :data="form.dicDetails"
        border
        highlight-current-row
        :max-height="200"
        size="small"
      >
        <el-table-column label="字典项值" prop="key">
          <template slot-scope="{ row }">
            <el-input v-model="row.key" />
          </template>
        </el-table-column>
        <el-table-column label="字典项名称" prop="label">
          <template slot-scope="{ row }">
            <el-input v-model="row.label" />
          </template>
        </el-table-column>
        <el-table-column label="字典项排序" prop="sort">
          <template slot-scope="{ row }">
            <el-input v-model="row.sort" />
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="100">
          <template slot-scope="scope">
            <el-button type="danger" size="mini" @click="handleRemoveDetail(scope)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSave">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import mixins from '@/utils/mixins/commonMixin';
import { save, getList, remove } from '@/api/dic';

export default {
  name: 'Dic',
  mixins: [mixins],
  data() {
    return {
      query: {
        name: '',
      },
      tableData: [],
      page: {
        page: 1,
        pageSize: 10,
        total: 0,
        pageSizes: [10, 20, 30, 40, 50],
      },
      tableLoading: false,
      otherHeight: 125,
      form: {
        id: null,
        code: '',
        description: '',
        name: '',
        dicDetails: [],
      },
      rules: {
        code: [{ required: true, message: '不能为空', trigger: 'blur' }],
        value: [{ required: true, message: '不能为空', trigger: 'blur' }],
        description: [{ required: true, message: '不能为空', trigger: 'blur' }],
      },
      dialogFormVisible: false,
      labelWidth: '80px',
      op: 'create',
      title: '新建',
    };
  },
  mounted() {
    this.handleSearch();
  },
  methods: {
    handleSizeChange(val) {
      this.page.pageSize = val;
      this.getTableData();
    },
    handleCurrentChange(val) {
      this.page.page = val;
      this.getTableData();
    },
    getTableData() {
      const params = {
        page: this.page.page,
        pageSize: this.page.pageSize,
        name: this.query.name,
      };
      this.tableLoading = true;
      getList(params).then(res => {
        this.tableLoading = false;
        if (res.code === 200) {
          this.tableData = res.data;
          this.page.total = res.total;
        } else {
          this.tableData = [];
          this.page.total = 0;
        }
      });
    },
    handleSearch() {
      this.page.page = 1;
      this.getTableData();
    },
    handleAdd() {
      this.resetForm();
      this.op = 'create';
      this.title = '新建';
      this.dialogFormVisible = true;
      this.$nextTick(() => {
        this.$refs.form.clearValidate();
      });
    },
    handleEdit(val) {
      this.resetForm();
      Object.keys(this.form).forEach(item => {
        this.form[item] = val[item];
      });
      this.op = 'update';
      this.title = '编辑';
      this.dialogFormVisible = true;
      this.$nextTick(() => {
        this.$refs.form.clearValidate();
      });
    },
    refresh() {
      this.getTableData();
    },
    resetForm() {
      this.form = {
        id: null,
        code: '',
        name: '',
        description: '',
        dicDetails: [],
      };
    },
    handleSave() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.form.dicDetails.length === 0) {
            this.$message.warning('字典项不能为空');
            return;
          }
          this.form.dicDetails.forEach(item => item.code = this.form.code);
          save(this.form).then(res => {
            if (res.code === 200) {
              this.$message.success(res.message);
              this.dialogFormVisible = false;
              this.refresh();
            } else {
              this.$message.error(res.message);
            }
          });
        }
      });
    },
    handleRemove(row) {
      this.$confirm('是否删除？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(() => {
        remove({ id: row.id }).then(res => {
          if (res.code === 200) {
            this.$message.success(res.message);
            this.refresh();
          } else {
            this.$message.error(res.message);
          }
        });
      }).catch(() => {});
    },
    handleRemoveDetail(scope) {
      this.form.dicDetails.splice(scope.$index, 1);
    },
    handleAddItem() {
      this.form.dicDetails.push({
        key: '',
        code: '',
        label: '',
        sort: '',
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.page {
  height: 100%;
  .el-card {
    height: 100%;
  }
}
</style>
