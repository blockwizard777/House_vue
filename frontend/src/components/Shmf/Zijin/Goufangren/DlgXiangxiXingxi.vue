<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="24">
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="帐户名称" :label-width="label_width">
              <el-input placeholder="" v-model="data.name" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="帐号" :label-width="label_width">
              <el-input placeholder="" v-model="data.name" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="帐户类型" :label-width="label_width">
              <!--              <el-input placeholder="" v-model="data.square"/>-->
              <span class="temp-item-span">{{data.square}}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="帐户余额" :label-width="label_width">
              <el-input placeholder="" v-model="data.pre_pay"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="账户状态" :label-width="label_width">
              <el-input placeholder="" v-model="data.room_address"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="开户日" :label-width="label_width">
              <el-input placeholder="" v-model="data.room_address"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row style="background: #e2f2ef; margin-top: 5px;padding: 5px;">交易明细列表</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit
              :show-header="true">
      <el-table-column label="" prop="no"/>
      <el-table-column label="交易类型" prop="name"/>
      <el-table-column label="交易金额" prop="name"/>
      <el-table-column label="余款" prop="auth"/>
      <el-table-column label="交易时间" prop="auth"/>
      <el-table-column label="摘要" prop="auth"/>
      <el-table-column label="Ｘ行" prop="action"/>
    </el-table>
    <el-dialog></el-dialog>
  </el-form>
</template>

<script>
  export default {
    name: 'DlgXiangxiXingxi',
    props: {
      onSave: Function
    },
    data() {
      return {
        label_width: '140px',
        bShowDlg: false,
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
        this.$emit('closeDilog')

        // this.props.onSave && this.props.onSave();
      },
      onClickUpload() {

      },
      onClickCardNum(address) {
        this.bShowDlg = true;
      },
      onDlgCancel() {
        this.bShowDlg = false;
      }
    }
  }
</script>

<style scoped>
  .temp-item-span {
    display: block;
    border: solid rgba(0,0,0,0.2) 1px;
    padding-left: 10px;
    border-radius: 5px
  }
</style>
