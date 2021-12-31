<?php
// +----------------------------------------------------------------------
// | CatchAdmin [Just Like ～ ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017~2020 http://catchadmin.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( https://github.com/yanwenwu/catch-admin/blob/master/LICENSE.txt )
// +----------------------------------------------------------------------
// | Author: JaguarJack [ njphper@gmail.com ]
// +----------------------------------------------------------------------

namespace catchAdmin\basic\model;

use catcher\base\CatchModel;

class Jigou extends CatchModel
{
    protected $name = 'zz_b_jigou';

    protected $field = [
        'id',//
        'type',//
        'password',
        'SHXYDM',//   '统一社会信用代码',
        'JGMC',//   '机构名称',
        'XYDMYXQ',//   '社会信用代码有效期',
        'BGDH',//   '办公电话',
        'FDDBR',//   '法定代表人',
        'FDDBRZZZCH',//     法定代表人执照注册号,
        'FDDBRDH',//     法定代表人手机号
        'LXR',//   '联系人',
        'LXRDH',//       '联系人电话',
        'LXRQQ', //    '联系人QQ'
        'YB',//   '邮编',
        'DZ',//   '地址',
        'DZYX',//   '电子邮箱',
        'CZ',//   '传真',
        'BZ',//   '备注',
        'XZQHDM',//   '行政区划代码',
        'WYQYDM',//   '物业区域代码',
        'ZRXM',//   '主任姓名',
        'ZRDH',//   '主任电话',
        'ZRZJLX',//      '主任证件类型',
        'ZRZJHM',//    '主任证件号码',
        'FZRXM',//   '副主任姓名',
        'FZRDH',//   '副主任电话',
        'FZRZJLX',//   '副主任证件类型',
        'FZRZJHM',//    '副主任证件号码',
        'YZWYHZH',//   '业主委员会账号',
        'RQ',//   '任期',
        'ZZZSBH',//   '资质证书编号',
        'ZZDJ',//   '资质等级',
        'ZZYXQ',//   '资质有效期',
        'JGJJ',//   '机构简介',
        'KHXMC',//   '开户行名称',
        'SKZHMC',//   '收款账户名称',
        'SKZHZH',//   '收款账户账号',
        'CLSJ',// '成立时间',
        'DJSJ',//   '到届时间',
        'creator_id', // 创建人ID
        'created_at', // 创建时间
        'updated_at', // 更新时间
        'deleted_at', // 删除时间
    ];

    public function searchTypeAttr($query, $value, $data)
    {
        return $query->where('type', $value);
    }

    public function searchJgmcAttr($query, $value, $data)
    {
        return $query->whereLike('JGMC', $value);
    }

    public function searchShxydmAttr($query, $value, $data)
    {
        return $query->whereLike('SHXYDM', $value);
    }
}
