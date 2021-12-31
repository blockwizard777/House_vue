<template>
  <div class="singleImageUpload2 upload-container">
    <el-upload
      :data="dataObj"
      :multiple="false"
      :show-file-list="false"
      :on-success="handleImageSuccess"
      class="image-uploader"
      drag
    >
      <i class="el-icon-upload" />
      <div class="el-upload__text">
        Drag或<em>点击上传</em>
      </div>
    </el-upload>
    <el-row style="margin: 10px;">
      <el-button @click="onSuccess">上传</el-button>
      <el-button @click="onClose">取消</el-button>
    </el-row>
  </div>
</template>

<script>
  export default {
    name: 'ParseJsonDialog',
    props: {
      onSuccess: Function,
      onClose: Function,
    },
    data() {
      return {
        tempUrl: '',
        dataObj: { token: '', key: '' }
      }
    },
  }
</script>

<style lang="scss" scoped>
  .upload-container {
    width: 100%;
    height: 100%;
    position: relative;
    .image-uploader {
      height: 100%;
    }
    .image-preview {
      width: 100%;
      height: 100%;
      position: absolute;
      left: 0px;
      top: 0px;
      border: 1px dashed #d9d9d9;
      .image-preview-wrapper {
        position: relative;
        width: 100%;
        height: 100%;
        img {
          width: 100%;
          height: 100%;
        }
      }
      .image-preview-action {
        position: absolute;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        cursor: default;
        text-align: center;
        color: #fff;
        opacity: 0;
        font-size: 20px;
        background-color: rgba(0, 0, 0, .5);
        transition: opacity .3s;
        cursor: pointer;
        text-align: center;
        line-height: 200px;
        .el-icon-delete {
          font-size: 36px;
        }
      }
      &:hover {
        .image-preview-action {
          opacity: 1;
        }
      }
    }
  }
</style>
