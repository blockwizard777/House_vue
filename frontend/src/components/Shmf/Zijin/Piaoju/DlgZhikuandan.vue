<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-row>
          <el-col :span="12">
            <el-form-item label="业务单编号" :label-width="label_width" class="zz-linespcae-exact">
              <el-input placeholder="" v-model="query"/>
            </el-form-item>
          </el-col>
          <el-col :span="8" style="padding-left: 20px;">
            <cm-button class="filter-item search" icon="el-icon-search" type="primary" @click="onSearch">
              查询
            </cm-button>
            <CmButton class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">
              清空
            </CmButton>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <el-divider/>
    <div class="zz-content">
      <table style="width: 100%">
        <thead>
          <tr>
            <th style="height: 30px; width: 5%"></th>
            <th style="">描述</th>
            <th style="">业务单编号</th>
            <th style="">支款银行</th>
            <th style="">支款账户</th>
            <th style="">业务类型</th>
            <th style="">业务状态</th>
            <th style="">创建时间</th>
            <th style="">操作</th>

          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, key) in list">
            <td style="height: 30px;"></td>
            <td style=""><div class="center">{{item.miaosu}}            </div></td>
            <td style=""><div class="center">{{item.yewudan_bianhao}}   </div></td>
            <td style=""><div class="center">{{item.zhikuan_yinhang}}   </div></td>
            <td style=""><div class="center">{{item.zhikun_zhanghu}}    </div></td>
            <td style=""><div class="center">{{item.yewu_leixing}}      </div></td>
            <td style=""><div class="center">{{item.yewu_zhuangtai}}    </div></td>
            <td style=""><div class="center">{{item.chuangjian_shijian}}</div></td>
            <td><div class="center"><el-button>打印支款单</el-button></div></td>
          </tr>

        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
    import Const from '../../../../utils/const';
    import Strings from "../../../../utils/strings";
    import * as Tool from "../../../../utils";
    import CmButton from '../../Common/Button';

    export default {
        name: 'DlgZijinPiaojuZhikuandan',
        components: {CmButton, },
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_PIAOJU_DIALOG_ZHIKUANDAN,
                label_width: '140px',
                list: [],
                dialog: {
                    show: false,
                    type: 0,
                    data: null,
                },
                query: '',
            }
        },
        methods: {
            init() {
                this.initData();
            },
            initData() {
                let item = {
                    miaosu: 'xxxxx 退款',
                    yewudan_bianhao: 123123123,
                    zhikuan_yinhang: '中国建设银行',
                    zhikun_zhanghu: 123123123,
                    yewu_leixing: 'tuikuan',
                    yewu_zhuangtai: '已完成',
                    chuangjian_shijian: '2021-06-02'
                }
                this.list.push(Tool.createObject(item));
                this.list.push(Tool.createObject(item));
                this.list.push(Tool.createObject(item));
                this.list.push(Tool.createObject(item));
                this.list.push(Tool.createObject(item));
            },
            initState() {},
            onSearch() {},
            onClear() {},
        },
        created() {
            this.init()
        }
    }
</script>

<style scoped>

</style>
