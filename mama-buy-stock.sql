/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : mama-buy-stock

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2018-12-29 14:23:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `stock` int(20) NOT NULL,
  `lock_stock` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_stock
-- ----------------------------
INSERT INTO `t_stock` VALUES ('1', '1', '200', '0', '2018-12-22 09:59:35', '2018-12-22 09:59:38');
INSERT INTO `t_stock` VALUES ('2', '2', '310', '0', '2018-12-22 09:59:55', '2018-12-22 09:59:55');
INSERT INTO `t_stock` VALUES ('3', '3', '578', '0', '2018-12-22 10:00:07', '2018-12-22 10:00:07');
INSERT INTO `t_stock` VALUES ('4', '4', '235', '0', '2018-12-22 10:00:18', '2018-12-22 10:00:18');
INSERT INTO `t_stock` VALUES ('5', '5', '41', '0', '2018-12-22 10:00:31', '2018-12-22 10:00:31');
INSERT INTO `t_stock` VALUES ('6', '6', '143', '0', '2018-12-22 10:00:45', '2018-12-22 10:00:45');

-- ----------------------------
-- Table structure for t_stock_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_flow`;
CREATE TABLE `t_stock_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `stock_before` int(11) DEFAULT NULL,
  `stock_after` int(11) DEFAULT NULL,
  `stock_change` int(11) DEFAULT NULL,
  `lock_stock_before` int(11) DEFAULT NULL,
  `lock_stock_after` int(11) DEFAULT NULL,
  `lock_stock_change` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `check_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_stock_flow
-- ----------------------------
INSERT INTO `t_stock_flow` VALUES ('6', '6', '1', '200', '195', '-5', '0', '5', '5', '2018-12-22 21:34:50', '2018-12-22 21:34:50', null);
