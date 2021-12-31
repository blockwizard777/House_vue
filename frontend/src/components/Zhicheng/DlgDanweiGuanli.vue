<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="24">
        <el-row :getter="24">
          <el-form-item label="房屋地址" :label-width="label_width">
            <el-input placeholder="" v-model="data.room_address"/>
          </el-form-item>
        </el-row>
        <el-col :span="12">
          <el-row :getter="24">
            <el-form-item label="房屋编号" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="楼层" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="会同号" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="建筑面积" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="房屋已交款(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="账户余额(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="账户利息(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="公有房单位账户帐号" :label-width="label_width" @click="onClickCardNum">
              <el-input placeholder="" v-model="data.card_num" style="color: #0fffc4;"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="公有房单位账户应交款(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
        </el-col>
        <el-col :span="12">
          <el-row :getter="24">
            <el-form-item label="单元名称" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="到号" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="宅地栋号" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="房屋应交款(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="账户账号" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="账户克用余额(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="公有房单位名" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="公有房单位账户余额(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
          <el-row :getter="24">
            <el-form-item label="公有房单位可用余额(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-row>
        </el-col>
      </el-col>
    </el-row>
<!--    <el-button type="primary" icon="el-icon-circle-plus-outline" @click="onAdd">添加</el-button>-->
    <el-row style="background: #e2f2ef;">业主</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit :show-header="true">
      <el-table-column label="业主姓名" prop="name"/>
      <el-table-column label="证件号码" prop="auth"/>
      <el-table-column label="证件类型" prop="action"/>
      <el-table-column label="电话号码" prop="phone"/>
    </el-table><el-row style="background: #e2f2ef;">变使记录</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit :show-header="true">
      <el-table-column label="变使前业主" prop="name"/>
      <el-table-column label="变使后业主" prop="auth"/>
      <el-table-column label="业务类型" prop="action"/>
      <el-table-column label="变更的间" prop="phone"/>
    </el-table>
    <el-dialog title="施工单位管理" :visible.sync="data.abShowDlg" @close="onDlgCancel()">
      <div>asdfasdf</div>
    </el-dialog>
  </el-form>

</template>

<script>
  export default {
    name: 'DlgJiaokuan',
    props: {
      onSave: Function
    },
    data() {
      return {
        label_width: '140px',
        data: {
          name: '锦绣•苏华',
          address: '锦绣•苏华',
          square: '123',
          pre_pay: '145556.40',
          room_name: '',
          card_num:'1234567890',
          room_address: '锦绣•苏华建设大路111号22',
          pay: {
            man: '',
            auth: '',
            status: '',
            amount: '144556.60'
          },
          abShowDlg:false,
          owners: [
            { name: '张小四', auth: '1234567890', action: '', phone:'' }
          ]
        }
      }
    },
    methods: {
      onAdd() {
        this.data.owners.push({ name: '张小四', auth: '1234567890', action: '' })
      },
      onClickCardNum() {
        this.data.abShowDlg = true
      },
      onDlgCancel() {
        this.data.abShowDlg = false
      },
      onSave1() {
        this.$emit('closeDilog')
        // this.props.onSave && this.props.onSave();
      }
    }

  }
</script>

<style scoped>
  /*.el-form-item {*/
  /*  margin-bottom: 5px !important;*/
  /*}*/

</style>
