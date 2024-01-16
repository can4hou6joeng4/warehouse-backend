/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : db_warehouse

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 16/01/2024 08:33:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_info
-- ----------------------------
DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE `auth_info`  (
  `auth_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL COMMENT '父id为空或为0，表示一级权限',
  `auth_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_grade` int NULL DEFAULT NULL,
  `auth_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 模块 、2  列表、 3  按钮',
  `auth_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_order` int NULL DEFAULT NULL,
  `auth_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1 启用 、0 禁用',
  `create_by` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_info
-- ----------------------------
INSERT INTO `auth_info` VALUES (1, 0, '用户管理', '用户管理', 1, '1', NULL, NULL, 0, '1', 1, '2017-11-14 16:54:13', 1, '2017-11-14 16:54:17');
INSERT INTO `auth_info` VALUES (2, 1, '用户列表', '用户列表', 2, '2', '/user/index', NULL, 0, '1', 1, '2017-11-14 16:56:11', 1, '2017-11-14 16:56:15');
INSERT INTO `auth_info` VALUES (3, 2, '添加用户', '添加用户', 3, '3', NULL, 'user-addUser', 0, '1', 1, '2017-11-14 16:56:59', 1, '2017-11-14 16:57:02');
INSERT INTO `auth_info` VALUES (4, 0, '角色管理', '角色管理', 1, '1', NULL, NULL, 0, '1', 1, '2017-11-14 16:57:48', 1, '2017-11-14 16:57:52');
INSERT INTO `auth_info` VALUES (5, 4, '角色列表', '角色列表', 2, '2', '/role/index', NULL, 0, '1', 1, '2017-11-14 16:58:47', 1, '2017-11-14 16:58:50');
INSERT INTO `auth_info` VALUES (6, 5, '添加角色', '添加角色', 3, '3', NULL, 'role-addRole', 0, '1', 1, '2017-11-14 16:59:25', 1, '2017-11-14 16:59:29');
INSERT INTO `auth_info` VALUES (7, 0, '权限管理', '权限管理', 1, '1', NULL, NULL, 0, '0', 1, '2017-11-14 17:00:13', 1, '2017-11-14 17:00:18');
INSERT INTO `auth_info` VALUES (8, 7, '权限树', '权限树', 2, '2', '/auth/index', NULL, 0, '1', 1, '2017-11-14 17:02:11', 1, '2017-11-14 17:02:14');
INSERT INTO `auth_info` VALUES (9, 8, '添加权限', '添加权限', 3, '3', NULL, 'auth-addAuth', 0, '1', 1, '2017-11-14 17:03:48', 1, '2017-11-14 17:03:52');
INSERT INTO `auth_info` VALUES (10, 2, '删除用户', '删除用户', 3, '3', '', 'user-deleteUser', 0, '1', 1, '2017-11-23 11:56:17', NULL, NULL);
INSERT INTO `auth_info` VALUES (19, 0, '订单管理', '订单管理', 1, '1', '', '', 0, '0', 1, '2017-11-23 17:31:08', NULL, NULL);
INSERT INTO `auth_info` VALUES (20, 19, '订单列表', '订单列表', 2, '2', '', '', 0, '0', 1, '2017-11-23 17:31:42', NULL, NULL);
INSERT INTO `auth_info` VALUES (21, 20, '修改订单', '修改订单', 3, '3', '', 'updateOrder', 0, '0', 0, '2017-11-24 14:33:23', NULL, NULL);
INSERT INTO `auth_info` VALUES (22, 20, '删除订单', '删除订单', 3, '3', '', 'auth-delete', 0, '0', 0, '2017-11-24 14:34:32', NULL, NULL);
INSERT INTO `auth_info` VALUES (23, 2, '查询用户', '查询用户', 3, '3', '', 'user-findUser', 0, '1', 1, '2017-11-28 10:10:53', NULL, NULL);
INSERT INTO `auth_info` VALUES (24, 2, '修改用户', '修改用户信息', 3, '3', '', 'user-updateUser', 0, '1', 0, '2017-11-28 10:12:51', NULL, NULL);
INSERT INTO `auth_info` VALUES (25, 2, '分配角色', '分配角色', 3, '3', '', 'user-assignRole', 0, '1', 1, '2017-11-28 10:15:27', NULL, NULL);
INSERT INTO `auth_info` VALUES (26, 2, '更改权限', '更改权限', 3, '3', '', 'user-updateAuth', 0, '1', 1, '2017-11-28 10:16:07', NULL, NULL);
INSERT INTO `auth_info` VALUES (27, 5, '修改角色', '修改角色', 3, '3', '', 'role-updateRole', 0, '1', 1, '2017-11-28 10:16:40', NULL, NULL);
INSERT INTO `auth_info` VALUES (28, 5, '查询角色', '查询角色', 3, '3', '', 'role-findRole', 0, '1', 1, '2017-11-28 10:17:12', NULL, NULL);
INSERT INTO `auth_info` VALUES (30, 5, '删除角色', '删除角色', 3, '3', '', 'role-deleteRole', 0, '1', 1, '2017-11-28 10:23:14', NULL, NULL);
INSERT INTO `auth_info` VALUES (31, 5, '更改权限', '更改权限', 3, '3', '', 'role-updateAuth', 0, '1', 1, '2017-11-28 10:24:35', NULL, NULL);
INSERT INTO `auth_info` VALUES (32, 8, '修改权限', '修改权限', 3, '3', '', 'auth-updateAuth', 0, '1', 1, '2017-11-28 10:25:08', NULL, NULL);
INSERT INTO `auth_info` VALUES (33, 8, '删除权限', '删除权限', 3, '3', NULL, 'auth-deleteAuth', 0, '1', 0, '2022-03-29 10:10:03', NULL, NULL);
INSERT INTO `auth_info` VALUES (34, 8, '恢复权限', '恢复权限', 3, '3', NULL, 'auth-restartAuth', 0, '1', 0, '2022-03-29 10:10:50', NULL, NULL);
INSERT INTO `auth_info` VALUES (35, 2, '修改状态', '修改状态', 3, '3', '', 'user-updateState', 0, '1', 1, '2017-11-28 10:49:40', NULL, NULL);
INSERT INTO `auth_info` VALUES (36, 2, '重置密码', '重置密码', 3, '3', '', 'user-resetPwd', 0, '1', 1, '2017-11-28 10:53:27', NULL, NULL);
INSERT INTO `auth_info` VALUES (37, 5, '修改角色状态', '修改角色状态', 3, '3', '', 'role-updateState', 0, '1', 1, '2017-11-28 11:12:23', NULL, NULL);
INSERT INTO `auth_info` VALUES (38, 19, '订单详情', '订单详情', 2, '2', '', '', 1, '0', 1, '2017-11-29 11:35:57', NULL, NULL);
INSERT INTO `auth_info` VALUES (41, 19, '订单分类', '订单分类', 2, '2', '', '', 1, '0', 1, '2017-11-29 11:56:04', NULL, NULL);
INSERT INTO `auth_info` VALUES (42, 0, '材料管理', '材料管理', 1, '1', '', '', 1, '1', 1, '2017-11-29 11:56:44', NULL, NULL);
INSERT INTO `auth_info` VALUES (43, 38, '查看详情', '查看详情', 3, '3', '', 'order-selectDetils', 1, '0', 1, '2017-11-29 11:57:29', NULL, NULL);
INSERT INTO `auth_info` VALUES (44, 38, '修改详情', '修改详情', 3, '3', '', 'order-updateDetils', 1, '0', 1, '2017-11-29 11:58:36', NULL, NULL);
INSERT INTO `auth_info` VALUES (46, 41, '分类', '分类', 3, '3', '', 'auth-flAuth', 1, '0', 1, '2017-11-30 15:16:02', NULL, NULL);
INSERT INTO `auth_info` VALUES (50, 42, '材料列表', '材料列表', 2, '2', '/commodity/index', '', 1, '1', 1, '2017-12-07 08:47:50', NULL, NULL);
INSERT INTO `auth_info` VALUES (53, 0, '采购管理', '采购管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:02', NULL, NULL);
INSERT INTO `auth_info` VALUES (54, 0, '入库管理', '入库管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:20', NULL, NULL);
INSERT INTO `auth_info` VALUES (55, 0, '出库管理', '出库管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:31', NULL, NULL);
INSERT INTO `auth_info` VALUES (56, 53, '采购列表', '采购列表', 2, '2', '/purchase/index', '', 1, '1', 1, '2017-12-11 14:59:11', NULL, NULL);
INSERT INTO `auth_info` VALUES (57, 54, '入库列表', '入库列表', 2, '2', '/instore/index', '', 1, '1', 1, '2017-12-11 15:01:27', NULL, NULL);
INSERT INTO `auth_info` VALUES (58, 55, '出库列表', '出库列表', 2, '2', '/outstore/index', '', 1, '1', 1, '2017-12-11 15:02:03', NULL, NULL);
INSERT INTO `auth_info` VALUES (69, 0, '仓库管理', '仓库管理', 1, '1', '', '', 1, '1', 1, '2017-12-13 14:34:48', NULL, NULL);
INSERT INTO `auth_info` VALUES (70, 69, '仓库列表', '仓库列表', 2, '2', '/store/index', '', 1, '1', 1, '2017-12-13 14:36:32', NULL, NULL);
INSERT INTO `auth_info` VALUES (71, 68, '调货单列表', '调货单列表', 2, '2', '/transshipment/index', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (72, 0, '供货商管理', '供货商管理', 1, '1', '', '', 1, '1', 1, '2017-12-13 17:09:36', NULL, NULL);
INSERT INTO `auth_info` VALUES (74, 72, '供货商列表', '供货商列表', 2, '2', '/supply/index', '', 1, '1', 1, '2017-12-13 17:10:14', NULL, NULL);
INSERT INTO `auth_info` VALUES (93, 50, '商品查询', '商品查询', 3, '3', '/product/product-page-list', 'select_product', 0, '1', 1, '2022-04-22 12:21:37', NULL, NULL);
INSERT INTO `auth_info` VALUES (94, 50, '添加商品', '添加商品', 3, '3', '/product/product-add', 'product-add', 0, '1', 1, '2022-04-22 12:23:17', NULL, NULL);
INSERT INTO `auth_info` VALUES (95, 57, '确定入库', '确定入库', 3, '3', '/instore/instore-confirm', 'instore-confirm', 0, '1', 1, '2022-04-22 12:25:36', NULL, NULL);
INSERT INTO `auth_info` VALUES (97, 50, '采购', '采购', 3, '3', '/purchase/purchase-add', 'purchase-add', 0, '1', 1, '2022-04-22 12:30:42', NULL, NULL);
INSERT INTO `auth_info` VALUES (98, 0, '合同管理', '合同管理', 1, '1', NULL, NULL, 0, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (99, 98, '合同列表', '合同列表', 2, '2', '/contract/index', NULL, 1, '1', 1, '2023-09-19 16:22:53', NULL, NULL);
INSERT INTO `auth_info` VALUES (100, 0, '考勤管理', '考勤管理', 1, '1', NULL, NULL, 0, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (101, 100, '考勤列表', '考勤列表', 2, '2', '/attendance/index', NULL, 1, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (102, 0, '任务中心', '任务中心', 1, '1', NULL, NULL, 0, '1', NULL, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (104, 102, '任务列表', '任务列表', 2, '2', '/task/index', NULL, 1, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (105, 0, '汇总管理', '汇总管理', 1, '1', NULL, NULL, 0, '1', 1, '2023-11-08 16:54:00', NULL, NULL);
INSERT INTO `auth_info` VALUES (106, 105, '项目结算情况汇总表', '项目结算情况汇总表', 2, '2', '/summary/out', NULL, 1, '1', 1, '2023-11-08 16:54:46', NULL, NULL);
INSERT INTO `auth_info` VALUES (107, 105, '供应商结算应付汇总表', '供应商结算应付汇总表', 3, '3', '/summary/in', NULL, 1, '1', 1, '2023-11-08 16:56:31', NULL, NULL);
INSERT INTO `auth_info` VALUES (108, 0, '产品管理', '产品管理', 1, '1', NULL, NULL, 0, '1', 1, '2023-11-08 17:04:06', NULL, NULL);
INSERT INTO `auth_info` VALUES (109, 108, '产品列表', '产品列表', 2, '2', '/product/index', NULL, 1, '1', 1, '2023-11-08 17:04:39', NULL, NULL);
INSERT INTO `auth_info` VALUES (110, 108, '产品配料比', '产品配料比', 3, '3', '/ratio/index', NULL, 1, '1', 1, '2023-11-08 17:05:22', NULL, NULL);
INSERT INTO `auth_info` VALUES (111, 0, '工作台', '工作台', 0, '0', NULL, NULL, 1, '1', NULL, '2023-11-09 11:49:09', NULL, NULL);
INSERT INTO `auth_info` VALUES (112, 111, '工作面板', '工作面板', 1, '1', '/controller/index', NULL, 1, '1', NULL, '2023-11-09 11:49:40', NULL, NULL);
INSERT INTO `auth_info` VALUES (113, 105, '合同结算汇总表', '合同结算汇总表', 4, '4', '/settlement/index', NULL, 1, '1', NULL, '2023-11-10 11:39:06', NULL, NULL);
INSERT INTO `auth_info` VALUES (114, 42, '材料检验', '材料检验', 3, '3', '/inspect/index', NULL, 1, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (115, 72, '材料送检', '材料送检', 3, '3', '/provide/index', NULL, 1, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (116, 0, '客户管理', '客户管理', 0, '0', NULL, NULL, 1, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (117, 116, '客户列表', '客户列表', 1, '1', '/customer/index', NULL, 1, '1', 1, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (118, 100, '工资单列表', '工资单列表', 3, '3', '/salary/index', NULL, 1, '1', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bus_log
-- ----------------------------
DROP TABLE IF EXISTS `bus_log`;
CREATE TABLE `bus_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bus_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `bus_descrip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务操作描述',
  `oper_person` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `ip_from` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作来源ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_log
-- ----------------------------
INSERT INTO `bus_log` VALUES (89, '登录管理', '用户登录', '管理员', '2023-10-17 15:34:26', NULL);
INSERT INTO `bus_log` VALUES (90, '登录管理', '用户注销', '管理员', '2023-10-17 15:34:37', NULL);
INSERT INTO `bus_log` VALUES (91, '登录管理', '用户登录', '管理员', '2023-10-17 15:34:47', NULL);
INSERT INTO `bus_log` VALUES (92, '登录管理', '用户登录', '管理员', '2023-10-17 15:34:56', NULL);
INSERT INTO `bus_log` VALUES (93, '登录管理', '用户注销', '管理员', '2023-10-17 15:36:47', NULL);
INSERT INTO `bus_log` VALUES (94, '登录管理', '用户登录', '管理员', '2023-10-17 15:36:57', NULL);
INSERT INTO `bus_log` VALUES (95, '登录管理', '用户登录', '管理员', '2023-10-17 15:37:03', NULL);
INSERT INTO `bus_log` VALUES (96, '角色管理', '为角色分配权限', '管理员', '2023-10-17 15:37:16', NULL);
INSERT INTO `bus_log` VALUES (97, '登录管理', '用户注销', '管理员', '2023-10-17 15:37:17', NULL);
INSERT INTO `bus_log` VALUES (98, '登录管理', '用户登录', '管理员', '2023-10-17 15:37:21', NULL);
INSERT INTO `bus_log` VALUES (99, '仓库管理', '添加仓库', '管理员', '2023-10-17 15:43:08', NULL);
INSERT INTO `bus_log` VALUES (100, '仓库管理', '修改仓库', '管理员', '2023-10-17 15:43:20', NULL);
INSERT INTO `bus_log` VALUES (101, '材料管理', '添加材料', '管理员', '2023-10-17 15:50:53', NULL);
INSERT INTO `bus_log` VALUES (102, '材料管理', '添加材料', '管理员', '2023-10-17 15:58:05', NULL);
INSERT INTO `bus_log` VALUES (103, '合同管理', '上传合同文件', '管理员', '2023-10-17 15:59:40', NULL);
INSERT INTO `bus_log` VALUES (104, '合同管理', '添加合同', '管理员', '2023-10-17 15:59:40', NULL);
INSERT INTO `bus_log` VALUES (105, '合同管理', '下载合同图片', '管理员', '2023-10-17 15:59:44', NULL);
INSERT INTO `bus_log` VALUES (106, '合同管理', '更新合同', '管理员', '2023-10-17 16:00:01', NULL);
INSERT INTO `bus_log` VALUES (107, '用户管理', '添加用户', NULL, '2023-10-17 16:14:53', NULL);
INSERT INTO `bus_log` VALUES (108, '用户管理', '修改用户状态', NULL, '2023-10-17 16:14:54', NULL);
INSERT INTO `bus_log` VALUES (109, '用户管理', '分配角色', NULL, '2023-10-17 16:14:58', NULL);
INSERT INTO `bus_log` VALUES (110, '角色管理', '为角色分配权限', NULL, '2023-10-17 16:15:07', NULL);
INSERT INTO `bus_log` VALUES (111, '登录管理', '用户注销', NULL, '2023-10-17 16:15:10', NULL);
INSERT INTO `bus_log` VALUES (112, '登录管理', '用户登录', 'outadmin', '2023-10-17 16:15:16', NULL);
INSERT INTO `bus_log` VALUES (113, '出库管理', '添加出库单', 'outadmin', '2023-10-17 16:16:58', NULL);
INSERT INTO `bus_log` VALUES (114, '出库管理', '出库单确认', 'outadmin', '2023-10-17 16:17:02', NULL);
INSERT INTO `bus_log` VALUES (115, '登录管理', '用户注销', 'outadmin', '2023-10-17 16:17:05', NULL);
INSERT INTO `bus_log` VALUES (116, '登录管理', '用户登录', '管理员', '2023-10-17 16:17:08', NULL);
INSERT INTO `bus_log` VALUES (117, '用户管理', '添加用户', '管理员', '2023-10-17 16:18:04', NULL);
INSERT INTO `bus_log` VALUES (118, '用户管理', '修改用户状态', '管理员', '2023-10-17 16:18:05', NULL);
INSERT INTO `bus_log` VALUES (119, '用户管理', '分配角色', '管理员', '2023-10-17 16:18:10', NULL);
INSERT INTO `bus_log` VALUES (120, '角色管理', '为角色分配权限', '管理员', '2023-10-17 16:18:19', NULL);
INSERT INTO `bus_log` VALUES (121, '用户管理', '添加用户', '管理员', '2023-10-17 16:18:39', NULL);
INSERT INTO `bus_log` VALUES (122, '用户管理', '修改用户状态', '管理员', '2023-10-17 16:18:40', NULL);
INSERT INTO `bus_log` VALUES (123, '用户管理', '分配角色', '管理员', '2023-10-17 16:18:44', NULL);
INSERT INTO `bus_log` VALUES (124, '角色管理', '为角色分配权限', '管理员', '2023-10-17 16:18:56', NULL);
INSERT INTO `bus_log` VALUES (125, '登录管理', '用户注销', '管理员', '2023-10-17 16:19:00', NULL);
INSERT INTO `bus_log` VALUES (126, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:19:05', NULL);
INSERT INTO `bus_log` VALUES (127, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:19:46', NULL);
INSERT INTO `bus_log` VALUES (128, '登录管理', '用户登录', 'inadmin', '2023-10-17 16:19:54', NULL);
INSERT INTO `bus_log` VALUES (129, '登录管理', '用户注销', 'inadmin', '2023-10-17 16:20:14', NULL);
INSERT INTO `bus_log` VALUES (130, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:20:23', NULL);
INSERT INTO `bus_log` VALUES (131, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:20:49', NULL);
INSERT INTO `bus_log` VALUES (132, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:24:01', NULL);
INSERT INTO `bus_log` VALUES (133, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:24:07', NULL);
INSERT INTO `bus_log` VALUES (134, '登录管理', '用户登录', '管理员', '2023-10-17 16:24:12', NULL);
INSERT INTO `bus_log` VALUES (135, '登录管理', '用户登录', '管理员', '2023-10-17 16:27:26', NULL);
INSERT INTO `bus_log` VALUES (136, '合同管理', '上传合同文件', '管理员', '2023-10-17 16:27:46', NULL);
INSERT INTO `bus_log` VALUES (137, '合同管理', '添加合同', '管理员', '2023-10-17 16:27:46', NULL);
INSERT INTO `bus_log` VALUES (138, '登录管理', '用户注销', '管理员', '2023-10-17 16:28:13', NULL);
INSERT INTO `bus_log` VALUES (139, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:28:18', NULL);
INSERT INTO `bus_log` VALUES (140, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:29:39', NULL);
INSERT INTO `bus_log` VALUES (141, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:29:46', NULL);
INSERT INTO `bus_log` VALUES (142, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:29:54', NULL);
INSERT INTO `bus_log` VALUES (143, '登录管理', '用户登录', 'inadmin', '2023-10-17 16:29:59', NULL);
INSERT INTO `bus_log` VALUES (144, '登录管理', '用户注销', 'inadmin', '2023-10-17 16:30:09', NULL);
INSERT INTO `bus_log` VALUES (145, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:30:13', NULL);
INSERT INTO `bus_log` VALUES (146, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:31:38', NULL);
INSERT INTO `bus_log` VALUES (147, '登录管理', '用户登录', 'inadmin', '2023-10-17 16:31:44', NULL);
INSERT INTO `bus_log` VALUES (148, '登录管理', '用户注销', 'inadmin', '2023-10-17 16:31:49', NULL);
INSERT INTO `bus_log` VALUES (149, '登录管理', '用户登录', '管理员', '2023-10-17 16:31:53', NULL);
INSERT INTO `bus_log` VALUES (150, '角色管理', '为角色分配权限', '管理员', '2023-10-17 16:32:05', NULL);
INSERT INTO `bus_log` VALUES (151, '登录管理', '用户注销', '管理员', '2023-10-17 16:32:06', NULL);
INSERT INTO `bus_log` VALUES (152, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:32:35', NULL);
INSERT INTO `bus_log` VALUES (153, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:33:33', NULL);
INSERT INTO `bus_log` VALUES (154, '登录管理', '用户登录', 'inadmin', '2023-10-17 16:33:42', NULL);
INSERT INTO `bus_log` VALUES (155, '登录管理', '用户注销', 'inadmin', '2023-10-17 16:35:12', NULL);
INSERT INTO `bus_log` VALUES (156, '登录管理', '用户登录', 'puradmin', '2023-10-17 16:35:18', NULL);
INSERT INTO `bus_log` VALUES (157, '登录管理', '用户注销', 'puradmin', '2023-10-17 16:36:19', NULL);
INSERT INTO `bus_log` VALUES (158, '登录管理', '用户登录', 'inadmin', '2023-10-17 16:36:25', NULL);
INSERT INTO `bus_log` VALUES (159, '入库管理', '入库确认', 'inadmin', '2023-10-17 16:37:05', NULL);
INSERT INTO `bus_log` VALUES (160, '登录管理', '用户注销', 'inadmin', '2023-10-17 16:37:08', NULL);
INSERT INTO `bus_log` VALUES (161, '登录管理', '用户登录', '管理员', '2023-10-17 16:37:11', NULL);
INSERT INTO `bus_log` VALUES (162, '登录管理', '用户注销', '管理员', '2023-10-17 16:37:16', NULL);
INSERT INTO `bus_log` VALUES (163, '登录管理', '用户登录', '管理员', '2023-10-17 16:37:46', NULL);
INSERT INTO `bus_log` VALUES (164, '登录管理', '用户注销', '管理员', '2023-10-17 16:38:35', NULL);
INSERT INTO `bus_log` VALUES (165, '登录管理', '用户登录', 'outadmin', '2023-10-17 16:38:41', NULL);
INSERT INTO `bus_log` VALUES (166, '出库管理', '添加出库单', 'outadmin', '2023-10-17 16:40:39', NULL);
INSERT INTO `bus_log` VALUES (167, '出库管理', '出库单确认', 'outadmin', '2023-10-17 16:41:02', NULL);
INSERT INTO `bus_log` VALUES (168, '登录管理', '用户注销', 'outadmin', '2023-10-17 16:41:05', NULL);
INSERT INTO `bus_log` VALUES (169, '登录管理', '用户登录', '管理员', '2023-10-17 16:41:08', NULL);
INSERT INTO `bus_log` VALUES (170, '登录管理', '用户登录', '管理员', '2023-10-19 14:35:18', NULL);
INSERT INTO `bus_log` VALUES (171, '登录管理', '用户登录', '管理员', '2023-10-19 14:46:08', NULL);
INSERT INTO `bus_log` VALUES (172, '登录管理', '用户登录', '管理员', '2023-10-19 14:48:39', NULL);
INSERT INTO `bus_log` VALUES (173, '合同管理', '添加合同', '管理员', '2023-10-19 14:48:59', NULL);

-- ----------------------------
-- Table structure for buy_list
-- ----------------------------
DROP TABLE IF EXISTS `buy_list`;
CREATE TABLE `buy_list`  (
  `buy_id` int NOT NULL AUTO_INCREMENT COMMENT '采购id',
  `material_id` int NULL DEFAULT NULL COMMENT '材料id',
  `store_id` int NULL DEFAULT NULL COMMENT '仓库id',
  `supply_id` int NULL DEFAULT NULL COMMENT '供应商id',
  `buy_num` decimal(10, 2) NULL DEFAULT NULL COMMENT '计划购买数量',
  `fact_buy_num` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际购买数量',
  `buy_time` datetime NULL DEFAULT NULL COMMENT '采购时间',
  `buy_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `contract_id` int NULL DEFAULT NULL COMMENT '所属合同id',
  `is_in` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 未审核、 1 审核驳回、 2 审核通过、 3已完成',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驳回原因',
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buy_list
-- ----------------------------
INSERT INTO `buy_list` VALUES (67, 42, 5, 10, 20.00, 20.00, '2023-11-08 16:05:20', '测试', '12312312312', 130, '3', NULL);
INSERT INTO `buy_list` VALUES (68, 36, 5, 8, 20.00, 20.00, '2023-11-08 16:12:06', '测试', '18822193131', 130, '3', NULL);
INSERT INTO `buy_list` VALUES (69, 36, 5, 8, 10.00, 10.00, '2023-11-09 11:38:01', '测试', '084957', 133, '3', NULL);
INSERT INTO `buy_list` VALUES (70, 38, 5, 7, 100.00, 100.00, '2023-11-09 13:53:00', '测试', '12312312312', 134, '3', NULL);
INSERT INTO `buy_list` VALUES (71, 37, 5, 10, 100.00, 100.00, '2023-11-13 10:47:59', '测试', '12312312312', 136, '3', NULL);
INSERT INTO `buy_list` VALUES (72, 36, 5, 8, 100.00, 100.00, '2023-11-14 09:47:48', '测试', '084957', 139, '3', NULL);
INSERT INTO `buy_list` VALUES (73, 36, 5, 8, 23.10, 23.10, '2023-11-16 16:27:32', '测试', '123', 144, '2', NULL);
INSERT INTO `buy_list` VALUES (74, 36, 5, 8, 36.90, 36.90, '2023-11-17 10:07:23', '测试', '123', 146, '3', NULL);
INSERT INTO `buy_list` VALUES (75, 37, 5, 10, 38.13, 38.13, '2023-11-17 10:07:33', '测试', '123', 146, '3', NULL);
INSERT INTO `buy_list` VALUES (76, 38, 5, 7, 43.05, 43.05, '2023-11-17 10:07:43', '测试', '123', 146, '3', NULL);
INSERT INTO `buy_list` VALUES (77, 39, 5, 12, 4.92, 4.92, '2023-11-17 10:07:52', '测试', '123', 146, '3', NULL);
INSERT INTO `buy_list` VALUES (78, 40, 5, 10, 4.80, 4.80, '2023-11-17 10:08:04', '测试', '123456', 146, '3', NULL);
INSERT INTO `buy_list` VALUES (79, 36, 5, 8, 20.00, 20.00, '2023-12-12 15:01:15', '123', '123', 165, '3', NULL);
INSERT INTO `buy_list` VALUES (80, 36, 5, 13, 123.00, 123.00, '2023-12-12 22:21:30', '123', '123', 166, '3', NULL);

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  `risk` int UNSIGNED NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES (10, 43, '测试地址', '测试地址', '测试地址', '测试地址', '测试地址', 2, 1, '2023-11-28', '2023-11-28 14:57:39');
INSERT INTO `checkin` VALUES (12, 1, '广东省广州市天河区天府路1号', NULL, NULL, NULL, NULL, 2, 1, '2023-11-08', '2023-11-08 00:00:00');
INSERT INTO `checkin` VALUES (13, 53, '广东省广州市天河区天府路1号', NULL, NULL, NULL, NULL, 2, 1, '2023-12-13', '2023-12-13 23:05:19');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `contract_id` int NOT NULL AUTO_INCREMENT COMMENT '合同id',
  `contract_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同名称',
  `materials` json NULL COMMENT '所需材料id',
  `product_id` int NULL DEFAULT NULL COMMENT '产品id',
  `product_num` double NULL DEFAULT NULL COMMENT '生产数量',
  `start_time` date NULL DEFAULT NULL COMMENT '工期开始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '工期结束时间',
  `work_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联工区',
  `customer_id` int NULL DEFAULT NULL COMMENT '客户id',
  `other_customer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他客户',
  `contract_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0未审核、1 被驳回 、2 待结算、 3 结算中、 4已结算',
  `if_purchase` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0无需采购、1需要采购、 2仅采购、3工程',
  `files` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关附件',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程名称',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责公司',
  `signing_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签订地址',
  `signing_date` datetime NULL DEFAULT NULL COMMENT '签订日期',
  `if_ratio` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自定义比例 0否、1是',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (164, '测试销售合同', '[]', 37, 123, '2023-12-01', '2023-12-21', '测试', 1, '', '4', '0', '1702361038312-db888.pdf', NULL, NULL, NULL, NULL, NULL, '2023-12-12 14:04:01', '2023-12-13 09:14:03');
INSERT INTO `contract` VALUES (165, '测试采购合同', '[{\"id\": 36, \"num\": 20, \"name\": \"7-10\"}]', NULL, 0, '2023-12-05', '2023-12-27', '测试', 1, '', '4', '2', '1702364423450-33418.pdf', NULL, NULL, NULL, NULL, NULL, '2023-12-12 15:00:31', '2023-12-12 22:37:14');
INSERT INTO `contract` VALUES (166, '测试销售并采购', '[]', 37, 123, '2023-12-06', '2023-12-27', '112', 1, '', '4', '1', '1702390804784-72f56.pdf', NULL, NULL, NULL, NULL, NULL, '2023-12-12 22:20:07', '2023-12-13 09:16:53');
INSERT INTO `contract` VALUES (168, '沥青路面工程合同1', '[]', NULL, 123, NULL, NULL, '海丰县海城镇', NULL, '海丰县祥兴建筑工程有限公司', '0', '3', NULL, NULL, '广州市佑安土木工程有限公司', '汕尾市城区', '2022-12-30 00:00:00', NULL, '2023-12-29 11:31:52', '2023-12-29 11:31:52');
INSERT INTO `contract` VALUES (170, '沥青路面工程合2', '[]', NULL, 123, NULL, NULL, '海丰县海城镇', NULL, '海丰县祥兴建筑工程有限公司', '0', '3', NULL, NULL, '广州市佑安土木工程有限公司', '汕尾市城区', '2022-12-30 00:00:00', NULL, '2023-12-29 14:49:48', '2023-12-29 14:49:48');
INSERT INTO `contract` VALUES (171, '沥青路面工程合同2', '[]', NULL, 123, NULL, NULL, '海丰县海城镇', NULL, '海丰县祥兴建筑工程有限公司', '2', '3', NULL, NULL, '广州市佑安土木工程有限公司', '汕尾市城区', '2022-12-30 00:00:00', NULL, '2023-12-29 14:58:46', '2023-12-29 15:03:00');
INSERT INTO `contract` VALUES (172, '沥青路面工程合同3', '[]', NULL, 123, NULL, NULL, '海丰县海城镇', NULL, '海丰县祥兴建筑工程有限公司', '3', '3', NULL, NULL, '广州市佑安土木工程有限公司', '汕尾市城区', '2022-12-30 00:00:00', NULL, '2023-12-29 14:59:48', '2024-01-02 17:22:24');
INSERT INTO `contract` VALUES (173, '沥青路面工程合同5', '[]', NULL, 123, NULL, NULL, '海丰县海城镇', NULL, '海丰县祥兴建筑工程有限公司', '0', '3', NULL, NULL, '广州市佑安土木工程有限公司', '汕尾市城区', '2022-12-30 00:00:00', NULL, '2024-01-03 14:43:25', '2024-01-03 14:43:25');
INSERT INTO `contract` VALUES (175, '123', '[]', NULL, 123, NULL, NULL, '123', NULL, '123', '0', '3', NULL, NULL, '123', '123', '2024-01-05 00:00:00', NULL, '2024-01-05 10:23:14', '2024-01-05 10:23:14');
INSERT INTO `contract` VALUES (176, '1234', '[]', NULL, 123, NULL, NULL, '123', NULL, '123', '0', '3', NULL, NULL, '123', '123', '2024-01-05 00:00:00', NULL, '2024-01-05 10:26:16', '2024-01-05 10:26:16');
INSERT INTO `contract` VALUES (177, '12345', '[]', NULL, 123, NULL, NULL, '123', NULL, '13', '0', '3', NULL, NULL, '123', '123', '2024-01-05 00:00:00', NULL, '2024-01-05 11:10:00', '2024-01-05 11:10:00');
INSERT INTO `contract` VALUES (178, '123456', '[]', NULL, 123, NULL, NULL, '123', NULL, '13', '0', '3', NULL, NULL, '123', '123', '2024-01-05 00:00:00', NULL, '2024-01-05 11:51:28', '2024-01-05 11:51:28');
INSERT INTO `contract` VALUES (179, '沥青路面工程合同', '[]', NULL, 0, NULL, NULL, '海丰县海城镇', NULL, '海丰县祥兴建筑工程有限公司', '3', '3', NULL, NULL, '广州市佑安土木工程有限公司', '汕尾市城区', '2022-12-30 00:00:00', NULL, '2024-01-15 16:17:37', '2024-01-15 16:52:46');

-- ----------------------------
-- Table structure for contract_eginner
-- ----------------------------
DROP TABLE IF EXISTS `contract_eginner`;
CREATE TABLE `contract_eginner`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `contract_id` int NULL DEFAULT NULL COMMENT '合同id',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目名称',
  `specs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `quantity` double NULL DEFAULT NULL COMMENT '暂定数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `if_ratio` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否使用系统默认比例 0不使用、1使用',
  `product_id` int NULL DEFAULT NULL COMMENT '如果是产品，则是对应的产品id',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract_eginner
-- ----------------------------
INSERT INTO `contract_eginner` VALUES (1, 167, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (2, 167, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (3, 167, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (4, 168, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (5, 168, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (6, 168, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (10, 170, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (11, 170, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (12, 170, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (13, 171, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (14, 171, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (15, 171, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (16, 172, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (17, 172, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (18, 172, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (19, NULL, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (20, NULL, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (21, NULL, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (22, 173, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青,石料采\n用反击破碎石(高标石)');
INSERT INTO `contract_eginner` VALUES (23, 173, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (24, 173, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (25, 174, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (26, 174, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (27, 174, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (28, 174, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (45, 175, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, NULL, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (46, 175, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (47, 175, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (48, 175, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (49, 176, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, 38, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (50, 176, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (51, 176, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (52, 176, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (53, NULL, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, 38, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (54, NULL, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (55, NULL, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (56, NULL, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (57, 177, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, NULL, 38, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (58, 177, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (59, 177, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (60, 177, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (61, 178, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', NULL, 55.00, NULL, '1', 38, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (62, 178, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (63, 178, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (64, 178, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (65, 179, '厚4cm细粒式改性沥青\nAC-13', '', 'm2', 100, 55.00, NULL, '1', 38, '采用SBS改性沥青，石料采\n用反击破碎石（高标石）');
INSERT INTO `contract_eginner` VALUES (66, 179, '沥青粘层油', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '采用PC-3沥青');
INSERT INTO `contract_eginner` VALUES (67, 179, '旧路面铣刨', '', 'm2', NULL, 2.50, NULL, NULL, NULL, '');
INSERT INTO `contract_eginner` VALUES (68, 179, '合计（元）', '', 'm2', NULL, 60.00, NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for contract_ratio
-- ----------------------------
DROP TABLE IF EXISTS `contract_ratio`;
CREATE TABLE `contract_ratio`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int NULL DEFAULT NULL COMMENT '合同id',
  `product_id` int NULL DEFAULT NULL COMMENT '产品id',
  `material_id` int NULL DEFAULT NULL COMMENT '原材料id',
  `new_ratio` double NULL DEFAULT NULL COMMENT '材料占比',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract_ratio
-- ----------------------------
INSERT INTO `contract_ratio` VALUES (1, NULL, 38, 43, 123);
INSERT INTO `contract_ratio` VALUES (2, NULL, 38, 36, 0.23);
INSERT INTO `contract_ratio` VALUES (3, NULL, 38, 37, 0.08);
INSERT INTO `contract_ratio` VALUES (4, NULL, 38, 38, 0.33);
INSERT INTO `contract_ratio` VALUES (5, NULL, 38, 38, 0.2);
INSERT INTO `contract_ratio` VALUES (6, NULL, 38, 39, 0.02);
INSERT INTO `contract_ratio` VALUES (7, NULL, 38, 40, 0.035);
INSERT INTO `contract_ratio` VALUES (8, 177, 38, 43, 123);
INSERT INTO `contract_ratio` VALUES (9, 177, 38, 36, 0.23);
INSERT INTO `contract_ratio` VALUES (10, 177, 38, 37, 0.08);
INSERT INTO `contract_ratio` VALUES (11, 177, 38, 38, 0.33);
INSERT INTO `contract_ratio` VALUES (12, 177, 38, 38, 0.2);
INSERT INTO `contract_ratio` VALUES (13, 177, 38, 39, 0.02);
INSERT INTO `contract_ratio` VALUES (14, 177, 38, 40, 0.035);
INSERT INTO `contract_ratio` VALUES (15, 178, 38, 43, 123);
INSERT INTO `contract_ratio` VALUES (16, 178, 38, 36, 0.23);
INSERT INTO `contract_ratio` VALUES (17, 178, 38, 37, 0.08);
INSERT INTO `contract_ratio` VALUES (18, 178, 38, 38, 0.33);
INSERT INTO `contract_ratio` VALUES (19, 178, 38, 38, 0.2);
INSERT INTO `contract_ratio` VALUES (20, 178, 38, 39, 0.02);
INSERT INTO `contract_ratio` VALUES (21, 178, 38, 40, 0.035);
INSERT INTO `contract_ratio` VALUES (22, 179, 38, 43, 0.19);
INSERT INTO `contract_ratio` VALUES (23, 179, 38, 36, 0.11);
INSERT INTO `contract_ratio` VALUES (24, 179, 38, 37, 0.08);
INSERT INTO `contract_ratio` VALUES (25, 179, 38, 38, 0.33);
INSERT INTO `contract_ratio` VALUES (26, 179, 38, 38, 0.2);
INSERT INTO `contract_ratio` VALUES (27, 179, 38, 39, 0.02);
INSERT INTO `contract_ratio` VALUES (28, 179, 38, 40, 0.035);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户名称',
  `concat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否启用：0:可用  1:不可用',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '红海湾水厂', '123', '123', '123', '0', NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (2, '深汕天威视讯', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (3, '234', '234', '234', '234', '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for face_model
-- ----------------------------
DROP TABLE IF EXISTS `face_model`;
CREATE TABLE `face_model`  (
  `id` int UNSIGNED NULL DEFAULT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `face_model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of face_model
-- ----------------------------
INSERT INTO `face_model` VALUES (1, 1, '/images/1.jpg');

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程实例id',
  `contract_id` int NULL DEFAULT NULL COMMENT '合同id',
  `purchase_id` int NULL DEFAULT NULL COMMENT '采购单id',
  `in_store_id` int NULL DEFAULT NULL COMMENT '入库单id',
  `out_store_id` int NULL DEFAULT NULL COMMENT '出库单id',
  `state` int NULL DEFAULT NULL COMMENT '实例状态：1=进行中，0=已结束',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核不通过原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '部署时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of flow
-- ----------------------------
INSERT INTO `flow` VALUES (104, '3f333657-98b4-11ee-b7a1-48a47209a1e7', 164, NULL, NULL, NULL, 0, NULL, '2023-12-12 14:04:01');
INSERT INTO `flow` VALUES (105, '23fa16a8-98bc-11ee-8cb7-48a47209a1e7', 165, NULL, NULL, NULL, 2, NULL, '2023-12-12 15:00:32');
INSERT INTO `flow` VALUES (106, '8cd51f48-98f9-11ee-9eb7-48a47209a1e7', 166, NULL, NULL, NULL, 1, NULL, '2023-12-12 22:20:07');
INSERT INTO `flow` VALUES (107, '757d484b-a616-11ee-a611-48a47209a1e7', 170, NULL, NULL, NULL, 3, NULL, '2023-12-29 14:49:48');
INSERT INTO `flow` VALUES (108, 'b6427066-a617-11ee-9dec-48a47209a1e7', 171, NULL, NULL, NULL, 3, NULL, '2023-12-29 14:58:46');
INSERT INTO `flow` VALUES (109, 'db05c15f-a617-11ee-9dec-48a47209a1e7', 172, NULL, NULL, NULL, 0, NULL, '2023-12-29 14:59:48');
INSERT INTO `flow` VALUES (110, 'a78b8841-aa02-11ee-8160-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-03 14:38:07');
INSERT INTO `flow` VALUES (111, '6570a94a-aa03-11ee-8160-48a47209a1e7', 173, NULL, NULL, NULL, 0, NULL, '2024-01-03 14:43:25');
INSERT INTO `flow` VALUES (112, '8040bda4-ab6f-11ee-953c-48a47209a1e7', 174, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:09:47');
INSERT INTO `flow` VALUES (113, '1eb96fb1-ab70-11ee-8115-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:14:13');
INSERT INTO `flow` VALUES (114, '6c3a70b2-ab70-11ee-9e62-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:16:24');
INSERT INTO `flow` VALUES (115, 'c2534d86-ab70-11ee-9b4d-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:18:49');
INSERT INTO `flow` VALUES (116, '36873aad-ab71-11ee-8ad1-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:22:04');
INSERT INTO `flow` VALUES (117, '61289e84-ab71-11ee-a0bb-48a47209a1e7', 175, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:23:14');
INSERT INTO `flow` VALUES (118, 'cd9c4a8b-ab71-11ee-a5cf-48a47209a1e7', 176, NULL, NULL, NULL, 0, NULL, '2024-01-05 10:26:16');
INSERT INTO `flow` VALUES (119, '4c6ca3be-ab77-11ee-8ea7-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-05 11:05:36');
INSERT INTO `flow` VALUES (120, 'e9ddd080-ab77-11ee-94d6-48a47209a1e7', 177, NULL, NULL, NULL, 0, NULL, '2024-01-05 11:10:00');
INSERT INTO `flow` VALUES (121, 'aaedb248-ab7d-11ee-8da7-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-05 11:51:12');
INSERT INTO `flow` VALUES (122, 'b4b1d971-ab7d-11ee-8da7-48a47209a1e7', 178, NULL, NULL, NULL, 0, NULL, '2024-01-05 11:51:28');
INSERT INTO `flow` VALUES (123, '74217e63-b37d-11ee-80c5-48a47209a1e7', NULL, NULL, NULL, NULL, 0, NULL, '2024-01-15 16:09:49');
INSERT INTO `flow` VALUES (124, '8b624b4c-b37e-11ee-80c5-48a47209a1e7', 179, NULL, NULL, NULL, 0, NULL, '2024-01-15 16:17:38');

-- ----------------------------
-- Table structure for holidays
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays`  (
  `id` int UNSIGNED NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of holidays
-- ----------------------------

-- ----------------------------
-- Table structure for in_store
-- ----------------------------
DROP TABLE IF EXISTS `in_store`;
CREATE TABLE `in_store`  (
  `ins_id` int NOT NULL AUTO_INCREMENT COMMENT '入库单id',
  `store_id` int NULL DEFAULT NULL COMMENT '仓库id',
  `material_id` int NULL DEFAULT NULL COMMENT '原材料id',
  `in_num` decimal(10, 2) NOT NULL COMMENT '入库数量/公司数量',
  `relative_num` decimal(10, 2) NULL DEFAULT NULL COMMENT '对方数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费单价',
  `car_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库车牌号',
  `contract_id` int NULL DEFAULT NULL COMMENT '所属合同id',
  `supply_id` int NULL DEFAULT NULL COMMENT '供应商id',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_in` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 否 1 是',
  PRIMARY KEY (`ins_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of in_store
-- ----------------------------
INSERT INTO `in_store` VALUES (61, 5, 36, 20.00, 20.00, 16.70, NULL, '123123', 130, 8, NULL, 1, '2023-11-08 16:26:07', '1');
INSERT INTO `in_store` VALUES (62, 5, 42, 20.00, 20.00, 27.90, NULL, '1123123', 130, 10, NULL, 1, '2023-11-08 16:26:08', '1');
INSERT INTO `in_store` VALUES (63, 5, 36, 10.00, 10.00, 16.70, NULL, '123123', 133, 8, NULL, 1, '2023-11-09 11:38:48', '1');
INSERT INTO `in_store` VALUES (64, 5, 38, 100.00, 100.00, 12.80, NULL, '1123123', 134, 7, NULL, 1, '2023-11-09 13:55:34', '1');
INSERT INTO `in_store` VALUES (65, 5, 37, 100.00, 100.00, 11.10, 10.00, '123123', 136, 10, NULL, 38, '2023-11-13 11:10:19', '1');
INSERT INTO `in_store` VALUES (66, 5, 36, 100.00, 100.00, 16.70, NULL, '123123', 139, 8, NULL, 1, '2023-11-14 09:54:55', '1');
INSERT INTO `in_store` VALUES (67, 5, 36, 100.00, 100.00, 18.90, NULL, '123123', 141, 13, '', 1, '2023-11-14 11:53:51', '1');
INSERT INTO `in_store` VALUES (68, 5, 37, 100.00, 100.00, 11.10, 10.00, '123', 141, 10, '123', 1, '2023-11-15 15:04:30', '1');
INSERT INTO `in_store` VALUES (69, 5, 38, 100.00, 100.00, 22.10, 10.00, '123123', 141, 12, NULL, 1, '2023-11-15 15:04:31', '1');
INSERT INTO `in_store` VALUES (70, 5, 36, 23.10, 23.10, 16.70, NULL, NULL, 144, 8, NULL, 1, '2023-11-16 16:29:06', '1');
INSERT INTO `in_store` VALUES (71, 5, 36, 36.90, 36.90, 16.70, NULL, NULL, 146, 8, NULL, 1, '2023-11-17 10:12:48', '1');
INSERT INTO `in_store` VALUES (72, 5, 37, 38.13, 38.13, 11.10, NULL, NULL, 146, 10, NULL, 1, '2023-11-17 10:12:49', '1');
INSERT INTO `in_store` VALUES (73, 5, 38, 43.05, 43.05, 12.80, NULL, NULL, 146, 7, NULL, 1, '2023-11-17 10:12:50', '1');
INSERT INTO `in_store` VALUES (74, 5, 39, 4.92, 4.92, 10.30, NULL, NULL, 146, 12, NULL, 1, '2023-11-17 10:12:51', '1');
INSERT INTO `in_store` VALUES (75, 5, 40, 4.80, 4.80, 200.00, NULL, NULL, 146, 10, NULL, 1, '2023-11-17 10:12:53', '1');
INSERT INTO `in_store` VALUES (76, 5, 36, 20.00, 20.00, 16.70, 10.00, '123', 165, 8, '123', 1, '2023-12-12 22:32:10', '1');
INSERT INTO `in_store` VALUES (77, 5, 36, 123.00, 123.00, 18.90, 10.00, '123', 166, 13, '123', 1, '2023-12-13 09:15:01', '1');

-- ----------------------------
-- Table structure for inspection
-- ----------------------------
DROP TABLE IF EXISTS `inspection`;
CREATE TABLE `inspection`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '检测id',
  `material_id` int NULL DEFAULT NULL COMMENT '材料id',
  `supply_id` int NULL DEFAULT NULL COMMENT '送检供应商id',
  `inspection_result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检测结果：0：未通过 1：通过',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection
-- ----------------------------
INSERT INTO `inspection` VALUES (1, 36, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (2, 33, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (3, 36, 7, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (4, 33, 7, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (5, 37, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (6, 38, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (7, 39, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (8, 40, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (9, 42, 6, '1', NULL, NULL, NULL, NULL);
INSERT INTO `inspection` VALUES (10, 43, 6, '1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `material_id` int NOT NULL AUTO_INCREMENT COMMENT '材料id',
  `store_id` int NULL DEFAULT NULL COMMENT '仓库id',
  `material_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '材料名称及规格',
  `material_num` decimal(10, 2) NULL DEFAULT NULL COMMENT '材料在库数量',
  `unit_id` int NULL DEFAULT NULL COMMENT '单位id',
  `introduce` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '材料介绍',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人',
  `update_by` int NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (35, 5, '测试添加材料', 100.00, 8, '测试修改材料', '2023-10-23 10:19:26', '2023-10-23 10:37:32', 1, 1);
INSERT INTO `material` VALUES (36, 5, '7-10', 123.91, 8, '', '2023-10-25 08:54:58', NULL, 1, NULL);
INSERT INTO `material` VALUES (37, 5, '4-7', 82.16, 8, '', '2023-10-25 08:55:09', '2023-11-08 15:26:28', 1, 1);
INSERT INTO `material` VALUES (38, 5, '0-4', 100.00, 8, '', '2023-10-25 08:56:50', '2023-11-08 15:26:23', 1, 1);
INSERT INTO `material` VALUES (39, 5, '矿粉', 84.90, 8, '', '2023-10-25 08:57:12', NULL, 1, NULL);
INSERT INTO `material` VALUES (40, 5, '沥青', 81.82, 8, '', '2023-10-25 08:57:23', NULL, 1, NULL);
INSERT INTO `material` VALUES (42, 5, '16-22', 100.00, 8, '', '2023-11-08 09:34:22', NULL, 1, NULL);
INSERT INTO `material` VALUES (43, 5, '10-16', 53.94, 8, '', '2023-11-08 09:34:33', NULL, 1, NULL);
INSERT INTO `material` VALUES (48, 5, '123124', 0.00, 8, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material` VALUES (49, 5, '测试123', 0.00, 8, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for material_supply
-- ----------------------------
DROP TABLE IF EXISTS `material_supply`;
CREATE TABLE `material_supply`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `material_id` int NULL DEFAULT NULL COMMENT '材料id',
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '材料名称',
  `supply_id` int NULL DEFAULT NULL COMMENT '供应商id',
  `quotation` decimal(10, 2) NULL DEFAULT NULL COMMENT '报价',
  `inspection_result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '0:未审核  1:审核未通过  2:审核通过',
  `files` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '材料图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material_supply
-- ----------------------------
INSERT INTO `material_supply` VALUES (80, 42, NULL, 13, 38.10, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (81, 42, NULL, 10, 27.90, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (82, 42, NULL, 15, 15.70, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (83, 42, NULL, 11, 46.10, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (84, 38, NULL, 8, 31.40, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (85, 37, NULL, 9, 39.80, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (86, 43, NULL, 8, 12.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (88, 42, NULL, 6, 20.50, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (89, 35, NULL, 10, 29.40, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (90, 43, NULL, 11, 33.20, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (91, 37, NULL, 14, 21.30, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (92, 35, NULL, 11, 36.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (93, 39, NULL, 10, 10.20, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (94, 36, NULL, 15, 33.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (95, 39, NULL, 15, 13.60, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (97, 40, NULL, 11, 35.80, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (99, 42, NULL, 14, 21.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (100, 35, NULL, 6, 16.50, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (101, 36, NULL, 8, 16.70, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (105, 38, NULL, 13, 29.40, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (106, 37, NULL, 10, 11.10, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (110, 40, NULL, 10, 24.60, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (111, 38, NULL, 11, 27.10, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (113, 38, NULL, 10, 18.40, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (114, 35, NULL, 12, 18.60, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (116, 36, NULL, 11, 47.50, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (117, 35, NULL, 15, 40.60, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (120, 37, NULL, 7, 13.80, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (121, 38, NULL, 7, 12.80, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (122, 40, NULL, 6, 41.80, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (123, 39, NULL, 9, 42.70, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (125, 42, NULL, 9, 13.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (127, 36, NULL, 13, 18.90, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (130, 38, NULL, 12, 22.10, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (136, 35, NULL, 7, 36.80, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (139, 43, NULL, 9, 31.30, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (140, 39, NULL, 12, 10.30, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `material_supply` VALUES (141, NULL, '测试', 12, 100.00, '0', '', '2023-11-17 16:54:00', 1, NULL, NULL);
INSERT INTO `material_supply` VALUES (142, NULL, '123', 12, 123.00, '0', '图片上传失败！', '2023-11-17 17:05:13', 1, NULL, NULL);
INSERT INTO `material_supply` VALUES (143, NULL, '1234', 12, 1234.00, '0', '1700212074637-f92ee.jpg', '2023-11-17 17:08:03', 1, NULL, NULL);
INSERT INTO `material_supply` VALUES (145, 48, '123124', 12, 123.00, '0', '1700321973048-09095.jpg,1700321973048-3a8ef.jpg', '2023-11-18 23:39:35', 1, '2023-11-19 15:43:38', NULL);
INSERT INTO `material_supply` VALUES (146, 49, '测试123', 16, 123.00, '0', '1700396629238-731a8.jpg,1700396629238-11ec9.jpg', '2023-11-19 20:23:51', 16, NULL, NULL);
INSERT INTO `material_supply` VALUES (147, 36, '7-10', 16, 123.00, '2', '1700396903153-73b68.jpg,1700396903153-6742d.jpg', '2023-11-19 20:28:24', 16, NULL, NULL);

-- ----------------------------
-- Table structure for out_store
-- ----------------------------
DROP TABLE IF EXISTS `out_store`;
CREATE TABLE `out_store`  (
  `outs_id` int NOT NULL AUTO_INCREMENT COMMENT '出库单id',
  `product_id` int NULL DEFAULT NULL COMMENT '产品id',
  `store_id` int NULL DEFAULT NULL COMMENT '仓库id',
  `out_num` decimal(10, 2) NULL DEFAULT NULL COMMENT '出库数量',
  `sale_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `work_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工区名称',
  `custom` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户',
  `contract_id` int NULL DEFAULT NULL COMMENT '所属合同id',
  `car_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库车牌',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_out` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 否 1 是',
  PRIMARY KEY (`outs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of out_store
-- ----------------------------
INSERT INTO `out_store` VALUES (33, 36, 5, 20.00, 10.00, '阳光城愉景湾施工工区', '阳光城愉景湾', 130, '123123', NULL, 1, '2023-11-08 16:33:58', '1');
INSERT INTO `out_store` VALUES (34, 36, 5, 30.00, 10.00, '阳光城愉景湾施工工区', '阳光城愉景湾', 130, '123123', NULL, 1, '2023-11-08 16:36:37', '1');
INSERT INTO `out_store` VALUES (35, 36, 5, 50.00, 10.00, '阳光城愉景湾施工工区', '红海湾田乾6号路', 130, '123123', NULL, 1, '2023-11-08 16:41:27', '1');
INSERT INTO `out_store` VALUES (36, 36, 5, 100.00, 10.00, '阳光城愉景湾施工工区', '测试用户', 131, '123123', NULL, 1, '2023-11-09 09:54:25', '1');
INSERT INTO `out_store` VALUES (37, 36, 5, 10.00, 10.00, '阳光城愉景湾施工工区', '测试', 132, '123123', NULL, 1, '2023-11-09 10:01:54', '1');
INSERT INTO `out_store` VALUES (38, 37, 5, 100.00, 20.00, '阳光城愉景湾施工工区', '测试', 133, '123123', NULL, 1, '2023-11-09 11:39:38', '1');
INSERT INTO `out_store` VALUES (39, 37, 5, 100.00, 20.00, '深汕天威视讯施工工区', '惠璟建材', 134, '12313', NULL, 1, '2023-11-09 13:58:55', '1');
INSERT INTO `out_store` VALUES (40, 36, 5, 52.00, 10.00, '红海湾东洲7号路施工工区', '红海湾东洲7号路施工工区', 135, '123123', NULL, 1, '2023-11-09 15:26:37', '1');
INSERT INTO `out_store` VALUES (41, 37, 5, 123.00, 10.00, '红海湾东洲7号路施工工区', '红海湾东洲7号路', 136, '123123', NULL, 37, '2023-11-13 11:15:07', '1');
INSERT INTO `out_store` VALUES (42, 37, 5, 23.00, 10.00, '红海湾田乾6号路施工工区', '红海湾田乾6号路', 137, '123123', NULL, 1, '2023-11-13 11:23:05', '1');
INSERT INTO `out_store` VALUES (43, 37, 5, 23.00, 10.00, '红海湾田乾6号路施工工区', '红海湾田乾6号路', 137, '123123', NULL, 1, '2023-11-13 11:31:50', '1');
INSERT INTO `out_store` VALUES (44, 37, 5, 77.00, 10.00, '红海湾田乾6号路施工工区', '测试', 137, '123123', NULL, 1, '2023-11-13 11:32:48', '1');
INSERT INTO `out_store` VALUES (45, 37, 5, 123.00, 10.00, '深汕天威视讯施工工区', '深汕天威视讯', 138, '123123', NULL, 1, '2023-11-13 11:43:15', '1');
INSERT INTO `out_store` VALUES (46, 36, 5, 18.90, 100.00, '123', '123', 142, '123123', NULL, 1, '2023-11-15 15:39:10', '1');
INSERT INTO `out_store` VALUES (47, 36, 5, 123.00, 20.00, '红海湾东洲7号路施工工区', '测试', 139, '123', NULL, 1, '2023-11-16 16:42:49', '1');
INSERT INTO `out_store` VALUES (48, 36, 5, 123.10, 20.11, '红海湾东洲7号路施工工区', '测试', 139, '123', NULL, 1, '2023-11-16 16:55:52', '1');
INSERT INTO `out_store` VALUES (49, 36, 5, 123.00, 20.11, '红海湾东洲7号路施工工区', '13', 139, '', NULL, 1, '2023-11-16 17:04:03', '1');
INSERT INTO `out_store` VALUES (50, 37, 5, 123.00, 10.00, '测试', '测试', 145, '123123', NULL, 1, '2023-11-17 09:24:18', '1');
INSERT INTO `out_store` VALUES (51, 37, 5, 123.00, 10.00, '测试工区', '测试', 146, '123', NULL, 1, '2023-11-17 10:15:56', '1');
INSERT INTO `out_store` VALUES (52, 36, 5, 12.00, 12.00, '123', 'qi', 141, '121313', NULL, 1, '2023-11-21 12:00:51', '0');
INSERT INTO `out_store` VALUES (53, 37, NULL, 20.00, 10.00, '测试', '红海湾水厂', 164, '123', NULL, 52, '2023-12-13 09:13:20', '0');
INSERT INTO `out_store` VALUES (54, 37, 5, 20.00, 12.00, '测试', '红海湾水厂', 164, '123', NULL, 52, '2023-12-13 09:13:38', '1');
INSERT INTO `out_store` VALUES (55, 37, NULL, 112.00, 10.00, '112', '红海湾水厂', 166, '123', NULL, 52, '2023-12-13 09:16:18', '0');
INSERT INTO `out_store` VALUES (56, 37, 5, 123.00, 10.00, '112', '红海湾水厂', 166, '123', NULL, 52, '2023-12-13 09:16:32', '1');
INSERT INTO `out_store` VALUES (59, 38, 5, 123.00, 10.00, '海丰县海城镇', NULL, 173, '123', NULL, 1, '2024-01-04 09:51:15', '1');
INSERT INTO `out_store` VALUES (60, 38, 5, 100.00, 10.00, '海丰县海城镇', NULL, 179, '123', NULL, 1, '2024-01-15 16:49:42', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `store_id` int NULL DEFAULT NULL COMMENT '仓库id',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品在库数量',
  `unit_id` int NULL DEFAULT NULL COMMENT '单位',
  `sale_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售单价',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` int NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (35, 5, '测试修改产品', '12', 8, 12.00, '2023-10-24 10:02:01', '2023-10-24 10:02:17', 1, 1);
INSERT INTO `product` VALUES (36, 5, 'AC-20', '123', 8, 1.00, '2023-10-25 08:53:09', '2023-10-25 08:53:41', 1, 1);
INSERT INTO `product` VALUES (37, 5, 'AC-10', '1', 8, NULL, '2023-10-25 08:53:21', NULL, 1, NULL);
INSERT INTO `product` VALUES (38, 5, 'AC-13', '1', 8, 1.00, '2023-10-25 08:53:56', NULL, 1, NULL);
INSERT INTO `product` VALUES (39, 5, 'AC-25', '1', 8, 1.00, '2023-10-25 08:54:14', NULL, 1, NULL);

-- ----------------------------
-- Table structure for product_material
-- ----------------------------
DROP TABLE IF EXISTS `product_material`;
CREATE TABLE `product_material`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL COMMENT '产品id',
  `material_id` int NULL DEFAULT NULL COMMENT '材料id',
  `ratio` double NULL DEFAULT NULL COMMENT '材料占比',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` int NULL DEFAULT NULL COMMENT '创建人',
  `update_by` int NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_material
-- ----------------------------
INSERT INTO `product_material` VALUES (1, 35, 35, 0.37, '2023-10-24 11:12:28', '2023-10-24 14:24:54', 1, 1);
INSERT INTO `product_material` VALUES (3, 37, 36, 0.3, '2023-10-25 08:58:04', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (4, 37, 37, 0.31, '2023-10-25 08:58:15', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (5, 37, 38, 0.35, '2023-10-25 08:58:27', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (6, 37, 39, 0.04, '2023-10-25 08:58:39', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (7, 36, 36, 0.17, '2023-11-08 09:33:26', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (8, 36, 37, 0.12, '2023-11-08 09:37:26', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (9, 36, 38, 0.28, '2023-11-08 09:37:37', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (10, 36, 39, 0.02, '2023-11-08 09:37:49', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (12, 36, 42, 0.19, '2023-11-08 09:38:17', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (13, 36, 43, 0.22, '2023-11-08 09:38:56', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (14, 37, 40, 0.039, '2023-11-09 14:39:29', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (15, 36, 40, 0.055, '2023-11-09 14:39:41', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (16, 38, 43, 0.22, '2023-12-28 20:48:44', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (17, 38, 36, 0.23, '2023-12-28 20:48:56', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (18, 38, 37, 0.08, '2023-12-28 20:49:05', '2023-12-28 20:51:35', 1, 1);
INSERT INTO `product_material` VALUES (19, 38, 38, 0.33, '2023-12-28 20:49:26', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (20, 38, 38, 0.2, '2023-12-28 20:51:49', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (21, 38, 39, 0.02, '2023-12-28 20:52:05', NULL, 1, NULL);
INSERT INTO `product_material` VALUES (22, 38, 40, 0.035, '2023-12-28 20:52:18', NULL, 1, NULL);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL,
  `type_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_type
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 启用 0 禁用',
  `create_by` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '管理员', 'supper_manage', '1', 1, '2017-11-14 16:49:12', 1, '2017-11-14 16:49:20');
INSERT INTO `role` VALUES (11, '采购员', '采购管理员', 'purchase_man', '1', 1, '2022-04-22 12:29:00', 1, '2022-04-22 13:56:29');
INSERT INTO `role` VALUES (12, '入库管理员', '入库管理员', 'in_store', '1', 1, '2022-04-22 13:56:17', NULL, NULL);
INSERT INTO `role` VALUES (13, '商品', '商品管理员', 'commodity_manager', '1', 1, '2022-04-22 13:57:42', NULL, NULL);
INSERT INTO `role` VALUES (14, '出库管理员', '出库管理员', 'out_store', '1', 1, '2022-04-22 14:00:00', NULL, NULL);
INSERT INTO `role` VALUES (15, '调货', '调货管理员', 'transshipment_manager', '1', 1, '2022-04-22 14:00:38', NULL, NULL);
INSERT INTO `role` VALUES (16, '仓库', '仓库管理员', 'store_manager', '1', 1, '2022-04-24 15:12:56', NULL, NULL);
INSERT INTO `role` VALUES (17, '生产员', '生产员', 'produce_man', '1', 1, '2023-10-10 15:41:14', 1, '2023-10-10 15:41:21');
INSERT INTO `role` VALUES (18, '站长', '站长', 'station_master', '1', 1, '2023-11-01 11:21:40', 1, '2023-11-01 11:21:44');
INSERT INTO `role` VALUES (19, '供应商', '供应商', 'supply', '1', 1, '2023-11-19 20:33:49', 1, '2023-11-19 20:33:52');
INSERT INTO `role` VALUES (20, '检验员', '检验员', 'inspect_man', '1', 1, '2023-11-19 20:38:20', 1, '2023-11-19 20:38:27');
INSERT INTO `role` VALUES (21, '普通用户', 'putong', 'putong', '1', 1, '2023-12-13 23:01:54', 1, '2023-12-13 23:02:11');

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth`  (
  `role_auth_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `auth_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`role_auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1634 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES (1150, 11, 42);
INSERT INTO `role_auth` VALUES (1151, 11, 50);
INSERT INTO `role_auth` VALUES (1152, 11, 93);
INSERT INTO `role_auth` VALUES (1153, 11, 94);
INSERT INTO `role_auth` VALUES (1154, 11, 97);
INSERT INTO `role_auth` VALUES (1155, 11, 76);
INSERT INTO `role_auth` VALUES (1156, 11, 53);
INSERT INTO `role_auth` VALUES (1157, 11, 56);
INSERT INTO `role_auth` VALUES (1158, 11, 102);
INSERT INTO `role_auth` VALUES (1159, 11, 104);
INSERT INTO `role_auth` VALUES (1200, 18, 1);
INSERT INTO `role_auth` VALUES (1201, 18, 2);
INSERT INTO `role_auth` VALUES (1202, 18, 3);
INSERT INTO `role_auth` VALUES (1203, 18, 10);
INSERT INTO `role_auth` VALUES (1204, 18, 23);
INSERT INTO `role_auth` VALUES (1205, 18, 24);
INSERT INTO `role_auth` VALUES (1206, 18, 25);
INSERT INTO `role_auth` VALUES (1207, 18, 26);
INSERT INTO `role_auth` VALUES (1208, 18, 35);
INSERT INTO `role_auth` VALUES (1209, 18, 36);
INSERT INTO `role_auth` VALUES (1210, 18, 98);
INSERT INTO `role_auth` VALUES (1211, 18, 99);
INSERT INTO `role_auth` VALUES (1212, 18, 102);
INSERT INTO `role_auth` VALUES (1213, 18, 104);
INSERT INTO `role_auth` VALUES (1451, 20, 42);
INSERT INTO `role_auth` VALUES (1452, 20, 50);
INSERT INTO `role_auth` VALUES (1453, 20, 93);
INSERT INTO `role_auth` VALUES (1454, 20, 94);
INSERT INTO `role_auth` VALUES (1455, 20, 97);
INSERT INTO `role_auth` VALUES (1456, 20, 114);
INSERT INTO `role_auth` VALUES (1457, 19, 72);
INSERT INTO `role_auth` VALUES (1458, 19, 74);
INSERT INTO `role_auth` VALUES (1459, 19, 115);
INSERT INTO `role_auth` VALUES (1564, 1, 1);
INSERT INTO `role_auth` VALUES (1565, 1, 2);
INSERT INTO `role_auth` VALUES (1566, 1, 3);
INSERT INTO `role_auth` VALUES (1567, 1, 10);
INSERT INTO `role_auth` VALUES (1568, 1, 23);
INSERT INTO `role_auth` VALUES (1569, 1, 24);
INSERT INTO `role_auth` VALUES (1570, 1, 25);
INSERT INTO `role_auth` VALUES (1571, 1, 26);
INSERT INTO `role_auth` VALUES (1572, 1, 35);
INSERT INTO `role_auth` VALUES (1573, 1, 36);
INSERT INTO `role_auth` VALUES (1574, 1, 4);
INSERT INTO `role_auth` VALUES (1575, 1, 5);
INSERT INTO `role_auth` VALUES (1576, 1, 6);
INSERT INTO `role_auth` VALUES (1577, 1, 27);
INSERT INTO `role_auth` VALUES (1578, 1, 28);
INSERT INTO `role_auth` VALUES (1579, 1, 30);
INSERT INTO `role_auth` VALUES (1580, 1, 31);
INSERT INTO `role_auth` VALUES (1581, 1, 37);
INSERT INTO `role_auth` VALUES (1582, 1, 42);
INSERT INTO `role_auth` VALUES (1583, 1, 50);
INSERT INTO `role_auth` VALUES (1584, 1, 93);
INSERT INTO `role_auth` VALUES (1585, 1, 94);
INSERT INTO `role_auth` VALUES (1586, 1, 97);
INSERT INTO `role_auth` VALUES (1587, 1, 114);
INSERT INTO `role_auth` VALUES (1588, 1, 53);
INSERT INTO `role_auth` VALUES (1589, 1, 56);
INSERT INTO `role_auth` VALUES (1590, 1, 54);
INSERT INTO `role_auth` VALUES (1591, 1, 57);
INSERT INTO `role_auth` VALUES (1592, 1, 95);
INSERT INTO `role_auth` VALUES (1593, 1, 55);
INSERT INTO `role_auth` VALUES (1594, 1, 58);
INSERT INTO `role_auth` VALUES (1595, 1, 69);
INSERT INTO `role_auth` VALUES (1596, 1, 70);
INSERT INTO `role_auth` VALUES (1597, 1, 72);
INSERT INTO `role_auth` VALUES (1598, 1, 74);
INSERT INTO `role_auth` VALUES (1599, 1, 115);
INSERT INTO `role_auth` VALUES (1600, 1, 98);
INSERT INTO `role_auth` VALUES (1601, 1, 99);
INSERT INTO `role_auth` VALUES (1602, 1, 100);
INSERT INTO `role_auth` VALUES (1603, 1, 101);
INSERT INTO `role_auth` VALUES (1604, 1, 118);
INSERT INTO `role_auth` VALUES (1605, 1, 102);
INSERT INTO `role_auth` VALUES (1606, 1, 104);
INSERT INTO `role_auth` VALUES (1607, 1, 105);
INSERT INTO `role_auth` VALUES (1608, 1, 106);
INSERT INTO `role_auth` VALUES (1609, 1, 107);
INSERT INTO `role_auth` VALUES (1610, 1, 113);
INSERT INTO `role_auth` VALUES (1611, 1, 108);
INSERT INTO `role_auth` VALUES (1612, 1, 109);
INSERT INTO `role_auth` VALUES (1613, 1, 110);
INSERT INTO `role_auth` VALUES (1614, 1, 111);
INSERT INTO `role_auth` VALUES (1615, 1, 112);
INSERT INTO `role_auth` VALUES (1622, 14, 55);
INSERT INTO `role_auth` VALUES (1623, 14, 58);
INSERT INTO `role_auth` VALUES (1624, 14, 102);
INSERT INTO `role_auth` VALUES (1625, 14, 104);
INSERT INTO `role_auth` VALUES (1626, 14, 111);
INSERT INTO `role_auth` VALUES (1627, 14, 112);
INSERT INTO `role_auth` VALUES (1628, 12, 54);
INSERT INTO `role_auth` VALUES (1629, 12, 57);
INSERT INTO `role_auth` VALUES (1630, 12, 95);
INSERT INTO `role_auth` VALUES (1631, 12, 102);
INSERT INTO `role_auth` VALUES (1632, 12, 104);
INSERT INTO `role_auth` VALUES (1633, 12, 111);
INSERT INTO `role_auth` VALUES (1634, 12, 112);

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `month_days` int NULL DEFAULT NULL,
  `checkin_days` int NULL DEFAULT NULL,
  `salary` decimal(10, 2) NULL DEFAULT NULL,
  `other_salary` decimal(10, 2) NULL DEFAULT NULL,
  `overtime_salary` decimal(10, 2) NULL DEFAULT NULL,
  `withhold` decimal(10, 2) NULL DEFAULT NULL,
  `net_salary` decimal(10, 2) NULL DEFAULT NULL,
  `payable_salary` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (2, 1, 31, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '0', '2023-12-01');
INSERT INTO `salary` VALUES (3, 1, 31, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '0', '2023-12-01');
INSERT INTO `salary` VALUES (4, 1, 30, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (5, 1, 30, 0, 5000.00, NULL, NULL, NULL, NULL, 0.00, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (6, 1, 30, 0, 5000.00, NULL, NULL, NULL, NULL, 0.00, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (7, 1, 30, 0, 5000.00, NULL, NULL, NULL, NULL, 0.00, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (8, 1, 30, 2, 5000.00, NULL, NULL, NULL, NULL, 333.33, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (9, 1, 30, 2, 5000.00, 1.00, 12.00, 1.00, 1.00, 345.33, '1', '1', '2023-11-01');
INSERT INTO `salary` VALUES (10, 43, 30, 1, 12000.00, NULL, NULL, NULL, NULL, 400.00, NULL, '0', '2023-11-01');
INSERT INTO `salary` VALUES (11, 1, 30, 1, 5000.00, NULL, NULL, NULL, NULL, 166.67, NULL, '0', '2023-11-01');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `concat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (5, '测试1', 'test', '测试1', '测试', '测试');

-- ----------------------------
-- Table structure for supply
-- ----------------------------
DROP TABLE IF EXISTS `supply`;
CREATE TABLE `supply`  (
  `supply_id` int NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `supply_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `supply_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `concat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否启用：0:可用  1:不可用',
  `user_id` int NULL DEFAULT NULL COMMENT '绑定账号',
  PRIMARY KEY (`supply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供货商' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supply
-- ----------------------------
INSERT INTO `supply` VALUES (6, '测试', '测试修改供应商', '测试', '测试', '测试', '0', NULL);
INSERT INTO `supply` VALUES (7, '', '笔架山石场', '笔架山负责人', '18822193131', '测试地址', '0', NULL);
INSERT INTO `supply` VALUES (8, 'jialong', '佳隆石场', '佳隆石场', '18822193131', '测试', '0', NULL);
INSERT INTO `supply` VALUES (9, '', '国丰石场', '国丰石场', '18822193131', '测试', '0', NULL);
INSERT INTO `supply` VALUES (10, '', '源海矿业', '测试', '测试', '测试', '0', NULL);
INSERT INTO `supply` VALUES (11, '', '广州楚通工程技术有限公司', '广州楚通工程技术有限公司', '12312312312', '广州楚通工程技术有限公司', '0', NULL);
INSERT INTO `supply` VALUES (12, '捷稳石场', '捷稳石场', '捷稳石场', '12313123123', '捷稳石场', '0', NULL);
INSERT INTO `supply` VALUES (13, '鑫煌化建物资', '鑫煌化建物资', '鑫煌化建物资', '12313212312', '鑫煌化建物资', '0', NULL);
INSERT INTO `supply` VALUES (14, '丰帆石灰粉厂', '丰帆石灰粉厂', '丰帆石灰粉厂', '12312312312', '丰帆石灰粉厂', '0', NULL);
INSERT INTO `supply` VALUES (15, '梅州鑫众', '梅州鑫众', '梅州鑫众', '12312312312', '梅州鑫众', '0', NULL);
INSERT INTO `supply` VALUES (16, '123', '测试供应商', '123', '123', '123', '0', 1);
INSERT INTO `supply` VALUES (17, '123', '测试供应商123', '123', '123', '123', '0', 42);

-- ----------------------------
-- Table structure for supply_payable
-- ----------------------------
DROP TABLE IF EXISTS `supply_payable`;
CREATE TABLE `supply_payable`  (
  `in_store_id` int NOT NULL COMMENT '入库单id',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `money_paid` decimal(10, 2) NULL DEFAULT NULL COMMENT '已付金额',
  `moeny_payable` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '开票日期',
  `invoice
_type` int NULL DEFAULT NULL COMMENT '发票类型',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`in_store_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supply_payable
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int UNSIGNED NULL DEFAULT NULL,
  `param_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `param_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'attendance_start_time', '06:00', 1, '上班考勤开始时间');
INSERT INTO `sys_config` VALUES (2, 'attendance_time', '08:30', 1, '上班时间');
INSERT INTO `sys_config` VALUES (3, 'attendance_end_time', '23:59', 1, '上班考勤截止时间');
INSERT INTO `sys_config` VALUES (4, 'closing_start_time', '16:30', 1, '下班考勤开始时间');
INSERT INTO `sys_config` VALUES (5, 'closing_time', '17:30', 1, '下班时间');
INSERT INTO `sys_config` VALUES (6, 'closing_end_time', '23:59', 1, '下班考勤截止时间');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '规格单位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (8, '吨', '吨');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '基本工资',
  `work_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工种',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `work_region` int NULL DEFAULT NULL COMMENT '所属工区',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 超级管理员 、 2  管理员 、 3 普通用户',
  `user_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 未审核 、1 已审核',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 正常、 1 已删除',
  `create_by` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', '管理员', 'c431d451c81e75ffac75a640590ed0a1', '中国邮政', '123123', 5000.00, '管理员', '管理员', NULL, '1', '1', '0', 1, '2017-11-14 15:14:31', 1, '2022-04-24 15:33:12');
INSERT INTO `user_info` VALUES (37, 'outadmin', 'outadmin', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 1, '2023-10-17 16:14:53', 1, '2023-10-17 16:14:55');
INSERT INTO `user_info` VALUES (38, 'puradmin', 'puradmin', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 1, '2023-10-17 16:18:04', 1, '2023-10-17 16:18:06');
INSERT INTO `user_info` VALUES (39, 'inadmin', 'inadmin', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 1, '2023-10-17 16:18:39', 1, '2023-10-17 16:18:40');
INSERT INTO `user_info` VALUES (40, 'staadmin', 'staadmin', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 1, '2023-11-01 11:23:03', 1, '2023-11-01 11:23:05');
INSERT INTO `user_info` VALUES (41, 'insadmin', 'insadmin', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 1, '2023-11-20 09:43:10', 1, '2023-11-20 09:43:16');
INSERT INTO `user_info` VALUES (42, 'supadmin', 'supadmin', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 1, '2023-11-20 09:44:40', 1, '2023-11-20 09:44:44');
INSERT INTO `user_info` VALUES (43, 'zengfanming', 'zengfanming', 'c431d451c81e75ffac75a640590ed0a1', '中国邮政', '6217995800048539989', 12000.00, '机长', '曾凡明', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (44, 'xieweisong', 'xieweisong', 'c431d451c81e75ffac75a640590ed0a1', '中国银行汕尾支行', '6217567000118049534', 4000.00, '统计', '谢伟松', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (45, 'yinguisheng', 'yinguisheng', 'c431d451c81e75ffac75a640590ed0a1', '浦发银行', '6217931034106932', 6500.00, '维修', '尹癸生', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (46, 'wusongjian', 'wusongjian', 'c431d451c81e75ffac75a640590ed0a1', '建设银行', '6217003120027191169', 6000.00, '电工', '邬松建', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (47, 'fengcheng', 'fengcheng', 'c431d451c81e75ffac75a640590ed0a1', '中国农业银行', '6228481455078408411', 7500.00, '锅炉工', '冯成', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (48, 'liul', 'liuli', 'c431d451c81e75ffac75a640590ed0a1', '中国工商银行', '6217212315011794112', 5000.00, '普工', '刘立', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (49, 'huangyitian', 'huangyitian', 'c431d451c81e75ffac75a640590ed0a1', '中国工商银行', '6222032008009858720', 3000.00, '皮卡车租机', '黄贻填', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (50, 'zhengweiping', 'zhengweiping', 'c431d451c81e75ffac75a640590ed0a1', '广州农村商业银行', '622439880018435385', 5000.00, '普工', '郑伟平', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (51, 'liweifeng', 'liweifeng', 'c431d451c81e75ffac75a640590ed0a1', '中国工商银行', '6212252410001271510', 3000.00, '会计助理', '李维凤', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (52, 'fudie', 'fudie', 'c431d451c81e75ffac75a640590ed0a1', '中国建设银行', '76217007100054235614', 3000.00, '会计助理', '付蝶', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (53, 'liuyuxing', 'liuyuxing', 'c431d451c81e75ffac75a640590ed0a1', '中国工商银行', '6222022009004041751', 5000.00, '出纳', '刘宇星', 1, '3', '1', '0', 1, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (54, 'liuzhanfei', 'liuzhanfei', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, 0.00, NULL, '刘展飞', NULL, NULL, NULL, NULL, NULL, '2019-12-13 23:04:43', NULL, NULL);
INSERT INTO `user_info` VALUES (55, 'lihei', 'lihei', 'c431d451c81e75ffac75a640590ed0a1', NULL, NULL, 0.00, NULL, '李黑', NULL, NULL, NULL, NULL, NULL, '2019-12-13 23:04:43', NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (60, 1, 1);
INSERT INTO `user_role` VALUES (61, 14, 37);
INSERT INTO `user_role` VALUES (62, 11, 38);
INSERT INTO `user_role` VALUES (63, 12, 39);
INSERT INTO `user_role` VALUES (64, 18, 40);
INSERT INTO `user_role` VALUES (65, 20, 41);
INSERT INTO `user_role` VALUES (66, 19, 42);
INSERT INTO `user_role` VALUES (76, 14, 52);
INSERT INTO `user_role` VALUES (77, 12, 52);
INSERT INTO `user_role` VALUES (78, 21, 53);

-- ----------------------------
-- Table structure for work_region
-- ----------------------------
DROP TABLE IF EXISTS `work_region`;
CREATE TABLE `work_region`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工区名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_region
-- ----------------------------
INSERT INTO `work_region` VALUES (1, '汕尾沥青站');

-- ----------------------------
-- Table structure for workday
-- ----------------------------
DROP TABLE IF EXISTS `workday`;
CREATE TABLE `workday`  (
  `id` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of workday
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
