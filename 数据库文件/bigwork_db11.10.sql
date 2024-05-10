/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 8.0.13 : Database - champion
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`champion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `champion`;

/*Table structure for table `address_book` */

DROP TABLE IF EXISTS `address_book`;

CREATE TABLE `address_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址簿';

/*Data for the table `address_book` */

insert  into `address_book`(`id`,`user_id`,`consignee`,`sex`,`phone`,`province_code`,`province_name`,`city_code`,`city_name`,`district_code`,`district_name`,`detail`,`label`,`is_default`) values 
(1,1,'张三','男','12345678901','110000','北京市','110100','市辖区','110101','东城区','xx街道xx号','家',1),
(2,1,'李四','女','12345678902','110000','北京市','110100','市辖区','110102','西城区','xx街道xx号','公司',0),
(3,2,'王五','男','12345678903','310000','上海市','310100','市辖区','310101','黄浦区','xx街道xx号','家',1),
(4,2,'赵六','女','12345678904','310000','上海市','310100','市辖区','310104','徐汇区','xx街道xx号','公司',0),
(5,3,'孙七','男','12345678905','440000','广东省','440100','广州市','440103','荔湾区','xx街道xx号','家',1);

/*Table structure for table `administrators` */

DROP TABLE IF EXISTS `administrators`;

CREATE TABLE `administrators` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员表';

/*Data for the table `administrators` */

insert  into `administrators`(`id`,`avatar`,`name`,`username`,`password`,`phone`,`sex`,`id_number`,`status`,`create_time`,`update_time`,`create_user`,`update_user`) values 
(1,'avatar1.jpg','管理员1','admin','123456','12345678901','男','123456789012345678',1,'2021-01-01 00:00:00','2021-01-01 00:00:00',1,1),
(2,'avatar2.jpg','管理员2','admin2','123456','12345678902','女','123456789012345679',1,'2021-01-01 00:00:00','2021-01-01 00:00:00',1,1);

/*Table structure for table `china` */

DROP TABLE IF EXISTS `china`;

CREATE TABLE `china` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '型号',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `style` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风格',
  `types` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `applicable` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '适用对象',
  `status` int(11) DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='瓷砖表';

/*Data for the table `china` */

insert  into `china`(`id`,`name`,`image`,`description`,`style`,`types`,`applicable`,`status`,`create_time`,`update_time`,`create_user`,`update_user`) values 
(1,'瓷砖1','image1.jpg','瓷砖1描述','现代','地砖','家庭',1,'2021-01-01 10:00:00',NULL,1,NULL),
(2,'瓷砖2','image2.jpg','瓷砖2描述','古典','墙砖','商业',1,'2021-01-02 11:00:00',NULL,1,NULL),
(3,'瓷砖3','image3.jpg','瓷砖3描述','简约','地砖','家庭',1,'2021-01-03 12:00:00',NULL,1,NULL),
(4,'瓷砖4','image4.jpg','瓷砖4描述','现代','墙砖','商业',1,'2021-01-04 13:00:00',NULL,1,NULL),
(5,'瓷砖5','image5.jpg','瓷砖5描述','古典','地砖','家庭',1,'2021-01-05 14:00:00',NULL,1,NULL);

/*Table structure for table `china_detail` */

DROP TABLE IF EXISTS `china_detail`;

CREATE TABLE `china_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `china_id` bigint(20) NOT NULL COMMENT '瓷砖id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `specification` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '规格',
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '颜色',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '尺码',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='瓷砖详情表';

/*Data for the table `china_detail` */

insert  into `china_detail`(`id`,`china_id`,`image`,`specification`,`color`,`size`,`price`) values 
(1,1,'image1.jpg','规格1','红色','30x30cm','50.00'),
(2,1,'image1.jpg','规格2','蓝色','40x40cm','60.00'),
(3,2,'image2.jpg','规格1','绿色','50x50cm','70.00'),
(4,2,'image2.jpg','规格2','黄色','60x60cm','80.00'),
(5,3,'image3.jpg','规格1','紫色','70x70cm','90.00');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `china_detail_id` bigint(20) NOT NULL COMMENT '瓷砖详细id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户id',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单取消时间',
  `start_delivery_time` datetime DEFAULT NULL COMMENT '预计发货时间',
  `end_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '送达时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

/*Data for the table `orders` */

insert  into `orders`(`id`,`order_number`,`china_detail_id`,`status`,`user_id`,`address_book_id`,`order_time`,`number`,`amount`,`checkout_time`,`pay_method`,`pay_status`,`remark`,`phone`,`user_name`,`consignee`,`cancel_reason`,`rejection_reason`,`cancel_time`,`start_delivery_time`,`end_delivery_time`,`delivery_time`) values 
(1,'202101010001',1,1,1,1,'2021-01-01 10:00:00',2,'100.00',NULL,1,0,'无','12345678901','张三','张三',NULL,NULL,NULL,NULL,NULL,NULL),
(2,'202101010002',2,2,1,2,'2021-01-02 11:00:00',1,'50.00',NULL,2,0,'无','12345678901','张三','李四',NULL,NULL,NULL,NULL,NULL,NULL),
(3,'202101020001',3,3,2,3,'2021-01-03 12:00:00',3,'150.00',NULL,1,0,'无','12345678903','王五','王五',NULL,NULL,NULL,NULL,NULL,NULL),
(4,'202101020002',4,4,2,4,'2021-01-04 13:00:00',1,'50.00',NULL,2,0,'无','12345678903','王五','赵六',NULL,NULL,NULL,NULL,NULL,NULL),
(5,'202101030001',5,5,3,5,'2021-01-05 14:00:00',2,'100.00',NULL,1,0,'无','12345678905','孙七','孙七',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `shopping_cart` */

DROP TABLE IF EXISTS `shopping_cart`;

CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `china_id` bigint(20) DEFAULT NULL COMMENT '瓷砖id',
  `china_detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '瓷砖详细信息',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';

/*Data for the table `shopping_cart` */

insert  into `shopping_cart`(`id`,`description`,`image`,`user_id`,`china_id`,`china_detail`,`number`,`amount`,`create_time`) values 
(1,'瓷砖1描述','image1.jpg',1,1,'规格1',2,'100.00','2021-01-01 10:00:00'),
(2,'瓷砖2描述','image2.jpg',1,2,'规格2',1,'50.00','2021-01-02 11:00:00'),
(3,'瓷砖3描述','image3.jpg',2,3,'规格1',3,'150.00','2021-01-03 12:00:00'),
(4,'瓷砖4描述','image4.jpg',2,4,'规格2',1,'50.00','2021-01-04 13:00:00'),
(5,'瓷砖5描述','image5.jpg',3,5,'规格1',2,'100.00','2021-01-05 14:00:00');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='普通用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`name`,`phone`,`sex`,`id_number`,`avatar`,`create_time`) values 
(1,'user1','123456','用户1','12345678911','男','123456789012345678','avatar1.jpg','2021-01-01 00:00:00'),
(2,'user2','123456','用户2','12345678912','女','123456789012345679','avatar2.jpg','2021-01-01 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
