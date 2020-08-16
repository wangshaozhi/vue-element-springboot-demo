/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 16/08/2020 17:05:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconcls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, '/mgt', 'index', '图书管理', 'tushu', 'index', 0);
INSERT INTO `admin_menu` VALUES (2, '/mgt/', 'index', '评论管理', 'pinglun_1', 'index', 0);
INSERT INTO `admin_menu` VALUES (3, '/mgt', 'index', '用户管理', 'yonghu_1', 'index', 0);
INSERT INTO `admin_menu` VALUES (4, '/mgt/bkMgt/eleBkMgt', 'EleBkMgt', '电子图书管理', 'tushu_3', 'bkMgt/eleBkMgt/center', 1);
INSERT INTO `admin_menu` VALUES (5, '/mgt/bkMgt/entityBkMgt', 'EntityBkMgt', '纸质图书管理', 'tushu_1', 'bkMgt/entityBkMgt/center', 1);
INSERT INTO `admin_menu` VALUES (6, '/mgt/bkMgt/otherBkMgt', 'OtherBkMgt', '其他图书管理', 'tushu_2', 'bkMgt/otherBkMgt', 1);
INSERT INTO `admin_menu` VALUES (7, '/mgt/bkMgt/eleBkMgt/eleBk', 'EleBk', '电子图书', 'tushu_1', 'bkMgt/eleBkMgt/eleBk', 4);
INSERT INTO `admin_menu` VALUES (8, '/mgt/bkMgt/entityBkMgt/entityBk', 'EntityBk', '纸质图书', 'tushu_2', 'bkMgt/entityBkMgt/entityBk', 5);
INSERT INTO `admin_menu` VALUES (9, '/mgt/cmtMgt/cmtInfo', 'CmtInfo', '评论管理', 'pinglun', 'cmtMgt/cmtInfo', 2);
INSERT INTO `admin_menu` VALUES (10, '/mgt/userMgt/userInfoMgt', 'UserInfoMgt', '用户信息管理', 'yonghu', 'userMgt/userInfoMgt/center', 3);
INSERT INTO `admin_menu` VALUES (11, '/mgt/userMgt/userInfoMgt/adminUserInfo', 'AdminUserInfo', '管理员信息', 'guanliyuan', 'userMgt/userInfoMgt/adminUserInfo', 10);
INSERT INTO `admin_menu` VALUES (12, '/mgt/userMgt/userInfoMgt/comUserInfo', 'ComUserInfo', '普通用户信息', 'yonghu_2', 'userMgt/userInfoMgt/comUserInfo', 10);
INSERT INTO `admin_menu` VALUES (13, '/mgt/userMgt/userRoleMgt', 'UserRoleMgt', '用户角色管理', 'jiaoseguanli', 'userMgt/userRoleMgt', 3);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NULL DEFAULT NULL,
  `mid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 1, 1);
INSERT INTO `admin_role_menu` VALUES (2, 1, 2);
INSERT INTO `admin_role_menu` VALUES (3, 1, 3);
INSERT INTO `admin_role_menu` VALUES (4, 2, 2);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_operator_role_operator_1`(`usertype`) USING BTREE,
  INDEX `fk_operator_role_role_1`(`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (1, '系统管理员', 1);
INSERT INTO `admin_user_role` VALUES (2, '普通用户', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '1013d5a6d92f8da3d0144e7067c091e9', '8O+vDNr2sI3N82BI31fu1A==', '系统管理员', '111222222', 'admin@163.com', 1);
INSERT INTO `user` VALUES (2, 'test', '85087738b6c1e1d212683bfafc163853', 'JBba3j5qRykIPJQYTNNH9A==', '普通用户', '44455556666', 'test@163.com', 1);
INSERT INTO `user` VALUES (3, 'visitor', '8583a2d965d6159edbf65c82d871fa3e', 'MZTe7Qwf9QgXBXrZzTIqJQ==', '普通用户', '12345678910', 'visitor@163.com', 1);
INSERT INTO `user` VALUES (7, 'test3', 'a2394347903f9c3391500503d1d696f6', 'c58WMu+Cf2YWcUqS4Vxk+w==', '普通用户', '1111', '123@123', 1);
INSERT INTO `user` VALUES (8, '张三', '97380f5d9a4a4ce2773b101f54245bf7', 'bRQSLsfC2p7fHkR2smU8gg==', '普通用户', '12345678910', 'zhangsan@163.com', 1);
INSERT INTO `user` VALUES (9, '李四', 'e79c12080c10091d0872ac8056727f0f', 'p7xQRXZyJN5rS91+AO9FVA==', '普通用户', '123456', 'lisi@163.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
