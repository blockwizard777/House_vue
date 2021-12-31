<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="12">
            <el-form-item label="账户名称" :label-width="labelWidth">
              <el-input placeholder="" value="xxxxx项目账户"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="账户" :label-width="labelWidth">
              <el-input placeholder="" value="1234567890"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="账户类型" :label-width="labelWidth">
              <el-input placeholder="" value="项目账户"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="账户余额" :label-width="labelWidth">
              <el-input placeholder="" value="0.00"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="账户状态" :label-width="labelWidth">
              <el-input placeholder="" value="正常"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="开户日期" :label-width="labelWidth">
              <el-input placeholder="" value="2019-08-19"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <table style="width: 100%;">
        <thead>
        <tr>
          <th style="width: 10%; height: 30px;"></th>
          <th>交易类型</th>
          <th>交易金额</th>
          <th>余额</th>
          <th>交易时间</th>
          <th>摘要</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height: 30px;"></td>
          <td>存入</td>
          <td>456.23</td>
          <td>5563.36</td>
          <td>2019-08-19:14:40:17</td>
          <td>使用费用发付</td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 30px;"></td>
          <td>存入</td>
          <td>456.23</td>
          <td>5563.36</td>
          <td>2019-08-19:14:40:17</td>
          <td>使用费用发付</td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 30px;"></td>
          <td>存入</td>
          <td>456.23</td>
          <td>5563.36</td>
          <td>2019-08-19:14:40:17</td>
          <td>使用费用发付</td>
          <td><span class="link-type">查看</span></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>

</template>

<script>
    import Const from "../../../utils/const"
    import Strings from "../../../utils/strings";
    import Proto from "../../../utils/Proto";
    import * as Tool from "../../../utils";

    export default {
        name: 'DlgZhanghuInfo',
        props: {
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.DIALOG_FANGWU_INFO,
                labelWidth: '120px',
                zhanghuId : -1,
                data : {

                }
            }
        },
    }
</script>

<style scoped>

</style>
