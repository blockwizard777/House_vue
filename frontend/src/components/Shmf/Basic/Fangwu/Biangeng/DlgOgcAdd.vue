<template>
  <div style="height : 75vh;" class="fenhu-list">
      <el-col :span="6" style="height: 100%;">
        <el-tree
          :data="tree.data_top"
          :props="tree.props"
          node-key="idx_top"
          :expand-on-click-node="false"
          @node-click="onTreeNodeClick"
          style="height: 45%; overflow-y: scroll"
        />
        <el-divider/>
        <el-tree
          :data="tree.data_under"
          :props="tree.props"
          node-key="idx_under"
          :expand-on-click-node="false"
          @node-click="onTreeNodeClick"
          style="height: 55%; overflow-y: scroll"
        />
      </el-col>
      <el-col :span="18" style="height: 100%; overflow-y: scroll">
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
      </el-col>
    <el-button type="primary" class="fr" icon="el-icon-check" style="margin-right: 20px;"
               @click="onOk"
    >确定</el-button>
  </div>
</template>
<script>
  import * as Tool from '../../../../../utils'
  import Const from '../../../../../utils/const'
  import treeTable from '../../../../TreeTable'

  export default {
    name: 'DlgBasicFangwuBiangengSelect',
    components: {treeTable},
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
        tree: {
          data_top: [
            {
              idx: 0,
              label: 'xxxx小区',
            },
            {
              idx: 1,
              label: 'xxxx小区1',
              children: [
                { idx: 11, label: 'xxxx路 yyy号' },
                { idx: 13, label: 'xxxx路 yyy号' },
              ]
            },
            {
              idx: 2,
              label: 'xxxx小区2',
              children: [
                { idx: 21, label: 'xxxx路 yyy号' },
                { idx: 22, label: 'xxxx路 yyy号' },
              ]
            },
            {
              idx: 3,
              label: 'xxxx小区3',
              children: [
                { idx: 31, label: 'xxxx路 yyy号' },
                { idx: 32, label: 'xxxx路 yyy号' },
              ]
            }
          ],
          data_under: [
            {
              idx: 0,
              label: 'bone',
              children: [
                { 
                  idx: 1, 
                  label: 'grand-father1',
                },
                {
                  idx: 2, 
                  label: 'grand-father2',
                  children: [
                    {
                      idx: 21,
                      label: 'grand-frather21'
                    },
                    {
                      idx: 22,
                      label: 'grand-frather22'
                    }
                  ]
                },
                {
                  idx: 3, 
                  label: 'grand-father3',
                },
                {
                  idx: 4, 
                  label: 'grand-father4',
                },
                {
                  idx: 5, 
                  label: 'grand-father5',
                },
                {
                  idx: 6, 
                  label: 'grand-father6',
                },
                {
                  idx: 7, 
                  label: 'grand-father7',
                },
                {
                  idx: 8, 
                  label: 'grand-father8',
                },
                {
                  idx: 9, 
                  label: 'grand-father9',
                  children: [
                    {
                      idx: 91,
                      label: 'grand-frather91'
                    },
                    {
                      idx: 92,
                      label: 'grand-frather92'
                    }
                  ]
                }
              ]
            },
          ],
          props: {
            label: 'label'
          }
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
