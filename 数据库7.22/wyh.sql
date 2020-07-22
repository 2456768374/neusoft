/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : wyh

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 15:31:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `equipment_num` varchar(200) DEFAULT NULL,
  `equipment_name` varchar(300) DEFAULT NULL COMMENT '�豸����',
  `equipment_img_url` varchar(300) DEFAULT NULL COMMENT '�豸ͼƬ',
  `equipment_status` int(11) DEFAULT '10' COMMENT '设备状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�豸��';

-- ----------------------------
-- Records of equipment
-- ----------------------------

-- ----------------------------
-- Table structure for equipment_product
-- ----------------------------
DROP TABLE IF EXISTS `equipment_product`;
CREATE TABLE `equipment_product` (
  `equipment_num` int(11) DEFAULT NULL COMMENT '�豸ID',
  `product_num` int(11) DEFAULT NULL COMMENT '��ƷID',
  `yield` int(11) DEFAULT NULL COMMENT '产能'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�豸���Ʒ��Ӧ��';

-- ----------------------------
-- Records of equipment_product
-- ----------------------------

-- ----------------------------
-- Table structure for factory
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `create_userid` varchar(500) DEFAULT NULL COMMENT '������ID',
  `factory_name` varchar(500) DEFAULT NULL COMMENT '��������',
  `factory_img_url` varchar(500) DEFAULT NULL COMMENT '����ͼƬ',
  `factory_status` int(11) DEFAULT NULL COMMENT '����״̬  0:����  1:�ر�',
  `password` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory
-- ----------------------------
INSERT INTO `factory` VALUES ('a12345', 'factory1', null, '1', '12345');

-- ----------------------------
-- Table structure for order_track
-- ----------------------------
DROP TABLE IF EXISTS `order_track`;
CREATE TABLE `order_track` (
  `work_number` varchar(5) DEFAULT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `equipment_number` varchar(10) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `over_time` datetime NOT NULL,
  `process_number` int(11) NOT NULL,
  `qualify` int(11) NOT NULL,
  `report` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_track
-- ----------------------------
INSERT INTO `order_track` VALUES ('W001', 'P001', 'SN001', '1', '2020-07-18 00:00:00', '2020-07-21 00:00:00', '12', '10', '1', '10');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_num` varchar(200) DEFAULT NULL COMMENT '��Ʒ���',
  `product_name` varchar(300) DEFAULT NULL COMMENT '��Ʒ����',
  `product_img_url` varchar(300) DEFAULT NULL COMMENT '��ƷͼƬ����Ŀ¼',
  KEY `Index_product_name` (`product_num`),
  KEY `Index_product_num` (`product_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ڶ����Ʒ';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_order
-- ----------------------------
DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order` (
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `create_userid` int(11) DEFAULT NULL COMMENT '������ID',
  `update_time` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `update_userid` int(11) DEFAULT NULL COMMENT '�޸���ID',
  `order_num` varchar(200) DEFAULT NULL,
  `order_source` int(11) DEFAULT NULL COMMENT '������Դ',
  `product_id` int(11) DEFAULT NULL COMMENT '��ƷID',
  `product_count` int(11) DEFAULT NULL COMMENT '��Ʒ����',
  `end_date` date DEFAULT NULL COMMENT '������ֹ����',
  `order_status` int(11) DEFAULT '10' COMMENT '����״̬ 10��δ�ӵ�  20���ѽӵ�  30���Ѿܾ�  40��������  50���������',
  `factory_yield` int(11) DEFAULT NULL COMMENT '��������',
  KEY `Index_order_seq` (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of product_order
-- ----------------------------

-- ----------------------------
-- Table structure for product_plan
-- ----------------------------
DROP TABLE IF EXISTS `product_plan`;
CREATE TABLE `product_plan` (
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `create_userid` int(11) DEFAULT NULL COMMENT '������ID',
  `update_time` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `update_userid` int(11) DEFAULT NULL COMMENT '�޸���ID',
  `plan_num` varchar(200) DEFAULT NULL COMMENT '计划编号',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `product_id` int(11) DEFAULT NULL COMMENT '��ƷID',
  `plan_count` int(11) DEFAULT NULL COMMENT '�ƻ�����',
  `delivery_date` date DEFAULT NULL COMMENT '��������',
  `plan_start_date` date DEFAULT NULL COMMENT '�ƻ���ʼ����',
  `plan_end_date` date DEFAULT NULL COMMENT '�ƻ���������',
  `plan_status` int(11) DEFAULT '10' COMMENT '�ƻ�״̬  10��δ���  20�������   30�������',
  KEY `Index_plan_seq` (`plan_num`),
  KEY `Index_order_seq` (`plan_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����ƻ���';

-- ----------------------------
-- Records of product_plan
-- ----------------------------

-- ----------------------------
-- Table structure for product_schedule
-- ----------------------------
DROP TABLE IF EXISTS `product_schedule`;
CREATE TABLE `product_schedule` (
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `create_userid` int(11) DEFAULT NULL COMMENT '������ID',
  `update_time` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `update_userid` int(11) DEFAULT NULL COMMENT '�޸���ID',
  `schedule_num` varchar(200) DEFAULT NULL COMMENT '计划编号',
  `schedule_count` int(11) DEFAULT NULL COMMENT '��������',
  `schedule_status` int(11) DEFAULT '10' COMMENT '����״̬ 10��δ��ʼ   20��������  30�������',
  `plan_num` int(11) DEFAULT NULL COMMENT '�ƻ�ID',
  `product_num` int(11) DEFAULT NULL,
  `equipment_num` int(11) DEFAULT NULL COMMENT '�豸ID',
  `start_date` date DEFAULT NULL COMMENT '��ʼ����',
  `end_date` date DEFAULT NULL COMMENT '��������'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�������ȱ�';

-- ----------------------------
-- Records of product_schedule
-- ----------------------------
