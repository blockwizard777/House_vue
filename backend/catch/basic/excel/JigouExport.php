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
namespace catchAdmin\basic\excel;

use catchAdmin\basic\model\Jigou;
use catcher\library\excel\ExcelContract;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use catchAdmin\basic\controller\jigou\Jigou as JigouCtrl;

class JigouExport implements ExcelContract
{

    /**
     * 设置头部
     *
     * @time 2020年09月08日
     * @return string[]
     */
    public function headers(): array
    {
        // TODO: Implement headers() method.
        return ['机构类型', '信用代码', '机构名称', '邮箱'];
    }

    /**
     * 处理数据
     *
     * @time 2020年09月08日
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @return \think\Collection
     */
    public function sheets()
    {
        // TODO: Implement sheets() method.
        $jigou = Jigou::field(['type', 'SHXYDM', 'JGMC', 'DZYX'])->select();

        foreach ($jigou as &$item) {
//            $key = array_search($item->type, JigouCtrl::TYEPS);
            $item->type = isset(JigouCtrl::TYEP_NAMES[$item->type]) ? JigouCtrl::TYEP_NAMES[$item->type] : '未定';
        }

        return $jigou;
    }

    /**
     * 设置开始行
     *
     * @time 2020年09月08日
     * @return int
     */
    public function setRow()
    {
        return 2;
    }

    /**
     * 设置标题
     *
     * @time 2020年09月08日
     * @return array
     */
    public function setTitle()
    {
        return [
            'A1:G1', '导出机构', Alignment::HORIZONTAL_CENTER
        ];
    }
}
