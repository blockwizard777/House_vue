<?php
// +----------------------------------------------------------------------
// | CatchAdmin [Just Like ～ ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017~{$year} http://catchadmin.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( https://github.com/yanwenwu/catch-admin/blob/master/LICENSE.txt )
// +----------------------------------------------------------------------
// | Author: JaguarJack [ njphper@gmail.com ]
// +----------------------------------------------------------------------

// you should use `$router`
/* @var think\Route $router */

// $router->group(function () use ($router){

    $router->resource('/xingzhengquyu', '\catchAdmin\basic\controller\Xingzhengquyu');
    $router->resource(   '/wuyequyu', '\catchAdmin\basic\controller\Wuyequyu');

    $router->get(   '/wuyequyu_all', '\catchAdmin\basic\controller\Wuyequyu@getAll');
    $router->post(  'fangwu_caiji/import',  '\catchAdmin\basic\controller\fangwu\Caiji@import');
    $router->post(  'fangwu_buchong',       '\catchAdmin\basic\controller\fangwu\Caiji@buchong');
    $router->get(   'dengji/fenhusearch',   '\catchAdmin\basic\controller\fangwu\Dengji@getFangwuSearch');

    $router->resource('jigou/beian', '\catchAdmin\basic\controller\Jigou\Beian');

    $router->get('jigou/export', '\catchAdmin\basic\controller\Jigou\Beian@export');
    $router->get('jigou/types', '\catchAdmin\basic\controller\Jigou\Jigou@list');

    $router->get('table/<module>/<tableClass>', function ($module, $tableClass){
        $table = sprintf('\\catchAdmin\\%s\\tables\\%s', $module, ucfirst($tableClass));
        return (new $table)->render(request()->param('only'));
    });
    $router->get('table/<module>/<submodule>/<tableClass>', function ($module, $submodule, $tableClass){
        $table = sprintf('\\catchAdmin\\%s\\tables\\%s\\%s', $module, ucfirst($submodule), ucfirst($tableClass));
        return (new $table)->render(request()->param('only'));
    });

// })->middleware('auth');



