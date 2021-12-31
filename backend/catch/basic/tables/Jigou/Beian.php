<?php
namespace catchAdmin\basic\tables\Jigou;

use catchAdmin\basic\tables\forms\Factory;
use catcher\CatchTable;
use catcher\library\table\Actions;
use catcher\library\table\HeaderItem;
use catcher\library\table\Search;

class Beian extends CatchTable
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
                        HeaderItem::label('机构代码')->prop('SHXYDM'),
                        HeaderItem::label('机构名称')->prop('JGMC'),
                        HeaderItem::label('联系人')->prop('LXR'),
                        HeaderItem::label('联系人电话')->prop('LXRDH'),
                        HeaderItem::label('电子邮箱')->prop('DZYX'),
                        HeaderItem::label('传真')->prop('CZ'),
                        HeaderItem::label('邮编')->prop('YX'),
                        HeaderItem::label('操作')->width(260)->actions([
                            Actions::update(),
                        ])
                    ])
                    ->withActions([
                        Actions::create(),
                        Actions::update(),
                    ])
                    ->withDialogWidth('100%')
                    ->withApiRoute('jigou/beian')
                    ->withExportRoute('jigou/export')
                    // ->withSearch([
                    //     Search::text('word', '输入敏感词')
                    // ])
//                    ->selectionChange()
                    ->render();
    }
}
