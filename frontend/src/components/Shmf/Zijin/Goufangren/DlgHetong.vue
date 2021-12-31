<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="24">
        <el-row :getter="24">
          <el-form-item label="房屋地址" :label-width="label_width" :required="true">
            <el-input placeholder="" v-model="data.room_address"/>
          </el-form-item>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="单元名称" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.name"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="楼层" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.address"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="室号" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.square"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="合同编号" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pre_pay"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row :getter="24" style="margin-top: 10px;">
      <el-col :span="24">
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="登录密码" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.man"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-button type="primary" icon="el-icon-check" @click="onSave1">保存</el-button>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-button type="primary" icon="el-icon-check" @click="onSave1">保存</el-button>
    <el-dialog></el-dialog>
  </el-form>
</template>

<script>
  export default {
    name: 'DlgHetong',
    props: {
      onSave: Function,
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
          room_address: '锦绣•苏华建设大路111号22',
          pay: {
            man: '',
            auth: '',
            status: '',
            amount: '144556.60'
          },
          owners: [
            { name: '张小四', auth: '1234567890', action: '' }
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
  /*.el-form-item {*/
  /*  margin-bottom: 5px !important;*/
  /*}*/

</style>
