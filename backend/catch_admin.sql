/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : catch_admin

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 24/05/2021 11:27:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ca_attachments
-- ----------------------------
DROP TABLE IF EXISTS `ca_attachments`;
CREATE TABLE `ca_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(50) NOT NULL DEFAULT '' COMMENT '附件存储路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '资源地址',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT '资源mimeType',
  `file_ext` varchar(100) NOT NULL DEFAULT '' COMMENT '资源后缀',
  `file_size` int(11) NOT NULL DEFAULT '0' COMMENT '资源大小',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '资源名称',
  `driver` varchar(20) NOT NULL DEFAULT '0' COMMENT 'local,oss,qcloud,qiniu',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件管理';

-- ----------------------------
-- Records of ca_attachments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_config
-- ----------------------------
DROP TABLE IF EXISTS `ca_config`;
CREATE TABLE `ca_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置名称',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级配置',
  `component` varchar(100) NOT NULL DEFAULT '' COMMENT 'tab 引入的组件名称',
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT '配置键名',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '配置键值',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 启用 2 禁用',
  `creator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='配置管理';

-- ----------------------------
-- Records of ca_config
-- ----------------------------
BEGIN;
INSERT INTO `ca_config` VALUES (1, '基础配置', 0, 'basic', 'basic', '', 1, 0, 1621826820, 1621826820, 0);
INSERT INTO `ca_config` VALUES (2, '上传配置', 0, 'upload', 'upload', '', 1, 0, 1621826820, 1621826820, 0);
COMMIT;

-- ----------------------------
-- Table structure for ca_departments
-- ----------------------------
DROP TABLE IF EXISTS `ca_departments`;
CREATE TABLE `ca_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(15) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `principal` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '联系又想',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 正常 2 停用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，null 未删除 timestamp 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of ca_departments
-- ----------------------------
BEGIN;
INSERT INTO `ca_departments` VALUES (1, '总部', 0, '', '', '', 0, 1, 0, 1621826819, 1621826819, 0);
INSERT INTO `ca_departments` VALUES (2, '北京总部', 1, '', '', '', 0, 1, 0, 1621826819, 1621826819, 0);
INSERT INTO `ca_departments` VALUES (3, '南京总部', 1, '', '', '', 0, 1, 0, 1621826819, 1621826819, 0);
COMMIT;

-- ----------------------------
-- Table structure for ca_developers
-- ----------------------------
DROP TABLE IF EXISTS `ca_developers`;
CREATE TABLE `ca_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号',
  `id_card` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证',
  `alipay_account` varchar(100) NOT NULL DEFAULT '' COMMENT '支付宝账户',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 待认证 2 已认证',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开发者';

-- ----------------------------
-- Records of ca_developers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_jobs
-- ----------------------------
DROP TABLE IF EXISTS `ca_jobs`;
CREATE TABLE `ca_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(15) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `coding` varchar(50) NOT NULL DEFAULT '' COMMENT '编码',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 正常 2 停用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，null 未删除 timestamp 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of ca_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ca_login_log`;
CREATE TABLE `ca_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `login_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '登录地点ip',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `login_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 成功 2 失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Records of ca_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_migrations
-- ----------------------------
DROP TABLE IF EXISTS `ca_migrations`;
CREATE TABLE `ca_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_migrations
-- ----------------------------
BEGIN;
INSERT INTO `ca_migrations` VALUES (20191128114204, 'Users', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20191208125722, 'Roles', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20191208125726, 'Permissions', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20191208131107, 'UserHasRoles', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20191208131115, 'RoleHasPermissions', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20191212110921, 'LoginLog', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20191212110930, 'OperateLog', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200108143438, 'Department', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200108143506, 'Job', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200112003534, 'UserRelateJob', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200112031437, 'RoleHasDepartments', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200125133249, 'Attachments', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200409023815, 'ChangePermissions', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200417083602, 'Config', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200422080926, 'PermissionsAddColumn', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200519082617, 'AddPermissionStatusColumn', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200617060757, 'SensitiveWord', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200713152608, 'Developers', '2021-05-24 11:26:59', '2021-05-24 11:27:00', 0);
INSERT INTO `ca_migrations` VALUES (20200726001810, 'UpdateAttachmentsUrl', '2021-05-24 11:27:00', '2021-05-24 11:27:00', 0);
INSERT INTO `ca_migrations` VALUES (20200830025329, 'UpdateRoles', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200830031139, 'UpdatePermissions', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20200920130201, 'AddUserAvatar', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
INSERT INTO `ca_migrations` VALUES (20201123113823, 'AddUserRememberToken', '2021-05-24 11:26:59', '2021-05-24 11:26:59', 0);
COMMIT;

-- ----------------------------
-- Table structure for ca_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `ca_operate_log`;
CREATE TABLE `ca_operate_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `operate` varchar(20) NOT NULL DEFAULT '' COMMENT '操作模块',
  `route` varchar(100) NOT NULL DEFAULT '' COMMENT '路由',
  `params` varchar(1000) NOT NULL DEFAULT '' COMMENT '参数',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip',
  `creator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '请求方法',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of ca_operate_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_permissions
-- ----------------------------
DROP TABLE IF EXISTS `ca_permissions`;
CREATE TABLE `ca_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(15) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `level` varchar(50) NOT NULL DEFAULT '' COMMENT '层级',
  `route` varchar(50) NOT NULL DEFAULT '' COMMENT '路由',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '模块',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `permission_mark` varchar(50) NOT NULL COMMENT '权限标识',
  `component` varchar(255) NOT NULL DEFAULT '' COMMENT '组件名称',
  `redirect` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `keepalive` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 缓存 2 不存在 ',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 菜单 2 按钮',
  `hidden` tinyint(4) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，null 未删除 timestamp 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of ca_permissions
