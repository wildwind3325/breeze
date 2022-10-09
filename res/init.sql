-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: breeze
-- ------------------------------------------------------
-- Server version	5.7.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `base_config`
--

DROP TABLE IF EXISTS `base_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `memo` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_config`
--

LOCK TABLES `base_config` WRITE;
/*!40000 ALTER TABLE `base_config` DISABLE KEYS */;
INSERT INTO `base_config` VALUES (1,1,'login.feishu.enable','集成飞书登录','0','','2022-10-09 15:17:25','admin','2022-10-09 16:07:35','zhangjun01'),(2,1,'login.feishu.app_id','飞书ID','cli_a21a2c3a9778d00c','','2022-10-09 15:18:40','admin','2022-10-09 15:19:14','admin'),(3,1,'login.feishu.app_secret','飞书密钥','43PyFN9Uj3rpYLbu0r6K4eyb7eKc6ywm','','2022-10-09 15:19:01','admin','2022-10-09 15:19:21','admin');
/*!40000 ALTER TABLE `base_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_config_group`
--

DROP TABLE IF EXISTS `base_config_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_config_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_config_group`
--

LOCK TABLES `base_config_group` WRITE;
/*!40000 ALTER TABLE `base_config_group` DISABLE KEYS */;
INSERT INTO `base_config_group` VALUES (1,'系统','2022-09-19 18:41:56','administrator','2022-09-19 18:42:27','administrator'),(2,'用户','2022-09-19 18:52:07','administrator','2022-09-19 18:52:07','administrator');
/*!40000 ALTER TABLE `base_config_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_department`
--

DROP TABLE IF EXISTS `base_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_department`
--

LOCK TABLES `base_department` WRITE;
/*!40000 ALTER TABLE `base_department` DISABLE KEYS */;
INSERT INTO `base_department` VALUES (1,0,'公司','2022-09-15 13:58:31','administrator','2022-09-15 19:09:04','administrator'),(2,1,'数字化信息部','2022-09-15 19:06:51','administrator','2022-09-15 19:07:48','administrator'),(3,2,'系统开发组','2022-09-15 19:07:26','administrator','2022-09-23 14:44:24','administrator'),(4,2,'数字化信息运营组','2022-09-15 19:10:05','administrator','2022-09-15 19:10:05','administrator'),(5,2,'数字化信息业务组','2022-09-15 19:11:04','administrator','2022-09-15 19:11:04','administrator');
/*!40000 ALTER TABLE `base_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_i18n`
--

DROP TABLE IF EXISTS `base_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `text_en` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `text_zh` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_i18n`
--

LOCK TABLES `base_i18n` WRITE;
/*!40000 ALTER TABLE `base_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_log`
--

DROP TABLE IF EXISTS `base_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `category` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `content` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_log`
--

LOCK TABLES `base_log` WRITE;
/*!40000 ALTER TABLE `base_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_lov`
--

DROP TABLE IF EXISTS `base_lov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_lov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `value` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `memo` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_lov`
--

LOCK TABLES `base_lov` WRITE;
/*!40000 ALTER TABLE `base_lov` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_lov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_menu`
--

DROP TABLE IF EXISTS `base_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `type` int(11) NOT NULL COMMENT '0 菜单 1 权限',
  `route` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_menu`
--

LOCK TABLES `base_menu` WRITE;
/*!40000 ALTER TABLE `base_menu` DISABLE KEYS */;
INSERT INTO `base_menu` VALUES (1,0,'系统管理',0,'/system','Setting','','2022-10-09 11:23:45','admin','2022-10-09 11:23:45','admin'),(2,1,'组织管理',0,'/system/orgnization','HelpFilled','','2022-10-09 11:24:26','admin','2022-10-09 11:24:53','admin'),(3,1,'岗位管理',0,'/system/station','Place','','2022-10-09 11:25:45','admin','2022-10-09 11:25:45','admin'),(4,1,'菜单管理',0,'/system/menu','Menu','','2022-10-09 11:26:07','admin','2022-10-09 11:26:07','admin'),(5,1,'角色管理',0,'/system/role','MagicStick','','2022-10-09 11:27:17','admin','2022-10-09 11:27:17','admin'),(6,1,'用户管理',0,'/system/user','User','','2022-10-09 11:27:38','admin','2022-10-09 11:27:38','admin'),(7,1,'字典管理',0,'/system/dictionary','Notebook','','2022-10-09 11:27:54','admin','2022-10-09 11:27:54','admin'),(8,1,'配置管理',0,'/system/configuration','Tools','','2022-10-09 11:28:09','admin','2022-10-09 11:28:09','admin'),(9,1,'国际化',0,'/system/i18n','InfoFilled','','2022-10-09 11:28:33','admin','2022-10-09 11:28:33','admin'),(10,1,'日志查询',0,'/system/log','Search','','2022-10-09 11:29:04','admin','2022-10-09 11:29:19','admin');
/*!40000 ALTER TABLE `base_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_role`
--

DROP TABLE IF EXISTS `base_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `menus` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_role`
--

LOCK TABLES `base_role` WRITE;
/*!40000 ALTER TABLE `base_role` DISABLE KEYS */;
INSERT INTO `base_role` VALUES (5,'管理员','[1,2,3,4,5,6,7,8,9,10]','2022-10-09 11:29:46','admin','2022-10-09 11:29:46','admin'),(6,'普通用户','[]','2022-10-09 11:29:52','admin','2022-10-09 11:29:52','admin');
/*!40000 ALTER TABLE `base_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_station`
--

DROP TABLE IF EXISTS `base_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_station`
--

LOCK TABLES `base_station` WRITE;
/*!40000 ALTER TABLE `base_station` DISABLE KEYS */;
INSERT INTO `base_station` VALUES (1,'CXO','2022-09-16 14:07:34','administrator','2022-09-29 15:51:59','admin'),(2,'高级总监','2022-09-16 14:22:07','administrator','2022-09-16 14:22:07','administrator'),(3,'总监','2022-09-16 14:22:11','administrator','2022-09-16 14:27:34','administrator'),(4,'高级经理','2022-09-16 15:15:59','administrator','2022-09-16 15:15:59','administrator'),(5,'经理','2022-09-16 15:16:06','administrator','2022-09-16 15:16:06','administrator'),(6,'普通员工','2022-09-16 15:16:12','administrator','2022-09-19 19:27:04','administrator'),(7,'一线员工','2022-09-29 15:52:13','admin','2022-09-29 15:52:13','admin');
/*!40000 ALTER TABLE `base_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_user`
--

DROP TABLE IF EXISTS `base_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `department_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `roles` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 正常 1 停用',
  `is_admin` int(11) NOT NULL,
  `memo` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user`
--

LOCK TABLES `base_user` WRITE;
/*!40000 ALTER TABLE `base_user` DISABLE KEYS */;
INSERT INTO `base_user` VALUES (5,'zhangjun01','322867d50fd273441760a8f601b6b9b0','958','张俊','zhangjun01@hesaitech.com','13761019032',0,0,'[5]',0,1,'','2022-09-29 17:39:18','admin','2022-10-09 15:57:25','admin');
/*!40000 ALTER TABLE `base_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_base_user`
--

DROP TABLE IF EXISTS `view_base_user`;
/*!50001 DROP VIEW IF EXISTS `view_base_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_base_user` AS SELECT 
 1 AS `id`,
 1 AS `account`,
 1 AS `code`,
 1 AS `name`,
 1 AS `email`,
 1 AS `mobile`,
 1 AS `department_id`,
 1 AS `department_name`,
 1 AS `station_id`,
 1 AS `station_name`,
 1 AS `roles`,
 1 AS `status`,
 1 AS `is_admin`,
 1 AS `memo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_base_user`
--

/*!50001 DROP VIEW IF EXISTS `view_base_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `view_base_user` AS select `base_user`.`id` AS `id`,`base_user`.`account` AS `account`,`base_user`.`code` AS `code`,`base_user`.`name` AS `name`,`base_user`.`email` AS `email`,`base_user`.`mobile` AS `mobile`,`base_user`.`department_id` AS `department_id`,`base_department`.`label` AS `department_name`,`base_user`.`station_id` AS `station_id`,`base_station`.`label` AS `station_name`,`base_user`.`roles` AS `roles`,`base_user`.`status` AS `status`,`base_user`.`is_admin` AS `is_admin`,`base_user`.`memo` AS `memo` from ((`base_user` left join `base_department` on((`base_user`.`department_id` = `base_department`.`id`))) left join `base_station` on((`base_user`.`station_id` = `base_station`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-09 16:08:49
