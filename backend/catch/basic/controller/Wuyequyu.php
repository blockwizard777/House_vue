<?php


namespace catchAdmin\basic\controller;
use think\Request;
use catcher\base\CatchController;
use catcher\CatchResponse;
use catchAdmin\basic\model\Wuyequyu as Model;

class Wuyequyu extends CatchController
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
    public function getAll() {
        return CatchResponse::success($this->model->getAll());
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
