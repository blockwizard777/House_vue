<template>
  <div class="app-container zz-app-container zz-basic-dengji">
    <div class="zz-Head">房屋数据登记</div>
    <el-divider/>
    <div class="filter-container mt-28">
      <el-form ref="form" :model="state" :validate-on-rule-change="false">
        <el-row :getter="24">
          <el-col :span="7">
            <el-form-item :label="Strings.FWDZ" :label-width="lblWidth" prop="fwdz">
              <el-input v-model="state.fwdz" disabled/>
            </el-form-item>
          </el-col>
          <el-col :span="2">
            <cm-button style="margin-left: 10px;" icon="el-icon-download" @click="onSelectFangwu"
                       icon-style="color: #ff5227;">
              {{Strings.SELECT}}
            </cm-button>
          </el-col>
          <el-col :span="7">
            <el-form-item :label="Strings.JZMJ" :label-width="lblWidth">
              <el-input v-model="state.jzmj" disabled/>
            </el-form-item>
          </el-col>
          <el-col :span="1" class="zz-empty-col"/>
          <el-col :span="8">
            <el-form-item :label="Strings.XZQY" :label-width="lblWidth">
              <el-input v-model="state.xzqh" disabled/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="9">
            <el-form-item :label="Strings.WYQYMC" :label-width="lblWidth">
              <el-input v-model="state.wyqy" disabled/>
            </el-form-item>
          </el-col>
          <el-col :span="15"></el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="16">
            <el-form-item :label="Strings.BGYY" :label-width="lblWidth" props>
              <el-input v-model="state.bgyy" style="width: 400px;"/>
              <cm-button style="margin-left: 10px;" icon="el-icon-bank-card" icon-style="color: #ff5227;">
                {{Strings.DQSFZ}}
              </cm-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row>
        <cm-button class="filter-item search" icon="el-icon-plus" type="primary" @click="onAdd">{{Strings.ADD}}
        </cm-button>
        <cm-button class="filter-item" icon="el-icon-finished" @click="onDelete" icon-style="color: #ff5227;">
          {{Strings.DELETE}}
        </cm-button>
      </el-row>
      <table style="margin-top: 20px;" class="full-width">
        <thead>
        <tr>
          <th style="background: #cfefe7; height:30px; text-align: left; padding: 0 20px;" colspan="7">原权属信息</th>
          <th style="background: #f9dfd9; text-align: left; padding: 0 20px;" colspan="6">现权属信息</th>
        </tr>
        <tr>
          <th style="width: 54px; height:36px;"></th>
          <th style="  ">证件号码</th>
          <th style="  ">业主姓名</th>
          <th style="  ">证件类型</th>
          <th style="width: 5%;"></th>
          <th style="  ">手机</th>
          <th style="  ">邮箱</th>
          <th style="  ">证件号码</th>
          <th style="  ">业主姓名</th>
          <th style="  ">证件类型</th>
          <th style="width: 5%;"></th>
          <th style="  ">手机</th>
          <th style="  ">邮箱</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height:36px;"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="width: 54px; height:36px;"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        </tbody>
      </table>
      <table style="margin-top: 50px;">
        <tbody>
        <tr>
          <td style="width: 87px; height: 41px; text-align: center;">1</td>
          <td style="width: 550px; padding: 0 50px; font-size: 14px;">买卖双方身份证（委托书）</td>
          <td style="width: 244px; text-align: center;">
            <CmButton type="primary" @click="onUpload">{{Strings.UPLOAD}}</CmButton>
          </td>
          <td style="width: 519px; padding: 0 50px; font-size: 13px;">上传买卖双方身份证（委托书）， 支持JPG, GIF格式图片， 不能超过5M</td>
        </tr>
        <tr>
          <td style="width: 87px; height: 41px; text-align: center;">2</td>
          <td style="width: 550px; padding: 0 50px; font-size: 14px; ">房屋产权转移申请书</td>
          <td style="width: 244px; text-align: center;">
            <CmButton type="primary" @click="onUpload">{{Strings.UPLOAD}}</CmButton>
          </td>
          <td style="width: 519px; padding: 0 50px; font-size: 13px;">房屋产权转移申请书，支持JPG, GIF格式图片， 不能超过5M</td>
        </tr>
        </tbody>
        <tr style="width: 87px; height: 41px;"></tr>
      </table>
      <CmButton type="primary" icon="el-icon-check">{{Strings.SAVE}}</CmButton>
      <el-dialog :class="dialog.class" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                 @close="onCloseDialog">
        <DlgFangwuSearch v-if="dialog.type ==0" :onClose="onCloseDialog"/>
        <DlgUpload v-else-if="dialog.type==1" :onClose='onCloseDialog' :before-upload="beforeUpload"/>
      </el-dialog>
    </div>
  </div>
</template>
<script>
    import Strings from '../../../utils/strings';
    import Const from '../../../utils/const';
    import * as Proto from '../../../utils/Proto';
    import * as Tool from '../../../utils';
    import CmButton from '../../../components/Shmf/Common/Button';
    import SingleImageUpload2 from '../../../components/Upload/SingleImage2';
    import DlgFangwuSearch from '../../../components/Shmf/Basic/Fangwu/DlgFangwuSearch';
    import DlgUpload from '../../../components/Shmf/Basic/Fangwu/Dengji/DlgShangchuan';

    export default {
        components: {SingleImageUpload2, CmButton, DlgFangwuSearch, DlgUpload},
        data() {
            return {

                Strings,
                lblWidth: '120px',
                state: {
                    fwId: '',
                    fwdz: '',
                    jzmj: '',
                    xzqh: '',
                    wyqy: '',
                    bgyy: '',
                    quanshu: {}
                },
                dialog: {
                    title: '',
                    show: false,
                    type: '',
                    data: null,
                    class: ''
                },
            }
        },
        methods: {
            init() {
            },
            initData() {
            },
            onSelectFangwu() {
                this.dialog.type = 0;
                this.dialog.title = '选择房屋';
                this.dialog.show = true;
                this.dialog.class = 'dengji-dialog';
            },
            onCloseDialog(data) {
                this.dialog.show = false;
                if (this.dialog.type == 0 && data) {
                    this.state.fwdz = data.XYDZ;
                    this.state.jzmj = data.JZMJ;
                }
            },
            onUpload() {
                this.dialog.type = 1;
                this.dialog.title = '上传文件';
                this.dialog.show = true;
                this.dialog.class = 'dengji-dialog_upload';
            },
            onAdd() {

            },
            onDelete() {

            },
            beforeUpload() {

            }

        },

        created() {
        }
    }
</script>
<style lang="scss">

  .el-dialog__header {
    background: #00aa82 !important;
    padding: 20px !important;
  }

  .dengji-dialog .el-dialog {
    width: 80%;
  }

  .dengji-dialog_upload .el-dialog {
    width: 20%;
  }


</style>



