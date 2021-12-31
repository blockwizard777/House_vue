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
use catchAdmin\basic\model\scope\WuyequyuNameScope;
class Fenhu extends CatchModel
{
    use WuyequyuNameScope;
    protected $name = 'zz_b_fenhu';

    protected $field = [
        'id'            ,//
        'FHDM'      ,//  '分户代码',
        'LZDM'      ,//  '楼幢代码',
        'DYMC'      ,//  '单元名称',
        'MYC'       ,//  '名义层',
        'SJC'       ,//  '实际层',
        'SH'        ,//  '室号',
        'XYDZ'      ,//  '详细地址',
        'JZMJ'      ,//  '建筑面积（平方米）',
        'GTMJ'      ,//  '公摊面积（平方米）',
        'TNMJ'      ,//  '套内面积（平方米）',
        'FWLX'      ,//  '房屋类型',
        'FWJG'      ,//  '房屋结构',
        'FWYT'      ,//  '房屋用途',
        'GFJE'      ,//  '购房金额（元）',
        'WXZJYJK'   ,//  '维修资金应交款（元）',
        'FHZH'      ,//  '分户账户',
        'BZ'        ,// '备注',

        'GFDW'      ,// '公房单位 -C',  Temperary Fix
        'YZXM'      ,// '业主姓名 -C',
        'ZJHM'      ,// '证件号码 -C',
        'SJHM'      ,// '手机号码 -C',

        'creator_id', // 创建人ID
        'created_at', // 创建时间
        'updated_at', // 更新时间
        'deleted_at', // 删除时间
    ];

    public function searchLzmcAttr($query, $value, $data)
    {
        return $query->whereLike('LZMC', $value);
    }

    public function searchZjhmAttr($query, $value, $data)
    {
        return $query->whereLike('ZJHM', $value);
    }
    public function searchYzxmAttr($query, $value, $data)
    {
        return $query->whereLike('YZXM', $value);
    }
    public function searchXydzAttr($query, $value, $data)
    {
        return $query->whereLike('XYDZ', $value);
    }

    public function getList()
    {
        return $this->catchSearch()
            ->field([$this->aliasField('*')])
            ->catchJoin(Louzhuang::class, 'id', 'LZDM', ['LZMC', 'WYQYDM'])
            ->wuyequyuName()
            ->paginate();
    }

}
