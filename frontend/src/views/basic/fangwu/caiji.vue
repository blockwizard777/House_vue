<template>
  <div class="app-container zz-app-container zz-basic-caiji">
    <div class="zz-Head">房屋数据采集</div>
    <el-divider></el-divider>
    <div class="filter-container mt-28">
      <el-form ref="form" :model="data" :rules="rules" :validate-on-rule-change="false">
        <el-row :getter="25">
          <el-col :span="7">
            <el-form-item :label="Strings.WYQYMC" :label-width="labelWidth" prop="WYQYMC">
              <el-input v-model="data.WYQYMC"/>
            </el-form-item>
          </el-col>
          <el-col :span="1" class="zz-empty-col"/>
          <el-col :span="7">
            <el-form-item :label="Strings.WYQYDZ" :label-width="labelWidth" prop="XXDZ">
              <el-input v-model="data.XXDZ"/>
            </el-form-item>
          </el-col>
          <el-col :span="1" class="zz-empty-col"/>
          <el-col :span="8">
            <el-form-item :label="Strings.XZQY" :label-width="labelWidth" prop="XZQHDM">
              <el-select v-model="data.XZQHDM" @change="onChangeXZQHDM" style="width: 100%;">
                <el-option
                  v-for="(item, key) in xingzhengquyu"
                  :key="key"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="25">
          <el-col :span="7">
              <el-form-item :label="Strings.JSDW" :label-width="labelWidth" prop="JGMC">
                    <el-input v-model="data.JGMC" style="" disabled/>
              </el-form-item>
          </el-col>
          <el-col :span="1">
            <cm-button style="margin-left: 7px;"
              icon="el-icon-download" @click="onSelectKaifa" icon-style="color: #ff5227;">选择
            </cm-button>
          </el-col>
          <el-col :span="16">
            <el-form-item :label="Strings.BZ" :label-width="labelWidth" prop="BZ">
              <el-input v-model="data.BZ"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row>
        <cm-button class="filter-item search" icon="el-icon-plus" type="primary" @click="onImport">导入</cm-button>
        <cm-button class="filter-item" icon="el-icon-finished" @click="onSave" icon-style="color: #ff5227;">保存</cm-button>
      </el-row>
      <div v-if="bParseExcel">
        <el-row :getter="24" style="margin-top: 15px; max-height: 60vh; display: flex; height: -webkit-fill-available;">
          <el-col :span="6" class="zz-sidebar-border inline-block ">
            <div class="zz-sidebar-header align-left">导入</div>
            <el-tree
              :data="tree.data"
              :props="tree.props"
              node-key="idx"
              default-expand-all
              highlight-current
              :expand-on-click-node="false"
              @node-click="onTreeNodeClick"
            />
          </el-col>
          <el-col :span="18" class="inline-block zz-sidebar-border" style="overflow-y: scroll">
            <div class="zz-table-header">房屋信息</div>
            <FangwuTable :list="this.tableList"/>
          </el-col>
        </el-row>
      </div>
