<template>
  <div style="height : 75vh;" class="fenhu-list">
    <el-form>
      <el-row :getter="24">
        <el-col :span="8">
            <el-form-item label="row1-1" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row11"/>
            </el-form-item>
        </el-col>
        <el-col :span="8">
            <el-form-item label="row1-2" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row12"/>
            </el-form-item>
        </el-col>
        <el-col :span="8">
          <CmButton type="primary" icon="el-icon-search">Search</CmButton>
          <cm-button class="filter-item" icon="el-icon-minus">minus</cm-button>
        </el-col>
      </el-row>
    </el-form>
    <table style="width: 100%;">
          <thead>
            <tr style="height: 35px;">
              <th style="width: 3%;"></th>
              <th>first</th>
              <th>second</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in list" :key="index" style="height: 30%;">
              <td class="zz-header"><div class="center">{{index+1}} </div></td>
              <td><div class="center">{{item.first}}</div></td>
              <td><div class="center">{{item.second}}</div></td>
            </tr>
          </tbody>
        </table>
        <div class="pagination-container">
          <el-pagination background @size-change="handleSizeChange" 
          @current-change="handleCurrentChange" :current-page="listQuery.page" :page-sizes="[10,20,30, 50]" 
          :page-size="listQuery.limit" layout="total, sizes, prev, pager, next, jumper" :total="total">
          </el-pagination>
        </div>
  </div>
</template>
<script>
  import * as Tool from '../../../../../utils'
  import Const from '../../../../../utils/const'
  import treeTable from '../../../../TreeTable'
  import CmButton from '../../../../Shmf/Common/Button'

  export default {
    name: 'DlgBasicFangwuBiangengSelect',
    components: {treeTable,CmButton},
    formLabelWidth: '120px',
    props: {
      onClose: {type: Function}
    },
    data() {
      return {
        listQuery: {
        page: 1,
        limit: 20,
        importance: undefined,
        title: undefined,
        type: undefined,
        sort: '+id'
      },
      data: {
          row11: '',
          row12: '',
          row13: '',
          row21: '',
          row22: '',
          row23: '',
          row31: '',
          row32: '',
          row33: '',
          row41: '',
          row42: '',
          row43: '',
        },
        dialog: {
          title: '',
          show: false,
          type: 0,
          data: null,
        },
        list:[
          {
            first: 'adfadf',
            second: 'adfadfadf',
          },
          {
            first: 'adfadf1',
            second: 'adfadfadf1',
          },
          {
            first: 'adfadf2',
            second: 'adfadfadf2',
          },
        ],
      }
    },
    methods: {
      setType(type) {
        this.type = type
      },
      onTreeNodeClick() {
      },
      onTableExpand(idx) {
        this.table[idx].open = !this.table[idx].open
      },
      onDblClick() {
        console.log('dblclick');
        this.dialog.show = true;
        this.dialog.type = 0;
        this.dialog.title = '房屋信息';
      },
      handleSizeChange(val) {
        // this.listQuery.limit = val
        // this.getList()
      },
      handleCurrentChange(val) {
        //this.listQuery.page = val
        //this.getList()
      },
      onDblClickZhanghu() {
        this.dialog.show = true;
        this.dialog.type = 1;
        this.dialog.title = '账户信息';
      },
      onOk() {
        this.onClose && this.onClose(false);
      },
      onCloseDialog(data) {
        this.dialog.show = false
      },
      createList(count) {
      }
    },
    created() {
      this.createList(9)
    }
  }
</script>

<style scoped>
  .inline-block {
    display: inline-block;
  }

  .luopan .border-right-1 {
    border-right: 1px solid gray;
  }

  .luopan .text-sm {
    font-size: 0.7rem;
  }

  .luopan .vertical-middle {
    vertical-align: middle !important;
  }

  .luopan tbody > tr > td {
    width: 9%;
  }

  .status-not-enough {
    background: red;
  }
  .status-normal {
    background-color : #bbfff8;
  }

</style>
