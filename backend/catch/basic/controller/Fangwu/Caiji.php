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

class Caiji extends CatchController
{
//    protected $beian;

    public function __construct()
    {
//        $this->beian = $model;
    }

//    public function import(Request $request): \think\response\Json
//    {
//        return CatchResponse::success(app()->make($request->post('model'))
//            ->import(
//                \json_decode($request->post('fields'), 'field'),
//                $request->file('file')
//            ));
//    }
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

    public function buchong(Request $request) {
        $params = $request->param();
        $wyqyId = $params['wyqyId'];
        return $this->addTotal($request, $wyqyId);
    }

    public function import(Request $request)
    {
        $params = $request->param();
        $wuyequyuModel = mdlWuyequyu::Class;

        //保存物业区域
        $newWuyequyuId = app($wuyequyuModel)->storeBy([
            'WYQYMC' => $params['WYQYMC'],
            'XZQHDM' => $params['XZQHDM'],
            'XXDZ' => $params['XXDZ'],
            'JSDWSHXYDM' => $params['JSDW']['id'],
            'BZ' => $params['BZ']
        ]);

        return $this->addTotal($request, $newWuyequyuId);
    }

    private function addTotal(Request $request, $wyqyId) {

        $loudongModel = mdlLouzhuang::Class;
        $fenhuModel = mdlFenhu::Class;

        $params = $request->param();
        $loudongs = $params['loudong'];

        foreach ($loudongs['data'] as $loudong) {
            $newLdId = app($loudongModel)->createBy([
                'WYQYDM' => $wyqyId,            // 物业区域代码
                'LZMC' => $loudong['LDMC'],    // 楼幢名称
                'JZMJ' => $loudong['JZMJ'],    // 建筑面积
                'JCND' => $loudong['JCND'],     // 建筑年代
                'JZJG' => $loudong['JZJG'],    // 建筑结构
                'BZ' => $loudong['BZ'],      //  '备注',
            ]);
            foreach ($loudong['children']['0']['fenhuList'] as $fenhu) {
                $fenhuId = app($fenhuModel)->createBy([
                    'LZDM' => $newLdId,     //楼幢代码,
                    'SJC'   => $fenhu['LC'],//实际层
                    'SH'    => $fenhu['SH'],//室号
                    'DYMC'  => $fenhu['DYMC'], //单元名称
                    'XYDZ'  => $fenhu['FWDZ'], //详细地址
                    'JZMJ'  => $fenhu['JZMJ'], //建筑面积
                    'FWYT'  => $fenhu['FWYT'], //房屋用途
                    'FWLX'  => $fenhu['FWLX'], //房屋类型

                    'GFDW'  => $fenhu['GFDW'], //公房单位
                    'YZXM'  => $fenhu['YZXM'], //业主姓名
                    'ZJHM'  => $fenhu['ZJHM'], //证件号码
                    'SJHM'  => $fenhu['SJHM'], //手机号码
                ]);
                $i = $fenhuId;
            }
        }


        return CatchResponse::success(Common::RESPONSE_OK);

    }

}
