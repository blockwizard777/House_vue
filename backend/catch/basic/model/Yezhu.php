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

class Yezhu extends CatchModel
{
    protected $name = 'zz_b_yezhu';

    protected $field = [
        'id'            ,//
        'ZJHM'  ,       //   '证件号码',
        'ZJLX'  ,       //   '证件类型',
        'YZMC'  ,       //   '业主名称',
        'LXDH'  ,       //   '联系电话（固定电话）',
        'SJHM'  ,       //   '手机号码',
        'BZ'    ,       //   '备注',
        'creator_id',   //      创建人ID
        'created_at',   //  创建时间
        'updated_at',   //  更新时间
        'deleted_at',   //  删除时间
    ];

    public function searchZjhmAttr($query, $value, $data)
    {
        return $query->whereLike('ZJHM', $value);
    }
    public function searchYzmcAttr($query, $value, $data)
    {
        return $query->whereLike('YZMC', $value);
    }
}
