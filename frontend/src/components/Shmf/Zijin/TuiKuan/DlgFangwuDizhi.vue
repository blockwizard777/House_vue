<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="24">
        <el-row :getter="24">
          <el-col :span="24">
            <el-form-item label="房屋地址" :label-width="label_width">
              <el-input placeholder="" v-model="data.name" />
            </el-form-item>
          </el-col>
        </el-row>
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
    <el-row :getter="24" style="">
      <el-col :span="24">
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="建筑面积(㎡)" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.man"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="房屋交款款(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="房屋已交款(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.status"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="账户账号" :label-width="label_width">
<!--              <el-input placeholder="" v-model="data.pay.amount"/>-->
              <a style="color:#4affd5;" class="temp-item-span" @click="onClickCardnum(data.address)">{{ data.address }}</a>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="账户余额" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.status"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="帐户可用余额(元)" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.amount"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="账户利息" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.status"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="公有房单位名称" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.amount"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="12">
            <el-form-item label="公有房单位账户" :label-width="label_width">
<!--              <el-input placeholder="" v-model="data.pay.status"/>-->
              <a style="color:#4affd5;" class="temp-item-span" @click="onClickAddress(data.address)">{{ data.address }}</a>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="公有房单位账户用余额" :label-width="label_width">
              <el-input placeholder="" v-model="data.pay.amount"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row style="background: #e2f2ef; margin-top: 5px;padding:5px">业主信息</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit :show-header="true">
      <el-table-column label="业主姓名" prop="name"/>
      <el-table-column label="证件号码" prop="card_num"/>
      <el-table-column label="证件类型" prop="auth"/>
      <el-table-column label="电话号码" prop="auth"/>
    </el-table>
    <el-row style="background: #e2f2ef; margin-top: 10px;padding:5px">变更记录</el-row>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;" border fit :show-header="true">
      <el-table-column label="变更前业主" prop="name"/>
      <el-table-column label="变更后业主" prop="card_num"/>
      <el-table-column label="夜务类型" prop="auth"/>
      <el-table-column label="变更时间" prop="auth"/>
    </el-table>
    <el-divider/>
    <el-dialog title="查看账户详细信息" :visible.syng="bShowDlg" @close="onDlgCancel">
      <DlgDanweizhanghu @closeDilog="onDlgCancel" />
    </el-dialog>
    <el-dialog title="查看账户详细信息" :visible.syng="bShowCardDlg" @close="onCancelCardDlg">
      <DlgDetailCard @closeDilog="onCancelCardDlg" />
    </el-dialog>
  </el-form>
</template>

<script>
  import DlgDanweizhanghu from './DlgDanweizhanghu'
  import DlgDetailCard from './DlgDetailCard'

  export default {
    components: { DlgDanweizhanghu, DlgDetailCard },
    name: 'DlgFangwuDizhi',
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
