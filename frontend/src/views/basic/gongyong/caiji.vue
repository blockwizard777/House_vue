<template>
  <div class="app-container zz-app-container zz-basic-gongyong-caiji">
    <div class="zz-Head">设施设备管理</div>
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
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row >
        <el-col :span="4" style="padding-right: 5px;">
          <div style="padding: 10px; overflow-y: scroll; height: 220px; border: 1px solid;">
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
            <div style="display: block; height: 20px;">xxxx物业公司</div>
          </div>
          <el-tree
            style="margin-top: 10px;"
            :data="tree.data"
            :props="tree.props"
            node-key="idx"
            default-expand-all
            highlight-current
            :expand-on-click-node="false"
          />
        </el-col>
        <el-col :span="20">
          <table style="width:100%;">
            <thead>
            <tr>
              <th style="width: 5%; height:33px"></th>
              <th style=" ">设施设备名称</th>
              <th style=" ">登记编号</th>
              <th style=" ">生产厂商</th>
              <th style=" ">品牌</th>
              <th style=" ">规格型号</th>
              <th style=" ">厂商保修截止日期</th>
              <th style=" ">设施设备类型</th>
              <th style=" ">安装位置</th>
              <th style="width: 8%; ">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td style="height:33px">1</td>
              <td style="">道路</td>
              <td style=""></td>
              <td style=""></td>
              <td style=""></td>
              <td style=""></td>
              <td style=""></td>
              <td style="">共用部位</td>
              <td style="">XXXX总公司</td>
              <td style="justify-content: center; align-items: center;">
                <span class="link-type" style="color: orangered;" @click="onHistory">维修记录</span>
              </td>
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
        </el-col>
      </el-row>
      <div class="dialog-wrapper">
        <el-dialog class="weixiu-dialog" :title="dialog.title" :closeOnClickModal="false" :visible.sync="dialog.show"
                   @close="onCloseDialog" :class="dialog.type">
          <DlgWeixiuRecord :onClose='onCloseDialog'/>
        </el-dialog>
      </div>
    </div>
  </div>
</template>
<script>
  import renderForm from '@/views/render-table-form'
  import SingleImageUpload2 from '../../../components/Upload/SingleImage2'
  import DlgWeixiuRecord from '../../../components/Shmf/Basic/Fangwu/DlgWeixiuRecord'

  export default {
    components: { DlgWeixiuRecord },
    data() {
      return {
        formLabelWidth: '120px',
        names: [],
        tree: {
          data: [
            {idx: 0, label: '公用部位',
              children: [
                {idx: 1, label: '总坪环境设施',
                  children: [
                    {idx: 2, label: '给排水系统'},
                    {idx: 3, label: '供配电系统'},
                    {idx: 4, label: '电梯'},
                  ]
                },
                {idx: 5, label: '消防系统',
                  children: [
                    {idx: 2, label: '报警系统'},
                    {idx: 3, label: '排烟系统'},
                    {idx: 4, label: '消防电源系统'},
                  ]
                },
              ]
            },

          ],
          props: {
            label: 'label'
          }
        },
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
      onHistory() {
        this.dialog.title = '维修记录';
        this.dialog.show = true;
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
  .gongyong .content table {
    border-spacing: initial !important;
  }

  .gongyong .content th {
    border: 1px solid #c1c7c6 !important;
    background: #e2f2ef;
    font-size: 13px;
  }
  .gongyong .content td {
    border: 1px solid #c1c7c6 !important;
  }
</style>



