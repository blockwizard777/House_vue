<template>
  <el-form-item :label="label" :label-width="formLabelWidth">
    <el-input :placeholder="placeHolder"></el-input>
  </el-form-item>
</template>

<script>
  export default {
    props:{
      label:String,
      placeHolder:String,
    },
    data(){
      return{
        formLabelWidth:'120px'
      }

    }
  }
</script>
