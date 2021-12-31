<template>
  <div style="padding: 0px;" class="wuyeTianjia">
    <el-row >
      <el-form>
        <el-row :getter="24">
          <el-col :span="24">
            <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
              <el-input placeholder=""/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="24">
            <el-form-item class="zz-linespcae-exact-5" label="qqqq" :label-width="formLabelWidth">
              <el-select style="width: 100%;">
                <el-option
                  v-for="item in provinces"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="24">
            <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
              <el-input placeholder=""/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="20">
            <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
              <el-input placeholder=""/>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <CmButton style="margin-left: 5px;" @click="" type="primary" class="el-icon-notebook-2">选择</CmButton>
          </el-col>
        </el-row>
        <el-row :getter="24">
          <el-col :span="20">
            <el-form-item class="zz-linespcae-exact-5" label="qqqq" :label-width="formLabelWidth">
              <el-input placeholder=""/>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <CmButton style="margin-left: 5px;" @click="" type="primary" class="el-icon-notebook-2">选择</CmButton>
          </el-col>
        </el-row>
        <el-row style="display: flex;margin-top: 20px;">
          <CmButton style="margin-left: auto;margin-right: auto" class="el-icon-check" type="primary">保存</CmButton>
        </el-row>
      </el-form>
    </el-row>
  </div>
</template>

<script>
  import CmButton from '../../../../components/Shmf/Common/Button'
  export default {
    components: { CmButton, },
    name: 'DlgBianji',
    data() {
      return {
        formLabelWidth: '100px',
        provinces: [],
      }
    }
  }
</script>

<style scoped>

</style>
