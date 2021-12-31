<?php


namespace catchAdmin\basic\controller;
use think\Request;
use catcher\CatchResponse;
use catchAdmin\basic\model\Louzhuang as Model;

class Louzhuang extends CatchController
{
    protected $model;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        return CatchResponse::paginate($this->model->getList());
    }

    public function read($id)
    {
        return CatchResponse::success($this->model->findBy($id));
    }

    public function save(CreateRequest $request)
    {
        return CatchResponse::success($this->model->storeBy($request->param()));
    }

    public function update($id, UpdateRequest $request)
    {
        return CatchResponse::success($this->model->updateBy($id, $request->param()));
    }


}
