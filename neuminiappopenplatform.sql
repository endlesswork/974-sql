-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: mysql-dgtl-moi-qnsa-dev-qac-001.mysql.database.azure.com    Database: neuminiappopenplatform
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
-- Current Database: `neuminiappopenplatform`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `neuminiappopenplatform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `neuminiappopenplatform`;

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='parameter configuration table';
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='dictionary data table';
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='dictionary type table';
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
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='System Access Record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_logininfor`
--

LOCK TABLES `neu_sys_logininfor` WRITE;
/*!40000 ALTER TABLE `neu_sys_logininfor` DISABLE KEYS */;
INSERT INTO `neu_sys_logininfor` VALUES (446,'ALI ALSHAMARI','10.240.0.192','','Chrome 15','Windows 10','0','exit successful','2026-09-11 11:45:16'),(447,'Minhao Deng','10.240.0.136','','Chrome 15','Windows 10','0','exit successful','2026-10-18 14:40:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=5064 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='menu permission table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_menu`
--

LOCK TABLES `neu_sys_menu` WRITE;
/*!40000 ALTER TABLE `neu_sys_menu` DISABLE KEYS */;
INSERT INTO `neu_sys_menu` VALUES (5049,'2153',0,1,'version','information/version',NULL,1,0,'C','0','0','miniapp:version','rocket','小元','2024-03-13 19:53:34','小元','2024-03-14 11:45:04',''),(5050,'2152',0,3,'information','information/index',NULL,1,0,'C','0','0','miniapp:information','information','小元','2024-03-13 20:33:04','小元','2024-03-14 14:13:48',''),(5051,'2154',0,4,'teammates','',NULL,1,0,'M','0','0','','teammates','小元','2024-03-13 20:34:48','小元','2024-03-14 11:44:04',''),(5052,'2154',5051,1,'teammates','teammates/index',NULL,1,0,'C','0','0','miniapp:teammates','user','小元','2024-03-13 20:37:03','小元','2024-03-14 11:44:36',''),(5053,'2155',5051,2,'roles','system/role/index',NULL,1,0,'C','0','0','miniapp:role','peoples','小元','2024-03-13 20:41:22','小元','2024-03-14 11:44:45',''),(5054,'2157',5050,1,'',NULL,NULL,1,0,'F','0','0','miniapp:information:viewMiniAppKey','#','小元','2024-03-14 10:47:54','小元','2024-03-14 11:42:08',''),(5057,'2156',5049,1,'',NULL,NULL,1,0,'F','0','0','miniapp:version:publishMiniApp','#','小元','2024-03-14 10:51:03','小元','2024-03-14 11:45:46',''),(5058,'2158',5049,1,'',NULL,NULL,1,0,'F','0','0','miniapp:version:unPublishMiniApp','#','小元','2024-03-14 10:51:03','小元','2024-03-14 11:45:46',''),(5059,'2159',0,2,'operations','',NULL,1,0,'M','0','0','','operations','admin','2024-07-29 20:34:48','admin','2024-07-29 11:44:04',''),(5060,'2160',5059,1,'feedback','operations/feedback',NULL,1,0,'C','0','0','miniapp:feedback','feedback','admin','2024-07-29 20:37:03','admin','2024-07-29 11:44:36',''),(5061,'2161',5062,2,'',NULL,NULL,1,0,'F','0','0','miniapp:cliKey','#','admin','2026-06-23 16:04:51','admin','2026-06-30 16:36:32','CLI key management permission'),(5062,'2161',0,4,'access-config','information/accessConfig',NULL,1,0,'C','0','0',NULL,'tool','admin','2026-06-30 16:36:25','admin','2026-06-30 16:36:25','Mini app access config menu'),(5063,'2162',5062,1,'',NULL,NULL,1,0,'F','0','0','miniapp:domainConfig','#','admin','2026-06-30 16:36:25','admin','2026-06-30 16:36:25','Mini app domain config permission');
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
) ENGINE=InnoDB AUTO_INCREMENT=10436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Operation log record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_oper_log`
--

LOCK TABLES `neu_sys_oper_log` WRITE;
/*!40000 ALTER TABLE `neu_sys_oper_log` DISABLE KEYS */;
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
  `app_id` varchar(64) DEFAULT NULL COMMENT 'miniapp id',
  `enterprise_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'enterprise_id',
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
) ENGINE=InnoDB AUTO_INCREMENT=8223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='role information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_role`
--

LOCK TABLES `neu_sys_role` WRITE;
/*!40000 ALTER TABLE `neu_sys_role` DISABLE KEYS */;
INSERT INTO `neu_sys_role` VALUES (8205,0,'ROLE_ENTERPRISE_OWNER','ROLE_ENTERPRISE_OWNER',NULL,'LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',2,'1',0,0,'0','0','','2026-09-10 12:06:48','',NULL,NULL),(8206,0,'Admin','Admin','nxsjgucpwknag6s','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-10 16:31:59','',NULL,NULL),(8207,0,'Admin','Admin','nxmw7l0bsti1u8r','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 08:41:22','',NULL,NULL),(8208,0,'Admin','Admin','nxp2e3tceyeuyfo','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 08:41:44','',NULL,NULL),(8209,0,'Admin','Admin','nx5zkh5mq807i4s','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 08:55:47','',NULL,NULL),(8210,0,'Admin','Admin','nx69duk0aicnd79','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 08:59:36','',NULL,NULL),(8211,0,'Admin','Admin','nx2o0np049c8xw7','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:00:31','',NULL,NULL),(8212,0,'Admin','Admin','nxxald6bi93r1z2','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:01:21','',NULL,NULL),(8213,0,'Admin','Admin','nxclb433ygju8gv','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:03:51','',NULL,NULL),(8214,0,'Admin','Admin','nxeufwnq5elv5f2','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:04:23','',NULL,NULL),(8215,0,'Admin','Admin','nxfrqd1p1wli3f1','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:07:49','',NULL,NULL),(8216,0,'Admin','Admin','nxleen7g4zb194q','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:08:11','',NULL,NULL),(8217,0,'Admin','Admin','nxlpyaeli6dw0ge','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:09:25','',NULL,NULL),(8218,0,'Admin','Admin','nxn731z8rxv6alj','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:09:55','',NULL,NULL),(8219,0,'Admin','Admin','nxguwp4zgjf4wsg','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:12:57','',NULL,NULL),(8220,0,'Admin','Admin','nx22cwx7fsi3qpc','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-12 09:13:30','',NULL,NULL),(8221,0,'Admin','Admin','nxootkfr1o8znf5','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-13 08:58:29','',NULL,NULL),(8222,0,'Admin','Admin','nxzrmzvmi7oh2wo','LUmOjprHOz8R325JYicbHV0yOlgyuFjQLmq3',4,'1',0,0,'0','0','','2026-09-23 02:56:28','',NULL,NULL);
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
INSERT INTO `neu_sys_role_menu` VALUES (8205,5049),(8205,5050),(8205,5051),(8205,5052),(8205,5053),(8205,5054),(8205,5057),(8205,5058),(8205,5059),(8205,5060),(8205,5061),(8205,5062),(8205,5063),(8206,5049),(8206,5050),(8206,5051),(8206,5052),(8206,5053),(8206,5054),(8206,5057),(8206,5058),(8206,5059),(8206,5060),(8206,5061),(8206,5062),(8206,5063),(8207,5049),(8207,5050),(8207,5051),(8207,5052),(8207,5053),(8207,5054),(8207,5057),(8207,5058),(8207,5059),(8207,5060),(8207,5061),(8207,5062),(8207,5063),(8208,5049),(8208,5050),(8208,5051),(8208,5052),(8208,5053),(8208,5054),(8208,5057),(8208,5058),(8208,5059),(8208,5060),(8208,5061),(8208,5062),(8208,5063),(8209,5049),(8209,5050),(8209,5051),(8209,5052),(8209,5053),(8209,5054),(8209,5057),(8209,5058),(8209,5059),(8209,5060),(8209,5061),(8209,5062),(8209,5063),(8210,5049),(8210,5050),(8210,5051),(8210,5052),(8210,5053),(8210,5054),(8210,5057),(8210,5058),(8210,5059),(8210,5060),(8210,5061),(8210,5062),(8210,5063),(8211,5049),(8211,5050),(8211,5051),(8211,5052),(8211,5053),(8211,5054),(8211,5057),(8211,5058),(8211,5059),(8211,5060),(8211,5061),(8211,5062),(8211,5063),(8212,5049),(8212,5050),(8212,5051),(8212,5052),(8212,5053),(8212,5054),(8212,5057),(8212,5058),(8212,5059),(8212,5060),(8212,5061),(8212,5062),(8212,5063),(8213,5049),(8213,5050),(8213,5051),(8213,5052),(8213,5053),(8213,5054),(8213,5057),(8213,5058),(8213,5059),(8213,5060),(8213,5061),(8213,5062),(8213,5063),(8214,5049),(8214,5050),(8214,5051),(8214,5052),(8214,5053),(8214,5054),(8214,5057),(8214,5058),(8214,5059),(8214,5060),(8214,5061),(8214,5062),(8214,5063),(8215,5049),(8215,5050),(8215,5051),(8215,5052),(8215,5053),(8215,5054),(8215,5057),(8215,5058),(8215,5059),(8215,5060),(8215,5061),(8215,5062),(8215,5063),(8216,5049),(8216,5050),(8216,5051),(8216,5052),(8216,5053),(8216,5054),(8216,5057),(8216,5058),(8216,5059),(8216,5060),(8216,5061),(8216,5062),(8216,5063),(8217,5049),(8217,5050),(8217,5051),(8217,5052),(8217,5053),(8217,5054),(8217,5057),(8217,5058),(8217,5059),(8217,5060),(8217,5061),(8217,5062),(8217,5063),(8218,5049),(8218,5050),(8218,5051),(8218,5052),(8218,5053),(8218,5054),(8218,5057),(8218,5058),(8218,5059),(8218,5060),(8218,5061),(8218,5062),(8218,5063),(8219,5049),(8219,5050),(8219,5051),(8219,5052),(8219,5053),(8219,5054),(8219,5057),(8219,5058),(8219,5059),(8219,5060),(8219,5061),(8219,5062),(8219,5063),(8220,5049),(8220,5050),(8220,5051),(8220,5052),(8220,5053),(8220,5054),(8220,5057),(8220,5058),(8220,5059),(8220,5060),(8220,5061),(8220,5062),(8220,5063),(8221,5049),(8221,5050),(8221,5051),(8221,5052),(8221,5053),(8221,5054),(8221,5057),(8221,5058),(8221,5059),(8221,5060),(8221,5061),(8221,5062),(8221,5063),(8222,5049),(8222,5050),(8222,5051),(8222,5052),(8222,5053),(8222,5054),(8222,5057),(8222,5058),(8222,5059),(8222,5060),(8222,5061),(8222,5062),(8222,5063);
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
) ENGINE=InnoDB AUTO_INCREMENT=891259557762007441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User Information Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_user`
--

LOCK TABLES `neu_sys_user` WRITE;
/*!40000 ALTER TABLE `neu_sys_user` DISABLE KEYS */;
INSERT INTO `neu_sys_user` VALUES (88649443663912094,0,NULL,'Thaer Ibrahim Jaber','Thaer Ibrahim Jaber','00','',NULL,'','0','https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_1387cd600a4b01741da97d3c6c585e7923b980d6dcc0177add59170e64fe4c3a.jpg?t=1791215464329','','0','0','10.240.0.136','2026-10-21 08:11:13','','2026-10-21 08:11:12','','2026-10-21 08:11:12',NULL),(453278554399090800,0,NULL,'tengfei shen','tengfei shen','00','',NULL,'','0','https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_c0636e25a8d408403696d71b9cdad717eba1f63136b8080767b0dc1d29700ef1.jpg?t=1790235108991','','0','0','10.240.0.158','2026-10-26 10:59:41','','2026-09-30 08:01:02','','2026-10-26 10:59:40',NULL),(479145595096489184,0,NULL,'ALI ALSHAMARI','QDF Android','00','',NULL,'','0','https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_049e5094d313cabc327bfc3a1a943b4a1b9016d094f902037e9c82a055d3b496.jpg?t=1789725134571','','0','0','10.240.0.136','2026-10-18 13:37:56','','2026-09-10 11:59:53','','2026-10-18 13:37:55',NULL),(665266970872423084,0,NULL,'Minhao Deng','Minhao Deng','00','',NULL,'','0','https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_0873497b90f8abe0214784eddc0e64b66728686cadffce98d75ed575ef34571b.jpg?t=1792330551561','','0','0','10.240.0.136','2026-10-18 14:41:03','','2026-10-18 13:38:47','','2026-10-18 14:41:02',NULL),(792141940079567317,0,NULL,'henry z a','henry z a','00','',NULL,'','0','https://stqnsadevminiapp001.blob.core.windows.net/obs-qatar-dev/avatar/user/th_d20d5d328ba332079ee63dfe9647ecc142499f6eb58ceb47ca35b14c1831590f.jpg?t=1792331833329','','0','0','10.240.0.136','2026-10-27 03:34:50','','2026-10-18 14:01:40','','2026-10-27 03:34:49',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User and role association table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_sys_user_role`
--

