<template>
  <div class="app-container zz-app-container zz-basic-hebing">
    <div class="zz-Head">房屋数据合并</div>
    <el-divider/>
    <div class="filter-container mt-28">
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
            <el-form-item label="分割原因" :label-width="formLabelWidth" :required="true">
              <el-input></el-input>

            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <CmButton type="primary" icon="el-icon-plus" style="margin-top: 10px" @click="onSelect">{{Strings.SELECT}}</CmButton>
      <table style="margin-top: 15px;">
        <thead>
        <tr>
          <th style="width:33px; height:33px"></th>
          <th style="width:108px;">楼栋名称</th>
          <th style="width:87px;">单元</th>
          <th style="width:87px;">楼层</th>
          <th style="width:87px;">室号</th>
          <th style="width:168px;">房屋地址</th>
          <th style="width:110px;">个人本金（元）</th>
          <th style="width:110px;">个人利息（元）</th>
          <th style="width:110px;">个人积数</th>
          <th style="width:110px;">单位本金（元）</th>
          <th style="width:110px;">单位利息（元）</th>
          <th style="width:110px;">单位积数</th>
          <th style="width:110px;"></th>
          <th style="width:110px;"></th>
          <th style="width:110px;">购房总额</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height:33px"></td>
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
          <td style="height:33px"></td>
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
          <td style="height:33px"></td>
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
          <td style="height:33px"></td>
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
      <CmButton type="primary" icon="el-icon-plus" style="margin-top: 30px">{{Strings.IMPORT}}</CmButton>
      <table style="margin-top: 15px;">
        <thead>
        <tr>
          <th style="width:33px; height:33px"></th>
          <th style="width:108px;">楼栋名称</th>
          <th style="width:87px;">单元</th>
          <th style="width:87px;">楼层</th>
          <th style="width:87px;">室号</th>
          <th style="width:168px;">房屋地址</th>
          <th style="width:110px;">个人本金（元）</th>
          <th style="width:110px;">个人利息（元）</th>
          <th style="width:110px;">个人积数</th>
          <th style="width:110px;">单位本金（元）</th>
          <th style="width:110px;">单位利息（元）</th>
          <th style="width:110px;">单位积数</th>
          <th style="width:110px;"></th>
          <th style="width:110px;"></th>
          <th style="width:110px;">购房总额</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height:33px"></td>
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
          <td style="height:33px"></td>
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
          <td style="height:33px"></td>
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
          <td style="height:33px"></td>
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
          <td style="width: 550px; padding: 0 50px; font-size: 14px;">业主身份证（委托书）</td>
          <td style="width: 244px; text-align: center;">
            <CmButton type="primary">{{Strings.UPLOAD}}</CmButton>
          </td>
          <td style="width: 519px; padding: 0 50px; font-size: 13px;">上传照片， 支持JPG, GIF格式图片， 不能超过5M</td>
        </tr>
        <tr>
          <td style="width: 87px; height: 41px; text-align: center;">2</td>
          <td style="width: 550px; padding: 0 50px; font-size: 14px; ">房屋分割，合并申请书</td>
          <td style="width: 244px; text-align: center;">
            <CmButton type="primary">{{Strings.UPLOAD}}</CmButton>
          </td>
          <td style="width: 519px; padding: 0 50px; font-size: 13px;">上传照片，支持JPG, GIF格式图片， 不能超过5M</td>
        </tr>
        <tr>
          <td style="width: 87px; height: 41px; text-align: center;">2</td>
          <td style="width: 550px; padding: 0 50px; font-size: 14px; ">原始收据（收据书面材料）</td>
          <td style="width: 244px; text-align: center;">
            <CmButton type="primary">{{Strings.UPLOAD}}</CmButton>
          </td>
          <td style="width: 519px; padding: 0 50px; font-size: 13px;">上传照片，支持JPG, GIF格式图片， 不能超过5M</td>
        </tr>
        </tbody>
      </table>
      <CmButton type="primary" icon="el-icon-check" style="margin-top: 20px;">{{Strings.SAVE}}</CmButton>
      <div class="dialog-wrapper">
        <el-dialog class="hebing-dialog" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type">
          <DlgSelect :onClose='onCloseDialog'/>
        </el-dialog>
      </div>
    </div>

  </div>
</template>
<script>
  import renderForm from '@/views/render-table-form'
  import SingleImageUpload2 from '../../../components/Upload/SingleImage2'
  import DlgXuanze from '../../../components/Shmf/Basic/Fangwu/Hebing/DlgXuanze'
  import Strings from '../../../utils/strings'
  import Const from '../../../utils/const'
  import * as Proto from '../../../utils/Proto'
  import * as Tool from '../../../utils'
  import CmButton from '../../../components/Shmf/Common/Button'
  import DlgSelect from '../../../components/Shmf/Basic/Fangwu/Biangeng/DlgSelect'

  export default {
    components: { SingleImageUpload2, DlgXuanze, CmButton, DlgSelect},
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
          data: null
        }
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
        this.$http.get('departments').then(response => {
          this.caijiData = response.data
        })
      },
      closeSelectDialog() {
        this.visibleSelectDialog = false
      },

      onSelect() {
        this.dialog.title = '楼盘选择框'
        this.dialog.show = true
        this.dialog.type = 'select'
      },
      onCloseDialog(data) {
        this.dialog.show = false
      }
    },

    created() {
    }
  }
</script>
<style lang="scss">
  .zz-basic-hebing .dialog-wrapper .select .el-dialog {
    width: 85%;
    margin-top: 7vh !important;
  }
</style>
