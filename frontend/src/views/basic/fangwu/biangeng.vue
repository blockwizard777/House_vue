<template>
  <div class="app-container zz-app-container zz-fangwu-biangeng">
    <div class="zz-Head">房屋数据变更</div>
    <el-divider/>
    <div class="filter-container">
      <el-form>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="物业区城名称" :label-width="formLabelWidth" :required="true">
              <el-select>
                <el-option
                  v-for="item in names"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="行政区域" :label-width="formLabelWidth" :required="true">
              <el-select>
                <el-option
                  v-for="item in provinces"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>

            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="物业区域地址" :label-width="formLabelWidth" :required="true">
              <el-input></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="变更原因" :label-width="formLabelWidth" :required="true">
              <el-input></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="4">
            <el-form-item label="楼栋名称" :label-width="formLabelWidth" :required="true">
              <el-select>
                <el-option
                  v-for="item in names"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <el-form-item label="单元" :label-width="formLabelWidth" :required="true">
              <el-input/>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <el-form-item label="房屋用途" :label-width="formLabelWidth" :required="true">
              <el-select>
                <el-option
                  v-for="item in fangwuyoungtu"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <el-form-item label="地址" :label-width="formLabelWidth" :required="true">
              <el-input></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="替换为" :label-width="formLabelWidth" :required="true">
              <el-input></el-input>
            </el-form-item>
          </el-col>
          <el-col :span=2>
            <CmButton icon="el-icon-edit" type="primary" style="margin-left: 15px;">批量修改</CmButton>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row style="margin-bottom: 10px;">
        <CmButton type="primary" icon="el-icon-plus" @click="onSelect">{{Strings.SELECT}}</CmButton>
      </el-row>
      <div class="content">
        <table>
          <thead>
          <tr class="zz-fix-header">
            <th colspan="9" style="">变更前</th>
            <th colspan="7">变更后</th>
          </tr>
          <tr class="title-header">
            <th style="width: 40px; height: 33px;"></th>
            <th style="width: 90px; ">楼栋名称</th>
            <th style="width: 68px; ">单元</th>
            <th style="width: 68px; ">楼层</th>
            <th style="width: 68px; ">室号</th>
            <th style="width: 267px; ">房屋地址</th>
            <th style="width: 115px; ">房屋用途</th>
            <th style="width: 115px; ">房屋类型</th>
            <th style="width: 115px; ">建筑面积</th>
            <th style="width: 90px; ">楼栋名称</th>
            <th style="width: 68px; ">单元</th>
            <th style="width: 68px; ">楼层</th>
            <th style="width: 68px; ">室号</th>
            <th style="width: 267px; ">房屋地址</th>
            <th style="width: 115px; ">房屋用途</th>
            <th style="width: 115px; ">房屋类型</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height: 33px;"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          </tbody>
        </table>
        <table style="margin-top: 50px;">
          <tbody>
          <tr>
            <td style="width: 87px; height: 41px; text-align: center;">1</td>
            <td style="width: 550px; padding: 0 50px; font-size: 14px;">房屋所有权证（不必填项）</td>
            <td style="width: 244px; text-align: center;">
              <CmButton type="primary">{{Strings.UPLOAD}}</CmButton>
            </td>
            <td style="width: 519px; padding: 0 50px; font-size: 13px;">上传房屋所有权证（委托书）， 支持JPG, GIF格式图片， 不能超过5M</td>
          </tr>
          <tr>
            <td style="width: 87px; height: 41px; text-align: center;">2</td>
            <td style="width: 550px; padding: 0 50px; font-size: 14px; ">契税核验单（不必填项）</td>
            <td style="width: 244px; text-align: center;">
              <CmButton type="primary">{{Strings.UPLOAD}}</CmButton>
            </td>
            <td style="width: 519px; padding: 0 50px; font-size: 13px;">契税核验单，支持JPG, GIF格式图片， 不能超过5M</td>
          </tr>
          </tbody>
        </table>
      </div>
      <CmButton type="primary" icon="el-icon-check">{{Strings.SAVE}}</CmButton>

      <div class="dialog-wrapper">
        <el-dialog :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type">
          <div v-if="dialog.type=='select'">
            <DlgSelect :onClose='onCloseDialog'/>
          </div>
          <div v-if="dialog.type=='upload'">
            <DlgSelect :onClose='onCloseDialog'/>
          </div>
        </el-dialog>
      </div>

    </div>
  </div>
</template>
<script>
  import renderForm from '@/views/render-table-form'
  import SingleImageUpload2 from '../../../components/Upload/SingleImage2'
  import Strings from '../../../utils/strings'
  import Const from '../../../utils/const'
  import * as Proto from '../../../utils/Proto'
  import * as Tool from '../../../utils'
  import CmButton from '../../../components/Shmf/Common/Button'
  import DlgSelect from '../../../components/Shmf/Basic/Fangwu/Biangeng/DlgSelect'

  export default {
    components: { SingleImageUpload2, CmButton, DlgSelect},
    data() {
      return {
        Strings,
        caijiData: [],
        caijiDataProps: {
          label: 'department_name'
        },
        tableFrom: 'table/basic/caji',
        formLabelWidth: '120px',
        engines: [],
        names: [],
        districts: [],
        provinces: [],
        visibleUploadDialog: false,
        visibleSelectDialog: false,
        dialog: {
          title: '',
          show: false,
          type: '',
          data: null,
        },
        fangwuyoungtu: [
          '住宅',
          '商业',
          '办公',
          '车库',
          '车位',
          '其他'
        ]
      }
    },
    methods: {
      onClickTreeItem(data, node, self) {
        alert(data)
      },
      openUploadDialog() {
        this.visibleUploadDialog = true
      },
      closeUploadDialog() {
        this.visibleUploadDialog = false
      },
      openSelectDialog() {
        this.visibleSelectDialog = true
      },
      closeSelectDialog() {
        this.visibleSelectDialog = false
      },
      onSelect() {
        this.dialog.title = '楼盘选择框';
        this.dialog.show = true;
        this.dialog.type = 'select';
      },
      onCloseDialog(data) {
        this.dialog.show = false;
      },
      onUpload() {
        this.dialog.title = '上传文件';
        this.dialog.show = true;
        this.dialog.type = 'upload';
      }
    },

    created() {
    }
  }
</script>
<style lang="scss">


  .zz-fangwu-biangeng .zz-content .dialog-wrapper .select .el-dialog {
    width: 85%;
    margin-top: 7vh !important;
  }

  .zz-fangwu-biangeng .zz-content .dialog-wrapper .upload .el-dialog {
    width: 20%;
    margin-top: 7vh !important;
  }

</style>