LOCK TABLES `neu_sys_user_role` WRITE;
/*!40000 ALTER TABLE `neu_sys_user_role` DISABLE KEYS */;
INSERT INTO `neu_sys_user_role` (`my_row_id`, `user_id`, `role_id`) VALUES (1,479145595096489184,8205),(2,479145595096489184,8206),(3,479145595096489184,8207),(4,479145595096489184,8208),(5,479145595096489184,8209),(6,479145595096489184,8210),(7,479145595096489184,8211),(8,479145595096489184,8212),(9,479145595096489184,8213),(10,479145595096489184,8214),(11,479145595096489184,8215),(12,479145595096489184,8216),(13,479145595096489184,8217),(14,479145595096489184,8218),(15,479145595096489184,8219),(16,479145595096489184,8220),(17,479145595096489184,8221),(18,479145595096489184,8222),(19,453278554399090800,8222),(20,453278554399090800,8208),(21,453278554399090800,8221),(22,453278554399090800,8220),(23,453278554399090800,8219),(24,453278554399090800,8218),(25,453278554399090800,8217),(26,453278554399090800,8216),(27,453278554399090800,8215),(28,453278554399090800,8214),(29,453278554399090800,8213),(30,453278554399090800,8212),(31,453278554399090800,8207),(32,453278554399090800,8211),(33,453278554399090800,8209),(34,453278554399090800,8210),(35,453278554399090800,8206),(36,665266970872423084,8222),(37,665266970872423084,8221),(38,665266970872423084,8220),(39,665266970872423084,8219),(40,665266970872423084,8218),(41,665266970872423084,8217),(42,665266970872423084,8216),(43,665266970872423084,8215),(44,665266970872423084,8214),(45,665266970872423084,8213),(46,665266970872423084,8212),(47,665266970872423084,8211),(48,665266970872423084,8210),(49,665266970872423084,8209),(50,665266970872423084,8208),(51,665266970872423084,8207),(52,792141940079567317,8222),(53,792141940079567317,8219),(54,792141940079567317,8213),(55,792141940079567317,8208),(56,792141940079567317,8207),(57,792141940079567317,8209);
/*!40000 ALTER TABLE `neu_sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neu_user_miniapp`
--

DROP TABLE IF EXISTS `neu_user_miniapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neu_user_miniapp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL,
  `uid` bigint NOT NULL,
  `ctime` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_index_appid_uid` (`app_id`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=780 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neu_user_miniapp`
--

LOCK TABLES `neu_user_miniapp` WRITE;
/*!40000 ALTER TABLE `neu_user_miniapp` DISABLE KEYS */;
INSERT INTO `neu_user_miniapp` VALUES (724,'nxsjgucpwknag6s',479145595096489184,1789057918744),(725,'nxmw7l0bsti1u8r',479145595096489184,1789202482332),(726,'nxp2e3tceyeuyfo',479145595096489184,1789202504148),(727,'nx5zkh5mq807i4s',479145595096489184,1789203347065),(728,'nx69duk0aicnd79',479145595096489184,1789203576189),(729,'nx2o0np049c8xw7',479145595096489184,1789203631373),(730,'nxxald6bi93r1z2',479145595096489184,1789203681320),(731,'nxclb433ygju8gv',479145595096489184,1789203831214),(732,'nxeufwnq5elv5f2',479145595096489184,1789203862912),(733,'nxfrqd1p1wli3f1',479145595096489184,1789204069123),(734,'nxleen7g4zb194q',479145595096489184,1789204091016),(735,'nxlpyaeli6dw0ge',479145595096489184,1789204164912),(736,'nxn731z8rxv6alj',479145595096489184,1789204195490),(737,'nxguwp4zgjf4wsg',479145595096489184,1789204377044),(738,'nx22cwx7fsi3qpc',479145595096489184,1789204410117),(739,'nxootkfr1o8znf5',479145595096489184,1789289908775),(740,'nxzrmzvmi7oh2wo',479145595096489184,1790132187486),(741,'nxzrmzvmi7oh2wo',453278554399090800,1790756021113),(742,'nxp2e3tceyeuyfo',453278554399090800,1790756068248),(743,'nxootkfr1o8znf5',453278554399090800,1790756104990),(744,'nx22cwx7fsi3qpc',453278554399090800,1790756131720),(745,'nxguwp4zgjf4wsg',453278554399090800,1790756149424),(746,'nxn731z8rxv6alj',453278554399090800,1790756173977),(747,'nxlpyaeli6dw0ge',453278554399090800,1790756194977),(748,'nxleen7g4zb194q',453278554399090800,1790756213842),(749,'nxfrqd1p1wli3f1',453278554399090800,1790756238615),(750,'nxeufwnq5elv5f2',453278554399090800,1790756269569),(751,'nxclb433ygju8gv',453278554399090800,1790756290915),(752,'nxxald6bi93r1z2',453278554399090800,1790756316174),(753,'nxmw7l0bsti1u8r',453278554399090800,1790756416685),(754,'nx2o0np049c8xw7',453278554399090800,1790756438552),(755,'nx5zkh5mq807i4s',453278554399090800,1790756462832),(756,'nx69duk0aicnd79',453278554399090800,1790756483461),(757,'nxsjgucpwknag6s',453278554399090800,1790756506401),(758,'nxzrmzvmi7oh2wo',665266970872423084,1792330726477),(759,'nxootkfr1o8znf5',665266970872423084,1792330745135),(760,'nx22cwx7fsi3qpc',665266970872423084,1792330763445),(761,'nxguwp4zgjf4wsg',665266970872423084,1792330781027),(762,'nxn731z8rxv6alj',665266970872423084,1792330796204),(763,'nxlpyaeli6dw0ge',665266970872423084,1792330813966),(764,'nxleen7g4zb194q',665266970872423084,1792330828448),(765,'nxfrqd1p1wli3f1',665266970872423084,1792330843381),(766,'nxeufwnq5elv5f2',665266970872423084,1792330896982),(767,'nxclb433ygju8gv',665266970872423084,1792330923604),(768,'nxxald6bi93r1z2',665266970872423084,1792330945379),(769,'nx2o0np049c8xw7',665266970872423084,1792330962138),(770,'nx69duk0aicnd79',665266970872423084,1792330983013),(771,'nx5zkh5mq807i4s',665266970872423084,1792331009603),(772,'nxp2e3tceyeuyfo',665266970872423084,1792331025590),(773,'nxmw7l0bsti1u8r',665266970872423084,1792331039724),(774,'nxzrmzvmi7oh2wo',792141940079567317,1792332100139),(775,'nxguwp4zgjf4wsg',792141940079567317,1792332118508),(776,'nxclb433ygju8gv',792141940079567317,1792332136069),(777,'nxp2e3tceyeuyfo',792141940079567317,1792332304942),(778,'nxmw7l0bsti1u8r',792141940079567317,1792332328212),(779,'nx5zkh5mq807i4s',792141940079567317,1792332363717);
/*!40000 ALTER TABLE `neu_user_miniapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'neuminiappopenplatform'
--

--
-- Dumping routines for database 'neuminiappopenplatform'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-28  9:26:41
