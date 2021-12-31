<template>
    <div style="padding: 0px;" class="wuyeSearch">
      <el-row>
        <CmButton :type="cont_type == 1 ? 'primary' : ''" @click="changeContType(1)">物业区域查息</CmButton>
        <CmButton :type="cont_type == 2 ? 'primary' : ''" @click="changeContType(2)">房屋信息</CmButton>
        <CmButton :type="cont_type == 3 ? 'primary' : ''" @click="changeContType(3)">xxxxxx</CmButton>
      </el-row>
      <el-divider style="margin: 15px 0px;"/>
      <el-row v-if="cont_type==1">
        <el-form>
          <el-row :getter="24">
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="sdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="房屋性质" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :getter="24">
            <el-col :span="24">
              <el-form-item class="zz-linespcae-exact-5" label="qqqq" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :getter="24">
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="sdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="房屋性质" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :getter="24">
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="sdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="房屋性质" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row v-if="cont_1_row" :getter="24">
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="sdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="房屋性质" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row v-if="cont_1_row" :getter="24">
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="asdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="sdf" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item class="zz-linespcae-exact-5" label="房屋性质" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :getter="24">
            <el-col :span="24">
              <el-form-item class="zz-linespcae-exact-5" label="qqqq" :label-width="formLabelWidth">
                <el-input placeholder=""/>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row style="display: flex;margin-top: 20px;">
            <CmButton style="margin-left: auto;" class="el-icon-check" type="primary">保存</CmButton>
            <CmButton type="primary" class="el-icon-printer">房屋信息</CmButton>
            <CmButton @click="showContRow" type="primary" class="el-icon-search">xxxxxx</CmButton>
            <CmButton @click="cancelContRow" type="primary" class="el-icon-search">xxxxxx</CmButton>
          </el-row>
        </el-form>
      </el-row>
      <el-row v-else-if="cont_type==2" style="">
        <div style="height : 50vh;" class="fenhu-list">
          <el-row style="width: 100%; height: 90%; ">
            <el-col :span="5" style="height: 100%; ">
              <div style="display: flex; justify-content: center; margin-top: 10px;">
                <el-button style="width: 100px;" :type="cont_2_type==0? 'primary' : ''" @click="setType(0)">楼盘表</el-button>
                <el-button style="width: 100px;" :type="cont_2_type==1? 'primary' : ''" @click="setType(1)">列表</el-button>
              </div>
              <el-divider/>
              <el-tree
                :data="tree.data"
                :props="tree.props"
                node-key="idx"
                default-expand-all
                highlight-current
                :expand-on-click-node="false"
                @node-click="onTreeNodeClick"
              />
            </el-col>
            <el-col :span="19" style="height: 100%; overflow-y: scroll">
              <div class="luopan" v-if="cont_2_type==0" style="height: 75%;">
                <table class="table table-bordered" style="width: 100%;">
                  <thead>
                  <tr>
                    <th>图裂</th>
                    <th colspan="10" style="text-align: left; padding-left: 20px;">
                      <div class="inline-block mr-5">
                        <div class="inline-block mr-1"
                             style="background-color : #fb89c4; border : 1px solid gray; width : 20px; height : 20px;    vertical-align: bottom;">
                        </div>
                        未交款
                      </div>
                      <div class="inline-block mr-5">
                        <div class="inline-block mr-1"
                             style="background-color : #bbfff8; border : 1px solid gray; width : 20px; height : 20px;    vertical-align: bottom;"></div>
                        已交款
                      </div>
                      <div class="inline-block mr-5">
                        <div class="inline-block mr-1"
                             style="background-color : red; border : 1px solid gray; width : 20px; height : 20px;    vertical-align: bottom;"></div>
                        余额不足30%
                      </div>
                    </th>
                  </tr>
                  <tr>
                    <th>楼层</th>
                    <th colspan="2">0单元</th>
                    <th colspan="2">1单元</th>
                    <th colspan="2">2单元</th>
                    <th colspan="2">3单元</th>
                    <th colspan="2">4单元</th>
                  </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="vertical-middle" rowspan="3">7楼</td>
                      <td class="link-type status-not-enough" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                    </tr>

                    <tr>
                      <td class="vertical-middle" rowspan="3">7楼</td>
                      <td class="link-type status-not-enough" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                      <td class="link-type status-normal" @dblclick="onDblClick">
                        <div class="inline-block border-right-1 pr-2">706</div>
                        <div class="inline-block vertical-middle">
                          <div class="text-sm">12.3元</div>
                          <div class="text-sm">123.3m</div>
                        </div>
                      </td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="liebaio" v-else-if="cont_2_type==1" style="height: 75%;" >
                <div class="row">
                  <div class="col-md-12">
                    <div class="inline-block mr-5" style="margin: 0 20px;">
                      图列
                    </div>
                    <div class="inline-block mr-5">
                      <div class="inline-block mr-1"
                           style="background-color : #fb89c4; border : 1px solid gray; width : 20px; height : 20px;    vertical-align: bottom;"></div>
                      未交款
                    </div>
                    <div class="inline-block mr-5">
                      <div class="inline-block mr-1"
                           style="background-color : #bbfff8; border : 1px solid gray; width : 20px; height : 20px;    vertical-align: bottom;"></div>
                      已交款
                    </div>
                    <div class="inline-block mr-5">
                      <div class="inline-block mr-1"
                           style="background-color : red; border : 1px solid gray; width : 20px; height : 20px;    vertical-align: bottom;"></div>
                      余额不足30%
                    </div>
                  </div>
                </div>
                <div class="row">
                  <table class="table table-bordered" style="width: 100%;">
                    <thead>
                    <tr>
                      <th colspan="3">单元名称</th>
                      <th>楼层</th>
                      <th>室号</th>
                      <th>房屋地址</th>
                      <th>建筑面积</th>
                      <th>房屋用途</th>
                      <th>计算规则</th>
                      <th>应交金额</th>
                      <th>已交金额</th>
                      <th>利息</th>
                      <th>余额</th>
                      <th>业主姓名</th>
                      <th>证件号码</th>
                    </tr>
                    </thead>
                    <tbody v-for="(item,index) in table">
                    <tr>
                      <td style="height: 30px;">{{index + 1}}</td>
                      <td><button @click="onTableExpand(index)">{{item.open?'-':'+'}}</button></td>
                      <td>{{item.dymc}}</td>
                      <td>{{item.lc}}</td>
                      <td>{{item.sh}}</td>
                      <td><span class="link-type" @dblclick="onDblClick">{{item.fwdz}}</span></td>
                      <td>{{item.jzmj}}</td>
                      <td>{{item.fwyt}}</td>
                      <td>{{item.jsgz}}</td>
                      <td>{{item.yjje}}</td>
                      <td>{{item.yijje}}</td>
                      <td>{{item.lx}}</td>
                      <td>{{item.ye}}</td>
                      <td>{{item.yzxm}}</td>
                      <td>{{item.zjhm}}</td>
                    </tr>
                    <tr v-if="item.open">
                      <td colspan="2"></td>
                      <td colspan="13" style="padding:0">
                        <table class="table mb-0" style="width: 100%;">
                          <tbody>
                          <tr>
                            <td class="zz-thead" style="height: 26px;"></td>
                            <td class="zz-thead">业主姓名</td>
                            <td class="zz-thead" >证件类型</td>
                            <td class="zz-thead" >证件号</td>
                            <td class="zz-thead" >手机</td>
                            <td class="zz-thead" >QQ号</td>
                            <td class="zz-thead" >邮箱</td>
                          </tr>
                          <tr>
                            <td style="height: 26px;">1</td>
                            <td>{{item.subData.yzxm}}</td>
                            <td>{{item.subData.zjlx}}</td>
                            <td><span class="link-type" @dblclick="onDblClickZhanghu">{{item.subData.zjh}}</span></td>
                            <td>{{item.subData.sj}}</td>
                            <td>{{item.subData.qq}}</td>
                            <td>{{item.subData.yx}}</td>
                          </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <el-row>
                <div style="display: flex;border: 1px solid #2c3e50;">
                  <el-form style="display: flex;">
                    <el-form-item style="margin-bottom: 0px" label="房屋性质:" :label-width="formLabelWidth">
                      <span>62户</span>
                    </el-form-item>
                    <el-form-item style="margin-bottom: 0px" label="房屋性质:" :label-width="formLabelWidth">
                      <span>62户</span>
                    </el-form-item>
                    <el-form-item style="margin-bottom: 0px" label="房屋性质:" :label-width="formLabelWidth">
                      <span>0户</span>
                    </el-form-item>
                    <el-form-item style="margin-bottom: 0px" label="房屋性质:" :label-width="formLabelWidth">
                      <span>0户</span>
                    </el-form-item>
                    <el-form-item style="margin-bottom: 0px" label="房屋性质:" :label-width="formLabelWidth">
                      <span>888888.88元</span>
                    </el-form-item>
                  </el-form>
                </div>
                <div style="margin-top: 10px;display: block;">
                  <CmButton icon="el-icon-mobile">房屋信息变更</CmButton>
                  <CmButton icon="el-icon-mobile">房屋分割合并</CmButton>
                  <CmButton icon="el-icon-mobile">房屋产权登记</CmButton>
                  <CmButton icon="el-icon-printer">打印交款单</CmButton>
                  <CmButton icon="el-icon-printer">打印已交</CmButton>
                  <CmButton icon="el-icon-printer">打印未交</CmButton>
                  <CmButton icon="el-icon-printer">打印不足30%</CmButton>
                  <CmButton icon="el-icon-search">查看房屋账户信息</CmButton>
                </div>
              </el-row>
            </el-col>
          </el-row>
          <el-divider/>
          <el-button type="primary" class="fr" icon="el-icon-check" style="margin-right: 20px;" @click="">确定</el-button>
          <div class="sub-dialog-wrapper">
          </div>
        </div>
      </el-row>
      <el-row v-else="cont_type==3" style="width: 100%;">
        <table style="margin-top: 15px;width: 100%;">
          <thead>
          <tr>
            <th style="width:5%; height:33px"></th>
            <th style="width:15%">楼栋名称</th>
            <th style="width:15%">单元</th>
            <th style="width:10%">楼层</th>
            <th style="width:10%">室号</th>
            <th style="width:15%">房屋地址</th>
            <th style="width:10%">个人本金（元）</th>
            <th style="width:10%">个人利息（元）</th>
            <th style="width:10%">个人积数</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td style="height:33px"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height:33px"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height:33px"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          <tr>
            <td style="height:33px"></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
            <td style=""></td>
          </tr>
          </tbody>
        </table>
      </el-row>
    </div>
