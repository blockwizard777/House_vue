<template>
  <el-dialog title="上传文件" visible="visibleUploadDialog" :destroy-on-close="true" width="40%"
             @close="closeUploadDialog">
    <div style="align-items: center; text-align: center;">
      <SingleImageUpload2/>
      <el-row style="margin: 10px;">
        <el-button>上传</el-button>
        <el-button @click="closeUploadDialog">取消</el-button>
      </el-row>
    </div>
  </el-dialog>
</template>

<script>

  import SingleImageUpload2 from '../Upload/SingleImage2'
  export default {
    components: { SingleImageUpload2 },
    props:{
      visibleUploadDialog:false,
      closeUploadDialog:Object,
    },
    data() {
      return{

      }
    }
  }
</script>
