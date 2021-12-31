<?php
namespace catchAdmin\basic\tables\forms\Jigou;

use catcher\library\form\Form;
use catchAdmin\basic\controller\jigou\Jigou;

class Beian extends Form
{
    public function fields(): array
    {
        return [];

//        return [
//            self::select('type', '机构类型')
//                ->placeholder('请选择机构类型')
//                ->options(
//                    self::options()->add(Jigou::TYEPS[0], 0)
//                                    ->add(Jigou::TYEPS[1], 1)
//                                    ->add(Jigou::TYEPS[2], 2)
//                                    ->add(Jigou::TYEPS[3], 3)
//                                    ->add(Jigou::TYEPS[4], 4)
//                                    ->add(Jigou::TYEPS[5], 5)
//                                    ->render()
//                )->style(['width' => '100%'])
//                ->appendControl(0, [
//                    // Common
//                    self::input('SHXYDM', '机构代码')->col(self::col(12))->clearable(true)->required(),
//                    self::input('JGMC', Jigou::TYEPS[0].'名称')->col(self::col(12))->clearable(true)->required(),
//                    self::input('ZZZSBH', '资质证书编号')->required()->col(12)->required(),
//                    self::date('XYDMYXQ', '组织机构代码有效期')->required()->col(12)->required(),
//                    self::date('ZZYXQ', '资质有效期')->required()->col(12)->required(),
//                    self::input('FDDBRZZZCH', '企业法人营业执照注册号')->required()->col(12)->required(),
//                    self::input('FDDBR', '企业法人代表')->required()->col(12)->required(),
//                    self::input('FDDBRDH', '法人代表手机号')->required()->col(12)->required(),
//                    self::input('LXR', '联系人')->required()->col(12)->required(),
//                    self::input('LXRDH', '联系人手机号')->required()->col(12)->required(),
//                    self::input('BGDH', '办公电话')->required()->col(12)->required(),
//                    self::input('CZ', '传真')->required()->col(12)->required(),
//                    self::input('DZYX', '电子邮箱')->required()->col(12)->required(),
//                    self::input('LXRQQ', '联系人QQ')->required()->col(12)->required(),
//                    self::input('YB', '邮编')->required()->col(12)->required(),
//                    self::input('DZ', '地址')->required()->col(6)->required(),
//                ])
//                ->appendControl(1, [
//                    self::input('SHXYDM', '机构代码')->col(self::col(12))->clearable(true)->required(),
//                    self::input('JGMC', Jigou::TYEPS[1].'名称')->col(self::col(12))->clearable(true)->required(),
//                    self::input('ZZZSBH', '资质证书编号')->required()->col(12)->required(),
//                    self::date('XYDMYXQ', '组织机构代码有效期')->required()->col(12)->required(),
//                    self::date('ZZYXQ', '资质有效期')->required()->col(12)->required(),
//                    self::input('FDDBRZZZCH', '企业法人营业执照注册号')->required()->col(12)->required(),
//                    self::input('FDDBR', '企业法人代表')->required()->col(12)->required(),
//                    self::input('FDDBRDH', '法人代表手机号')->required()->col(12)->required(),
//                    self::input('LXR', '联系人')->required()->col(12)->required(),
//                    self::input('LXRDH', '联系人手机号')->required()->col(12)->required(),
//                    self::input('BGDH', '办公电话')->required()->col(12)->required(),
//                    self::input('CZ', '传真')->required()->col(12)->required(),
//                    self::input('DZYX', '电子邮箱')->required()->col(12)->required(),
//                    self::input('LXRQQ', '联系人QQ')->required()->col(12)->required(),
//                    self::input('YB', '邮编')->required()->col(12)->required(),
//                    self::input('DZ', '地址')->required()->col(6)->required(),
//                ])
//                ->appendControl(2, [
//                    self::input('XYDMYXQ', '机构代码有效期')->required()->col(12),
//                    self::input('XZQHDM', '行政区划代码')->required()->col(12),
//                    self::input('WYQYDM', '物业区域代码')->required()->col(12),
//                    self::input('ZRXM', ' 主任姓名')->required()->col(12),
//                    self::input('ZRDH', '主任电话')->required()->col(12),
//                    self::input('ZRZJLX', '主任证件类型')->required()->col(12),
//                    self::input('ZRZJHM', '主任证件号码')->required()->col(12),
//                    self::input('FZRXM', ' 副主任姓名')->required()->col(12),
//                    self::input('FZRDH', '副主任电话')->required()->col(12),
//                    self::input('FZRZJLX', '副主任证件类型')->required()->col(12),
//                    self::input('FZRZJHM', '副主任证件号码')->required()->col(12),
//                ]),
//                //->col(self::col(12)),
//
//            self::input('LXR', '联系人')->col(self::col(12))->clearable(true)->required(),
//            self::input('LXRDH', '联系人电话')->col(self::col(12))->clearable(true),
//            self::input('BGDH', '办公电话')->col(self::col(12))->clearable(true),
//            self::input('CZ', '传真')->col(self::col(12))->clearable(true),
//            self::input('DZYX', '电子邮箱')->col(self::col(12))->clearable(true),
//            self::input('DZ', '地址')->style(['width' => '100%']),
//            //Form::input('type', '敏感词')->required()->placeholder('请输入敏感词'),
//        ];
    }
}
