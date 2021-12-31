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

class Louzhuang extends CatchModel
{
    protected $name = 'zz_b_louzhuang';

    protected $field = [
    'id'            ,//
        'LZDM'      ,//  '楼幢代码',
        'LZMC'      ,//  '楼幢名称',
        'JZMJ'      ,//  '建筑面积',
        'WYQYDM'    ,//  '物业区域代码',
        'JCND'      ,//  '建筑年代',
        'ZLC'       ,//  '总楼层',
        'JZJG'      ,//     '建筑结构 - c'
        'LZGGHZH'   ,//  '楼幢公共户账号',
        'LZSYZH'    ,//  '楼幢收益账号',
        'BZ'        ,//  '备注',
        'creator_id', // 创建人ID
        'created_at', // 创建时间
        'updated_at', // 更新时间
        'deleted_at', // 删除时间
    ];

    public function searchLzmcAttr($query, $value, $data)
    {
        return $query->whereLike('LZMC', $value);
    }
}
