<template>
  <el-dialog
    title="高级搜索"
    width="50%"
    custom-class="custom-card"
    :visible.sync="show"
    :close-on-click-modal="true"
  >
    <el-row>
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
        :max-height="300"
        style="width: 100%"
        header-cell-class-name="table-header-custom"
        size="small"
        ref="table"
      >
        <el-table-column label="列名" prop="field">
          <template slot-scope="{ row }">
            <el-select v-model="row.field" style="width: 100%;"
                       @change="(val) => handleFieldChange(val, row)"
            >
              <el-option
                v-for="item in fields"
                :key="item.field"
                :label="item.fieldName"
                :value="item.field"
              />
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="关系" prop="symbol">
          <template slot-scope="{ row }">
            <el-select v-model="row.symbol" style="width: 100%;">
              <el-option
                v-for="item in symbolDic"
                :key="item.key"
                :label="item.label"
                :value="item.key"
              />
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="值" prop="value">
          <template slot-scope="{ row }">
            <el-input v-model="row.value" v-if="row" />
          </template>
        </el-table-column>
      </el-table>
    </el-row>
  </el-dialog>
</template>

<script>
export default {
  name: 'AdvancedSearch',
  props: {
    fields: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      show: false,
      tableData: [],
      symbolDic: [
        { key: '1', label: '等于' },
        { key: '2', label: '大于' },
        { key: '3', label: '小于' },
        { key: '4', label: '大于等于' },
        { key: '5', label: '小于等于' },
      ],
    };
  },
  methods: {
    handleSearch() {

    },
    handleAdd() {

    },
    handleShow() {
      this.show = true;
    },
    handleFieldChange(val, row) {
      console.log(val);
    },
  },
};
</script>
