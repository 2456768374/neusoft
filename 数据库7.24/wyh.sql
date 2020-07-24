/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : wyh

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-24 10:30:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `equipment_num` varchar(500) DEFAULT NULL,
  `equipment_img_url` varchar(500) DEFAULT NULL COMMENT '�豸ͼƬ',
  `equipment_status` varchar(500) DEFAULT NULL COMMENT '设备状态',
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�豸��';

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('SN001', null, '10', null, null, null);

-- ----------------------------
-- Table structure for factory
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `create_userid` varchar(500) DEFAULT NULL,
  `factory_name` varchar(500) DEFAULT NULL,
  `factory_img_url` varchar(500) DEFAULT NULL,
  `factory_status` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory
-- ----------------------------
INSERT INTO `factory` VALUES ('a12345', 'factory1', null, '10', '12345', null, null, null);

-- ----------------------------
-- Table structure for order_track
-- ----------------------------
DROP TABLE IF EXISTS `order_track`;
CREATE TABLE `order_track` (
  `schedule_num` varchar(500) DEFAULT NULL,
  `plan_num` varchar(500) DEFAULT NULL,
  `schedule_status` varchar(500) DEFAULT NULL,
  `product_num` varchar(500) DEFAULT NULL,
  `equment_num` varchar(500) DEFAULT NULL,
  `hege_count` varchar(500) DEFAULT NULL,
  `jiagong_vount` varchar(500) DEFAULT NULL,
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_track
-- ----------------------------
INSERT INTO `order_track` VALUES ('W20180125', 'P001', '10', '001', 'SN001', '10', '12', null, null, null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_num` varchar(500) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `product_img_url` varchar(500) DEFAULT NULL,
  `product_count` varchar(500) DEFAULT NULL,
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL,
  KEY `Index_product_name` (`product_num`),
  KEY `Index_product_num` (`product_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ڶ����Ʒ';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('001', '产品1', null, '10', null, null, null);

-- ----------------------------
-- Table structure for product_order
-- ----------------------------
DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order` (
  `create_time` date DEFAULT NULL,
  `create_userid` varchar(500) DEFAULT NULL,
  `order_num` varchar(500) DEFAULT NULL,
  `order_source` varchar(500) DEFAULT NULL,
  `product_num` varchar(500) DEFAULT NULL,
  `product_count` varchar(500) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `order_status` varchar(500) DEFAULT NULL,
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL,
  KEY `Index_order_seq` (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of product_order
-- ----------------------------
INSERT INTO `product_order` VALUES ('2020-07-24', 'a12345', 'O001', '平台', '001', '10', '2020-07-26', '10', null, null, null);

-- ----------------------------
-- Table structure for product_plan
-- ----------------------------
DROP TABLE IF EXISTS `product_plan`;
CREATE TABLE `product_plan` (
  `plan_num` varchar(500) DEFAULT NULL,
  `order_num` varchar(500) DEFAULT NULL,
  `product_num` varchar(500) DEFAULT NULL,
  `plan_count` varchar(500) DEFAULT NULL,
  `plan_start_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `plan_status` varchar(500) DEFAULT '10',
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL,
  KEY `Index_plan_seq` (`plan_num`),
  KEY `Index_order_seq` (`plan_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����ƻ���';

-- ----------------------------
-- Records of product_plan
-- ----------------------------
INSERT INTO `product_plan` VALUES ('P001', 'O001', '001', '10', '2020-07-24', '2020-07-25', '10', null, null, null);

-- ----------------------------
-- Table structure for product_schedule
-- ----------------------------
DROP TABLE IF EXISTS `product_schedule`;
CREATE TABLE `product_schedule` (
  `plan_num` varchar(500) DEFAULT NULL,
  `product_num` varchar(500) DEFAULT NULL,
  `plan_count` varchar(500) DEFAULT NULL,
  `product_count` varchar(500) DEFAULT NULL,
  `schedule_num` varchar(500) DEFAULT NULL,
  `equipment_num` varchar(500) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `schedule_status` varchar(500) DEFAULT NULL,
  `by1` varchar(500) DEFAULT NULL,
  `by2` varchar(500) DEFAULT NULL,
  `by3` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�������ȱ�';

-- ----------------------------
-- Records of product_schedule
-- ----------------------------
INSERT INTO `product_schedule` VALUES ('P001', '001', '10', '10', 'W20180125', 'SN001', '2020-07-29', '2020-07-30', null, null, null, null);
