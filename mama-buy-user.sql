/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : mama-buy-user

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2018-12-17 10:14:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user_0
-- ----------------------------
DROP TABLE IF EXISTS `t_user_0`;
CREATE TABLE `t_user_0` (
  `id` bigint(20) NOT NULL,
  `uuid` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
