<template>
  <div class="app-container">
    <header><h3>补交交款</h3></header>
    <el-divider></el-divider>
    <div class="filter-container" style="padding: 0 50px;">
      <el-form>
        <el-row :getter="24">
          <el-col :span="10">
            <el-form-item label="房屋查询" :required="true" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
          <el-col :span="8" style="padding: 0 20px;">
            <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">
              查询
            </cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">
              清空
            </cm-button>
          </el-col>
        </el-row>
      </el-form>
      <el-divider/>
      <div v-for="(element, index) in list" :key="index" class="board-item"
           style="border: 1px solid #c3c3c3; margin-bottom: 10px">
        <div class="list-row" style="height: 45px; background: #e2f2ef; font-weight: bold;">
          <div><i class="el-icon-s-home" style="color: #fc4415; font-size: 1.5em"/>
            | {{element.name}} | 地址 ：{{element.address}}</div>
          <div style="display: flex; justify-content: flex-end; flex: 1;">
            <el-button type="primary" @click="onClickListButton(element, 'jiaokuan')">补交</el-button>
          </div>
        </div>
        <div class="list-row" style="height: 45px;">
          业主姓名： {{element.owner}} 建筑面的： {{element.square}}㎡ 应交款： <span style="color: #fc4415">{{element.pay}}</span>元
          余额：<span style="color:green">{{element.remain}}</span>元 状态： {{element.status}}
        </div>
        <!--        {{ element.name }} {{ element.id }}-->
      </div>
    </div>
    <el-dialog title="购房人交款业务" :visible.sync="bShowDlg.jiaokuan" width="80%" @close="onDlgCancel">
      <DlgBujiao @closeDilog="onDlgCancel"></DlgBujiao>
    </el-dialog>
  </div>
</template>

<script>
  import CmButton from '../../components/Shmf/Common/Button'
  import DlgBujiao from '../../components/Shmf/Zijin/BuJiao/DlgBuJiao'

  export default {
    components: { CmButton, DlgBujiao },
    data() {
      return {
        query: '',
        formLabelWidth: '120px',
        list: [],
        bShowDlg: {
          jiaokuan: false,
          hetong: false,
          tuikuan: false,
          upload: false,
        },
      }
    },
    methods: {

      onSearch() {
        let rnd = Math.random() * 3
        this.createList(rnd);
      },
      onClear() {
        this.query = ''
        this.createList(10);
      },
      onDlgOk(type) {
        this.onDlgCancel();
      },
      onDlgCancel() {
        let keys = Object.keys(this.bShowDlg);
        for (let idx in keys) {
          this.bShowDlg[keys[idx]] = false;
        }
      },
      onClickListButton(item, type) {
        if (this.bShowDlg[type] === undefined) return;
        this.bShowDlg[type] = true;
      },
      createList(count) {
        this.list = [];
        for (let i = 0; i < count; i++) {
          let element = {
            name: '翡翠•苏华',
            address: '锦绣•苏华建设大路111号22',
            owner: '张小四',
            square: 123,
            pay: '0.00',
            remain: 14556,
            status: '正常'
          }
          this.list.push(element);
        }
      }
    },
    created(){
      this.createList(10);
    },
  }
</script>
<style lang="scss">

  .container {
    padding: 20px 80px;
    background-color: rgb(240, 242, 245);
    position: relative;
  }

  .el-dialog__header {
    background: #00aa82 !important;
    padding: 0 10px !important;
    height: 30px;
  }
  .el-dialog__title {
    color: white;
    font-size: 13px;
    font-weight: bold;
    line-height: 30px;
  }
  .el-dialog__headerbtn {
    top: initial !important;
    line-height: 30px;
  }
  .list-row {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 0 30px;
  }

</style>
