<template>
  <el-form ref="form" :model="data" :rules="rules" :validate-on-rule-change="false">
    <el-row :getter="24">
      <el-col :span="12">
        <el-form-item label="机构类型" :label-width="label_width">
          <el-select :value="data.type" placeholder="请选择类型" @change="onChangeType">
            <el-option
              v-for="(item, key) in types"
              :key="key"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
      </el-col>
    </el-row>

    <!--  开发建设单位   -->
    <div v-if="data.type==0">
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="机构代码" :label-width="label_width" prop="SHXYDM">
            <el-input v-model="data.SHXYDM"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="开发建设单位名称" :label-width="label_width" prop="JGMC">
            <el-input v-model="data.JGMC"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24" v-if="bCreate">
        <el-col :span="12">
          <el-form-item label="密码" :label-width="label_width" prop="password">
            <el-input placeholder="" v-model="data.password" type="password"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="确认密码" :label-width="label_width" prop="confirmPwd">
            <el-input placeholder="" v-model="data.confirmPwd" type="password"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="资质证书编号" :label-width="label_width" prop="ZZZSBH">
            <el-input placeholder="" v-model="data.ZZZSBH"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="组织机构代码有效期" :label-width="label_width" prop="XYDMYXQ">
            <el-date-picker placeholder="" v-model="data.XYDMYXQ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="资质有效期" :label-width="label_width" prop="ZZYXQ">
            <el-date-picker placeholder="" v-model="data.ZZYXQ"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="企业法人营业执照注册号" :label-width="label_width" prop="FDDBRZZZCH">
            <el-input placeholder="" v-model="data.FDDBRZZZCH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="企业法人代表" :label-width="label_width" prop="FDDBR">
            <el-input placeholder="" v-model="data.FDDBR"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="法人代表手机号" :label-width="label_width" prop="FDDBRDH">
            <el-input placeholder="" v-model="data.FDDBRDH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="联系人" :label-width="label_width" prop="LXR">
            <el-input placeholder="" v-model="data.LXR"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="联系人手机号" :label-width="label_width" prop="LXRDH">
            <el-input placeholder="" v-model="data.LXRDH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="办公电话" :label-width="label_width">
            <el-input placeholder="" v-model="data.BGDH"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="传真" :label-width="label_width">
            <el-input placeholder="" v-model="data.CZ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="电子邮箱" :label-width="label_width">
            <el-input placeholder="" v-model="data.DZYX"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="邮箱" :label-width="label_width">
            <el-input placeholder="" v-model="data.YB"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="联系人QQ" :label-width="label_width">
            <el-input placeholder="" v-model="data.LXRQQ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-form-item label="地址" :label-width="label_width">
          <el-input placeholder="" v-model="data.DZ"/>
        </el-form-item>
      </el-row>
    </div>

    <!--  物业服务企业   -->
    <div v-if="data.type==1">
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="机构代码" :label-width="label_width" prop="SHXYDM">
            <el-input v-model="data.SHXYDM"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="物业服务企业名称" :label-width="label_width" prop="JGMC">
            <el-input v-model="data.JGMC"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24" v-if="bCreate">
        <el-col :span="12">
          <el-form-item label="密码" :label-width="label_width" prop="password">
            <el-input placeholder="" v-model="data.password" type="password"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="确认密码" :label-width="label_width" prop="confirmPwd">
            <el-input placeholder="" v-model="data.confirmPwd" type="password"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="资质证书编号" :label-width="label_width" prop="ZZZSBH">
            <el-input placeholder="" v-model="data.ZZZSBH"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="组织机构代码有效期" :label-width="label_width" prop="XYDMYXQ">
            <el-date-picker placeholder="" v-model="data.XYDMYXQ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="资质有效期" :label-width="label_width" prop="ZZYXQ">
            <el-date-picker placeholder="" v-model="data.ZZYXQ"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="企业法人营业执照注册号" :label-width="label_width" prop="FDDBRZZZCH">
            <el-input placeholder="" v-model="data.FDDBRZZZCH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="企业法人代表" :label-width="label_width" prop="FDDBR">
            <el-input placeholder="" v-model="data.FDDBR"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="法人代表手机号" :label-width="label_width" prop="FDDBRDH">
            <el-input placeholder="" v-model="data.FDDBRDH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="联系人" :label-width="label_width" prop="LXR">
            <el-input placeholder="" v-model="data.LXR"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="联系人手机号" :label-width="label_width" prop="LXRDH">
            <el-input placeholder="" v-model="data.LXRDH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="办公电话" :label-width="label_width">
            <el-input placeholder="" v-model="data.BGDH"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="传真" :label-width="label_width">
            <el-input placeholder="" v-model="data.CZ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="电子邮箱" :label-width="label_width">
            <el-input placeholder="" v-model="data.DZYX"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="邮箱" :label-width="label_width">
            <el-input placeholder="" v-model="data.YB"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="联系人QQ" :label-width="label_width">
            <el-input placeholder="" v-model="data.LXRQQ"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="开户行名称" :label-width="label_width" prop="KHXMC">
            <el-input placeholder="" v-model="data.KHXMC"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="收款账户名称" :label-width="label_width" prop="SKZHMC">
            <el-input placeholder="" v-model="data.SKZHMC"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="收款账户账号" :label-width="label_width" prop="SKZHZH">
            <el-input placeholder="" v-model="data.SKZHZH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-form-item label="地址" :label-width="label_width">
          <el-input placeholder="" v-model="data.DZ"/>
        </el-form-item>
      </el-row>

    </div>

    <!--  业主委员会  -->
    <div v-if="data.type==2">
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="机构代码" :label-width="label_width" prop="SHXYDM">
            <el-input v-model="data.SHXYDM"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="业主委员会名称" :label-width="label_width" prop="JGMC">
            <el-input v-model="data.JGMC"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24" v-if="bCreate">
        <el-col :span="12">
          <el-form-item label="密码" :label-width="label_width" prop="password">
            <el-input placeholder="" v-model="data.password" type="password"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="确认密码" :label-width="label_width" prop="confirmPwd">
            <el-input placeholder="" v-model="data.confirmPwd" type="password"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="22">
          <el-form-item label="物业区域" :label-width="label_width" prop="WYQYDM">
            <el-input placeholder="" v-model="data.ZZZSBH"/>
          </el-form-item>
        </el-col>
        <el-col :span="2">
          <el-button class="filter-item search" icon="el-icon-search" type="primary" >查询</el-button>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="组织机构代码有效期" :label-width="label_width" prop="XYDMYXQ">
            <el-date-picker placeholder="" v-model="data.XYDMYXQ"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="第几届" :label-width="label_width" prop="RQ">
            <el-input placeholder="" v-model="data.RQ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label=“成立时间 :label-width="label_width" prop="CLSJ">
            <el-input placeholder="" v-model="data.CLSJ"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="到届时间" :label-width="label_width" prop="DJSJ">
            <el-input placeholder="" v-model="data.DJSJ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label=“主任姓名 :label-width="label_width" prop="ZRXM">
            <el-input placeholder="" v-model="data.ZRXM"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="主任手机号" :label-width="label_width" prop="ZRDH">
            <el-input placeholder="" v-model="data.ZRDH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="主任证件号码" :label-width="label_width" prop="ZRZJHM">
            <el-input placeholder="" v-model="data.ZRZJHM"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label=“预留印鉴副主任姓名 :label-width="label_width" prop="FZRXM">
            <el-input placeholder="" v-model="data.FZRXM"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label=“副主任证件号码 :label-width="label_width" prop="FZRZJHM">
            <el-input placeholder="" v-model="data.FZRZJHM"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="联系人" :label-width="label_width" prop="LXR">
            <el-input placeholder="" v-model="data.LXR"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="联系人手机号" :label-width="label_width" prop="LXRDH">
            <el-input placeholder="" v-model="data.LXRDH"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="办公电话" :label-width="label_width">
            <el-input placeholder="" v-model="data.BGDH"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="传真" :label-width="label_width">
            <el-input placeholder="" v-model="data.CZ"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="电子邮箱" :label-width="label_width">
            <el-input placeholder="" v-model="data.DZYX"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="12">
          <el-form-item label="邮编" :label-width="label_width">
            <el-input placeholder="" v-model="data.YB"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="联系人QQ" :label-width="label_width">
            <el-input placeholder="" v-model="data.LXRQQ"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-form-item label="地址" :label-width="label_width">
          <el-input placeholder="" v-model="data.DZ"/>
        </el-form-item>
      </el-row>
    </div>
    <el-row :getter="24">
      <el-col :span="16" style="height: 20px;">
      </el-col>
      <el-col :span="4">
        <el-button type="primary" icon="el-icon-check" @click="onSave">保存</el-button>
      </el-col>
    </el-row>
  </el-form>
