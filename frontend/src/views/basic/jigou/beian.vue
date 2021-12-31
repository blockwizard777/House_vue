<template>
  <div class="app-container">
    <header><h3>机构信息管理</h3></header>
    <el-divider></el-divider>
    <div class="filter-container" style="padding: 0 25px;">
      <el-form>
      <el-row :getter="24">
        <el-col :span="6">
          <el-form-item label="机构类型" :label-width="formLabelWidth">
            <el-select :value="search.type" placeholder="请选择类型" @change="onChangeType">
              <el-option
                v-for="(item, key) in types"
                :key="key"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="信用代码" :label-width="formLabelWidth">
            <el-input placeholder="" v-model="search.shxydm"/>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="机构名称" :label-width="formLabelWidth">
            <el-input placeholder="" v-model="search.jgmc"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" style="padding: 0 20px;">
          <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">查询</cm-button>
          <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">清空</cm-button>
        </el-col>
      </el-row>
      </el-form>
      <el-divider/>
    </div>
    <div class="filter-container">
      <cm-button type="primary" icon="el-icon-circle-plus-outline" @click="onAdd">添加</cm-button>
      <cm-button icon="el-icon-download" @click="onExportExcel" icon-style="color: #ff5227;">导出Excel</cm-button>
    </div>
    <zz-table
      :ref="table.ref"
      :headers="table.headers"
      :border="true"
      :table-events="table.events"
      :api-route="table.apiRoute"
      @onZZTableUpdate="onUpdateRow"
    />
    <el-dialog :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.bShow" width="80%" @close="onDlgCancel">
      <div >
        <DlgJigouCreate ref="dlgCreate" @closeDilog="onDlgCancel" :data="dialog.data" :b-create="dialog.bCreate"/>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import renderForm from '@/views/render-table-form'
  import CmButton from '../../../components/Shmf/Common/Button'
  import Const from '../../../utils/const';
  import * as Tool from '../../../utils'
  import Strings from "../../../utils/strings";
  import * as Proto from "../../../utils/Proto"
  import DlgJigouCreate from '../../../components/Shmf/Basic/Jigou/Beian/DlgCreate'
  export default {
    components: { CmButton, DlgJigouCreate},
    mixins: [renderForm],
    data() {
      return {
        formLabelWidth: '100px',
        search: {
          shxydm: '',
          jgmc: '',
          type: '',
        },
        tableFrom: 'table/basic/jigou/beian',
        types: [],
        dialog: {
          title: '',
          bShow: false,
          type: Const.JIGOU.KAIFA,
          bCreate: false,
          data: {}
        }
      }
    },
    methods: {
      init() {
        // this.$http.get('jigou/types').then(response => {
        //   this.typs = [];
        //   let data = JSON.parse(response.data);
        const keys = Object.keys(Const.JIGOU);
        keys.map((key) => {
          this.types.push({value: Const.JIGOU[key], label: Strings.JIGOU[key] ? Strings.JIGOU[key]: '' });
        })
        // })
      },

      onSearch() {
        let table = this.$refs[this.table.ref];
        let query = table.queryParams;
        query.type = this.search.type;
        query.jgmc = this.search.jgmc;
        query.shxydm = this.search.shxydm;
        table.handleSearch()
      },

      onClear() {
        this.search.type = '';
        this.search.jgmc = '';
        this.search.shxydm = '';
        this.onSearch();
      },

      onAdd() {
        this.dialog.bShow = true;
        this.dialog.title = '创建';
        this.dialog.bCreate = true;
        this.dialog.data = Tool.createObject(Proto.JIGOU);
        // this.$refs[this.table.ref].handleCreate();
      },
      onUpdateRow(row) {
        this.dialog.bShow = true;
        this.dialog.title = '更新';
        this.dialog.bCreate = false;
        this.dialog.data = Tool.createObject(row);
      },
      onEdit() {

      },
      onExportExcel() {
        this.$refs[this.table.ref].handleExport();

      },
      onChangeType(value) {
        this.search.type = value;
      },
      onDlgCancel(bRefresh = false) {
        if (bRefresh)
          this.$refs[this.table.ref].getList();
        this.dialog.bShow = false;
        this.$refs['dlgCreate'].onCancel();
      },

    },
    created() {
      this.init();
    }
  }
</script>
