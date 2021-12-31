<template>
  <div class="app-container zz-app-container zz-basic-zhuanghu">
    <header><h3>专户管理</h3></header>
    <el-divider></el-divider>
    <div class="filter-container mt-28" style="padding: 0 25px;">
      <el-form>
        <el-row :getter="24">
          <el-col :span="6">
            <el-form-item label="账户" :required="true" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="search.no"/>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="账户名称" :required="true" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="search.name"/>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="账户类型" :required="true" :label-width="formLabelWidth">
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
          <el-col :span="6" style="padding: 0 20px;">
            <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">
              查询
            </cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">
              清空
            </cm-button>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-table :data="list" tooltip-effect="dark"  border :show-header="true">
        <el-table-column label="账户" width="100" prop="no"/>
        <el-table-column label="账户名称" width="250" prop="name"/>
        <el-table-column label="账户类型" width="100" prop="type"/>
        <el-table-column label="余额（元）" width="100" prop="amount"/>
        <el-table-column label="利息积数" width="100" prop="inc"/>
        <el-table-column label="累积积数" width="100" prop="dec"/>
        <el-table-column label="操作" width="150">
          <el-button @click="onInspect">查看</el-button>
        </el-table-column>
      </el-table>
      <div class="dialog-wrapper">
        <el-dialog class="zhuanghu-dialog" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type">
          <DlgZhanghuInfo :onClose='onCloseDialog'/>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<script>
  import CmButton from '../../../components/Shmf/Common/Button'
  import DlgZhanghuInfo from '../../../components/Shmf/Common/DlgZhanghuInfo'

  export default {
    components: { CmButton, DlgZhanghuInfo},
    data() {
      return {
        query: '',
        formLabelWidth: '100px',
        list: [],
        bShowDlg: {
          jiaokuan: false,
          hetong: false,
          tuikuan: false,
          upload: false
        },
        types: [],
        search: {
          no: '',
          name: '',
          type: ''
        },
        dialog: {
          title: '',
          show: false,
          type: '',
          data: null
        }
      }
    },
    methods: {

      onSearch() {
        this.createList(this.getRand(10))
      },
      onClear() {
        this.query = ''
        this.createList(50);
      },
      onDlgOk(type) {
        this.onDlgCancel()
      },
      onDlgCancel() {
        let keys = Object.keys(this.bShowDlg)
        for (let idx in keys) {
          this.bShowDlg[keys[idx]] = false
        }
      },
      onClickListButton(item, type) {
        if (this.bShowDlg[type] === undefined) return
        this.bShowDlg[type] = true
      },
      onChangeType(value) {
        this.search.type = value;
      },
      getRand(max) {
        let rnd = Math.random() * max
        return rnd
      },
      createList(count) {
        this.list = []
        for (let i = 0; i < count; i++) {

          let rnd1 = this.getRand(4)
          let element = {
            no: '1234567890',
            name: 'XXXX路X号XXX单元XXX系统项目账户',
            type: '项目账户',
            amount: '0.00',
            inc: '2334563.23',
            dec: '2334563.23'
          }
          this.list.push(element)
        }
        this.types = [];
        let labels = ['代管户', '业委会账户', '填値户', '利息户', '填値收益户', '项目账户', '区域公共收益户', '幢公共收益户',
          '单元公共收益户', '分户账户', '公有售房单位账户', '公有售房个人账户'];
        for ( let i in labels) {
          let label = labels[i];
          this.types.push({value: i, label})
        }
      },
      onInspect() {
        this.dialog.title = '楼盘选择框'
        this.dialog.show = true
        this.dialog.type = 'zhanghu'
      },
      onCloseDialog(data) {
        this.dialog.show = false
      }
    },
    created() {
      this.createList(50)
    }
  }
</script>
<style lang="scss">
  .list-row {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 0 30px;
  }
  .zz-basic-zhuanghu .dialog-wrapper .zhanghu .el-dialog {
    width: 65%;
    margin-top: 12vh !important;
  }

</style>

