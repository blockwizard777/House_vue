<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="24">

        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="房屋编号" :label-width="label_width">
              <!--              <el-input placeholder="" v-model="data.square"/>-->
              <span class="temp-item-span">{{data.square}}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单元名称" :label-width="label_width">
              <el-input placeholder="" v-model="data.pre_pay"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="楼层" :label-width="label_width">
              <el-input placeholder="" v-model="data.address"/>
              <!--              <a style="color:#4affd5;" class="temp-item-span" @click="onClickAddress(data.address)">{{ data.address }}</a>-->
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="室号" :label-width="label_width">
              <el-input placeholder="" v-model="data.room_address"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="合同号" :label-width="label_width">
              <el-input placeholder="" v-model="data.room_address"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="宅地栋号" :label-width="label_width">
              <el-input placeholder="" v-model="data.room_address"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-col>
      <el-col :span="4"></el-col>
    </el-row>

    <el-row style="background: #e2f2ef; margin-top: 5px;padding:5px">交易明细列表</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit :show-header="true">
      <el-table-column label="" width="50" prop="no"/>
      <el-table-column label="交易类型" prop="name"/>
      <el-table-column label="交易金额(元)" prop="card_num"/>
      <el-table-column label="余款(元)" prop="auth"/>
      <el-table-column label="交易时间" prop="auth"/>
      <el-table-column label="摘要" prop="auth"/>
      <el-table-column label="搡作" prop="auth"/>
    </el-table>
    <el-dialog></el-dialog>

  </el-form>
</template>

<script>

  export default {
    components: { },
    name: 'DlgDanweizhanghu',
    props: {
      onSave: Function
    },
    data() {
      return {
        label_width: '140px',
        bShowDlg: false,
        bShowCardDlg: false,
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
      onSave1() {
        this.$emit('closeDilog')

        // this.props.onSave && this.props.onSave();
      },
      onClickUpload() {

      },
      onClickAddress(address) {
        this.bShowDlg = true;
      },
      onDlgCancel() {
        this.bShowDlg = false;
      },
      onClickCardnum(num) {
        this.bShowCardDlg = true;
      },
      onCancelCardDlg(num) {
        this.bShowCardDlg = false;
      }
    }

  }
</script>

<style scoped>
  /*.el-form-item {*/
  /*  margin-bottom: 5px !important;*/
  /*}*/
  .temp-item-span {
    display: block;
    border: solid rgba(0,0,0,0.2) 1px;
    padding-left: 10px;
    border-radius: 5px
  }

</style>