</template>

<script>
  import CmButton from '../../../../components/Shmf/Common/Button'
  export default {
    components: { CmButton, },
    name: 'DlgSearch',
    data() {
      return {
        formLabelWidth: '100px',
        cont_type: 1,
        cont_1_row: false,
        cont_2_type: 0,
        tree: {
          data: [
            {
              idx: 0,
              label: 'xxxx小区',
              children: [
                { idx: 7, label: '得插' },
                { idx: 1, label: 'xxxx路 yyy号' },
                { idx: 2, label: 'xxxx路 yyy号' },
                { idx: 3, label: 'xxxx路 yyy号' },
                { idx: 4, label: 'xxxx路 yyy号' },
                { idx: 5, label: 'xxxx路 yyy号' },
                { idx: 6, label: 'xxxx路 yyy号' }
              ]
            }
          ],
          props: {
            label: 'label'
          }
        },
        table: [
          {
            open: false,
            dymc: 1,
            lc: 7,
            sh: 6,
            fwdz: 'xxx路 1212栋xxxx号',
            jzmj: 123,
            fwyt: '商业',
            jsgz: '',
            yjje: 6363,
            yijje: 6363,
            lx: 12.3,
            ye: 50.3,
            yzxm: '张小三',
            zjhm: '123123123',
            subData: {
              yzxm: '张小三',
              zjlx: '身份证',
              zjh: '123123123',
              sj: '123456',
              qq: '123234',
              yx: '456234'
            }

          },
          {
            open: false,
            dymc: 1,
            lc: 7,
            sh: 6,
            fwdz: 'xxx路 1212栋xxxx号',
            jzmj: 123,
            fwyt: '商业',
            jsgz: '',
            yjje: 6363,
            yijje: 6363,
            lx: 12.3,
            ye: 50.3,
            yzxm: '张小三',
            zjhm: '123123123',
            subData: {
              yzxm: '张小三',
              zjlx: '身份证',
              zjh: '123123123',
              sj: '123456',
              qq: '123234',
              yx: '456234'
            }

          },
          {
            open: false,
            dymc: 1,
            lc: 7,
            sh: 6,
            fwdz: 'xxx路 1212栋xxxx号',
            jzmj: 123,
            fwyt: '商业',
            jsgz: '',
            yjje: 6363,
            yijje: 6363,
            lx: 12.3,
            ye: 50.3,
            yzxm: '张小三',
            zjhm: '123123123',
            subData: {
              yzxm: '张小三',
              zjlx: '身份证',
              zjh: '123123123',
              sj: '123456',
              qq: '123234',
              yx: '456234'
            }

          },
          {
            open: false,
            dymc: 1,
            lc: 7,
            sh: 6,
            fwdz: 'xxx路 1212栋xxxx号',
            jzmj: 123,
            fwyt: '商业',
            jsgz: '',
            yjje: 6363,
            yijje: 6363,
            lx: 12.3,
            ye: 50.3,
            yzxm: '张小三',
            zjhm: '123123123',
            subData: {
              yzxm: '张小三',
              zjlx: '身份证',
              zjh: '123123123',
              sj: '123456',
              qq: '123234',
              yx: '456234'
            }

          },
          {
            open: false,
            dymc: 1,
            lc: 7,
            sh: 6,
            fwdz: 'xxx路 1212栋xxxx号',
            jzmj: 123,
            fwyt: '商业',
            jsgz: '',
            yjje: 6363,
            yijje: 6363,
            lx: 12.3,
            ye: 50.3,
            yzxm: '张小三',
            zjhm: '123123123',
            subData: {
              yzxm: '张小三',
              zjlx: '身份证',
              zjh: '123123123',
              sj: '123456',
              qq: '123234',
              yx: '456234'
            }

          },
        ],
      }
    },
    methods: {
      changeContType(type) {
        this.cont_type = type;
      },
      showContRow() {
        this.cont_1_row = true;
      },
      cancelContRow() {
        this.cont_1_row = false;
      },
      setType(type) {
        this.cont_2_type = type
      },
      onTableExpand(idx) {
        this.table[idx].open = !this.table[idx].open
      },
      onTreeNodeClick() {
      },
      onDblClick() {
        console.log('dblclick');
        this.dialog.show = true;
        this.dialog.type = 0;
        this.dialog.title = '房屋信息';
      },
      onDblClickZhanghu() {
        this.dialog.show = true;
        this.dialog.type = 1;
        this.dialog.title = '账户信息';
      },
      onOk() {
        this.onClose && this.onClose(false);
      }

    }
  }
</script>

<style scoped>

</style>
