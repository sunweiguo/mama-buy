/*
Navicat MySQL Data Transfer

Source Server         : 码码购
Source Server Version : 50719
Source Host           : 47.94.233.194:3306
Source Database       : mama-buy-trade

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-07 18:05:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', '华为', '2018-03-16 15:24:56', '2018-03-16 15:24:56');
INSERT INTO `t_brand` VALUES ('2', '小米', '2018-03-16 15:25:40', '2018-03-16 15:30:15');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `sort_order` int(4) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '0', '手机 ', '1', '1', '2018-03-16 15:35:03', '2018-03-16 15:35:03');
INSERT INTO `t_category` VALUES ('2', '0', '笔记本', '1', '2', '2018-03-16 15:35:46', '2018-03-16 15:53:40');
INSERT INTO `t_category` VALUES ('4', '0', '智能家居', '1', '4', '2018-03-16 15:36:59', '2018-03-16 15:40:16');
INSERT INTO `t_category` VALUES ('6', '1', '荣耀系列', '1', '1', '2018-03-16 15:39:20', '2018-03-16 15:43:27');
INSERT INTO `t_category` VALUES ('7', '1', 'HUAWEI P系列', '1', '2', '2018-03-16 15:40:10', '2018-03-16 15:40:24');
INSERT INTO `t_category` VALUES ('8', '1', 'HUAWEI Mate系列', '1', '3', '2018-03-16 15:40:57', '2018-03-16 15:41:27');
INSERT INTO `t_category` VALUES ('9', '1', 'HUAWEI Nova系列', '1', '4', '2018-03-16 15:41:26', '2018-03-16 15:41:28');
INSERT INTO `t_category` VALUES ('10', '1', 'HUAWEI 麦芒系列', '1', '5', '2018-03-16 15:41:51', '2018-03-16 15:41:57');
INSERT INTO `t_category` VALUES ('11', '1', '小米系列', '1', '6', '2018-03-16 15:43:21', '2018-03-16 17:53:03');
INSERT INTO `t_category` VALUES ('12', '1', '红米系列', '1', '7', '2018-03-16 15:45:16', '2018-03-16 17:53:10');
INSERT INTO `t_category` VALUES ('13', '1', '小米 Note系列', '1', '8', '2018-03-16 15:46:02', '2018-03-16 15:46:02');
INSERT INTO `t_category` VALUES ('14', '1', '红米 Note系列', '1', '9', '2018-03-16 15:46:19', '2018-03-16 15:46:32');
INSERT INTO `t_category` VALUES ('15', '1', '小米 MIX系列', '1', '10', '2018-03-16 15:46:31', '2018-03-16 15:46:39');
INSERT INTO `t_category` VALUES ('16', '2', '小米笔记本 Air系列', '1', '1', '2018-03-16 15:47:31', '2018-03-16 21:55:38');
INSERT INTO `t_category` VALUES ('17', '2', '小米笔记本 Pro系列', '1', '2', '2018-03-16 15:47:47', '2018-03-16 22:00:08');
INSERT INTO `t_category` VALUES ('18', '2', 'HUAWEI MateBook系列', '1', '3', '2018-03-16 15:48:49', '2018-03-16 15:48:49');
INSERT INTO `t_category` VALUES ('22', '4', '小米电视 4', '1', '2', '2018-03-16 16:13:01', '2018-03-16 16:13:07');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `spu_name` varchar(255) NOT NULL COMMENT '产品spu名称  standard product unit',
  `price` decimal(10,2) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 上架 2 下架',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '6', '1', '荣耀V10 全网通标准版 4G+64G(极光蓝) ', '2699.00', '1', '2018-03-16 17:01:35', '2018-03-16 17:01:35');
INSERT INTO `t_product` VALUES ('2', '6', '1', '荣耀V9 全网通高配版 6GB+64GB（极光蓝）', '2699.00', '1', '2018-03-16 17:01:59', '2018-03-16 17:01:59');
INSERT INTO `t_product` VALUES ('3', '6', '1', '荣耀9青春版 全网通标配版（魅海蓝）', '1199.00', '1', '2018-03-16 17:02:30', '2018-03-16 17:02:30');
INSERT INTO `t_product` VALUES ('4', '6', '1', '荣耀8青春版 全网通高配版（幻海蓝）', '1399.00', '1', '2018-03-16 17:02:55', '2018-03-16 17:02:55');
INSERT INTO `t_product` VALUES ('5', '6', '1', '荣耀V9 play 全网通高配版（极光蓝）', '1199.00', '1', '2018-03-16 17:03:20', '2018-03-16 17:03:20');
INSERT INTO `t_product` VALUES ('6', '6', '1', '荣耀9 全网通标配版 4GB+64GB（海鸥灰）', '2299.00', '1', '2018-03-16 17:03:35', '2018-03-16 17:03:35');
INSERT INTO `t_product` VALUES ('7', '6', '1', '荣耀8 4GB+64GB 全网通版（魅海蓝）', '1699.00', '1', '2018-03-16 17:04:04', '2018-03-16 17:04:04');
INSERT INTO `t_product` VALUES ('8', '6', '1', '荣耀 NOTE 8 4GB+64GB 全网通版（铂光金）', '1999.00', '1', '2018-03-16 17:04:21', '2018-03-16 17:04:21');
INSERT INTO `t_product` VALUES ('9', '7', '1', 'HUAWEI P10 4GB+64GB 全网通版（曜石黑）', '3488.00', '1', '2018-03-16 17:23:54', '2018-03-16 17:23:54');
INSERT INTO `t_product` VALUES ('10', '7', '1', 'HUAWEI P10 Plus 6GB+128GB 全网通版（曜石黑）', '4488.00', '1', '2018-03-16 17:28:51', '2018-03-16 17:28:51');
INSERT INTO `t_product` VALUES ('11', '8', '1', 'HUAWEI Mate 10 保时捷设计 6+256GB 全网通（钻石黑）', '8999.00', '1', '2018-03-16 17:29:16', '2018-03-16 17:29:16');
INSERT INTO `t_product` VALUES ('12', '8', '1', 'HUAWEI Mate 10 Pro 6GB+128GB 全网通版（摩卡金）', '5399.00', '1', '2018-03-16 17:29:40', '2018-03-16 17:29:40');
INSERT INTO `t_product` VALUES ('13', '8', '1', 'HUAWEI Mate 10 6GB+128GB 全网通版（摩卡金）', '4499.00', '1', '2018-03-16 17:30:02', '2018-03-16 17:30:02');
INSERT INTO `t_product` VALUES ('14', '8', '1', 'HUAWEI Mate 9 Pro 4GB+64GB 全网通版（玫瑰金）', '4399.00', '1', '2018-03-16 17:30:10', '2018-03-16 17:30:10');
INSERT INTO `t_product` VALUES ('15', '9', '1', 'HUAWEI nova 2 4GB+64GB 全网通版（流光金）后壳定制', '2199.00', '1', '2018-03-16 17:41:19', '2018-03-16 17:41:19');
INSERT INTO `t_product` VALUES ('16', '9', '1', 'HUAWEI nova 2s 6GB+64G 全网通版（樱粉金）', '2999.00', '1', '2018-03-16 17:46:32', '2018-03-16 17:46:32');
INSERT INTO `t_product` VALUES ('17', '10', '1', 'HUAWEI 麦芒5 全网通高配版（香槟金）', '2399.00', '1', '2018-03-16 17:47:32', '2018-03-16 17:47:32');
INSERT INTO `t_product` VALUES ('18', '10', '1', 'HUAWEI 麦芒6 4GB+64GB 全网通版（流光金）', '2199.00', '1', '2018-03-16 17:47:48', '2018-03-16 17:47:48');
INSERT INTO `t_product` VALUES ('19', '11', '2', '小米5X', '1499.00', '1', '2018-03-16 17:55:13', '2018-03-16 17:55:13');
INSERT INTO `t_product` VALUES ('20', '11', '2', '小米6 全网通版 4GB内存', '2299.00', '1', '2018-03-16 17:55:26', '2018-03-16 17:55:26');
INSERT INTO `t_product` VALUES ('21', '11', '2', '小米Max2 全网通版 4GB内存', '1899.00', '1', '2018-03-16 17:55:57', '2018-03-16 17:55:57');
INSERT INTO `t_product` VALUES ('22', '11', '2', '小米手机5s 高配全网通版 3GB内存', '1999.00', '1', '2018-03-16 17:56:37', '2018-03-16 17:56:37');
INSERT INTO `t_product` VALUES ('23', '12', '2', '红米5A 全网通版 3GB内存 32GB', '699.00', '1', '2018-03-16 17:57:13', '2018-03-16 17:57:13');
INSERT INTO `t_product` VALUES ('24', '12', '2', '红米手机4A 全网通版 16GB', '549.00', '1', '2018-03-16 17:57:58', '2018-03-16 17:57:58');
INSERT INTO `t_product` VALUES ('25', '12', '2', '红米手机 4 高配全网通版 3GB内存 32GB', '999.00', '1', '2018-03-16 17:58:39', '2018-03-16 17:58:39');
INSERT INTO `t_product` VALUES ('26', '12', '2', '红米5 Plus 全网通版 4GB内存', '1299.00', '1', '2018-03-16 17:59:07', '2018-03-16 17:59:07');
INSERT INTO `t_product` VALUES ('27', '12', '2', '红米5 全网通版 3GB内存', '899.00', '1', '2018-03-16 17:59:17', '2018-03-16 17:59:17');
INSERT INTO `t_product` VALUES ('28', '13', '2', '小米Note 3 全网通版 6GB内存 128GB', '2699.00', '1', '2018-03-16 18:00:30', '2018-03-16 18:00:30');
INSERT INTO `t_product` VALUES ('29', '14', '2', '红米Note 4X 全网通版', '999.00', '1', '2018-03-16 18:01:56', '2018-03-16 18:01:56');
INSERT INTO `t_product` VALUES ('30', '14', '2', '红米Note 5A 全网通版 3GB内存 32GB', '899.00', '1', '2018-03-16 18:03:45', '2018-03-16 18:03:45');
INSERT INTO `t_product` VALUES ('31', '15', '2', '小米MIX 2 全网通版 8GB内存 全陶瓷尊享版', '4299.00', '1', '2018-03-16 18:05:12', '2018-03-16 18:05:12');
INSERT INTO `t_product` VALUES ('32', '16', '2', '小米笔记本Air 12.5\"', '3599.00', '1', '2018-03-16 18:44:14', '2018-03-16 18:44:14');
INSERT INTO `t_product` VALUES ('33', '16', '2', '小米笔记本Air 13.3\" 独显', '5199.00', '1', '2018-03-16 18:44:41', '2018-03-16 18:44:41');
INSERT INTO `t_product` VALUES ('34', '17', '2', '小米笔记本Pro 15.6\"', '5599.00', '1', '2018-03-16 18:49:16', '2018-03-16 18:49:16');
INSERT INTO `t_product` VALUES ('35', '18', '1', 'HUAWEI MateBook X（I5 CPU+4GB内存RAM+256GB）流光金', '5988.00', '1', '2018-03-16 18:48:44', '2018-03-16 18:48:44');
INSERT INTO `t_product` VALUES ('36', '18', '1', 'HUAWEI MateBook D（I5 CPU+8GB内存+256GB+0GB）皓月银', '5188.00', '1', '2018-03-16 18:48:46', '2018-03-16 18:48:46');
INSERT INTO `t_product` VALUES ('37', '18', '1', 'HUAWEI MateBook E（I5+4GB+256GB）主机（钛银灰）', '6888.00', '1', '2018-03-16 18:48:50', '2018-03-16 18:48:50');
INSERT INTO `t_product` VALUES ('38', '21', '2', '小米电视4A 32英寸', '999.00', '1', '2018-03-16 18:50:22', '2018-03-16 18:50:22');
INSERT INTO `t_product` VALUES ('39', '22', '2', '小米电视4 55英寸', '3999.00', '1', '2018-03-16 18:51:32', '2018-03-16 18:51:32');
INSERT INTO `t_product` VALUES ('102', '22', '3', '小米电视5', '4444.00', '1', '2018-03-19 16:39:52', '2018-03-19 16:39:52');
INSERT INTO `t_product` VALUES ('103', '22', '4', '小米手表', '555.00', '1', '2018-03-19 17:13:24', '2018-03-19 17:13:24');
INSERT INTO `t_product` VALUES ('104', '22', '5', '西红柿', '2.00', '1', '2018-03-19 21:29:35', '2018-03-19 21:29:35');

-- ----------------------------
-- Table structure for t_property
-- ----------------------------
DROP TABLE IF EXISTS `t_property`;
CREATE TABLE `t_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_property
-- ----------------------------
INSERT INTO `t_property` VALUES ('1', '6', '颜色', '2018-03-16 19:02:42', '2018-03-16 19:02:42');
INSERT INTO `t_property` VALUES ('2', '6', '容量', '2018-03-16 19:02:51', '2018-03-16 19:02:51');
INSERT INTO `t_property` VALUES ('3', '6', '制式', '2018-03-16 19:04:23', '2018-03-16 19:04:23');
INSERT INTO `t_property` VALUES ('4', '6', '套餐', '2018-03-16 19:04:30', '2018-03-16 19:04:30');
INSERT INTO `t_property` VALUES ('5', '6', '定制', '2018-03-16 19:05:40', '2018-03-16 19:05:40');
INSERT INTO `t_property` VALUES ('6', '7', '颜色', '2018-03-16 19:02:42', '2018-03-16 19:29:17');
INSERT INTO `t_property` VALUES ('7', '7', '容量', '2018-03-16 19:02:51', '2018-03-16 19:29:18');
INSERT INTO `t_property` VALUES ('8', '7', '制式', '2018-03-16 19:04:23', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('9', '7', '套餐', '2018-03-16 19:04:30', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('10', '7', '定制', '2018-03-16 19:05:40', '2018-03-16 19:29:21');
INSERT INTO `t_property` VALUES ('11', '8', '颜色', '2018-03-16 19:02:42', '2018-03-16 19:29:17');
INSERT INTO `t_property` VALUES ('12', '8', '容量', '2018-03-16 19:02:51', '2018-03-16 19:29:18');
INSERT INTO `t_property` VALUES ('13', '8', '制式', '2018-03-16 19:04:23', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('14', '8', '套餐', '2018-03-16 19:04:30', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('16', '9', '颜色', '2018-03-16 19:02:42', '2018-03-16 19:29:17');
INSERT INTO `t_property` VALUES ('17', '9', '容量', '2018-03-16 19:02:51', '2018-03-16 19:29:18');
INSERT INTO `t_property` VALUES ('18', '9', '制式', '2018-03-16 19:04:23', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('19', '9', '套餐', '2018-03-16 19:04:30', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('20', '9', '定制', '2018-03-16 19:05:40', '2018-03-16 19:29:21');
INSERT INTO `t_property` VALUES ('21', '10', '颜色', '2018-03-16 19:02:42', '2018-03-16 19:29:17');
INSERT INTO `t_property` VALUES ('22', '10', '容量', '2018-03-16 19:02:51', '2018-03-16 19:29:18');
INSERT INTO `t_property` VALUES ('23', '10', '制式', '2018-03-16 19:04:23', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('24', '10', '套餐', '2018-03-16 19:04:30', '2018-03-16 19:29:19');
INSERT INTO `t_property` VALUES ('25', '11', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('26', '11', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('27', '12', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('28', '12', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('29', '13', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('30', '13', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('31', '14', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('32', '14', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('33', '15', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('34', '15', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('35', '16', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('36', '16', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('37', '17', '版本', '2018-03-16 20:41:07', '2018-03-16 20:41:07');
INSERT INTO `t_property` VALUES ('38', '17', '颜色', '2018-03-16 20:41:14', '2018-03-16 20:41:14');
INSERT INTO `t_property` VALUES ('39', '18', '颜色', '2018-03-16 22:00:50', '2018-03-16 22:00:50');
INSERT INTO `t_property` VALUES ('40', '18', '配置', '2018-03-16 22:01:54', '2018-03-16 22:01:54');
INSERT INTO `t_property` VALUES ('41', '22', '颜色', '2018-03-16 22:12:35', '2018-03-16 22:13:12');
INSERT INTO `t_property` VALUES ('42', '22', '尺寸', '2018-03-16 22:12:47', '2018-03-16 22:12:47');

-- ----------------------------
-- Table structure for t_property_option
-- ----------------------------
DROP TABLE IF EXISTS `t_property_option`;
CREATE TABLE `t_property_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_property_option
-- ----------------------------
INSERT INTO `t_property_option` VALUES ('1', '1', '沙滩金', '2018-03-16 19:06:32', '2018-03-16 19:06:32');
INSERT INTO `t_property_option` VALUES ('2', '1', '极光蓝', '2018-03-16 19:06:47', '2018-03-16 19:06:47');
INSERT INTO `t_property_option` VALUES ('3', '1', '幻夜黑', '2018-03-16 19:07:00', '2018-03-16 19:07:00');
INSERT INTO `t_property_option` VALUES ('4', '1', '魅力红', '2018-03-16 19:07:11', '2018-03-16 19:07:11');
INSERT INTO `t_property_option` VALUES ('5', '2', '4G+64G', '2018-03-16 19:07:38', '2018-03-16 19:07:38');
INSERT INTO `t_property_option` VALUES ('6', '2', '6G+64G', '2018-03-16 19:08:00', '2018-03-16 19:08:00');
INSERT INTO `t_property_option` VALUES ('7', '2', '6G+128G', '2018-03-16 19:08:07', '2018-03-16 19:08:07');
INSERT INTO `t_property_option` VALUES ('8', '3', '全网通标准版', '2018-03-16 19:08:29', '2018-03-16 19:08:29');
INSERT INTO `t_property_option` VALUES ('9', '3', '全网通高配版', '2018-03-16 19:08:50', '2018-03-16 19:08:50');
INSERT INTO `t_property_option` VALUES ('10', '3', '全网通尊享版', '2018-03-16 19:09:04', '2018-03-16 19:09:04');
INSERT INTO `t_property_option` VALUES ('11', '4', '官方标配', '2018-03-16 19:09:36', '2018-03-16 19:09:36');
INSERT INTO `t_property_option` VALUES ('12', '4', '超值套餐1', '2018-03-16 19:09:48', '2018-03-16 19:09:48');
INSERT INTO `t_property_option` VALUES ('13', '5', '后壳定制', '2018-03-16 19:09:56', '2018-03-16 19:09:56');
INSERT INTO `t_property_option` VALUES ('14', '5', '无定制', '2018-03-16 19:10:04', '2018-03-16 19:10:04');
INSERT INTO `t_property_option` VALUES ('15', '2', '4G+32G', '2018-03-16 19:13:14', '2018-03-16 19:13:14');
INSERT INTO `t_property_option` VALUES ('16', '2', '3G+32G', '2018-03-16 19:13:25', '2018-03-16 19:13:25');
INSERT INTO `t_property_option` VALUES ('17', '4', '套餐2', '2018-03-16 19:14:18', '2018-03-16 19:14:18');
INSERT INTO `t_property_option` VALUES ('18', '4', '广东地区专享', '2018-03-16 19:14:59', '2018-03-16 19:14:59');
INSERT INTO `t_property_option` VALUES ('19', '1', '魅海蓝', '2018-03-16 19:15:37', '2018-03-16 19:15:37');
INSERT INTO `t_property_option` VALUES ('20', '1', '海鸥灰', '2018-03-16 19:15:44', '2018-03-16 19:15:44');
INSERT INTO `t_property_option` VALUES ('21', '1', '铂光金', '2018-03-16 19:23:47', '2018-03-16 19:23:47');
INSERT INTO `t_property_option` VALUES ('22', '6', '钻雕金', '2018-03-16 19:30:51', '2018-03-16 20:18:37');
INSERT INTO `t_property_option` VALUES ('23', '6', '曜石黑', '2018-03-16 19:31:58', '2018-03-16 19:31:58');
INSERT INTO `t_property_option` VALUES ('24', '6', '玫瑰金', '2018-03-16 19:32:15', '2018-03-16 19:32:15');
INSERT INTO `t_property_option` VALUES ('25', '6', '钻雕蓝', '2018-03-16 19:32:25', '2018-03-16 20:18:45');
INSERT INTO `t_property_option` VALUES ('26', '6', '陶瓷白', '2018-03-16 19:32:36', '2018-03-16 19:32:36');
INSERT INTO `t_property_option` VALUES ('27', '6', '草木绿', '2018-03-16 19:32:51', '2018-03-16 19:45:47');
INSERT INTO `t_property_option` VALUES ('28', '6', '亮黑', '2018-03-16 19:46:57', '2018-03-16 19:46:57');
INSERT INTO `t_property_option` VALUES ('29', '7', '6G+64G', '2018-03-16 19:49:09', '2018-03-16 19:49:09');
INSERT INTO `t_property_option` VALUES ('30', '7', '6G+128G', '2018-03-16 19:49:23', '2018-03-16 19:49:23');
INSERT INTO `t_property_option` VALUES ('31', '8', '全网通版', '2018-03-16 19:50:08', '2018-03-16 19:50:08');
INSERT INTO `t_property_option` VALUES ('32', '9', '官方标配', '2018-03-16 19:50:35', '2018-03-16 19:50:35');
INSERT INTO `t_property_option` VALUES ('33', '10', '无定制', '2018-03-16 19:52:41', '2018-03-16 19:52:41');
INSERT INTO `t_property_option` VALUES ('34', '11', '钻石黑', '2018-03-16 20:09:33', '2018-03-16 20:09:33');
INSERT INTO `t_property_option` VALUES ('35', '11', '摩卡金', '2018-03-16 20:10:15', '2018-03-16 20:10:15');
INSERT INTO `t_property_option` VALUES ('36', '11', '银钻黑', '2018-03-16 20:10:30', '2018-03-16 20:10:30');
INSERT INTO `t_property_option` VALUES ('37', '11', '宝石蓝色', '2018-03-16 20:10:43', '2018-03-16 20:10:43');
INSERT INTO `t_property_option` VALUES ('38', '11', '樱粉金', '2018-03-16 20:11:04', '2018-03-16 20:11:04');
INSERT INTO `t_property_option` VALUES ('39', '11', '香槟金', '2018-03-16 20:11:45', '2018-03-16 20:11:45');
INSERT INTO `t_property_option` VALUES ('40', '11', '亮黑色', '2018-03-16 20:12:00', '2018-03-16 20:12:00');
INSERT INTO `t_property_option` VALUES ('41', '11', '玫瑰金色', '2018-03-16 20:12:17', '2018-03-16 20:12:17');
INSERT INTO `t_property_option` VALUES ('42', '12', '4G+64G', '2018-03-16 20:13:02', '2018-03-16 20:13:02');
INSERT INTO `t_property_option` VALUES ('43', '12', '6G+256G', '2018-03-16 20:13:20', '2018-03-16 20:13:20');
INSERT INTO `t_property_option` VALUES ('44', '12', '6G+128G', '2018-03-16 20:13:37', '2018-03-16 20:13:37');
INSERT INTO `t_property_option` VALUES ('45', '13', '全网通版', '2018-03-16 20:14:19', '2018-03-16 20:14:19');
INSERT INTO `t_property_option` VALUES ('46', '14', '官方标配', '2018-03-16 20:14:29', '2018-03-16 20:14:29');
INSERT INTO `t_property_option` VALUES ('47', '16', '流光金', '2018-03-16 20:17:01', '2018-03-16 20:20:42');
INSERT INTO `t_property_option` VALUES ('48', '16', '浅艾蓝', '2018-03-16 20:17:39', '2018-03-16 20:20:44');
INSERT INTO `t_property_option` VALUES ('49', '16', '银钻灰', '2018-03-16 20:17:53', '2018-03-16 20:20:45');
INSERT INTO `t_property_option` VALUES ('50', '16', '曜石黑', '2018-03-16 20:19:26', '2018-03-16 20:20:46');
INSERT INTO `t_property_option` VALUES ('51', '16', '樱粉金', '2018-03-16 20:19:42', '2018-03-16 20:20:47');
INSERT INTO `t_property_option` VALUES ('52', '16', '相思红', '2018-03-16 20:20:12', '2018-03-16 20:20:49');
INSERT INTO `t_property_option` VALUES ('53', '17', '6G+64G', '2018-03-16 20:21:04', '2018-03-16 20:21:04');
INSERT INTO `t_property_option` VALUES ('54', '17', '4G+64G', '2018-03-16 20:21:23', '2018-03-16 20:21:23');
INSERT INTO `t_property_option` VALUES ('55', '17', '6G+128G', '2018-03-16 20:21:41', '2018-03-16 20:21:41');
INSERT INTO `t_property_option` VALUES ('56', '18', '全网通版', '2018-03-16 20:22:08', '2018-03-16 20:22:08');
INSERT INTO `t_property_option` VALUES ('57', '18', '移动4G+', '2018-03-16 20:22:18', '2018-03-16 20:22:18');
INSERT INTO `t_property_option` VALUES ('58', '19', '官方标配', '2018-03-16 20:22:55', '2018-03-16 20:22:55');
INSERT INTO `t_property_option` VALUES ('59', '19', '纪念碑谷版', '2018-03-16 20:23:11', '2018-03-16 20:23:11');
INSERT INTO `t_property_option` VALUES ('60', '20', '后壳定制', '2018-03-16 20:25:21', '2018-03-16 20:25:21');
INSERT INTO `t_property_option` VALUES ('61', '21', '香槟金', '2018-03-16 20:32:40', '2018-03-16 20:32:40');
INSERT INTO `t_property_option` VALUES ('62', '21', '曜石黑', '2018-03-16 20:32:59', '2018-03-16 20:32:59');
INSERT INTO `t_property_option` VALUES ('63', '21', '极光蓝', '2018-03-16 20:33:24', '2018-03-16 20:33:24');
INSERT INTO `t_property_option` VALUES ('64', '22', '4G+64G', '2018-03-16 20:34:08', '2018-03-16 20:34:08');
INSERT INTO `t_property_option` VALUES ('65', '23', '全网通版本', '2018-03-16 20:34:36', '2018-03-16 20:34:36');
INSERT INTO `t_property_option` VALUES ('66', '24', '官方标配', '2018-03-16 20:35:01', '2018-03-16 20:35:01');
INSERT INTO `t_property_option` VALUES ('67', '25', '4G+32G', '2018-03-16 20:49:24', '2018-03-16 20:49:24');
INSERT INTO `t_property_option` VALUES ('68', '25', '4G+64G', '2018-03-16 20:49:38', '2018-03-16 20:49:38');
INSERT INTO `t_property_option` VALUES ('69', '26', '金色', '2018-03-16 20:50:00', '2018-03-16 20:50:00');
INSERT INTO `t_property_option` VALUES ('70', '26', '玫瑰金', '2018-03-16 20:50:10', '2018-03-16 20:50:10');
INSERT INTO `t_property_option` VALUES ('71', '26', '黑色', '2018-03-16 20:51:12', '2018-03-16 20:51:12');
INSERT INTO `t_property_option` VALUES ('72', '25', '4G+128G', '2018-03-16 20:51:53', '2018-03-16 20:51:53');
INSERT INTO `t_property_option` VALUES ('73', '26', '亮蓝色', '2018-03-16 20:52:26', '2018-03-16 20:52:26');
INSERT INTO `t_property_option` VALUES ('74', '26', '亮黑色', '2018-03-16 20:53:17', '2018-03-16 20:53:17');
INSERT INTO `t_property_option` VALUES ('75', '25', '3G+64G', '2018-03-16 20:53:33', '2018-03-16 20:53:33');
INSERT INTO `t_property_option` VALUES ('76', '26', '哑光金', '2018-03-16 20:53:49', '2018-03-16 20:53:49');
INSERT INTO `t_property_option` VALUES ('77', '27', '4G+32G', '2018-03-16 20:58:33', '2018-03-16 20:58:33');
INSERT INTO `t_property_option` VALUES ('78', '27', '3G+32G', '2018-03-16 20:58:42', '2018-03-16 20:58:42');
INSERT INTO `t_property_option` VALUES ('79', '27', '2G+16G', '2018-03-16 20:59:00', '2018-03-16 20:59:00');
INSERT INTO `t_property_option` VALUES ('80', '27', '4G+64G', '2018-03-16 20:59:28', '2018-03-16 20:59:28');
INSERT INTO `t_property_option` VALUES ('81', '28', '香槟金', '2018-03-16 21:01:25', '2018-03-16 21:01:25');
INSERT INTO `t_property_option` VALUES ('82', '28', '铂银灰', '2018-03-16 21:01:40', '2018-03-16 21:01:40');
INSERT INTO `t_property_option` VALUES ('83', '28', '樱花粉', '2018-03-16 21:01:53', '2018-03-16 21:01:53');
INSERT INTO `t_property_option` VALUES ('84', '28', '深空灰', '2018-03-16 21:03:05', '2018-03-16 21:03:05');
INSERT INTO `t_property_option` VALUES ('85', '28', '玫瑰金', '2018-03-16 21:03:17', '2018-03-16 21:03:17');
INSERT INTO `t_property_option` VALUES ('86', '28', '金色', '2018-03-16 21:03:26', '2018-03-16 21:03:26');
INSERT INTO `t_property_option` VALUES ('87', '28', '灰色', '2018-03-16 21:04:24', '2018-03-16 21:04:24');
INSERT INTO `t_property_option` VALUES ('88', '28', '银色', '2018-03-16 21:04:34', '2018-03-16 21:04:34');
INSERT INTO `t_property_option` VALUES ('89', '28', '黑色', '2018-03-16 21:06:37', '2018-03-16 21:06:37');
INSERT INTO `t_property_option` VALUES ('90', '28', '浅蓝色', '2018-03-16 21:07:03', '2018-03-16 21:07:03');
INSERT INTO `t_property_option` VALUES ('91', '29', '4G+64G', '2018-03-16 21:16:53', '2018-03-16 21:16:53');
INSERT INTO `t_property_option` VALUES ('92', '29', '4G+64G', '2018-03-16 21:17:03', '2018-03-16 21:17:03');
INSERT INTO `t_property_option` VALUES ('93', '29', '4G+128G', '2018-03-16 21:17:16', '2018-03-16 21:17:16');
INSERT INTO `t_property_option` VALUES ('94', '30', '亮黑色', '2018-03-16 21:20:09', '2018-03-16 21:20:28');
INSERT INTO `t_property_option` VALUES ('95', '30', '亮蓝色', '2018-03-16 21:20:19', '2018-03-16 21:25:46');
INSERT INTO `t_property_option` VALUES ('96', '31', '3G+32G', '2018-03-16 21:30:51', '2018-03-16 21:30:51');
INSERT INTO `t_property_option` VALUES ('97', '31', '4G+64G', '2018-03-16 21:31:11', '2018-03-16 21:31:11');
INSERT INTO `t_property_option` VALUES ('98', '31', '6G+64G', '2018-03-16 21:31:19', '2018-03-16 21:31:19');
INSERT INTO `t_property_option` VALUES ('99', '32', '黑色', '2018-03-16 21:31:38', '2018-03-16 21:31:38');
INSERT INTO `t_property_option` VALUES ('100', '32', '魔力蓝', '2018-03-16 21:31:50', '2018-03-16 21:31:50');
INSERT INTO `t_property_option` VALUES ('101', '32', '玫瑰金', '2018-03-16 21:32:00', '2018-03-16 21:32:00');
INSERT INTO `t_property_option` VALUES ('102', '32', '金色', '2018-03-16 21:32:08', '2018-03-16 21:32:08');
INSERT INTO `t_property_option` VALUES ('103', '32', '樱花粉', '2018-03-16 21:32:56', '2018-03-16 21:32:56');
INSERT INTO `t_property_option` VALUES ('104', '32', '香槟金', '2018-03-16 21:33:06', '2018-03-16 21:33:06');
INSERT INTO `t_property_option` VALUES ('105', '32', '铂银灰', '2018-03-16 21:33:33', '2018-03-16 21:33:33');
INSERT INTO `t_property_option` VALUES ('107', '33', '6G+64G', '2018-03-16 21:40:51', '2018-03-16 21:40:51');
INSERT INTO `t_property_option` VALUES ('108', '33', '6G+128G', '2018-03-16 21:41:14', '2018-03-16 21:41:14');
INSERT INTO `t_property_option` VALUES ('109', '34', '黑色陶瓷', '2018-03-16 21:41:38', '2018-03-16 21:41:38');
INSERT INTO `t_property_option` VALUES ('110', '35', '银色', '2018-03-16 21:49:40', '2018-03-16 21:49:40');
INSERT INTO `t_property_option` VALUES ('111', '35', '金色', '2018-03-16 21:49:55', '2018-03-16 21:49:55');
INSERT INTO `t_property_option` VALUES ('112', '36', '12.5英寸 4G+128G', '2018-03-16 21:50:19', '2018-03-16 21:50:19');
INSERT INTO `t_property_option` VALUES ('113', '36', '12.5英寸 4G+256G', '2018-03-16 21:50:36', '2018-03-16 21:50:36');
INSERT INTO `t_property_option` VALUES ('114', '35', '深空灰', '2018-03-16 21:52:14', '2018-03-16 21:52:14');
INSERT INTO `t_property_option` VALUES ('115', '36', '13.3英寸 四核增强 i5版本', '2018-03-16 21:52:35', '2018-03-16 21:52:54');
INSERT INTO `t_property_option` VALUES ('116', '36', '13.3英寸 四核增强 i7版本', '2018-03-16 21:52:49', '2018-03-16 21:53:28');
INSERT INTO `t_property_option` VALUES ('117', '35', '银色', '2018-03-16 21:53:39', '2018-03-16 21:53:39');
INSERT INTO `t_property_option` VALUES ('118', '36', '13.3英寸 集成显卡 4G', '2018-03-16 21:54:11', '2018-03-16 21:54:18');
INSERT INTO `t_property_option` VALUES ('119', '36', '13.3英寸 集成显卡 8g', '2018-03-16 21:54:40', '2018-03-16 21:54:40');
INSERT INTO `t_property_option` VALUES ('120', '37', '15.6英寸 i5 8G内存 ', '2018-03-16 21:58:04', '2018-03-16 21:58:04');
INSERT INTO `t_property_option` VALUES ('121', '37', '15.6英寸 i7 8G内存 ', '2018-03-16 21:58:13', '2018-03-16 21:58:13');
INSERT INTO `t_property_option` VALUES ('122', '37', '15.6英寸 i5 16G内存 ', '2018-03-16 21:58:23', '2018-03-16 21:58:23');
INSERT INTO `t_property_option` VALUES ('123', '38', '深空灰', '2018-03-16 21:58:40', '2018-03-16 21:58:40');
INSERT INTO `t_property_option` VALUES ('124', '39', '深空灰', '2018-03-16 22:04:02', '2018-03-16 22:04:02');
INSERT INTO `t_property_option` VALUES ('125', '39', '流光金', '2018-03-16 22:04:15', '2018-03-16 22:04:15');
INSERT INTO `t_property_option` VALUES ('126', '39', '玫瑰金', '2018-03-16 22:04:23', '2018-03-16 22:04:23');
INSERT INTO `t_property_option` VALUES ('127', '40', 'I5/4G/256G', '2018-03-16 22:04:41', '2018-03-16 22:04:41');
INSERT INTO `t_property_option` VALUES ('128', '40', 'I5/8G/256G', '2018-03-16 22:04:56', '2018-03-16 22:04:56');
INSERT INTO `t_property_option` VALUES ('129', '40', 'I5/8G/512G', '2018-03-16 22:05:22', '2018-03-16 22:05:22');
INSERT INTO `t_property_option` VALUES ('130', '40', 'I7/8G/512G', '2018-03-16 22:05:46', '2018-03-16 22:05:46');
INSERT INTO `t_property_option` VALUES ('131', '39', '皓月银', '2018-03-16 22:06:12', '2018-03-16 22:06:12');
INSERT INTO `t_property_option` VALUES ('132', '39', '曜石黑', '2018-03-16 22:06:22', '2018-03-16 22:06:22');
INSERT INTO `t_property_option` VALUES ('133', '40', 'i5/8G/128G/1TB', '2018-03-16 22:07:38', '2018-03-16 22:07:38');
INSERT INTO `t_property_option` VALUES ('134', '40', 'i7/8G/128G/1TB', '2018-03-16 22:08:01', '2018-03-16 22:08:01');
INSERT INTO `t_property_option` VALUES ('135', '39', '主机（香槟金）+键盘（棕色）', '2018-03-16 22:09:07', '2018-03-16 22:09:07');
INSERT INTO `t_property_option` VALUES ('136', '39', '主机（钛银灰）+键盘（蓝色）', '2018-03-16 22:09:30', '2018-03-16 22:09:30');
INSERT INTO `t_property_option` VALUES ('137', '39', '主机（香槟金）+键盘（粉色）', '2018-03-16 22:09:54', '2018-03-16 22:09:54');
INSERT INTO `t_property_option` VALUES ('138', '42', '32英寸', '2018-03-16 22:13:45', '2018-03-16 22:13:45');
INSERT INTO `t_property_option` VALUES ('139', '42', '43英寸', '2018-03-16 22:14:00', '2018-03-16 22:14:05');
INSERT INTO `t_property_option` VALUES ('140', '42', '49英寸', '2018-03-16 22:14:13', '2018-03-16 22:14:13');
INSERT INTO `t_property_option` VALUES ('141', '42', '65英寸', '2018-03-16 22:14:36', '2018-03-16 22:14:36');
INSERT INTO `t_property_option` VALUES ('142', '42', '50英寸', '2018-03-16 22:15:04', '2018-03-16 22:15:04');
INSERT INTO `t_property_option` VALUES ('143', '42', '55英寸', '2018-03-16 22:15:24', '2018-03-16 22:15:24');
INSERT INTO `t_property_option` VALUES ('144', '41', '黑色', '2018-03-16 22:16:27', '2018-03-16 22:16:27');

-- ----------------------------
-- Table structure for t_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping_cart`;
CREATE TABLE `t_shopping_cart` (
  `id` bigint(20) NOT NULL,
  `user_uuid` bigint(50) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `sku_name` varchar(255) NOT NULL,
  `check_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 选中 2未选中',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_sku`;
CREATE TABLE `t_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL,
  `sku_name` varchar(255) NOT NULL,
  `sku_price` decimal(10,2) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `enable_flag` tinyint(2) DEFAULT '1' COMMENT '1 可用 2 不可用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sku
-- ----------------------------
INSERT INTO `t_sku` VALUES ('1', '1', '荣耀V10 全网通标配版 4GB+64GB（沙滩金）', '2699.00', 'https://res.vmallres.com/pimages//product/6901443210190/group//800_800_1511746165347.jpg', '1', '2018-03-17 13:24:12', '2018-03-17 13:24:12');
INSERT INTO `t_sku` VALUES ('2', '1', '荣耀V10 全网通高配版 6GB+64GB（沙滩金）', '2999.00', 'https://res.vmallres.com/pimages//product/6901443210190/group//800_800_1511746165347.jpg', '1', '2018-03-17 13:25:41', '2018-03-17 13:26:02');
INSERT INTO `t_sku` VALUES ('3', '1', '荣耀V10 全网通尊享版 6GB+128GB（沙滩金）', '3499.00', 'https://res.vmallres.com/pimages//product/6901443210190/group//800_800_1511746165347.jpg', '1', '2018-03-17 13:26:17', '2018-03-17 13:26:17');
INSERT INTO `t_sku` VALUES ('4', '1', '荣耀V10 全网通标配版 4GB+64GB（极光蓝）', '2699.00', 'https://res.vmallres.com/pimages//product/6901443210213/800_800_1513158355343mp.jpg', '1', '2018-03-17 13:27:57', '2018-03-17 13:27:57');
INSERT INTO `t_sku` VALUES ('5', '1', '荣耀V10 全网通高配版 6GB+64GB（极光蓝）', '2999.00', 'https://res.vmallres.com/pimages//product/6901443210213/800_800_1513158355343mp.jpg', '1', '2018-03-17 13:28:27', '2018-03-17 13:28:27');
INSERT INTO `t_sku` VALUES ('6', '1', '荣耀V10 全网通尊享版 6GB+128GB（极光蓝）', '3499.00', 'https://res.vmallres.com/pimages//product/6901443210213/800_800_1513158355343mp.jpg', '1', '2018-03-17 13:28:54', '2018-03-17 13:31:57');
INSERT INTO `t_sku` VALUES ('7', '1', '荣耀V10 全网通尊享版 6GB+128GB（幻夜黑）', '3499.00', 'https://res.vmallres.com/pimages//product/6901443210275/group//800_800_1511745025621.jpg', '1', '2018-03-17 13:32:35', '2018-03-17 13:32:35');
INSERT INTO `t_sku` VALUES ('8', '1', '荣耀V10 全网通高配版 6GB+64GB（幻夜黑）', '2999.00', 'https://res.vmallres.com/pimages//product/6901443210275/group//800_800_1511745025621.jpg', '1', '2018-03-17 13:33:03', '2018-03-17 13:33:06');
INSERT INTO `t_sku` VALUES ('9', '1', '荣耀V10 全网通标配版 4GB+64GB（幻夜黑）', '2699.00', 'https://res.vmallres.com/pimages//product/6901443210275/group//800_800_1511745025621.jpg', '1', '2018-03-17 13:33:24', '2018-03-17 13:33:24');
INSERT INTO `t_sku` VALUES ('10', '1', '荣耀V10 全网通标配版 4GB+64GB（魅丽红）', '2699.00', 'https://res.vmallres.com/pimages//product/6901443210183/800_800_1511858796676mp.jpg', '1', '2018-03-17 13:35:01', '2018-03-17 13:35:01');
INSERT INTO `t_sku` VALUES ('11', '1', '荣耀V10 全网通高配版 6GB+64GB（魅丽红）', '2999.00', 'https://res.vmallres.com/pimages//product/6901443210183/800_800_1511858796676mp.jpg', '1', '2018-03-17 13:35:50', '2018-03-17 13:36:04');
INSERT INTO `t_sku` VALUES ('12', '1', '荣耀V10 全网通尊享版 6GB+128GB（魅丽红）', '2499.00', 'https://res.vmallres.com/pimages//product/6901443210183/800_800_1511858796676mp.jpg', '1', '2018-03-17 13:36:19', '2018-03-17 13:36:19');

-- ----------------------------
-- Table structure for t_sku_property_option
-- ----------------------------
DROP TABLE IF EXISTS `t_sku_property_option`;
CREATE TABLE `t_sku_property_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `property_option_id` bigint(20) NOT NULL,
  `enable_flag` tinyint(2) DEFAULT '1' COMMENT '1 可用 2 不可用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sku_property_option
-- ----------------------------
INSERT INTO `t_sku_property_option` VALUES ('1', '1', '1', '1', '1', '2018-03-17 13:45:34', '2018-03-17 13:45:34');
INSERT INTO `t_sku_property_option` VALUES ('5', '1', '2', '5', '1', '2018-03-17 13:54:38', '2018-03-17 13:54:38');
INSERT INTO `t_sku_property_option` VALUES ('6', '1', '3', '8', '1', '2018-03-17 13:56:08', '2018-03-17 13:56:08');
INSERT INTO `t_sku_property_option` VALUES ('7', '1', '4', '11', '1', '2018-03-17 13:58:06', '2018-03-17 13:58:06');
INSERT INTO `t_sku_property_option` VALUES ('8', '1', '5', '14', '1', '2018-03-17 13:59:01', '2018-03-17 13:59:01');
INSERT INTO `t_sku_property_option` VALUES ('9', '2', '5', '14', '1', '2018-03-17 13:59:01', '2018-03-17 13:59:01');
INSERT INTO `t_sku_property_option` VALUES ('10', '2', '4', '11', '1', '2018-03-17 13:58:06', '2018-03-17 13:58:06');
INSERT INTO `t_sku_property_option` VALUES ('11', '2', '1', '1', '1', '2018-03-17 13:45:34', '2018-03-17 13:45:34');
INSERT INTO `t_sku_property_option` VALUES ('12', '2', '2', '6', '1', '2018-03-17 13:54:38', '2018-03-17 13:54:38');
INSERT INTO `t_sku_property_option` VALUES ('13', '2', '3', '9', '1', '2018-03-17 13:56:08', '2018-03-17 13:56:08');
INSERT INTO `t_sku_property_option` VALUES ('14', '3', '1', '1', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('15', '3', '4', '11', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('16', '3', '5', '14', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('17', '3', '2', '7', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('18', '3', '3', '10', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('19', '4', '1', '2', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('20', '4', '2', '5', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('21', '4', '3', '8', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('22', '4', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('23', '4', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('24', '5', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('25', '5', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('26', '5', '1', '2', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('27', '5', '2', '6', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('28', '5', '3', '9', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('29', '6', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('30', '6', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('31', '6', '1', '2', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('32', '6', '2', '7', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('33', '6', '3', '10', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('34', '7', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('35', '7', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('36', '7', '1', '3', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('37', '7', '2', '5', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('38', '7', '3', '8', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('39', '8', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('40', '8', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('41', '8', '1', '3', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('42', '8', '2', '6', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('43', '8', '3', '9', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('44', '9', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('45', '9', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('46', '9', '1', '3', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('47', '9', '3', '10', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('48', '9', '2', '7', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('49', '10', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('50', '10', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('51', '10', '1', '4', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('52', '10', '2', '5', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('53', '10', '3', '8', '1', '2018-03-17 13:59:01', '2018-03-17 16:49:01');
INSERT INTO `t_sku_property_option` VALUES ('54', '11', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('55', '11', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('56', '11', '1', '4', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');
INSERT INTO `t_sku_property_option` VALUES ('57', '11', '2', '6', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('58', '11', '3', '9', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('59', '12', '2', '7', '1', '2018-03-17 13:58:06', '2018-03-17 16:16:23');
INSERT INTO `t_sku_property_option` VALUES ('60', '12', '3', '10', '1', '2018-03-17 13:59:01', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('61', '12', '4', '11', '1', '2018-03-17 13:54:38', '2018-03-17 16:16:24');
INSERT INTO `t_sku_property_option` VALUES ('62', '12', '5', '14', '1', '2018-03-17 13:56:08', '2018-03-17 16:28:28');
INSERT INTO `t_sku_property_option` VALUES ('63', '12', '1', '4', '1', '2018-03-17 13:45:34', '2018-03-17 16:16:22');

-- ----------------------------
-- Table structure for t_trade_0
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_0`;
CREATE TABLE `t_trade_0` (
  `id` bigint(20) NOT NULL,
  `trade_no` bigint(50) DEFAULT NULL,
  `user_uuid` bigint(50) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL COMMENT '实际付款金额',
  `paymeny_type` tinyint(2) DEFAULT NULL COMMENT '支付类型',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '订单状态 1 未付款 2 已超时 3 付款成功',
  `payment_time` timestamp NULL DEFAULT NULL,
  `close_time` timestamp NULL DEFAULT NULL COMMENT '订单关闭时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade_0
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_1
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_1`;
CREATE TABLE `t_trade_1` (
  `id` bigint(20) NOT NULL,
  `trade_no` bigint(50) DEFAULT NULL,
  `user_uuid` bigint(50) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL COMMENT '实际付款金额',
  `paymeny_type` tinyint(2) DEFAULT NULL COMMENT '支付类型',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '订单状态 1 未付款 2 已超时 3 付款成功',
  `payment_time` timestamp NULL DEFAULT NULL,
  `close_time` timestamp NULL DEFAULT NULL COMMENT '订单关闭时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade_1
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_2
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_2`;
CREATE TABLE `t_trade_2` (
  `id` bigint(20) NOT NULL,
  `trade_no` bigint(50) DEFAULT NULL,
  `user_uuid` bigint(50) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL COMMENT '实际付款金额',
  `paymeny_type` tinyint(2) DEFAULT NULL COMMENT '支付类型',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '订单状态 1 未付款 2 已超时 3 付款成功',
  `payment_time` timestamp NULL DEFAULT NULL,
  `close_time` timestamp NULL DEFAULT NULL COMMENT '订单关闭时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade_2
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_item_0
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_item_0`;
CREATE TABLE `t_trade_item_0` (
  `id` bigint(20) NOT NULL,
  `user_uuid` bigint(50) DEFAULT NULL,
  `trade_no` bigint(50) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku_name` varchar(100) DEFAULT NULL,
  `sku_image_url` varchar(255) DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '下单时单价',
  `quantity` int(10) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade_item_0
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_item_1
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_item_1`;
CREATE TABLE `t_trade_item_1` (
  `id` bigint(20) NOT NULL,
  `user_uuid` bigint(50) DEFAULT NULL,
  `trade_no` bigint(50) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku_name` varchar(100) DEFAULT NULL,
  `sku_image_url` varchar(255) DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '下单时单价',
  `quantity` int(10) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade_item_1
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_item_2
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_item_2`;
CREATE TABLE `t_trade_item_2` (
  `id` bigint(20) NOT NULL,
  `user_uuid` bigint(50) DEFAULT NULL,
  `trade_no` bigint(50) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku_name` varchar(100) DEFAULT NULL,
  `sku_image_url` varchar(255) DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '下单时单价',
  `quantity` int(10) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade_item_2
-- ----------------------------
