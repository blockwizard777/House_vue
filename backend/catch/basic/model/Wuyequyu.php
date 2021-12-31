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

use catchAdmin\basic\model\Xingzhengquyu;
use catcher\base\CatchModel;

class Wuyequyu extends CatchModel
{
    protected $name = 'zz_b_wuyequyu';

    protected $field = [
        'id',//
        'WYQYDM',//'物业区域代码',
        'WYQYMC',//'物业区域名称',
        'JSDWSHXYDM',//'建设单位统一社会信用代码',
        'XXDZ',//'详细地址',
        'XZQHDM',//'行政区划代码',
        'ZGHDG',//'自管或代管',
        'WYQYZHZH',//'物业区域账户账号',
        'WYQYGGHZH',//'物业区域公共户账号',
        'WYQYSYZH',//'物业区域收益账号',
        'BZ',//'备注',
        'creator_id', // 创建人ID
        'created_at', // 创建时间
        'updated_at', // 更新时间
        'deleted_at', // 删除时间
    ];

    public function searchWyqymcAttr($query, $value, $data)
    {
        return $query->whereLike('WYQYMC', $value);
    }

    public function getList()
    {
        return $this
            ->catchSearch()
            ->field([$this->aliasField('*')])
            ->catchJoin(Xingzhengquyu::class, 'id', 'XZQHDM', ['name as city'])
            ->select()
            ->paginate();
    }
    public function getAll() {
        return $this
            ->catchSearch()
            ->field([$this->aliasField('*')])
            ->catchJoin(Xingzhengquyu::class, 'id', 'XZQHDM', ['name as city'])
            ->select();
    }
}