-- ----------------------------
BEGIN;
INSERT INTO `ca_permissions` VALUES (1, '权限管理', 0, '', '/permissions', 'el-icon-cpu', 'permissions', 1, 'permission', 'layout', '/permissions/users', 1, 1, 1, 100, 1587461455, 1599362429, 0);
INSERT INTO `ca_permissions` VALUES (2, '用户管理', 1, '1', '/permissions/users', 'el-icon-user', 'permissions', 1, 'user', 'users', '', 1, 1, 1, 10, 1587461597, 1599362429, 0);
INSERT INTO `ca_permissions` VALUES (3, '列表', 2, '1-2', '', '', 'permissions', 1, 'user@index', '', '', 1, 2, 1, 1, 1587461647, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (4, '创建', 2, '1-2', '', '', 'permissions', 1, 'user@create', '', '', 1, 2, 1, 1, 1587461696, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (5, '保存', 2, '1-2', '', '', 'permissions', 1, 'user@save', '', '', 1, 2, 1, 1, 1587461721, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (6, '查看', 2, '1-2', '', '', 'permissions', 1, 'user@edit', '', '', 1, 2, 1, 1, 1587461742, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (7, '更新', 2, '1-2', '', '', 'permissions', 1, 'user@update', '', '', 1, 2, 1, 1, 1587461762, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (8, '删除', 2, '1-2', '', '', 'permissions', 1, 'user@delete', '', '', 1, 2, 1, 1, 1587461841, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (9, '禁用', 2, '1-2', '', '', 'permissions', 1, 'user@switchStatus', '', '', 1, 2, 1, 1, 1587461876, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (10, '恢复', 2, '1-2', '', '', 'permissions', 1, 'user@recover', '', '', 1, 2, 1, 1, 1587461901, 1599030266, 0);
INSERT INTO `ca_permissions` VALUES (11, '角色管理', 1, '1', '/permissions/roles', 'el-icon-s-custom', 'permissions', 1, 'role', 'roles', '', 1, 1, 1, 9, 1587461939, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (12, '列表', 11, '1-11', '', '', 'permissions', 1, 'role@index', '', '', 1, 2, 1, 1, 1587461984, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (13, '创建', 11, '1-11', '', '', 'permissions', 1, 'role@create', '', '', 1, 2, 1, 1, 1587462007, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (14, '保存', 11, '1-11', '', '', 'permissions', 1, 'role@save', '', '', 1, 2, 1, 1, 1587462021, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (15, '查看', 11, '1-11', '', '', 'permissions', 1, 'role@edit', '', '', 1, 2, 1, 1, 1587462040, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (16, '更新', 11, '1-11', '', '', 'permissions', 1, 'role@update', '', '', 1, 2, 1, 1, 1587462058, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (17, '删除', 11, '1-11', '', '', 'permissions', 1, 'role@delete', '', '', 1, 2, 1, 1, 1587462070, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (18, '权限获取', 11, '1-11', '', '', 'permissions', 1, 'role@getPermissions', '', '', 1, 2, 1, 1, 1587462094, 1599362438, 0);
INSERT INTO `ca_permissions` VALUES (19, '菜单管理', 1, '1', '/permissions/rules', 'el-icon-collection-tag', 'permissions', 1, 'permission', 'rules', '', 1, 1, 1, 8, 1587462147, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (20, '列表', 19, '1-19', '', '', 'permissions', 1, 'permission@index', '', '', 1, 2, 1, 1, 1587462205, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (21, '创建', 19, '1-19', '', '', 'permissions', 1, 'permission@create', '', '', 1, 2, 1, 1, 1587462232, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (22, '保存', 19, '1-19', '', '', 'permissions', 1, 'permission@save', '', '', 1, 2, 1, 1, 1587462250, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (23, '禁用/启用', 19, '1-19', '', '', 'permissions', 1, 'permission@show', '', '', 1, 2, 1, 1, 1587462273, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (24, '更新', 19, '1-19', '', '', 'permissions', 1, 'permission@update', '', '', 1, 2, 1, 1, 1587462284, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (25, '删除', 19, '1-19', '', '', 'permissions', 1, 'permission@delete', '', '', 1, 2, 1, 1, 1587462296, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (26, '权限方法', 19, '1-19', '', '', 'permissions', 1, 'permission@getMethods', '', '', 1, 2, 1, 1, 1599221913, 1599362475, 0);
INSERT INTO `ca_permissions` VALUES (27, '部门管理', 1, '1', '/permissions/departments', 'el-icon-monitor', 'permissions', 1, 'departments', 'departments', '', 1, 1, 1, 7, 1587462488, 1599362429, 0);
INSERT INTO `ca_permissions` VALUES (28, '列表', 27, '1-27', '', '', 'permissions', 1, 'department@index', '', '', 1, 2, 1, 1, 1587462529, 1599030565, 0);
INSERT INTO `ca_permissions` VALUES (29, '保存', 27, '1-27', '', '', 'permissions', 1, 'department@save', '', '', 1, 2, 1, 1, 1587462548, 1599030565, 0);
INSERT INTO `ca_permissions` VALUES (30, '更新', 27, '1-27', '', '', 'permissions', 1, 'department@update', '', '', 1, 2, 1, 1, 1587462579, 1599030565, 0);
INSERT INTO `ca_permissions` VALUES (31, '删除', 27, '1-27', '', '', 'permissions', 1, 'department@delete', '', '', 1, 2, 1, 1, 1587462592, 1599030565, 0);
INSERT INTO `ca_permissions` VALUES (32, '岗位管理', 1, '1', '/permissions/jobs', 'el-icon-setting', 'permissions', 1, 'job', 'jobs', '', 1, 1, 1, 1, 1587462707, 1599362429, 0);
INSERT INTO `ca_permissions` VALUES (33, '列表', 32, '1-32', '', '', 'permissions', 1, 'job@indexs', '', '', 1, 2, 2, 1, 1587462757, 1598959522, 0);
INSERT INTO `ca_permissions` VALUES (34, '保存', 32, '1-32', '', '', 'permissions', 1, 'job@save', '', '', 1, 2, 2, 1, 1587462774, 1598959522, 0);
INSERT INTO `ca_permissions` VALUES (35, '更新', 32, '1-32', '', '', 'permissions', 1, 'job@update', '', '', 1, 2, 2, 1, 1587462785, 1598959522, 0);
INSERT INTO `ca_permissions` VALUES (36, '删除', 32, '1-32', '', '', 'permissions', 1, 'job@delete', '', '', 1, 2, 2, 1, 1587462794, 1598959522, 0);
INSERT INTO `ca_permissions` VALUES (37, '获取全部', 32, '1-32', '', '', 'permissions', 1, 'job@getAll', '', '', 1, 2, 2, 1, 1587462818, 1598959522, 0);
INSERT INTO `ca_permissions` VALUES (38, '系统管理', 0, '', '/system', 'el-icon-s-tools', 'system', 1, 'system', 'layout', 'attactments', 2, 1, 1, 1, 1587462349, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (39, '数据字典', 38, '38', '/system/database', 'el-icon-copy-document', 'system', 1, 'dataDictionary', 'database', '', 1, 1, 1, 8, 1587463087, 1599362678, 0);
INSERT INTO `ca_permissions` VALUES (40, '查看', 39, '38-39', '', '', 'system', 1, 'dataDictionary@view', '', '', 1, 2, 1, 1, 1587463113, 1599362691, 0);
INSERT INTO `ca_permissions` VALUES (41, '列表', 39, '38-39', '', '', 'system', 1, 'dataDictionary@tables', '', '', 1, 2, 1, 10, 1587463173, 1599362678, 0);
INSERT INTO `ca_permissions` VALUES (42, '优化', 39, '38-39', '', '', 'system', 1, 'dataDictionary@optimize', '', '', 1, 2, 1, 1, 1587463201, 1599362678, 0);
INSERT INTO `ca_permissions` VALUES (43, '备份', 39, '38-39', '', '', 'system', 1, 'optimize@backup', '', '', 1, 2, 1, 1, 1587463217, 1599362678, 0);
INSERT INTO `ca_permissions` VALUES (44, '附件管理', 38, '38', '/system/attactments', 'el-icon-folder-opened', 'system', 1, 'attactments', 'attachment', '', 1, 1, 1, 10, 1587463302, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (45, '列表', 44, '38-44', '', '', 'system', 1, 'attachments@index', '', '', 1, 2, 1, 1, 1587463335, 1599217559, 0);
INSERT INTO `ca_permissions` VALUES (46, '删除', 44, '38-44', '', '', 'system', 1, 'attachments@delete', '', '', 1, 2, 1, 1, 1587463355, 1599217559, 0);
INSERT INTO `ca_permissions` VALUES (47, '上传图片', 44, '38-44', '', '', 'system', 1, 'upload@image', '', '', 1, 2, 1, 1, 1587466919, 1599217559, 0);
INSERT INTO `ca_permissions` VALUES (48, '上传文件', 44, '38-44', '', '', 'system', 1, 'upload@file', '', '', 1, 2, 1, 1, 1587466939, 1599217559, 0);
INSERT INTO `ca_permissions` VALUES (49, '配置管理', 38, '38', '/system/config', 'el-icon-setting', 'system', 1, 'config', 'config', '', 1, 1, 1, 9, 1587466991, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (50, '父级配置', 49, '38-49', '', '', 'system', 1, 'config@parent', '', '', 1, 2, 1, 1, 1587467036, 1591345651, 0);
INSERT INTO `ca_permissions` VALUES (51, '存储', 49, '38-49', '', '', 'system', 1, 'config@save', '', '', 1, 2, 1, 1, 1587467052, 1587547118, 0);
INSERT INTO `ca_permissions` VALUES (52, '获取', 49, '38-49', '', '', 'system', 1, 'config@read', '', '', 1, 2, 1, 1, 1587467062, 1587547118, 0);
INSERT INTO `ca_permissions` VALUES (53, '登陆日志', 38, '38', '/system/log/login', 'el-icon-coin', 'system', 1, 'loginLog', 'loginLog', '', 1, 1, 1, 5, 1587467150, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (54, '列表', 53, '38-53', '', '', 'system', 1, 'loginlog@list', '', '', 1, 2, 1, 1, 1587467206, 1587547118, 0);
INSERT INTO `ca_permissions` VALUES (55, '清空', 53, '38-53', '', '', 'system', 1, 'loginlog@empty', '', '', 1, 2, 1, 1, 1587467221, 1587547118, 0);
INSERT INTO `ca_permissions` VALUES (56, '操作日志', 38, '38', '/system/log/operate', 'el-icon-house', 'system', 1, 'operateLog', 'operateLog', '', 1, 1, 1, 1, 1587467180, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (57, '列表', 56, '38-56', '', '', 'system', 1, 'operatelog@list', '', '', 1, 2, 1, 1, 1587467246, 1587547118, 0);
INSERT INTO `ca_permissions` VALUES (58, '清空', 56, '38-56', '', '', 'system', 1, 'operatelog@empty', '', '', 1, 2, 1, 1, 1587467266, 1587547118, 0);
INSERT INTO `ca_permissions` VALUES (59, '代码生成', 38, '38', '/system/generate', 'el-icon-scissors', 'system', 1, 'generate', 'generate', '', 1, 1, 1, 1, 1587717452, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (60, '生成', 59, '38-59', '', '', 'system', 1, 'generate@save', '', '', 1, 2, 1, 1, 1588110923, 1599217574, 0);
INSERT INTO `ca_permissions` VALUES (61, '预览', 59, '38-59', '', '', 'system', 1, 'generate@preview', '', '', 1, 2, 1, 1, 1588110962, 1599217574, 0);
INSERT INTO `ca_permissions` VALUES (62, '敏感词库', 38, '38', '/sensitive/word', 'el-icon-folder-delete', 'system', 1, 'sensitiveWord', 'sensitiveWord', '', 1, 1, 1, 1, 1592375865, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (63, '列表', 62, '38-62', '', '', 'system', 1, 'sensitiveWord@index', '', '', 1, 2, 1, 1, 1592382167, 1593589434, 0);
INSERT INTO `ca_permissions` VALUES (64, '新增', 62, '38-62', '', '', 'system', 1, 'sensitiveWord@save', '', '', 1, 2, 1, 1, 1592382179, 1593589434, 0);
INSERT INTO `ca_permissions` VALUES (65, '更新', 62, '38-62', '', '', 'system', 1, 'sensitiveWord@update', '', '', 1, 2, 1, 1, 1592382192, 1593589434, 0);
INSERT INTO `ca_permissions` VALUES (66, '删除', 62, '38-62', '', '', 'system', 1, 'sensitiveWord@delete', '', '', 1, 2, 1, 1, 1592382202, 1593589434, 0);
INSERT INTO `ca_permissions` VALUES (67, '开发者', 38, '38', '/system/develop', 'el-icon-rank', 'system', 1, 'develop', 'develop', '', 1, 1, 1, 1, 1594626307, 1599288737, 0);
INSERT INTO `ca_permissions` VALUES (68, '模块管理', 38, '38', '/system/module', 'el-icon-postcard', 'system', 1, 'module', 'module', '', 1, 1, 1, 1, 1599904306, 1599904306, 0);
INSERT INTO `ca_permissions` VALUES (69, '列表', 68, '38-68', '', '', 'system', 1, 'module@index', '', '', 1, 2, 1, 1, 1599904319, 1599904319, 0);
INSERT INTO `ca_permissions` VALUES (70, '禁用/启用', 68, '38-68', '', '', 'system', 1, 'module@disOrEnable', '', '', 1, 2, 1, 1, 1599904331, 1599904331, 0);
COMMIT;

-- ----------------------------
-- Table structure for ca_role_has_departments
-- ----------------------------
DROP TABLE IF EXISTS `ca_role_has_departments`;
CREATE TABLE `ca_role_has_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  `department_id` int(11) unsigned NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色部门表';

-- ----------------------------
-- Records of ca_role_has_departments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `ca_role_has_permissions`;
CREATE TABLE `ca_role_has_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  `permission_id` int(11) unsigned NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of ca_role_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_roles
-- ----------------------------
DROP TABLE IF EXISTS `ca_roles`;
CREATE TABLE `ca_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(15) NOT NULL DEFAULT '' COMMENT '角色名',
  `identify` varchar(20) NOT NULL DEFAULT '1' COMMENT '角色的标识，用英文表示，用于后台路由权限',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色备注',
  `data_range` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 全部数据 2 自定义数据 3 仅本人数据 4 部门数据 5 部门及以下数据',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，0未删除 >0 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ca_roles
-- ----------------------------
BEGIN;
INSERT INTO `ca_roles` VALUES (1, '超级管理员', 'admin', 0, 'super user', 1, 1, 1621826819, 1621826819, 0);
COMMIT;

-- ----------------------------
-- Table structure for ca_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `ca_sensitive_word`;
CREATE TABLE `ca_sensitive_word` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT '词汇',
  `creator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='敏感词库';

-- ----------------------------
-- Records of ca_sensitive_word
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_user_has_jobs
-- ----------------------------
DROP TABLE IF EXISTS `ca_user_has_jobs`;
CREATE TABLE `ca_user_has_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `job_id` int(11) unsigned NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of ca_user_has_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ca_user_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `ca_user_has_roles`;
CREATE TABLE `ca_user_has_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of ca_user_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `ca_user_has_roles` VALUES (1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for ca_users
-- ----------------------------
DROP TABLE IF EXISTS `ca_users`;
CREATE TABLE `ca_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `email` varchar(100) NOT NULL COMMENT '邮箱 登录',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `remember_token` varchar(512) NOT NULL DEFAULT '' COMMENT '用户token',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态 1 正常 2 禁用',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，0未删除 >0 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ca_users
-- ----------------------------
BEGIN;
INSERT INTO `ca_users` VALUES (1, 'admin', '$2y$10$uCM/64wn.h7.seUm/F2tgeiYA0YLARMoQe.SvhFLY3/Kgl9RDJOyC', 'catch@admin.com', '', '', 1, 0, 1, '0', 0, 1621826819, 1621826819, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
