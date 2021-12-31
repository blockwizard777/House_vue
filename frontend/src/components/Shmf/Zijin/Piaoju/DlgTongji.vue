<template>
  <div class="app-container zz-zijin-piaoju-tongji">
    <div class="zz-Head">票据统计</div>
    <el-divider/>
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="14">
            <el-form-item label="票据组编号" :label-width="labelWidth" class="zz-linespcae-exact">
              <el-input placeholder=""/>
            </el-form-item>
          </el-col>
          <el-col :span="4" style="margin-left: 20px;">
            <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">查询</cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">清空</cm-button>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <table style="width: 100%; margin-top: 10px;">
        <thead>
        <tr>
          <th style="width: 3%; height: 33px;"></th>
          <th>票据组编号</th>
          <th>票据总数</th>
          <th>作废数</th>
          <th>交存使用数</th>
          <th>退款退回数</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height: 33px;" class="zz-header"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 33px;" class="zz-header"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 33px;" class="zz-header"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 33px;" class="zz-header"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 33px;" class="zz-header"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 33px;" class="zz-header"></td>
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
        name: 'DlgZijinPiaojuTongji',
        components: {CmButton},
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_PIAOJU_DIALOG_TONGJI,
                labelWidth: '100px',
                status: {
                    piaojuzu_bianhao: '',
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
        }
    }
</script>

<style scoped>

</style>
