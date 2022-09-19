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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_config`
--

LOCK TABLES `base_config` WRITE;
/*!40000 ALTER TABLE `base_config` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_department`
--

LOCK TABLES `base_department` WRITE;
/*!40000 ALTER TABLE `base_department` DISABLE KEYS */;
INSERT INTO `base_department` VALUES (1,0,'公司','2022-09-15 13:58:31','administrator','2022-09-15 19:09:04','administrator'),(2,1,'数字化信息部','2022-09-15 19:06:51','administrator','2022-09-15 19:07:48','administrator'),(3,2,'系统开发组','2022-09-15 19:07:26','administrator','2022-09-15 19:07:26','administrator'),(4,2,'数字化信息运营组','2022-09-15 19:10:05','administrator','2022-09-15 19:10:05','administrator'),(5,2,'数字化信息业务组','2022-09-15 19:11:04','administrator','2022-09-15 19:11:04','administrator');
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
  `module_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_bin NOT NULL,
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
-- Table structure for table `base_i18n_module`
--

DROP TABLE IF EXISTS `base_i18n_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_i18n_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_i18n_module`
--

LOCK TABLES `base_i18n_module` WRITE;
/*!40000 ALTER TABLE `base_i18n_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_i18n_module` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_log`
--

LOCK TABLES `base_log` WRITE;
/*!40000 ALTER TABLE `base_log` DISABLE KEYS */;
INSERT INTO `base_log` VALUES (1,'service.base','ERROR','空指针错误','2022-09-09 11:52:08','zhangjun01');
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
  `group_id` int(11) NOT NULL,
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
-- Table structure for table `base_lov_group`
--

DROP TABLE IF EXISTS `base_lov_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_lov_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_lov_group`
--

LOCK TABLES `base_lov_group` WRITE;
/*!40000 ALTER TABLE `base_lov_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_lov_group` ENABLE KEYS */;
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
  `code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `order` int(11) NOT NULL,
  `visible` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_menu`
--

LOCK TABLES `base_menu` WRITE;
/*!40000 ALTER TABLE `base_menu` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_role`
--

LOCK TABLES `base_role` WRITE;
/*!40000 ALTER TABLE `base_role` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_station`
--

LOCK TABLES `base_station` WRITE;
/*!40000 ALTER TABLE `base_station` DISABLE KEYS */;
INSERT INTO `base_station` VALUES (1,'CEO','2022-09-16 14:07:34','administrator','2022-09-16 14:07:34','administrator'),(2,'高级总监','2022-09-16 14:22:07','administrator','2022-09-16 14:22:07','administrator'),(3,'总监','2022-09-16 14:22:11','administrator','2022-09-16 14:27:34','administrator'),(4,'高级经理','2022-09-16 15:15:59','administrator','2022-09-16 15:15:59','administrator'),(5,'经理','2022-09-16 15:16:06','administrator','2022-09-16 15:16:06','administrator'),(6,'普通员工','2022-09-16 15:16:12','administrator','2022-09-19 19:27:04','administrator');
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
  `gender` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'M F',
  `birthday` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(32) COLLATE utf8mb4_bin NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user`
--

LOCK TABLES `base_user` WRITE;
/*!40000 ALTER TABLE `base_user` DISABLE KEYS */;
INSERT INTO `base_user` VALUES (2,'administrator','726d9408f446069b821235264f42ad5a','','系统管理员','','','','','[]',0,1,'','2022-09-09 13:04:03','SYSTEM','2022-09-09 13:04:03','SYSTEM');
/*!40000 ALTER TABLE `base_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_user_org`
--

DROP TABLE IF EXISTS `base_user_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_user_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `is_main` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user_org`
--

LOCK TABLES `base_user_org` WRITE;
/*!40000 ALTER TABLE `base_user_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_user_org` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-19 19:41:10
