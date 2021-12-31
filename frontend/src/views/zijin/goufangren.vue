<template>
  <div class="app-container  zz-app-container zz-fangwu-biangeng">
    <div class="zz-Head">购房人交款, 退款</div>
    <el-divider/>
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="16">
            <el-form-item label="房屋查询" class="zz-linespcae-exact" :label-width="formLabelWidth">
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
      <div v-for="(element, index) in list" :key="index" class="board-item"
           style="border: 1px solid #c3c3c3; margin-bottom: 10px">
        <div class="list-row" style="height: 40px; background: #e2f2ef; font-weight: bold;">
          <div><i class="el-icon-s-home" style="color: #fc4415; font-size: 1.1em"/>
            | {{element.wyqy.mc}} | 地址 ：{{element.fw.dz}}
          </div>
          <div style="display: flex; justify-content: flex-end; flex: 1;">
            <el-button type="primary" @click="onClickListButton(element, 'jiaokuan')">交款</el-button>
            <el-button style="color: #00aa82;" @click="onClickListButton(element, 'tuikuan')">退款</el-button>
          </div>
        </div>
        <div class="list-row" style="height: 45px; font-size: 14px;">
          业主姓名： {{element.yz.xm}} 建筑面的： {{element.fw.jzjm}}㎡
          应交款： <span style="color: #fc4415">{{element.yjk}}</span>元
          单位应交款：<span style="color:#fc4415">{{element.dwyjk}}</span>元
          个人余额：<span style="color:green">{{element.grye}}</span>元
          单位余额：<span style="color:green">{{element.dwye}}</span>元
          状态： {{element.zt == 0 ? '正常':'异常'}}
        </div>
      </div>
    </div>
    <div class="dialog-wrapper">
      <el-dialog class="goufangren-dialog" @close="onCloseDialog"
                 :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                 :class="dialog.type" :width="dialog.width" :top="dialog.top">
        <DlgJiaokuan v-if="dialog.type=='jiaokuan'" :props="dialog.data" :onClose='onCloseDialog' :from="NAME"/>
        <DlgTuikuan v-if="dialog.type=='tuikuan'" :props="dialog.data" @closeDilog="onCloseDialog" :from="NAME"></DlgTuikuan>
      </el-dialog>
    </div>
  </div>
</template>

<script>
    import CmButton from '../../components/Shmf/Common/Button'
    import DlgJiaokuan from '../../components/Shmf/Zijin/Goufangren/DlgJiaokuan'
    import DlgTuikuan from '../../components/Shmf/Zijin/Goufangren/DlgTuikuan'
    import DlgHetong from '../../components/Shmf/Zijin/Goufangren/DlgHetong'
    import Const from '../../utils/const'

    export default {
        components: {CmButton, DlgJiaokuan, DlgTuikuan, DlgHetong},
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_GOUFANGREN,
                query: '',
                formLabelWidth: '120px',
                list: [],
                dialog: {
                    type: 0,
                    show: false,
                    data: {},
                    title: '',
                    width: '60%',
                    top: '15vh',
                }
            }
        },
        methods: {
            init() {
                this.initData()
                this.initState()
            },
            initData() {
                this.list = [
                    {
                        fw: {
                            jzjm: 123,
                            dz: '锦绣•苏华建设大路111号22'
                        },
                        wyqy: {
                            mc: '翡翠•苏华',
                            dz: '翡翠•苏华'
                        },
                        yz: {
                            xm: '张小四',
                            zjhm: '123456789',
                            sjhm: '15524252739'
                        },
                        jkr: {
                            xm: '',
                            zjh: ''
                        },
                        yjk: 0,
                        dwyjk: 7494.49,
                        grye: 914.42,
                        dwye: 8723.52,
                        zt: 0,
                        ykr: {
                            xm: '',
                            zjh: ''
                        }
                    },
                    {
                        fw: {
                            jzjm: 123,
                            dz: '锦绣•苏华建设大路111号22'
                        },
                        wyqy: {
                            mc: '翡翠•苏华',
                            dz: '翡翠•苏华'
                        },
                        yz: {
                            xm: '张小四',
                            zjhm: '123456789',
                            sjhm: '15524252739'
                        },
                        jkr: {
                            xm: '',
                            zjh: ''
                        },
                        yjk: 0,
                        dwyjk: 6189.49,
                        grye: 0,
                        dwye: 8723.52,
                        zt: 0,
                        ykr: {
                            xm: '',
                            zjh: ''
                        }
                    }
                ]
            },
            initState() {
                this.dialog = {
                    type: 0,
                    show: false,
                    data: {},
                    title: '',
                    width: '60%',
                    top: '15vh'
                }
            },
            onSearch() {
                // let rnd = Math.random() * 3
                // this.createList(rnd)
            },
            onClear() {
                // this.query = ''
                // this.createList(10)
            },

            onCloseDialog(data) {
                this.dialog.show = false
            },
            onClickListButton(item, type) {
                this.dialog.show = true;
                this.dialog.type = type;
                this.dialog.data = item;
                this.dialog.title = type == 'jiaokuan' ? '购房人交款业务' : '退款业务';
                this.dialog.width = '70%';
                this.dialog.top = '10vh';
            }
        },
        created() {
            this.init()
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
