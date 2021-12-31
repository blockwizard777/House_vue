<template>
  <div class="app-container">
    <div class="filter-container" style="padding: 0 25px;">
      <el-form>
        <el-row :getter="24">
          <el-col :span="8">
            <el-form-item label="账户" :required="true" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="search.no"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="账户" :required="true" :label-width="formLabelWidth">
              <el-input placeholder="" v-model="search.no"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <cm-button class="filter-item search" icon="el-icon-search" icon-style="color: #ff5227;" @click="onSearch">
              查询
            </cm-button>
            <cm-button class="filter-item" icon="el-icon-delete" @click="onClear" icon-style="color: #ff5227;">
              清空
            </cm-button>
          </el-col>
        </el-row>
      </el-form>
    </div>
  </div>
</template>

<script>
  import {getRand} from '../../../../utils'
  import CmButton from '../../Common/Button'
  export default {
    name: 'DlgCaijiJianshedanwei',
    components: {CmButton},
    data() {
      return {
        search: {
          no: '',
          name: '',
        },
        list: [],
        formLabelWidth: '100px',
      }
    },
    methods: {
      onSearch() {
        this.createList(this.getRand(5))
      },
      onClear() {
        this.query = ''
        this.createList(10);
      },
      createList(count) {
        this.list = []
        for (let i = 0; i < count; i++) {
          let element = {
            no: '1234567890',
            name: 'XXXX房地产开发集团有限公司',
          }
          this.list.push(element)
        }
      }
    },
    created() {
      this.createList(10)
    }
  }
</script>

<style scoped>

</style>
