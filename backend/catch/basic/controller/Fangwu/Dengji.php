<?php

namespace catchAdmin\basic\controller\fangwu;

use catcher\base\CatchController;
use catcher\base\CatchRequest;
use catcher\CatchResponse;
use think\Request;
use catchAdmin\basic\controller\Common;
use catchAdmin\basic\model\Wuyequyu as mdlWuyequyu;
use catchAdmin\basic\model\Xingzhengquyu as mdlXingzhengquyu;
use catchAdmin\basic\model\Louzhuang as mdlLouzhuang;
use catchAdmin\basic\model\Fenhu as mdlFenhu;
use catchAdmin\basic\model\Yezhu as mdlYezhu;

class Dengji extends CatchController
{
//    protected $beian;

    public function __construct()
    {
//        $this->beian = $model;
    }


    /**
     * 列表
     *
     * @time 2020年06月17日
     * @return \think\response\Json
     */
    public function getFangwuSearch(mdlFenhu $fenhuModel)
    {
        return CatchResponse::paginate($fenhuModel->getList());
    }

    /**
     * 保存
     *
     * @time 2020年06月17日
     * @param CreateRequest $request
     * @return \think\response\Json
     */
    public function save(CreateRequest $request)
    {
        return CatchResponse::success($this->beian->storeBy($request->param()));
    }

    /**
     * 更新
     *
     * @time 2020年06月17日
     * @param $id
     * @param UpdateRequest $request
     * @return \think\response\Json
     */
    public function update($id, UpdateRequest $request)
    {
        return CatchResponse::success($this->beian->updateBy($id, $request->param()));

    }


}