</template>

<script>
  import Const from '../../../../../utils/const'
  import Strings from "../../../../../utils/strings";
  import * as Proto from "../../../../../utils/Proto"
  import * as Tool from '../../../../../utils'

  export default {
    name: 'DlgJigouBeian',
    props: {
      data: {
        type:Object,
        default: Tool.createObject(Proto.JIGOU)
      },
      bCreate: {
        type: Boolean, default : true,
      }
    },
    data() {
      return {
        Consts: Const,
        types: [],
        // data:  Tool.isValidObject(this.row) ? Tool.createObject(this.row) : Tool.createObject(Const.JIGOU_DATA),
        rules: {},
        commonRules: {
          password: [{ required: true, message: '密码必须填写', trigger: 'blur' }],
          confirmPwd: [{ required: true, message: '确认密码必须填写', trigger: 'blur' }],
          SHXYDM: [{ required: true, message: '请输入机构代码', trigger: 'blur' }],
          JGMC: [{ required: true, message: '请输入机构名称', trigger: 'blur' }],
          LXR: [{ required: true, message: '请输入联系人', trigger: 'blur' }],
          LXRDH: [{ required: true, message: '请输入联系人手机号', trigger: 'blur' }]
        },
        detaileRules: {},
        label_width: '200px'
      }
    },
    methods: {
      init() {
        const keys = Object.keys(Const.JIGOU)
        keys.map((key) => {
          this.types.push({
            value: Const.JIGOU[key],
            label: Strings.JIGOU[key] ? Strings.JIGOU[key] : ''
          })
        })
        this.detaileRules = {
          [Const.JIGOU.KAIFA]: {
            ZZZSBH: [{ required: true, message: '请输入资质证书编号', trigger: 'blur' }],
            XYDMYXQ: [{ required: true, message: '请输入组织机构代码有效期', trigger: 'blur' }],
            ZZYXQ: [{ required: true, message: '请输入资质有效期', trigger: 'blur' }],
            FDDBR: [{ required: true, message: '请输入企业法人代表', trigger: 'blur' }],
            FDDBRDH: [{ required: true, message: '请输入联法人代表手机号', trigger: 'blur' }],
            FDDBRZZZCH: [{ required: true, message: '请输入企业法人营业执照注册号', trigger: 'blur' }]
          },
          [Const.JIGOU.FUWU]: {
            ZZZSBH: [{ required: true, message: '请输入资质证书编号', trigger: 'blur' }],
            XYDMYXQ: [{ required: true, message: '请输入组织机构代码有效期', trigger: 'blur' }],
            ZZYXQ: [{ required: true, message: '请输入资质有效期', trigger: 'blur' }],
            FDDBR: [{ required: true, message: '请输入企业法人代表', trigger: 'blur' }],
            FDDBRDH: [{ required: true, message: '请输入联法人代表手机号', trigger: 'blur' }],
            FDDBRZZZCH: [{ required: true, message: '请输入企业法人营业执照注册号', trigger: 'blur' }],
            KHXMC:[{ required: true, message: '请输入开户行名称', trigger: 'blur' }],    //   '',
            SKZHMC:[{ required: true, message: '请输入收款账户名称', trigger: 'blur' }],    //   '',
            SKZHZH:[{ required: true, message: '请输入收款账户账号', trigger: 'blur' }],    //   '',
          },
          [Const.JIGOU.YEZHU]: {
            XYDMYXQ: [{ required: true, message: '请输入组织机构代码有效期', trigger: 'blur' }],
            RQ: [{ required: true, message: '请输入任期', trigger: 'blur' }],
            CLSJ: [{ required: true, message: '请输入成立时间', trigger: 'blur' }],
            DJSJ: [{ required: true, message: '请输入联法人代表手机号', trigger: 'blur' }],
            ZRXM: [{ required: true, message: '请输入主任姓名', trigger: 'blur' }],
            ZRDH:[{ required: true, message: '请输入主任电话', trigger: 'blur' }],    //   '',
            ZRZJHM:[{ required: true, message: '请输入主任证件号码', trigger: 'blur' }],    //   '',
            FZRXM: [{ required: true, message: '请输入副主任姓名', trigger: 'blur' }],
            FZRDH:[{ required: true, message: '请输入副主任电话', trigger: 'blur' }],    //   '',
            FZRZJHM:[{ required: true, message: '请输入副主任证件号码', trigger: 'blur' }],    //   '',
          }
        }
        this.onChangeType(Const.JIGOU.KAIFA)
      },
      onCancel() {
        this.$refs['form'].clearValidate();
      },
      onSave() {
        this.$refs['form'].validate(async (valid) => {
          if (!valid) return;
          let url = '', method = '', title = '';
          if (this.bCreate) {
            url = 'jigou/beian';
            method = 'post';
            title = '创建';
          } else {
            url = 'jigou/beian/' + this.data.id;
            method = 'put';
            title = '更新';
          }
          try {
            await this.$http[method](url, this.data);
            this.$message.success(`${title}成功`);
            this.$emit('closeDilog', true);
          } catch (e) {
            this.$message.error(`${title}失败`);
          }

        })
      },
      onChangeType(type) {
        const detailRules = this.detaileRules[type] ? this.detaileRules[type] : {}
        this.rules = {
          ...this.commonRules,
          ...detailRules
        }
        this.$refs['form'] && this.$refs['form'].clearValidate();
        this.data.type = type;

      }
    },
    created() {
      this.init()
    },
    // ready() {
    //   this.data =  Tool.isValidObject(this.row) ? Tool.createObject(this.row) : Tool.createObject(Const.JIGOU_DATA);
    // }
  }
</script>

<style scoped>
  .el-form-item {
    /*margin-bottom: 5px !important;*/
  }

</style>
