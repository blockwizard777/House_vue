<template>
  <div class="dialog-jaiokuan">
    <el-form>
      <el-row>
        <el-col :span="20">
          <el-row>
            <el-col :span="12">
              <el-form-item label="物业区城名称" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.wyqy.mc" disabled/>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="物业区城地址" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.wyqy.dz" disabled/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="房屋面积" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.fw.jzjm" disabled/>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="房屋地址" :label-width="labelWidth">
                <el-input v-model="props.fw.dz" disabled/>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="4"></el-col>
      </el-row>
      <el-row style="margin-top: 10px;">
        <el-col :span="20">
          <el-row>
            <el-col :span="12">
              <el-form-item label="交款人" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.jkr.xm"/>
              </el-form-item>
              <el-form-item label="个人交款金额" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.yjk" disabled/>
              </el-form-item>
              <el-form-item label="业主手机号码" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.yz.sjhm" disabled/>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="交款人证件号" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.jkr.zjh"/>
              </el-form-item>
              <el-form-item label="单位交款金额" :label-width="labelWidth" class="zz-linespcae-exact">
                <el-input v-model="props.dwyjk" disabled/>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="4">
          <el-button type="primary" style="margin-left: 10px;" icon="el-icon-circle-plus-outline" @click="onAdd">读取身份证
          </el-button>
        </el-col>
      </el-row>
    </el-form>
    <div class="zz-content">
      <el-button v-if="getEnough()" type="primary" icon="el-icon-plus" style="margin: 10px; width: 130px;">添加
      </el-button>
      <div class="zz-table-header">业主信息</div>
      <table style="width: 100%" class="dialog-with-fixedheader-table">
        <thead>
        <tr>
          <th style="height: 30px;"></th>
          <th style="width: 20%">业主姓名</th>
          <th style="width: 30%">业主证件号码</th>
          <th style="width: 30%">操作</th>
          <th style="width: 10%"></th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(yz, index) in this.yzList">
          <td style="height: 30px;" class="dialog-jaiokuan-with-fixedheader-table-index">{{index + 1}}</td>
          <td>aaa</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        </tbody>
      </table>
    </div>
    <el-divider/>
    <el-button type="primary" icon="el-icon-check" style="width: 130px;" @click="onSave">保存</el-button>
  </div>
</template>

<script>
    export default {
        name: 'DlgJiaokuan',
        props: {
            onClose: {type: Function},
            props: {type: Object},
            from: {type: String}
        },
        data() {
            return {
                labelWidth: '140px',
                yzList: [],
            }
        },
        methods: {
            init() {
                this.initData();
                this.initState();
            },
            initData() {
                if (this.props.yz) {
                    this.yzList.push(this.props.yz);
                }
            },
            initState() {
            },
            getEnough() {
                return !this.props.grye || this.props.grye <= 0;
            },
            onAdd() {
                // this.props.owners.push({ name: '张小四', auth: '1234567890', action: '' })
            },
            onSave() {
                this.onClose && this.onClose(this.data)
            }
        },
        created() {
            this.init();
        }

    }
</script>

<style lang="scss">
</style>
