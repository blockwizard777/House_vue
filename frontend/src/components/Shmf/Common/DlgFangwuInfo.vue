<template>
  <div class="app-container sub-dialog-fenhu-info" style="height: 75vh; overflow-y: scroll">
    <el-form>
      <el-row>
        <el-form-item label="房屋地址" :label-width="labelWidth">
          <span class="item-span">{{data.fangwu_dizhi}}</span>
        </el-form-item>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="房屋编号" :label-width="labelWidth">
            <span class="item-span">{{data.fangwu_bianhao}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="单元名称" :label-width="labelWidth">
            <span class="item-span">{{data.danyuan_mingcheng}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="楼层" :label-width="labelWidth">
            <span class="item-span">{{data.louceng}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="室号" :label-width="labelWidth">
            <span class="item-span">{{data.shihao}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="建筑面积" :label-width="labelWidth">
            <span class="item-span">{{data.jianzhu_mianji}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="房屋应交款" :label-width="labelWidth">
            <span class="item-span">{{data.fangwu_yingjaiokuan}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="房屋已交款" :label-width="labelWidth">
            <span class="item-span">{{data.fangwu_yijiaokuan}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="账户账号" :label-width="labelWidth">
            <span :class="`item-span ${canGoToZhanghuInfo()? 'link-type': ''}`" @click="onGotoZhanghuInfo('zhanghu_zhanghao')">{{data.zhanghu_zhanghao}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="账户余额" :label-width="labelWidth">
            <span class="item-span">{{data.zhanghu_yue}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="账户可用余额" :label-width="labelWidth">
            <span class="item-span">{{data.zhanghu_keyong_yue}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="账户利息" :label-width="labelWidth">
            <span class="item-span">{{data.zhanghu_lixi}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="公有房单位名称" :label-width="labelWidth">
            <span class="item-span">{{data.gongyoufang_danwei_mingcheng}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="公有房单位账户账号" :label-width="labelWidth">
            <span :class="`item-span ${canGoToZhanghuInfo()? 'link-type': ''}`" @click="onGotoZhanghuInfo('gongyoufang_danwei_zhanghu_zhanghao')">{{data.gongyoufang_danwei_zhanghu_zhanghao}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="公有房单位账户余额" :label-width="labelWidth">
            <span class="item-span">{{data.gongyoufang_danwei_zhanghu_yue}}</span>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="公有房单位账户应交款" :label-width="labelWidth">
            <span class="item-span">{{data.gongyoufang_danwei_zhanghu_yingjiaokuan}}</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="公有房单位可用余额" :label-width="labelWidth">
            <span class="item-span">{{data.gongyoufang_danwei_keyong_yue}}</span>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div class="zz-content">
      <table class="full-width mt-20">
        <thead>
        <tr>
          <th colspan="4" style="text-align: left; padding-left: 20px;">业主</th>
        </tr>
        <tr>
          <th style="height: 30px;">业主姓名</th>
          <th>证件号码</th>
          <th>证件类型</th>
          <th>电话号码</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height: 30px;"></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 30px;"></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        </tbody>
      </table>
      <table class="full-width ">
        <thead>
        <tr>
          <th colspan="4" style="text-align: left; padding-left: 20px;">变更记录</th>
        </tr>
        <tr>
          <th style="height: 30px;">变更前业主</th>
          <th>变更后业主</th>
          <th>业务类型</th>
          <th>变更时间</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td style="height: 30px;"></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td style="height: 30px;"></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        </tbody>
      </table>
    </div>
    <el-dialog :title="dialog.title" :visible.syng="dialog.show" @close="onCloseDialog"
               :width="dialog.width" :top="dialog.top"
               class="sub-dialog"
               :closeOnClickModal="false"
               :fullscreen="false"
               :appendToBody="true"
    >
      <DlgZhanghuInfo @closeDilog="onCloseDialog" :props="dialog.data" :from="dialog.from"/>
    </el-dialog>
  </div>
</template>

<script>
    import Const from "../../../utils/const"
    import Strings from "../../../utils/strings";
    import Proto from "../../../utils/Proto";
    import * as Tool from "../../../utils";

    import DlgZhanghuInfo from "./DlgZhanghuInfo";
    export default {
        name: 'DlgFangwuInfo',
        components: {DlgZhanghuInfo},
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.DIALOG_FANGWU_INFO,
                labelWidth: '200px',
                fangwuId: -1,
                data: {
                    fangwu_dizhi: '',
                    fangwu_bianhao: '',
                    danyuan_mingcheng: '',
                    louceng: '',
                    shihao: '',
                    jianzhu_mianji: '',
                    fangwu_yingjaiokuan: '',
                    fangwu_yijiaokuan: '',
                    zhanghu_zhanghao: '',
                    zhanghu_yue: '',
                    zhanghu_keyong_yue: '',
                    zhanghu_lixi: '',
                    gongyoufang_danwei_mingcheng: '',
                    gongyoufang_danwei_zhanghu_zhanghao: '',
                    gongyoufang_danwei_zhanghu_yue: '',
                    gongyoufang_danwei_zhanghu_yingjiaokuan: '',
                    gongyoufang_danwei_keyong_yue: '',

                    yezhu: [],
                    biangeng_jilu: [],
                },
                dialog: {
                    show: false,
                    type: 0,
                    data: null,
                    width: '80%',
                    top: '15vh',
                    from : Const.VIEWS.DIALOG_FANGWU_INFO,
                },
            }
        },
        methods: {
            getData() {
                this.data = {
                    fangwu_dizhi: '锦绣•苏华 建设大路11号22',
                    fangwu_bianhao: '123456789',
                    danyuan_mingcheng: '1单元',
                    louceng: '1层',
                    shihao: '101',
                    jianzhu_mianji: '123',
                    fangwu_yingjaiokuan: '',
                    fangwu_yijiaokuan: '1445.0',
                    zhanghu_zhanghao: '123456789',
                    zhanghu_yue: '1542',
                    zhanghu_keyong_yue: '16756',
                    zhanghu_lixi: '12.22',
                    gongyoufang_danwei_mingcheng: '',
                    gongyoufang_danwei_zhanghu_zhanghao: '123456789',
                    gongyoufang_danwei_zhanghu_yue: '14545',
                    gongyoufang_danwei_zhanghu_yingjiaokuan: '0.00',
                    gongyoufang_danwei_keyong_yue: '456456',
                    yezhu: [],
                    biangeng_jilu: [],
                }
            },
            canGoToZhanghuInfo() {
                return this.from == Const.VIEWS.JIAOCUN_GOUFANGREN_DIALOG_TUIKUAN;
            },
            onGotoZhanghuInfo(type_key) {
                if (!this.canGoToZhanghuInfo())
                    return;
                this.dialog.show = true;
                this.dialog.type = 0;
                this.dialog.top = '10vh';
                this.dialog.data = {
                    id: 1,
                }
                this.dialog.title='查看账户详细信息'
            },
            onCloseDialog(data) {
                this.dialog.show = false;
            }
        },
        watch: {
            props(value) {
                // if (!value.id) return;
                // // if (value.id == this.fangwuId)
                // //     return;
                // this.fangwuId = value.id;
                this.getData();
            },
        },
        created() {
            this.getData();
        }

    }
</script>

<style scoped>
  .sub-dialog-fenhu-info .el-form-item {
    margin-bottom: 2px;

  }

</style>
