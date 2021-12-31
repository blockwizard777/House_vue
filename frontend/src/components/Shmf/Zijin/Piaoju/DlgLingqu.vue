<template>
  <div class="app-container zz-zijin-piaoju-lingqu">
    <div class="zz-Head">票据查询</div>
    <el-divider/>
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="4">
            <el-form-item label="票据编号" :label-width="labelWidth">
              <el-input placeholder=""/>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <el-form-item label="票据状态" :label-width="labelWidth">
              <el-input/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="物业单创建期间" :label-width="labelWidth">
              <el-date-picker/>
              起
              <el-date-picker/>
              止
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">查询</cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">清空
            </cm-button>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <el-row>
        <cm-button class="filter-item search" icon="el-icon-plus" type="primary" @click="onXinzeng">新增票据</cm-button>
        <cm-button class="filter-item" icon="el-icon-edit" @click="onLingqu" icon-style="color: #ff5227;">领取票据
        </cm-button>
        <cm-button class="filter-item" icon="el-icon-delete" @click="onTuihui" icon-style="color: #ff5227;">退回票据
        </cm-button>
      </el-row>
      <table style="width: 100%; margin-top: 10px;">
        <thead>
        <tr>
          <th style="width: 3%; height: 33px;"></th>
          <th>票据组编号</th>
          <th>票据编号</th>
          <th>票据名称</th>
          <th>票据状态</th>
          <th>领取银行名称</th>
          <th>领取人姓名</th>
          <th>领取时间</th>
          <th>作废时间</th>
          <th>交款业务单</th>
          <th>退款业务单</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
          <td style="height: 33px;"></td>
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
    </div>
  </div>
</template>

<script>
    import Const from "../../../../utils/const"
    import Strings from "../../../../utils/strings";
    import Proto from "../../../../utils/Proto";
    import * as Tool from "../../../../utils";
    import CmButton from "../../Common/Button"

    export default {
        name: 'DlgZijinPiaojuLinqu',
        components: {CmButton},
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_PIAOJU_DIALOG_LINGQU,
                labelWidth: '100px',
                status: {
                    piaoju_bianhao: '',
                    piaoju_zhuangtai: '',
                    yewudan_chuangjian_qujian: {
                        start: '', to: ''
                    },
                    list: []
                },
            }
        },
        methods: {
            init() {
            },
            initData() {
            },
            initState() {
            },
            onSearch() {
            },
            onClear() {
            },
            onXinzeng() {
            },
            onLingqu() {
            },
            onTuihui() {
            },
        }
    }
</script>

<style scoped>
  .zz-zijin-piaoju-lingqu .el-date-editor {
    width: 160px;
  }

</style>
