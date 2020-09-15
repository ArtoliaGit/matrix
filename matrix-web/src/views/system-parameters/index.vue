<template>
  <div class="page">
    <el-card>
      <el-row class="filter-container">
        <el-input
          placeholder="参数编码或描述"
          v-model="query.code"
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
          <el-table-column label="参数编码" prop="code" />
          <el-table-column label="参数值" prop="value" />
          <el-table-column label="参数描述" prop="description" />
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
      width="40%"
    >
      <el-form
        :model="form"
        ref="form"
        :rules="rules"
        size="small"
        :label-width="labelWidth"
        style="width: 80%;"
      >
        <el-form-item label="参数编码" prop="code">
          <el-input type="string" v-model="form.code" />
        </el-form-item>
        <el-form-item label="参数值" prop="value">
          <el-input type="string" v-model="form.value" />
        </el-form-item>
        <el-form-item label="参数描述" prop="description">
          <el-input type="textarea" :rows="5" v-model="form.description" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSave">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import mixins from '@/utils/mixins/commonMixin';
import { save, getList, remove } from '@/api/system-parameters';

export default {
  name: 'SystemParameters',
  mixins: [mixins],
  data() {
    return {
      query: {
        code: '',
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
        value: '',
      },
      rules: {
        code: [{ required: true, message: '不能为空', trigger: 'blur' }],
        value: [{ required: true, message: '不能为空', trigger: 'blur' }],
        description: [{ required: true, message: '不能为空', trigger: 'blur' }],
      },
      dialogFormVisible: false,
      labelWidth: '120px',
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
        code: this.query.code,
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
        value: '',
        description: '',
      };
    },
    handleSave() {
      this.$refs.form.validate((valid) => {
        if (valid) {
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
      remove({ id: row.id }).then(res => {
        if (res.code === 200) {
          this.$message.success(res.message);
          this.refresh();
        } else {
          this.$message.error(res.message);
        }
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
