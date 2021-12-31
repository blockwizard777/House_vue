<template>
  <div class="filter-container">
    <el-form>
      <el-row :getter="24">
        <el-col :span="8">
          <el-form-item label="信用代码" :label-width="formLabelWidth">
            <el-input placeholder="" v-model="search.shxydm"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="机构名称" :label-width="formLabelWidth">
            <el-input placeholder="" v-model="search.jgmc"/>
          </el-form-item>
        </el-col>
        <el-col :span="8" style="padding: 0 20px;">
          <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">查询</cm-button>
          <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">清空</cm-button>
        </el-col>
      </el-row>
      <el-row>
        <zz-table
          :ref="table.ref"
          :headers="table.headers"
          :border="true"
          :table-events="table.events"
          :api-route="table.apiRoute"
          :rowSelectable="true"
        />
      </el-row>
      <el-row>
        <div class="fr">
          <cm-button class="filter-item search" icon="el-icon-check" type="primary" @click="onOk">确定</cm-button>
          <cm-button class="filter-item" icon="el-icon-back" @click="onCancel" icon-style="color: #ff5227;">取消</cm-button>
        </div>
      </el-row>
    </el-form>

  </div>
</template>

<script>
  import renderForm from '@/views/render-table-form'
  import CmButton from './Button'
  // import Table from "./table";
  import Const from '../../../utils/const';
  import * as Tool from '../../../utils'
  export default {
    name: 'DlgJigou',
    mixins: [renderForm],
    components: {CmButton},
    data() {
      return {
        formLabelWidth: '100px',
        search: {
          type: Const.JIGOU.KAIFA,
          shxydm: '',
          jgmc: '',
        },
        tableFrom: 'table/basic/jigou/common',
      }},
    methods: {
      onSearch() {
        let table = this.$refs[this.table.ref];
        let query = table.queryParams;
        query.jgmc = this.search.jgmc;
        query.shxydm = this.search.shxydm;
        table.handleSearch()
      },

      onClear() {
        this.search.jgmc = '';
        this.search.shxydm = '';
        this.onSearch();
      },
      onOk() {
        let table = this.$refs[this.table.ref];
        const row = table.currentRow;
        this.$emit('closeDilog', row);
      },
      onCancel() {
        this.$emit('closeDilog', null);
      },
    }

  }
</script>

<style scoped>
</style>
