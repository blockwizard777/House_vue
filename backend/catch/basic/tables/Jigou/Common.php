<?php
namespace catchAdmin\basic\tables\Jigou;

use catchAdmin\basic\tables\forms\Factory;
use catcher\CatchTable;
use catcher\library\table\Actions;
use catcher\library\table\HeaderItem;
use catcher\library\table\Search;

class Common extends CatchTable
{
    protected function form()
    {
        // TODO: Implement form() method.
        return Factory::create('jigou\\Beian');
//        return [];
    }

    protected function table()
    {
        // TODO: Implement table() method.
        return $this->getTable('jigou')
            ->header([
                HeaderItem::label()->selection(),
//                        HeaderItem::label('编号')->prop('id'),
                HeaderItem::label('信用代码')->prop('SHXYDM'),
                HeaderItem::label('机构名称')->prop('JGMC'),
            ])
            ->withActions([
                Actions::create(),
                Actions::update(),
            ])
            ->withDialogWidth('100%')
            ->withApiRoute('jigou/beian')
            ->render();
    }
}
