<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="6">
            <el-form-item :label="Strings.ZJHM" :label-width="lblWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="search.ZJHM"/>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item :label="Strings.YZXM" :label-width="lblWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="search.YZXM"/>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item :label="Strings.FWDZ" :label-width="lblWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="search.FWDZ"/>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <cm-button class="filter-item search" icon="el-icon-search" @click="onSearch" icon-style="color: #ff5227;" style="margin-left: 20px;">{{Strings.SEARCH}}</cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">{{Strings.CLEAR}}</cm-button>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <div class="zz-content">
      <zz-table
        :ref="table.ref"
        :headers="table.headers"
        :border="true"
        :table-events="table.events"
        :api-route="table.apiRoute"
        :rowSelectable="true"
      />
      <el-row>
        <div class="fr">
          <cm-button class="filter-item search" icon="el-icon-check" type="primary" @click="onOk">确定</cm-button>
          <cm-button class="filter-item" icon="el-icon-back" @click="onCancel" icon-style="color: #ff5227;">取消</cm-button>
        </div>
      </el-row>
    </div>

  </div>
</template>

<script>
  import renderForm from '@/views/render-table-form'
  import CmButton from '../../Common/Button'
  import Const from '../../../../utils/const';
  import * as Tool from '../../../../utils'
  import Strings from '../../../../utils/strings'

  export default {
    name: 'DlgFangwuSearch',
    mixins: [renderForm],
    components: {CmButton},
    props: {
      onClose: {type: Function}
    },
    data() {
      return {
        Strings,
        lblWidth: '100px',
        search: {
          ZJHM: '',
          YZXM: '',
          FWDZ: '',
        },
        tableFrom: 'table/basic/fangwu/DengjiFangwuSearch',
      }},
    methods: {
      onSearch() {
        let table = this.$refs[this.table.ref];
        let query = table.queryParams;
        query.ZJHM = this.search.ZJHM;
        query.yzxm = this.search.YZXM;
        query.xydz = this.search.FWDZ;
        table.handleSearch()
      },
      onClear() {
        this.search.ZJHM = '';
        this.search.YZXM = '';
        this.search.FWDZ = '';
        this.onSearch();

      },
      onOk() {
        let table = this.$refs[this.table.ref];
        const row = table.currentRow;
        this.onClose && this.onClose(row);
      },
      onCancel() {
        this.onClose && this.onClose(false);
      }
    }
  }
</script>

<style scoped>

</style>