<!--      <div v-else>-->
<!--      </div>-->
    </div>
    <div class="dialog-wrapper">
      <el-dialog class="caiji-dialog" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.bShow"
                 @close="onCloseDialog">
        <div v-if="dialog.type==0">
          <DlgJigou @closeDilog="onCloseDialog"/>
        </div>
        <div v-else-if="dialog.type==1">
          <DlgExcelUpload :onClose='onCloseDialog' :before-upload="beforeUpload"/>
        </div>
        <div v-else-if="dialog.type==2">
          <DlgCaijiLoudong :onClose='onCloseDialog' :data="dialog.data"/>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
  import Strings from '../../../utils/strings'
  import Const from '../../../utils/const'
  import CmButton from '../../../components/Shmf/Common/Button'
  import DlgJigou from '../../../components/Shmf/Common/DlgJigou'
  import DlgExcelUpload from '../../../components/Shmf/Common/DlgExcelUpload'
  import DlgCaijiLoudong from '../../../components/Shmf/Basic/Fangwu/DlgCaijiLoudong'
  import LoadExcel from './mixin/FangWuLoadExcel'
  import FangwuTable from '../../../components/Shmf/Basic/Fangwu/FangwuTable'

  export default {
    components: { CmButton, DlgJigou, DlgExcelUpload, FangwuTable, DlgCaijiLoudong },
    mixins: [LoadExcel],

    data() {
      return {
        Strings,
        data: {
          WYQYMC: '',
          XZQHDM: '',
          XXDZ: '',
          JSDW: { id: -1, JGMC: '' },
          JGMC: '',
          BZ: '',
        },
        rules: {
          WYQYMC: [{ required: true, message: Strings.PLEASE_INPUT('物业区域名称'), trigger: 'blur' }],
          XZQHDM: [{ required: true, message: Strings.PLEASE_SELECT('行政区域'), trigger: 'blur' }],
          JGMC: [{ required: true, message: Strings.PLEASE_SELECT('开发建设单位'), trigger: 'blur' }]
        },
        xingzhengquyu: [],
        jianshedanwei: [],
        labelWidth: '130px',
        dialog: {
          title: '',
          bShow: false,
          type: '',
          data: null
        },
        tree: {
          data: [],
          current: -1,
          props: {
            label: 'LDMC'
          },
        },
        tableList: [],
        bParseExcel: false
      }
    },
    methods: {
      init() {
        this.initData();
        this.xingzhengquyu = []
        this.$http.get('xingzhengquyu').then(response => {
          let data = response.data
          for (let i = 0; i < data.length; i++) {
            this.xingzhengquyu.push({ value: data[i].id, label: data[i].name })
          }
        })
      },
      initData () {
        this.data = {
          WYQYMC: '',
          XZQHDM: '',
          XXDZ: '',
          JSDW: { id: -1, JGMC: '' },
          JGMC: '',
          BZ: '',
        };
        this.dialog = {
          title: '',
            bShow: false,
            type: '',
            data: null
        };
        this.tree = {
          data: [],
            current: -1,
            props: {
            label: 'LDMC'
          },
        };
        this.tableList = [];
        this.bParseExcel = false;
      },
      onTreeNodeClick(data, node, self) {
        // console.log(data);
        if (data.children) {
          this.dialog.title = '输入楼栋信息'
          this.dialog.bShow = true
          this.dialog.type = 2
          this.dialog.data = data
        } else {
          this.tableList = data.fenhuList;
        }
      },
      onChangeXZQHDM(value) {
        this.data.XZQHDM = value
        this.$refs['form'].validateField('XZQHDM')
      },
      onSelectKaifa() {
        this.dialog.title = '选择开发建设单位';
        this.dialog.type = 0;
        this.dialog.bShow = true
      },
      onCloseDialog(data) {
        this.dialog.bShow = false
        if (this.dialog.type == 0 && data) {
          this.data.JSDW = data
          this.data.JGMC = data.JGMC
          this.$refs['form'].validateField('JGMC')
        } else if (this.dialog.type == 1 && data) {
          this.table = data
          this.parseExcel(this.table)
            .then((data) => {
              this.bParseExcel = true
              this.tree.data = data.loudong.map(ld => {
                return {
                  ...ld,
                  children: [{
                    ...ld,
                    LDMC: '分户列表',
                    fenhuList:  data.rows.filter(item => item.loudongIdx == ld.idx)
                  }],

                }
              })
            })
        }
      },
      onImport() {
        this.dialog.title = '上传文件'
        this.dialog.type = 1
        this.dialog.bShow = true
      },
      async onSave() {
        try {
          const valid = await this.$refs['form'].validate()
          if (!valid) return
          if (!this.bParseExcel) {
            this.$message.error('必须导入素材文件')
            return
          }
          let data = {
            ...this.data,
            loudong: this.tree
          }
          const response = await this.$http.post('fangwu_caiji/import', data)
          if (response.data == Const.RESPONSE_OK) {
            this.$message.success('保存成功！')
          } else {
            this.$message.error('保存失败！')
          }
          this.initData();
        } catch (e) {
          this.$message.error(e.message)
        }
      },
      beforeUpload(file) {
        const isLt1M = file.size / 1024 / 1024 < 1

        if (isLt1M) {
          return true
        }

        this.$message({
          message: 'Please do not upload files larger than 1m in size.',
          type: 'warning'
        })
        return false
      }
    },
    created() {
      this.init()
    }
  }
</script>
<style lang="scss">

  .container {
    padding: 10px 32px;
    background-color: rgb(240, 242, 245);
    position: relative;
  }
  /*.caiji-dialog .el-dialog {*/
  /*  width: 80%;*/
  /*}*/

</style>


