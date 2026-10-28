-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: mysql-dgtl-moi-qnsa-dev-qac-001.mysql.database.azure.com    Database: neuminiappoperationplatform
-- ------------------------------------------------------
-- Server version	8.0.46-azure

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
-- Current Database: `neuminiappoperationplatform`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `neuminiappoperationplatform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `neuminiappoperationplatform`;

--
-- Table structure for table `neu_sys_config`
--

DROP TABLE IF EXISTS `neu_sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT 'parameter primary key',
  `config_name` varchar(100) DEFAULT '' COMMENT 'parameter name',
  `config_key` varchar(100) DEFAULT '' COMMENT 'parameter key name',
  `config_value` varchar(500) DEFAULT '' COMMENT 'parameter key value',
  `config_type` char(1) DEFAULT 'N' COMMENT 'system built-in (Y is N is not)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='parameter configuration table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_config`
--

LOCK TABLES `neu_sys_config` WRITE;
/*!40000 ALTER TABLE `neu_sys_config` DISABLE KEYS */;
INSERT INTO `neu_sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-11-03 15:20:22','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-11-03 15:20:22','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-11-03 15:20:22','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2022-11-03 15:20:22','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-11-03 15:20:22','',NULL,'是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `neu_sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_dept`
--

DROP TABLE IF EXISTS `neu_sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'dept id',
  `parent_id` bigint DEFAULT '0' COMMENT 'parent department id',
  `ancestors` varchar(50) DEFAULT '' COMMENT 'list of ancestors',
  `dept_name` varchar(30) DEFAULT '' COMMENT 'Department Name',
  `order_num` int DEFAULT '0' COMMENT 'Display order',
  `leader` varchar(20) DEFAULT NULL COMMENT 'leader',
  `phone` varchar(11) DEFAULT NULL COMMENT 'Contact Phone',
  `email` varchar(50) DEFAULT NULL COMMENT 'email',
  `status` char(1) DEFAULT '0' COMMENT 'Department status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence, 2 means delete)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='department table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_dept`
--

