-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dlyk
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_activity`
--

DROP TABLE IF EXISTS `t_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_activity` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，活动ID',
  `owner_id` int DEFAULT NULL COMMENT '活动所属人ID',
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '活动名称',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `cost` decimal(11,2) DEFAULT NULL COMMENT '活动预算',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '活动描述',
  `create_time` datetime DEFAULT NULL COMMENT '活动创建时间',
  `create_by` int DEFAULT NULL COMMENT '活动创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '活动编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '活动编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner` (`owner_id`) USING BTREE,
  KEY `create_by` (`create_by`) USING BTREE,
  KEY `edit_by` (`edit_by`) USING BTREE,
  CONSTRAINT `t_activity_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_ibfk_3` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='市场活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_activity`
--

LOCK TABLES `t_activity` WRITE;
/*!40000 ALTER TABLE `t_activity` DISABLE KEYS */;
INSERT INTO `t_activity` VALUES (1,4,'百度推广','2023-04-02 19:18:20','2023-06-30 00:00:00',1200000.00,'百度排名推广,活动非常非常贵,大家好好的做推广.由于推广活动的效果非常好,决定延期一个月.11111','2025-03-24 08:45:09',NULL,'2023-05-15 00:10:49',NULL),(2,2,'充话费-送手机','2023-03-28 17:48:49','2023-04-30 17:48:54',9000.00,'充话费,送手机,充满送Iphone14','2023-03-28 17:49:28',1,'2023-05-15 00:10:52',1),(7,1,'抖音推广','2023-04-01 12:03:09','2023-04-30 12:03:09',15800.00,'抖音直播推广活动1','2025-03-24 07:45:15',6,NULL,NULL),(8,1,'抖音推广','2023-04-01 12:03:09','2023-04-30 12:03:09',15800.00,'抖音直播推广活动2','2025-03-24 10:45:18',7,'2023-04-28 14:28:53',NULL),(10,2,'11','2023-04-11 00:30:58','2023-04-30 00:31:00',131.00,'12312312','2025-03-22 08:45:22',NULL,'2023-04-28 13:33:56',NULL),(11,3,'1213','2023-04-01 00:00:00','2023-04-30 00:31:13',123123.00,'23123123','2024-04-24 08:45:31',NULL,NULL,NULL),(12,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1','2023-03-26 08:50:38',NULL,NULL,NULL),(13,1,'抖音推广2','2023-04-01 12:03:09','2023-04-01 12:03:09',125800.00,'抖音直播推广活动2','2025-04-24 08:42:46',NULL,'2025-03-26 22:31:26',1),(14,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1','2024-03-29 11:45:52',NULL,NULL,NULL),(15,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动11111','2024-05-26 05:45:59',NULL,'2023-04-26 17:09:49',NULL),(16,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(17,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(18,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(19,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(20,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(21,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(22,1,'抖音推广','2023-04-01 10:03:09','2023-04-09 12:03:09',65800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(23,1,'抖音推广','2023-04-01 10:03:09','2023-04-11 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(24,1,'抖音推广','2023-04-01 10:03:09','2023-04-12 12:03:09',75800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(25,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(26,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',35800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(27,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(28,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(29,1,'抖音推广','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(40,1,'抖音推广11','2023-04-01 12:03:09','2023-04-01 12:03:09',95800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(41,1,'抖音推广11','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(42,1,'抖音推广11','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(43,1,'抖音推广11','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(44,1,'抖音推广11','2023-04-01 12:03:09','2023-04-01 12:03:09',15800.00,'抖音直播推广活动1',NULL,NULL,NULL,NULL),(45,1,'抖音推广11','2022-04-01 12:03:09','2026-04-01 12:03:09',15800.00,'抖音直播推广活动2',NULL,NULL,NULL,NULL),(46,3,'抖音短视频广告','2023-11-14 00:00:00','2026-11-30 00:00:00',5000.00,'抖音短视频广告，宣传产品',NULL,NULL,NULL,NULL),(47,3,'我去恶趣味','2023-11-15 16:51:40','2026-11-30 16:51:42',231231.00,'色达所大所大所多',NULL,NULL,NULL,NULL),(48,4,'这列没东西','2023-06-30 00:44:19','2026-03-31 00:00:00',888.00,'发发发！','2023-06-27 22:27:15',NULL,'2025-03-26 22:31:51',1),(50,35,'测试','2025-03-26 20:38:32','2026-04-01 00:00:00',1099.00,'这是一个测试内容','2025-03-26 20:38:52',1,'2025-03-26 21:19:09',1);
/*!40000 ALTER TABLE `t_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_activity_remark`
--

DROP TABLE IF EXISTS `t_activity_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_activity_remark` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，活动备注ID',
  `activity_id` int DEFAULT NULL COMMENT '活动ID',
  `note_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注内容',
  `create_time` datetime DEFAULT NULL COMMENT '备注创建时间',
  `create_by` int DEFAULT NULL COMMENT '备注创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '备注编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '备注编辑人',
  `deleted` int DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `activity_id` (`activity_id`) USING BTREE,
  KEY `t_activity_remark_ibfk_2` (`create_by`) USING BTREE,
  KEY `t_activity_remark_ibfk_3` (`edit_by`) USING BTREE,
  CONSTRAINT `t_activity_remark_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `t_activity` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_remark_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_remark_ibfk_3` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='市场活动备注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_activity_remark`
--

LOCK TABLES `t_activity_remark` WRITE;
/*!40000 ALTER TABLE `t_activity_remark` DISABLE KEYS */;
INSERT INTO `t_activity_remark` VALUES (1,46,'1111111111111','2023-05-17 14:07:48',1,NULL,NULL,0),(2,1,'2312323123123','2023-05-17 14:25:30',2,'2023-11-08 14:21:42',1,0),(3,2,'1231231','2023-06-07 23:08:32',1,NULL,NULL,0),(4,2,'23123','2023-06-07 23:08:57',4,NULL,NULL,0),(5,10,'恶趣味群二无群二群无','2023-06-07 23:10:20',1,NULL,NULL,0),(6,1,'12而且我撒','2023-08-04 22:30:47',1,NULL,NULL,0),(7,50,'测试备注1','2025-03-26 23:01:13',1,'2025-03-27 09:28:45',1,0),(11,50,'测试备注2','2025-03-27 09:11:26',1,'2025-03-27 09:45:02',1,1),(12,50,'测试备注33','2025-03-27 12:06:43',1,'2025-03-27 12:06:49',1,0),(13,2,'非管理员备注测试1-1','2025-03-27 13:18:09',2,'2025-03-27 13:18:16',2,0),(14,50,'什么？！，是大总裁？HuangSir，你又在发什么癫啊？','2025-03-27 16:27:33',1,NULL,NULL,0);
/*!40000 ALTER TABLE `t_activity_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_clue`
--

DROP TABLE IF EXISTS `t_clue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_clue` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，线索ID',
  `owner_id` int DEFAULT NULL COMMENT '线索所属人ID',
  `activity_id` int DEFAULT NULL COMMENT '活动ID',
  `full_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `appellation` int DEFAULT NULL COMMENT '称呼',
  `phone` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机号',
  `weixin` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '微信号',
  `qq` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `age` int DEFAULT NULL COMMENT '年龄',
  `job` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '职业',
  `year_income` decimal(10,2) DEFAULT NULL COMMENT '年收入',
  `address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '地址',
  `need_loan` int DEFAULT NULL COMMENT '是否需要贷款（0不需要，1需要）',
  `intention_state` int DEFAULT NULL COMMENT '意向状态',
  `intention_product` int DEFAULT NULL COMMENT '意向产品',
  `state` int DEFAULT NULL COMMENT '线索状态',
  `source` int DEFAULT NULL COMMENT '线索来源',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '线索描述',
  `next_contact_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `appellation` (`appellation`) USING BTREE,
  KEY `state` (`state`) USING BTREE,
  KEY `source` (`source`) USING BTREE,
  KEY `owner` (`owner_id`) USING BTREE,
  KEY `create_by` (`create_by`) USING BTREE,
  KEY `edit_by` (`edit_by`) USING BTREE,
  KEY `t_clue_ibfk_7` (`activity_id`) USING BTREE,
  KEY `t_clue_ibfk_8` (`need_loan`) USING BTREE,
  KEY `t_clue_ibfk_9` (`intention_state`) USING BTREE,
  KEY `t_clue_ibfk_10` (`intention_product`) USING BTREE,
  CONSTRAINT `t_clue_ibfk_1` FOREIGN KEY (`appellation`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_10` FOREIGN KEY (`intention_product`) REFERENCES `t_product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_2` FOREIGN KEY (`state`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_3` FOREIGN KEY (`source`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_5` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_6` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_7` FOREIGN KEY (`activity_id`) REFERENCES `t_activity` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_8` FOREIGN KEY (`need_loan`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_9` FOREIGN KEY (`intention_state`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1170 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='线索表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_clue`
--

LOCK TABLES `t_clue` WRITE;
/*!40000 ALTER TABLE `t_clue` DISABLE KEYS */;
INSERT INTO `t_clue` VALUES (1,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'超级飞侠',10.00,'北京亦庄',50,46,5,24,3,'超级飞侠近期在看车','2023-04-27 10:33:47','2023-07-17 15:17:52',1,'2025-03-30 21:47:23',1),(2,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',50,47,8,-1,16,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:13',2,NULL,NULL),(3,2,7,'张翔',18,'13876903226','13876903226','123456',NULL,26,NULL,9.00,'天津和平',50,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:17',3,NULL,NULL),(4,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',50,46,5,24,3,'近期在看车','2023-04-27 10:33:47','2023-04-12 15:17:52',2,NULL,NULL),(5,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',50,47,8,-1,16,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:19',1,NULL,NULL),(6,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:23',3,NULL,NULL),(7,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,24,3,'近期在看车','2023-04-27 10:33:47','2023-04-12 15:17:52',5,NULL,NULL),(8,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,'秃头程序员',8.00,'河北廊坊',49,47,8,24,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:25',2,NULL,NULL),(9,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-28 13:24:10','2023-06-10 01:01:28',2,NULL,NULL),(10,1,46,'王杰89890890',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'超级飞侠',10.00,'北京亦庄',49,46,5,-1,3,'近期在看车','2023-04-28 10:33:47','2023-04-12 15:17:52',3,'2025-03-30 18:13:46',1),(11,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,24,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:30',6,NULL,NULL),(12,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:33',2,NULL,NULL),(13,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,-1,3,'近期在看车','2023-04-27 10:33:47','2023-04-12 15:17:52',8,NULL,NULL),(14,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,-1,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:36',3,NULL,NULL),(15,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:38',4,NULL,NULL),(16,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,24,3,'近期在看车','2023-04-27 10:33:47','2023-04-12 15:17:52',5,NULL,NULL),(17,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,-1,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:41',6,NULL,NULL),(18,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:44',NULL,NULL,NULL),(19,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,-1,3,'近期在看车','2023-04-27 10:33:47','2023-06-12 15:17:52',NULL,NULL,NULL),(20,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,24,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:46',NULL,NULL,NULL),(21,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:46',NULL,NULL,NULL),(22,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,24,3,'近期在看车','2023-04-27 10:33:47','2023-04-12 15:17:52',NULL,NULL,NULL),(23,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,-1,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:46',NULL,NULL,NULL),(24,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:46',NULL,NULL,NULL),(25,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,24,3,'近期在看车','2023-04-27 10:33:47','2023-04-12 15:17:52',NULL,NULL,NULL),(26,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,24,33,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:46',NULL,NULL,NULL),(27,2,7,'张翔',18,'13876903226','13876903226',NULL,NULL,26,NULL,9.00,'天津和平',49,48,10,30,44,'有购车意向，需要跟踪','2023-04-15 00:00:00','2023-06-10 01:01:46',NULL,NULL,NULL),(28,1,46,'王杰',18,'13700000000','13700000000','13700000000','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,5,24,3,'近期在看车','2023-04-27 10:33:47','2023-06-12 15:17:52',NULL,NULL,NULL),(29,1,47,'张峰',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,8,24,16,'通过打电话获取的线索','2023-04-30 10:33:51','2023-06-10 01:01:46',NULL,NULL,NULL),(31,3,2,'213213',20,'12312312','12312312','2312312','12312312',12,'341231',2131231.00,'12312312',50,46,7,24,44,'asfeefsdewrewr','2023-04-27 16:48:30','2023-06-10 01:01:46',NULL,NULL,NULL),(1109,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,2,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1110,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,2,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1111,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,2,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1112,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,14,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1113,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,14,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1114,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,14,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1115,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,14,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1116,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,14,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1117,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,17,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1118,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,25,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1119,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,17,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1120,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,22,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1121,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,22,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1122,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,45,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1123,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,25,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1124,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,25,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1125,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,25,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1126,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,25,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1127,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,36,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1128,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,36,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1129,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,36,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1130,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,36,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1131,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,36,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1132,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,36,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1133,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,39,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1134,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,36,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1135,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,43,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1136,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,39,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1137,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,39,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1138,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,43,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1139,1,46,'王杰',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,45,'近期在看车','2023-11-27 20:33:25',NULL,NULL,NULL,NULL),(1140,1,47,'张怡然',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,39,'通过打电话获取的线索','2023-11-30 10:33:51',NULL,NULL,NULL,NULL),(1141,2,7,'张翔宇',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',NULL,NULL,NULL,NULL,45,'有购车意向，需要跟踪','2023-11-15 10:30:00',NULL,NULL,NULL,NULL),(1142,1,46,'王世坤',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',NULL,NULL,NULL,NULL,43,'近期在看车','2023-12-27 09:20:21',NULL,NULL,NULL,NULL),(1143,1,47,'张珊珊',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',NULL,NULL,NULL,NULL,43,'通过打电话获取的线索','2023-11-30 13:33:51',NULL,NULL,NULL,NULL),(1144,35,50,'线索添加测试1',18,'13167777777','huangsir007','huangsir007qq','test1@qq.com',19,'学生',10.00,'深圳南山',50,48,3,-1,3,'测试线索添加','2025-04-04 00:00:00','2025-03-28 16:01:10',1,'2025-03-31 16:45:14',1),(1160,1,46,'王杰test',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,2,24,3,'近期在看车','2023-11-27 20:33:25','2025-03-30 17:01:54',1,NULL,NULL),(1161,7,47,'张怡然test',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',50,46,4,6,16,'通过打电话获取的线索','2023-11-30 10:33:51','2025-03-30 17:01:54',1,NULL,NULL),(1162,12,7,'张翔宇test',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',49,48,7,30,23,'有购车意向，需要跟踪','2023-11-15 10:30:00','2025-03-30 17:01:54',1,NULL,NULL),(1163,19,46,'王世坤test',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',50,48,6,24,17,'近期在看车','2023-12-27 09:20:21','2025-03-30 17:01:54',1,NULL,NULL),(1164,21,47,'张珊珊test',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,9,-1,17,'通过打电话获取的线索','2023-11-30 13:33:51','2025-03-30 17:01:54',1,'2025-04-01 09:23:49',1),(1165,1,46,'王杰test',18,'13700000000','13700000000','230989432','wangjie@163.com',32,'工程师',10.00,'北京亦庄',49,46,2,24,3,'近期在看车','2023-11-27 20:33:25','2025-04-01 16:48:52',2,NULL,NULL),(1166,7,47,'张怡然test',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',50,46,4,6,16,'通过打电话获取的线索','2023-11-30 10:33:51','2025-04-01 16:48:52',2,NULL,NULL),(1167,12,7,'张翔宇test',18,'13876903226','13876903226','1298094321',NULL,26,NULL,9.00,'天津和平',49,48,7,30,23,'有购车意向，需要跟踪','2023-11-15 10:30:00','2025-04-01 16:48:52',2,NULL,NULL),(1168,19,46,'王世坤test',18,'13700000000','13700000000','209836613','wangjie@163.com',32,'工程师',10.00,'北京亦庄',50,48,6,24,23,'近期在看车','2023-12-27 09:20:21','2025-04-01 16:48:52',2,NULL,NULL),(1169,21,47,'张珊珊test',41,'13700000001','13700000001',NULL,NULL,28,NULL,8.00,'河北廊坊',49,47,9,6,17,'通过打电话获取的线索','2023-11-30 13:33:51','2025-04-01 16:48:52',2,NULL,NULL);
/*!40000 ALTER TABLE `t_clue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_clue_remark`
--

DROP TABLE IF EXISTS `t_clue_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_clue_remark` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，线索备注ID',
  `clue_id` int DEFAULT NULL COMMENT '线索ID',
  `note_way` int DEFAULT NULL COMMENT '跟踪方式',
  `note_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '跟踪内容',
  `create_time` datetime DEFAULT NULL COMMENT '跟踪时间',
  `create_by` int DEFAULT NULL COMMENT '跟踪人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  `deleted` int DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `create_by` (`create_by`) USING BTREE,
  KEY `edit_by` (`edit_by`) USING BTREE,
  KEY `clue_id` (`clue_id`) USING BTREE,
  KEY `t_clue_remark_ibfk_4` (`note_way`) USING BTREE,
  CONSTRAINT `t_clue_remark_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_remark_ibfk_2` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_remark_ibfk_3` FOREIGN KEY (`clue_id`) REFERENCES `t_clue` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_remark_ibfk_4` FOREIGN KEY (`note_way`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='线索跟踪记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_clue_remark`
--

LOCK TABLES `t_clue_remark` WRITE;
/*!40000 ALTER TABLE `t_clue_remark` DISABLE KEYS */;
INSERT INTO `t_clue_remark` VALUES (5,8,65,'2143242354','2023-04-28 14:24:27',1,NULL,NULL,0),(6,10,64,'123412312312','2023-04-28 14:29:41',1,NULL,NULL,0),(7,10,63,'二位绕弯儿翁人','2023-04-28 14:30:16',1,NULL,NULL,0),(8,21,61,'12213123123','2023-05-21 23:43:48',1,NULL,NULL,0),(9,21,62,'3ewrwerewr','2023-05-21 23:43:52',1,NULL,NULL,0),(10,21,65,'ewrwerewrewr','2023-05-21 23:43:55',1,NULL,NULL,0),(11,16,64,'123213123','2023-05-21 23:54:57',1,NULL,NULL,0),(12,16,63,'23123123','2023-05-21 23:54:59',1,NULL,NULL,0),(13,16,61,'2312313','2023-05-21 23:55:02',1,NULL,NULL,0),(14,1,62,'2222222223','2023-06-27 22:47:49',1,'2025-03-31 09:38:29',1,0),(15,1,65,'111111111111111','2023-06-27 22:47:56',1,NULL,NULL,0),(16,1,64,'1111111111111111111111222222222222222222222222','2023-06-27 22:48:01',1,NULL,NULL,0),(17,2,61,'测试添加1','2025-03-30 23:29:02',1,NULL,NULL,1),(18,3,64,'测试添加2','2025-03-30 23:29:21',1,NULL,NULL,0),(19,2,63,'Chesham is the best way to get the best way?说啥废话呢？','2025-03-31 09:33:49',1,'2025-03-31 09:36:56',1,0),(20,2,61,'城市像带着滤镜。光晕到让人昏迷','2025-03-31 09:37:43',1,NULL,NULL,0),(21,2,62,'啊啊1111','2025-03-31 09:38:56',2,'2025-03-31 09:39:15',2,0);
/*!40000 ALTER TABLE `t_clue_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer`
--

DROP TABLE IF EXISTS `t_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customer` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，客户ID',
  `clue_id` int DEFAULT NULL COMMENT '线索ID',
  `product` int DEFAULT NULL COMMENT '选购产品',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '客户描述',
  `next_contact_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_customer_ibfk_1` (`clue_id`) USING BTREE,
  KEY `t_customer_ibfk_2` (`product`) USING BTREE,
  KEY `t_customer_ibfk_3` (`create_by`) USING BTREE,
  KEY `t_customer_ibfk_4` (`edit_by`) USING BTREE,
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`clue_id`) REFERENCES `t_clue` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_2` FOREIGN KEY (`product`) REFERENCES `t_product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer`
--

LOCK TABLES `t_customer` WRITE;
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
INSERT INTO `t_customer` VALUES (1,10,3,'2131231','2023-05-06 15:36:59','2025-04-01 08:38:08',2,NULL,NULL),(2,8,6,'124气味儿群','2023-05-05 00:00:00','2025-04-01 08:38:09',2,NULL,NULL),(3,6,6,'1232强21312','2023-05-06 00:00:00','2023-04-28 15:42:15',1,NULL,NULL),(4,2,3,'阿萨的人','2023-05-05 00:00:00','2023-04-28 15:54:04',1,NULL,NULL),(5,10,1,'234234','2023-05-05 00:00:00','2023-04-28 15:56:44',1,NULL,NULL),(6,17,2,'是的啊所大','2023-05-05 00:00:00','2023-04-28 15:59:33',1,NULL,NULL),(7,5,2,'12312312','2023-05-12 00:00:00','2023-05-04 10:03:05',1,NULL,NULL),(8,19,2,'气味儿群翁','2023-05-04 10:03:18','2023-05-04 10:03:20',1,NULL,NULL),(9,14,4,'沃尔沃二','2023-06-09 00:00:00','2023-05-04 10:03:39',1,NULL,NULL),(10,23,4,'沃尔沃二翁','2023-05-23 00:00:00','2023-05-04 10:03:53',1,NULL,NULL),(11,13,2,'沃尔沃二','2023-05-13 00:00:00','2023-05-04 10:04:03',1,NULL,NULL),(12,1144,3,'线索转换客户测试1','2025-04-04 00:00:00','2025-03-31 16:45:14',1,NULL,NULL),(13,1164,8,'雪豹！','2025-04-04 00:00:00','2025-04-01 09:23:49',1,NULL,NULL);
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer_remark`
--

DROP TABLE IF EXISTS `t_customer_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customer_remark` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，客户备注ID',
  `customer_id` int DEFAULT NULL COMMENT '客户ID',
  `note_way` int DEFAULT NULL COMMENT '跟踪方式',
  `note_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '跟踪内容',
  `create_by` int DEFAULT NULL COMMENT '跟踪人',
  `create_time` datetime DEFAULT NULL COMMENT '跟踪时间',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  `deleted` int DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_customer_remark_ibfk_1` (`customer_id`) USING BTREE,
  KEY `t_customer_remark_ibfk_2` (`note_way`) USING BTREE,
  KEY `t_customer_remark_ibfk_3` (`create_by`) USING BTREE,
  KEY `t_customer_remark_ibfk_4` (`edit_by`) USING BTREE,
  CONSTRAINT `t_customer_remark_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_remark_ibfk_2` FOREIGN KEY (`note_way`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_remark_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_remark_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='客户跟踪记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer_remark`
--

LOCK TABLES `t_customer_remark` WRITE;
/*!40000 ALTER TABLE `t_customer_remark` DISABLE KEYS */;
INSERT INTO `t_customer_remark` VALUES (1,10,65,'1111111111111111',1,'2023-05-04 15:25:51',NULL,NULL,0),(2,10,64,'2222222222222',1,'2023-05-04 15:28:13',NULL,NULL,0),(3,10,63,'EREWREWRWRWR',1,'2023-05-04 16:21:03',NULL,NULL,0),(4,7,61,'13213123',1,'2023-05-17 17:36:16',NULL,NULL,0),(5,10,62,'2342423423423',1,'2023-05-17 17:36:33',NULL,NULL,0),(6,1,65,'3212321321',1,'2023-05-21 23:50:42',NULL,NULL,0),(7,1,64,'eqwewqeqwe',1,'2023-05-21 23:50:46',NULL,NULL,0),(8,1,63,'wqeqwewqeqw',1,'2023-05-21 23:50:48',NULL,NULL,0),(9,8,61,'ewqeqweq',1,'2023-05-21 23:50:59',NULL,NULL,0),(10,5,62,'weqweqweqweq',1,'2023-05-21 23:51:05',NULL,NULL,0),(11,5,65,'weqwewqeqw',1,'2023-05-21 23:51:08',NULL,NULL,0),(12,5,64,'23213213123',1,'2023-05-21 23:51:13',NULL,NULL,0),(13,5,65,'23123213213',1,'2023-05-21 23:51:16',NULL,NULL,0),(14,5,64,'23123213213',1,'2023-05-21 23:51:19',NULL,NULL,0),(15,5,63,'3232323123',1,'2023-05-21 23:51:23',NULL,NULL,0),(16,1,61,'12312321321',1,'2023-05-21 23:56:55',NULL,NULL,0),(17,2,62,'1232131231',1,'2023-05-21 23:57:03',NULL,NULL,0),(18,10,65,'122112112',1,'2023-05-22 22:12:52',NULL,NULL,0),(19,10,64,'123213214124',1,'2023-05-22 22:12:58',NULL,NULL,0),(20,10,63,'13241242432432',1,'2023-05-22 22:13:03',NULL,NULL,0),(21,10,61,'3423423423',1,'2023-05-22 22:13:06',NULL,NULL,0),(22,2,62,'1242412141',1,'2023-05-31 20:14:08',NULL,NULL,0),(25,12,61,'测试1',1,'2025-04-01 14:56:10',NULL,NULL,0),(26,12,62,'车市23',1,'2025-04-01 14:56:22',NULL,NULL,1);
/*!40000 ALTER TABLE `t_customer_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dic_type`
--

DROP TABLE IF EXISTS `t_dic_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dic_type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，字典类型ID',
  `type_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字典类型代码',
  `type_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '字典类型名称',
  `remark` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type_code` (`type_code`) USING BTREE,
  KEY `code` (`type_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dic_type`
--

LOCK TABLES `t_dic_type` WRITE;
/*!40000 ALTER TABLE `t_dic_type` DISABLE KEYS */;
INSERT INTO `t_dic_type` VALUES (1,'sex','性别','应该只有男和女吧？'),(2,'appellation','称呼','足够的尊重是必要的'),(3,'clueState','线索状态',NULL),(4,'returnPriority','回访优先级',NULL),(5,'returnState','回访状态',NULL),(6,'source','来源',NULL),(7,'stage','阶段',NULL),(8,'transactionType','交易类型',NULL),(9,'intentionState','意向状态',NULL),(10,'needLoan','是否贷款','总是有风险的'),(11,'educational','学历',NULL),(12,'userState','用户状态',NULL),(13,'noteWay','跟踪方式',NULL),(16,'测试111222','测试11111222','去玩阴阳师！！！滚');
/*!40000 ALTER TABLE `t_dic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dic_value`
--

DROP TABLE IF EXISTS `t_dic_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dic_value` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，字典值ID',
  `type_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '字典类型代码',
  `type_value` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '字典值',
  `order` int DEFAULT NULL COMMENT '字典值排序',
  `remark` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_dic_value_ibfk_1` (`type_code`) USING BTREE,
  CONSTRAINT `t_dic_value_ibfk_1` FOREIGN KEY (`type_code`) REFERENCES `t_dic_type` (`type_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dic_value`
--

LOCK TABLES `t_dic_value` WRITE;
/*!40000 ALTER TABLE `t_dic_value` DISABLE KEYS */;
INSERT INTO `t_dic_value` VALUES (-1,'clueState','已转客户',0,NULL),(1,'clueState','虚假线索',4,NULL),(2,'source','知乎',8,NULL),(3,'source','车展会',11,NULL),(4,'returnPriority','最高',2,NULL),(5,'appellation','教授',5,NULL),(6,'clueState','将来联系',2,NULL),(7,'clueState','丢失线索',5,NULL),(8,'returnState','未启动',1,NULL),(10,'clueState','试图联系',1,NULL),(11,'appellation','博士',4,NULL),(12,'stage','01创建交易',1,NULL),(14,'source','汽车之家',14,NULL),(15,'returnPriority','低',3,NULL),(16,'source','网络广告',1,NULL),(17,'source','视频直播',9,NULL),(18,'appellation','先生',1,NULL),(19,'returnPriority','高',1,NULL),(20,'appellation','夫人',2,NULL),(21,'stage','06丢失关闭',7,NULL),(22,'source','地图',13,NULL),(23,'source','合作伙伴',6,NULL),(24,'clueState','未联系',6,NULL),(25,'source','朋友圈',10,NULL),(26,'returnState','进行中',3,NULL),(27,'clueState','已联系',3,NULL),(28,'returnState','推迟',2,NULL),(29,'returnState','完成',4,NULL),(30,'clueState','需要条件',7,NULL),(32,'returnState','等待某人',5,NULL),(33,'source','懂车帝',2,NULL),(34,'returnPriority','常规',5,NULL),(35,'stage','04产品检验',5,NULL),(36,'source','易车网',12,NULL),(37,'stage','02确认清单',3,NULL),(38,'returnPriority','最低',4,NULL),(39,'source','员工介绍',3,NULL),(40,'stage','03交付定金',4,NULL),(41,'appellation','女士',3,NULL),(42,'stage','05付款成交',6,NULL),(43,'source','官方网站',5,NULL),(44,'source','公众号',7,NULL),(45,'source','门店参观',4,NULL),(46,'intentionState','有意向',1,NULL),(47,'intentionState','无意向',2,NULL),(48,'intentionState','意向不明',3,NULL),(49,'needLoan','需要',1,NULL),(50,'needLoan','不需要',2,NULL),(51,'sex','男',1,NULL),(52,'sex','女',2,NULL),(53,'educational','小学',1,NULL),(54,'educational','初中',2,NULL),(55,'educational','高中',3,NULL),(56,'educational','大学',4,NULL),(57,'educational','研究生',5,NULL),(58,'userState','正常',1,NULL),(59,'userState','锁定',2,NULL),(60,'userState','禁用',3,NULL),(61,'noteWay','电话',1,NULL),(62,'noteWay','微信',2,NULL),(63,'noteWay','QQ',3,NULL),(64,'noteWay','面聊',4,NULL),(65,'noteWay','其他',5,NULL);
/*!40000 ALTER TABLE `t_dic_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'市场活动',NULL,NULL,'menu',0,1,'OfficeBuilding'),(2,'市场活动',NULL,'/dashboard/activity','menu',1,1,'CreditCard'),(3,'市场活动-列表','activity:list',NULL,'button',2,NULL,NULL),(4,'市场活动-录入','activity:add',NULL,'button',2,NULL,NULL),(5,'市场活动-编辑','activity:edit',NULL,'button',2,NULL,NULL),(6,'市场活动-查看','activity:view',NULL,'button',2,NULL,NULL),(7,'市场活动-删除','activity:delete',NULL,'button',2,NULL,NULL),(9,'市场活动-搜索','activity:search',NULL,'button',2,NULL,NULL),(10,'线索管理',NULL,NULL,'menu',0,2,'Magnet'),(12,'线索管理',NULL,'/dashboard/clue','menu',10,1,'Paperclip'),(13,'线索管理-列表','clue:list',NULL,'button',12,NULL,NULL),(14,'线索管理-录入','clue:add',NULL,'button',12,NULL,NULL),(15,'线索管理-编辑','clue:edit',NULL,'button',12,NULL,NULL),(16,'线索管理-查看','clue:view',NULL,'button',12,NULL,NULL),(17,'线索管理-删除','clue:delete',NULL,'button',12,NULL,NULL),(18,'线索管理-导入','clue:import',NULL,'button',12,NULL,NULL),(19,'客户管理',NULL,NULL,'menu',0,3,'User'),(20,'客户管理',NULL,'/dashboard/customer','menu',19,1,'UserFilled'),(21,'客户管理-列表','customer:list',NULL,'button',20,NULL,NULL),(22,'客户管理-查看','customer:view',NULL,'button',20,NULL,NULL),(23,'客户管理-导出','customer:export',NULL,'button',20,NULL,NULL),(24,'交易管理',NULL,NULL,'menu',0,4,'Wallet'),(25,'交易管理',NULL,'/dashboard/tran','menu',24,1,'Coin'),(26,'交易管理-列表','tran:list',NULL,'button',25,NULL,NULL),(27,'交易管理-查看','tran:view',NULL,'button',25,NULL,NULL),(28,'产品管理',NULL,NULL,'menu',0,5,'Memo'),(29,'产品管理',NULL,'/dashboard/product','menu',28,1,'SetUp'),(30,'产品管理-列表','product:list',NULL,'button',29,NULL,NULL),(31,'产品管理-录入','product:add',NULL,'button',29,NULL,NULL),(32,'产品管理-编辑','product:edit',NULL,'button',29,NULL,NULL),(33,'产品管理-查看','product:view',NULL,'button',29,NULL,NULL),(34,'产品管理-删除','product:delete',NULL,'button',29,NULL,NULL),(35,'字典管理',NULL,NULL,'menu',0,6,'Grid'),(36,'字典类型',NULL,'/dashboard/dictype','menu',35,1,'Postcard'),(37,'字典类型-列表','dictype:list',NULL,'button',36,NULL,NULL),(38,'字典类型-录入','dictype:add',NULL,'button',36,NULL,NULL),(39,'字典类型-编辑','dictype:edit',NULL,'button',36,NULL,NULL),(40,'字典类型-查看','dictype:view',NULL,'button',36,NULL,NULL),(41,'字典类型-删除','dictype:delete',NULL,'button',36,NULL,NULL),(42,'字典数据','','/dashboard/dicvalue','menu',35,2,'DataAnalysis'),(43,'字典数据-列表','dicvalue:list',NULL,'button',42,NULL,NULL),(44,'字典数据-录入','dicvalue:add',NULL,'button',42,NULL,NULL),(45,'字典数据-编辑','dicvalue:edit',NULL,'button',42,NULL,NULL),(46,'字典数据-查看','dicvalue:view',NULL,'button',42,NULL,NULL),(47,'字典数据-删除','dicvalue:delete',NULL,'button',42,NULL,NULL),(48,'用户管理',NULL,NULL,'menu',0,7,'Stamp'),(49,'用户管理',NULL,'/dashboard/user','menu',48,1,'User'),(50,'用户管理-列表','user:list',NULL,'button',49,NULL,NULL),(51,'用户管理-录入','user:add',NULL,'button',49,NULL,NULL),(52,'用户管理-编辑','user:edit',NULL,'button',49,NULL,NULL),(53,'用户管理-查看','user:view',NULL,'button',49,NULL,NULL),(54,'用户管理-删除','user:delete',NULL,'button',49,NULL,NULL),(55,'系统管理',NULL,NULL,'menu',0,8,'Setting'),(56,'系统管理',NULL,'/dashboard/system','menu',55,1,'Tools'),(57,'系统管理-列表','system:list',NULL,'button',56,NULL,NULL),(58,'系统管理-录入','system:add',NULL,'button',56,NULL,NULL),(59,'系统管理-编辑','system:edit',NULL,'button',56,NULL,NULL),(60,'系统管理-查看','system:view',NULL,'button',56,NULL,NULL),(61,'系统管理-删除','system:delete',NULL,'button',56,NULL,NULL);
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product`
--

DROP TABLE IF EXISTS `t_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，线索ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `guide_price_s` decimal(10,2) DEFAULT NULL COMMENT '官方指导起始价',
  `guide_price_e` decimal(10,2) DEFAULT NULL COMMENT '官方指导最高价',
  `quotation` decimal(10,2) DEFAULT NULL COMMENT '经销商报价',
  `state` int DEFAULT NULL COMMENT '状态 0在售 1售罄',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_product_ibfk_1` (`create_by`) USING BTREE,
  KEY `t_product_ibfk_2` (`edit_by`) USING BTREE,
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_product_ibfk_2` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product`
--

LOCK TABLES `t_product` WRITE;
/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;
INSERT INTO `t_product` VALUES (1,'海鸥',10.18,10.58,10.28,0,'2023-04-06 18:25:00',1,'2025-04-02 19:51:31',1),(2,'比亚迪e2',10.28,10.98,9.78,0,'2023-04-03 15:26:12',1,NULL,NULL),(3,'比亚迪e3',15.48,15.98,14.38,0,'2023-04-03 11:29:08',1,NULL,NULL),(4,'海豚',11.68,13.68,10.86,0,'2023-04-09 10:27:47',1,NULL,NULL),(5,'秦EV',12.99,16.98,11.98,0,'2023-04-08 15:28:23',1,NULL,NULL),(6,'秦PLUS DM-i',9.98,16.58,9.06,0,'2023-04-10 19:29:53',1,NULL,NULL),(7,'秦PLUS EV',12.98,18.08,12.38,0,'2023-04-05 09:30:31',1,NULL,NULL),(8,'海豹',21.28,28.98,20.18,0,'2023-04-02 10:31:08',1,NULL,NULL),(9,'汉DM',21.78,32.18,19.88,0,'2023-04-07 16:31:45',1,NULL,NULL),(10,'宋PLUS EV',18.68,20.38,17.86,0,'2023-03-18 21:33:08',1,NULL,NULL),(11,'特斯拉ModelY',13.00,15.00,15.90,0,'2025-04-02 18:37:57',1,NULL,NULL),(12,'小米Su7',21.90,29.90,25.90,0,'2025-04-02 19:52:13',1,NULL,NULL);
/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'admin','管理员'),(2,'saler','销售员'),(3,'manager','销售经理'),(4,'marketing ','市场营销'),(5,'accountant','会计');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_role_permission_ibfk_1` (`role_id`) USING BTREE,
  KEY `t_role_permission_ibfk_2` (`permission_id`) USING BTREE,
  CONSTRAINT `t_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色权限关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,9),(9,1,10),(10,1,12),(11,1,13),(12,1,14),(13,1,15),(14,1,16),(15,1,17),(16,1,18),(17,1,19),(18,1,20),(19,1,21),(20,1,22),(21,1,23),(22,1,24),(23,1,25),(24,1,26),(25,1,27),(26,1,28),(27,1,29),(28,1,30),(29,1,31),(30,1,32),(31,1,33),(32,1,34),(33,1,35),(34,1,36),(35,1,37),(36,1,38),(37,1,39),(38,1,40),(39,1,41),(40,1,42),(41,1,43),(42,1,44),(43,1,45),(44,1,46),(45,1,47),(46,1,48),(47,1,49),(48,1,50),(49,1,51),(50,1,52),(51,1,53),(52,1,54),(53,1,55),(54,1,56),(55,1,57),(56,1,58),(57,1,59),(58,1,60),(59,1,61),(60,2,10),(61,2,12),(62,2,13),(63,2,14),(64,2,15),(65,2,16),(66,2,57),(67,2,18),(68,2,19),(69,2,20),(70,2,21),(71,2,22),(72,2,23),(73,2,24),(74,2,25),(75,2,26),(76,2,27);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_info`
--

DROP TABLE IF EXISTS `t_system_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_system_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `system_code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `keywords` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shortcuticon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tel` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `weixin` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `version` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `closeMsg` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isopen` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'y',
  `create_time` datetime DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `edit_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_system_info_ibfk_1` (`create_by`) USING BTREE,
  KEY `t_system_info_ibfk_2` (`edit_by`) USING BTREE,
  CONSTRAINT `t_system_info_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_system_info_ibfk_2` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='系统信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_info`
--

LOCK TABLES `t_system_info` WRITE;
/*!40000 ALTER TABLE `t_system_info` DISABLE KEYS */;
INSERT INTO `t_system_info` VALUES (1,'crm','动力云客系统','http://www.bjpowernode.com','http://localhost:8080/image/logo.png','动力云客系统','动力CRM 企业客户智慧云管理','crm, 客户, 客户关系, 客户关系管理','http://www.bjpowernode.com/favicon.ico','010-84846003','123456789','123456789@qq.com','北京市大兴区大族企业湾10栋3层','系统版本:1.1.0.bate','网站维护中 动力云客系统 http://www.bjpowernode.com','true','2023-11-08 13:28:18',1,NULL,NULL),(2,'call','动力呼叫系统','http://www.bjpowernode.com','http://localhost:8080/image/logo.png','动力呼叫系统','动力CRM 企业客户智慧云管理','crm, 客户, 客户关系, 客户关系管理','http://www.bjpowernode.com/favicon.ico','010-84846003','123456789','123456789@qq.com','北京市大兴区大族企业湾10栋3层','系统版本:1.1.0.bate','网站维护中 动力呼叫系统 http://www.bjpowernode.com','true','2023-11-08 13:28:21',1,NULL,NULL);
/*!40000 ALTER TABLE `t_system_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tran`
--

DROP TABLE IF EXISTS `t_tran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tran` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，交易ID',
  `tran_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '交易流水号',
  `customer_id` int DEFAULT NULL COMMENT '客户ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '交易金额',
  `expected_date` datetime DEFAULT NULL COMMENT '预计成交日期',
  `stage` int DEFAULT NULL COMMENT '交易所处阶段',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '交易描述',
  `next_contact_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_tran_ibfk_1` (`customer_id`) USING BTREE,
  KEY `t_tran_ibfk_2` (`stage`) USING BTREE,
  KEY `t_tran_ibfk_3` (`create_by`) USING BTREE,
  KEY `t_tran_ibfk_4` (`edit_by`) USING BTREE,
  CONSTRAINT `t_tran_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_ibfk_2` FOREIGN KEY (`stage`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='交易表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tran`
--

LOCK TABLES `t_tran` WRITE;
/*!40000 ALTER TABLE `t_tran` DISABLE KEYS */;
INSERT INTO `t_tran` VALUES (5,'202311121932019431',1,120000.00,'2023-11-14 00:00:00',42,'123131','2023-11-29 00:00:00','2023-11-12 19:32:02',1,NULL,NULL),(6,'202311121932019432',1,93000.00,'2023-11-12 00:00:00',12,'123131','2023-11-29 00:00:00','2023-11-12 19:32:02',1,NULL,NULL),(7,'202504021310091678',12,1110.00,'2025-04-04 13:11:46',12,'测试创建交易','2025-04-30 00:00:00','2025-04-02 13:10:10',1,NULL,NULL),(8,'202504021312195366',2,1233330.00,'2025-04-25 00:00:00',35,'测试创建交易2','2025-04-30 00:00:00','2025-04-02 13:12:19',1,NULL,NULL);
/*!40000 ALTER TABLE `t_tran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tran_history`
--

DROP TABLE IF EXISTS `t_tran_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tran_history` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，交易记录ID',
  `tran_id` int DEFAULT NULL COMMENT '交易ID',
  `stage` int DEFAULT NULL COMMENT '交易阶段',
  `money` decimal(10,2) DEFAULT NULL COMMENT '交易金额',
  `expected_date` datetime DEFAULT NULL COMMENT '交易预计成交时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_tran_history_ibfk_1` (`tran_id`) USING BTREE,
  KEY `t_tran_history_ibfk_2` (`stage`) USING BTREE,
  KEY `t_tran_history_ibfk_3` (`create_by`) USING BTREE,
  CONSTRAINT `t_tran_history_ibfk_1` FOREIGN KEY (`tran_id`) REFERENCES `t_tran` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_history_ibfk_2` FOREIGN KEY (`stage`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_history_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='交易历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tran_history`
--

LOCK TABLES `t_tran_history` WRITE;
/*!40000 ALTER TABLE `t_tran_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tran_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tran_remark`
--

DROP TABLE IF EXISTS `t_tran_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tran_remark` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，交易备注ID',
  `tran_id` int DEFAULT NULL COMMENT '交易ID',
  `note_way` int DEFAULT NULL COMMENT '跟踪方式',
  `note_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '跟踪内容',
  `create_time` datetime DEFAULT NULL COMMENT '跟踪时间',
  `create_by` int DEFAULT NULL COMMENT '跟踪人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  `deleted` int DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_tran_remark_ibfk_1` (`tran_id`) USING BTREE,
  KEY `t_tran_remark_ibfk_2` (`note_way`) USING BTREE,
  KEY `t_tran_remark_ibfk_3` (`create_by`) USING BTREE,
  KEY `t_tran_remark_ibfk_4` (`edit_by`) USING BTREE,
  CONSTRAINT `t_tran_remark_ibfk_1` FOREIGN KEY (`tran_id`) REFERENCES `t_tran` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_remark_ibfk_2` FOREIGN KEY (`note_way`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_remark_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_remark_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='交易跟踪记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tran_remark`
--

LOCK TABLES `t_tran_remark` WRITE;
/*!40000 ALTER TABLE `t_tran_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tran_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，用户ID',
  `login_act` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '登录账号',
  `login_pwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '登录密码',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户手机',
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `account_no_expired` int DEFAULT NULL COMMENT '账户是否没有过期，0已过期 1正常',
  `credentials_no_expired` int DEFAULT NULL COMMENT '密码是否没有过期，0已过期 1正常',
  `account_no_locked` int DEFAULT NULL COMMENT '账号是否没有锁定，0已锁定 1正常',
  `account_enabled` int DEFAULT NULL COMMENT '账号是否启用，0禁用 1启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int DEFAULT NULL COMMENT '编辑人',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_act` (`login_act`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','$2a$10$Nlhwhtd0BSCBK95CAifv7eWpCjHloPBMZ3Gaehcc56hRAV3DZALJO','管理员','13700000000','admin@qq.com',1,1,1,1,'2023-02-22 09:37:12',NULL,'2023-05-23 00:21:06',NULL,'2023-12-10 21:18:59'),(2,'yuyan','$2a$10$ZzzAd0nDuUGfGSjJDnZIyOaW7mUZkFzsYgOqiF/b07po/BGxBFjJ.','于嫣','13026367777','yuyan@163.com',1,1,1,1,'2023-02-28 12:11:40',1,'2025-03-22 11:44:20',1,'2023-11-29 20:14:31'),(3,'zhangqi','$2a$10$Q0qTW6QqkabTzFyoilViw..YdrVzZkSKe5RvLmjgPgW/IrcPkBoF.','张琪','1362362323','zhangqi@qq.com',1,1,1,1,'2023-03-02 11:37:34',NULL,'2023-05-23 00:21:02',NULL,NULL),(4,'suwanting','$2a$10$3bambNLTCAKtQn2OXPiHb.f0SzH.MucTiLi6GPT6nQrYpsxsdxaFi','苏婉婷','13056778888','suwanting@qq.com',1,1,1,1,'2023-04-03 15:04:54',NULL,'2025-03-22 11:47:09',1,NULL),(5,'wuxiaoxiao','$2a$10$Lmk5wXYkZzQMFJEcXVZAZegIQhnAm6ONHpz09X/.gbOh5ze5fU6MW','吴潇潇',NULL,'wuxiaoxiao@qq.com',1,1,1,1,'2023-01-27 12:15:26',NULL,NULL,NULL,NULL),(6,'mengyan','$2a$10$6zGT7CfeuJ/6jZPk1pAqcuiMYDnCJstrceThGD5DVVOA5XvOP/sQq','孟岩',NULL,'mengyan@163.com',1,1,1,1,'2023-03-19 10:17:28',NULL,NULL,NULL,NULL),(7,'yuanhuimin','$2a$10$mbsloGtPV7cDwfAVYxuvLemQRWumZKrDxVZxg4fnbfaocnfZFlYuu','袁慧敏',NULL,'yuanhuimin@11.com',1,1,1,1,'2023-04-11 20:18:50',NULL,NULL,NULL,NULL),(8,'qinxuwen','$2a$10$ir8uLlBrPMHRtGiu5Ajkv.UKcRacXWRen7zxelp9iUaco3WhGkJ36','秦旭文','13820000000','qinxuwen@163.com',1,1,1,1,'2023-03-19 21:11:37',NULL,NULL,NULL,NULL),(9,'chengjie','$2a$10$jQR8yyF/ailGP/zW6G4JOOffzWOXhe02Rgw7MZLfxL.IGFdM3cjM2','程杰','13500000000','chengjie@qq.com',1,1,1,1,'2023-04-16 07:16:19',NULL,'2023-04-20 21:42:21',NULL,NULL),(10,'zhouliang','$2a$10$0yOGdkAcG8JLEcoEmmCnfO8Vp6rcqBnn30k6pGor5Z0.eLMyLEd7.','周亮','13800000008','zhouliang@163.com',1,1,1,1,'2023-03-18 13:13:45',NULL,'2023-06-06 00:06:31',NULL,NULL),(11,'zhangwei','$2a$10$BfOgsdSAZ9VYBOzv692BM.oWGPLktcqhhjU3AaWESkGNRcW484N7O','张伟',NULL,'zhangwei@qq.com',1,1,1,1,'2023-03-06 09:18:23',NULL,NULL,NULL,NULL),(12,'dengping','$2a$10$hpN8orfqUFXb.WWbIoZBkOZrr6D8rdSbl/SWXsMQ0zEuqkldlkpW2','邓萍',NULL,'dengping@qq.com',1,1,1,1,'2023-02-19 20:10:58',NULL,NULL,NULL,NULL),(13,'zhangxing','$2a$10$uBVDcCCJQvTfoFCjbjwrf.MhyczNNJfCn76jD61CsAgsUlXjXhxzG','张欣',NULL,'zhangxing@qq.com',1,1,1,1,'2023-03-17 12:12:11',NULL,NULL,NULL,NULL),(14,'zhangmeng','$2a$10$MMHG2cQh4H4YFbdf48SnyO9IZ78F110x3.7IWGNExrgk2rFmhrd/u','张萌',NULL,'zhangmeng@qq.com',1,1,1,1,'2023-01-13 08:16:02',NULL,NULL,NULL,NULL),(15,'shixixiang','$2a$10$zYwq/QfevFPAZxw4b2DkCeQvjVQ52AUU9c4aC0uS0wTJaRr75G74y','石喜祥',NULL,'shixixiang@qq.com',1,1,1,1,'2023-03-10 15:19:49',NULL,NULL,NULL,NULL),(16,'chengjiuming','$2a$10$yNN5TcFkM4OqRsKGNM8CNeqAJhRYKQgXVFqbre5lQPicnIXT7THTu','陈久明',NULL,'chengjiuming@163.com',1,1,1,1,'2023-04-09 23:17:37',NULL,NULL,NULL,NULL),(17,'genghao','$2a$10$rWHo.vUpJCbqWLGMkPj95O5FlhaQLzro.LY7pVQ/UnVVAdvjEAy0K','耿浩',NULL,'genghao@qq.com',1,1,1,1,'2023-03-19 12:10:22',NULL,'2023-04-10 21:42:21',NULL,NULL),(18,'hanmingyang','$2a$10$PRMdG7a8nFIN1A3TD584Xe2BZI7Y0mktDL7Wp5lF88E1D1iPijFc6','韩明洋',NULL,'hanmingyang@163.com',1,1,1,1,'2023-02-12 18:13:01',NULL,'2023-04-13 23:43:25',NULL,NULL),(19,'xuyan','$2a$10$S7MF2dOqFcoOJPqpEH2nu.Muhn2XC0BlBTZ5gAoL3axrQxdJEJNnK','徐燕',NULL,'xuyan@qq.com',1,1,1,1,'2023-03-29 13:16:15',NULL,NULL,NULL,NULL),(20,'chengjuan','$2a$10$m1g5cxikApV05pR7Cx4cy.d4sT3efOl6UvDLvH27WzMjtpymQ5ANi','程娟',NULL,'chengjuan@qq.com',1,1,1,1,'2023-02-19 15:12:22',NULL,NULL,NULL,NULL),(21,'huangxiao','$2a$10$R/RwQd5.3OxYpSZBLIn8DeeYYNF0vgWCrCR4tcyL.c/HtnuIfBRIK','黄潇',NULL,'huangxiao@qq.com',1,1,1,1,'2023-03-26 22:11:37',NULL,NULL,NULL,NULL),(22,'yangyuxin','$2a$10$ucE/By6NLBb4tN5H3CUimOQ2eAtbjXFf2v77SJUPbHXRI9lTF97Ka','杨雨欣','13167836888','yangyuxin@163.com',1,1,1,1,'2023-04-13 18:14:59',NULL,'2025-03-22 11:44:02',1,NULL),(23,'xiaojie','$2a$10$A215.iFSp7/d99X5M6KE.eu5YvA7nJ5vNEJraxmpA8EUYJN6lx9rW','肖捷',NULL,'xiaojie@163.com',1,1,1,1,'2023-02-18 09:19:02',NULL,NULL,NULL,NULL),(32,'111','$2a$10$A215.iFSp7/d99X5M6KE.eu5YvA7nJ5vNEJraxmpA8EUYJN6lx9rW','1111','1111','111',1,1,1,1,'2023-04-25 17:42:36',NULL,NULL,NULL,NULL),(33,'222','$2a$10$bBskT77XGhKDt1Oqg4aWseHOR2Yngv/Pozh76FprgM1JWDr6WWuFe','22','222','222',1,1,1,1,'2023-04-25 17:46:07',NULL,'2023-06-20 22:23:48',NULL,NULL),(35,'hjh','$2a$10$.WXwEnxp8oICfJiYZsvkfemwB6bJJ1aEZCfkrZ4zG6hPWtegveJAa','大总裁','13168888888','1111@qq.com',1,1,1,1,'2025-03-22 10:49:06',1,'2025-03-22 11:43:01',1,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_user_role_ibfk_1` (`user_id`) USING BTREE,
  KEY `t_user_role_ibfk_2` (`role_id`) USING BTREE,
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,3),(5,5,4),(6,6,5);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-05 13:37:10
