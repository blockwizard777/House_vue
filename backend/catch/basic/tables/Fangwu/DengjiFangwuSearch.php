<?php
namespace catchAdmin\basic\tables\Fangwu;

use catchAdmin\basic\tables\forms\Factory;
use catcher\CatchTable;
use catcher\library\table\Actions;
use catcher\library\table\HeaderItem;
use catcher\library\table\Search;

class DengjiFangwuSearch extends CatchTable
{
    protected function form()
    {
        // TODO: Implement form() method.
//        return Factory::create('jigou\\Beian');
        return [];
    }

    protected function table()
    {
        // TODO: Implement table() method.
        return $this->getTable('jigou')
            ->header([
                HeaderItem::label('业主姓名')->prop('YZXM'),
                HeaderItem::label('房屋地址')->prop('XYDZ'),
                HeaderItem::label('物业区域名称')->prop('WYQYMC'),
                HeaderItem::label('楼栋名称')->prop('LZMC'),
                HeaderItem::label('建筑面积')->prop('JZMJ')->width(60),
                HeaderItem::label('单元')->prop('DYMC')->width(60),
                HeaderItem::label('层号')->prop('SJC')->width(60),
                HeaderItem::label('室号')->prop('SH')->width(60),

            ])
            ->withDialogWidth('100%')
            ->withApiRoute('dengji/fenhusearch')
            ->render();
    }
}
