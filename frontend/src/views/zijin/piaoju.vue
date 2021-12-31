<template>
  <div class="app-container zz-app-container zz-zijin-piaoju">
    <div class="zz-Head">票据管理</div>
    <el-divider></el-divider>
    <div class="filter-container"></div>
    <el-divider/>
    <div class="zz-content">
      <table style="width: 100%">
        <thead>
        <tr>
          <th style="height: 30px; width: 5%;"></th>
          <th style="width: 35%;">单据名称</th>
          <th style="width: 15%;">上传</th>
          <th style="width: 15%;">还原</th>
          <th style="width: 15%;">下载</th>
          <th style="width: 15%;">参数说明</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(item, index) in list">
          <td style="">
            <div class="center">{{index + 1}}</div>
          </td>
          <td>
            <div style="padding-left: 20px; ">{{item.name}}</div>
          </td>
          <td>
            <div class="center">
              <el-button @click="onClickButton(item,'lingqu')" size="medium" style="color: #00aa82;">上传
              </el-button>
            </div>
          </td>
          <td>
            <div class="center">
              <el-button @click="onClickButton(item,'tongji')" size="medium" style="color: #00aa82;">还原</el-button>
            </div>
          </td>
          <td>
            <div class="center">
              <el-button size="medium" style="color: #00aa82;">下载</el-button>
            </div>
          </td>
          <td>
            <div class="center">
              <el-button size="medium" style="color: #00aa82;" @click="onClickButton(item,'zhikuandan')">查看</el-button>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
      <div class="dialog-wrapper">
        <el-dialog class="goufangren-dialog" @close="onCloseDialog"
                   :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   :class="dialog.type" :width="dialog.width" :top="dialog.top">
          <DlgZhikuandan v-if="dialog.type=='zhikuandan'" :props="dialog.data" :onClose='onCloseDialog' :from="NAME"/>
          <DlgTongji v-else-if="dialog.type=='tongji'" :props="dialog.data" @closeDilog="onCloseDialog" :from="NAME"/>
          <DlgLingqu v-else-if="dialog.type=='lingqu'" :props="dialog.data" @closeDilog="onCloseDialog" :from="NAME"/>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<script>
    import CmButton from '../../components/Shmf/Common/Button'

    import DlgZhikuandan from '../../components/Shmf/Zijin/Piaoju/DlgZhikuandan'
    import DlgTongji from '../../components/Shmf/Zijin/Piaoju/DlgTongji'
    import DlgLingqu from '../../components/Shmf/Zijin/Piaoju/DlgLingqu'

    import Const from '../../utils/const'
    import Strings from '../../utils/strings'
    import * as Proto from '../../utils/Proto'
    import * as Tool from '../../utils'

    export default {
        components: {CmButton, DlgZhikuandan, DlgTongji, DlgLingqu},
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_PIAOJU,
                query: '',
                formLabelWidth: '120px',
                list: [
                    {name: '受理通过告知单'},
                    {name: '受理不通过告知单'},
                    {name: '通过受理告知单'},
                    {name: '不通过受理告知单'},
                    {name: '开发商信息填报申报表'},
                    {name: '物业企业信息填报申报表'},
                    {name: '开发商信息注销申请'},
                    {name: '业委会信息填报申报表'},
                    {name: '开发商信息变更申请表'},
                    {name: '业委会信息变更申请表'},
                ],
                dialog: {
                    type: 0,
                    show: false,
                    data: {},
                    title: '',
                    width: '80%',
                    top: '10vh',
                }
            }
        },
        methods: {
            init() {
                this.initData()
                this.initState()
            },
            initData() {
            },
            initState() {
            },
            onCloseDialog() {
                this.dialog.show = false;
            },
            onClickButton(item, type) {
                this.dialog.type = type;
                this.dialog.show = true;
                this.dialog.width = '80%';
                this.dialog.top = '10vh';

                if (type == 'zhikuandan') {
                    this.dialog.title = '支款单管理';
                } else if (type == 'tongji') {
                    this.dialog.title = '票据统计';
                } else if (type == 'lingqu') {
                    this.dialog.title = '票据领取';
                    this.dialog.width = '90%';
                } else {
                    this.dialog.title = '';
                }
                this.dialog.data.type = item;
            }
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


