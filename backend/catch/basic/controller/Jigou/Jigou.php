<?php

namespace catchAdmin\basic\controller\jigou;

use catcher\base\CatchController;
use catcher\CatchResponse;
use think\Request;

class Jigou extends CatchController
{

    public const TYPE_KAIFA = 0;
    public const TYPE_FUWU = 1;
    public const TYPE_YEZHU = 2;
    public const TYPE_SHENJIE = 3;
    public const TYPE_SHIGONG = 4;
    public const TYPE_GONGYOU = 5;


    public const TYEP_NAMES = array(
        self::TYPE_KAIFA => '开发建设单位',
        self::TYPE_FUWU => '物业服务企业',
        self::TYPE_YEZHU => '业主委员会',
        self::TYPE_SHENJIE => '审价单位',
        self::TYPE_SHIGONG => '施工单位',
        self::TYPE_GONGYOU => '公有售房单位'
//        self::TYPE_KAIFA,
//        self::TYPE_FUWU,
//        self::TYPE_YEZHU,
//        self::TYPE_SHENJIE,
//        self::TYPE_SHIGONG,
//        self::TYPE_GONGYOU,
    );

    public function list(Request $request): \think\response\Json
    {
        return CatchResponse::success(json_encode(self::TYEP_NAMES, JSON_UNESCAPED_UNICODE));
//        return CatchResponse::success('jigou');
    }

}

