/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : template

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 05/06/2020 14:08:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dic
-- ----------------------------
DROP TABLE IF EXISTS `dic`;
CREATE TABLE `dic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dic
-- ----------------------------
INSERT INTO `dic` VALUES (7, '01', '家电类', '资产列表');
INSERT INTO `dic` VALUES (8, '02', '家具类', '资产列表');
INSERT INTO `dic` VALUES (9, '03', '龙宝大厦', '存放地点-龙宝大厦');
INSERT INTO `dic` VALUES (10, '04', '亮马桥大厦', '存放地点-中介');

-- ----------------------------
-- Table structure for dic_details
-- ----------------------------
DROP TABLE IF EXISTS `dic_details`;
CREATE TABLE `dic_details`  (
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典编码',
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项编码',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`key`, `code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dic_details
-- ----------------------------
INSERT INTO `dic_details` VALUES ('03', '01', '201', 1);
INSERT INTO `dic_details` VALUES ('04', '01', '1001', 1);
INSERT INTO `dic_details` VALUES ('03', '02', '202', 2);
INSERT INTO `dic_details` VALUES ('04', '02', '1002', 2);
INSERT INTO `dic_details` VALUES ('03', '03', '203', 3);
INSERT INTO `dic_details` VALUES ('04', '03', '1003', 3);
INSERT INTO `dic_details` VALUES ('01', '1', '电视', 1);
INSERT INTO `dic_details` VALUES ('02', '1', '沙发', 1);
INSERT INTO `dic_details` VALUES ('jd', '1', '电视', 1);
INSERT INTO `dic_details` VALUES ('jiadian', '1', '电视', 1);
INSERT INTO `dic_details` VALUES ('jiaju', '1', '沙发', 1);
INSERT INTO `dic_details` VALUES ('lmqds', '1001', '1001', 1);
INSERT INTO `dic_details` VALUES ('lmqds', '1002', '1002', 2);
INSERT INTO `dic_details` VALUES ('lmqds', '1003', '1003', 3);
INSERT INTO `dic_details` VALUES ('01', '2', '空调', 2);
INSERT INTO `dic_details` VALUES ('02', '2', '床', 2);
INSERT INTO `dic_details` VALUES ('jd', '2', '空调', 2);
INSERT INTO `dic_details` VALUES ('jiadian', '2', '空调', 2);
INSERT INTO `dic_details` VALUES ('jiaju', '2', '床', 2);
INSERT INTO `dic_details` VALUES ('lbds', '201', '201', 1);
INSERT INTO `dic_details` VALUES ('lbds', '202', '202', 2);
INSERT INTO `dic_details` VALUES ('lbds', '203', '203', 3);
INSERT INTO `dic_details` VALUES ('01', '3', '电脑', 3);
INSERT INTO `dic_details` VALUES ('jd', '3', '电脑', 3);
INSERT INTO `dic_details` VALUES ('jiadian', '3', '电脑', 3);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单主键',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父菜单主键',
  `parent_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单名称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单name',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方链接',
  `sort` int(11) NULL DEFAULT NULL COMMENT '菜单排序',
  `activite` int(11) NULL DEFAULT 1 COMMENT '是否激活 1.激活 0.未激活',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `lastmodify_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '', 'System', '/system', 'el-icon-eleme', '系统管理', '', 1, 1, '2020-05-06 14:32:50', '2020-05-06 17:00:24');
