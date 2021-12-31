<?php
// +----------------------------------------------------------------------
// | Catch-CMS Design On 2020
// +----------------------------------------------------------------------
// | CatchAdmin [Just Like ～ ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017~2020 http://catchadmin.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( https://github.com/yanwenwu/catch-admin/blob/master/LICENSE.txt )
// +----------------------------------------------------------------------
// | Author: JaguarJack [ njphper@gmail.com ]
// +----------------------------------------------------------------------

namespace catchAdmin\basic\model\scope;

use catchAdmin\basic\model\Louzhuang;
use catchAdmin\basic\model\Wuyequyu;
use think\facade\Db;

trait WuyequyuNameScope
{
    public function scopeWuyequyuName($query)
    {
        return $query->addSelectSub(function () {
            return Db::name('zz_b_louzhuang')
                ->whereColumn('zz_b_louzhuang.id', $this->aliasField('LZDM'))
                ->leftJoin('zz_b_wuyequyu', 'zz_b_wuyequyu.id=zz_b_louzhuang.WYQYDM')
                ->field('zz_b_wuyequyu.WYQYMC');

        }, 'WYQYMC');
    }
}
