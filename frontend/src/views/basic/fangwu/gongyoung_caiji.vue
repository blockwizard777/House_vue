<template>
  <div class="container">
    <el-row>
      <el-card shadow="hover">
        <div slot="header" class="clearfix">
          <span>物业</span>
        </div>
        <div>
          <el-form>
            <el-row>
              <el-col span=20>
                <el-form-item label="物业区城名称" :label-width="formLabelWidth" required="true">
                  <el-select>
                    <el-option
                      v-for="item in names"
                      :key="item"
                      :label="item"
                      :value="item"/>
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
          <el-divider/>
          <el-row>
            <el-col span="6">
              <el-row style="max-height: 200px;overflow: scroll;">
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
                <el-button>xxxx</el-button>
              </el-row>
              <el-checkbox>共用</el-checkbox>
              <el-card>
                <el-tree
                  :data="caijiData"
                  :props="caijiDataProps"
                  node-key="id"
                  default-expand-all
                  highlight-current
                  :expand-on-click-node="false"
                  @node-click="onClickTreeItem"
                />
              </el-card>
            </el-col>
            <el-col span="18">
              <catch-table
                :ref="table.ref"
                :headers="table.headers"
                :border="true"
                :formCreate="formCreate"
                :table-events="table.events"
                :api-route="table.apiRoute"
                :dialog-width="table.dialog.width"
              />
            </el-col>
          </el-row>
          <el-dialog title="上传文件" :visible="visibleUploadDialog" :destroy-on-close="true" width="40%"
                     @close="visibleUploadDialog = false">
            <div style="align-items: center; text-align: center;">
              <SingleImageUpload2/>
              <el-row style="margin: 10px;">
                <el-button>上传</el-button>
                <el-button @click="closeUploadDialog">取消</el-button>
              </el-row>
            </div>
          </el-dialog>
        </div>
      </el-card>
    </el-row>

  </div>

</template>

<style lang="scss" scoped>
  .container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;
  }
</style>

<script>
  import renderForm from '@/views/render-table-form'
  import SingleImageUpload2 from '../../../components/Upload/SingleImage2'

  export default {
    components: { SingleImageUpload2 },
    mixins: [renderForm],
    data() {
      return {
        caijiData: [],
        caijiDataProps: {
          label: 'department_name'
        },
        tableFrom: 'table/basic/caji',
        formLabelWidth: '120px',
        engines: [],
        names: [],
        districts: [],
        provinces: [],
        visibleUploadDialog: false
      }
    },
    methods: {
      onClickTreeItem(data, node, self) {
        alert(data)
      },
      openUploadDialog() {
        this.visibleUploadDialog = true
      },
      closeUploadDialog() {
        this.visibleUploadDialog = false
      }
    },

    created() {
      //tree자료를 얻는다.
      this.$http.get('departments').then(response => {
        this.caijiData = response.data
      })
      this.names = ['name1', 'name2', 'name3']
      this.districts = ['district1', 'district2', 'district3']
      this.provinces = ['province1', 'province2', 'province3']
    }
  }
</script>