INSERT INTO `menu` VALUES (3, 1, '系统管理', 'MenuManage', '/system/menuManage', 'el-icon-eleme', '菜单维护', '', 1, 1, '2020-05-06 15:12:18', '2020-05-06 15:39:50');
INSERT INTO `menu` VALUES (6, 1, '系统管理', 'Role', '/system/role', 'el-icon-eleme', '角色维护', '', 2, 1, '2020-05-08 14:26:40', '2020-05-08 14:27:27');
INSERT INTO `menu` VALUES (8, 1, '系统管理', 'Link', '/system/link/vue', '', 'Vue', 'https://cn.vuejs.org/', 4, 1, '2020-05-08 14:36:19', '2020-05-08 16:05:54');
INSERT INTO `menu` VALUES (9, 1, '系统管理', 'User', '/system/user', '', '用户管理', '', 3, 1, '2020-05-09 15:27:00', '2020-05-09 15:28:11');
INSERT INTO `menu` VALUES (10, 1, '系统管理', 'Dic', '/system/dic', '', '字典维护', '', 5, 1, '2020-06-01 14:43:40', '2020-06-01 14:43:40');
INSERT INTO `menu` VALUES (11, 1, '系统管理', 'SystemParameters', '/system/systemParameters', '', '系统参数', '', 6, 1, '2020-06-01 14:44:18', '2020-06-01 14:44:18');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `person_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `lastmodify_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, 1, '超级管理员', '1', NULL, '', '', '', '2020-05-11 10:00:32', '2020-05-11 10:00:32');
INSERT INTO `person` VALUES (2, 2, '测试', '1', '2020-05-05 00:00:00', '18311112222', '2356834843@qq.com', 'aaaaaaaaaa', '2020-05-11 11:02:32', '2020-05-11 11:02:32');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色代码',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `role_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 1.正常 2.禁用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `lastmodify_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '超级管理员', '超级管理员权限，拥有所有菜单权限', 1, '2020-05-04 14:54:46', '2020-05-04 14:55:10');
INSERT INTO `role` VALUES (2, 'test', '测试', '测试人员', 1, '2020-05-07 16:33:24', '2020-05-07 16:33:23');
INSERT INTO `role` VALUES (3, '1', '1', '1', 1, '2020-05-08 10:38:35', '2020-05-08 10:38:35');
INSERT INTO `role` VALUES (4, '2', '2', '2', 1, '2020-05-08 10:38:40', '2020-05-08 10:38:40');
INSERT INTO `role` VALUES (5, '3', '3', '3', 1, '2020-05-08 10:38:44', '2020-05-08 10:38:44');
INSERT INTO `role` VALUES (6, '4', '4', '4', 1, '2020-05-08 10:38:48', '2020-05-08 10:38:48');
INSERT INTO `role` VALUES (7, '5', '5', '5', 1, '2020-05-08 10:38:52', '2020-05-08 10:38:52');
INSERT INTO `role` VALUES (8, '6', '6', '6', 1, '2020-05-08 10:38:56', '2020-05-08 10:38:56');
INSERT INTO `role` VALUES (9, '7', '7', '7', 1, '2020-05-08 10:39:03', '2020-05-08 10:39:03');
INSERT INTO `role` VALUES (10, '8', '8', '8', 1, '2020-05-08 10:39:10', '2020-05-08 10:39:10');

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (1, 1, '2020-05-08 10:10:47');
INSERT INTO `role_menus` VALUES (1, 3, '2020-05-08 10:10:47');
INSERT INTO `role_menus` VALUES (2, 4, '2020-05-08 10:11:10');
INSERT INTO `role_menus` VALUES (2, 5, '2020-05-08 10:11:10');

-- ----------------------------
-- Table structure for system_parameters
-- ----------------------------
DROP TABLE IF EXISTS `system_parameters`;
CREATE TABLE `system_parameters`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数编码',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_parameters
-- ----------------------------
INSERT INTO `system_parameters` VALUES (2, 'test', '1', '测试');
INSERT INTO `system_parameters` VALUES (3, 'test2', '2', 'ceshi');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录用户名',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 1.正常 2.禁用',
  `disable_time` datetime(0) NULL DEFAULT NULL COMMENT '禁用时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `lastmodify_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$ErL0qevweD2elqPRPJhfGeM7NXqFclpRj8jj2zqxCd3HeVBHo753e', 1, NULL, '2020-04-24 13:38:42', '2020-05-02 18:30:33');
INSERT INTO `user` VALUES (2, 'test', '$2a$10$T3CZIUl9u/AXgpCsDRLehOHK63okxcB2vGpXn4fPNRdTfD.6N4EJC', 1, NULL, '2020-05-11 11:02:32', '2020-05-11 11:02:32');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1, NULL);
INSERT INTO `user_roles` VALUES (2, 2, NULL);

SET FOREIGN_KEY_CHECKS = 1;
