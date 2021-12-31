<template>
  <div class="app-container zz-app-container zz-basic-row13">
    <div class="zz-Head">:-) :-( Title</div>
    <el-divider/>
    <div class="filter-container mt-10">
      <el-form>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="row1-1" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row11"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row1-2" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row12"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row1-3" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row13"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="row2-1" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row21"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row2-2" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row22"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row2-3" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row23"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="row3-1" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row31"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row3-2" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row32"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row3-3" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row33"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="row4-1" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row41"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row4-2" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row42"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="row4-3" :label-width="formLabelWidth" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="data.row43"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row style="margin-bottom: 10px;">
        <CmButton type="primary" icon="el-icon-plus" @click="onAdd">Add</CmButton>
        <cm-button class="filter-item" icon="el-icon-minus" @click="onSave">minus</cm-button>
      </el-row>
      <div class="content">
        <table style="width: 100%">
          <thead>
            <tr>
              <th colspan="3" style="">idontknow</th>
              <th></th>
              <th></th>
              <th ></th>
              <th></th>
              <th></th>
            </tr>
            <tr class="title-header">
              <th style="width: 3%; height: 33px"></th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th>....</th>
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
          </tr>
          </tbody>
        </table>

        <div class="dialog-wrapper">
          <el-dialog :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type">
            <div v-if="dialog.type=='add'">
              <DlgOgc :onClose='onCloseDialog'/>
            </div>
          </el-dialog>
        </div>
      </div>
    </div>
    <div class="zz-content">
      <el-row style="margin-bottom: 10px;">
        <CmButton type="primary" icon="el-icon-search" @click="onSearch">Add</CmButton>
        <CmButton class="filter-item" icon="el-icon-minus" @click="onSave">minus</CmButton>
      </el-row>
      <div class="content">
        <table style="width: 100%">
          <thead>
            <tr>
              <th colspan="3" style="">idontknow</th>
              <th></th>
              <th></th>
              <th ></th>
              <th></th>
              
            </tr>
            <tr class="title-header">
              <th style="width: 3%; height: 33px"></th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th style="width: 13.8%">....</th>
              <th>....</th>
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
          </tr>
          <tr>
            <td style="height: 33px;"></td>
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
          </tr>
          <tr>
            <td style="height: 33px;"></td>
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
          </tr>
          <tr>
            <td style="height: 33px;"></td>
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
          </tr>
          </tbody>
        </table>
        
        <div class="dialog-wrapper">
          <el-dialog :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type" :width="dialog.width">
            <div v-if="dialog.type=='search'">
              <DlgOgcSearch :onClose='onCloseDialog'/>
            </div>
          </el-dialog>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

  import CmButton from '../../components/Shmf/Common/Button'
  import Strings from '../../utils/strings'
  import DlgOgcAdd from '../../components/Shmf/Basic/Fangwu/Biangeng/DlgOgcAdd'
  import DlgOgcSearch from '../../components/Shmf/Basic/Fangwu/Biangeng/DlgOgcSearch'

  export default {
    components: {CmButton, DlgOgcAdd, DlgOgcSearch},
    data() {
      return {
        Strings,
        query: '',
        formLabelWidth: '120px',
        data: {
          row11: '',
          row12: '',
          row13: '',
          row21: '',
          row22: '',
          row23: '',
          row31: '',
          row32: '',
          row33: '',
          row41: '',
          row42: '',
          row43: '',
        },
        dialog: {
          title: '',
          show: false,
          type: '',
          data: null,
          width: '80%'
        },
      }
    },
    methods:{
      onCloseDialog() {
        this.dialog.show = false
      },
      onAdd() {
        this.dialog.type = 'add';
        this.dialog.title = 'Add';
        this.dialog.show = true;
      },

      onSearch() {
        this.dialog.type = 'search';
        this.dialog.title = 'search';
        this.dialog.show = true;
      },
      onSave() {

      }
    }
  }
</script>

<style lang="scss">

  .row13 .content table {
    border-spacing: initial !important;
  }

  .row13 .content th {
    border: 1px solid #c1c7c6 !important;
    background: #e2f2ef;
    font-size: 13px;
  }

  .row13 .content td {
    border: 1px solid #c1c7c6 !important;
  }

  .zz-content .dialog-wrapper .select .el-dialog {
    width: 85%;
    margin-top: 7vh !important;
  }
  
  .zz-fangwu-biangeng .zz-content .dialog-wrapper .upload .el-dialog {
    width: 20%;
    margin-top: 7vh !important;
  }
  
  .title-header {
    background: #ffffff4b !important;
  }
</style>