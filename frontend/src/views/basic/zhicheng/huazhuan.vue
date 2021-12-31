<template>
  <div class="app-container zz-app-container zz-basic-xingzhengquyu">
    <div class="zz-Head">行政区域资金划转管理</div>
    <el-divider></el-divider>
    <div class="filter-container mt-10">
      <el-form>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="物业区域名称" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.wuyequyu_name"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="物业区域地址" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.wuyequyu_address"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="行政区域" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.xingzhengquyu"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="公有售房单位" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.gongyou"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="收款账户账号" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.shoukuanhao"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="收款账户名称" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.shoukuanmingcheng"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="收款账户银行" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.bank"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="预留手机号码" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.mobile"/>
            </el-form-item>
          </el-col>
          <el-col :span="8"></el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row>
        <CmButton type="primary" icon="el-icon-plus">保存</CmButton>
        <CmButton icon="el-icon-delete" icon-style="color: #ff5227;">取消</CmButton>
      </el-row>
      <el-row style="margin-top: 15px; max-height: 60vh; display: flex;">
        <el-col :span="6" class="zz-sidebar-border inline-block">
          <div class="zz-table-header">物业区域信息</div>
          <el-tree
            :data="tree.data"
            :props="tree.props"
            node-key="idx"
            default-expand-all
            highlight-current
            :expand-on-click-node="false"
          />
        </el-col>
        <el-col :span="18" class="inline-block zz-sidebar-border" style="overflow-y: scroll">
          <div class="zz-table-header">房屋信息</div>
          <el-table :data="list" tooltip-effect="dark" border :show-header="true">
            <el-table-column label="单元" prop="no"/>
            <el-table-column label="楼层" prop="name"/>
            <el-table-column label="室号" prop="type"/>
            <el-table-column label="房屋地址" prop="amount"/>
            <el-table-column label="建筑面积" prop="inc"/>
            <el-table-column label="房屋用途" prop="dec"/>
            <el-table-column label="操作">
              <el-button @click="onInspect">查看</el-button>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
      <div class="dialog-wrapper">
        <el-dialog class="xingzhengquyu-dialog" :title="dialog.title" :closeOnClickModal="false"
                   :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type">
          <DlgZhanghuInfo :onClose='onCloseDialog'/>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<script>
  import CmButton from '../../../components/Shmf/Common/Button';
  import DlgZhanghuInfo from '../../../components/Shmf/Common/DlgZhanghuInfo'

  export default {
    components: { CmButton, DlgZhanghuInfo},
    data() {
      return {
        query: '',
        formLabelWidth: '120px',
        list: [],
        types: [],
        data: {
          wuyequyu_name: '',
          wuyequyu_address: '',
          xingzhengquyu: '',
          gongyou: '',
          shoukuanhao: '',
          shoukuanmingcheng: '',
          bank: '',
          mobile: ''
        },
        tree: {
          data: [
            {
              idx: 0, label: '恒大泉州',
              children: [
                {
                  idx: 0, label: '19栋',
                  children: [
                    { idx: 0, label: '分户列表' }
                  ]
                }
              ]
            }
          ],
          props: { label: 'label' }
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
        this.createList(50)
      },
      onClickListButton(item, type) {
        if (this.bShowDlg[type] === undefined) return
        this.bShowDlg[type] = true
      },
      onChangeType(value) {
        this.search.type = value
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
        this.types = []
        let labels = ['代管户', '业委会账户', '填値户', '利息户', '填値收益户', '项目账户', '区域公共收益户', '幢公共收益户',
          '单元公共收益户', '分户账户', '公有售房单位账户', '公有售房个人账户']
        for (let i in labels) {
          let label = labels[i]
          this.types.push({ value: i, label })
        }
      },
      onInspect() {
        this.dialog.title = '楼盘选择框';
        this.dialog.show = true;
        this.dialog.type = 'zhanghu';
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

  .xingzhengquyu .content table {
    border-spacing: initial !important;
  }

  .xingzhengquyu .content th {
    border: 1px solid #c1c7c6 !important;
    background: #e2f2ef;
    font-size: 13px;
  }

  .xingzhengquyu .content td {
    border: 1px solid #c1c7c6 !important;
  }


</style>

