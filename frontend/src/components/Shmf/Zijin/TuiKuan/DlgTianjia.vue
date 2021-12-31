<template>
  <el-form>
    <el-row :getter="24">
      <el-col :span="6">
        <el-form-item class="form-item-margin" label="证件号码" :label-width="label_width" :required="true">
          <el-input placeholder="" v-model="data.name"/>
        </el-form-item>
      </el-col>
      <el-col :span="6">
        <el-form-item class="form-item-margin" label="业主姓名" :label-width="label_width" :required="true">
          <el-input placeholder="" v-model="data.name"/>
        </el-form-item>
      </el-col>
      <el-col :span="6">
        <el-form-item class="form-item-margin" label="房屋地址" :label-width="label_width" :required="true">
          <el-input placeholder="" v-model="data.name"/>
        </el-form-item>
      </el-col>
      <el-col :span="6" style="padding: 0 10px;">
        <el-button type="primary" icon="el-icon-search" @click="onSave1">查询</el-button>
        <el-button type="danger" icon="el-icon-delete" @click="onSave1">请空</el-button>
      </el-col>
    </el-row>
    <el-divider/>
    <el-table :data="data.owners" tooltip-effect="dark" style="width: 100%;margin-top: 10px;" border fit :show-header="true">
      <el-table-column width="50" label="" prop="no"/>
      <el-table-column label="业主姓名" prop="name"/>
      <el-table-column label="房屋地址" prop="address"/>
      <el-table-column label="物业区域名称" prop="street_name"/>
      <el-table-column label="楼栋名称" prop="building_name"/>
      <el-table-column label="单元名称" prop="unit_cost"/>
      <el-table-column label="楼房" prop="layer"/>
      <el-table-column label="室号" prop="number"/>
      <el-table-column label="建筑面积(㎡)" prop="square"/>
    </el-table>
  </el-form>
</template>

<script>
  export default {
    name: 'DlgTianjia',
    data() {
      return {
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
            { no: 1,
              name: '张小四',
              address:'大案要案',
              street_name:'大案',
              building_name:'52栋',
              unit_cost: '1单元',
              layer: '22',
              number: 2202,
              square: 222
            }
          ],
          lou_dong_names: [],
          districts: [],
          provinces: []
        }
      }
    },
    methods: {
      onAdd() {
        this.data.owners.push({ name: '张小四', auth: '1234567890', action: '' })
      },
      onSave1() {
        this.$emit('closeDilog');

        // this.props.onSave && this.props.onSave();
      }
    },
  }
</script>

<style scoped>

</style>
