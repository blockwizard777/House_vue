<template>
  <div class="app-container">
    <header><h3>房屋退款</h3></header>
    <el-divider></el-divider>
    <div class="filter-container" style="padding: 0 50px;">
      <el-form>
        <el-form-item label="房屋信息"  :label-width="formLabelWidth">
          <el-button type="primary" @click="onAdd()" icon="el-icon-plus">添加</el-button>
        </el-form-item>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="物业区域名称"  :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="物业区域编号"  :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="房屋账户"  :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="房屋余额"  :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="业主姓名"  :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="房屋编号"  :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="房屋地址"  :label-width="formLabelWidth">
          <el-input placeholder=""/>
        </el-form-item>
        <el-form-item label="退款原因"  :label-width="formLabelWidth">
          <el-input placeholder=""
                    type="textarea"
                    :rows="4"
                    v-model="query"/>
        </el-form-item>
        <el-button type="primary" icon="el-icon-check">提交</el-button>
      </el-form>
    </div>
    <div class="dialog-wrapper">
      <el-dialog @close="onCloseDialog"
                 :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                 :class="dialog.type" :width="dialog.width" :top="dialog.top">
        <DlgFangwuSearch v-if="dialog.type==0" :props="dialog.data" :onClose='onCloseDialog' :from="NAME"/>
      </el-dialog>
    </div>
  </div>
</template>

<script>
    import Strings from '../../utils/strings';
    import Const from '../../utils/const';
    import * as Proto from '../../utils/Proto';
    import * as Tool from '../../utils';
    import CmButton from '../../components/Shmf/Common/Button'
    import DlgFangwuSearch from "../../components/Shmf/Basic/Fangwu/DlgFangwuSearch";

    export default {
        components: {CmButton, DlgFangwuSearch},
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_TUIKUAN,
                query: '',
                formLabelWidth: '120px',
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
            onAdd() {
                this.dialog.show = true;
                this.dialog.type = 0;
                this.dialog.title = '房屋查询';
                this.dialog.width = '80%';
                this.dialog.top = '10vh';
            },
            onCloseDialog(data) {
                this.dialog.show = false
            },
        },
        created() {
            this.init();
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

  .temp-item-span {
    display: block;
    border: solid rgba(0, 0, 0, 0.2) 1px;
    padding-left: 10px;
    border-radius: 5px
  }

</style>


