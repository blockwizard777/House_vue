<template>
  <div class="app-container zz-app-container zz-zijin-pingzheng">
    <div class="zz-Head">凭证打印</div>
    <el-divider></el-divider>
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="10">
            <el-form-item label="关键字" :required="true" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
          <el-col :span="8" style="padding: 0 20px;">
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
      <table style="width: 100%;">
        <thead>
        <tr style="height: 35px;">
          <th style="width: 3%;"></th>
          <th>通知单编号</th>
          <th>业务单编号</th>
          <th>通知单类型</th>
          <th>发送时间</th>
          <th>交易金额</th>
          <th>通知到状态</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(item, index) in list" :key="index" style="height: 30%;">
          <td class="zz-header"><div class="center">{{index+1}} </div></td>
          <td><div class="center">{{item.tongzhidan_bianhao}}                      </div></td>
          <td><div class="center">{{item.yewudan_bianhao}}                         </div></td>
          <td><div class="center">{{item.tongzhidan_leixing}}                      </div></td>
          <td><div class="center">{{item.fasong_shijian}}                          </div></td>
          <td><div class="center">{{item.jiaoyi_jine}}                             </div></td>
          <td><div class="center">{{item.tongzhidao_zhuangtai}}                    </div></td>
          <td>
            <div class="center">
              <el-button type="primary">打印交款凭证</el-button>
              <el-button>打印财政票据</el-button>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
      <el-dialog title="购房人交款业务" :visible.sync="bShowDlg.jiaokuan" width="80%" @close="onDlgCancel">
        <DlgJiaokuan @closeDilog="onDlgCancel"></DlgJiaokuan>
      </el-dialog>
    </div>
  </div>
</template>

<script>
    import CmButton from '../../components/Shmf/Common/Button'
    import DlgJiaokuan from '../../components/Shmf/Zijin/Goufangren/DlgJiaokuan'

    export default {
        components: {CmButton, DlgJiaokuan},
        data() {
            return {
                query: '',
                formLabelWidth: '120px',
                list: [],
                bShowDlg: {
                    jiaokuan: false,
                    hetong: false,
                    tuikuan: false,
                    upload: false
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
            getRand(max) {
                let rnd = Math.random() * max
                return rnd
            },
            createList(count) {
                this.list = []
                for (let i = 0; i < count; i++) {

                    let rnd1 = this.getRand(4)
                    let element = {
                        tongzhidan_bianhao: '1234567890',
                        yewudan_bianhao   : '123456789',
                        tongzhidan_leixing: rnd1 > 2 ? '购房人交款通知单' : '退款通知单',
                        fasong_shijian    : '2020-07-10 12:12:03',
                        jiaoyi_jine       : '5252.00',
                        tongzhidao_zhuangtai : rnd1 >= 3 ? '已通知' : '新通知单'
                    }
                    this.list.push(element)
                }
            }
        },
        created() {
            this.createList(10)
        }
    }
</script>
<style lang="scss">

  .container {
    padding: 20px 80px;
    background-color: rgb(240, 242, 245);
    position: relative;
  }

  .el-dialog__header {
    background: #00aa82 !important;
    padding: 0 10px !important;
    height: 30px;
  }

  .el-dialog__title {
    color: white;
    font-size: 13px;
    font-weight: bold;
    line-height: 30px;
  }

  .el-dialog__headerbtn {
    top: initial !important;
    line-height: 30px;
  }

  .list-row {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 0 30px;
  }

</style>

