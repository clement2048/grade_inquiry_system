-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tm_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `choose_course`
--

DROP TABLE IF EXISTS `choose_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choose_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num_rebuild` int NOT NULL COMMENT '重修次数',
  `num_makeup` int NOT NULL COMMENT '补考次数',
  `defer_sign` int NOT NULL COMMENT '缓考标志',
  `pass` int NOT NULL COMMENT '通过标志(1为通过，0为不通过)',
  `stu_id` int NOT NULL COMMENT '学生id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `stu_id` (`stu_id`,`course_id`) USING BTREE,
  KEY `fk_stu_idx` (`stu_id`) USING BTREE,
  KEY `fk_course_idx` (`course_id`) USING BTREE,
  CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_stu` FOREIGN KEY (`stu_id`) REFERENCES `stu_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='选课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose_course`
--

LOCK TABLES `choose_course` WRITE;
/*!40000 ALTER TABLE `choose_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `choose_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_info`
--

DROP TABLE IF EXISTS `class_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `grade` int NOT NULL COMMENT '所在年级',
  `teach_id` bigint NOT NULL COMMENT '班主任id',
  `class_num` int NOT NULL COMMENT '班号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `class_num` (`class_num`,`grade`) USING BTREE,
  UNIQUE KEY `fk_class_idx` (`teach_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='班级信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_info`
--

LOCK TABLES `class_info` WRITE;
/*!40000 ALTER TABLE `class_info` DISABLE KEYS */;
INSERT INTO `class_info` VALUES (1,21,10,1),(2,21,11,2),(3,22,12,2),(4,22,6,1),(100,18,169,1);
/*!40000 ALTER TABLE `class_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_info`
--

DROP TABLE IF EXISTS `course_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名字',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类型（专必、专选、公必、公选）',
  `peo_limit` int NOT NULL COMMENT '人数限制',
  `credit` int NOT NULL COMMENT '学分',
  `tot_time` int NOT NULL COMMENT '总学时',
  `final_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '期末考试方法(考试还是考察)',
  `start_year` int NOT NULL COMMENT '开办学年',
  `start_sem` int NOT NULL COMMENT '开办学期',
  `fac_id` bigint NOT NULL COMMENT '开办学院id',
  `teach_id` bigint NOT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_fac` (`fac_id`) USING BTREE,
  KEY `fk_teach` (`teach_id`) USING BTREE,
  CONSTRAINT `fk_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculties_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='课程信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_info`
--

LOCK TABLES `course_info` WRITE;
/*!40000 ALTER TABLE `course_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties_info`
--

DROP TABLE IF EXISTS `faculties_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculties_info` (
  `id` bigint NOT NULL COMMENT '专业id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业名字',
  `campus` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属学院',
  `teach_id` bigint NOT NULL COMMENT '该专业教务老师id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teach_id_idx` (`teach_id`) USING BTREE,
  CONSTRAINT `fk_teachid` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties_info`
--

LOCK TABLES `faculties_info` WRITE;
/*!40000 ALTER TABLE `faculties_info` DISABLE KEYS */;
INSERT INTO `faculties_info` VALUES (1,'软件工程学院','珠海校区',2);
/*!40000 ALTER TABLE `faculties_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'stu_info','学生信息表',NULL,NULL,'StuInfo','crud','element-ui','com.ruoyi.system','system','info','Student','clement','0','/','{\"parentMenuId\":2000}','admin','2024-06-18 11:04:33','','2024-06-18 13:44:24',NULL),(2,'score_info','学生成绩表',NULL,NULL,'ScoreInfo','crud','element-ui','com.ruoyi.tm','tm','score','成绩管理','clement','0','/','{\"parentMenuId\":2000}','admin','2024-06-21 13:29:43','','2024-06-21 13:31:50',NULL),(3,'tea_info','教师信息',NULL,NULL,'TeaInfo','crud','element-ui','com.ruoyi.tm','tm','teacher','教师信息','clement','0','/','{}','admin','2024-06-22 13:48:44','','2024-07-06 07:52:41',NULL),(4,'major_info','专业信息',NULL,NULL,'MajorInfo','crud','element-ui','com.ruoyi.tm','tm','major','专业','clement','0','/','{\"parentMenuId\":2000}','admin','2024-07-06 07:39:20','','2024-07-06 07:40:47',NULL),(5,'choose_course','选课信息表',NULL,NULL,'ChooseCourse','crud','element-ui','com.ruoyi.tm','tm','choose','选课','clement','0','/','{}','admin','2024-07-06 08:05:59','','2024-07-06 08:06:37',NULL),(6,'course_info','课程信息表',NULL,NULL,'CourseInfo','crud','element-ui','com.ruoyi.tm','tm','Course','课程信息','clement','0','/','{}','admin','2024-07-07 14:33:09','','2024-07-07 14:34:47',NULL),(7,'class_info','班级信息表',NULL,NULL,'ClassInfo','crud','element-ui','com.ruoyi.tm','tm','Class','班级信息','ruoyi','0','/','{\"parentMenuId\":2000}','admin','2024-07-08 15:34:20','','2024-07-08 15:36:00',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id','学生id','int','Long','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(2,1,'name','学生姓名','varchar(45)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(3,1,'sex','学生性别','int','Long','sex','0','0','1','1','1','1','1','EQ','select','',3,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(4,1,'type','学生类型','varchar(45)','String','type','0','0','1','1','1','1','1','EQ','select','',4,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(5,1,'adm_method','入学方法','varchar(45)','String','admMethod','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(6,1,'in_school','是否在校','int','Long','inSchool','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(7,1,'stu_status','学生状态','int','Long','stuStatus','0','0','1','1','1','1','1','EQ','radio','',7,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(8,1,'class_id','班级id','int','Long','classId','0','0','1','1','1','1','1','EQ','input','',8,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(9,1,'major_id','专业id','int','Long','majorId','0','0','1','1','1','1','1','EQ','input','',9,'admin','2024-06-18 11:04:33','','2024-06-18 13:44:24'),(10,2,'id','成绩id','int','Long','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(11,2,'usual_por','平时成绩占比','int','Long','usualPor','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(12,2,'usual_sco','平时成绩','int','Long','usualSco','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(13,2,'mid_por','期中成绩占比','int','Long','midPor','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(14,2,'mid_sco','期中成绩','int','Long','midSco','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(15,2,'final_por','期末成绩占比','int','Long','finalPor','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(16,2,'final_sco','期末成绩','int','Long','finalSco','0','0','1','1','1','1','1','EQ','input','',7,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(17,2,'others','其他备注','varchar(45)','String','others','0','0','1','1','1','1','1','EQ','input','',8,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(18,2,'choose_id','选课id','int','Long','chooseId','0','0','1','1','1','1','1','EQ','input','',9,'admin','2024-06-21 13:29:43','','2024-06-21 13:31:50'),(19,3,'id','教师id','int','Long','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-22 13:48:44','','2024-07-06 07:52:41'),(20,3,'name','教师姓名','varchar(45)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-22 13:48:44','','2024-07-06 07:52:41'),(21,3,'type','教师类型','varchar(45)','String','type','0','0','1','1','1','1','1','EQ','select','',3,'admin','2024-06-22 13:48:44','','2024-07-06 07:52:41'),(22,4,'id','专业id','int','Long','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(23,4,'name','专业姓名','varchar(45)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(24,4,'dura','专业开设时间','int','Long','dura','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(25,4,'maj_must','毕业所需专必学分','int','Long','majMust','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(26,4,'maj_choose','所需专选学分','int','Long','majChoose','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(27,4,'pub_must','所需公必学分','int','Long','pubMust','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(28,4,'pub_choose','所需公选学分','int','Long','pubChoose','0','0','1','1','1','1','1','EQ','input','',7,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(29,4,'gra_score','毕业所需学分','int','Long','graScore','0','0','1','1','1','1','1','EQ','input','',8,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(30,4,'fac_id','所属学院id','int','Long','facId','0','0','1','1','1','1','1','EQ','input','',9,'admin','2024-07-06 07:39:20','','2024-07-06 07:40:47'),(31,5,'id','选课id','int','Long','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(32,5,'num_rebuild','重修次数','int','Long','numRebuild','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(33,5,'num_makeup','补考次数','int','Long','numMakeup','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(34,5,'defer_sign','缓考标志','int','Long','deferSign','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(35,5,'pass','通过标志(0为通过，1为不通过)','int','Long','pass','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(36,5,'stu_id','学生id','int','Long','stuId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(37,5,'course_id','课程id','int','Long','courseId','0','0','1','1','1','1','1','EQ','input','',7,'admin','2024-07-06 08:05:59','','2024-07-06 08:06:37'),(38,6,'id','课程id','int','Long','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(39,6,'name','课程名字','varchar(45)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(40,6,'type','课程类型','varchar(45)','String','type','0','0','1','1','1','1','1','EQ','radio','',3,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(41,6,'peo_limit','人数限制','int','Long','peoLimit','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(42,6,'credit','学分','int','Long','credit','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(43,6,'tot_time','总学时','int','Long','totTime','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(44,6,'final_method','期末考试方法','varchar(45)','String','finalMethod','0','0','1','1','1','1','1','EQ','radio','',7,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(45,6,'start_year','开办学年','int','Long','startYear','0','0','1','1','1','1','1','EQ','input','',8,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(46,6,'start_sem','开办学期','int','Long','startSem','0','0','1','1','1','1','1','EQ','input','',9,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(47,6,'fac_id','开办学院id','int','Long','facId','0','0','1','1','1','1','1','EQ','input','',10,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(48,6,'teach_id','授课老师id','int','Long','teachId','0','0','1','1','1','1','1','EQ','input','',11,'admin','2024-07-07 14:33:09','','2024-07-07 14:34:47'),(49,7,'id','班级id','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-08 15:34:20','','2024-07-08 15:36:00'),(50,7,'grade','所在年级','int','Long','grade','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-07-08 15:34:20','','2024-07-08 15:36:00'),(51,7,'teach_id','班主任id','bigint','Long','teachId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-07-08 15:34:20','','2024-07-08 15:36:00'),(52,7,'class_num','班号','int','Long','classNum','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-07-08 15:34:20','','2024-07-08 15:36:00');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_info`
--

DROP TABLE IF EXISTS `major_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业姓名',
  `dura` int NOT NULL,
  `maj_must` int NOT NULL COMMENT '毕业所需专必学分',
  `maj_choose` int NOT NULL COMMENT '所需专选学分',
  `pub_must` int NOT NULL COMMENT '所需公必学分',
  `pub_choose` int NOT NULL COMMENT '所需公选学分',
  `gra_score` int NOT NULL COMMENT '毕业所需学分',
  `fac_id` bigint NOT NULL COMMENT '所属学院id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `major_info_ibfk_1` (`fac_id`) USING BTREE,
  CONSTRAINT `fk_facu` FOREIGN KEY (`fac_id`) REFERENCES `faculties_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_info`
--

LOCK TABLES `major_info` WRITE;
/*!40000 ALTER TABLE `major_info` DISABLE KEYS */;
INSERT INTO `major_info` VALUES (1,'软件工程',21,106,24,37,8,175,1),(2,'人工智能',18,20,30,30,10,90,1),(3,'微电子',20,10,15,80,100,205,1),(5,'人工智能',20,114,18,37,8,177,1),(6,'集成电路',21,99,25,37,8,169,1),(7,'心理学',8,56,20,45,16,137,1),(8,'电子与通信工程',17,89,25,31,16,161,1),(9,'海洋科学',8,64,30,47,17,158,1),(10,'大气科学',12,66,39,35,16,156,1),(11,'先进制造',21,115,18,37,8,178,1),(12,'材料科学与工程',16,79,22,31,16,148,1),(13,'化学学院',5,69,21,52,13,155,1),(14,'海洋工程与技术',17,100,9,31,16,156,1),(15,'测绘科学与技术',19,98,14,32,12,156,1),(16,'土木工程',17,92,26,31,16,165,1),(17,'护理学',3,109,34,47,10,201,1),(18,'软件工程',20,106,24,37,8,175,1),(19,'先进能源',21,97,27,37,8,169,1),(20,'航空航天学',15,69,47,38,16,170,1),(21,'化学工程与技术',16,100,14,33,16,163,1),(22,'地球科学与工程',5,53,32,50,12,147,1),(23,'环境科学与工程',5,52,40,51,12,155,1),(24,'材料学',17,100,12,31,16,159,1);
/*!40000 ALTER TABLE `major_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_info`
--

DROP TABLE IF EXISTS `score_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_info` (
  `id` bigint NOT NULL,
  `usual_por` int NOT NULL,
  `usual_sco` int NOT NULL,
  `mid_por` int NOT NULL,
  `mid_sco` int NOT NULL,
  `final_por` int NOT NULL,
  `final_sco` int NOT NULL,
  `others` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `choose_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_course_idx` (`choose_id`) USING BTREE,
  CONSTRAINT `fk_choose` FOREIGN KEY (`choose_id`) REFERENCES `choose_course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_info`
--

LOCK TABLES `score_info` WRITE;
/*!40000 ALTER TABLE `score_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_info`
--

DROP TABLE IF EXISTS `stu_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stu_info` (
  `id` int NOT NULL COMMENT '学生id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生姓名',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生类型',
  `adm_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '入学方式',
  `in_school` int DEFAULT NULL COMMENT '是否在校（0在校，1不在校）',
  `stu_status` int DEFAULT NULL COMMENT '学生状态（0正常，1异常3）',
  `class_id` bigint DEFAULT NULL COMMENT '班级id',
  `major_id` bigint DEFAULT NULL COMMENT '专业id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_majorid` (`major_id`) USING BTREE,
  KEY `fk_classid` (`class_id`) USING BTREE,
  CONSTRAINT `fk_class` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_major` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_info`
--

LOCK TABLES `stu_info` WRITE;
/*!40000 ALTER TABLE `stu_info` DISABLE KEYS */;
INSERT INTO `stu_info` VALUES (1,'adm','普通考生','一般统考',0,1,1,1),(172,'test','普通考生','普通统考',0,1,2,2);
/*!40000 ALTER TABLE `stu_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-05-31 23:32:48','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-05-31 23:32:48','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-05-31 23:32:48','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','N','admin','2024-05-31 23:32:48','admin','2024-07-08 00:24:39','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-05-31 23:32:48','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-05-31 23:32:48','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','中山大学',0,'钟明廷','15888888888','test@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-06-21 09:31:50'),(101,100,'0,100','珠海校区',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:33:27'),(102,100,'0,100','南校区',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:33:37'),(103,101,'0,100,101','软件工程学院',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:34:10'),(104,101,'0,100,101','人工智能学院',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:34:30'),(105,101,'0,100,101','微电子学院',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:34:46'),(106,101,'0,100,101','土木工程学院',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:35:03'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2024-05-31 23:32:47','',NULL),(108,102,'0,100,102','管理学院',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:34:00'),(109,102,'0,100,102','数学学院',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:35:34');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-05-31 23:32:48','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-05-31 23:32:48','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-05-31 23:32:48','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-05-31 23:32:48','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-05-31 23:32:48','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-05-31 23:32:48','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-05-31 23:32:48','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-05-31 23:32:48','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-05-31 23:32:48','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-05-31 23:32:48','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-05-31 23:32:48','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-05-31 23:32:48','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-05-31 23:32:48','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-05-31 23:32:48','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-05-31 23:32:48','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-05-31 23:32:48','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-05-31 23:32:48','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-05-31 23:32:48','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-05-31 23:32:48','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-05-31 23:32:48','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-05-31 23:32:48','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-05-31 23:32:48','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-05-31 23:32:48','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-05-31 23:32:48','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-05-31 23:32:48','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-05-31 23:32:48','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-05-31 23:32:48','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-05-31 23:32:48','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-05-31 23:32:48','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-05-31 23:32:48','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-05-31 23:32:48','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-05-31 23:32:48','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-05-31 23:32:48','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-05-31 23:32:48','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-01 14:57:00'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-01 14:57:06'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-01 19:38:20'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-01 20:47:42'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-01 20:49:57'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-01 20:50:02'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 11:02:00'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 12:24:40'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 13:33:34'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 16:36:27'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-20 22:17:53'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:17:58'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 08:48:53'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 12:46:00'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-22 13:11:37'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-22 13:11:44'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 15:11:31'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 17:09:19'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 18:32:48'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 19:59:30'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-05 20:25:19'),(121,'129','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-05 20:25:36'),(122,'129','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 20:25:43'),(123,'129','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-05 20:26:17'),(124,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-05 20:26:29'),(125,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-05 20:29:38'),(126,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 20:29:42'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-05 20:33:49'),(128,'129','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 20:33:59'),(129,'129','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-05 20:34:18'),(130,'129','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-05 20:34:22'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 20:34:31'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-05 20:48:47'),(133,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 20:50:20'),(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-05 22:32:46'),(135,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-05 22:32:52'),(136,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 07:25:46'),(137,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 11:25:18'),(138,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 11:28:50'),(139,'157','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-06 11:29:03'),(140,'157','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-06 11:29:24'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 11:29:43'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 11:29:48'),(143,'157','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-06 11:29:57'),(144,'157','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-06 11:29:59'),(145,'157','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-06 11:30:04'),(146,'test','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-06 11:30:32'),(147,'test','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-06 11:30:37'),(148,'test2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 11:30:48'),(149,'test2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 11:31:48'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 11:31:53'),(151,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 13:43:25'),(152,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-06 17:38:52'),(153,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 17:39:05'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 19:31:39'),(155,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-06 19:53:25'),(156,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-06 19:53:28'),(157,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 19:53:32'),(158,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 20:07:51'),(159,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 22:10:01'),(160,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-07 08:13:02'),(161,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-07 11:11:28'),(162,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-07 12:33:35'),(163,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-07 12:33:39'),(164,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-07 16:33:48'),(165,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-07 19:32:12'),(166,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-07 23:08:45'),(167,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:23:45'),(168,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:23:55'),(169,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:24:19'),(170,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:24:24'),(171,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:26:13'),(172,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:27:31'),(173,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:27:36'),(174,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:27:48'),(175,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:28:20'),(176,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:28:31'),(177,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:29:47'),(178,'wu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:29:58'),(179,'wu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 00:30:20'),(180,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 00:30:27'),(181,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-08 09:00:04'),(182,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:00:06'),(183,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 12:59:22'),(184,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:30:09'),(185,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-08 14:30:21'),(186,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:30:32'),(187,'lan','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:30:39'),(188,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:30:43'),(189,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:31:34'),(190,'stu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:31:41'),(191,'stu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:31:51'),(192,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-08 14:32:02'),(193,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:32:04'),(194,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:32:10'),(195,'wu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:32:17'),(196,'wu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:32:24'),(197,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:32:29'),(198,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:32:47'),(199,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:33:08'),(200,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 15:22:28'),(201,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 18:24:08'),(202,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 21:01:32'),(203,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 22:23:41'),(204,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 23:34:48'),(205,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 01:29:07'),(206,'test0','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-09 01:29:14'),(207,'test0','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-09 01:29:19'),(208,'test0','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-09 01:29:31'),(209,'test0','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-09 01:29:36'),(210,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-09 01:29:47'),(211,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-09 01:29:55'),(212,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-09 01:30:04'),(213,'su','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-09 01:30:09'),(214,'Tim','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-09 01:31:14'),(215,'Tim','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-09 01:31:27'),(216,'Tim','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 01:31:32'),(217,'Tim','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 01:36:08'),(218,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 01:36:17'),(219,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 01:51:57'),(220,'Tim','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 01:52:11'),(221,'Tim','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 01:53:28'),(222,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 01:53:33'),(223,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 02:08:34'),(224,'test','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 02:08:48'),(225,'test','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 02:09:49'),(226,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 02:10:00');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2059 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,2,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-05-31 23:32:47','admin','2024-07-08 00:37:06','系统管理目录'),(2,'系统监控',0,3,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-05-31 23:32:47','admin','2024-07-08 00:37:13','系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-05-31 23:32:47','admin','2024-07-08 00:37:24','系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-05-31 23:32:47','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-05-31 23:32:47','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-05-31 23:32:47','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-05-31 23:32:47','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-05-31 23:32:47','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-05-31 23:32:47','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-05-31 23:32:47','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-05-31 23:32:47','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-05-31 23:32:47','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-05-31 23:32:47','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-05-31 23:32:47','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-05-31 23:32:47','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-05-31 23:32:47','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-05-31 23:32:47','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-05-31 23:32:47','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-05-31 23:32:47','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-05-31 23:32:47','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-05-31 23:32:47','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-05-31 23:32:47','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-05-31 23:32:47','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-05-31 23:32:47','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-05-31 23:32:47','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-05-31 23:32:47','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-05-31 23:32:47','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-05-31 23:32:47','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-05-31 23:32:47','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-05-31 23:32:47','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-05-31 23:32:47','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-05-31 23:32:47','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-05-31 23:32:47','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-05-31 23:32:47','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-05-31 23:32:47','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-05-31 23:32:47','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-05-31 23:32:47','',NULL,''),(2000,'成绩分析',0,1,'tm',NULL,NULL,1,0,'M','0','0','','chart','admin','2024-06-12 19:09:17','admin','2024-07-08 00:36:59',''),(2001,'成绩',2000,0,'score','tm/score/index',NULL,1,0,'C','0','0','tm:score:list','#','admin','2024-06-12 19:10:25','admin','2024-07-09 00:51:23',''),(2003,'学生信息',2000,1,'info','tm/info/index',NULL,1,0,'C','0','0','tm:info:list','#','admin','2024-06-18 13:48:44','admin','2024-07-05 18:56:38','Student菜单'),(2004,'Student查询',2003,1,'#','',NULL,1,0,'F','0','0','system:info:query','#','admin','2024-06-18 13:48:44','',NULL,''),(2005,'Student新增',2003,2,'#','',NULL,1,0,'F','0','0','system:info:add','#','admin','2024-06-18 13:48:44','',NULL,''),(2006,'Student修改',2003,3,'#','',NULL,1,0,'F','0','0','system:info:edit','#','admin','2024-06-18 13:48:44','',NULL,''),(2007,'Student删除',2003,4,'#','',NULL,1,0,'F','0','0','system:info:remove','#','admin','2024-06-18 13:48:44','',NULL,''),(2008,'Student导出',2003,5,'#','',NULL,1,0,'F','0','0','system:info:export','#','admin','2024-06-18 13:48:44','',NULL,''),(2009,'专业',2000,1,'major','tm/major/index',NULL,1,0,'C','0','0','tm:major:list','#','admin','2024-07-06 07:46:41','',NULL,'专业菜单'),(2010,'专业查询',2009,1,'#','',NULL,1,0,'F','0','0','tm:major:query','#','admin','2024-07-06 07:46:41','',NULL,''),(2011,'专业新增',2009,2,'#','',NULL,1,0,'F','0','0','tm:major:add','#','admin','2024-07-06 07:46:41','',NULL,''),(2012,'专业修改',2009,3,'#','',NULL,1,0,'F','0','0','tm:major:edit','#','admin','2024-07-06 07:46:41','',NULL,''),(2013,'专业删除',2009,4,'#','',NULL,1,0,'F','0','0','tm:major:remove','#','admin','2024-07-06 07:46:41','',NULL,''),(2014,'专业导出',2009,5,'#','',NULL,1,0,'F','0','0','tm:major:export','#','admin','2024-07-06 07:46:41','',NULL,''),(2015,'教师信息',2000,1,'teacher','tm/teacher/index',NULL,1,0,'C','0','0','tm:teacher:list','#','admin','2024-07-06 08:10:08','admin','2024-07-06 08:10:50','教师信息菜单'),(2016,'教师信息查询',2015,1,'#','',NULL,1,0,'F','0','0','tm:teacher:query','#','admin','2024-07-06 08:10:08','',NULL,''),(2017,'教师信息新增',2015,2,'#','',NULL,1,0,'F','0','0','tm:teacher:add','#','admin','2024-07-06 08:10:08','',NULL,''),(2018,'教师信息修改',2015,3,'#','',NULL,1,0,'F','0','0','tm:teacher:edit','#','admin','2024-07-06 08:10:08','',NULL,''),(2019,'教师信息删除',2015,4,'#','',NULL,1,0,'F','0','0','tm:teacher:remove','#','admin','2024-07-06 08:10:08','',NULL,''),(2020,'教师信息导出',2015,5,'#','',NULL,1,0,'F','0','0','tm:teacher:export','#','admin','2024-07-06 08:10:08','',NULL,''),(2021,'选课',2000,1,'choose','tm/choose/index',NULL,1,0,'C','0','0','tm:choose:list','#','admin','2024-07-06 08:14:21','admin','2024-07-06 08:15:54','选课菜单'),(2022,'选课查询',2021,1,'#','',NULL,1,0,'F','0','0','tm:choose:query','#','admin','2024-07-06 08:14:21','',NULL,''),(2023,'选课新增',2021,2,'#','',NULL,1,0,'F','0','0','tm:choose:add','#','admin','2024-07-06 08:14:21','',NULL,''),(2024,'选课修改',2021,3,'#','',NULL,1,0,'F','0','0','tm:choose:edit','#','admin','2024-07-06 08:14:21','',NULL,''),(2025,'选课删除',2021,4,'#','',NULL,1,0,'F','0','0','tm:choose:remove','#','admin','2024-07-06 08:14:21','',NULL,''),(2026,'选课导出',2021,5,'#','',NULL,1,0,'F','0','0','tm:choose:export','#','admin','2024-07-06 08:14:21','',NULL,''),(2027,'管理员首页',0,0,'indexTM','indexTM',NULL,1,0,'C','0','0','','people','admin','2024-07-06 20:11:09','admin','2024-07-08 14:12:08',''),(2028,'课程信息',2000,1,'Course','tm/Course/index',NULL,1,0,'C','0','0','tm:Course:list','#','admin','2024-07-07 14:36:32','admin','2024-07-08 10:23:30','课程信息菜单'),(2029,'课程信息查询',2028,1,'#','',NULL,1,0,'F','0','0','tm:Course:query','#','admin','2024-07-07 14:36:32','',NULL,''),(2030,'课程信息新增',2028,2,'#','',NULL,1,0,'F','0','0','tm:Course:add','#','admin','2024-07-07 14:36:32','',NULL,''),(2031,'课程信息修改',2028,3,'#','',NULL,1,0,'F','0','0','tm:Course:edit','#','admin','2024-07-07 14:36:32','',NULL,''),(2032,'课程信息删除',2028,4,'#','',NULL,1,0,'F','0','0','tm:Course:remove','#','admin','2024-07-07 14:36:32','',NULL,''),(2033,'课程信息导出',2028,5,'#','',NULL,1,0,'F','0','0','tm:Course:export','#','admin','2024-07-07 14:36:32','',NULL,''),(2034,'成绩查询',2001,1,'',NULL,NULL,1,0,'F','0','0','tm:score:query','#','admin','2024-07-08 00:42:04','',NULL,''),(2035,'成绩新增',2001,2,'',NULL,NULL,1,0,'F','0','0','tm:score:add','#','admin','2024-07-08 00:42:30','',NULL,''),(2036,'成绩修改',2001,3,'',NULL,NULL,1,0,'F','0','0','tm:score:edit','#','admin','2024-07-08 00:42:53','',NULL,''),(2037,'成绩删除',2001,4,'',NULL,NULL,1,0,'F','0','0','tm:score:remove','#','admin','2024-07-08 00:43:43','',NULL,''),(2038,'成绩导出',2001,5,'',NULL,NULL,1,0,'F','0','0','tm:score:export','#','admin','2024-07-08 00:44:15','',NULL,''),(2039,'成绩导入',2001,6,'',NULL,NULL,1,0,'F','0','0','tm:score:import','#','admin','2024-07-08 00:44:56','',NULL,''),(2040,'教师首页',0,0,'normal_teacher','normal_teacher',NULL,1,0,'C','0','0',NULL,'education','admin','2024-07-08 14:13:44','',NULL,''),(2041,'班主任首页',0,0,'teacher_welcome','teacher_welcome',NULL,1,0,'C','0','0',NULL,'education','admin','2024-07-08 14:14:14','',NULL,''),(2042,'学生首页',0,0,'index','index',NULL,1,0,'C','0','0',NULL,'people','admin','2024-07-08 14:14:44','',NULL,''),(2043,'班级信息',2000,1,'Class','tm/Class/index',NULL,1,0,'C','0','0','tm:Class:list','#','admin','2024-07-08 15:39:48','',NULL,'班级信息菜单'),(2044,'班级信息查询',2043,1,'#','',NULL,1,0,'F','0','0','tm:Class:query','#','admin','2024-07-08 15:39:48','',NULL,''),(2045,'班级信息新增',2043,2,'#','',NULL,1,0,'F','0','0','tm:Class:add','#','admin','2024-07-08 15:39:48','',NULL,''),(2046,'班级信息修改',2043,3,'#','',NULL,1,0,'F','0','0','tm:Class:edit','#','admin','2024-07-08 15:39:48','',NULL,''),(2047,'班级信息删除',2043,4,'#','',NULL,1,0,'F','0','0','tm:Class:remove','#','admin','2024-07-08 15:39:48','',NULL,''),(2048,'班级信息导出',2043,5,'#','',NULL,1,0,'F','0','0','tm:Class:export','#','admin','2024-07-08 15:39:48','',NULL,''),(2049,'Student导入',2003,6,'',NULL,NULL,1,0,'F','0','0','system:info:import','#','admin','2024-07-09 00:50:45','',NULL,''),(2050,'专业导入',2009,6,'',NULL,NULL,1,0,'F','0','0','tm:major:import','#','admin','2024-07-09 00:55:50','admin','2024-07-09 00:56:03',''),(2051,'教师信息导入',2015,6,'',NULL,NULL,1,0,'F','0','0','tm:teacher:import','#','admin','2024-07-09 00:56:38','',NULL,''),(2052,'选课导入',2021,6,'',NULL,NULL,1,0,'F','0','0','tm:choose:import','#','admin','2024-07-09 00:59:05','',NULL,''),(2053,'课程信息导入',2028,6,'',NULL,NULL,1,0,'F','0','0','tm:Course:import','#','admin','2024-07-09 01:00:31','',NULL,''),(2054,'班级信息导入',2043,6,'',NULL,NULL,1,0,'F','0','0','tm:Class:import','#','admin','2024-07-09 01:03:48','',NULL,''),(2056,'学生成绩',2000,0,'stuscore','tm/score/stuindex',NULL,1,0,'C','0','0','tm:score:list','#','admin','2024-07-09 01:43:02','',NULL,''),(2057,'学生成绩查询',2056,0,'',NULL,NULL,1,0,'F','0','0','tm:score:query','#','admin','2024-07-09 01:58:20','',NULL,''),(2058,'学生成绩详情',2056,1,'',NULL,NULL,1,0,'F','0','0','tm:score:detail','#','admin','2024-07-09 01:59:08','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-05-31 23:32:48','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-05-31 23:32:48','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"email\":\"15@qq.com\",\"nickName\":\"苏某\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"苏某人\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-01 19:39:51',86),(101,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"email\":\"156@qq.com\",\"nickName\":\"吴某\",\"params\":{},\"phonenumber\":\"15094826584\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"吴某人\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-01 19:40:49',74),(102,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"stu_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 11:04:33',76),(103,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"info\",\"className\":\"StuInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学生id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"学生姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"学生性别\",\"columnId\":3,\"columnName\":\"sex\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"学生类型\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 11:06:10',74),(104,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"stu_info\"}',NULL,0,NULL,'2024-06-18 11:06:15',353),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"info\",\"className\":\"StuInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学生id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-18 11:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"学生姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-18 11:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"学生性别\",\"columnId\":3,\"columnName\":\"sex\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-18 11:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"学生类型\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 13:44:24',151),(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"stu_info\"}',NULL,0,NULL,'2024-06-18 13:44:29',220),(107,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"1\",\"classId\":1,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_info          ( name,                                       adm_method,             in_school,                          class_id,             major_id )           values ( ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-06-18 14:43:34',368),(108,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"1\",\"classId\":1,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_info          ( name,                                       adm_method,             in_school,                          class_id,             major_id )           values ( ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-06-18 14:43:38',4),(109,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_info          ( name,                                       adm_method,             in_school,                          class_id,             major_id )           values ( ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-06-18 16:36:53',9),(110,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        -- 使用获取的自增ID插入第二\' at line 6\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: -- 插入第一条记录         INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");          -- 获取自增ID         SET @last_id = LAST_INSERT_ID();          -- 使用获取的自增ID插入第二条记录         INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        -- 使用获取的自增ID插入第二\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        -- 使用获取的自增ID插入第二\' at line 6','2024-06-18 16:46:12',190),(111,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");          SET @last_id = LAST_INSERT_ID();          INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4','2024-06-18 16:46:57',188),(112,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");          SET @last_id = LAST_INSERT_ID();          INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4','2024-06-18 16:48:25',8),(113,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n        INSERT INTO stu_info(id, name, sex, typ\' at line 5\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");                         SET @last_id = LAST_INSERT_ID();         INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n        INSERT INTO stu_info(id, name, sex, typ\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n        INSERT INTO stu_info(id, name, sex, typ\' at line 5','2024-06-18 16:58:13',591),(114,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"admin\",\"params\":{},\"sex\":0,\"stuStatus\":1,\"type\":\"普通考生\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 22:42:27',16),(115,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'teacher\')`)\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 08:50:07',35),(116,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'teacher\')`)\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"新增角色\'教师\'失败，角色权限已存在\",\"code\":500}',0,NULL,'2024-06-21 08:50:28',11),(117,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'student\')`)\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 08:50:38',19),(118,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":101,\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'teacher\')`)\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 08:50:55',14),(119,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 08:51:07',15),(120,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 08:51:12',15),(121,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 08:51:36',16),(122,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"中山大学\",\"email\":\"test@qq.com\",\"leader\":\"钟明廷\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 09:31:50',11),(123,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"score_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 13:29:43',96),(124,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"score\",\"className\":\"ScoreInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"成绩id\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UsualPor\",\"columnComment\":\"平时成绩占比\",\"columnId\":11,\"columnName\":\"usual_por\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"usualPor\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UsualSco\",\"columnComment\":\"平时成绩\",\"columnId\":12,\"columnName\":\"usual_sco\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"usualSco\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MidPor\",\"columnComment\":\"期中成绩占比\",\"columnId\":13,\"columnName\":\"mid_por\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"midPor\",\"javaType\":\"Long\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 13:31:50',26),(125,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"score_info\"}',NULL,0,NULL,'2024-06-21 13:31:53',104),(126,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-22 13:25:38',56),(127,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/info/index\",\"createTime\":\"2024-06-18 13:48:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"学生信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"perms\":\"system:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-22 13:29:39',13),(128,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"id\":124,\"inSchool\":0,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'type\' cannot be null\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO stu_info(id, name, type, adm_method,in_school, stu_status, class_id, major_id)         VALUES (?, ?, ?,?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'type\' cannot be null\n; Column \'type\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'type\' cannot be null','2024-06-22 13:44:25',28),(129,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"admin\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-22 13:45:15',5),(130,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tea_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-22 13:48:44',49),(131,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"id\":125,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-22 15:18:31',163),(132,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"id\":126,\"inSchool\":2,\"majorId\":1,\"name\":\"李佶\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 15:15:36',41),(133,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/126','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 15:21:44',8),(134,'成绩管理',2,'com.ruoyi.tm.controller.ScoreInfoController.edit()','PUT',1,'admin','研发部门','/tm/score','127.0.0.1','内网IP','{\"chooseId\":1,\"courseName\":\"计算机组成原理\",\"finalPor\":50,\"finalSco\":100,\"id\":1,\"midPor\":0,\"midSco\":0,\"others\":\"0\",\"params\":{},\"usualPor\":50,\"usualSco\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 16:03:16',14),(135,'成绩管理',2,'com.ruoyi.tm.controller.ScoreInfoController.edit()','PUT',1,'admin','研发部门','/tm/score','127.0.0.1','内网IP','{\"chooseId\":1,\"courseName\":\"计算机组成原理\",\"finalPor\":50,\"finalSco\":100,\"id\":1,\"midPor\":0,\"midSco\":0,\"others\":\"0\",\"params\":{},\"usualPor\":50,\"usualSco\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 16:03:23',3),(136,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/info/index\",\"createTime\":\"2024-06-18 13:48:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"学生信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"perms\":\"tm:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 18:56:38',38),(137,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/126','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 18:56:55',3),(138,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/126','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 18:57:32',4),(139,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"id\":127,\"inSchool\":2,\"majorId\":1,\"name\":\"李佶\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 18:59:37',17),(140,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/127','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 19:59:34',6),(141,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"2\",\"classId\":1,\"id\":128,\"inSchool\":2,\"majorId\":1,\"name\":\"李佶\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 19:59:40',71),(142,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 20:33:11',42),(143,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 21:10:36',17),(144,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/143','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 21:51:38',10),(145,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/144','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 21:51:40',6),(146,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/137,138,139,140,141,142,145,146,135,136','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 21:51:50',7),(147,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/147,148','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 21:51:56',6),(148,'Student',3,'com.ruoyi.tm.controller.StuInfoController.remove()','DELETE',1,'admin','研发部门','/system/info/128,129,131,132,133,130,134,125','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 21:52:06',6),(149,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"adm\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 22:17:54',16),(150,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"普通考试\",\"classId\":1,\"id\":151,\"inSchool\":1,\"majorId\":1,\"name\":\"打翻\",\"params\":{},\"sex\":\"0\",\"stuStatus\":1,\"type\":\"本科生\",\"user_name\":\"151\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.updateSysUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user         set user_name = ?         where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'','2024-07-05 22:31:56',71),(151,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"普通考试\",\"classId\":1,\"id\":151,\"inSchool\":1,\"majorId\":1,\"name\":\"番\",\"params\":{},\"sex\":\"0\",\"stuStatus\":1,\"type\":\"本科生\",\"user_name\":\"151\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'sys_user.id\' in \'where clause\'\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.updateSysUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user         set user_name = ?         where sys_user.id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'sys_user.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'sys_user.id\' in \'where clause\'','2024-07-05 22:33:04',7),(152,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"普通考试\",\"classId\":1,\"id\":151,\"inSchool\":1,\"majorId\":1,\"name\":\"大番\",\"params\":{},\"sex\":\"0\",\"stuStatus\":1,\"type\":\"本科生\",\"user_name\":\"151\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 22:34:05',12),(153,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"1\",\"classId\":1,\"id\":157,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{},\"stuStatus\":1,\"type\":\"1\",\"user_name\":\"test\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 22:35:48',113),(154,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"1\",\"classId\":1,\"id\":157,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{},\"stuStatus\":1,\"type\":\"1\",\"user_name\":\"test2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-05 22:36:23',7),(155,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"major_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 07:39:20',53),(156,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"major\",\"className\":\"MajorInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"专业id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"专业姓名\",\"columnId\":23,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Dura\",\"columnComment\":\"专业开设时间\",\"columnId\":24,\"columnName\":\"dura\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dura\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MajMust\",\"columnComment\":\"毕业所需专必学分\",\"columnId\":25,\"columnName\":\"maj_must\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"majMust\",\"javaType\":\"Long\",\"list\":tru','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 07:40:47',28),(157,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"major_info\"}',NULL,0,NULL,'2024-07-06 07:40:51',105),(158,'专业',5,'com.ruoyi.tm.controller.MajorInfoController.export()','POST',1,'admin','研发部门','/tm/major/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-07-06 07:47:17',538),(159,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teacher\",\"className\":\"TeaInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"教师id\",\"columnId\":19,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 13:48:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"教师姓名\",\"columnId\":20,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 13:48:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"教师类型\",\"columnId\":21,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 13:48:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"clement\",\"functionName\":\"教师信息\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"tm\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.tm\",\"params\":{},\"sub\":false,\"tableComment\":\"教师信息\",\"tableId\":3,\"tableName\":\"tea_info\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 07:52:41',14),(160,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tea_info\"}',NULL,0,NULL,'2024-07-06 07:53:14',65),(161,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"choose_course\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 08:05:59',24),(162,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"choose\",\"className\":\"ChooseCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选课id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumRebuild\",\"columnComment\":\"重修次数\",\"columnId\":32,\"columnName\":\"num_rebuild\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"numRebuild\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumMakeup\",\"columnComment\":\"补考次数\",\"columnId\":33,\"columnName\":\"num_makeup\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"numMakeup\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeferSign\",\"columnComment\":\"缓考标志\",\"columnId\":34,\"columnName\":\"defer_sign\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deferSign\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 08:06:37',18),(163,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"choose_course\"}',NULL,0,NULL,'2024-07-06 08:06:40',35),(164,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/teacher/index\",\"createTime\":\"2024-07-06 08:10:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"教师信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"perms\":\"tm:teacher:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 08:10:50',17),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/choose/index\",\"createTime\":\"2024-07-06 08:14:21\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"选课\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"choose\",\"perms\":\"tm:choose:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 08:15:54',24),(166,'成绩管理',5,'com.ruoyi.tm.controller.ScoreInfoController.export()','POST',1,'admin','研发部门','/tm/score/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-07-06 19:53:56',835),(167,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"indexMT\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexMT\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 20:11:09',20),(168,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"indexMT\",\"createTime\":\"2024-07-06 20:11:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexMT\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 20:11:43',9),(169,'成绩管理',3,'com.ruoyi.tm.controller.ScoreInfoController.remove()','DELETE',1,'admin','研发部门','/tm/score/5','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-06 22:51:14',13),(170,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 09:15:46',24),(171,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"indexTM\",\"createTime\":\"2024-07-06 20:11:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexTM\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 09:16:02',16),(172,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','研发部门','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"test\",\"classId\":1,\"id\":2,\"inSchool\":1,\"majorId\":1,\"name\":\"李四\",\"params\":{},\"sex\":\"1\",\"type\":\"普通本科\",\"user_name\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 12:34:24',17),(173,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"course_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 14:33:09',102),(174,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"info\",\"className\":\"CourseInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":38,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名字\",\"columnId\":39,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"课程类型\",\"columnId\":40,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PeoLimit\",\"columnComment\":\"人数限制\",\"columnId\":41,\"columnName\":\"peo_limit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"peoLimit\",\"javaType\":\"Long\",\"li','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 14:34:11',26),(175,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"Course\",\"className\":\"CourseInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":38,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 14:34:11\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名字\",\"columnId\":39,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 14:34:11\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"课程类型\",\"columnId\":40,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 14:34:11\",\"usableColumn\":false},{\"capJavaField\":\"PeoLimit\",\"columnComment\":\"人数限制\",\"columnId\":41,\"columnName\":\"peo_limit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 14:34:47',21),(176,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"course_info\"}',NULL,0,NULL,'2024-07-07 14:34:51',112),(177,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"教师2\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"教师\",\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":164,\"userName\":\"Tea2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 23:57:01',29),(178,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"教师1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"教师\",\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":163,\"userName\":\"Tea1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 23:57:18',12),(179,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"学生1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"学生\",\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":160,\"userName\":\"test1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 23:57:24',11),(180,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"学生0\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"学生\",\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":161,\"userName\":\"test0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 23:57:29',10),(181,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:39:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"15@qq.com\",\"loginIp\":\"\",\"nickName\":\"苏老师\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"苏老师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-07 23:57:39',16),(182,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:17:53',78),(183,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"蓝老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:19:45',16),(184,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"蓝老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:19:52',14),(185,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"蓝老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:19:59',14),(186,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:39:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"15@qq.com\",\"loginIp\":\"\",\"nickName\":\"苏老师\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[103],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"苏老师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:20:47',14),(187,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:40:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"156@qq.com\",\"loginIp\":\"\",\"nickName\":\"吴某\",\"params\":{},\"phonenumber\":\"15094826584\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"吴老师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:20:58',15),(188,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"学生1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"学生\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":160,\"userName\":\"test1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:21:07',11),(189,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":160}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:21:15',79),(190,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:21:24',80),(191,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:21:33',77),(192,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":157}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:22:54',79),(193,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:48\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:24:39',15),(194,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,3,2001,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:25:02',21),(195,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2028,2029,2030,2031,2032,2033,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:25:17',15),(196,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:25:48',13),(197,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:26:03',10),(198,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:31:20',13),(199,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"珠海校区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"中山大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:33:27',17),(200,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"南校区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"中山大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:33:37',10),(201,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"管理学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"南校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:34:00',9),(202,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件工程学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:34:10',10),(203,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"人工智能学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:34:30',14),(204,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"微电子学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:34:46',9),(205,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"土木工程学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:35:03',9),(206,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:35:13',6),(207,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"管理学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"南校区\",\"phone\":\"15888888888\",\"status\":\"0\"}','{\"msg\":\"修改部门\'管理学院\'失败，部门名称已存在\",\"code\":500}',0,NULL,'2024-07-08 00:35:27',2),(208,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"数学学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"南校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:35:34',8),(209,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-07-08 00:36:03',2),(210,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,3,2001,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:36:12',15),(211,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-07-08 00:36:20',3),(212,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2028,2029,2030,2031,2032,2033,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:36:35',13),(213,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:36:44',5),(214,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-12 19:09:17\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"成绩分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:36:59',10),(215,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-05-31 23:32:47\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:37:06',6),(216,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-05-31 23:32:47\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:37:13',6),(217,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-05-31 23:32:47\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:37:24',6),(218,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:query\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:42:04',6),(219,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:42:30',6),(220,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:42:53',5),(221,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:remove\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:43:43',5),(222,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:export\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:44:15',6),(223,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:import\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 00:44:56',6),(224,'课程信息',1,'com.ruoyi.tm.controller.CourseInfoController.add()','POST',1,'admin','软件工程学院','/tm/Course','127.0.0.1','内网IP','{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-07-08 09:01:46',75),(225,'课程信息',1,'com.ruoyi.tm.controller.CourseInfoController.add()','POST',1,'admin','软件工程学院','/tm/Course','127.0.0.1','内网IP','{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value','2024-07-08 09:03:32',5),(226,'课程信息',1,'com.ruoyi.tm.controller.CourseInfoController.add()','POST',1,'admin','软件工程学院','/tm/Course','127.0.0.1','内网IP','{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value','2024-07-08 09:05:46',191),(227,'课程信息',1,'com.ruoyi.tm.controller.CourseInfoController.add()','POST',1,'admin','软件工程学院','/tm/Course','127.0.0.1','内网IP','{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value','2024-07-08 09:12:56',8),(228,'课程信息',2,'com.ruoyi.tm.controller.CourseInfoController.edit()','PUT',1,'admin','软件工程学院','/tm/Course','127.0.0.1','内网IP','{\"credit\":4,\"facId\":1,\"finalMethod\":\"考试\",\"id\":1,\"name\":\"计算机组成原理\",\"params\":{},\"peoLimit\":50,\"startSem\":1,\"startYear\":21,\"teachId\":100,\"totTime\":201,\"type\":\"专必\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:18:52',9),(229,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','软件工程学院','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":2,\"name\":\"adm\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"admin\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.updateStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update stu_info          SET name = ?,             type = ?,             adm_method = ?,             in_school = ?,             stu_status = ?,             class_id = ?,             major_id = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2024-07-08 09:21:17',13),(230,'Student',2,'com.ruoyi.tm.controller.StuInfoController.edit()','PUT',1,'admin','软件工程学院','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"adm\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:21:22',6),(231,'专业',1,'com.ruoyi.tm.controller.MajorInfoController.add()','POST',1,'admin','软件工程学院','/tm/major','127.0.0.1','内网IP','{\"dura\":18,\"facId\":1,\"graScore\":90,\"id\":2,\"majChoose\":30,\"majMust\":20,\"name\":\"人工智能\",\"params\":{},\"pubChoose\":10,\"pubMust\":30}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:36:30',16),(232,'专业',3,'com.ruoyi.tm.controller.MajorInfoController.remove()','DELETE',1,'admin','软件工程学院','/tm/major/1','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`))\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\MajorInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.MajorInfoMapper.deleteMajorInfoByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from major_info where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`))','2024-07-08 09:50:06',9),(233,'专业',3,'com.ruoyi.tm.controller.MajorInfoController.remove()','DELETE',1,'admin','软件工程学院','/tm/major/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:50:08',4),(234,'教师信息',2,'com.ruoyi.tm.controller.TeaInfoController.edit()','PUT',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"id\":100,\"name\":\"吴老师\",\"params\":{},\"type\":\"教师\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\TeaInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.TeaInfoMapper.updateTeaInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update tea_info          SET name = ?,             type = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'\n; Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'','2024-07-08 10:12:35',10),(235,'选课',1,'com.ruoyi.tm.controller.ChooseCourseController.add()','POST',1,'admin','软件工程学院','/tm/choose','127.0.0.1','内网IP','{\"courseId\":3,\"deferSign\":0,\"numMakeup\":0,\"numRebuild\":0,\"params\":{},\"pass\":0,\"stuId\":160}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:18:29',10),(236,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/Course/index\",\"createTime\":\"2024-07-07 14:36:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"Course\",\"perms\":\"tm:Course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:23:30',13),(237,'教师信息',2,'com.ruoyi.tm.controller.TeaInfoController.edit()','PUT',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"id\":162,\"name\":\"Tea3\",\"params\":{},\"type\":\"教师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:33:24',5),(238,'课程信息',1,'com.ruoyi.tm.controller.CourseInfoController.add()','POST',1,'admin','软件工程学院','/tm/Course','127.0.0.1','内网IP','{\"credit\":5,\"facId\":1,\"finalMethod\":\"考试\",\"id\":9,\"name\":\"数据结构\",\"params\":{},\"peoLimit\":100,\"startSem\":2,\"startYear\":20,\"teachId\":100,\"totTime\":30,\"type\":\"专必\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 13:02:09',16),(239,'教师信息',1,'com.ruoyi.tm.controller.TeaInfoController.add()','POST',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"name\":\"洋溢辉\",\"params\":{}}',NULL,1,'Cannot invoke \"String.equals(Object)\" because the return value of \"com.ruoyi.tm.domain.TeaInfo.getType()\" is null','2024-07-08 13:20:53',75),(240,'教师信息',1,'com.ruoyi.tm.controller.TeaInfoController.add()','POST',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"id\":166,\"name\":\"洋溢辉\",\"params\":{},\"type\":\"教师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 13:27:34',94),(241,'教师信息',1,'com.ruoyi.tm.controller.TeaInfoController.add()','POST',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"id\":167,\"name\":\"钢铁侠\",\"params\":{},\"type\":\"教务老师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 13:28:38',88),(242,'教师信息',1,'com.ruoyi.tm.controller.TeaInfoController.add()','POST',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"id\":168,\"name\":\"超人强\",\"params\":{},\"type\":\"班主任\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 13:28:48',89),(243,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"indexTM\",\"createTime\":\"2024-07-06 20:11:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"管理员首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexTM\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:12:08',6),(244,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"normal_teacher\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教师首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"normal_teacher\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:13:44',10),(245,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"teacher_welcome\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"班主任首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"teacher_welcome\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:14:14',5),(246,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"index\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:14:44',7),(247,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2000,2001,2034,2035,2036,2037,2038,2039,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:16:31',22),(248,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2042,2034],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:16:54',15),(249,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2040,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:17:10',11),(250,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2041,2000,2001,2034,2035,2036,2037,2038,2039,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:17:20',10),(251,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"微电子学院\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"lan\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:19:00',20),(252,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:39:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"人工智能学院\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"15@qq.com\",\"loginIp\":\"\",\"nickName\":\"苏老师\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[103],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"苏老师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:19:38',11),(253,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:40:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"人工智能学院\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"156@qq.com\",\"loginIp\":\"\",\"nickName\":\"吴某\",\"params\":{},\"phonenumber\":\"15094826584\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"吴老师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:19:43',9),(254,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','软件工程学院','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:31:17',81),(255,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','软件工程学院','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:31:24',78),(256,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','软件工程学院','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":157}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 14:31:31',79),(257,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','软件工程学院','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"class_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 15:34:20',71),(258,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','软件工程学院','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"info\",\"className\":\"ClassInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"班级id\",\"columnId\":49,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Grade\",\"columnComment\":\"所在年级\",\"columnId\":50,\"columnName\":\"grade\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"grade\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TeachId\",\"columnComment\":\"班主任id\",\"columnId\":51,\"columnName\":\"teach_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teachId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassNum\",\"columnComment\":\"班号\",\"columnId\":52,\"columnName\":\"class_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classNum\",\"javaType\":\"Long\",\"list\":tr','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 15:35:00',24),(259,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','软件工程学院','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"Class\",\"className\":\"ClassInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"班级id\",\"columnId\":49,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-07-08 15:35:00\",\"usableColumn\":false},{\"capJavaField\":\"Grade\",\"columnComment\":\"所在年级\",\"columnId\":50,\"columnName\":\"grade\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"grade\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-07-08 15:35:00\",\"usableColumn\":false},{\"capJavaField\":\"TeachId\",\"columnComment\":\"班主任id\",\"columnId\":51,\"columnName\":\"teach_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teachId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-07-08 15:35:00\",\"usableColumn\":false},{\"capJavaField\":\"ClassNum\",\"columnComment\":\"班号\",\"columnId\":52,\"columnName\":\"class_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 15:36:00',11),(260,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','软件工程学院','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"class_info\"}',NULL,0,NULL,'2024-07-08 15:36:03',291),(261,'选课',1,'com.ruoyi.tm.controller.ChooseCourseController.add()','POST',1,'admin','软件工程学院','/tm/choose','127.0.0.1','内网IP','{\"courseId\":1,\"deferSign\":0,\"numMakeup\":0,\"numRebuild\":0,\"params\":{},\"pass\":1,\"stuId\":157}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 19:21:49',14),(262,'教师信息',2,'com.ruoyi.tm.controller.TeaInfoController.edit()','PUT',1,'admin','软件工程学院','/tm/teacher','127.0.0.1','内网IP','{\"id\":168,\"name\":\"超人强\",\"params\":{},\"type\":\"教师\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 21:39:19',12),(263,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Student导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"perms\":\"system:info:import\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:50:45',100),(264,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/score/index\",\"createTime\":\"2024-06-12 19:10:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"成绩\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"score\",\"perms\":\"tm:score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:51:23',10),(265,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','软件工程学院','/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-07-09 00:51:30',7),(266,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2040,2001,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:51:50',31),(267,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2027,2001,2034,2035,2036,2037,2038,2039,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:52:03',22),(268,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2041,2001,2034,2035,2036,2037,2038,2039,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:52:10',14),(269,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','软件工程学院','/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:52:19',8),(270,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"专业导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2009,\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:55:50',14),(271,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-09 00:55:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"专业导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2009,\"path\":\"\",\"perms\":\"tm:major:import\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:56:03',10),(272,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教师信息导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2015,\"perms\":\"tm:teacher:import\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:56:38',15),(273,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"选课导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2021,\"perms\":\"tm:choose:import\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 00:59:05',15),(274,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程信息导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2028,\"perms\":\"tm:Course:import\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:00:31',15),(275,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"班级信息导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2043,\"perms\":\"tm:Class:import\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:03:48',13),(276,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2015,2028,2043,2042,2034,2038,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:06:48',22),(277,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:13:37',18),(278,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2000,2001,2034,2035,2036,2037,2038,2039,2003,2004,2005,2006,2007,2008,2049,2009,2010,2011,2012,2013,2014,2050,2015,2016,2017,2018,2019,2020,2051,2021,2022,2023,2024,2025,2026,2052,2028,2029,2030,2031,2032,2033,2053,2043,2044,2045,2046,2047,2048,2054],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:20:27',13),(279,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2041,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:21:24',12),(280,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:21:36',18),(281,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/score/stuindex\",\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"stuscore\",\"perms\":\"tm:score:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:40:27',22),(282,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','软件工程学院','/system/menu/2055','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:42:11',18),(283,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tm/score/stuindex\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"stuscore\",\"perms\":\"tm:score:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:43:02',16),(284,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2015,2028,2043,2042,2034,2038,2056,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:45:39',27),(285,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2056,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:45:48',22),(286,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2000,2001,2034,2035,2036,2037,2038,2039,2056,2003,2004,2005,2006,2007,2008,2049,2009,2010,2011,2012,2013,2014,2050,2015,2016,2017,2018,2019,2020,2051,2021,2022,2023,2024,2025,2026,2052,2028,2029,2030,2031,2032,2033,2053,2043,2044,2045,2046,2047,2048,2054],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:46:05',15),(287,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2041,2001,2034,2035,2036,2037,2038,2039,2056,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:46:17',11),(288,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:50:04',12),(289,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2027,2001,2034,2035,2036,2037,2038,2039,2003,2004,2005,2006,2007,2008,2049,2009,2010,2011,2012,2013,2014,2050,2015,2016,2017,2018,2019,2020,2051,2021,2022,2023,2024,2025,2026,2052,2028,2029,2030,2031,2032,2033,2053,2043,2044,2045,2046,2047,2048,2054],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:50:12',15),(290,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2041,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:50:20',18),(291,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩查询\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2056,\"perms\":\"tm:score:query\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:58:20',5),(292,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','软件工程学院','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2056,\"perms\":\"tm:score:detail\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 01:59:08',6),(293,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2015,2028,2043,2042,2034,2038,2056,2057,2058,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 02:01:57',19),(294,'Student',1,'com.ruoyi.tm.controller.StuInfoController.add()','POST',1,'admin','软件工程学院','/system/info','127.0.0.1','内网IP','{\"admMethod\":\"普通统考\",\"classId\":2,\"id\":172,\"inSchool\":0,\"majorId\":2,\"name\":\"test\",\"params\":{},\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"test\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 02:08:25',80),(295,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','软件工程学院','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2009,2015,2028,2043,2042,2056,2057,2058,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 02:10:17',10);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-05-31 23:32:47','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-05-31 23:32:47','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-05-31 23:32:47','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-05-31 23:32:47','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE,
  KEY `role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-05-31 23:32:47','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-05-31 23:32:47','admin','2024-07-08 00:36:12','普通角色'),(100,'学生','student',3,'1',1,1,'0','0','admin','2024-06-21 08:50:06','admin','2024-07-09 02:10:17','学生的权限'),(101,'教师','teacher',4,'1',1,1,'0','0','admin','2024-06-21 08:50:55','admin','2024-07-09 01:50:04','教师权限'),(102,'教务老师','m_teacher',5,'1',1,1,'0','0','admin','2024-06-21 08:51:36','admin','2024-07-09 01:50:12','教务老师权限'),(103,'班主任','ClassTeacher',6,'1',1,1,'0','0','admin','2024-07-05 21:10:36','admin','2024-07-09 01:50:20','班主任权限');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2000),(2,2001),(2,2027),(100,2000),(100,2009),(100,2010),(100,2014),(100,2015),(100,2016),(100,2020),(100,2028),(100,2029),(100,2033),(100,2042),(100,2043),(100,2044),(100,2048),(100,2056),(100,2057),(100,2058),(101,2000),(101,2001),(101,2003),(101,2004),(101,2008),(101,2009),(101,2010),(101,2014),(101,2015),(101,2016),(101,2020),(101,2021),(101,2022),(101,2026),(101,2028),(101,2029),(101,2033),(101,2034),(101,2035),(101,2036),(101,2037),(101,2038),(101,2039),(101,2040),(101,2043),(101,2044),(101,2048),(102,2000),(102,2001),(102,2003),(102,2004),(102,2005),(102,2006),(102,2007),(102,2008),(102,2009),(102,2010),(102,2011),(102,2012),(102,2013),(102,2014),(102,2015),(102,2016),(102,2017),(102,2018),(102,2019),(102,2020),(102,2021),(102,2022),(102,2023),(102,2024),(102,2025),(102,2026),(102,2027),(102,2028),(102,2029),(102,2030),(102,2031),(102,2032),(102,2033),(102,2034),(102,2035),(102,2036),(102,2037),(102,2038),(102,2039),(102,2043),(102,2044),(102,2045),(102,2046),(102,2047),(102,2048),(102,2049),(102,2050),(102,2051),(102,2052),(102,2053),(102,2054),(103,2000),(103,2001),(103,2003),(103,2004),(103,2008),(103,2009),(103,2010),(103,2014),(103,2015),(103,2016),(103,2020),(103,2021),(103,2022),(103,2026),(103,2028),(103,2029),(103,2033),(103,2034),(103,2035),(103,2036),(103,2037),(103,2038),(103,2039),(103,2041),(103,2043),(103,2044),(103,2048);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-09 02:10:00','admin','2024-05-31 23:32:47','','2024-07-09 02:10:00','管理员'),(2,103,'lan','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-08 14:30:32','admin','2024-05-31 23:32:47','admin','2024-07-08 14:30:32','测试员'),(3,NULL,'Anna','Anna','00','','','0','','$2a$10$loageCSXcUr8M7LC0sc0m.Lan93ifAKAlwDkVeTnPFgkiML0u2Rvy','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'教务老师'),(4,NULL,'James','James','00','','','0','','$2a$10$/sgDCJ.VbCZMs/Vnd2CYUeRYeAL6U4JErnFrw/tIduT3ukar.QS1O','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'班主任'),(5,NULL,'Poul','Poul','00','','','0','','$2a$10$UcPoIs1IbCF8YGwakzWbhOl4KxRGsgtWJMTB9Yhzab32kaOqGmYya','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'班主任'),(6,NULL,'John','John','00','','','0','','$2a$10$69h39RmXCjNFejabAcD/v.0nLueHf0qYs0m1xRsykLeQVPxX3VNcm','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'班主任'),(7,NULL,'Andy','Andy','00','','','0','','$2a$10$60QR4T8awQmVvEOgk8dorODoGjDpxRMFAHA2LEvKD0bBjRgRKXCWW','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'教师'),(8,NULL,'Alex','Alex','00','','','0','','$2a$10$fP5vtIp.x9rKvtiPsySNpu.gWPRzCD57dfRVhk/XPyKNpCqoNjoKW','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'教师'),(9,NULL,'Ben','Ben','00','','','0','','$2a$10$GMbMpoE4rgWpcSR042ZYZuzp0AmdXsggqkFT/32xUunni8T52hN.O','0','0','',NULL,NULL,'2024-07-08 22:27:51','',NULL,'教师'),(10,NULL,'Chris','Chris','00','','','0','','$2a$10$dCIWuEanCiIOmO9Xm7ZWkuCqkRQDJvtzkeXd2LSA6XiJ9ymrKmBPq','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(11,NULL,'Daniel','Daniel','00','','','0','','$2a$10$Ej1.banTHqQHtYhlKm6U6eMJY8itBqssbSrjr6ewZWIwlbgjFjaV2','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(12,NULL,'Eva','Eva','00','','','0','','$2a$10$DDZZXzFafk6SVdI1fUsvkucq6BO6XDMfXFHdJ6yeptKDKJmh9Z.9.','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(13,NULL,'Frank','Frank','00','','','0','','$2a$10$0xnAljtkaofLJ6BTx0U11.jpCEIQVORo8IgKwPRqfvEH.kCq19Hw2','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(14,NULL,'George','George','00','','','0','','$2a$10$qHgXJwjAcG2.MvNwycucGeXag1oR5xQDjMu/oNfRabOfJr/4I/f6e','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(15,NULL,'Hank','Hank','00','','','0','','$2a$10$bjiR1mzl8uu0o.Pg6vnxgu6eD37TVt1pFn/HAgciTks063q/gCMVq','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(16,NULL,'iPhone','iPhone','00','','','0','','$2a$10$EmuGcf3Rkx2VgTemV17qeOPsF6ZxdtfD7VQLYg8m57U8QXD2.4kNa','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(17,NULL,'Jack','Jack','00','','','0','','$2a$10$HkERKNzcQJx5QJLsAYeNVOHBnRlAM.6UXVX3YGMoslV6qSZgTTXxG','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(18,NULL,'Kevin','Kevin','00','','','0','','$2a$10$YfNwk.cHXCQn57yycJXGROEiobCNn//ahhClI.yWjDQOMYN3jbZlW','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(19,NULL,'Mark','Mark','00','','','0','','$2a$10$zKIVmgI4TRHcN7UBKa7iRO4pzMYLkDJGcgbogV3DoCbuA8hooHcvS','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(20,NULL,'Nick','Nick','00','','','0','','$2a$10$1Fpa120Q26iVCJequrpSwuxbP4ZDtwZWLiQg0mfJ43fm5ct.qIE8.','0','0','',NULL,NULL,'2024-07-08 22:27:52','',NULL,'教师'),(21,NULL,'Oliver','Oliver','00','','','0','','$2a$10$f4yRe5Sy/rrsdazc2liEU.jrugUZDYY3AoErrwkJKbwUtdqyeBKGK','0','0','',NULL,NULL,'2024-07-08 22:27:53','',NULL,'教师'),(22,NULL,'Peter','Peter','00','','','0','','$2a$10$DSo05JquIzJczJaV4GCuquCa8eOJzjUz/sE04CrBSTBXStxdGJ6Z2','0','0','',NULL,NULL,'2024-07-08 22:27:53','',NULL,'教师'),(23,NULL,'Randy','Randy','00','','','0','','$2a$10$gyT98MReymsr1NJ3WlKoS.qbkq8aqOaLPl2c1fEa3UN83JtBZ6DFK','0','0','',NULL,NULL,'2024-07-08 22:27:53','',NULL,'教师'),(24,NULL,'Sam','Sam','00','','','0','','$2a$10$P3eSOYhgr7iYUZmc5CfNyOl5lp7DvrwedeU2j7MokUMJH4kzT.G.O','0','0','',NULL,NULL,'2024-07-08 22:27:53','',NULL,'教师'),(25,NULL,'Tim','Tim','00','','','0','','$2a$10$maw6gA0LP1qFyB540XJIV.uawWqbU9L7uHk6E8Qh//RDxwcBgdMoq','0','0','127.0.0.1','2024-07-09 01:52:11',NULL,'2024-07-08 22:27:53','','2024-07-09 01:52:11','教师'),(26,NULL,'Willian','Willian','00','','','0','','$2a$10$IGMx6lPNlJ70/6m1HfWNdu8WbX4esZ1tIVGnlFdRyrrp9VoORozxW','0','0','',NULL,NULL,'2024-07-08 22:27:53','',NULL,'教师'),(172,2,'test','test','00',NULL,NULL,NULL,NULL,'$2a$10$wPSsE9eMIwXKdDIKBe5MNu5bSmBZokSCRbUhr7N06Sth6y0UdictW','0','0','127.0.0.1','2024-07-09 02:08:48',NULL,'2024-07-09 02:08:25','','2024-07-09 02:08:48','学生');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(100,4),(101,4);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,102),(3,102),(4,103),(5,103),(6,103),(7,101),(8,101),(9,101),(10,103),(11,103),(12,103),(13,101),(14,101),(15,101),(16,101),(17,101),(18,101),(19,101),(20,101),(21,101),(22,101),(23,101),(24,101),(25,101),(26,101),(172,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tea_info`
--

DROP TABLE IF EXISTS `tea_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tea_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师姓名',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_name` (`name`) USING BTREE,
  KEY `fl_type` (`type`) USING BTREE,
  CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fl_type` FOREIGN KEY (`type`) REFERENCES `sys_role` (`role_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tea_info`
--

LOCK TABLES `tea_info` WRITE;
/*!40000 ALTER TABLE `tea_info` DISABLE KEYS */;
INSERT INTO `tea_info` VALUES (2,'lan','教务老师'),(3,'Anna','教务老师'),(4,'James','班主任'),(5,'Poul','班主任'),(6,'John','班主任'),(7,'Andy','教师'),(8,'Alex','教师'),(9,'Ben','教师'),(10,'Chris','班主任'),(11,'Daniel','班主任'),(12,'Eva','班主任'),(13,'Frank','教师'),(14,'George','教师'),(15,'Hank','教师'),(16,'iPhone','教师'),(17,'Jack','教师'),(18,'Kevin','教师'),(19,'Mark','教师'),(20,'Nick','教师'),(21,'Oliver','教师'),(22,'Peter','教师'),(23,'Randy','教师'),(24,'Sam','教师'),(25,'Tim','教师'),(26,'Willian','教师');
/*!40000 ALTER TABLE `tea_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-09  2:10:40
