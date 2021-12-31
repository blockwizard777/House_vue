<template>
  <div class="dialog-tuikuan">
    <el-form>
      <el-row>
        <el-col :span="12">
          <el-form-item label="物业区城名称" :label-width="label_width">
            <el-input placeholder="" v-model="data.wuyequyu_mingcheng"/>
          </el-form-item>
          <el-form-item label="证件类型" :label-width="label_width">
            <el-input placeholder="" v-model="data.zhengjian_leixing"/>
          </el-form-item>
          <el-form-item label="业主" :label-width="label_width">
            <el-input placeholder="" v-model="data.yezhu"/>
          </el-form-item>
          <el-form-item label="房屋账户利息" :label-width="label_width">
            <el-input placeholder="" v-model="data.fangwu_zhanghu_lixi"/>
          </el-form-item>
          <el-form-item label="公有房单位" :label-width="label_width">
            <el-input placeholder="" v-model="data.gongyoufang_danwei"/>
          </el-form-item>
          <el-form-item label="公有房单位账户利息" :label-width="label_width">
            <el-input placeholder="" v-model="data.gongyoufang_danwei_zhanghu_lixi"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="房屋地址" :label-width="label_width">
            <span class="item-span link-type" @click="onClickAddress">{{data.fangwu_dizhi}}</span>
          </el-form-item>
          <el-form-item label="证件号码" :label-width="label_width">
            <el-input placeholder="" v-model="data.zhengjian_haoma"/>
          </el-form-item>
          <el-form-item label="房屋账户余额" :label-width="label_width">
            <el-input placeholder="" v-model="data.fangwu_zhanghu_yue"/>
          </el-form-item>
          <el-form-item label="可用余额" :label-width="label_width">
            <el-input placeholder="" v-model="data.keyong_yue"/>
          </el-form-item>
          <el-form-item label="公有房单位账户余额" :label-width="label_width">
            <el-input placeholder="" v-model="data.gongyoufang_danwei_zhanghu_yue"/>
          </el-form-item>
          <el-form-item label="公有房单位可用余额" :label-width="label_width">
            <el-input placeholder="" v-model="data.gongyoufang_danwei_keyong_yue"/>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="12">
          <el-form-item label="收款账户账号" :label-width="label_width">
            <el-input placeholder="" v-model="data.shoukuan_zhanghu_zhanghao"/>
          </el-form-item>
          <el-form-item label="收款账户开户行" :label-width="label_width">
            <el-input placeholder="" v-model="data.shoukuan_zhanghu_kaihuxing"/>
          </el-form-item>
          <el-form-item label="购房合同号" :label-width="label_width">
            <el-input placeholder="" v-model="data.goufang_hetonghao"/>
          </el-form-item>
          <el-form-item label="公有房单位财政票据号" :label-width="label_width">
            <el-input placeholder="" v-model="data.gongyoufang_danwei_caizheng_piaojuhao"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="收款账户户名" :label-width="label_width">
            <el-input placeholder="" v-model="data.shoukuan_zhanghu_huming"/>
          </el-form-item>
          <el-form-item label="退款原因" :label-width="label_width">
            <el-input placeholder="" v-model="data.tuikuan_yuanyin"/>
          </el-form-item>
          <el-form-item label="业主手机号码" :label-width="label_width">
            <el-input placeholder="" v-model="data.yezhu_shouji_haoma"/>
          </el-form-item>
          <el-form-item label="公有房退款金额" :label-width="label_width">
            <el-input placeholder="" v-model="data.gongyoufang_tuikuan_jine"/>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div class="zz-content">
      <table style="width: 100%; margin-top: 20px;">
        <tbody>
        <tr v-for="(item,key) in tableUpload" :key="key" track-by="key">
          <td style="width: 5%; height:35px; background: white;">
            <div class="center">{{item.idx + 1}}</div>
          </td>
          <td style="width: 20%; background: white; padding-left: 20px;">{{item.title}}</td>
          <td style="width: 15%; background: white;">
            <div class="center">
              <el-button type="primary" style="height: 30px;">上传</el-button>
            </div>
          </td>
          <td style="background: white; padding-left: 20px;">上传{{item.title}} 支持JPG, GIF格式图片， 不能超过5MB</td>
        </tr>
        </tbody>
      </table>
    </div>
    <el-divider/>
    <el-button type="primary" icon="el-icon-check" @click="onSave"
               style="margin-top: 10px; margin-left: 20px; width: 100px; margin-bottom: 0px;">保 存
    </el-button>
    <el-dialog :title="dialog.title" :visible.syng="dialog.show" @close="onCloseDialog"
               :width="dialog.width" :top="dialog.top"
               class="sub-dialog"
               :closeOnClickModal="false"
               :fullscreen="false"
               :appendToBody="true"
    >
      <DlgFangwuInfo @closeDilog="onCloseDialog" :props="dialog.data" :from="NAME"/>
    </el-dialog>
  </div>

