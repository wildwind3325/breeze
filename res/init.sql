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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_i18n`
--

LOCK TABLES `base_i18n` WRITE;
/*!40000 ALTER TABLE `base_i18n` DISABLE KEYS */;
INSERT INTO `base_i18n` VALUES (1,'system.msg.exception','Exception occurred during processing request','处理请求时发生异常','2022-10-21 09:42:07','zhangjun01','2022-10-21 09:43:17','zhangjun01'),(2,'system.msg.notFound','404 Not Found','404 页面不存在','2022-10-21 09:45:06','zhangjun01','2022-10-21 11:20:11','zhangjun01'),(3,'system.msg.wrongRequest','Wrong request','错误的请求','2022-10-21 09:49:27','zhangjun01','2022-10-21 09:49:27','zhangjun01'),(4,'system.msg.unauthorized','You are not logged in','尚未登录或登录已超时','2022-10-21 09:55:59','zhangjun01','2022-10-21 10:05:52','zhangjun01'),(5,'system.msg.permissionDenied','Permission denied','你没有权限进行此操作','2022-10-21 10:07:35','zhangjun01','2022-10-21 10:07:35','zhangjun01'),(6,'system.msg.nonexistent','Module or action doesn\'t exist','不存在的模块或方法','2022-10-21 10:10:09','zhangjun01','2022-10-21 10:10:09','zhangjun01'),(7,'system.msg.wrongParam','The parameters don\'t meet the requirements','输入的参数不符合要求','2022-10-21 10:10:52','zhangjun01','2022-10-21 10:11:02','zhangjun01'),(8,'system.login.userNotFound','This account doesn\'t exist or has been disabled','该用户不存在或已被停用','2022-10-21 10:23:47','zhangjun01','2022-10-21 10:23:47','zhangjun01'),(9,'system.login.wrongPassword','Wrong password','密码错误','2022-10-21 10:24:10','zhangjun01','2022-10-21 10:24:10','zhangjun01'),(10,'system.login.feishuFailed','Login by feishu failed','飞书认证失败','2022-10-21 10:25:25','zhangjun01','2022-10-21 10:25:25','zhangjun01'),(11,'system.data.notFound','Lov not found','找不到该选择项','2022-10-21 10:26:57','zhangjun01','2022-10-21 10:26:57','zhangjun01'),(12,'system.msg.notEmpty','Target is not empty, can\'t be removed.','该对象不为空，无法直接删除。','2022-10-21 10:27:55','zhangjun01','2022-10-21 10:27:55','zhangjun01'),(13,'system.msg.immortal','Can\'t be removed','不可删除','2022-10-21 10:30:12','zhangjun01','2022-10-21 10:30:12','zhangjun01'),(14,'system.user.selfDelete','Can\'t remove yourself','你不能删除自己','2022-10-21 10:31:22','zhangjun01','2022-10-21 10:31:22','zhangjun01'),(15,'system.user.notAdmin','You can\'t modify these accounts','你无权处理管理员账号','2022-10-21 10:33:08','zhangjun01','2022-10-21 10:33:08','zhangjun01'),(16,'system.view.loadFailed','Failed to load data: {0}','加载数据失败：{0}','2022-10-21 11:33:02','zhangjun01','2022-10-21 11:33:02','zhangjun01'),(17,'system.view.homepage','Home','首页','2022-10-21 11:40:55','zhangjun01','2022-10-21 11:40:55','zhangjun01'),(18,'system.view.logout','Logout','注销','2022-10-21 12:57:01','zhangjun01','2022-10-21 12:57:01','zhangjun01'),(19,'system.login.title','User Login','用户登录','2022-10-21 13:30:27','zhangjun01','2022-10-21 13:30:27','zhangjun01'),(20,'system.login.login','Login','登录','2022-10-21 13:31:05','zhangjun01','2022-10-21 13:31:05','zhangjun01'),(21,'system.login.accountHint','Please enter account','请输入账号','2022-10-21 13:42:10','zhangjun01','2022-10-21 13:42:10','zhangjun01'),(22,'system.login.passwordHint','Please enter password','请输入密码','2022-10-21 13:42:28','zhangjun01','2022-10-21 13:42:28','zhangjun01'),(23,'system.login.loginFailed','Login failed: {0}','登录失败：{0}','2022-10-21 13:43:34','zhangjun01','2022-10-21 13:43:34','zhangjun01'),(24,'system.view.incomplete','Please fill out the form','请先输入完整的信息','2022-10-21 13:46:03','zhangjun01','2022-10-27 10:48:33','zhangjun01'),(25,'system.msg.actionSucceeded','Succeeded','操作成功','2022-10-21 15:21:39','zhangjun01','2022-10-21 15:21:39','zhangjun01'),(26,'system.msg.actionFailed','Failed: {0}','操作失败：{0}','2022-10-21 15:22:03','zhangjun01','2022-10-21 15:22:03','zhangjun01'),(27,'system.configuration.group','Group','分组','2022-10-21 15:28:41','zhangjun01','2022-10-21 15:28:41','zhangjun01'),(28,'system.view.new','New','新建','2022-10-21 15:29:37','zhangjun01','2022-10-21 15:29:37','zhangjun01'),(29,'system.view.edit','Edit','编辑','2022-10-21 15:33:54','zhangjun01','2022-10-21 15:33:54','zhangjun01'),(30,'system.view.remove','Remove','删除','2022-10-21 15:34:33','zhangjun01','2022-10-21 15:34:33','zhangjun01'),(31,'system.view.search','Search','搜索','2022-10-21 15:35:19','zhangjun01','2022-10-21 15:35:19','zhangjun01'),(32,'system.view.keywordHint','Please enter keyword','请输入关键字','2022-10-21 15:35:54','zhangjun01','2022-10-21 15:35:54','zhangjun01'),(33,'system.view.name','Name','名称','2022-10-21 15:37:21','zhangjun01','2022-10-21 15:37:21','zhangjun01'),(34,'system.view.code','Code','代码','2022-10-21 15:37:30','zhangjun01','2022-10-21 15:37:30','zhangjun01'),(35,'system.view.value','Value','值','2022-10-21 15:37:50','zhangjun01','2022-10-21 15:37:50','zhangjun01'),(36,'system.view.createdAt','Created at','创建时间','2022-10-21 15:38:28','zhangjun01','2022-10-21 15:38:28','zhangjun01'),(37,'system.view.command','Command','操作','2022-10-21 15:38:49','zhangjun01','2022-10-21 15:38:49','zhangjun01'),(38,'system.view.submit','Submit','提交','2022-10-21 15:39:16','zhangjun01','2022-10-27 16:35:45','zhangjun01'),(39,'system.view.cancel','Cancel','取消','2022-10-21 15:39:26','zhangjun01','2022-10-21 15:39:26','zhangjun01'),(40,'system.configuration.title','Configuration','配置管理','2022-10-21 15:42:36','zhangjun01','2022-10-21 15:42:36','zhangjun01'),(41,'system.view.memo','Memo','备注','2022-10-21 15:43:38','zhangjun01','2022-10-21 15:43:38','zhangjun01'),(42,'system.view.all','All','全部','2022-10-21 15:44:45','zhangjun01','2022-10-21 15:44:45','zhangjun01'),(44,'system.view.confirmRemove','Are you sure to remove object?','是否确认删除？','2022-10-21 15:48:41','zhangjun01','2022-10-21 15:48:41','zhangjun01'),(45,'system.view.nameHint','Please enter name','请输入名称','2022-10-21 16:33:27','zhangjun01','2022-10-21 16:33:27','zhangjun01'),(46,'system.configuration.needGroup','Please select a group','请选择一个分组','2022-10-21 16:34:19','zhangjun01','2022-10-21 16:34:19','zhangjun01'),(47,'system.dictionary.title','Dictionary','字典管理','2022-10-27 10:43:41','zhangjun01','2022-10-27 10:43:51','zhangjun01'),(48,'system.view.export','Export','导出','2022-10-27 14:38:09','zhangjun01','2022-10-27 14:38:09','zhangjun01'),(49,'system.i18n.english','English','英文','2022-10-27 14:39:51','zhangjun01','2022-10-27 14:39:51','zhangjun01'),(50,'system.i18n.chinese','Chinese','中文','2022-10-27 14:40:05','zhangjun01','2022-10-27 14:40:05','zhangjun01'),(51,'system.i18n.title','I18n','国际化管理','2022-10-27 14:41:09','zhangjun01','2022-10-27 16:52:03','zhangjun01'),(52,'system.view.save','Save','保存','2022-10-27 16:35:53','zhangjun01','2022-10-27 16:35:53','zhangjun01'),(53,'system.log.module','Module','模块','2022-10-27 16:52:24','zhangjun01','2022-10-27 16:52:24','zhangjun01'),(54,'system.log.level','Level','级别','2022-10-27 16:52:52','zhangjun01','2022-10-27 16:53:32','zhangjun01'),(55,'system.log.debug','Debug','调试','2022-10-27 16:54:32','zhangjun01','2022-10-27 16:54:32','zhangjun01'),(56,'system.log.info','Info','信息','2022-10-27 16:54:43','zhangjun01','2022-10-27 16:54:43','zhangjun01'),(57,'system.log.warn','Warn','警告','2022-10-27 16:54:57','zhangjun01','2022-10-27 16:54:57','zhangjun01'),(58,'system.log.error','Error','错误','2022-10-27 16:55:06','zhangjun01','2022-10-27 16:55:06','zhangjun01'),(59,'system.view.content','Content','内容','2022-10-27 16:57:34','zhangjun01','2022-10-27 16:57:34','zhangjun01'),(60,'system.view.type','Type','类型','2022-10-27 17:21:06','zhangjun01','2022-10-27 17:21:06','zhangjun01'),(61,'system.menu.menu','Menu','菜单','2022-10-27 17:24:40','zhangjun01','2022-10-27 17:24:40','zhangjun01'),(62,'system.menu.permission','Permission','权限','2022-10-27 17:24:59','zhangjun01','2022-10-27 17:24:59','zhangjun01'),(63,'system.menu.icon','Icon','图标','2022-10-27 17:26:38','zhangjun01','2022-10-27 17:26:38','zhangjun01'),(64,'system.menu.title','Menu','菜单管理','2022-10-27 17:27:34','zhangjun01','2022-10-27 17:27:34','zhangjun01'),(65,'system.menu.parent','Parent','上级菜单','2022-10-27 17:28:15','zhangjun01','2022-10-27 18:41:24','zhangjun01'),(66,'system.menu.allIcons','All Icons','所有图标','2022-10-27 17:28:58','zhangjun01','2022-10-27 17:28:58','zhangjun01'),(67,'system.menu.route','Route','路由','2022-10-27 17:30:08','zhangjun01','2022-10-27 17:30:08','zhangjun01'),(68,'system.menu.menuNoRoute','Menu\'s route can\'t be empty','菜单必须提供路由地址','2022-10-27 17:32:53','zhangjun01','2022-10-27 17:32:53','zhangjun01'),(69,'system.menu.permissionNoCode','Permission\'s code can\'t be empty','功能必须提供代码','2022-10-27 17:33:31','zhangjun01','2022-10-27 17:33:31','zhangjun01'),(70,'system.menu.parentBeSelf','Parent can\'t be set to itself','上级不可以设置为自身','2022-10-27 17:34:06','zhangjun01','2022-10-27 17:34:06','zhangjun01'),(71,'system.orgnization.title','Orgnization','组织管理','2022-10-27 17:36:31','zhangjun01','2022-10-27 17:36:31','zhangjun01'),(72,'system.orgnization.parent','Parent','上级部门','2022-10-27 17:37:03','zhangjun01','2022-10-27 17:37:03','zhangjun01'),(73,'system.role.title','Role','角色管理','2022-10-27 18:16:02','zhangjun01','2022-10-27 18:16:02','zhangjun01'),(74,'system.user.organization','Organization','组织','2022-10-27 18:24:20','zhangjun01','2022-10-27 18:24:20','zhangjun01'),(75,'system.user.station','Station','职位','2022-10-27 18:24:46','zhangjun01','2022-10-27 18:24:46','zhangjun01'),(76,'system.view.status','Status','状态','2022-10-27 18:25:14','zhangjun01','2022-10-27 18:25:14','zhangjun01'),(77,'system.view.statusNormal','Normal','正常','2022-10-27 18:26:32','zhangjun01','2022-10-27 18:26:32','zhangjun01'),(78,'system.view.statusDisabled','Disabled','停用','2022-10-27 18:27:03','zhangjun01','2022-10-27 18:27:03','zhangjun01'),(79,'system.user.name','Name','姓名','2022-10-27 18:27:57','zhangjun01','2022-10-27 18:27:57','zhangjun01'),(80,'system.user.title','User','用户管理','2022-10-27 18:29:26','zhangjun01','2022-10-27 18:29:26','zhangjun01'),(81,'system.user.account','Account','账号','2022-10-27 18:30:03','zhangjun01','2022-10-27 18:30:03','zhangjun01'),(82,'system.user.password','Password','密码','2022-10-27 18:30:25','zhangjun01','2022-10-27 18:30:25','zhangjun01'),(83,'system.user.empCode','Employee Code','工号','2022-10-27 18:30:48','zhangjun01','2022-10-27 18:30:48','zhangjun01'),(84,'system.user.email','Email','邮箱','2022-10-27 18:31:14','zhangjun01','2022-10-27 18:31:14','zhangjun01'),(85,'system.user.phone','Phone Number','手机','2022-10-27 18:31:35','zhangjun01','2022-10-27 18:31:35','zhangjun01'),(86,'system.user.role','Role','角色','2022-10-27 18:32:12','zhangjun01','2022-10-27 18:32:12','zhangjun01'),(87,'system.user.admin','Admin','管理员','2022-10-27 18:32:47','zhangjun01','2022-10-27 18:32:47','zhangjun01');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_menu`
--

