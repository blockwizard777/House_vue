<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="20">
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="物业区城名称" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="物业区城地址" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.address"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="房屋面积" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.square"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="房屋地址" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pre_pay"/>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :getter="24">
          <el-col :span="16"></el-col>
          <el-col :span="16"></el-col>
        </el-row>
      </el-col>
      <el-col :span="4"></el-col>
    </el-row>
    <el-row :getter="24" style="margin-top: 10px;">
      <el-col :span="20">
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="交款人" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.man"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="交款人证件号" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="个人交款金额（元）" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.status"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位交款金额（元）" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.amount"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="业主手机号码" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.status"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
          </el-col>
        </el-row>
      </el-col>
      <el-col :span="4">
        <el-button style="margin-left: 10px" type="primary" icon="el-icon-s-finance">读取身份证</el-button>
      </el-col>
    </el-row>
    <el-row style="background: #e2f2ef; margin-top: 5px;padding: 10px;">业主休息</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit
              :show-header="true">
      <el-table-column label="" width="50" prop="no"/>
      <el-table-column label="业主姓名" prop="name"/>
      <el-table-column label="业主证件号码" prop="auth"/>
      <el-table-column label="操作" prop="action"/>
      <el-table-column label="" prop=""/>
    </el-table>
    <el-divider/>
    <el-button type="primary" icon="el-icon-check" @click="onSave1">保存</el-button>
    <el-dialog></el-dialog>
  </el-form>
</template>

<script>
  export default {
    name: 'DlgBuJiao',
    data() {
      return {
        label_width: '140px',
        data: {
          name: '锦绣•苏华',
          address: '锦绣•苏华',
          square: '123',
          pre_pay: '145556.40',
          room_name: '',
          room_address: '锦绣•苏华建设大路111号22',
          pay: {
            man: '',
            auth: '',
            status: '',
            amount: '144556.60'
          },
          owners: [
            { no: 1, name: '张小四', auth: '1234567890', action: '' }
          ]
        }
      }
    },
    methods: {
      onAdd() {
        this.data.owners.push({ name: '张小四', auth: '1234567890', action: '' })
      },
      onSave1() {
        this.$emit('closeDilog');

        // this.props.onSave && this.props.onSave();
      }
    }
  }
</script>

<style scoped>

</style>
