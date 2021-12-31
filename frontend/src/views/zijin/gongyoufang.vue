<template>
  <div class="app-container">
    <header><h3>公有房交款业务</h3></header>
    <el-divider></el-divider>
    <div>
      <el-form>
        <el-row>
          <el-col :span="8">
            <el-form-item style="margin: 0px;" label="物业区城名称" :label-width="formLabelWidth">
              <el-select>
                <el-option
                  v-for="item in names"
                  :key="item"
                  :label="item"
                  :value="item"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col span=8>
            <FormInput label="行政区域"/>
          </el-col>
          <el-col span=8>
            <FormInput label="物业区城地址"/>
          </el-col>
        </el-row>
        <el-divider/>

      </el-form>
    </div>
  </div>
</template>

<script>
  import FormInput from '../../components/FormInput'
  export default {

    components: { FormInput },
    mixins: [],
    data() {
      return {
        names: [],
        list: [],
      }
    },
    methods: {
      getRand(max) {
        let rnd = Math.random() * max
        return rnd
      },
      createList(count) {
        this.list = []
        for (let i = 0; i < 5; i++) {

          let rnd1 = this.getRand(4)
          let element = {
            no: '1234567890',
            name: 'XXXX路X号XXX单元XXX系统项目账户',
            type: '项目账户',
            amount: '0.00',
            inc: '2334563.23',
            dec: '2334563.23'
          }
          this.list.push(element)
        }
      }
    },

    created() {
      this.names = ['name1', 'name2', 'name3']
      this.createList(50)
    }
  }
</script>

<style lang="scss" >

  .container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;
  }
  /*.el-dialog__header {*/
  /*  background: #00aa82 !important;*/
  /*  padding: 20px !important;*/
  /*}*/

</style>