LOCK TABLES `base_menu` WRITE;
/*!40000 ALTER TABLE `base_menu` DISABLE KEYS */;
INSERT INTO `base_menu` VALUES (1,0,'系统管理',0,'/system','Setting','','2022-10-09 11:23:45','admin','2022-10-09 11:23:45','admin'),(2,1,'组织管理',0,'/system/orgnization','HelpFilled','','2022-10-09 11:24:26','admin','2022-10-09 11:24:53','admin'),(3,1,'岗位管理',0,'/system/station','Place','','2022-10-09 11:25:45','admin','2022-10-09 11:25:45','admin'),(4,1,'菜单管理',0,'/system/menu','Menu','','2022-10-09 11:26:07','admin','2022-10-09 11:26:07','admin'),(5,1,'角色管理',0,'/system/role','MagicStick','','2022-10-09 11:27:17','admin','2022-10-09 11:27:17','admin'),(6,1,'用户管理',0,'/system/user','User','','2022-10-09 11:27:38','admin','2022-10-09 11:27:38','admin'),(7,1,'字典管理',0,'/system/dictionary','Notebook','','2022-10-09 11:27:54','admin','2022-10-09 11:27:54','admin'),(8,1,'配置管理',0,'/system/configuration','Tools','','2022-10-09 11:28:09','admin','2022-10-09 11:28:09','admin'),(9,1,'国际化',0,'/system/i18n','InfoFilled','','2022-10-09 11:28:33','admin','2022-10-09 11:28:33','admin'),(10,1,'日志查询',0,'/system/log','Search','','2022-10-09 11:29:04','admin','2022-10-09 11:29:19','admin'),(11,2,'新建',1,'','','system.orgnization.add','2022-10-09 16:12:30','zhangjun01','2022-10-09 16:12:30','zhangjun01'),(12,2,'编辑',1,'','','system.orgnization.edit','2022-10-09 16:12:58','zhangjun01','2022-10-09 16:13:26','zhangjun01'),(13,2,'删除',1,'','','system.orgnization.remove','2022-10-09 16:13:06','zhangjun01','2022-10-09 16:13:33','zhangjun01');
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
INSERT INTO `base_role` VALUES (5,'管理员','[1,2,11,12,13,3,4,5,6,7,8,9,10]','2022-10-09 11:29:46','admin','2022-10-09 16:14:17','zhangjun01'),(6,'普通用户','[1,2,11,12]','2022-10-09 11:29:52','admin','2022-10-09 16:16:20','aaa');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user`
--

LOCK TABLES `base_user` WRITE;
/*!40000 ALTER TABLE `base_user` DISABLE KEYS */;
INSERT INTO `base_user` VALUES (5,'zhangjun01','322867d50fd273441760a8f601b6b9b0','958','张俊','zhangjun01@hesaitech.com','13761019032',3,4,'[5]',0,1,'','2022-09-29 17:39:18','admin','2022-10-09 16:14:54','zhangjun01'),(6,'aaa','068896804551b982511aff19931628b9','','AAA','','',3,6,'[6]',0,0,'','2022-10-09 16:14:46','zhangjun01','2022-10-09 16:14:46','zhangjun01');
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

-- Dump completed on 2022-10-27 18:44:39
