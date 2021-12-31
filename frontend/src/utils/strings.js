import Const from "./const";

export const PLEASE_INPUT = str => `请输入${str}`;
export const PLEASE_SELECT = str => `请选择${str}`;
export const MUST_INPUT = str => `${str}必须填写`;

const Strings = {
  PLEASE_INPUT,
  PLEASE_SELECT,
  MUST_INPUT,

  JIGOU : {
    KAIFA: '开发建设单位',
    FUWU : '物业服务企业',
    YEZHU : '业主委员会',
    // [Const.JIGOU.SHENJIE]: '审价单位',
    // [Const.JIGOU.SHIGONG] : '施工单位',
    // [Const.JIGOU.GONGYOU] : '公有售房单位',
  },
  LOUDONG_JZJG : {
    GANGHUN: '钢混',
    HUNHE: '混合',
    KUANGJIA: '框架',
    KUANGJIAN: '框剪',
    MUJIEGOU: '木结构',
    QITA: '其他',
  },
  FANGWU_YONGTU: {
    ZHUZHAI: '住宅',
    SHANGYE : '商业',
    BANGONG : '办公',
    CHEKU   : '车库',
    CHEWEI  : '车位',
  },
  FANGWU_LEIXING: {
    ZHUZHAI_YOUDIANTI         : '住宅_有电梯',
    ZHUZHAI_WUDIANTI          :'住宅_无电梯',
    SHANGWUYONGFANG_YOUDIANTI :'商业用房_有电梯',
    SHANGWUYONGFANG_WUDIANTI  :'商业用房_无电梯',
    BANGONGYONGFANG_YOUDIANTI :'办公用房_有电梯',
    BANGONGYONGFANG_WUDIANTI  :'办公用房_无电梯',
    GONGYEYONGFANG_YOUDIANTI  :'工业用房_有电梯',
    GONGYEYONGFANG_WUDIANTI   :'工业用房_无电梯',
    CANGCHUYONGFANG_YOUDIANTI :'仓储用房_有电梯',
    CANGCHUYONGFANG_WUDIANTI  :'仓储用房_无电梯',
    CHEKU_YOUDIANTI           :'车库_有电梯',
    CHEKU_WUDIANTI            :'车库_无电梯',
    QITA_YOUDIANTI            :'其他_有电梯',
    QITA_WUDIANTI             :'其他_无电梯',
    YISHOUGONGFANG_YOUDIANTI  :'已售公房_有电梯',
    YISHOUGONGFANG_WUDIANTI   :'已售公房_无电梯',
  },
  TUIKUAN_YUANYIN : {
    TUIKUAN: '退款',
  },

  // A
  BZ: '备注',
  BGYY: '变更原因',

  DQSFZ: '读取身份证',

  FWDZ: '房屋地址',

  JSDW: '开发建设单位',
  JSDWSHXYDM: '开发建设单位代码',
  JZMJ: '建筑面积',

  SJHM: '手机号码',

  WYQY: '物业区域',
  WYQYDM: '物业区域代码',
  WYQYDZ: '物业区域地址',
  WYQYMC: '物业区域名称',

  XZQY: '行政区域',
  XZQHDM: '行政区域代码',

  YX: '邮箱',
  YZXM: '业主姓名',

  ZJLX: '证件类型',
  ZJHM: '证件号码',


  // english
  SEARCH: '查询',
  IMPORT: '导入',
  SAVE: '保存',
  SELECT: '选择',
  ADD: '添加',
  DELETE: '删除',
  UPLOAD: '上传',
  CLEAR: '清除'
}
export default Strings;

// export const