</template>

<script>
    import DlgFangwuInfo from "../../Common/DlgFangwuInfo";
    import Const from '../../../../utils/const';
    import Strings from "../../../../utils/strings";
    import * as Tool from "../../../../utils";

    export default {
        components: {DlgFangwuInfo},
        name: 'DlgTuikuan',
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_GOUFANGREN_DIALOG_TUIKUAN,
                label_width: '140px',
                data: {
                    wuyequyu_mingcheng: '锦绣•苏华',
                    fangwu_dizhi: '锦绣•苏华',
                    zhengjian_leixing: '身份证',
                    zhengjian_haoma: 123456789123456789,
                    yezhu: '张小四',
                    fangwu_zhanghu_yue: 0,
                    fangwu_zhanghu_lixi: 0,//
                    keyong_yue: 0,
                    gongyoufang_danwei: '张小四',
                    gongyoufang_danwei_zhanghu_yue: 14556,
                    gongyoufang_danwei_zhanghu_lixi: 1023.26,
                    gongyoufang_danwei_keyong_yue: 14556,

                    shoukuan_zhanghu_zhanghao: 123456789,
                    shoukuan_zhanghu_huming: '张小四',
                    shoukuan_zhanghu_kaihuxing: '',
                    tuikuan_yuanyin: Const.TUIKUAN_YUANYIN.TUIKUAN,
                    goufang_hetonghao: '',
                    yezhu_shouji_haoma: '',
                    gongyoufang_danwei_caizheng_piaojuhao: '',
                    gongyoufang_tuikuan_jine: 0,

                    upload: {
                        yezhu_shenfenzheng: '',
                        tuikuan_zhengming: '',
                        tuikuan_shouju: '',
                        fangwu_chuanquanzheng: '',
                        fangwu_chaiqian_xieyishu: '', //房屋拆迁协议,
                        zhengque_louhao_fanghao: '',
                        qita_cailiao: '',
                    }
                },
                dialog: {
                    show: false,
                    type: 0,
                    data: null,
                    width: '80%',
                    top: '15vh',
                },
                tableUpload: [],
                selectTuikuanYuanyin: [],
            }
        },
        methods: {
            init() {
                this.initData();
                this.initState();
            },
            initData() {
                const uploadTableData = {
                    yezhu_shenfenzheng: {title: '业主身份证', api: '', res: ''},
                    tuikuan_zhengming: {title: '退款证明', api: '', res: ''},
                    tuikuan_shouju: {title: '原始收据', api: '', res: ''},
                    fangwu_chuanquanzheng: {title: '房屋产权证', api: '', res: ''},
                    fangwu_chaiqian_xieyishu: {title: '房屋拆迁协议书', api: '', res: ''}, //房屋拆迁协议,
                    zhengque_louhao_fanghao: {title: '正确楼号房号', api: '', res: ''},
                    qita_cailiao: {title: '其他材料', api: '', res: ''},
                }
                const keys = Object.keys(uploadTableData);
                keys.map((key) => {
                    uploadTableData[key].idx = Tool.getIndexByValue(keys, key);
                })
                this.tableUpload = uploadTableData;
            },
            initState() {
                this.dialog.show = false;
            },
            onClickUpload() {
            },
            onClickAddress() {
                this.dialog.show = true;
                this.dialog.type = 0;
                this.dialog.top = '10vh';
                this.dialog.data = {
                    id: 1,
                }
                this.dialog.title='房屋信息'
            },
            onSave() {
                this.onClose && this.onClose();
            },
            onCloseDialog() {
                this.dialog.show = false;
            }
        },
        watch: {
            // props: {
            //     deep: true,
            //     handler(val) {
            //         this.setOptions(val)
            //     }
            // }

            // props(value) {}
        },
        created() {
            this.init();
        }

    }
</script>

<style scoped>
  .dialog-tuikuan .el-form-item {
    margin-bottom: 5px !important;
  }

  .temp-item-span {
    display: block;
    border: solid rgba(0, 0, 0, 0.2) 1px;
    padding-left: 10px;
    border-radius: 5px
  }

</style>
