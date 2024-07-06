/*
 Navicat Premium Dump SQL

 Source Server         : tm_connect
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : tm_db

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 06/07/2024 16:14:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for choose_course
-- ----------------------------
DROP TABLE IF EXISTS `choose_course`;
CREATE TABLE `choose_course`  (
  `id` int NOT NULL COMMENT '选课id',
  `num_rebuild` int NOT NULL COMMENT '重修次数',
  `num_makeup` int NOT NULL COMMENT '补考次数',
  `defer_sign` int NOT NULL COMMENT '缓考标志',
  `pass` int NOT NULL COMMENT '通过标志(0为通过，1为不通过)',
  `stu_id` int NOT NULL COMMENT '学生id',
  `course_id` int NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_stu_idx`(`stu_id` ASC) USING BTREE,
  INDEX `fk_course_idx`(`course_id` ASC) USING BTREE,
  UNIQUE INDEX `stu_id`(`stu_id` ASC, `course_id` ASC) USING BTREE,
  CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_stu` FOREIGN KEY (`stu_id`) REFERENCES `stu_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '选课表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choose_course
-- ----------------------------
INSERT INTO `choose_course` VALUES (1, 0, 0, 0, 1, 1, 1);
INSERT INTO `choose_course` VALUES (2, 0, 0, 0, 1, 1, 3);
INSERT INTO `choose_course` VALUES (3, 0, 0, 0, 1, 1, 4);
INSERT INTO `choose_course` VALUES (4, 0, 0, 0, 1, 1, 5);
INSERT INTO `choose_course` VALUES (5, 0, 0, 0, 0, 1, 2);
INSERT INTO `choose_course` VALUES (6, 0, 0, 0, 0, 157, 5);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `id` int NOT NULL COMMENT '班级id',
  `grade` int NOT NULL COMMENT '所在年级',
  `teach_id` int NOT NULL COMMENT '班主任id',
  `class_num` int NOT NULL COMMENT '班号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_class_idx`(`teach_id` ASC) USING BTREE,
  CONSTRAINT `fk_class` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '班级信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (1, 21, 100, 0);

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info`  (
  `id` int NOT NULL COMMENT '课程id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名字',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类型（专必、专选、公必、公选）',
  `peo_limit` int NOT NULL COMMENT '人数限制',
  `credit` int NOT NULL COMMENT '学分',
  `tot_time` int NOT NULL COMMENT '总学时',
  `final_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '期末考试方法(考试还是考察)',
  `start_year` int NOT NULL COMMENT '开办学年',
  `start_sem` int NOT NULL COMMENT '开办学期',
  `fac_id` int NOT NULL COMMENT '开办学院id',
  `teach_id` int NOT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_fac`(`fac_id` ASC) USING BTREE,
  INDEX `fk_teach`(`teach_id` ASC) USING BTREE,
  CONSTRAINT `fk_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculties_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_teach` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES (1, '计算机组成原理', '专必', 50, 4, 20, '考试', 21, 1, 1, 100);
INSERT INTO `course_info` VALUES (2, '操作系统', '专必', 50, 5, 40, '考试', 21, 1, 1, 100);
INSERT INTO `course_info` VALUES (3, '云计算', '专选', 10, 3, 10, '考察', 21, 1, 1, 101);
INSERT INTO `course_info` VALUES (4, '大学英语', '公必', 30, 3, 20, '考试', 20, 2, 1, 101);
INSERT INTO `course_info` VALUES (5, '排球', '公选', 30, 2, 20, '考察', 19, 3, 1, 100);

-- ----------------------------
-- Table structure for faculties_info
-- ----------------------------
DROP TABLE IF EXISTS `faculties_info`;
CREATE TABLE `faculties_info`  (
  `id` int NOT NULL COMMENT '专业id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业名字',
  `campus` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属学院',
  `teach_id` int NOT NULL COMMENT '该专业教务老师id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teach_id_idx`(`teach_id` ASC) USING BTREE,
  CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faculties_info
-- ----------------------------
INSERT INTO `faculties_info` VALUES (1, '软件工程学院', '珠海校区', 2);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'stu_info', '学生信息表', NULL, NULL, 'StuInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'info', 'Student', 'clement', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24', NULL);
INSERT INTO `gen_table` VALUES (2, 'score_info', '学生成绩表', NULL, NULL, 'ScoreInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'score', '成绩管理', 'clement', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50', NULL);
INSERT INTO `gen_table` VALUES (3, 'tea_info', '教师信息', NULL, NULL, 'TeaInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'teacher', '教师信息', 'clement', '0', '/', '{}', 'admin', '2024-06-22 13:48:44', '', '2024-07-06 07:52:41', NULL);
INSERT INTO `gen_table` VALUES (4, 'major_info', '专业信息', NULL, NULL, 'MajorInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'major', '专业', 'clement', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47', NULL);
INSERT INTO `gen_table` VALUES (5, 'choose_course', '选课信息表', NULL, NULL, 'ChooseCourse', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'choose', '选课', 'clement', '0', '/', '{}', 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '学生id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '学生姓名', 'varchar(45)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (3, 1, 'sex', '学生性别', 'int', 'Long', 'sex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (4, 1, 'type', '学生类型', 'varchar(45)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (5, 1, 'adm_method', '入学方法', 'varchar(45)', 'String', 'admMethod', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (6, 1, 'in_school', '是否在校', 'int', 'Long', 'inSchool', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (7, 1, 'stu_status', '学生状态', 'int', 'Long', 'stuStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (8, 1, 'class_id', '班级id', 'int', 'Long', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (9, 1, 'major_id', '专业id', 'int', 'Long', 'majorId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24');
INSERT INTO `gen_table_column` VALUES (10, 2, 'id', '成绩id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (11, 2, 'usual_por', '平时成绩占比', 'int', 'Long', 'usualPor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (12, 2, 'usual_sco', '平时成绩', 'int', 'Long', 'usualSco', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (13, 2, 'mid_por', '期中成绩占比', 'int', 'Long', 'midPor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (14, 2, 'mid_sco', '期中成绩', 'int', 'Long', 'midSco', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (15, 2, 'final_por', '期末成绩占比', 'int', 'Long', 'finalPor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (16, 2, 'final_sco', '期末成绩', 'int', 'Long', 'finalSco', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (17, 2, 'others', '其他备注', 'varchar(45)', 'String', 'others', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (18, 2, 'choose_id', '选课id', 'int', 'Long', 'chooseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50');
INSERT INTO `gen_table_column` VALUES (19, 3, 'id', '教师id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-22 13:48:44', '', '2024-07-06 07:52:41');
INSERT INTO `gen_table_column` VALUES (20, 3, 'name', '教师姓名', 'varchar(45)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-06-22 13:48:44', '', '2024-07-06 07:52:41');
INSERT INTO `gen_table_column` VALUES (21, 3, 'type', '教师类型', 'varchar(45)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-06-22 13:48:44', '', '2024-07-06 07:52:41');
INSERT INTO `gen_table_column` VALUES (22, 4, 'id', '专业id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (23, 4, 'name', '专业姓名', 'varchar(45)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (24, 4, 'dura', '专业开设时间', 'int', 'Long', 'dura', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (25, 4, 'maj_must', '毕业所需专必学分', 'int', 'Long', 'majMust', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (26, 4, 'maj_choose', '所需专选学分', 'int', 'Long', 'majChoose', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (27, 4, 'pub_must', '所需公必学分', 'int', 'Long', 'pubMust', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (28, 4, 'pub_choose', '所需公选学分', 'int', 'Long', 'pubChoose', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (29, 4, 'gra_score', '毕业所需学分', 'int', 'Long', 'graScore', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (30, 4, 'fac_id', '所属学院id', 'int', 'Long', 'facId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47');
INSERT INTO `gen_table_column` VALUES (31, 5, 'id', '选课id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');
INSERT INTO `gen_table_column` VALUES (32, 5, 'num_rebuild', '重修次数', 'int', 'Long', 'numRebuild', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');
INSERT INTO `gen_table_column` VALUES (33, 5, 'num_makeup', '补考次数', 'int', 'Long', 'numMakeup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');
INSERT INTO `gen_table_column` VALUES (34, 5, 'defer_sign', '缓考标志', 'int', 'Long', 'deferSign', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');
INSERT INTO `gen_table_column` VALUES (35, 5, 'pass', '通过标志(0为通过，1为不通过)', 'int', 'Long', 'pass', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');
INSERT INTO `gen_table_column` VALUES (36, 5, 'stu_id', '学生id', 'int', 'Long', 'stuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');
INSERT INTO `gen_table_column` VALUES (37, 5, 'course_id', '课程id', 'int', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37');

-- ----------------------------
-- Table structure for major_info
-- ----------------------------
DROP TABLE IF EXISTS `major_info`;
CREATE TABLE `major_info`  (
  `id` int NOT NULL COMMENT '专业id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业姓名',
  `dura` int NOT NULL,
  `maj_must` int NOT NULL COMMENT '毕业所需专必学分',
  `maj_choose` int NOT NULL COMMENT '所需专选学分',
  `pub_must` int NOT NULL COMMENT '所需公必学分',
  `pub_choose` int NOT NULL COMMENT '所需公选学分',
  `gra_score` int NOT NULL COMMENT '毕业所需学分',
  `fac_id` int NOT NULL COMMENT '所属学院id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `major_info_ibfk_1`(`fac_id` ASC) USING BTREE,
  CONSTRAINT `major_info_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculties_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major_info
-- ----------------------------
INSERT INTO `major_info` VALUES (1, '软件工程', 21, 106, 24, 37, 8, 175, 1);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for score_info
-- ----------------------------
DROP TABLE IF EXISTS `score_info`;
CREATE TABLE `score_info`  (
  `id` int NOT NULL,
  `usual_por` int NOT NULL,
  `usual_sco` int NOT NULL,
  `mid_por` int NOT NULL,
  `mid_sco` int NOT NULL,
  `final_por` int NOT NULL,
  `final_sco` int NOT NULL,
  `others` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `choose_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_course_idx`(`choose_id` ASC) USING BTREE,
  CONSTRAINT `score_info_ibfk_1` FOREIGN KEY (`choose_id`) REFERENCES `choose_course` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score_info
-- ----------------------------
INSERT INTO `score_info` VALUES (1, 50, 100, 0, 0, 50, 100, '0', 1);
INSERT INTO `score_info` VALUES (2, 40, 100, 0, 0, 60, 89, '0', 2);
INSERT INTO `score_info` VALUES (3, 30, 70, 0, 0, 70, 95, '0', 3);
INSERT INTO `score_info` VALUES (4, 20, 100, 20, 100, 60, 76, '0', 4);
INSERT INTO `score_info` VALUES (5, 20, 100, 20, 100, 60, 100, '0', 6);

-- ----------------------------
-- Table structure for stu_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info`  (
  `id` int NOT NULL COMMENT '学生id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生姓名',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生类型',
  `adm_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入学方式',
  `in_school` int NULL DEFAULT NULL COMMENT '是否在校（0在校，1不在校）',
  `stu_status` int NULL DEFAULT NULL COMMENT '学生状态（0正常，1异常3）',
  `class_id` int NOT NULL COMMENT '班级id',
  `major_id` int NOT NULL COMMENT '专业id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_classid`(`class_id` ASC) USING BTREE,
  INDEX `fk_majorid`(`major_id` ASC) USING BTREE,
  CONSTRAINT `fk_classid` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES (1, 'adm', '普通考生', '一般统考', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (2, '李四', '普通本科', NULL, 1, NULL, 1, 1);
INSERT INTO `stu_info` VALUES (3, '李四', '普通本科', NULL, 1, NULL, 1, 1);
INSERT INTO `stu_info` VALUES (4, '李四', '普通本科', '1', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (125, '王灵', '双一流高校学子', '2', 2, 0, 1, 1);
INSERT INTO `stu_info` VALUES (126, '李佶', '双一流高校学子', '2', 2, 0, 1, 1);
INSERT INTO `stu_info` VALUES (127, '李佶', '双一流高校学子', '2', 2, 0, 1, 1);
INSERT INTO `stu_info` VALUES (128, '李佶', '双一流高校学子', '2', 2, 0, 1, 1);
INSERT INTO `stu_info` VALUES (129, 'siri', '研究生', '普通考试', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (130, 'suney', '研究生', '普通考试', 0, 0, 1, 1);
INSERT INTO `stu_info` VALUES (131, '小番', '本科生', '普通考试', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (132, '星宇', '本科生', '普通考试', 1, 0, 1, 1);
INSERT INTO `stu_info` VALUES (133, 'siri', '研究生', '普通考试', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (134, 'suney', '研究生', '普通考试', 0, 0, 1, 1);
INSERT INTO `stu_info` VALUES (135, '小番', '本科生', '普通考试', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (136, '星宇', '本科生', '普通考试', 1, 0, 1, 1);
INSERT INTO `stu_info` VALUES (137, 'siri', '研究生', '普通考试', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (138, 'suney', '研究生', '普通考试', 0, 0, 1, 1);
INSERT INTO `stu_info` VALUES (139, '小番', '本科生', '普通考试', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (140, '星宇', '本科生', '普通考试', 1, 0, 1, 1);
INSERT INTO `stu_info` VALUES (141, 'siri', '研究生', '普通考试', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (142, 'suney', '研究生', '普通考试', 0, 0, 1, 1);
INSERT INTO `stu_info` VALUES (143, '小番', '本科生', '普通考试', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (144, '星宇', '本科生', '普通考试', 1, 0, 1, 1);
INSERT INTO `stu_info` VALUES (145, 'siri', '研究生', '普通考试', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (146, 'suney', '研究生', '普通考试', 0, 0, 1, 1);
INSERT INTO `stu_info` VALUES (147, '小番', '本科生', '普通考试', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (148, '星宇', '本科生', '普通考试', 1, 0, 1, 1);
INSERT INTO `stu_info` VALUES (149, 'siri', '研究生', '普通考试', 0, 1, 1, 1);
INSERT INTO `stu_info` VALUES (150, 'suney', '研究生', '普通考试', 0, 0, 1, 1);
INSERT INTO `stu_info` VALUES (151, '大番', '本科生', '普通考试', 1, 1, 1, 1);
INSERT INTO `stu_info` VALUES (152, '星宇', '本科生', '普通考试', 1, 0, 1, 1);
INSERT INTO `stu_info` VALUES (157, 'test', '1', '1', 1, 1, 1, 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '中山大学', 0, '钟明廷', '15888888888', 'test@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-06-21 09:31:50');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-31 23:32:48', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-31 23:32:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-31 23:32:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-31 23:32:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-01 14:57:00');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 14:57:06');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 19:38:20');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 20:47:42');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-01 20:49:57');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 20:50:02');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 11:02:00');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 12:24:40');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 13:33:34');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 16:36:27');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-20 22:17:53');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-20 22:17:58');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 08:48:53');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 12:46:00');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-22 13:11:37');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-22 13:11:44');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 15:11:31');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 17:09:19');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 18:32:48');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 19:59:30');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 20:25:19');
INSERT INTO `sys_logininfor` VALUES (121, '129', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-05 20:25:36');
INSERT INTO `sys_logininfor` VALUES (122, '129', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 20:25:43');
INSERT INTO `sys_logininfor` VALUES (123, '129', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 20:26:17');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-05 20:26:29');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-05 20:29:38');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 20:29:42');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 20:33:49');
INSERT INTO `sys_logininfor` VALUES (128, '129', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 20:33:59');
INSERT INTO `sys_logininfor` VALUES (129, '129', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 20:34:18');
INSERT INTO `sys_logininfor` VALUES (130, '129', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-05 20:34:22');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 20:34:31');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 20:48:47');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 20:50:20');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 22:32:46');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 22:32:52');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 07:25:46');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:25:18');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 11:28:50');
INSERT INTO `sys_logininfor` VALUES (139, '157', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-06 11:29:03');
INSERT INTO `sys_logininfor` VALUES (140, '157', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-06 11:29:24');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:29:43');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 11:29:48');
INSERT INTO `sys_logininfor` VALUES (143, '157', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-06 11:29:57');
INSERT INTO `sys_logininfor` VALUES (144, '157', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 11:29:59');
INSERT INTO `sys_logininfor` VALUES (145, '157', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-06 11:30:04');
INSERT INTO `sys_logininfor` VALUES (146, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 11:30:32');
INSERT INTO `sys_logininfor` VALUES (147, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-06 11:30:37');
INSERT INTO `sys_logininfor` VALUES (148, 'test2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:30:48');
INSERT INTO `sys_logininfor` VALUES (149, 'test2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 11:31:48');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:31:53');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 13:43:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-05-31 23:32:47', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-31 23:32:47', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-05-31 23:32:47', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2024-05-31 23:32:47', 'admin', '2024-06-14 15:49:59', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-31 23:32:47', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-31 23:32:47', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-31 23:32:47', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-31 23:32:47', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-31 23:32:47', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-31 23:32:47', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-31 23:32:47', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-31 23:32:47', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-05-31 23:32:47', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-31 23:32:47', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-31 23:32:47', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-05-31 23:32:47', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-31 23:32:47', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-31 23:32:47', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-31 23:32:47', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-05-31 23:32:47', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-31 23:32:47', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-31 23:32:47', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-31 23:32:47', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-31 23:32:47', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '成绩分析', 0, 0, 'tm', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2024-06-12 19:09:17', 'admin', '2024-06-12 19:11:59', '');
INSERT INTO `sys_menu` VALUES (2001, '成绩', 2000, 0, 'score', 'tm/score/index', NULL, 1, 0, 'C', '0', '0', 'tm:score:query', '#', 'admin', '2024-06-12 19:10:25', 'admin', '2024-06-12 19:13:42', '');
INSERT INTO `sys_menu` VALUES (2002, '学分图', 2000, 1, 'analysis', 'tm/analysis/index', NULL, 1, 0, 'C', '0', '0', 'tm:score:query', '#', 'admin', '2024-06-12 19:19:26', 'admin', '2024-06-12 19:21:58', '');
INSERT INTO `sys_menu` VALUES (2003, '学生信息', 2000, 1, 'info', 'tm/info/index', NULL, 1, 0, 'C', '0', '0', 'tm:info:list', '#', 'admin', '2024-06-18 13:48:44', 'admin', '2024-07-05 18:56:38', 'Student菜单');
INSERT INTO `sys_menu` VALUES (2004, 'Student查询', 2003, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:info:query', '#', 'admin', '2024-06-18 13:48:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, 'Student新增', 2003, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:info:add', '#', 'admin', '2024-06-18 13:48:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, 'Student修改', 2003, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:info:edit', '#', 'admin', '2024-06-18 13:48:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, 'Student删除', 2003, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:info:remove', '#', 'admin', '2024-06-18 13:48:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, 'Student导出', 2003, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:info:export', '#', 'admin', '2024-06-18 13:48:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '专业', 2000, 1, 'major', 'tm/major/index', NULL, 1, 0, 'C', '0', '0', 'tm:major:list', '#', 'admin', '2024-07-06 07:46:41', '', NULL, '专业菜单');
INSERT INTO `sys_menu` VALUES (2010, '专业查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:major:query', '#', 'admin', '2024-07-06 07:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '专业新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:major:add', '#', 'admin', '2024-07-06 07:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '专业修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:major:edit', '#', 'admin', '2024-07-06 07:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '专业删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:major:remove', '#', 'admin', '2024-07-06 07:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '专业导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:major:export', '#', 'admin', '2024-07-06 07:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '教师信息', 2000, 1, 'teacher', 'tm/teacher/index', NULL, 1, 0, 'C', '0', '0', 'tm:teacher:list', '#', 'admin', '2024-07-06 08:10:08', 'admin', '2024-07-06 08:10:50', '教师信息菜单');
INSERT INTO `sys_menu` VALUES (2016, '教师信息查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:teacher:query', '#', 'admin', '2024-07-06 08:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '教师信息新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:teacher:add', '#', 'admin', '2024-07-06 08:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '教师信息修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:teacher:edit', '#', 'admin', '2024-07-06 08:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '教师信息删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:teacher:remove', '#', 'admin', '2024-07-06 08:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '教师信息导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:teacher:export', '#', 'admin', '2024-07-06 08:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '选课', 2000, 1, 'choose', 'tm/choose/index', NULL, 1, 0, 'C', '0', '0', 'tm:choose:list', '#', 'admin', '2024-07-06 08:14:21', 'admin', '2024-07-06 08:15:54', '选课菜单');
INSERT INTO `sys_menu` VALUES (2022, '选课查询', 2021, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:choose:query', '#', 'admin', '2024-07-06 08:14:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '选课新增', 2021, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:choose:add', '#', 'admin', '2024-07-06 08:14:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '选课修改', 2021, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:choose:edit', '#', 'admin', '2024-07-06 08:14:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '选课删除', 2021, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:choose:remove', '#', 'admin', '2024-07-06 08:14:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '选课导出', 2021, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:choose:export', '#', 'admin', '2024-07-06 08:14:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-31 23:32:48', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-31 23:32:48', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"email\":\"15@qq.com\",\"nickName\":\"苏某\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"苏某人\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-01 19:39:51', 86);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"email\":\"156@qq.com\",\"nickName\":\"吴某\",\"params\":{},\"phonenumber\":\"15094826584\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"吴某人\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-01 19:40:49', 74);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"stu_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-18 11:04:33', 76);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"StuInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学生id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"学生姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"学生性别\",\"columnId\":3,\"columnName\":\"sex\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"学生类型\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-18 11:06:10', 74);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_info\"}', NULL, 0, NULL, '2024-06-18 11:06:15', 353);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"StuInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学生id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-18 11:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"学生姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-18 11:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"学生性别\",\"columnId\":3,\"columnName\":\"sex\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-18 11:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"学生类型\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 11:04:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-18 13:44:24', 151);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_info\"}', NULL, 0, NULL, '2024-06-18 13:44:29', 220);
INSERT INTO `sys_oper_log` VALUES (107, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"1\",\"classId\":1,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_info          ( name,                                       adm_method,             in_school,                          class_id,             major_id )           values ( ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-06-18 14:43:34', 368);
INSERT INTO `sys_oper_log` VALUES (108, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"1\",\"classId\":1,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_info          ( name,                                       adm_method,             in_school,                          class_id,             major_id )           values ( ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-06-18 14:43:38', 4);
INSERT INTO `sys_oper_log` VALUES (109, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_info          ( name,                                       adm_method,             in_school,                          class_id,             major_id )           values ( ?,                                       ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-06-18 16:36:53', 9);
INSERT INTO `sys_oper_log` VALUES (110, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        -- 使用获取的自增ID插入第二\' at line 6\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: -- 插入第一条记录         INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");          -- 获取自增ID         SET @last_id = LAST_INSERT_ID();          -- 使用获取的自增ID插入第二条记录         INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        -- 使用获取的自增ID插入第二\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        -- 使用获取的自增ID插入第二\' at line 6', '2024-06-18 16:46:12', 190);
INSERT INTO `sys_oper_log` VALUES (111, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");          SET @last_id = LAST_INSERT_ID();          INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4', '2024-06-18 16:46:57', 188);
INSERT INTO `sys_oper_log` VALUES (112, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");          SET @last_id = LAST_INSERT_ID();          INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n\n        INSERT INTO stu_info(id, name, sex, ty\' at line 4', '2024-06-18 16:48:25', 8);
INSERT INTO `sys_oper_log` VALUES (113, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n        INSERT INTO stu_info(id, name, sex, typ\' at line 5\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user(user_name, nick_name, password)         VALUES (?, ?, \"123456\");                         SET @last_id = LAST_INSERT_ID();         INSERT INTO stu_info(id, name, sex, type, in_school, class_id, major_id)         VALUES (@last_id, ?, ?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n        INSERT INTO stu_info(id, name, sex, typ\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'SET @last_id = LAST_INSERT_ID();\n        INSERT INTO stu_info(id, name, sex, typ\' at line 5', '2024-06-18 16:58:13', 591);
INSERT INTO `sys_oper_log` VALUES (114, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"admin\",\"params\":{},\"sex\":0,\"stuStatus\":1,\"type\":\"普通考生\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-20 22:42:27', 16);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'teacher\')`)\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 08:50:07', 35);
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'teacher\')`)\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"新增角色\'教师\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2024-06-21 08:50:28', 11);
INSERT INTO `sys_oper_log` VALUES (117, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'student\')`)\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 08:50:38', 19);
INSERT INTO `sys_oper_log` VALUES (118, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":101,\"roleKey\":\"@PreAuthorize(`@ss.hasRole(\'teacher\')`)\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 08:50:55', 14);
INSERT INTO `sys_oper_log` VALUES (119, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 08:51:07', 15);
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 08:51:12', 15);
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008],\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 08:51:36', 16);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"中山大学\",\"email\":\"test@qq.com\",\"leader\":\"钟明廷\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 09:31:50', 11);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"score_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 13:29:43', 96);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"score\",\"className\":\"ScoreInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"成绩id\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UsualPor\",\"columnComment\":\"平时成绩占比\",\"columnId\":11,\"columnName\":\"usual_por\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"usualPor\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UsualSco\",\"columnComment\":\"平时成绩\",\"columnId\":12,\"columnName\":\"usual_sco\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"usualSco\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MidPor\",\"columnComment\":\"期中成绩占比\",\"columnId\":13,\"columnName\":\"mid_por\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 13:29:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"midPor\",\"javaType\":\"Long\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 13:31:50', 26);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"score_info\"}', NULL, 0, NULL, '2024-06-21 13:31:53', 104);
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 13:25:38', 56);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/info/index\",\"createTime\":\"2024-06-18 13:48:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"学生信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"perms\":\"system:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 13:29:39', 13);
INSERT INTO `sys_oper_log` VALUES (128, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"id\":124,\"inSchool\":0,\"majorId\":1,\"name\":\"王灵\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'type\' cannot be null\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.insertStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO stu_info(id, name, type, adm_method,in_school, stu_status, class_id, major_id)         VALUES (?, ?, ?,?, ?, ?, ?, ?);\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'type\' cannot be null\n; Column \'type\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'type\' cannot be null', '2024-06-22 13:44:25', 28);
INSERT INTO `sys_oper_log` VALUES (129, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"admin\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 13:45:15', 5);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tea_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 13:48:44', 49);
INSERT INTO `sys_oper_log` VALUES (131, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"id\":125,\"inSchool\":2,\"majorId\":1,\"name\":\"王灵\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-22 15:18:31', 163);
INSERT INTO `sys_oper_log` VALUES (132, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"id\":126,\"inSchool\":2,\"majorId\":1,\"name\":\"李佶\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 15:15:36', 41);
INSERT INTO `sys_oper_log` VALUES (133, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 15:21:44', 8);
INSERT INTO `sys_oper_log` VALUES (134, '成绩管理', 2, 'com.ruoyi.tm.controller.ScoreInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/tm/score', '127.0.0.1', '内网IP', '{\"chooseId\":1,\"courseName\":\"计算机组成原理\",\"finalPor\":50,\"finalSco\":100,\"id\":1,\"midPor\":0,\"midSco\":0,\"others\":\"0\",\"params\":{},\"usualPor\":50,\"usualSco\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 16:03:16', 14);
INSERT INTO `sys_oper_log` VALUES (135, '成绩管理', 2, 'com.ruoyi.tm.controller.ScoreInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/tm/score', '127.0.0.1', '内网IP', '{\"chooseId\":1,\"courseName\":\"计算机组成原理\",\"finalPor\":50,\"finalSco\":100,\"id\":1,\"midPor\":0,\"midSco\":0,\"others\":\"0\",\"params\":{},\"usualPor\":50,\"usualSco\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 16:03:23', 3);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/info/index\",\"createTime\":\"2024-06-18 13:48:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"学生信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"perms\":\"tm:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 18:56:38', 38);
INSERT INTO `sys_oper_log` VALUES (137, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 18:56:55', 3);
INSERT INTO `sys_oper_log` VALUES (138, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 18:57:32', 4);
INSERT INTO `sys_oper_log` VALUES (139, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"id\":127,\"inSchool\":2,\"majorId\":1,\"name\":\"李佶\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 18:59:37', 17);
INSERT INTO `sys_oper_log` VALUES (140, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/127', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 19:59:34', 6);
INSERT INTO `sys_oper_log` VALUES (141, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"2\",\"classId\":1,\"id\":128,\"inSchool\":2,\"majorId\":1,\"name\":\"李佶\",\"params\":{},\"stuStatus\":0,\"type\":\"双一流高校学子\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 19:59:40', 71);
INSERT INTO `sys_oper_log` VALUES (142, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 20:33:11', 42);
INSERT INTO `sys_oper_log` VALUES (143, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 21:10:36', 17);
INSERT INTO `sys_oper_log` VALUES (144, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/143', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 21:51:38', 10);
INSERT INTO `sys_oper_log` VALUES (145, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/144', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 21:51:40', 6);
INSERT INTO `sys_oper_log` VALUES (146, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/137,138,139,140,141,142,145,146,135,136', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 21:51:50', 7);
INSERT INTO `sys_oper_log` VALUES (147, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/147,148', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 21:51:56', 6);
INSERT INTO `sys_oper_log` VALUES (148, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/info/128,129,131,132,133,130,134,125', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 21:52:06', 6);
INSERT INTO `sys_oper_log` VALUES (149, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"adm\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 22:17:54', 16);
INSERT INTO `sys_oper_log` VALUES (150, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"普通考试\",\"classId\":1,\"id\":151,\"inSchool\":1,\"majorId\":1,\"name\":\"打翻\",\"params\":{},\"sex\":\"0\",\"stuStatus\":1,\"type\":\"本科生\",\"user_name\":\"151\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.updateSysUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user         set user_name = ?         where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'', '2024-07-05 22:31:56', 71);
INSERT INTO `sys_oper_log` VALUES (151, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"普通考试\",\"classId\":1,\"id\":151,\"inSchool\":1,\"majorId\":1,\"name\":\"番\",\"params\":{},\"sex\":\"0\",\"stuStatus\":1,\"type\":\"本科生\",\"user_name\":\"151\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'sys_user.id\' in \'where clause\'\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.updateSysUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user         set user_name = ?         where sys_user.id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'sys_user.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'sys_user.id\' in \'where clause\'', '2024-07-05 22:33:04', 7);
INSERT INTO `sys_oper_log` VALUES (152, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"普通考试\",\"classId\":1,\"id\":151,\"inSchool\":1,\"majorId\":1,\"name\":\"大番\",\"params\":{},\"sex\":\"0\",\"stuStatus\":1,\"type\":\"本科生\",\"user_name\":\"151\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 22:34:05', 12);
INSERT INTO `sys_oper_log` VALUES (153, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"1\",\"classId\":1,\"id\":157,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{},\"stuStatus\":1,\"type\":\"1\",\"user_name\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 22:35:48', 113);
INSERT INTO `sys_oper_log` VALUES (154, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"1\",\"classId\":1,\"id\":157,\"inSchool\":1,\"majorId\":1,\"name\":\"test\",\"params\":{},\"stuStatus\":1,\"type\":\"1\",\"user_name\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-05 22:36:23', 7);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"major_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 07:39:20', 53);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"major\",\"className\":\"MajorInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"专业id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"专业姓名\",\"columnId\":23,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Dura\",\"columnComment\":\"专业开设时间\",\"columnId\":24,\"columnName\":\"dura\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dura\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MajMust\",\"columnComment\":\"毕业所需专必学分\",\"columnId\":25,\"columnName\":\"maj_must\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 07:39:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"majMust\",\"javaType\":\"Long\",\"list\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 07:40:47', 28);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"major_info\"}', NULL, 0, NULL, '2024-07-06 07:40:51', 105);
INSERT INTO `sys_oper_log` VALUES (158, '专业', 5, 'com.ruoyi.tm.controller.MajorInfoController.export()', 'POST', 1, 'admin', '研发部门', '/tm/major/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-07-06 07:47:17', 538);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"teacher\",\"className\":\"TeaInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"教师id\",\"columnId\":19,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 13:48:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"教师姓名\",\"columnId\":20,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 13:48:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"教师类型\",\"columnId\":21,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-22 13:48:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"clement\",\"functionName\":\"教师信息\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"tm\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.tm\",\"params\":{},\"sub\":false,\"tableComment\":\"教师信息\",\"tableId\":3,\"tableName\":\"tea_info\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 07:52:41', 14);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tea_info\"}', NULL, 0, NULL, '2024-07-06 07:53:14', 65);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"choose_course\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 08:05:59', 24);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"choose\",\"className\":\"ChooseCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选课id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumRebuild\",\"columnComment\":\"重修次数\",\"columnId\":32,\"columnName\":\"num_rebuild\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"numRebuild\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumMakeup\",\"columnComment\":\"补考次数\",\"columnId\":33,\"columnName\":\"num_makeup\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"numMakeup\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeferSign\",\"columnComment\":\"缓考标志\",\"columnId\":34,\"columnName\":\"defer_sign\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:05:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deferSign\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 08:06:37', 18);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"choose_course\"}', NULL, 0, NULL, '2024-07-06 08:06:40', 35);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/teacher/index\",\"createTime\":\"2024-07-06 08:10:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"教师信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"perms\":\"tm:teacher:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 08:10:50', 17);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/choose/index\",\"createTime\":\"2024-07-06 08:14:21\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"选课\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"choose\",\"perms\":\"tm:choose:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 08:15:54', 24);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-31 23:32:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-31 23:32:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-05 20:33:11', '普通角色');
INSERT INTO `sys_role` VALUES (100, '学生', 'student', 3, '1', 1, 1, '0', '0', 'admin', '2024-06-21 08:50:06', 'admin', '2024-06-21 08:51:06', '学生的权限');
INSERT INTO `sys_role` VALUES (101, '教师', 'teacher', 4, '1', 1, 1, '0', '0', 'admin', '2024-06-21 08:50:55', 'admin', '2024-06-21 08:51:12', '教师权限');
INSERT INTO `sys_role` VALUES (102, '教务老师', 'm_teacher', 5, '1', 1, 1, '0', '0', 'admin', '2024-06-21 08:51:36', '', NULL, '教务老师权限');
INSERT INTO `sys_role` VALUES (103, '班主任', 'ClassTeacher', 6, '1', 1, 1, '0', '0', 'admin', '2024-07-05 21:10:36', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2006);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (102, 2006);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 1);
INSERT INTO `sys_role_menu` VALUES (103, 2);
INSERT INTO `sys_role_menu` VALUES (103, 100);
INSERT INTO `sys_role_menu` VALUES (103, 101);
INSERT INTO `sys_role_menu` VALUES (103, 102);
INSERT INTO `sys_role_menu` VALUES (103, 103);
INSERT INTO `sys_role_menu` VALUES (103, 104);
INSERT INTO `sys_role_menu` VALUES (103, 105);
INSERT INTO `sys_role_menu` VALUES (103, 106);
INSERT INTO `sys_role_menu` VALUES (103, 107);
INSERT INTO `sys_role_menu` VALUES (103, 108);
INSERT INTO `sys_role_menu` VALUES (103, 109);
INSERT INTO `sys_role_menu` VALUES (103, 110);
INSERT INTO `sys_role_menu` VALUES (103, 111);
INSERT INTO `sys_role_menu` VALUES (103, 112);
INSERT INTO `sys_role_menu` VALUES (103, 113);
INSERT INTO `sys_role_menu` VALUES (103, 114);
INSERT INTO `sys_role_menu` VALUES (103, 500);
INSERT INTO `sys_role_menu` VALUES (103, 501);
INSERT INTO `sys_role_menu` VALUES (103, 1000);
INSERT INTO `sys_role_menu` VALUES (103, 1001);
INSERT INTO `sys_role_menu` VALUES (103, 1002);
INSERT INTO `sys_role_menu` VALUES (103, 1003);
INSERT INTO `sys_role_menu` VALUES (103, 1004);
INSERT INTO `sys_role_menu` VALUES (103, 1005);
INSERT INTO `sys_role_menu` VALUES (103, 1006);
INSERT INTO `sys_role_menu` VALUES (103, 1007);
INSERT INTO `sys_role_menu` VALUES (103, 1008);
INSERT INTO `sys_role_menu` VALUES (103, 1009);
INSERT INTO `sys_role_menu` VALUES (103, 1010);
INSERT INTO `sys_role_menu` VALUES (103, 1011);
INSERT INTO `sys_role_menu` VALUES (103, 1012);
INSERT INTO `sys_role_menu` VALUES (103, 1013);
INSERT INTO `sys_role_menu` VALUES (103, 1014);
INSERT INTO `sys_role_menu` VALUES (103, 1015);
INSERT INTO `sys_role_menu` VALUES (103, 1016);
INSERT INTO `sys_role_menu` VALUES (103, 1017);
INSERT INTO `sys_role_menu` VALUES (103, 1018);
INSERT INTO `sys_role_menu` VALUES (103, 1019);
INSERT INTO `sys_role_menu` VALUES (103, 1020);
INSERT INTO `sys_role_menu` VALUES (103, 1021);
INSERT INTO `sys_role_menu` VALUES (103, 1022);
INSERT INTO `sys_role_menu` VALUES (103, 1023);
INSERT INTO `sys_role_menu` VALUES (103, 1024);
INSERT INTO `sys_role_menu` VALUES (103, 1025);
INSERT INTO `sys_role_menu` VALUES (103, 1026);
INSERT INTO `sys_role_menu` VALUES (103, 1027);
INSERT INTO `sys_role_menu` VALUES (103, 1028);
INSERT INTO `sys_role_menu` VALUES (103, 1029);
INSERT INTO `sys_role_menu` VALUES (103, 1030);
INSERT INTO `sys_role_menu` VALUES (103, 1031);
INSERT INTO `sys_role_menu` VALUES (103, 1032);
INSERT INTO `sys_role_menu` VALUES (103, 1033);
INSERT INTO `sys_role_menu` VALUES (103, 1034);
INSERT INTO `sys_role_menu` VALUES (103, 1035);
INSERT INTO `sys_role_menu` VALUES (103, 1036);
INSERT INTO `sys_role_menu` VALUES (103, 1037);
INSERT INTO `sys_role_menu` VALUES (103, 1038);
INSERT INTO `sys_role_menu` VALUES (103, 1039);
INSERT INTO `sys_role_menu` VALUES (103, 1040);
INSERT INTO `sys_role_menu` VALUES (103, 1041);
INSERT INTO `sys_role_menu` VALUES (103, 1042);
INSERT INTO `sys_role_menu` VALUES (103, 1043);
INSERT INTO `sys_role_menu` VALUES (103, 1044);
INSERT INTO `sys_role_menu` VALUES (103, 1045);
INSERT INTO `sys_role_menu` VALUES (103, 1046);
INSERT INTO `sys_role_menu` VALUES (103, 1047);
INSERT INTO `sys_role_menu` VALUES (103, 1048);
INSERT INTO `sys_role_menu` VALUES (103, 1049);
INSERT INTO `sys_role_menu` VALUES (103, 1050);
INSERT INTO `sys_role_menu` VALUES (103, 1051);
INSERT INTO `sys_role_menu` VALUES (103, 1052);
INSERT INTO `sys_role_menu` VALUES (103, 1053);
INSERT INTO `sys_role_menu` VALUES (103, 1054);
INSERT INTO `sys_role_menu` VALUES (103, 2000);
INSERT INTO `sys_role_menu` VALUES (103, 2001);
INSERT INTO `sys_role_menu` VALUES (103, 2002);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2004);
INSERT INTO `sys_role_menu` VALUES (103, 2005);
INSERT INTO `sys_role_menu` VALUES (103, 2006);
INSERT INTO `sys_role_menu` VALUES (103, 2007);
INSERT INTO `sys_role_menu` VALUES (103, 2008);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-06 13:43:26', 'admin', '2024-05-31 23:32:47', '', '2024-07-06 13:43:25', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-31 23:32:47', 'admin', '2024-05-31 23:32:47', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 104, '苏某人', '苏某', '00', '15@qq.com', '15016248165', '0', '', '$2a$10$/ww8Kt.rGe7bdhJXG7xIIu0H51t/dWQdsIwe/8WLGKQyWIw9U33ye', '0', '0', '', NULL, 'admin', '2024-06-01 19:39:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 104, '吴某人', '吴某', '00', '156@qq.com', '15094826584', '0', '', '$2a$10$uG1MKS8uSlFNHmwwtQ5VCuNTldGe0vsUmU9YMNBBiDUwx2zv7y4rC', '0', '0', '', NULL, 'admin', '2024-06-01 19:40:49', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (125, 1, '125', '王灵', '00', NULL, NULL, NULL, NULL, NULL, '0', '2', '', NULL, NULL, '2024-06-22 15:18:31', '', '2024-06-22 15:18:31', '学生');
INSERT INTO `sys_user` VALUES (126, 1, '126', '李佶', '00', NULL, NULL, NULL, NULL, NULL, '0', '2', '', NULL, NULL, '2024-07-05 15:15:36', '', '2024-07-05 15:15:36', '学生');
INSERT INTO `sys_user` VALUES (127, 1, '127', '李佶', '00', NULL, NULL, NULL, NULL, '123456', '0', '2', '', NULL, NULL, '2024-07-05 18:59:37', '', '2024-07-05 18:59:37', '学生');
INSERT INTO `sys_user` VALUES (128, 1, '128', '李佶', '00', NULL, NULL, NULL, NULL, '$2a$10$sx0Bv1OS3mjhsTDw87iT0Oe8h0pl7OCR3l4m4wP2exqKGU6V6REZ2', '0', '2', '', NULL, NULL, '2024-07-05 19:59:40', '', '2024-07-05 19:59:40', '学生');
INSERT INTO `sys_user` VALUES (129, 1, '129', 'siri', '00', NULL, NULL, '0', NULL, '$2a$10$Y5MFVPtELu9rTm56CDIaZ.ctIhDz6T2QTUyMJnFlkW81tgc6F8mLG', '0', '2', '127.0.0.1', '2024-07-05 20:33:59', NULL, '2024-07-05 20:23:10', '', '2024-07-05 20:33:59', '学生');
INSERT INTO `sys_user` VALUES (130, 1, '130', 'suney', '00', NULL, NULL, '0', NULL, '$2a$10$kbLKkWD7E0i.GEnbiqpt9urJ3S78e1OLEiXWnghW9jufHuOTROVHC', '0', '2', '', NULL, NULL, '2024-07-05 20:23:10', '', '2024-07-05 20:23:10', '学生');
INSERT INTO `sys_user` VALUES (131, 1, '131', '小番', '00', NULL, NULL, '0', NULL, '$2a$10$Qh4qj11EiY9zpWHhqkhgVeBbqyMYIQ5HgklTaTpkJdR3q5VAGxnY.', '0', '2', '', NULL, NULL, '2024-07-05 20:23:10', '', '2024-07-05 20:23:10', '学生');
INSERT INTO `sys_user` VALUES (132, 1, '132', '星宇', '00', NULL, NULL, '0', NULL, '$2a$10$Ab5mkvAhWVnXoMptvjlSQ..5oCSBUjwaldvOmLqwnCHm33uZolONq', '0', '2', '', NULL, NULL, '2024-07-05 20:23:10', '', '2024-07-05 20:23:10', '学生');
INSERT INTO `sys_user` VALUES (133, 1, '133', 'siri', '00', NULL, NULL, '0', NULL, '$2a$10$8TGY0FKh0zz8NVrG93mgYuQT03W9qbOewg2Wl3XhuwuXQ2rbsy/Bu', '0', '2', '', NULL, NULL, '2024-07-05 21:28:09', '', '2024-07-05 21:28:09', '学生');
INSERT INTO `sys_user` VALUES (134, 1, '134', 'suney', '00', NULL, NULL, '0', NULL, '$2a$10$GQ9UBqTraJ5XAxD9nIg0x.xZhVPIK.tDNQBkkNF8CGT5azA3g.VrG', '0', '2', '', NULL, NULL, '2024-07-05 21:28:10', '', '2024-07-05 21:28:10', '学生');
INSERT INTO `sys_user` VALUES (135, 1, '135', '小番', '00', NULL, NULL, '0', NULL, '$2a$10$ImCwizyhbCLzBWCnYvega.G/VXRmelmqinnvoh.uq8pBkarqQuwFW', '0', '2', '', NULL, NULL, '2024-07-05 21:28:10', '', '2024-07-05 21:28:10', '学生');
INSERT INTO `sys_user` VALUES (136, 1, '136', '星宇', '00', NULL, NULL, '0', NULL, '$2a$10$dTJYyoFZBI1T2tBjFXgOPuZiCtHz52Jr9msoBDEY4pG4gRVlkobny', '0', '2', '', NULL, NULL, '2024-07-05 21:28:10', '', '2024-07-05 21:28:10', '学生');
INSERT INTO `sys_user` VALUES (137, 1, '137', 'siri', '00', NULL, NULL, '0', NULL, '$2a$10$CzjcaWbX9ZPTE69WV32Cte9YAUffAyxA10vvQA8M3VahAonDf3m.S', '0', '2', '', NULL, NULL, '2024-07-05 21:38:29', '', '2024-07-05 21:38:29', '学生');
INSERT INTO `sys_user` VALUES (138, 1, '138', 'suney', '00', NULL, NULL, '0', NULL, '$2a$10$ScsTTbYYV8UpMUNVgXuQq.OQvmr25a2Pr1KIJyCifIn2Hmt6vT3uy', '0', '2', '', NULL, NULL, '2024-07-05 21:38:29', '', '2024-07-05 21:38:29', '学生');
INSERT INTO `sys_user` VALUES (139, 1, '139', '小番', '00', NULL, NULL, '0', NULL, '$2a$10$6db5psxjCPr428/sdB8Q4ecRH5F7Fq2dTY4dUy9FGqHsqCS8CfQyS', '0', '2', '', NULL, NULL, '2024-07-05 21:38:29', '', '2024-07-05 21:38:29', '学生');
INSERT INTO `sys_user` VALUES (140, 1, '140', '星宇', '00', NULL, NULL, '0', NULL, '$2a$10$HVsKfpoSJ1BAv3jeYyOTQ.J6eF9qE6Q.9Fu6wF4yo3Yd31w1RXPkC', '0', '2', '', NULL, NULL, '2024-07-05 21:38:29', '', '2024-07-05 21:38:29', '学生');
INSERT INTO `sys_user` VALUES (141, 1, '141', 'siri', '00', NULL, NULL, '0', NULL, '$2a$10$cRaKOePiqQsvTwPzlbCGT.Nub.ToNr5fdjD9O314ALskjpRkuHLv.', '0', '2', '', NULL, NULL, '2024-07-05 21:38:43', '', '2024-07-05 21:38:43', '学生');
INSERT INTO `sys_user` VALUES (142, 1, '142', 'suney', '00', NULL, NULL, '0', NULL, '$2a$10$wYDD1fxkAQ6kaZrkqhRn4ukMpJeyZf2YYpLX13UWUXnrAVITf65cO', '0', '2', '', NULL, NULL, '2024-07-05 21:38:43', '', '2024-07-05 21:38:43', '学生');
INSERT INTO `sys_user` VALUES (143, 1, '143', '小番', '00', NULL, NULL, '0', NULL, '$2a$10$dUPBT3EZq1bL8FV6fwia5uH7M14lBqnq5J9A0L9qY8MGlgBd4UhkK', '0', '2', '', NULL, NULL, '2024-07-05 21:38:43', '', '2024-07-05 21:38:43', '学生');
INSERT INTO `sys_user` VALUES (144, 1, '144', '星宇', '00', NULL, NULL, '0', NULL, '$2a$10$nCCMi2FivWp4STTALP203Oq2mxgGO28VHBl65ztTtDw0MAIeGq1cS', '0', '2', '', NULL, NULL, '2024-07-05 21:38:43', '', '2024-07-05 21:38:43', '学生');
INSERT INTO `sys_user` VALUES (145, 1, '145', 'siri', '00', NULL, NULL, '0', NULL, '$2a$10$engch57onbiTViFO0iiet.h97zmYQbi6ig5VAH6r6EHRivxQHsAje', '0', '2', '', NULL, NULL, '2024-07-05 21:51:11', '', '2024-07-05 21:51:11', '学生');
INSERT INTO `sys_user` VALUES (146, 1, '146', 'suney', '00', NULL, NULL, '0', NULL, '$2a$10$duhcHZlhygMfFNt7d/VBFekOO1u9Y4aN1PPBVtv7C2N7lM1eCIzmW', '0', '2', '', NULL, NULL, '2024-07-05 21:51:11', '', '2024-07-05 21:51:11', '学生');
INSERT INTO `sys_user` VALUES (147, 1, '147', '小番', '00', NULL, NULL, '0', NULL, '$2a$10$GNQSaux3iMww4IFuUPMMiObTgVOYjcHjqwAa8BJ.SrdDwKR/2mxrq', '0', '2', '', NULL, NULL, '2024-07-05 21:51:12', '', '2024-07-05 21:51:12', '学生');
INSERT INTO `sys_user` VALUES (148, 1, '148', '星宇', '00', NULL, NULL, '0', NULL, '$2a$10$POwpohLmVgcC9dZOliVJQeBHKseccV1pS.ZECruTndC4XAg7UEkO2', '0', '2', '', NULL, NULL, '2024-07-05 21:51:12', '', '2024-07-05 21:51:12', '学生');
INSERT INTO `sys_user` VALUES (149, 1, '149', 'siri', '00', NULL, NULL, '0', NULL, '$2a$10$E.fZvO2.gzb4VnjnxCdHhOviTuFf9T3CcDKOdFvK.5OiymcVBb3YO', '0', '0', '', NULL, NULL, '2024-07-05 21:52:11', '', '2024-07-05 21:52:11', '学生');
INSERT INTO `sys_user` VALUES (150, 1, '150', 'suney', '00', NULL, NULL, '0', NULL, '$2a$10$PR5bsU04R0pUbpQfrmDPWuYxv0OBAJDu09NYqQDLtjIntTETNuz/.', '0', '0', '', NULL, NULL, '2024-07-05 21:52:11', '', '2024-07-05 21:52:11', '学生');
INSERT INTO `sys_user` VALUES (151, 1, '151', '小番', '00', NULL, NULL, '0', NULL, '$2a$10$oHqFloyhWyaSeYIEc5rrFezGKM4l83znBis97K8FBqf3C/MPwFrLS', '0', '0', '', NULL, NULL, '2024-07-05 21:52:11', '', '2024-07-05 21:52:11', '学生');
INSERT INTO `sys_user` VALUES (152, 1, '152', '星宇', '00', NULL, NULL, '0', NULL, '$2a$10$vyQ1I4sXizPcB9HO6g0F.e8ZnxKeohgxBBjaSdeEDHcqlkXfxTif2', '0', '0', '', NULL, NULL, '2024-07-05 21:52:11', '', '2024-07-05 21:52:11', '学生');
INSERT INTO `sys_user` VALUES (157, 1, 'test2', 'test', '00', NULL, NULL, NULL, NULL, '$2a$10$MbYndBu8SXsx4pucFcx0tOFdMVjnqCfoLMTf9mDyvbAOjh6pFFDFi', '0', '0', '127.0.0.1', '2024-07-06 11:30:49', NULL, '2024-07-05 22:35:48', '', '2024-07-06 11:30:48', '学生');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (117, 100);
INSERT INTO `sys_user_role` VALUES (118, 100);
INSERT INTO `sys_user_role` VALUES (119, 100);
INSERT INTO `sys_user_role` VALUES (121, 100);
INSERT INTO `sys_user_role` VALUES (122, 100);
INSERT INTO `sys_user_role` VALUES (123, 100);
INSERT INTO `sys_user_role` VALUES (125, 100);
INSERT INTO `sys_user_role` VALUES (126, 100);
INSERT INTO `sys_user_role` VALUES (127, 100);
INSERT INTO `sys_user_role` VALUES (128, 100);
INSERT INTO `sys_user_role` VALUES (129, 100);
INSERT INTO `sys_user_role` VALUES (130, 100);
INSERT INTO `sys_user_role` VALUES (131, 100);
INSERT INTO `sys_user_role` VALUES (132, 100);
INSERT INTO `sys_user_role` VALUES (133, 100);
INSERT INTO `sys_user_role` VALUES (134, 100);
INSERT INTO `sys_user_role` VALUES (135, 100);
INSERT INTO `sys_user_role` VALUES (136, 100);
INSERT INTO `sys_user_role` VALUES (137, 100);
INSERT INTO `sys_user_role` VALUES (138, 100);
INSERT INTO `sys_user_role` VALUES (139, 100);
INSERT INTO `sys_user_role` VALUES (140, 100);
INSERT INTO `sys_user_role` VALUES (141, 100);
INSERT INTO `sys_user_role` VALUES (142, 100);
INSERT INTO `sys_user_role` VALUES (143, 100);
INSERT INTO `sys_user_role` VALUES (144, 100);
INSERT INTO `sys_user_role` VALUES (145, 100);
INSERT INTO `sys_user_role` VALUES (146, 100);
INSERT INTO `sys_user_role` VALUES (147, 100);
INSERT INTO `sys_user_role` VALUES (148, 100);
INSERT INTO `sys_user_role` VALUES (149, 100);
INSERT INTO `sys_user_role` VALUES (150, 100);
INSERT INTO `sys_user_role` VALUES (151, 100);
INSERT INTO `sys_user_role` VALUES (152, 100);
INSERT INTO `sys_user_role` VALUES (157, 100);

-- ----------------------------
-- Table structure for tea_info
-- ----------------------------
DROP TABLE IF EXISTS `tea_info`;
CREATE TABLE `tea_info`  (
  `id` int NOT NULL COMMENT '教师id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师姓名',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师类型（普通教师0，教务老师1）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tea_info
-- ----------------------------
INSERT INTO `tea_info` VALUES (2, 'ry', '教务老师');
INSERT INTO `tea_info` VALUES (100, '苏某人', '教师');
INSERT INTO `tea_info` VALUES (101, '吴某人', '教师');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '123456', '1');
INSERT INTO `user_info` VALUES (2, '123456', '1');
INSERT INTO `user_info` VALUES (3, '123456', '1');
INSERT INTO `user_info` VALUES (4, '123456', '1');

SET FOREIGN_KEY_CHECKS = 1;
