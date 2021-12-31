<template>
  <div class="app-container zz-zijin-weibeian-dialog-jiaocun">
    <div class="filter-container">
      <el-form>
        <el-row >
          <el-col :span="12">
            <el-form-item class="form-item-margin" label="物业区城名称" :label-width="label_width" >
              <el-input placeholder="" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item class="form-item-margin" label="物业区城地址" :label-width="label_width" >
              <el-input placeholder="" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item class="form-item-margin" label="楼栋名称" :label-width="label_width" :required="true">
              <el-select style="width: 100%;">
                <el-option
                  v-for="item in lou_dong_names"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
            <el-form-item class="form-item-margin" label="单元" :label-width="label_width" >
              <el-input placeholder=""/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="室号" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.man"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="产权证书" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.man"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="合同号" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.man"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item class="form-item-margin" label="楼栋结构" :label-width="label_width">
              <el-select style="width: 100%;">
                <el-option
                  v-for="item in districts"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
            <el-form-item class="form-item-margin" label="楼屋" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="房屋地址" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="房屋用途" :label-width="label_width" :required="true">
              <el-select style="width: 100%;">
                <el-option
                  v-for="item in provinces"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
            <el-form-item class="form-item-margin" label="宅地栋号" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item class="form-item-margin" label="总楼房" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="物理屋" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="房屋面积(㎡)" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="房屋类型" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
            <el-form-item class="form-item-margin" label="个人应交款" :label-width="label_width" :required="true">
              <el-input placeholder="" v-model="data.pay.auth"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div class="zz-content">
        <cm-buttton type="primary" icon="el-icon-circle-plus-outline"
                    style="margin: 5px 15px;">读取身份证</cm-buttton>
        <table style="width: 100%;">
          <thead>
            <tr class="zz-fix-header"><th colspan="4" >业主休息</th></tr>
          </thead>
          <tbody>
            <tr><td colspan="4" style="padding: 5px 10px;">
              <el-button type="primary" icon="el-icon-circle-plus-outline" @click="onAdd">添加</el-button>
              <el-button type="danger" icon="el-icon-circle-close" @click="onAdd">删除</el-button>
            </td></tr>
          </tbody>
          <thead>
            <tr>
              <th style="height: 33px;"><div class="center">业主姓名</div></th>
              <th><div class="center">业主证件号码</div></th>
              <th><div class="center">证件类型</div></th>
              <th><div class="center">电话号码</div></th>
            </tr>
          </thead>
          <tbody>
            <tr><td style="height: 30px;"></td><td></td><td></td><td></td></tr>
            <tr><td style="height: 30px;"></td><td></td><td></td><td></td></tr>
            <tr><td style="height: 30px;"></td><td></td><td></td><td></td></tr>
          </tbody>
        </table>
        <table style="width: 100%; margin-top: 20px;">
          <tbody>
          <tr v-for="(item,key) in tableUpload" :key="key" track-by="key">
            <td style="width: 5%; height:40px; background: white;">
              <div class="center">{{item.idx + 1}}</div>
            </td>
            <td style="width: 30%; background: white; padding-left: 20px;">{{item.title}}</td>
            <td style="width: 15%; background: white;">
              <div class="center">
                <el-button type="primary" style="height: 30px;">上传</el-button>
              </div>
            </td>
            <td style="background: white; padding-left: 20px;">上传{{item.title}} 支持JPG, GIF格式图片， 不能超过5MB</td>
          </tr>
          </tbody>
        </table>

        <el-button type="primary" style="margin-left: auto;display: block;margin-top: 5px;" icon="el-icon-check" @click="onSave">保存</el-button>
      </div>
    </div>
  </div>
</template>

<script>
    import Const from "../../../../utils/const";
    import Strings from "../../../../utils/strings";
    import * as Proto from "../../../../utils/Proto";
    import * as Tool from "../../../../utils";
    import CmButtton from "../../Common/Button";

    export default {
        name: 'DlgWeiBeian',
        components: {CmButtton},
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                NAME: Const.VIEWS.JIAOCUN_WEIBEIAN_DIALOG_JIAOCUN,
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
                        {name: '张小四', auth: '1234567890', action: ''}
                    ],
                    lou_dong_names: [],
                    districts: [],
                    provinces: []
                },
                tableUpload: [],
                dialog: {
                    show: false,
                    type: 0,
                    data: null,
                    width: '80%',
                    top: '15vh',
                },
            }
        },
        methods: {
            init() {
                this.initData();
                this.initState();
            },
            initData() {
                const uploadTableData = {
                    yuanshi_shouju              : {title: '原始收据'    , api: '', res: ''},
                    fangwu_suoyou_quanzheng     : {title: '房屋所有权证'      , api: '', res: ''},
                    cehui_baogao                : {title: '测绘报告'      , api: '', res: ''},
                    shangpinfang_maimai_hetong  : {title: '商品房买卖合同'    , api: '', res: ''},
                    gongfang_jiaokuan_tongzhidan: {title: '公房交款通知单' , api: '', res: ''},
                }
                const keys = Object.keys(uploadTableData);
                keys.map((key) => {
                    uploadTableData[key].idx = Tool.getIndexByValue(keys, key);
                })
                this.tableUpload = uploadTableData;
            },
            initState() {
            },
            onClickUpload() {
            },
            onAdd() {
                this.data.owners.push({name: '张小四', auth: '1234567890', action: ''})
            },
            onSave() {
                this.onClose && this.onClose();
            }
        },
        created() {
            this.init();
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
    }
</script>

<style scoped>
  .form-item-margin {
    margin-bottom: 5px !important;
  }
</style>
