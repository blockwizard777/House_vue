<template>
  <div class="app-container wuyequyu">
    <div slot="header" class="clearfix">
      <header><h3>物业区域管理</h3></header>
    </div>
    <el-divider/>
    <div class="filter-container" style="padding: 0 25px;">
      <el-form>
        <el-row :getter="24">
          <el-col :span="6">
            <el-form-item :label="Strings.WYQYMC" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="search.shxydm"/>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item :label="Strings.XZQY" :label-width="formLabelWidth">
              <el-select :value="search.type" placeholder="" >
                <el-option
                  v-for="(item, key) in types"
                  :key="key"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="房屋性质" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="search.jgmc"/>
            </el-form-item>
          </el-col>
          <el-col :span="6" style="padding: 0 20px;">
            <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="clickSearch" >查询</cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" icon-style="color: #ff5227;">清空</cm-button>
          </el-col>
        </el-row>
      </el-form>
      <el-divider/>
    </div>
    <div class="filter-container">
      <cm-button type="primary" icon="el-icon-circle-plus-outline" @click="clickTianjia" >添加</cm-button>
      <cm-button icon="el-icon-edit-outline"  icon-style="color: #ff5227;" @click="clickBianji">编辑</cm-button>
      <cm-button icon="el-icon-download"  icon-style="color: #ff5227;">导出Excel</cm-button>
    </div>
    <div class="content zz-content">
      <table style="margin-top: 15px;">
        <thead>
        <tr>
          <th style="width:50px; height:33px"></th>
          <th style="width:200px;">物业区域名称</th>
          <th style="width:160px;">物业区域代码</th>
          <th style="width:160px;">行政区域</th>
          <th style="width:160px;">物业服务企业</th>
          <th style="width:160px;">开发建设单位</th>
          <th style="width:160px;">应归x金额（元）</th>
          <th style="width:160px;">已归x金额（元）</th>
          <th style="width:160px;">操作</th>
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
        </tr>

        </tbody>
      </table>
      <CmButton type="primary" icon="el-icon-check" style="margin-top: 20px;">{{Strings.SAVE}}</CmButton>
      <el-dialog :class="dialog.type" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                 @close="onCloseDialog">
        <DlgSearch v-if="dialog.type =='search'" :onClose="onCloseDialog"/>
        <DlgTianjia v-else-if="dialog.type=='tianjia'" :onClose='onCloseDialog' :before-upload="beforeUpload"/>
        <DlgBianji v-else-if="dialog.type=='bianji'" :onClose='onCloseDialog' :before-upload="beforeUpload"/>
      </el-dialog>
    </div>
  </div>
</template>
<script>
  import Strings from '../../../utils/strings'
  import Const from '../../../utils/const'
  import * as Proto from '../../../utils/Proto'
  import * as Tool from '../../../utils'
  import CmButton from '../../../components/Shmf/Common/Button'
  import DlgSearch from '../../../components/Shmf/Basic/Wuye/DlgSearch';
  import DlgTianjia from '../../../components/Shmf/Basic/Wuye/DlgTianjia';
  import DlgBianji from '../../../components/Shmf/Basic/Wuye/DlgBianji'
export default {
  components: { CmButton, DlgSearch, DlgTianjia, DlgBianji },
  data() {
    return {
      Strings,
      formLabelWidth: '100px',
      search: {
        shxydm: '',
        jgmc: '',
        type: '',
      },
      dialog: {
        title: '',
        show: false,
        type: '',
        data: null,
      },
      types: [],
    }
  },
  methods: {
    clickSearch() {
      this.dialog.type = 'search';
      this.dialog.title = '物业区域查息';
      this.dialog.show = true;
    },
    onCloseDialog() {
      this.dialog.show = false
    },
    clickTianjia() {
      this.dialog.type = 'tianjia';
      this.dialog.title = '物业区域管理';
      this.dialog.show = true;
    },
    clickBianji() {
      this.dialog.type = 'bianji';
      this.dialog.title = '物业区域管理';
      this.dialog.show = true;
    }
  }
}
</script>

<style lang="scss">
  .wuyequyu .content table {
    border-spacing: initial !important;
  }

  .wuyequyu .content th {
    border: 1px solid #c1c7c6 !important;
    background: #e2f2ef;
    font-size: 13px;
  }
  .wuyequyu .content td {
    border: 1px solid #c1c7c6 !important;
  }
  .wuyequyu .zz-content .search .el-dialog {
    width: 60%;
    margin-top: 7vh !important;
  }
  .wuyequyu .zz-content .tianjia .el-dialog {
    width: 30%;
    margin-top: 7vh !important;
  }
  .wuyequyu .zz-content .bianji .el-dialog {
    width: 30%;
    margin-top: 7vh !important;
  }
</style>
