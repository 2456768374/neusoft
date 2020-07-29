/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : wyh

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-29 09:56:28
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
INSERT INTO `equipment` VALUES ('SN002', '', '10', null, null, null);
INSERT INTO `equipment` VALUES ('SN003', '', '10', null, null, null);
INSERT INTO `equipment` VALUES ('SN005', null, '20', null, null, null);
INSERT INTO `equipment` VALUES ('SN006', null, '20', null, null, null);
INSERT INTO `equipment` VALUES ('SN007', null, '30', null, null, null);

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
INSERT INTO `factory` VALUES ('b12345', 'factory2', null, '10', '12345', null, null, null);
INSERT INTO `factory` VALUES ('a1234567', 'factory3', null, '10', '1234567', null, null, null);
INSERT INTO `factory` VALUES ('a12345678', 'factory6', null, '10', '12345678', null, null, null);

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
INSERT INTO `order_track` VALUES ('W20180125', 'P001', '30', '001', 'SN001', '18', '20', null, null, null);
INSERT INTO `order_track` VALUES ('W20180115', 'P003', '30', '001', 'SN001', '18', '20', null, null, null);

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
INSERT INTO `product` VALUES ('001', '产品1', null, '', null, null, null);
INSERT INTO `product` VALUES ('002', '产品2', null, null, null, null, null);
INSERT INTO `product` VALUES ('003', '产品3', null, null, null, null, null);
INSERT INTO `product` VALUES ('004', '产品4', null, null, null, null, null);
INSERT INTO `product` VALUES ('005', '产品5', null, null, null, null, null);

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
INSERT INTO `product_order` VALUES (null, null, 'O001', '线下平台', '001', '10', '2020-07-28', '30', null, null, null);
INSERT INTO `product_order` VALUES (null, null, 'O002', '线下平台', '001', '10', '2020-07-28', '50', null, null, null);
INSERT INTO `product_order` VALUES (null, null, 'O003', '线下平台', '001', '10', '2020-08-28', '30', null, null, null);
INSERT INTO `product_order` VALUES (null, null, 'O004', '线下平台', '001', '10', '2020-09-24', '10', null, null, null);
INSERT INTO `product_order` VALUES (null, null, 'O005', '线下平台', '001', '10', '2020-11-28', '10', null, null, null);
INSERT INTO `product_order` VALUES (null, null, 'O006', '线下平台', '001', '10', '2020-10-28', '10', null, null, null);
INSERT INTO `product_order` VALUES (null, null, 'O007', '线下平台', '001', '10', '2020-12-28', '10', null, null, null);

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
INSERT INTO `product_plan` VALUES ('P001', 'O001', '001', '10', '2020-07-28', '2020-07-29', '3', null, null, null);
INSERT INTO `product_plan` VALUES ('P003', 'O003', '001', '10', '2020-07-29', '2020-07-30', '3', null, null, null);

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
INSERT INTO `product_schedule` VALUES ('P001', '001', '10', null, 'W20180125', 'SN001', '2020-07-28', '2020-07-29', '30', null, null, null);
INSERT INTO `product_schedule` VALUES ('P003', '001', '10', null, 'W20180115', 'SN001', '2020-07-29', '2020-07-30', '30', null, null, null);
