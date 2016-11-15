/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : hunt

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-11-15 18:03:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_data_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_group`;
CREATE TABLE `sys_data_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级id',
  `name` varchar(256) DEFAULT NULL COMMENT '名称',
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更热人',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data_group
-- ----------------------------
INSERT INTO `sys_data_group` VALUES ('1', '极限验证', '0', '极限验证', '2', '0', '2016-10-31 22:08:28', '2016-10-31 22:08:28', '0', '0', '1');
INSERT INTO `sys_data_group` VALUES ('2', '日志输出控制', '0', '日志', '2', '0', '2016-10-31 22:09:38', '2016-10-31 22:09:38', '0', '0', '1');
INSERT INTO `sys_data_group` VALUES ('3', '是否开启Ip拦截', '0', 'IP拦截', '2', '0', '2016-11-05 18:47:22', '2016-11-05 18:47:22', '0', '0', '1');
INSERT INTO `sys_data_group` VALUES ('4', '系统配置信息', '0', '系统', '2', '0', '2016-11-15 17:33:57', '2016-11-15 17:33:57', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_data_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_item`;
CREATE TABLE `sys_data_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_data_group_id` bigint(20) DEFAULT NULL COMMENT '组id',
  `key_value` varchar(256) DEFAULT NULL COMMENT '值',
  `key_name` varchar(256) DEFAULT NULL COMMENT '名称',
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更热人',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除,3:禁用账号',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data_item
-- ----------------------------
INSERT INTO `sys_data_item` VALUES ('1', '1', '796c2461adf8051c835e4a758a6091f6', 'geetest_id', '2', '0', '2016-10-31 22:08:48', '2016-10-31 23:51:11', '0', '0', '1', 'geetest_id');
INSERT INTO `sys_data_item` VALUES ('2', '1', '0edad631bed761ab039d8391dd3103ff', 'geetest_key', '2', '0', '2016-10-31 22:09:19', '2016-10-31 23:51:12', '0', '0', '1', 'geetest_key');
INSERT INTO `sys_data_item` VALUES ('3', '2', 'true', 'error_detail', '2', '0', '2016-10-31 22:10:21', '2016-10-31 23:51:13', '0', '0', '1', '是否输出错误日志详情');
INSERT INTO `sys_data_item` VALUES ('4', '3', 'true', 'ip_forbidden', '2', '0', '2016-11-05 18:55:58', '2016-11-15 18:03:13', '0', '0', '1', '是否开启ip拦截');
INSERT INTO `sys_data_item` VALUES ('5', '4', '/hunt-admin', 'basePath', '1', '0', '2016-11-15 17:34:27', '2016-11-15 17:34:27', '0', '0', '1', '系统root路径');

-- ----------------------------
-- Table structure for sys_ip_forbidden
-- ----------------------------
DROP TABLE IF EXISTS `sys_ip_forbidden`;
CREATE TABLE `sys_ip_forbidden` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更热人',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
  `description` varchar(256) DEFAULT NULL COMMENT '说明',
  `ip` varchar(256) DEFAULT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ip_forbidden
-- ----------------------------
INSERT INTO `sys_ip_forbidden` VALUES ('1', '1', '0', '2016-11-05 18:39:29', '2016-11-15 15:48:39', '0', '0', '2', '2016-11-06 18:39:24', '描述', '127.0.0.111');
INSERT INTO `sys_ip_forbidden` VALUES ('2', '1', '0', '2016-11-05 20:44:32', '2016-11-05 20:44:32', '0', '0', '1', '2016-11-11 20:44:24', 'a ', '112.74.109.218');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更热人',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  `ip` varchar(256) DEFAULT NULL COMMENT '请求ip',
  `user_id` varchar(256) DEFAULT NULL COMMENT '操作用户id',
  `method` varchar(2048) DEFAULT NULL COMMENT '请求方法',
  `param` text COMMENT '请求参数',
  `result` text COMMENT '请求结果',
  `duration` bigint(20) DEFAULT NULL COMMENT '持续时间',
  `url` varchar(512) DEFAULT NULL COMMENT '请求url',
  `user_agent` varchar(512) DEFAULT NULL COMMENT '请求ua',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2639 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('2585', '0', '2016-11-15 17:50:15', '2016-11-15 17:50:15', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.index', null, 'system/index', '15', 'http://localhost:8086/hunt-admin/system/welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2586', '0', '2016-11-15 17:50:17', '2016-11-15 17:50:17', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.UserController.user', '_ = 1479203416279 | ', 'system/user', '39', 'http://localhost:8086/hunt-admin/user/user', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2587', '0', '2016-11-15 17:50:17', '2016-11-15 17:50:17', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.UserController.list', 'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'PageInfo{total=2, rows=[SysUserDto{id=1, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:06:05 AWST 2016, updateTime=Mon Oct 31 23:53:29 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'7\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:49:14 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}]}, SysUserDto{id=2, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:07:39 AWST 2016, updateTime=Mon Oct 31 23:53:30 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}]}]}', '149', 'http://localhost:8086/hunt-admin/user/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2588', '0', '2016-11-15 17:50:18', '2016-11-15 17:50:18', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '202', 'http://localhost:8086/hunt-admin/job/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2589', '0', '2016-11-15 17:50:18', '2016-11-15 17:50:18', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.list', null, 'data is too long', '240', 'http://localhost:8086/hunt-admin/permission/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2590', '0', '2016-11-15 17:50:20', '2016-11-15 17:50:20', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.data', '_ = 1479203416282 | ', 'system/data', '0', 'http://localhost:8086/hunt-admin/system/data', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2591', '0', '2016-11-15 17:50:21', '2016-11-15 17:50:21', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=5, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=2, rank=0, createTime=Mon Oct 31 22:08:48 AWST 2016, updateTime=Mon Oct 31 23:51:11 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=2, rank=0, createTime=Mon Oct 31 22:09:19 AWST 2016, updateTime=Mon Oct 31 23:51:12 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=2, rank=0, createTime=Mon Oct 31 22:10:21 AWST 2016, updateTime=Mon Oct 31 23:51:13 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=4, description=\'是否开启ip拦截\', sysDataGroupId=3, sysDataGroupName=\'IP拦截\', keyValue=\'true\', keyName=\'ip_forbidden\', isFinal=1, rank=0, createTime=Sat Nov 05 18:55:58 AWST 2016, updateTime=Thu Nov 10 19:26:15 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=5, description=\'系统root路径\', sysDataGroupId=4, sysDataGroupName=\'系统\', keyValue=\'/hunt-admin\', keyName=\'basePath\', isFinal=1, rank=0, createTime=Tue Nov 15 17:34:27 AWST 2016, updateTime=Tue Nov 15 17:34:27 AWST 2016, createBy=0, updateBy=0, status=1}]}', '48', 'http://localhost:8086/hunt-admin/system/data/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2592', '0', '2016-11-15 17:50:21', '2016-11-15 17:50:21', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.dataGroupList', null, '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 AWST 2016\', updateTime=\'Mon Oct 31 22:08:28 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 AWST 2016\', updateTime=\'Mon Oct 31 22:09:38 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'3\', description=\'是否开启Ip拦截\', parentId=\'0\', name=\'IP拦截\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Nov 05 18:47:22 AWST 2016\', updateTime=\'Sat Nov 05 18:47:22 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'4\', description=\'系统配置信息\', parentId=\'0\', name=\'系统\', isFinal=\'2\', rank=\'0\', createTime=\'Tue Nov 15 17:33:57 AWST 2016\', updateTime=\'Tue Nov 15 17:33:57 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]', '22', 'http://localhost:8086/hunt-admin/system/dataGroup/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2593', '0', '2016-11-15 17:50:31', '2016-11-15 17:50:31', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.RoleController.role', '_ = 1479203416285 | ', 'system/role', '8', 'http://localhost:8086/hunt-admin/role/role', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2594', '0', '2016-11-15 17:50:32', '2016-11-15 17:50:32', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.list', null, 'data is too long', '77', 'http://localhost:8086/hunt-admin/permission/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2595', '0', '2016-11-15 17:50:32', '2016-11-15 17:50:32', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.RoleController.list', null, 'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:18:43 AWST 2016\', updateTime=\'Mon Oct 31 23:51:57 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 AWST 2016\', updateTime=\'Tue Nov 01 23:11:39 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:36:24 AWST 2016\', updateTime=\'Mon Oct 31 23:51:58 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:37:46 AWST 2016\', updateTime=\'Mon Oct 31 23:51:59 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:59:17 AWST 2016\', updateTime=\'Mon Oct 31 23:51:59 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}', '240', 'http://localhost:8086/hunt-admin/role/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2596', '0', '2016-11-15 17:50:46', '2016-11-15 17:50:46', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.logout', null, 'Result{code=10000, msg=\'操作成功\', data=}', '22', 'http://localhost:8086/hunt-admin/system/logout', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2597', '0', '2016-11-15 17:50:46', '2016-11-15 17:50:46', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.captcha', 't = 1479203446396 | ', '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"be69c9eabde7fe2be17ed1eb265eab0f\"}', '232', 'http://localhost:8086/hunt-admin/system/captcha', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2598', '0', '2016-11-15 17:51:05', '2016-11-15 17:51:05', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.login', 'loginName = admin2 | password = 111111 | platform = 1 | geetest_challenge = be69c9eabde7fe2be17ed1eb265eab0fbq | geetest_validate = 4e872721855adab148401683f491ec50 | geetest_seccode = 4e872721855adab148401683f491ec50|jordan | ', 'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}], permissions=[]}}', '139', 'http://localhost:8086/hunt-admin/system/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2599', '0', '2016-11-15 17:51:05', '2016-11-15 17:51:05', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.index', null, 'system/index', '0', 'http://localhost:8086/hunt-admin/system/welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2600', '0', '2016-11-15 17:51:06', '2016-11-15 17:51:06', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.UserController.user', '_ = 1479203465336 | ', 'system/user', '3', 'http://localhost:8086/hunt-admin/user/user', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2601', '0', '2016-11-15 17:51:07', '2016-11-15 17:51:07', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.UserController.list', 'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'PageInfo{total=2, rows=[SysUserDto{id=1, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:06:05 AWST 2016, updateTime=Mon Oct 31 23:53:29 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'7\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:49:14 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}]}, SysUserDto{id=2, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:07:39 AWST 2016, updateTime=Mon Oct 31 23:53:30 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}]}]}', '27', 'http://localhost:8086/hunt-admin/user/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2602', '0', '2016-11-15 17:51:07', '2016-11-15 17:51:07', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.list', null, 'data is too long', '85', 'http://localhost:8086/hunt-admin/permission/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2603', '0', '2016-11-15 17:51:07', '2016-11-15 17:51:07', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '86', 'http://localhost:8086/hunt-admin/job/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2604', '0', '2016-11-15 17:51:11', '2016-11-15 17:51:11', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.JobController.job', '_ = 1479203465339 | ', 'system/job', '3', 'http://localhost:8086/hunt-admin/job/job', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2605', '0', '2016-11-15 17:51:12', '2016-11-15 17:51:12', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '105', 'http://localhost:8086/hunt-admin/job/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2606', '0', '2016-11-15 17:51:12', '2016-11-15 17:51:12', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.OrganizationController.list', null, 'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=2, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 AWST 2016, updateTime=Mon Oct 31 23:51:20 AWST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=2, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 AWST 2016, updateTime=Mon Oct 31 23:51:20 AWST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=2, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 AWST 2016, updateTime=Mon Oct 31 23:51:21 AWST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=2, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 AWST 2016, updateTime=Mon Oct 31 23:51:23 AWST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=2, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 AWST 2016, updateTime=Mon Oct 31 23:51:24 AWST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=2, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 AWST 2016, updateTime=Mon Oct 31 23:51:24 AWST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=2, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 AWST 2016, updateTime=Mon Oct 31 23:51:22 AWST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}', '130', 'http://localhost:8086/hunt-admin/organization/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2607', '0', '2016-11-15 17:51:12', '2016-11-15 17:51:12', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.RoleController.list', null, 'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:18:43 AWST 2016\', updateTime=\'Mon Oct 31 23:51:57 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 AWST 2016\', updateTime=\'Tue Nov 01 23:11:39 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:36:24 AWST 2016\', updateTime=\'Mon Oct 31 23:51:58 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:37:46 AWST 2016\', updateTime=\'Mon Oct 31 23:51:59 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'2\', createTime=\'Sat Oct 29 14:59:17 AWST 2016\', updateTime=\'Mon Oct 31 23:51:59 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}', '338', 'http://localhost:8086/hunt-admin/role/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2608', '0', '2016-11-15 17:51:12', '2016-11-15 17:51:12', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '161', 'http://localhost:8086/hunt-admin/job/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2609', '0', '2016-11-15 17:53:32', '2016-11-15 17:53:32', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '60', 'http://127.0.0.1:8086/hunt-admin/job/list', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2610', '0', '2016-11-15 17:53:32', '2016-11-15 17:53:32', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.ErrorController.internalError', null, 'system/500', '5', 'http://127.0.0.1:8086/hunt-admin/error/internalError', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2611', '0', '2016-11-15 17:54:17', '2016-11-15 17:54:17', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '57', 'http://127.0.0.1:8086/hunt-admin/job/list', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2612', '0', '2016-11-15 17:59:13', '2016-11-15 17:59:13', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '229', 'http://127.0.0.1:8086/hunt-admin/job/list', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2613', '0', '2016-11-15 17:59:20', '2016-11-15 17:59:20', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '82', 'http://127.0.0.1:8086/hunt-admin/job/list', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2614', '0', '2016-11-15 17:59:21', '2016-11-15 17:59:21', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.ErrorController.unAuthorization', null, 'system/unAuthorization', '7', 'http://127.0.0.1:8086/hunt-admin/error/unAuthorization', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2615', '0', '2016-11-15 17:59:26', '2016-11-15 17:59:26', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '76', 'http://127.0.0.1:8086/hunt-admin/job/list', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2616', '0', '2016-11-15 17:59:26', '2016-11-15 17:59:26', '0', '0', '1', '127.0.0.1', null, 'com.hunt.controller.ErrorController.unAuthorization', null, 'system/unAuthorization', '0', 'http://127.0.0.1:8086/hunt-admin/error/unAuthorization', 'Apache-HttpClient/4.5.2 (Java/1.8.0_102)');
INSERT INTO `sys_log` VALUES ('2617', '0', '2016-11-15 18:01:56', '2016-11-15 18:01:56', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.ip', '_ = 1479203465342 | ', 'system/ip', '20', 'http://localhost:8086/hunt-admin/system/ip', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2618', '0', '2016-11-15 18:01:57', '2016-11-15 18:01:57', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.interceptStatus', null, 'Result{code=10000, msg=\'操作成功\', data=true}', '67', 'http://localhost:8086/hunt-admin/system/ip/intercept/status', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2619', '0', '2016-11-15 18:01:57', '2016-11-15 18:01:57', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ', 'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}', '150', 'http://localhost:8086/hunt-admin/system/ip/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2620', '0', '2016-11-15 18:01:57', '2016-11-15 18:01:57', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.log', '_ = 1479203465345 | ', 'system/log', '6', 'http://localhost:8086/hunt-admin/system/log', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2621', '0', '2016-11-15 18:01:58', '2016-11-15 18:01:58', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.logList', 'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ', 'PageInfo{total=36, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=36, pages=2, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}', '89', 'http://localhost:8086/hunt-admin/system/log/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2622', '0', '2016-11-15 18:02:09', '2016-11-15 18:02:09', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.index', null, 'system/index', '0', 'http://localhost:8086/hunt-admin/system/welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2623', '0', '2016-11-15 18:02:12', '2016-11-15 18:02:12', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.UserController.user', '_ = 1479204129936 | ', 'system/user', '10', 'http://localhost:8086/hunt-admin/user/user', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2624', '0', '2016-11-15 18:02:12', '2016-11-15 18:02:12', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.UserController.list', 'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'PageInfo{total=2, rows=[SysUserDto{id=1, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:06:05 AWST 2016, updateTime=Mon Oct 31 23:53:29 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'7\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:49:14 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}]}, SysUserDto{id=2, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:07:39 AWST 2016, updateTime=Mon Oct 31 23:53:30 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 AWST 2016\', updateTime=\'Mon Oct 31 23:53:54 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=2}]}]}', '69', 'http://localhost:8086/hunt-admin/user/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2625', '0', '2016-11-15 18:02:13', '2016-11-15 18:02:13', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.list', null, 'data is too long', '142', 'http://localhost:8086/hunt-admin/permission/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2626', '0', '2016-11-15 18:02:13', '2016-11-15 18:02:13', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.JobController.list', null, 'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 AWST 2016, updateTime=Mon Oct 31 23:52:09 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 AWST 2016, updateTime=Mon Oct 31 23:52:12 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 AWST 2016, updateTime=Mon Oct 31 23:52:10 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 AWST 2016, updateTime=Mon Oct 31 23:52:11 AWST 2016, createBy=0, updateBy=0, status=1, isFinal=2, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}', '116', 'http://localhost:8086/hunt-admin/job/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2627', '0', '2016-11-15 18:02:13', '2016-11-15 18:02:13', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'springfox.documentation.swagger.web.ApiResourceController.uiConfiguration', null, '<200 OK,springfox.documentation.swagger.web.UiConfiguration@4008e5a0,{}>', '3', 'http://localhost:8086/hunt-admin/swagger-resources/configuration/ui', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2628', '0', '2016-11-15 18:02:13', '2016-11-15 18:02:13', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'springfox.documentation.swagger.web.ApiResourceController.swaggerResources', null, '<200 OK,[springfox.documentation.swagger.web.SwaggerResource@63bed3e6],{}>', '0', 'http://localhost:8086/hunt-admin/swagger-resources', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2629', '0', '2016-11-15 18:02:14', '2016-11-15 18:02:14', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'springfox.documentation.swagger.web.ApiResourceController.securityConfiguration', null, '<200 OK,springfox.documentation.swagger.web.SecurityConfiguration@7549d30e,{}>', '2', 'http://localhost:8086/hunt-admin/swagger-resources/configuration/security', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2630', '0', '2016-11-15 18:02:19', '2016-11-15 18:02:19', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.permission', '_ = 1479204129939 | ', 'system/permission', '4', 'http://localhost:8086/hunt-admin/permission/permission', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2631', '0', '2016-11-15 18:02:19', '2016-11-15 18:02:19', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.list', null, 'data is too long', '104', 'http://localhost:8086/hunt-admin/permission/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2632', '0', '2016-11-15 18:02:19', '2016-11-15 18:02:19', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.PermissionController.selectGroup', null, '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 AWST 2016\', updateTime=\'Sat Oct 29 11:43:55 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 AWST 2016\', updateTime=\'Sat Oct 29 11:43:55 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 AWST 2016\', updateTime=\'Sat Oct 29 11:43:55 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 AWST 2016\', updateTime=\'Sat Oct 29 11:43:55 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 AWST 2016\', updateTime=\'Sat Oct 29 11:43:55 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 AWST 2016\', updateTime=\'Sat Oct 29 11:43:55 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 AWST 2016\', updateTime=\'Mon Oct 31 21:31:01 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 AWST 2016\', updateTime=\'Mon Oct 31 21:43:47 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'9\', name=\'日志\', description=\'日志\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:47:47 AWST 2016\', updateTime=\'Mon Oct 31 23:47:47 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'10\', name=\'其他\', description=\'其他\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Tue Nov 01 22:44:42 AWST 2016\', updateTime=\'Tue Nov 01 22:44:42 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]', '13', 'http://localhost:8086/hunt-admin/permission/group/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2633', '0', '2016-11-15 18:02:23', '2016-11-15 18:02:23', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'springfox.documentation.swagger.web.ApiResourceController.uiConfiguration', null, '<200 OK,springfox.documentation.swagger.web.UiConfiguration@4008e5a0,{}>', '0', 'http://localhost:8086/hunt-admin/swagger-resources/configuration/ui', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2634', '0', '2016-11-15 18:02:23', '2016-11-15 18:02:23', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'springfox.documentation.swagger.web.ApiResourceController.swaggerResources', null, '<200 OK,[springfox.documentation.swagger.web.SwaggerResource@4d6c40e7],{}>', '0', 'http://localhost:8086/hunt-admin/swagger-resources', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2635', '0', '2016-11-15 18:02:23', '2016-11-15 18:02:23', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'springfox.documentation.swagger.web.ApiResourceController.securityConfiguration', null, '<200 OK,springfox.documentation.swagger.web.SecurityConfiguration@7549d30e,{}>', '0', 'http://localhost:8086/hunt-admin/swagger-resources/configuration/security', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2636', '0', '2016-11-15 18:02:27', '2016-11-15 18:02:27', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.data', '_ = 1479204129942 | ', 'system/data', '0', 'http://localhost:8086/hunt-admin/system/data', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2637', '0', '2016-11-15 18:02:27', '2016-11-15 18:02:27', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=5, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=2, rank=0, createTime=Mon Oct 31 22:08:48 AWST 2016, updateTime=Mon Oct 31 23:51:11 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=2, rank=0, createTime=Mon Oct 31 22:09:19 AWST 2016, updateTime=Mon Oct 31 23:51:12 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=2, rank=0, createTime=Mon Oct 31 22:10:21 AWST 2016, updateTime=Mon Oct 31 23:51:13 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=4, description=\'是否开启ip拦截\', sysDataGroupId=3, sysDataGroupName=\'IP拦截\', keyValue=\'true\', keyName=\'ip_forbidden\', isFinal=1, rank=0, createTime=Sat Nov 05 18:55:58 AWST 2016, updateTime=Thu Nov 10 19:26:15 AWST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=5, description=\'系统root路径\', sysDataGroupId=4, sysDataGroupName=\'系统\', keyValue=\'/hunt-admin\', keyName=\'basePath\', isFinal=1, rank=0, createTime=Tue Nov 15 17:34:27 AWST 2016, updateTime=Tue Nov 15 17:34:27 AWST 2016, createBy=0, updateBy=0, status=1}]}', '93', 'http://localhost:8086/hunt-admin/system/data/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2638', '0', '2016-11-15 18:02:27', '2016-11-15 18:02:27', '0', '0', '1', '0:0:0:0:0:0:0:1', null, 'com.hunt.controller.SystemController.dataGroupList', null, '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 AWST 2016\', updateTime=\'Mon Oct 31 22:08:28 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 AWST 2016\', updateTime=\'Mon Oct 31 22:09:38 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'3\', description=\'是否开启Ip拦截\', parentId=\'0\', name=\'IP拦截\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Nov 05 18:47:22 AWST 2016\', updateTime=\'Sat Nov 05 18:47:22 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'4\', description=\'系统配置信息\', parentId=\'0\', name=\'系统\', isFinal=\'2\', rank=\'0\', createTime=\'Tue Nov 15 17:33:57 AWST 2016\', updateTime=\'Tue Nov 15 17:33:57 AWST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]', '15', 'http://localhost:8086/hunt-admin/system/dataGroup/list', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');

-- ----------------------------
-- Table structure for sys_login_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_status`;
CREATE TABLE `sys_login_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `session_id` varchar(256) DEFAULT NULL COMMENT 'session id',
  `session_expires` datetime DEFAULT NULL COMMENT 'session过期时间',
  `sys_user_login_name` varchar(256) DEFAULT NULL COMMENT '登录名',
  `sys_user_zh_name` varchar(256) DEFAULT NULL COMMENT '中文名',
  `last_login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `platform` tinyint(4) DEFAULT NULL COMMENT '登录平台 1:web 2:android 3:ios',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更热人',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_status
-- ----------------------------
INSERT INTO `sys_login_status` VALUES ('1', '1', 'shiro-session-3899310f-ffbd-4e31-8a48-8757dd3ee76a', '2016-11-30 21:28:07', 'admin', 'admin', null, '1', '0', '2016-10-31 21:28:07', '2016-10-31 21:28:07', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('2', '1', 'shiro-session-2ddf3787-909a-477c-846c-262e8eff01c8', '2016-11-30 22:36:45', 'admin', 'admin', '2016-10-31 21:28:07', '1', '0', '2016-10-31 22:36:45', '2016-10-31 22:36:45', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('3', '1', 'shiro-session-55fc131f-65d4-49f6-98dc-4a5154a31cdb', '2016-11-30 22:53:05', 'admin', 'admin', '2016-10-31 22:36:45', '1', '0', '2016-10-31 22:53:05', '2016-10-31 22:53:05', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('4', '1', 'shiro-session-dca16dbf-c520-4fcd-99d7-d86d08781093', '2016-11-30 23:08:56', 'admin', 'admin', '2016-10-31 22:53:05', '1', '0', '2016-10-31 23:08:55', '2016-10-31 23:08:55', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('5', '1', 'shiro-session-dca16dbf-c520-4fcd-99d7-d86d08781093', '2016-11-30 23:09:54', 'admin', 'admin', '2016-10-31 23:08:55', '1', '0', '2016-10-31 23:09:54', '2016-10-31 23:09:54', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('6', '2', 'shiro-session-dca16dbf-c520-4fcd-99d7-d86d08781093', '2016-11-30 23:16:32', 'admin2', 'admin2管理员', null, '1', '0', '2016-10-31 23:16:32', '2016-10-31 23:16:32', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('7', '1', 'shiro-session-33214fe2-99c4-4130-9223-ed4bdea6aafc', '2016-11-30 23:23:06', 'admin', 'admin', '2016-10-31 23:09:54', '1', '0', '2016-10-31 23:23:06', '2016-10-31 23:23:06', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('8', '2', 'shiro-session-4d6e2ae1-e848-447e-8aa9-39137eab5516', '2016-11-30 23:23:28', 'admin2', 'admin2管理员', '2016-10-31 23:16:32', '1', '0', '2016-10-31 23:23:28', '2016-10-31 23:23:28', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('9', '1', 'shiro-session-d2124a54-7270-4709-b057-504a2cf84505', '2016-11-30 23:24:53', 'admin', 'admin', '2016-10-31 23:23:06', '1', '0', '2016-10-31 23:24:52', '2016-10-31 23:24:52', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('10', '1', 'shiro-session-fe5fcb09-2972-421c-ae6e-154698ae6989', '2016-11-30 23:30:43', 'admin', 'admin', '2016-10-31 23:24:52', '1', '0', '2016-10-31 23:30:42', '2016-10-31 23:30:42', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('11', '2', 'shiro-session-b7fa75be-39ce-43cc-b3f3-7664e7754042', '2016-11-30 23:31:33', 'admin2', 'admin2管理员', '2016-10-31 23:23:28', '1', '0', '2016-10-31 23:31:32', '2016-10-31 23:31:32', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('12', '1', 'shiro-session-e4e27416-0b81-4cdd-8ee1-31b56e940d14', '2016-12-01 22:43:28', 'admin', 'admin', '2016-10-31 23:30:42', '1', '0', '2016-11-01 22:43:28', '2016-11-01 22:43:28', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('13', '1', 'shiro-session-64f5b002-566f-4fef-8859-26cbecddbeb7', '2016-12-01 23:05:03', 'admin', 'admin', '2016-11-01 22:43:28', '1', '0', '2016-11-01 23:05:03', '2016-11-01 23:05:03', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('14', '1', 'shiro-session-893d6bc0-a17e-4540-a3c5-df92e31b5583', '2016-12-01 23:05:30', 'admin', 'admin', '2016-11-01 23:05:03', '1', '0', '2016-11-01 23:05:30', '2016-11-01 23:05:30', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('15', '1', 'shiro-session-5926b412-5341-490f-8b9f-b54bc2c5713d', '2016-12-01 23:07:02', 'admin', 'admin', '2016-11-01 23:05:30', '1', '0', '2016-11-01 23:07:02', '2016-11-01 23:07:02', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('16', '1', 'shiro-session-14fd1318-35b0-4714-a407-55d6e48c6eff', '2016-12-01 23:07:38', 'admin', 'admin', '2016-11-01 23:07:02', '1', '0', '2016-11-01 23:07:37', '2016-11-01 23:07:37', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('17', '2', 'shiro-session-aba02aaf-327d-4b23-8310-daf45dbc4a9b', '2016-12-01 23:09:24', 'admin2', 'admin2管理员', '2016-10-31 23:31:32', '1', '0', '2016-11-01 23:09:24', '2016-11-01 23:09:24', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('18', '1', 'shiro-session-0ad57428-db80-472a-87e7-e2751f0caddb', '2016-12-05 18:30:03', 'admin', 'admin', '2016-11-01 23:07:37', '1', '0', '2016-11-05 18:30:02', '2016-11-05 18:30:02', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('19', '1', 'shiro-session-eab67df3-dadf-4702-9ba3-dca19a814e78', '2016-12-05 20:22:52', 'admin', 'admin', '2016-11-05 18:30:02', '1', '0', '2016-11-05 20:22:51', '2016-11-05 20:22:51', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('20', '1', 'shiro-session-3608f0cf-1e09-4a4b-ae42-4aab1cb57f0c', '2016-12-05 20:23:27', 'admin', 'admin', '2016-11-05 20:22:51', '1', '0', '2016-11-05 20:23:27', '2016-11-05 20:23:27', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('21', '1', 'shiro-session-0b288d19-9c9c-4ef5-beef-015e3ef0bd12', '2016-12-05 20:31:06', 'admin', 'admin', '2016-11-05 20:23:27', '1', '0', '2016-11-05 20:31:06', '2016-11-05 20:31:06', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('22', '1', 'shiro-session-0d66a595-441b-48d3-8fa6-acebd6333396', '2016-12-05 20:32:49', 'admin', 'admin', '2016-11-05 20:31:06', '1', '0', '2016-11-05 20:32:49', '2016-11-05 20:32:49', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('23', '1', 'shiro-session-080ed509-f6f9-42d6-bc06-d813e03a77d0', '2016-12-05 20:34:38', 'admin', 'admin', '2016-11-05 20:32:49', '1', '0', '2016-11-05 20:34:38', '2016-11-05 20:34:38', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('24', '1', 'shiro-session-080ed509-f6f9-42d6-bc06-d813e03a77d0', '2016-12-05 21:20:48', 'admin', 'admin', '2016-11-05 20:34:38', '1', '0', '2016-11-05 21:20:48', '2016-11-05 21:20:48', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('25', '1', 'shiro-session-78d58178-0876-4ae8-9f1c-fe9dbf85a7e5', '2016-12-05 21:22:16', 'admin', 'admin', '2016-11-05 21:20:48', '1', '0', '2016-11-05 21:22:16', '2016-11-05 21:22:16', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('26', '1', 'shiro-session-efa74aa8-9a22-4238-a432-f8e94b8b9eec', '2016-12-05 21:23:10', 'admin', 'admin', '2016-11-05 21:22:16', '1', '0', '2016-11-05 21:23:10', '2016-11-05 21:23:10', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('27', '1', 'shiro-session-423a0af7-a5fa-49e2-933c-35845f2a47e3', '2016-12-05 23:39:51', 'admin', 'admin', '2016-11-05 21:23:10', '1', '0', '2016-11-05 23:39:50', '2016-11-05 23:39:50', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('28', '1', 'shiro-session-7585bd74-67a3-445e-88b7-5047b4d7f2f3', '2016-12-05 23:40:03', 'admin', 'admin', '2016-11-05 23:39:50', '1', '0', '2016-11-05 23:40:02', '2016-11-05 23:40:02', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('29', '1', 'shiro-session-0b785adc-6f5b-42bc-a9dd-110aebe6a4be', '2016-12-05 23:41:42', 'admin', 'admin', '2016-11-05 23:40:02', '1', '0', '2016-11-05 23:41:41', '2016-11-05 23:41:41', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('30', '1', 'shiro-session-15bf649e-4aa9-48f5-be09-1e23083a57c3', '2016-12-05 23:46:13', 'admin', 'admin', '2016-11-05 23:41:41', '1', '0', '2016-11-05 23:46:13', '2016-11-05 23:46:13', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('31', '1', 'shiro-session-1b6baf53-fe41-4a48-b041-f459b71c19cd', '2016-12-06 15:06:39', 'admin', 'admin', '2016-11-05 23:46:13', '1', '0', '2016-11-06 15:06:38', '2016-11-06 15:06:38', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('32', '1', 'shiro-session-864209cb-6f24-44a1-a32a-79030409f90d', '2016-12-10 11:37:47', 'admin', 'admin', '2016-11-06 15:06:38', '1', '0', '2016-11-10 11:37:46', '2016-11-10 11:37:46', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('33', '1', 'shiro-session-748dc36e-e90c-4880-bd83-96530a31cda7', '2016-12-10 13:45:26', 'admin', 'admin', '2016-11-10 11:37:46', '1', '0', '2016-11-10 13:45:25', '2016-11-10 13:45:25', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('34', '1', 'shiro-session-22b08424-5a89-40e0-9878-c6b519a66b63', '2016-12-10 13:46:35', 'admin', 'admin', '2016-11-10 13:45:25', '1', '0', '2016-11-10 13:46:34', '2016-11-10 13:46:34', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('35', '1', 'shiro-session-3505efcc-0997-4c3f-b6f2-16f685cd2a82', '2016-12-10 13:47:43', 'admin', 'admin', '2016-11-10 13:46:34', '1', '0', '2016-11-10 13:47:43', '2016-11-10 13:47:43', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('36', '1', 'shiro-session-52b48078-ae6c-46c3-b009-7b8a9a674110', '2016-12-10 14:17:15', 'admin', 'admin', '2016-11-10 13:47:43', '1', '0', '2016-11-10 14:17:15', '2016-11-10 14:17:15', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('37', '1', 'shiro-session-5f478171-f178-45c5-9c55-7353b9c09c0b', '2016-12-10 14:17:51', 'admin', 'admin', '2016-11-10 14:17:15', '1', '0', '2016-11-10 14:17:51', '2016-11-10 14:17:51', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('38', '1', 'shiro-session-717e545d-24dc-473a-98c4-9a634fd0e36d', '2016-12-10 14:29:20', 'admin', 'admin', '2016-11-10 14:17:51', '1', '0', '2016-11-10 14:29:20', '2016-11-10 14:29:20', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('39', '1', 'shiro-session-717e545d-24dc-473a-98c4-9a634fd0e36d', '2016-12-10 14:30:30', 'admin', 'admin', '2016-11-10 14:29:20', '1', '0', '2016-11-10 14:30:29', '2016-11-10 14:30:29', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('40', '1', 'shiro-session-717e545d-24dc-473a-98c4-9a634fd0e36d', '2016-12-10 16:34:43', 'admin', 'admin', '2016-11-10 14:30:29', '1', '0', '2016-11-10 16:34:43', '2016-11-10 16:34:43', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('41', '1', 'shiro-session-1974543e-2a46-4cae-82aa-25496d0b2c53', '2016-12-10 16:45:23', 'admin', 'admin', '2016-11-10 16:34:43', '1', '0', '2016-11-10 16:45:22', '2016-11-10 16:45:22', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('42', '1', 'shiro-session-aaac31f9-caec-4807-9189-c3ac9e03339c', '2016-12-10 16:59:15', 'admin', 'admin', '2016-11-10 16:45:22', '1', '0', '2016-11-10 16:59:15', '2016-11-10 16:59:15', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('43', '1', 'shiro-session-b4b92ce2-05f0-46dc-8252-2f55d4c51296', '2016-12-10 17:17:23', 'admin', 'admin', '2016-11-10 16:59:15', '1', '0', '2016-11-10 17:17:23', '2016-11-10 17:17:23', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('44', '1', 'shiro-session-78e62fe6-b569-4a49-a46d-45796f1273fd', '2016-12-10 17:50:14', 'admin', 'admin', '2016-11-10 17:17:23', '1', '0', '2016-11-10 17:50:13', '2016-11-10 17:50:13', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('45', '1', 'shiro-session-78e62fe6-b569-4a49-a46d-45796f1273fd', '2016-12-10 17:50:57', 'admin', 'admin', '2016-11-10 17:50:13', '1', '0', '2016-11-10 17:50:57', '2016-11-10 17:50:57', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('46', '1', 'shiro-session-f0b311ab-5ffc-4794-9af6-c5ec8a3c4db6', '2016-12-10 17:51:40', 'admin', 'admin', '2016-11-10 17:50:57', '1', '0', '2016-11-10 17:51:40', '2016-11-10 17:51:40', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('47', '1', 'shiro-session-abecfc69-7eae-4f03-a9c6-75d44b8b6dbc', '2016-12-10 17:52:35', 'admin', 'admin', '2016-11-10 17:51:40', '1', '0', '2016-11-10 17:52:34', '2016-11-10 17:52:34', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('48', '1', 'shiro-session-21026572-820c-4578-8fa7-74904e4f41c9', '2016-12-10 17:54:18', 'admin', 'admin', '2016-11-10 17:52:34', '1', '0', '2016-11-10 17:54:18', '2016-11-10 17:54:18', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('49', '1', 'shiro-session-94132116-fb76-4e30-bbbc-22843f2fd7ee', '2016-12-10 17:57:24', 'admin', 'admin', '2016-11-10 17:54:18', '1', '0', '2016-11-10 17:57:23', '2016-11-10 17:57:23', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('50', '1', 'shiro-session-f5e74dc0-e213-4ae0-a1f4-bf55a495d2d6', '2016-12-10 18:02:08', 'admin', 'admin', '2016-11-10 17:57:23', '1', '0', '2016-11-10 18:02:07', '2016-11-10 18:02:07', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('51', '1', 'shiro-session-f5e74dc0-e213-4ae0-a1f4-bf55a495d2d6', '2016-12-10 18:04:46', 'admin', 'admin', '2016-11-10 18:02:07', '1', '0', '2016-11-10 18:04:45', '2016-11-10 18:04:45', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('52', '1', 'shiro-session-64df6ed6-ca8f-45da-b6da-754bd8f27052', '2016-12-10 18:06:56', 'admin', 'admin', '2016-11-10 18:04:45', '1', '0', '2016-11-10 18:06:55', '2016-11-10 18:06:55', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('53', '1', 'shiro-session-60253073-a076-4b55-b50a-2e97d16a83d0', '2016-12-10 18:12:05', 'admin', 'admin', '2016-11-10 18:06:55', '1', '0', '2016-11-10 18:12:04', '2016-11-10 18:12:04', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('54', '1', 'shiro-session-60253073-a076-4b55-b50a-2e97d16a83d0', '2016-12-10 18:13:45', 'admin', 'admin', '2016-11-10 18:12:04', '1', '0', '2016-11-10 18:13:44', '2016-11-10 18:13:44', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('55', '1', 'shiro-session-23d02c2b-b71b-4c42-90f0-447fc68e2e0f', '2016-12-10 18:15:58', 'admin', 'admin', '2016-11-10 18:13:44', '1', '0', '2016-11-10 18:15:57', '2016-11-10 18:15:57', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('56', '1', 'shiro-session-056f2186-ed3d-43aa-b6a0-b467511bc890', '2016-12-10 18:17:15', 'admin', 'admin', '2016-11-10 18:15:57', '1', '0', '2016-11-10 18:17:15', '2016-11-10 18:17:15', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('57', '1', 'shiro-session-718a9db8-3f23-49aa-9521-7c23c9acb9b1', '2016-12-10 18:19:18', 'admin', 'admin', '2016-11-10 18:17:15', '1', '0', '2016-11-10 18:19:17', '2016-11-10 18:19:17', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('58', '1', 'shiro-session-709582eb-7103-4bc1-afa4-f015752135b2', '2016-12-10 18:54:42', 'admin', 'admin', '2016-11-10 18:19:17', '1', '0', '2016-11-10 18:54:41', '2016-11-10 18:54:41', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('59', '1', 'shiro-session-8059744f-576c-4924-8afe-1a16295e1f3b', '2016-12-10 18:55:52', 'admin', 'admin', '2016-11-10 18:54:41', '1', '0', '2016-11-10 18:55:51', '2016-11-10 18:55:51', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('60', '1', 'shiro-session-8059744f-576c-4924-8afe-1a16295e1f3b', '2016-12-10 18:57:10', 'admin', 'admin', '2016-11-10 18:55:51', '1', '0', '2016-11-10 18:57:09', '2016-11-10 18:57:09', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('61', '1', 'shiro-session-779a4551-8b12-46d5-99c0-887d0ae7a574', '2016-12-10 18:58:51', 'admin', 'admin', '2016-11-10 18:57:09', '1', '0', '2016-11-10 18:58:50', '2016-11-10 18:58:50', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('62', '1', 'shiro-session-92e61fef-75e5-40be-82e7-6c5ea30151ad', '2016-12-10 19:05:05', 'admin', 'admin', '2016-11-10 18:58:50', '1', '0', '2016-11-10 19:05:05', '2016-11-10 19:05:05', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('63', '1', 'shiro-session-2236f65f-c4f0-4675-bc83-14a4a7a6557c', '2016-12-10 19:13:51', 'admin', 'admin', '2016-11-10 19:05:05', '1', '0', '2016-11-10 19:13:51', '2016-11-10 19:13:51', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('64', '1', 'shiro-session-9e54b677-ce8a-4be1-b9ae-dfc0bf67375a', '2016-12-10 19:16:26', 'admin', 'admin', '2016-11-10 19:13:51', '1', '0', '2016-11-10 19:16:25', '2016-11-10 19:16:25', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('65', '1', 'shiro-session-a5f22afa-a57f-4c84-adc9-62542e1ac2a6', '2016-12-10 19:19:15', 'admin', 'admin', '2016-11-10 19:16:25', '1', '0', '2016-11-10 19:19:15', '2016-11-10 19:19:15', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('66', '1', 'shiro-session-899d3869-b9ae-4ca8-abe3-ffa1fab77f64', '2016-12-10 19:24:32', 'admin', 'admin', '2016-11-10 19:19:15', '1', '0', '2016-11-10 19:24:32', '2016-11-10 19:24:32', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('67', '1', 'shiro-session-899d3869-b9ae-4ca8-abe3-ffa1fab77f64', '2016-12-10 19:25:59', 'admin', 'admin', '2016-11-10 19:24:32', '1', '0', '2016-11-10 19:25:59', '2016-11-10 19:25:59', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('68', '1', 'shiro-session-7b709e05-1a9e-48d0-9ad7-2430c269bc50', '2016-12-12 14:14:23', 'admin', 'admin', '2016-11-10 19:25:59', '1', '0', '2016-11-12 14:14:22', '2016-11-12 14:14:22', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('69', '1', 'shiro-session-66a50393-bd5d-4360-9ad1-1227f786668d', '2016-12-15 15:44:27', 'admin', 'admin', '2016-11-12 14:14:22', '1', '0', '2016-11-15 15:44:27', '2016-11-15 15:44:27', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES ('70', '1', 'shiro-session-207374bd-4324-4087-88f4-fc675436f8b7', '2016-12-15 16:56:57', 'admin', 'admin', '2016-11-15 15:44:27', '1', '0', '2016-11-15 16:56:56', '2016-11-15 16:56:56', '0', '0', '1');
INSERT INTO `sys_login_status` VALUES ('71', '2', 'shiro-session-ba247205-7150-4f7a-8571-a69f5572dd30', '2016-12-15 17:51:05', 'admin2', 'admin2管理员', null, '1', '0', '2016-11-15 17:51:05', '2016-11-15 17:51:05', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '名称',
  `description` varchar(1024) DEFAULT NULL COMMENT '描述',
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `parent_id` bigint(20) DEFAULT '0',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  `full_name` varchar(256) DEFAULT NULL COMMENT '全称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '系统', '系统', '2', '0', '0', '2016-10-29 14:21:13', '2016-10-31 23:51:20', '0', '0', '1', '系统');
INSERT INTO `sys_organization` VALUES ('2', 'xxx集团', 'xxx集团', '2', '1', '0', '2016-10-29 14:21:34', '2016-10-31 23:51:20', '0', '0', '1', 'xxx集团');
INSERT INTO `sys_organization` VALUES ('3', 'xxx深圳分公司', 'xxx深圳分公司', '2', '2', '0', '2016-10-29 14:26:27', '2016-10-31 23:51:21', '0', '0', '1', 'xxx深圳分公司');
INSERT INTO `sys_organization` VALUES ('4', 'xxx长沙分公司', 'xxx长沙分公司', '2', '2', '0', '2016-10-29 14:27:18', '2016-10-31 23:51:22', '0', '0', '1', 'xxx长沙分公司');
INSERT INTO `sys_organization` VALUES ('5', '财务部', 'xxx深圳分公司财务部', '2', '3', '0', '2016-10-29 14:27:42', '2016-10-31 23:51:23', '0', '0', '1', 'xxx深圳分公司财务部');
INSERT INTO `sys_organization` VALUES ('6', '研发部', 'xxx深圳分公司研发部', '2', '3', '0', '2016-10-29 14:28:38', '2016-10-31 23:51:24', '0', '0', '1', 'xxx深圳分公司研发部');
INSERT INTO `sys_organization` VALUES ('7', '市场部', 'xxx深圳分公司市场部', '2', '3', '0', '2016-10-29 14:28:49', '2016-10-31 23:51:24', '0', '0', '1', 'xxx深圳分公司市场部');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `code` varchar(256) DEFAULT NULL COMMENT '编码',
  `sys_permission_group_id` bigint(20) DEFAULT NULL COMMENT '分组id',
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '新增', '新增用户', 'user:insert', '1', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('2', '删除', '删除用户', 'user:delete', '1', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('3', '更新', '更新用户', 'user:update', '1', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('4', '查询', '查询用户', 'user:select', '1', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('5', '列表', '查询用户列表', 'user:list', '1', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('6', '新增', '新增权限', 'permission:insert', '2', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('7', '删除', '删除权限', 'permission:delete', '2', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('8', '更新', '更新权限', 'permission:update', '2', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('9', '查询', '查询权限', 'permission:select', '2', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('10', '列表', '查询权限列表', 'permission:list', '2', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('11', '新增', '新增角色', 'role:insert', '3', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('12', '删除', '删除角色', 'role:delete', '3', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('13', '更新', '更新角色', 'role:update', '3', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('14', '查询', '查询角色', 'role:select', '3', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('15', '列表', '查询角色列表', 'role:list', '3', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('16', '新增', '新增组织机构', 'organization:insert', '4', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('17', '删除', '删除组织机构', 'organization:delete', '4', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('18', '更新', '更新组织机构', 'organization:update', '4', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('19', '查询', '查询组织机构', 'organization:select', '4', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('20', '列表', '查询组织机构列表', 'organization:list', '4', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('21', '新增', '新增职位', 'job:insert', '5', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('22', '删除', '删除职位', 'job:delete', '5', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('23', '更新', '更新职位', 'job:update', '5', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('24', '查询', '查询职位', 'job:select', '5', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('25', '列表', '查询职位列表', 'job:list', '5', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('26', '新增', '新增字典', 'data:insert', '6', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('27', '删除', '删除字典', 'data:delete', '6', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('28', '更新', '更新字典', 'data:update', '6', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('29', '查询', '查询字典', 'data:select', '6', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('30', '列表', '查询字典列表', 'data:list', '6', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('31', '启用', '启用用户', 'user:enable', '1', '2', '0', '2016-10-29 11:58:15', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('32', '禁用', '禁用用户', 'user:forbidden', '1', '2', '0', '2016-10-29 11:58:45', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('33', '密码', '修改密码', 'user:updatePassword', '1', '2', '0', '2016-10-29 12:00:01', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('34', '查看数据库监控', '查看数据库监控', 'db:select', '7', '2', '0', '2016-10-31 21:31:34', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('35', '下线', '下线用户', 'user:loginout', '1', '2', '0', '2016-10-31 21:32:45', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('36', '用户在线列表', '用户在线列表', 'user:loginStatu:list', '1', '2', '0', '2016-10-31 21:33:26', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('37', '新建权限组', '新建权限组', 'permission:group:insert', '2', '2', '0', '2016-10-31 21:34:12', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('38', '权限组列表', '权限组列表', 'permission:group:list', '2', '2', '0', '2016-10-31 21:35:10', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('39', '新增', '新增IP', 'ip:insert', '8', '2', '0', '2016-10-31 21:44:18', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('40', '更新', '更新ip', 'ip:update', '8', '2', '0', '2016-10-31 21:44:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('41', '删除', '删除ip', 'ip:delete', '8', '2', '0', '2016-10-31 21:44:59', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('42', '查看', '查看ip', 'ip:select', '8', '2', '0', '2016-10-31 21:45:14', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('43', '列表', 'ip列表', 'ip:list', '8', '2', '0', '2016-10-31 21:45:37', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('44', '字典组列表', '字典组列表', 'data:group:list', '6', '2', '0', '2016-10-31 22:25:32', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('45', '新增字典组', '新增字典组', 'data:group:insert', '6', '2', '0', '2016-10-31 22:26:24', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('46', '列表', '列表', 'log:list', '9', '2', '0', '2016-10-31 23:48:43', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES ('47', '引导', '引导界面', 'system:index', '10', '1', '0', '2016-11-01 22:45:40', '2016-11-01 22:45:40', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_permission_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_group`;
CREATE TABLE `sys_permission_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父级id',
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission_group
-- ----------------------------
INSERT INTO `sys_permission_group` VALUES ('1', '用户管理', '用户数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('2', '权限管理', '权限数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('3', '角色管理', '角色数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('4', '组织机构管理', '组织机构数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('5', '职位管理', '职位数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('6', '字典管理', '字典数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('7', '数据库', '数据库监控', '0', '2', '0', '2016-10-31 21:31:01', '2016-10-31 21:31:01', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('8', '安全', '安全', '0', '2', '0', '2016-10-31 21:43:47', '2016-10-31 21:43:47', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('9', '日志', '日志', '0', '2', '0', '2016-10-31 23:47:47', '2016-10-31 23:47:47', '0', '0', '1');
INSERT INTO `sys_permission_group` VALUES ('10', '其他', '其他', '0', '2', '0', '2016-11-01 22:44:42', '2016-11-01 22:44:42', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `is_final` int(11) DEFAULT '1' COMMENT '是否可删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '超级管理员', '0', '2', '2016-10-29 14:18:43', '2016-10-31 23:51:57', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('2', '管理员', '管理员', '0', '1', '2016-10-29 14:19:05', '2016-11-01 23:11:39', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3', '分公司总经理', '分公司总经理', '0', '2', '2016-10-29 14:36:24', '2016-10-31 23:51:58', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('4', '分公司部门经理', '分公司部门经理', '0', '2', '2016-10-29 14:37:46', '2016-10-31 23:51:59', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('5', '集团总经理', '集团总经理', '0', '2', '2016-10-29 14:59:17', '2016-10-31 23:51:59', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_role_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_organization`;
CREATE TABLE `sys_role_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_organization_id` bigint(20) DEFAULT NULL COMMENT '组织id',
  `sys_role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级id',
  `name` varchar(256) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  `is_final` tinyint(4) DEFAULT NULL COMMENT '是否能修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_organization
-- ----------------------------
INSERT INTO `sys_role_organization` VALUES ('1', '0', '0', '0', '系统', '系统', '系统', '0', '2016-10-29 14:53:47', '2016-10-31 23:52:09', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES ('2', '2', '1', '1', '系统超级管理员', '系统超级管理员', '系统超级管理员', '0', '2016-10-29 14:54:22', '2016-10-31 23:52:09', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES ('3', '2', '5', '1', '集团总经理', '集团总经理', '集团总经理', '0', '2016-10-29 15:01:06', '2016-10-31 23:52:10', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES ('4', '3', '3', '3', '深圳分公司总经理', 'xxx深圳分公司总经理', 'xxx深圳分公司总经理', '0', '2016-10-29 15:01:47', '2016-10-31 23:52:11', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES ('5', '6', '4', '4', 'xxx深圳分公司研发部经理', 'xxx深圳分公司研发部经理', 'xxx深圳分公司研发部经理', '0', '2016-10-29 15:02:56', '2016-10-31 23:52:11', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES ('6', '2', '2', '2', '系统管理员', '系统管理员', '系统管理员', '0', '2016-10-29 15:07:01', '2016-10-31 23:52:12', '0', '0', '1', '2');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_permission_id` bigint(20) DEFAULT NULL COMMENT '权限id',
  `sys_role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('2', '2', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('3', '3', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('4', '4', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('5', '5', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('6', '31', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('7', '32', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('8', '33', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('9', '6', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('10', '7', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('11', '8', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('12', '9', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('13', '10', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('14', '11', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('15', '12', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('16', '13', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('17', '14', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('18', '15', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('19', '16', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('20', '17', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('21', '18', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('22', '19', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('23', '20', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('24', '21', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('25', '22', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('26', '23', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('27', '24', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('28', '25', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('29', '26', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('30', '27', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('31', '28', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('32', '29', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('33', '30', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('34', '1', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('35', '3', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('36', '4', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('37', '5', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('38', '31', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('39', '32', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('40', '33', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('41', '6', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('42', '8', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('43', '9', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('44', '10', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('45', '11', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('46', '13', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('47', '14', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('48', '15', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('49', '16', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('50', '18', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('51', '19', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('52', '20', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('53', '21', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('54', '23', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('55', '24', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('56', '25', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('57', '26', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('58', '28', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('59', '29', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('60', '30', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('61', '5', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('62', '9', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('63', '10', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('64', '14', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('65', '15', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('66', '19', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('67', '20', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('68', '24', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('69', '25', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('70', '29', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('71', '30', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('72', '4', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('73', '5', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('74', '9', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('75', '10', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('76', '14', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('77', '15', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('78', '19', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('79', '20', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('80', '24', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('81', '25', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('82', '29', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('83', '30', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('84', '4', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('85', '25', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('86', '24', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('87', '4', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('88', '5', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('89', '9', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('90', '10', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('91', '14', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('92', '15', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('93', '19', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('94', '20', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('95', '29', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('96', '30', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('97', '4', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('98', '5', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('99', '9', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('100', '10', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('101', '14', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('102', '15', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('103', '20', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('104', '19', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('105', '24', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('106', '25', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('107', '29', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('108', '30', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('109', '5', '2', '0', '2016-10-31 23:10:32', '2016-10-31 23:31:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('110', '5', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('111', '10', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('112', '15', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('113', '20', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('114', '25', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('115', '30', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('116', '43', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('117', '5', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('118', '10', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('119', '15', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('120', '20', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('121', '25', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('122', '30', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('123', '43', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('124', '38', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('125', '44', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('126', '5', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('127', '10', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('128', '15', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('129', '20', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('130', '25', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('131', '30', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('132', '43', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('133', '38', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('134', '44', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('135', '36', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('136', '5', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('137', '10', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('138', '15', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('139', '20', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('140', '25', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('141', '30', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('142', '43', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('143', '38', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('144', '44', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('145', '36', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('146', '34', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('147', '1', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('148', '2', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('149', '3', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('150', '4', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('151', '5', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('152', '31', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('153', '32', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('154', '33', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('155', '6', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('156', '7', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('157', '8', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('158', '9', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('159', '10', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('160', '11', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('161', '12', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('162', '13', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('163', '14', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('164', '15', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('165', '16', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('166', '17', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('167', '18', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('168', '19', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('169', '20', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('170', '21', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('171', '22', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('172', '23', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('173', '24', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('174', '25', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('175', '26', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('176', '27', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('177', '28', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('178', '29', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('179', '30', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('180', '35', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('181', '36', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('182', '37', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('183', '38', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('184', '44', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('185', '45', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('186', '34', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('187', '39', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('188', '40', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('189', '41', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('190', '42', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('191', '43', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('192', '46', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('193', '5', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('194', '10', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('195', '15', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('196', '20', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('197', '25', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('198', '30', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('199', '43', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('200', '38', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('201', '44', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('202', '36', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('203', '34', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('204', '46', '2', '0', '2016-10-31 23:50:17', '2016-11-01 23:12:01', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('205', '5', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('206', '10', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('207', '15', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('208', '20', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('209', '25', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('210', '30', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('211', '38', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('212', '44', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('213', '36', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('214', '34', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('215', '46', '2', '0', '2016-11-01 23:12:01', '2016-11-01 23:13:37', '0', '0', '2');
INSERT INTO `sys_role_permission` VALUES ('216', '5', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('217', '10', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('218', '15', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('219', '20', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('220', '25', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('221', '30', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('222', '38', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('223', '44', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('224', '36', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('225', '34', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('226', '46', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');
INSERT INTO `sys_role_permission` VALUES ('227', '43', '2', '0', '2016-11-01 23:13:37', '2016-11-01 23:13:37', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(256) DEFAULT NULL COMMENT '登陆名',
  `zh_name` varchar(256) DEFAULT NULL COMMENT '中文名',
  `en_name` varchar(256) DEFAULT NULL COMMENT '英文名',
  `sex` int(11) DEFAULT '0' COMMENT '性别',
  `birth` varchar(256) DEFAULT NULL COMMENT '生日',
  `email` varchar(256) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(256) DEFAULT NULL COMMENT '电话',
  `address` varchar(1024) DEFAULT NULL COMMENT '地址',
  `password` varchar(256) DEFAULT NULL COMMENT '密码',
  `password_salt` varchar(256) DEFAULT NULL COMMENT '密码盐',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更热人',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除,3:禁用账号',
  `is_final` tinyint(4) DEFAULT NULL COMMENT '是否能修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', 'admin', '1', null, null, null, null, 'f893d078cee0c79c90e8747e1df8f54b', '0e1e5f9114dc4d60a7ea9e13c60bdff8', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:29', '0', '0', '1', '2');
INSERT INTO `sys_user` VALUES ('2', 'admin2', 'admin2管理员', 'admin2', '1', null, null, null, null, '2f38e9c59827c9d457a2d82d38ba4e37', 'b80407eb849f4cd88c89c3e59f97b089', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:30', '0', '0', '1', '2');

-- ----------------------------
-- Table structure for sys_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_permission`;
CREATE TABLE `sys_user_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) DEFAULT NULL,
  `sys_permission_id` bigint(20) DEFAULT NULL,
  `is_final` int(11) DEFAULT '1',
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_permission
-- ----------------------------
INSERT INTO `sys_user_permission` VALUES ('1', '1', '1', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('2', '1', '2', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('3', '1', '3', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('4', '1', '4', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('5', '1', '5', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('6', '1', '31', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('7', '1', '32', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('8', '1', '33', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('9', '1', '6', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('10', '1', '7', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('11', '1', '8', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('12', '1', '9', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('13', '1', '10', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('14', '1', '11', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('15', '1', '12', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('16', '1', '13', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('17', '1', '14', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('18', '1', '15', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('19', '1', '16', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('20', '1', '17', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('21', '1', '18', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('22', '1', '19', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('23', '1', '20', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('24', '1', '21', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('25', '1', '22', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('26', '1', '23', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('27', '1', '24', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('28', '1', '25', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('29', '1', '26', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('30', '1', '27', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('31', '1', '28', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('32', '1', '29', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('33', '1', '30', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('34', '2', '1', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('35', '2', '2', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('36', '2', '3', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('37', '2', '4', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('38', '2', '5', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('39', '2', '31', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('40', '2', '32', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('41', '2', '33', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('42', '2', '6', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('43', '2', '7', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('44', '2', '8', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('45', '2', '9', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('46', '2', '10', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('47', '2', '11', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('48', '2', '12', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('49', '2', '13', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('50', '2', '14', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('51', '2', '15', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('52', '2', '16', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('53', '2', '17', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('54', '2', '18', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('55', '2', '19', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('56', '2', '20', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('57', '2', '21', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('58', '2', '22', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('59', '2', '23', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('60', '2', '24', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('61', '2', '25', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('62', '2', '26', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('63', '2', '27', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('64', '2', '28', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('65', '2', '29', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('66', '2', '30', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('67', '1', '1', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('68', '1', '2', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('69', '1', '3', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('70', '1', '4', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('71', '1', '5', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('72', '1', '31', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('73', '1', '32', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('74', '1', '33', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('75', '1', '6', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('76', '1', '7', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('77', '1', '8', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('78', '1', '9', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('79', '1', '10', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('80', '1', '11', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('81', '1', '12', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('82', '1', '13', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('83', '1', '14', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('84', '1', '15', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('85', '1', '16', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('86', '1', '17', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('87', '1', '18', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('88', '1', '19', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('89', '1', '20', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('90', '1', '21', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('91', '1', '22', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('92', '1', '23', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('93', '1', '24', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('94', '1', '25', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('95', '1', '26', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('96', '1', '27', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('97', '1', '28', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('98', '1', '29', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('99', '1', '30', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('100', '1', '35', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('101', '1', '36', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('102', '1', '37', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('103', '1', '38', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('104', '1', '44', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('105', '1', '45', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('106', '1', '34', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('107', '1', '39', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('108', '1', '40', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('109', '1', '41', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('110', '1', '42', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission` VALUES ('111', '1', '43', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');

-- ----------------------------
-- Table structure for sys_user_role_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_organization`;
CREATE TABLE `sys_user_role_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) DEFAULT NULL,
  `sys_role_organization_id` bigint(20) DEFAULT NULL,
  `rank` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态,1:正常,2:删除',
  `is_final` tinyint(4) DEFAULT NULL COMMENT '是否能修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role_organization
-- ----------------------------
INSERT INTO `sys_user_role_organization` VALUES ('1', '1', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:54', '0', '0', '2', '2');
INSERT INTO `sys_user_role_organization` VALUES ('2', '2', '6', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:54', '0', '0', '2', '2');
INSERT INTO `sys_user_role_organization` VALUES ('3', '1', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:54', '0', '0', '2', '2');
INSERT INTO `sys_user_role_organization` VALUES ('6', '2', '6', '0', '2016-10-31 23:14:42', '2016-10-31 23:53:54', '0', '0', '1', '2');
INSERT INTO `sys_user_role_organization` VALUES ('7', '1', '2', '0', '2016-10-31 23:49:14', '2016-10-31 23:53:54', '0', '0', '1', '2');
