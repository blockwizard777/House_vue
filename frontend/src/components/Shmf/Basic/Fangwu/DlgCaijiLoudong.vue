<template>

  <div class="app-container">
    <el-form>
      <el-row :getter="24">
        <el-col :span="8">
          <el-form-item label="楼栋名称" :label-width="labelWidth">
            <el-input placeholder="" v-model="data.LDMC"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="建筑面积" :label-width="labelWidth">
            <el-input placeholder="" v-model="data.JZMJ"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="建成年代" :label-width="labelWidth">
            <el-input placeholder="" v-model="data.JCND"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-col :span="8">
          <el-form-item label="总楼层" :label-width="labelWidth">
            <el-input placeholder="" v-model="data.ZLC"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="建筑结构" :label-width="labelWidth">
            <el-input placeholder="" v-model="data.JZJG"/>
          </el-form-item>
        </el-col>
        <el-col :span="8">
        </el-col>
      </el-row>
      <el-row :getter="24">
        <el-form-item label="备注" :label-width="labelWidth">
          <el-input placeholder="" v-model="data.BZ"/>
        </el-form-item>
      </el-row>
      <cm-button class="fr" icon="el-icon-check" icon-style="color: #ff5227;" @click="onOk">确定</cm-button>
    </el-form>
  </div>

</template>
<script>
  import CmButton from '../../../Shmf/Common/Button';
  import * as Proto from "../../../../utils/Proto";
  import * as Tool from "../../../../utils";
  export default {
    name: 'DlgCaijiLoudong',
    components: {CmButton},
    props: {
      data: {
        type: Object, default() { return Tool.createObject(Proto.LOUDONG)}
      },
      onClose: {
        type:Function,
      }
    },
    data() {
      return {
        labelWidth: '120px'
      }
    },
    methods: {
      onOk() {
        this.onClose && this.onClose();
      }
    }
  }
</script>

<style scoped>

</style>