LOCK TABLES `neu_sys_dept` WRITE;
/*!40000 ALTER TABLE `neu_sys_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_dict_data`
--

DROP TABLE IF EXISTS `neu_sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT 'dictionary code',
  `dict_sort` int DEFAULT '0' COMMENT 'dictionary sort',
  `dict_label` varchar(100) DEFAULT '' COMMENT 'dictionary label',
  `dict_value` varchar(100) DEFAULT '' COMMENT 'dictionary key value',
  `dict_type` varchar(100) DEFAULT '' COMMENT 'dictionary type',
  `css_class` varchar(100) DEFAULT NULL COMMENT 'Style attributes (other style extensions)',
  `list_class` varchar(100) DEFAULT NULL COMMENT 'table echo style',
  `is_default` char(1) DEFAULT 'N' COMMENT 'Whether it is default (Y is N or not)',
  `status` char(1) DEFAULT '0' COMMENT 'status (0 normal 1 disabled)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='dictionary data table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_dict_data`
--

LOCK TABLES `neu_sys_dict_data` WRITE;
/*!40000 ALTER TABLE `neu_sys_dict_data` DISABLE KEYS */;
INSERT INTO `neu_sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-11-03 15:20:22','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-11-03 15:20:22','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-11-03 15:20:22','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-11-03 15:20:22','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-11-03 15:20:22','',NULL,'隐藏菜单'),(6,1,'3007','0','sys_normal_disable','','primary','Y','0','admin','2022-11-03 15:20:22','admin','2022-12-06 18:04:59','正常状态'),(7,2,'3008','1','sys_normal_disable','','danger','N','0','admin','2022-11-03 15:20:22','admin','2022-12-06 18:05:11','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-11-03 15:20:22','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-11-03 15:20:22','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-11-03 15:20:22','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-11-03 15:20:22','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-11-03 15:20:22','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-11-03 15:20:22','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-11-03 15:20:22','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-11-03 15:20:22','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-11-03 15:20:22','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-11-03 15:20:22','',NULL,'关闭状态'),(18,99,'3019','0','sys_oper_type','','info','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:47','其他操作'),(19,1,'3010','1','sys_oper_type','','info','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:45:55','新增操作'),(20,2,'3011','2','sys_oper_type','','info','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:04','修改操作'),(21,3,'3012','3','sys_oper_type','','danger','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:08','删除操作'),(22,4,'3013','4','sys_oper_type','','primary','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:14','授权操作'),(23,5,'3014','5','sys_oper_type','','warning','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:20','导出操作'),(24,6,'3015','6','sys_oper_type','','warning','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:25','导入操作'),(25,7,'3016','7','sys_oper_type','','danger','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:30','强退操作'),(26,8,'3017','8','sys_oper_type','','warning','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:36','生成操作'),(27,9,'3018','9','sys_oper_type','','danger','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:46:42','清空操作'),(28,1,'3021','0','sys_common_status','','primary','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:47:10','正常状态'),(29,2,'3022','1','sys_common_status','','danger','N','0','admin','2022-11-03 15:20:22','admin','2023-01-07 12:47:15','停用状态'),(100,1,'3002','1','push_navigate_rule',NULL,'success','N','0','admin','2022-11-12 11:32:39','',NULL,'Mini App'),(101,2,'3003','2','push_navigate_rule',NULL,'warning','N','0','admin','2022-11-12 11:33:05','',NULL,'Url'),(102,0,'3005','1','push_user_rule',NULL,'default','N','0','admin','2022-11-12 11:55:03','',NULL,'所有用户'),(103,2,'3006','2','push_user_rule',NULL,'default','N','0','admin','2022-11-12 11:55:25','',NULL,'指定用户'),(104,1,'3024','1','push_sender_rule',NULL,'default','N','0','admin','2023-09-18 15:16:45','admin','2023-09-18 15:22:01','Sent by me'),(105,0,'3025','2','push_sender_rule',NULL,'default','N','0','admin','2023-09-18 15:17:20','admin','2023-09-18 15:17:37','For all senders');
/*!40000 ALTER TABLE `neu_sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_dict_type`
--

DROP TABLE IF EXISTS `neu_sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'dictionary primary key',
  `dict_name` varchar(100) DEFAULT '' COMMENT 'dictionary name',
  `dict_type` varchar(100) DEFAULT '' COMMENT 'dictionary type',
  `status` char(1) DEFAULT '0' COMMENT 'status (0 normal 1 disabled)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='dictionary type table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_dict_type`
--

LOCK TABLES `neu_sys_dict_type` WRITE;
/*!40000 ALTER TABLE `neu_sys_dict_type` DISABLE KEYS */;
INSERT INTO `neu_sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2022-11-03 15:20:22','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2022-11-03 15:20:22','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2022-11-03 15:20:22','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2022-11-03 15:20:22','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2022-11-03 15:20:22','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2022-11-03 15:20:22','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2022-11-03 15:20:22','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2022-11-03 15:20:22','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2022-11-03 15:20:22','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2022-11-03 15:20:22','',NULL,'登录状态列表'),(100,'3001','push_navigate_rule','0','admin','2022-11-12 11:31:24','admin','2022-11-14 14:51:39','推送类型'),(101,'3004','push_user_rule','0','admin','2022-11-12 11:54:35','admin','2022-11-14 14:50:29','用户规则'),(103,'3023','push_sender_rule','0','admin','2023-09-18 15:16:02','',NULL,'发送人规则');
/*!40000 ALTER TABLE `neu_sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_job`
--

DROP TABLE IF EXISTS `neu_sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Job ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'job name',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT 'job group name',
  `invoke_target` varchar(500) NOT NULL COMMENT 'invoke target string',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron execution expression',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT 'Plan execution error policy (1 execute immediately 2 execute once 3 give up execution)',
  `concurrent` char(1) DEFAULT '1' COMMENT 'Whether to execute concurrently (0 allows 1 prohibits)',
  `status` char(1) DEFAULT '0' COMMENT 'status (0 normal 1 pause)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remarks',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Timed task schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_job`
--

LOCK TABLES `neu_sys_job` WRITE;
/*!40000 ALTER TABLE `neu_sys_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_job_log`
--

DROP TABLE IF EXISTS `neu_sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'job log ID',
  `job_name` varchar(64) NOT NULL COMMENT 'job name',
  `job_group` varchar(64) NOT NULL COMMENT 'job group name',
  `invoke_target` varchar(500) NOT NULL COMMENT 'invoke target string',
  `job_message` varchar(500) DEFAULT NULL COMMENT 'log message',
  `status` char(1) DEFAULT '0' COMMENT 'execution status (0 normal 1 failed)',
  `exception_info` varchar(2000) DEFAULT '' COMMENT 'Exception Information',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Timed task scheduling log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_job_log`
--

LOCK TABLES `neu_sys_job_log` WRITE;
/*!40000 ALTER TABLE `neu_sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_logininfor`
--

DROP TABLE IF EXISTS `neu_sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Access ID',
  `user_name` varchar(50) DEFAULT '' COMMENT 'user account',
  `ipaddr` varchar(128) DEFAULT '' COMMENT 'login IP address',
  `login_location` varchar(255) DEFAULT '' COMMENT 'login location',
  `browser` varchar(50) DEFAULT '' COMMENT 'Browser Type',
  `os` varchar(50) DEFAULT '' COMMENT 'operating system',
  `status` char(1) DEFAULT '0' COMMENT 'login status (0 success 1 failure)',
  `msg` varchar(255) DEFAULT '' COMMENT 'Prompt message',
  `login_time` datetime DEFAULT NULL COMMENT 'Access Time',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='System Access Record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_logininfor`
--

LOCK TABLES `neu_sys_logininfor` WRITE;
/*!40000 ALTER TABLE `neu_sys_logininfor` DISABLE KEYS */;
INSERT INTO `neu_sys_logininfor` VALUES (504,'SuperAdmin','10.240.0.249','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-09-11 09:39:24'),(505,'SuperAdmin','10.240.0.192','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-09-12 06:26:38'),(506,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-10-09 08:44:33'),(507,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha error','2026-10-10 06:46:46'),(508,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha error','2026-10-10 06:46:48'),(509,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha error','2026-10-10 11:33:08'),(510,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-10-10 11:38:47'),(511,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha error','2026-10-10 11:38:49'),(512,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-10-14 07:42:45'),(513,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-10-14 20:04:27'),(514,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-10-15 05:16:02'),(515,'SuperAdmin','10.240.0.136','','Chrome 15','Windows 10','1','user jcaptcha expire','2026-10-16 17:52:23');
/*!40000 ALTER TABLE `neu_sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_menu`
--

DROP TABLE IF EXISTS `neu_sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Menu ID',
  `menu_name` varchar(50) NOT NULL COMMENT 'menu name',
  `parent_id` bigint DEFAULT '0' COMMENT 'parent menu ID',
  `order_num` int DEFAULT '0' COMMENT 'Display order',
  `path` varchar(200) DEFAULT '' COMMENT 'routing address',
  `component` varchar(255) DEFAULT NULL COMMENT 'component path',
  `query` varchar(255) DEFAULT NULL COMMENT 'routing parameters',
  `is_frame` int DEFAULT '1' COMMENT 'Whether it is an external link (0 is 1 or not)',
  `is_cache` int DEFAULT '0' COMMENT 'Whether to cache (0 cache, 1 not cache)',
  `menu_type` char(1) DEFAULT '' COMMENT 'menu type (M directory C menu F button)',
  `visible` char(1) DEFAULT '0' COMMENT 'Menu status (0 display 1 hide)',
  `status` char(1) DEFAULT '0' COMMENT 'Menu status (0 normal 1 disabled)',
  `perms` varchar(100) DEFAULT NULL COMMENT 'permission ID',
  `icon` varchar(100) DEFAULT '#' COMMENT 'menu icon',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remarks',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6054 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='menu permission table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_menu`
--

LOCK TABLES `neu_sys_menu` WRITE;
/*!40000 ALTER TABLE `neu_sys_menu` DISABLE KEYS */;
INSERT INTO `neu_sys_menu` VALUES (6048,'2154',0,1,'miniAppReview/index','miniAppReview/index',NULL,1,0,'C','0','0','miniappreview','miniappreview','Admin','2024-03-13 19:53:34','Admin','2024-03-14 11:45:04',''),(6049,'2155',0,2,'companyReview/index','companyReview/index',NULL,1,0,'C','0','0','companyreview','companyreview','Admin','2024-03-13 20:33:04','Admin','2024-03-14 14:13:48',''),(6050,'2156',0,3,'applications/index','applications/index',NULL,1,0,'C','1','0','applications','applications','Admin','2024-03-13 19:53:34','Admin','2024-03-14 11:45:04',''),(6051,'2001',0,4,'','',NULL,1,0,'M','0','0','','setting','Admin','2024-03-13 20:34:48','Admin','2024-03-14 11:44:04',''),(6052,'2157',6051,1,'settings/teammates','teammates/index',NULL,1,0,'C','0','0','teammates','teammates','Admin','2024-03-13 20:37:03','Admin','2024-03-14 11:44:36',''),(6053,'2158',6051,2,'settings/roles','system/role/index',NULL,1,0,'C','0','0','roles','roles','Admin','2024-03-13 20:41:22','Admin','2024-03-14 11:44:45','');
/*!40000 ALTER TABLE `neu_sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_notice`
--

DROP TABLE IF EXISTS `neu_sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT 'Notice ID',
  `notice_title` varchar(50) NOT NULL COMMENT 'Notice title',
  `notice_type` char(1) NOT NULL COMMENT 'Notice type (1 notice 2 notices)',
  `notice_content` longblob COMMENT 'Notice content',
  `status` char(1) DEFAULT '0' COMMENT 'Notice status (0 normal 1 closed)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(255) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Notification Announcement Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_notice`
--

LOCK TABLES `neu_sys_notice` WRITE;
/*!40000 ALTER TABLE `neu_sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_notify`
--

DROP TABLE IF EXISTS `neu_sys_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_notify` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `notifyType` int NOT NULL COMMENT 'message type; 1-plain text type',
  `title` varchar(64) NOT NULL COMMENT 'subject',
  `content` text NOT NULL COMMENT 'content',
  `rules_type` varchar(256) DEFAULT NULL COMMENT 'rules; send to everyone, send by phone number',
  `country_code` varchar(64) DEFAULT NULL COMMENT 'country code',
  `mobile_number` text COMMENT 'phone number',
  `navigate_type` varchar(256) DEFAULT NULL COMMENT 'Navigation type; applet, url',
  `mini_app_id` varchar(256) DEFAULT NULL COMMENT 'mini program id',
  `url` varchar(256) DEFAULT NULL COMMENT 'URL',
  `link` varchar(256) DEFAULT NULL COMMENT 'The applet opens the link',
  `ctime` bigint DEFAULT NULL COMMENT 'Creation time',
  `mtime` bigint DEFAULT NULL COMMENT 'modification time',
  `deleted` int NOT NULL COMMENT '0- not deleted; 1- deleted',
  `create_id` varchar(64) DEFAULT NULL COMMENT 'create_id',
  `create_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_type_index` (`rules_type`),
  KEY `navigate_type_index` (`navigate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Message push';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_notify`
--

LOCK TABLES `neu_sys_notify` WRITE;
/*!40000 ALTER TABLE `neu_sys_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_oper_log`
--

DROP TABLE IF EXISTS `neu_sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'log primary key',
  `title` varchar(50) DEFAULT '' COMMENT 'Module title',
  `business_type` int DEFAULT '0' COMMENT 'Business type (0 other 1 new 2 modify 3 delete)',
  `method` varchar(100) DEFAULT '' COMMENT 'Method name',
  `request_method` varchar(10) DEFAULT '' COMMENT 'request method',
  `operator_type` int DEFAULT '0' COMMENT 'Operation type (0 other 1 background user 2 mobile phone user)',
  `oper_name` varchar(50) DEFAULT '' COMMENT 'operator',
  `dept_name` varchar(50) DEFAULT '' COMMENT 'Department Name',
  `oper_url` varchar(255) DEFAULT '' COMMENT 'Request URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT 'host address',
  `oper_location` varchar(255) DEFAULT '' COMMENT 'operating location',
  `oper_param` varchar(2000) DEFAULT '' COMMENT 'request parameter',
  `json_result` varchar(2000) DEFAULT '' COMMENT 'return parameter',
  `status` int DEFAULT '0' COMMENT 'operation status (0 normal 1 abnormal)',
  `error_msg` varchar(2000) DEFAULT '' COMMENT 'error message',
  `oper_time` datetime DEFAULT NULL COMMENT 'operating time',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Operation log record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_oper_log`
--

LOCK TABLES `neu_sys_oper_log` WRITE;
/*!40000 ALTER TABLE `neu_sys_oper_log` DISABLE KEYS */;
INSERT INTO `neu_sys_oper_log` VALUES (10,'user management',1,'ai.neuvision.mp.operation.web.controller.system.SysUserController.add()','POST',1,NULL,NULL,'/neu-mp-operation/system/user/add','10.240.0.158','','{\"uid\":46244019123510748} {\"avatar\":\"https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_c0636e25a8d408403696d71b9cdad717eba1f63136b8080767b0dc1d29700ef1.jpg?t=1790235108991&t=1790755467071\",\"countryCode\":\"974\",\"nickName\":\"tengfei shen\",\"params\":{},\"phonenumber\":\"71203125\",\"roles\":[8373],\"userName\":\"o5c3m8x3\",\"userUid\":97415277199867686}','{\"msg\":\"Operation succeeded\",\"code\":200}',0,NULL,'2026-09-30 08:04:30');
/*!40000 ALTER TABLE `neu_sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_post`
--

DROP TABLE IF EXISTS `neu_sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'post ID',
  `post_code` varchar(64) NOT NULL COMMENT 'post code',
  `post_name` varchar(50) NOT NULL COMMENT 'post name',
  `post_sort` int NOT NULL COMMENT 'display order',
  `status` char(1) NOT NULL COMMENT 'status (0 normal 1 disabled)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='post information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_post`
--

LOCK TABLES `neu_sys_post` WRITE;
/*!40000 ALTER TABLE `neu_sys_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_role`
--

DROP TABLE IF EXISTS `neu_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'admin flag,0:not admin;1:admin',
  `role_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'role name',
  `role_key` varchar(100) NOT NULL COMMENT 'role permission string',
  `role_sort` int NOT NULL COMMENT 'display order',
  `data_scope` char(1) DEFAULT '1' COMMENT 'Data scope (1: All data permissions 2: Custom data permissions 3: This department data permissions 4: This department and the following data permissions)',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'Whether the menu tree selection items are displayed in association',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'Whether the selection items of the department tree are displayed in association',
  `status` char(1) NOT NULL COMMENT 'role status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence, 2 means delete)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='role information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_role`
--

LOCK TABLES `neu_sys_role` WRITE;
/*!40000 ALTER TABLE `neu_sys_role` DISABLE KEYS */;
INSERT INTO `neu_sys_role` VALUES (8373,0,'Admin','Admin',1,'1',0,0,'0','0','','2024-04-24 15:48:40','',NULL,NULL);
/*!40000 ALTER TABLE `neu_sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_role_dept`
--

DROP TABLE IF EXISTS `neu_sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT 'Role ID',
  `dept_id` bigint NOT NULL COMMENT 'dept ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='role and department association table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_role_dept`
--

LOCK TABLES `neu_sys_role_dept` WRITE;
/*!40000 ALTER TABLE `neu_sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_role_menu`
--

DROP TABLE IF EXISTS `neu_sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT 'Role ID',
  `menu_id` bigint NOT NULL COMMENT 'Menu ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='role and menu association table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_role_menu`
--

LOCK TABLES `neu_sys_role_menu` WRITE;
/*!40000 ALTER TABLE `neu_sys_role_menu` DISABLE KEYS */;
INSERT INTO `neu_sys_role_menu` VALUES (8373,6048),(8373,6049),(8373,6050),(8373,6051),(8373,6052),(8373,6053);
/*!40000 ALTER TABLE `neu_sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_user`
--

DROP TABLE IF EXISTS `neu_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'admin flag,0:not admin;1:admin',
  `dept_id` bigint DEFAULT NULL COMMENT 'dept ID',
  `user_name` varchar(40) NOT NULL COMMENT 'user account',
  `nick_name` varchar(40) NOT NULL COMMENT 'user nickname',
  `user_type` varchar(2) DEFAULT '00' COMMENT 'user type (00 system user)',
  `email` varchar(50) DEFAULT '' COMMENT 'User Email',
  `country_code` varchar(32) DEFAULT NULL COMMENT 'country code',
  `phonenumber` varchar(11) DEFAULT '' COMMENT 'phone number',
  `sex` char(1) DEFAULT '0' COMMENT 'User gender (0 male, 1 female, 2 unknown)',
  `avatar` varchar(300) DEFAULT '' COMMENT 'avatar address',
  `password` varchar(100) DEFAULT '' COMMENT 'password',
  `status` char(1) DEFAULT '0' COMMENT 'Account status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence, 2 means delete)',
  `login_ip` varchar(128) DEFAULT '' COMMENT 'Last login IP',
  `login_date` datetime DEFAULT NULL COMMENT 'last login time',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'updated by',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=826180723634099689 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User Information Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_user`
--

LOCK TABLES `neu_sys_user` WRITE;
/*!40000 ALTER TABLE `neu_sys_user` DISABLE KEYS */;
INSERT INTO `neu_sys_user` VALUES (46244019123510748,1,NULL,'Super Admin','Super Admin','00','',NULL,'','0','https://nsuperapp-dev.obs.ap-southeast-3.myhuaweicloud.com/miniapp/avatar/20240306102513.png','','0','0','10.240.0.136','2026-10-27 03:34:39','','2024-01-30 16:47:22','','2026-10-27 03:34:39',NULL),(826180723634099688,0,NULL,'o5c3m8x3','tengfei shen','00','','974','','0','https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_c0636e25a8d408403696d71b9cdad717eba1f63136b8080767b0dc1d29700ef1.jpg?t=1790235108991&t=1790755467071','','0','0','',NULL,'Super Admin','2026-09-30 08:04:29','',NULL,NULL);
/*!40000 ALTER TABLE `neu_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_user_post`
--

DROP TABLE IF EXISTS `neu_sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_user_post` (
  `user_id` bigint NOT NULL COMMENT 'user ID',
  `post_id` bigint NOT NULL COMMENT 'post ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User and position association table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_user_post`
--

LOCK TABLES `neu_sys_user_post` WRITE;
/*!40000 ALTER TABLE `neu_sys_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `neu_sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_sys_user_role`
--

DROP TABLE IF EXISTS `neu_sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_sys_user_role` (
  `my_row_id` bigint unsigned NOT NULL AUTO_INCREMENT /*!80023 INVISIBLE */,
  `user_id` bigint NOT NULL COMMENT 'user ID',
  `role_id` bigint NOT NULL COMMENT 'Role ID',
  PRIMARY KEY (`my_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User and role association table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_user_role`
--

LOCK TABLES `neu_sys_user_role` WRITE;
/*!40000 ALTER TABLE `neu_sys_user_role` DISABLE KEYS */;
INSERT INTO `neu_sys_user_role` (`my_row_id`, `user_id`, `role_id`) VALUES (1,46244019123510748,8373),(2,826180723634099688,8373);
/*!40000 ALTER TABLE `neu_sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'neuminiappoperationplatform'
--

--
-- Dumping routines for database 'neuminiappoperationplatform'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-28  9:47:38
