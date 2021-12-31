<template>
  <el-table :data="list" tooltip-effect="dark"
            border :show-header="true"
            highlight-current-row>
    <el-table-column label="单元" >
      <template slot-scope="scope">
        <span>{{scope.row.DYMC}}单元</span>
      </template>
    </el-table-column>
    <el-table-column label="楼层" >
      <template slot-scope="scope">
        <span>{{scope.row.LC}}层</span>
      </template>
    </el-table-column>
    <el-table-column label="室号" prop="SH">
      <template slot-scope="scope">
        <span>{{scope.row.SH}}室</span>
      </template>
    </el-table-column>
    <el-table-column label="房屋地址" prop="FWDZ"/>
    <el-table-column label="建筑面积" prop="JZMJ"/>
    <el-table-column label="房屋用途" >
      <template slot-scope="scope">
        <span>{{getFWYT(scope.row.FWYT)}}</span>
      </template>
    </el-table-column>
    <el-table-column label="房屋类型" >
      <template slot-scope="scope">
        <span>{{getFWLX(scope.row.FWLX)}}</span>
      </template>
    </el-table-column>
  </el-table>
</template>
<script>
  import * as Tool from '../../../../utils';
  import Const from '../../../../utils/const';
  import Strings from "../../../../utils/strings";

  export default {
    name: 'FangwuTable',
    props: {
      list: {type: Array, default() {return []}},
    },
    methods: {
      getFWYT(fwyt) {
        return Strings.FANGWU_YONGTU[fwyt] ? Strings.FANGWU_YONGTU[fwyt] : '';
      },
      getFWLX(fwlx) {
        return Strings.FANGWU_LEIXING[fwlx] ? Strings.FANGWU_LEIXING[fwlx] : '';
      }
    }
  }
</script>

<style scoped>

</style>
