<template>
  <div class="login"
       style=" background-image: url('/assets/images/login-back.png');
        background-size: 100% 100%;
        height: 100%;  overflow-y:hidden;
        align-items: center;justify-content: center;
        display: flex;"
  >
    <div style="background: #ffffff; width: 57vw; height: 55vh;">
      <el-row style="height: 100%; width: 100%">
        <el-col :span="12"
                style="background-image: url('/assets/images/login-logo1.png'); background-size: 100% 100%; height: 100%"></el-col>
        <el-col :span="12" style="padding : 7% 5%;">
          <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form"
                   autocomplete="on"
                   label-position="left"
                   style="font-size: 1.5em; display: flex; flex-direction: column; "
          >
            <el-form-item prop="email">
              <el-input
                prefix-icon="el-icon-user"
                ref="email"
                v-model="loginForm.username"
                placeholder="姓名"
                name="username"
                type="text"
                tabindex="1"
                autocomplete="on"
              />
            </el-form-item>
            <el-tooltip v-model="capsTooltip" content="Caps lock is On" placement="right" manual>
              <el-form-item prop="password">
                <el-input
                  :key="passwordType"
                  prefix-icon="el-icon-lock"
                  ref="password"
                  show-password
                  v-model="loginForm.password"
                  :type="passwordType"
                  placeholder="密码"
                  name="password"
                  tabindex="2"
                  autocomplete="on"
                  @keyup.native="checkCapslock"
                  @blur="capsTooltip = false"
                  @keyup.enter.native="handleLogin"
                />
              </el-form-item>
            </el-tooltip>

            <el-button :loading="loading" type="primary" @click.native.prevent="handleLogin"
                       style="width: 100%; margin-top: 100px;">
              用 户 等 入
            </el-button>
            <div style="position: relative; margin-bottom: 0; height:50px; display: flex;
                        align-items: center;justify-content: center;
                        color: darkgrey;font-size: 14px;
                        ">
              <a style="padding:0 5px;">新用户注册</a>|<a style="padding:0 5px;">忘记密码？</a>
            </div>
          </el-form>
        </el-col>
      </el-row>
    </div>
    <!--    <el-card shadow="hover" class="login-card">-->

    <!--    </el-card>-->
  </div>
</template>

<script>
  // import { validUsername } from '@/utils/validate'

  export default {
    name: 'Login',
    data() {
      /** const validateUsername = (rule, value, callback) => {
      if (!validUsername(value)) {
        callback(new Error('Please enter the correct user name'))
      } else {
        callback()
      }
    }
       const validatePassword = (rule, value, callback) => {
      if (value.length < 5) {
        callback(new Error('The password can not be less than 5 digits'))
      } else {
        callback()
      }
    }*/
      return {
        loginForm: {
          username: 'admin',
          password: 'admin'
        },
        loginRules: {
          username: [{ required: true, type: 'username', trigger: 'blur' }],
          password: [{ required: true, trigger: 'blur' }]
        },
        passwordType: 'password',
        capsTooltip: false,
        loading: false,
        showDialog: false,
        redirect: undefined,
        otherQuery: {}
      }
    },
    watch: {
      $route: {
        handler: function(route) {
          const query = route.query
          if (query) {
            this.redirect = query.redirect
            this.otherQuery = this.getOtherQuery(query)
          }
        },
        immediate: true
      }
    },
    created() {
      // window.addEventListener('storage', this.afterQRScan)
    },
    mounted() {
      if (this.loginForm.email === '') {
        this.$refs.email.focus()
      } else if (this.loginForm.password === '') {
        this.$refs.password.focus()
      }
    },
    destroyed() {
      // window.removeEventListener('storage', this.afterQRScan)
    },
    methods: {
      checkCapslock(e) {
        const { key } = e
        this.capsTooltip = key && key.length === 1 && (key >= 'A' && key <= 'Z')
      },
      showPwd() {
        if (this.passwordType === 'password') {
          this.passwordType = ''
        } else {
          this.passwordType = 'password'
        }
        this.$nextTick(() => {
          this.$refs.password.focus()
        })
      },
      handleLogin() {
        this.$refs.loginForm.validate(valid => {
          if (valid) {
            this.loading = true
            this.$store.dispatch('user/login', this.loginForm)
              .then(() => {
                this.$router.push({ path: this.redirect || '/', query: this.otherQuery })
                this.loading = false
              })
              .catch(() => {
                this.loading = false
              })
          } else {
            console.log('error submit!!')
            return false
          }
        })
      },
      getOtherQuery(query) {
        return Object.keys(query).reduce((acc, cur) => {
          if (cur !== 'redirect') {
            acc[cur] = query[cur]
          }
          return acc
        }, {})
      }
      // afterQRScan() {
      //   if (e.key === 'x-admin-oauth-code') {
      //     const code = getQueryObject(e.newValue)
      //     const codeMap = {
      //       wechat: 'code',
      //       tencent: 'code'
      //     }
      //     const type = codeMap[this.auth_type]
      //     const codeName = code[type]
      //     if (codeName) {
      //       this.$store.dispatch('LoginByThirdparty', codeName).then(() => {
      //         this.$router.push({ path: this.redirect || '/' })
      //       })
      //     } else {
      //       alert('第三方登录失败')
      //     }
      //   }
      // }
    }
  }
</script>

<style lang="scss">
  .login .el-input .el-input__inner {
    padding-left: 35px;
  }

  .login .el-card {
    border-radius: 8px;
  }

  @media screen and (max-device-width: 1920px) {
    .login .el-card {
      width: 30%;
      margin: 12% auto;
    }
    .login .el-card .el-button {
      position: relative;
      left: 80%;
    }
  }

  @media screen and (max-device-width: 600px) {
    .login .el-card {
      width: 100%;
      height: 100%;
      margin: auto;
    }
    .login .el-card .el-button {
      position: relative;
      left: 35%;
    }
  }

  /* 修复input 背景不协调 和光标变色 */
  /* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

  /* reset element-ui css */
  .login-container {
    .el-input {
      display: inline-block;
      height: 47px;
      width: 85%;

      input {
        background: transparent;
        border: 0px;
        -webkit-appearance: none;
        border-radius: 0px;
        padding: 12px 5px 12px 15px;
        height: 47px;

        &:-webkit-autofill {
          box-shadow: 0 0 0px 1000px inset !important;
        }
      }
    }

    .el-form-item {
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 5px;
      color: #454545;
    }
  }
</style>

<style lang="scss" scoped>

  .login-container {
    min-height: 100%;
    width: 100%;
    overflow: hidden;

    .login-form {
      position: relative;
      width: 520px;
      max-width: 100%;
      padding: 160px 35px 0;
      margin: 0 auto;
      overflow: hidden;
    }

    .tips {
      font-size: 14px;
      color: #fff;
      margin-bottom: 10px;

      span {
        &:first-of-type {
          margin-right: 16px;
        }
      }
    }

    .svg-container {
      padding: 6px 5px 6px 15px;
      vertical-align: middle;
      width: 30px;
      display: inline-block;
    }

    .title-container {
      position: relative;

      .title {
        font-size: 26px;
        margin: 0px auto 40px auto;
        text-align: center;
        font-weight: bold;
        color: #DCDFE6;
      }
    }

    .show-pwd {
      position: absolute;
      right: 10px;
      top: 7px;
      font-size: 16px;
      cursor: pointer;
      user-select: none;
    }

    .thirdparty-button {
      position: absolute;
      right: 0;
      bottom: 6px;
    }

    @media only screen and (max-width: 470px) {
      .thirdparty-button {
        display: none;
      }
    }
  }
</style>
