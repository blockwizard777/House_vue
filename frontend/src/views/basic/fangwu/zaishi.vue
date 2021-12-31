<template>
  <div class="app-container zz-app-container zz-basic-zaishi">
    <div class="zz-Head">房屋数据灾失</div>
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
            <el-form-item label="行政区域" :label-width="formLabelWidth">
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
            <el-form-item label="物业区域地址" :label-width="formLabelWidth">
              <el-input></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="分割原因" :label-width="formLabelWidth">
              <el-input></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <CmButton type="primary" icon="el-icon-plus" style="margin-top: 10px" @click="onSelect">选择注销房屋</CmButton>
      <table style="margin-top: 15px;">
        <thead>
        <tr>
          <th style="width:50px; height:33px"></th>
          <th style="width:128px;">楼栋名称</th>
          <th style="width:107px;">单元</th>
          <th style="width:107px;">楼层</th>
          <th style="width:107px;">室号</th>
          <th style="width:200px;">房屋地址</th>
          <th style="width:130px;">分户余额（元）</th>
          <th style="width:130px;">建筑面积（元）</th>
          <th style="width:130px;">房屋用途</th>
          <th style="width:130px;">购房类型</th>
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
        </tr>
        </tbody>
      </table>
      <CmButton type="primary" icon="el-icon-plus" style="margin-top: 30px" @click="onSelect">选择注销楼栋</CmButton>
      <table style="width:100%; margin-top: 15px; ">
        <thead style="">
        <tr>
          <th style="width:5%;height:33px"></th>
          <th style="">楼栋名称</th>
          <th style="">建成年代</th>
          <th style="">楼栋面积</th>
          <th style="">总楼层</th>
          <th style="">房屋总面积</th>
          <th style="">应交款合计（元）</th>
          <th style="">账户余额合计（元）</th>
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
    import Strings from '../../../utils/strings'
    import Const from '../../../utils/const'
    import * as Proto from '../../../utils/Proto'
    import * as Tool from '../../../utils'
    import CmButton from '../../../components/Shmf/Common/Button'
    import DlgSelect from '../../../components/Shmf/Basic/Fangwu/Biangeng/DlgSelect'

    export default {
        components: {SingleImageUpload2, CmButton, DlgSelect},
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
  .zz-basic-zaishi .dialog-wrapper .select .el-dialog {
    width: 85%;
    margin-top: 7vh !important;
  }
</style>
