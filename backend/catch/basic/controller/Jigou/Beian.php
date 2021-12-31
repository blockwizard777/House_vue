<?php
namespace catchAdmin\basic\controller\jigou;

use catchAdmin\basic\excel\JigouExport;
use catcher\base\CatchController;
use catchAdmin\basic\model\Jigou as Model;
use catcher\base\CatchRequest;
use catcher\CatchResponse;
use catcher\library\excel\Excel;
use catcher\Utils;
use think\Request as Request;

class Beian extends CatchController
{
    protected $beian;

    public function __construct(Model $model)
    {
        $this->beian = $model;
    }

    /**
     * 列表
     *
     * @time 2020年06月17日
     * @return \think\response\Json
     */
    public function index()
    {
        return CatchResponse::paginate($this->beian->getList());
    }

    /**
     * 保存
     *
     * @time 2020年06月17日
     * @param CreateRequest $request
     * @return \think\response\Json
     */
    public function save(Request $request)
    {
        return CatchResponse::success($this->beian->storeBy($request->post()));
    }

    /**
     * 更新
     *
     * @time 2020年06月17日
     * @param $id
     * @param UpdateRequest $request
     * @return \think\response\Json
     */
    public function update(Request $request, $id)
    {
        return CatchResponse::success($this->beian->updateBy($id, $request->post()));
    }

    /**
     * 删除
     *
     * @time 2020年06月17日
     * @param $id
     * @return \think\response\Json
     */
    public function delete($id)
    {
        return CatchResponse::success($this->beian->deleteBy($id));
    }

    public function read($id)
    {
        $jigou = $this->beian->findBy($id);
        return CatchResponse::success($jigou);
    }

    public function export(Excel $excel, JigouExport $jigouExport)
    {
        return CatchResponse::success($excel->save($jigouExport, 'export/jigou'));
    }

}
