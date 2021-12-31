<template>
  <div class="app-container zz-app-container zz-basic-caiji">
    <div class="zz-Head">房屋数据补充</div>
    <el-divider/>
    <div class="filter-container mt-28">
      <el-form ref="form" :model="state" :rules="rules" :validate-on-rule-change="false">
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item :label="Strings.WYQYMC" :label-width="lblWidth" prop="wyqyId">
              <el-select v-model="state.wyqyId" @change="onChangeWYQY" style="width: 100%;">
                <el-option v-for="(item, key) in wuyequyuList" :key="key" :label="item.WYQYMC" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item :label="Strings.XZQY" :label-width="lblWidth">
              <el-input v-model="state.xzqymc" disabled/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item :label="Strings.WYQYDZ" :label-width="lblWidth">
              <el-input v-model="state.wyqudz" disabled/>
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
      <div v-if="state.bParseExcel">
        <el-row :getter="24" style="margin-top: 10px; max-height: 60vh; display: flex; height: -webkit-fill-available;">
          <el-col :span="6" class="zz-sidebar-border inline-block">
            <div class="zz-table-header">导入</div>
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
            <FangwuTable :list="this.tableList"/>
          </el-col>
        </el-row>
      </div>
      <div v-else>
      </div>
    </div>
    <el-dialog class="caiji-dialog" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
               @close="onCloseDialog">
      <div v-if="dialog.type==0">
      </div>
      <div v-else-if="dialog.type==1">
        <DlgExcelUpload :onClose='onCloseDialog' :before-upload="beforeUpload"/>
      </div>
      <div v-else-if="dialog.type==2">
        <DlgCaijiLoudong :onClose='onCloseDialog' :data="dialog.data"/>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import Strings from '../../../utils/strings'
  import Const from '../../../utils/const'
  import * as Tool from '../../../utils'
  import CmButton from '../../../components/Shmf/Common/Button'
  import DlgExcelUpload from '../../../components/Shmf/Common/DlgExcelUpload'
  import DlgCaijiLoudong from '../../../components/Shmf/Basic/Fangwu/DlgCaijiLoudong'
  import LoadExcel from './mixin/FangWuLoadExcel'
  import FangwuTable from '../../../components/Shmf/Basic/Fangwu/FangwuTable'

  export default {
    components: { CmButton, DlgExcelUpload, FangwuTable, DlgCaijiLoudong },
    mixins: [LoadExcel],
    data() {
      return {
        Strings,
        lblWidth: '120px',
        dialog: {
          title: '',
          show: false,
          type: '',
          data: null
        },
        tree: {
          data: [],
          current: -1,
          props: {
            label: 'LDMC'
          }
        },
        rules: {
          wyqyId: [{ required: true, message: Strings.PLEASE_SELECT('物业区域名称'), trigger: 'blur' }],
        },
        wuyequyuList: [],
        tableList: [],
        state: {
          wyqyId: '',
          xzqymc: '',
          wyqudz: '',
          bParseExcel: false,
          bLoading: false
        }
      }
    },
    methods: {
      init() {
        this.wuyequyuList = [];
        this.$http.get('wuyequyu_all').then(response => {
          this.wuyequyuList = response.data;
        })
      },
      initData () {
        this.dialog = {
          title: '',
          show: false,
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
        this.state = {
          wyqyId: '',
            xzqymc: '',
            wyqudz: '',
            bParseExcel: false,
            bLoading: false
        }
      },
      onChangeWYQY(value) {
        let idx = Tool.getIndexByValue(this.wuyequyuList, wyqy => wyqy.id == value);
        if (idx != -1) {
          this.state.xzqymc = this.wuyequyuList[idx].city;
          this.state.wyqudz = this.wuyequyuList[idx].XXDZ;
        }
        this.$refs['form'].validateField('wyqyId')
      },
      onTreeNodeClick(data, node, self) {
        // console.log(data);
        if (data.children) {
          this.dialog.title = '输入楼栋信息'
          this.dialog.show = true
          this.dialog.type = 2
          this.dialog.data = data
        } else {
          this.tableList = data.fenhuList;
        }
      },
      onCloseDialog(data) {
        this.dialog.show = false
        if (this.dialog.type == 1 && data) {
          this.table = data
          this.parseExcel(this.table)
            .then((data) => {
              this.state.bParseExcel = true
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
        this.dialog.show = true
      },
      async onSave() {
        try {
          const valid = await this.$refs['form'].validate()
          if (!valid) return;

          if (!this.state.bParseExcel) {
            this.$message.error('必须导入素材文件')
            return
          }
          let data = {
            wyqyId:this.state.wyqyId,
            loudong: this.tree
          }
          const response = await this.$http.post('fangwu_buchong', data)
          if (response.data == Const.RESPONSE_OK) {
            this.$message.success('保存成功！')
          } else {
            this.$message.error('保存失败！')
          }
          this.initData();
        } catch (e) {
          this.$message.error(e.message)
          console.log(e.message);
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

