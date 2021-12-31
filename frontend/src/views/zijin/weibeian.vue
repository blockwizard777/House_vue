<template>
  <div class="app-container zz-app-container zz-zijin-weibeian">
    <div class="zz-Head">未备案房屋交款</div>
    <el-divider></el-divider>
    <div class="filter-container">
      <el-form>
        <el-row :getter="24">
          <el-col :span="10">
            <el-form-item label="物业区域查询" :label-width="formLabelWidth" class="zz-linespcae-exact">
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
    </div>
    <el-divider/>
    <div class="zz-content">
      <div v-for="(element, index) in list" :key="index" class="board-item"
           style="border: 1px solid #c3c3c3; margin-bottom: 10px">
        <div class="list-row" style="height: 45px; background: #e2f2ef; font-weight: bold;">
          <div><i class="el-icon-s-home" style="color: #fc4415; font-size: 1.5em"/>
            | {{element.name}} | 地址 ：{{element.address}}
          </div>
          <div style="display: flex; justify-content: flex-end; flex: 1;">
            <el-button type="primary" style="width: 120px;" @click="onClickListButton(element, 'jiaokuan')">未备案房屋交款
            </el-button>
          </div>
        </div>
        <!--        {{ element.name }} {{ element.id }}-->
      </div>
      <div class="dialog-wrapper">
        <el-dialog :title="dialog.title" :visible.sync="dialog.show" width="80%" @close="onCloseDialog">
          <DlgWeiBeian :onClose="onCloseDialog" :from="NAME"></DlgWeiBeian>
        </el-dialog>
      </div>
    </div>
  </div>
</template>
<script>
    import CmButton from '../../components/Shmf/Common/Button'
    import DlgWeiBeian from '../../components/Shmf/Zijin/WeiBeian/DlgWeiBeian'
    import Const from '../../utils/const'
    import Strings from "../../utils/strings";
    import * as Proto from '../../utils/Proto';
    import * as Tool from '../../utils';

    export default {
        components: {DlgWeiBeian, CmButton},
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_WEIBEIAN,
                query: '',
                formLabelWidth: '120px',
                list: [],
                dialog: {
                    type: 0,
                    show: false,
                    data: {},
                    title: '',
                    width: '60%',
                    top: '15vh',
                }
            }
        },
        methods: {
            init() {},
            initData() {
                this.createList(10);
            },
            initState() {},
            onSearch() {
                let rnd = Math.random() * 3;
                this.createList(rnd);
            },
            onClear() {
                this.query = '';
                this.createList(10);
            },

            onCloseDialog(data) {
                this.dialog.show = false
            },
            onClickListButton(item, type) {
                this.dialog.show = true;
                this.dialog.type = type;
                this.dialog.data = item;
                this.dialog.title = '未备案房屋交款业务';
                this.dialog.width = '70%';
                this.dialog.top = '10vh';
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
        created() {
            this.initData(10);
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
