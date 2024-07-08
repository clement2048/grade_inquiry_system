/*
 Navicat Premium Data Transfer

 Source Server         : tm_connect
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : tm_db

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 09/07/2024 04:33:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for choose_course
-- ----------------------------
DROP TABLE IF EXISTS `choose_course`;
CREATE TABLE `choose_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num_rebuild` int NOT NULL COMMENT '重修次数',
  `num_makeup` int NOT NULL COMMENT '补考次数',
  `defer_sign` int NOT NULL COMMENT '缓考标志',
  `pass` int NOT NULL COMMENT '通过标志(1为通过，0为不通过)',
  `stu_id` bigint NOT NULL COMMENT '学生id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stu_id`(`stu_id` ASC, `course_id` ASC) USING BTREE,
  INDEX `fk_stu_idx`(`stu_id` ASC) USING BTREE,
  INDEX `fk_course_idx`(`course_id` ASC) USING BTREE,
  CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stu` FOREIGN KEY (`stu_id`) REFERENCES `stu_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21222011011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '选课表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of choose_course
-- ----------------------------
INSERT INTO `choose_course` VALUES (319886, 0, 0, 0, 1, 1287420, 1);
INSERT INTO `choose_course` VALUES (528577, 0, 0, 0, 1, 46573540, 156);
INSERT INTO `choose_course` VALUES (628439, 0, 0, 0, 1, 46160734, 162);
INSERT INTO `choose_course` VALUES (846539, 0, 0, 0, 1, 72603778, 141);
INSERT INTO `choose_course` VALUES (1192286, 0, 0, 0, 1, 95350141, 118);
INSERT INTO `choose_course` VALUES (1224768, 0, 0, 0, 1, 21623323, 26);
INSERT INTO `choose_course` VALUES (1824786, 0, 0, 0, 1, 90854599, 57);
INSERT INTO `choose_course` VALUES (2086549, 0, 0, 0, 1, 56180260, 96);
INSERT INTO `choose_course` VALUES (2134942, 0, 0, 0, 1, 78089028, 71);
INSERT INTO `choose_course` VALUES (2207965, 0, 0, 0, 1, 30725848, 97);
INSERT INTO `choose_course` VALUES (2371372, 0, 0, 0, 1, 13640242, 7);
INSERT INTO `choose_course` VALUES (3149634, 0, 0, 0, 1, 4754552, 88);
INSERT INTO `choose_course` VALUES (3269258, 0, 0, 0, 1, 16238926, 54);
INSERT INTO `choose_course` VALUES (3425456, 0, 0, 0, 1, 47529373, 95);
INSERT INTO `choose_course` VALUES (3820914, 0, 0, 0, 0, 7812089, 160);
INSERT INTO `choose_course` VALUES (4143625, 0, 0, 0, 0, 23848233, 111);
INSERT INTO `choose_course` VALUES (5113866, 0, 0, 0, 1, 81842162, 121);
INSERT INTO `choose_course` VALUES (5162338, 0, 0, 0, 1, 73983944, 91);
INSERT INTO `choose_course` VALUES (5210891, 0, 0, 0, 1, 40546882, 56);
INSERT INTO `choose_course` VALUES (5248719, 0, 0, 0, 1, 36312541, 129);
INSERT INTO `choose_course` VALUES (6108752, 0, 0, 0, 1, 35390314, 48);
INSERT INTO `choose_course` VALUES (6111547, 0, 1, 0, 1, 7276262, 126);
INSERT INTO `choose_course` VALUES (6220799, 0, 0, 1, 1, 57516039, 49);
INSERT INTO `choose_course` VALUES (6223777, 0, 0, 0, 1, 35979444, 130);
INSERT INTO `choose_course` VALUES (6414929, 0, 0, 0, 1, 67418410, 157);
INSERT INTO `choose_course` VALUES (7524742, 0, 0, 0, 1, 34532930, 60);
INSERT INTO `choose_course` VALUES (7524753, 0, 0, 0, 1, 41796459, 55);
INSERT INTO `choose_course` VALUES (7912594, 0, 0, 1, 1, 81284889, 80);
INSERT INTO `choose_course` VALUES (8102321, 0, 0, 0, 1, 73925439, 73);
INSERT INTO `choose_course` VALUES (8121184, 0, 0, 0, 1, 94095291, 149);
INSERT INTO `choose_course` VALUES (8139654, 0, 0, 0, 1, 70004430, 137);
INSERT INTO `choose_course` VALUES (8223255, 0, 0, 0, 1, 26892624, 159);
INSERT INTO `choose_course` VALUES (8231338, 0, 0, 0, 1, 99729325, 66);
INSERT INTO `choose_course` VALUES (8520575, 0, 0, 0, 1, 79520505, 144);
INSERT INTO `choose_course` VALUES (8613294, 0, 0, 0, 1, 25366535, 68);
INSERT INTO `choose_course` VALUES (9202498, 0, 0, 0, 1, 61983195, 158);
INSERT INTO `choose_course` VALUES (9242263, 0, 0, 0, 1, 85490122, 104);
INSERT INTO `choose_course` VALUES (10113725, 0, 0, 0, 1, 46079310, 27);
INSERT INTO `choose_course` VALUES (11220287, 0, 0, 0, 1, 40288386, 98);
INSERT INTO `choose_course` VALUES (12138359, 0, 0, 0, 1, 62669538, 33);
INSERT INTO `choose_course` VALUES (12221591, 0, 0, 0, 1, 16872358, 43);
INSERT INTO `choose_course` VALUES (12310858, 0, 0, 0, 1, 46494071, 85);
INSERT INTO `choose_course` VALUES (13120763, 0, 0, 0, 1, 21567431, 36);
INSERT INTO `choose_course` VALUES (13156323, 0, 0, 0, 1, 64771866, 20);
INSERT INTO `choose_course` VALUES (13218210, 0, 0, 0, 1, 54133590, 140);
INSERT INTO `choose_course` VALUES (13249193, 0, 0, 0, 0, 90440841, 8);
INSERT INTO `choose_course` VALUES (13419398, 0, 0, 0, 1, 93791211, 4);
INSERT INTO `choose_course` VALUES (13621367, 0, 0, 0, 0, 43327618, 101);
INSERT INTO `choose_course` VALUES (15541037, 0, 0, 0, 1, 66498413, 18);
INSERT INTO `choose_course` VALUES (15814948, 0, 0, 0, 1, 48855368, 136);
INSERT INTO `choose_course` VALUES (16189753, 0, 0, 0, 1, 50754534, 38);
INSERT INTO `choose_course` VALUES (16249381, 0, 0, 0, 1, 383842, 16);
INSERT INTO `choose_course` VALUES (17122345, 0, 0, 0, 1, 37367576, 61);
INSERT INTO `choose_course` VALUES (17134562, 0, 0, 0, 1, 9877012, 114);
INSERT INTO `choose_course` VALUES (18268581, 0, 0, 0, 1, 84395738, 22);
INSERT INTO `choose_course` VALUES (18623510, 0, 0, 0, 1, 51009835, 84);
INSERT INTO `choose_course` VALUES (18813937, 0, 0, 0, 1, 9626596, 12);
INSERT INTO `choose_course` VALUES (19128109, 0, 0, 0, 1, 77432322, 58);
INSERT INTO `choose_course` VALUES (19923132, 0, 0, 0, 1, 39449157, 115);
INSERT INTO `choose_course` VALUES (20113343, 0, 0, 0, 1, 18880597, 151);
INSERT INTO `choose_course` VALUES (20119413, 0, 0, 0, 1, 16413341, 154);
INSERT INTO `choose_course` VALUES (21226976, 0, 0, 0, 1, 48413974, 169);
INSERT INTO `choose_course` VALUES (21822389, 0, 0, 0, 1, 27728917, 2);
INSERT INTO `choose_course` VALUES (22113281, 0, 0, 0, 1, 65669036, 44);
INSERT INTO `choose_course` VALUES (22185118, 0, 0, 0, 1, 14206566, 172);
INSERT INTO `choose_course` VALUES (22187172, 0, 0, 0, 1, 93961187, 100);
INSERT INTO `choose_course` VALUES (22251819, 0, 0, 0, 1, 87639440, 5);
INSERT INTO `choose_course` VALUES (22264159, 0, 0, 0, 1, 1058795, 50);
INSERT INTO `choose_course` VALUES (22319166, 0, 0, 0, 1, 78619302, 145);
INSERT INTO `choose_course` VALUES (23246669, 0, 0, 0, 1, 39247618, 46);
INSERT INTO `choose_course` VALUES (23287210, 0, 0, 0, 1, 5368505, 15);
INSERT INTO `choose_course` VALUES (23526595, 0, 0, 0, 1, 25429888, 166);
INSERT INTO `choose_course` VALUES (23613138, 0, 0, 0, 1, 410555, 37);
INSERT INTO `choose_course` VALUES (23918375, 0, 0, 0, 1, 19284332, 119);
INSERT INTO `choose_course` VALUES (24123379, 0, 0, 0, 1, 13700480, 23);
INSERT INTO `choose_course` VALUES (24146496, 0, 0, 0, 1, 58625953, 161);
INSERT INTO `choose_course` VALUES (25156107, 0, 0, 0, 1, 15512203, 17);
INSERT INTO `choose_course` VALUES (25221931, 0, 0, 0, 1, 68135231, 116);
INSERT INTO `choose_course` VALUES (26183624, 1, 0, 0, 1, 12498507, 153);
INSERT INTO `choose_course` VALUES (26215876, 0, 0, 0, 1, 44967351, 11);
INSERT INTO `choose_course` VALUES (26220619, 0, 0, 0, 1, 88413887, 14);
INSERT INTO `choose_course` VALUES (26371098, 0, 0, 0, 1, 74741150, 28);
INSERT INTO `choose_course` VALUES (26924822, 0, 0, 0, 1, 27205513, 132);
INSERT INTO `choose_course` VALUES (28255310, 0, 0, 0, 1, 86880776, 31);
INSERT INTO `choose_course` VALUES (32161039, 0, 0, 0, 1, 90787616, 173);
INSERT INTO `choose_course` VALUES (41618127, 0, 0, 0, 0, 85720734, 35);
INSERT INTO `choose_course` VALUES (42413328, 0, 0, 0, 1, 4803919, 152);
INSERT INTO `choose_course` VALUES (42625218, 0, 0, 0, 1, 80663518, 150);
INSERT INTO `choose_course` VALUES (52613284, 0, 0, 0, 0, 70632774, 69);
INSERT INTO `choose_course` VALUES (61021843, 0, 0, 0, 1, 74884313, 77);
INSERT INTO `choose_course` VALUES (61115647, 0, 0, 0, 0, 76529911, 83);
INSERT INTO `choose_course` VALUES (61922456, 0, 0, 0, 1, 21592853, 112);
INSERT INTO `choose_course` VALUES (62210719, 0, 0, 0, 1, 16466043, 146);
INSERT INTO `choose_course` VALUES (62596107, 0, 0, 0, 1, 10165672, 123);
INSERT INTO `choose_course` VALUES (71417216, 0, 0, 0, 1, 55241061, 10);
INSERT INTO `choose_course` VALUES (72102810, 0, 0, 0, 1, 52372365, 87);
INSERT INTO `choose_course` VALUES (72253910, 0, 1, 0, 1, 11540548, 131);
INSERT INTO `choose_course` VALUES (82171098, 0, 0, 0, 1, 2292962, 94);
INSERT INTO `choose_course` VALUES (82236101, 0, 0, 0, 1, 26893032, 108);
INSERT INTO `choose_course` VALUES (84181098, 0, 1, 0, 1, 57404657, 59);
INSERT INTO `choose_course` VALUES (89152310, 0, 0, 0, 1, 70305853, 103);
INSERT INTO `choose_course` VALUES (91123624, 0, 0, 0, 1, 17342616, 29);
INSERT INTO `choose_course` VALUES (91719521, 0, 0, 0, 1, 99213668, 3);
INSERT INTO `choose_course` VALUES (92423697, 0, 0, 0, 1, 80841877, 135);
INSERT INTO `choose_course` VALUES (93111091, 0, 0, 0, 1, 79260743, 125);
INSERT INTO `choose_course` VALUES (96249710, 0, 0, 0, 1, 75479404, 21);
INSERT INTO `choose_course` VALUES (101319556, 0, 0, 0, 1, 92614677, 74);
INSERT INTO `choose_course` VALUES (111314392, 0, 0, 0, 1, 47867461, 168);
INSERT INTO `choose_course` VALUES (111810610, 0, 0, 0, 1, 10983982, 138);
INSERT INTO `choose_course` VALUES (112625364, 0, 0, 0, 0, 78618234, 164);
INSERT INTO `choose_course` VALUES (118177108, 0, 0, 0, 1, 53141621, 25);
INSERT INTO `choose_course` VALUES (121423131, 0, 0, 0, 1, 2326791, 92);
INSERT INTO `choose_course` VALUES (122114349, 0, 0, 0, 1, 86323976, 13);
INSERT INTO `choose_course` VALUES (137171039, 0, 0, 0, 1, 20747376, 81);
INSERT INTO `choose_course` VALUES (141326949, 0, 0, 0, 1, 91197802, 47);
INSERT INTO `choose_course` VALUES (142625348, 0, 0, 0, 1, 5521063, 79);
INSERT INTO `choose_course` VALUES (147231087, 0, 0, 0, 1, 24671403, 147);
INSERT INTO `choose_course` VALUES (149310110, 0, 0, 0, 1, 20801640, 133);
INSERT INTO `choose_course` VALUES (152019532, 0, 0, 0, 1, 30105924, 99);
INSERT INTO `choose_course` VALUES (161014252, 0, 0, 0, 0, 38930007, 127);
INSERT INTO `choose_course` VALUES (161418933, 0, 0, 0, 1, 77832257, 70);
INSERT INTO `choose_course` VALUES (162015157, 0, 0, 0, 1, 82791768, 93);
INSERT INTO `choose_course` VALUES (162231210, 0, 0, 0, 1, 33353163, 122);
INSERT INTO `choose_course` VALUES (162251028, 0, 0, 0, 0, 97135574, 105);
INSERT INTO `choose_course` VALUES (171025675, 0, 0, 0, 1, 20322299, 51);
INSERT INTO `choose_course` VALUES (171116429, 0, 0, 0, 1, 76324172, 45);
INSERT INTO `choose_course` VALUES (181722917, 0, 0, 0, 1, 96577697, 82);
INSERT INTO `choose_course` VALUES (181751015, 0, 0, 0, 1, 10348131, 170);
INSERT INTO `choose_course` VALUES (182521646, 0, 0, 0, 1, 32672631, 67);
INSERT INTO `choose_course` VALUES (191012972, 0, 0, 0, 1, 68430192, 163);
INSERT INTO `choose_course` VALUES (191113665, 0, 0, 0, 1, 34279044, 106);
INSERT INTO `choose_course` VALUES (192325761, 0, 0, 0, 0, 64512565, 155);
INSERT INTO `choose_course` VALUES (201017822, 0, 0, 0, 0, 16947368, 107);
INSERT INTO `choose_course` VALUES (201531074, 0, 0, 0, 1, 33875134, 53);
INSERT INTO `choose_course` VALUES (214151052, 0, 0, 0, 1, 27382426, 76);
INSERT INTO `choose_course` VALUES (215224106, 0, 0, 0, 1, 54974544, 62);
INSERT INTO `choose_course` VALUES (221123177, 0, 0, 0, 1, 52921408, 124);
INSERT INTO `choose_course` VALUES (221813494, 0, 0, 0, 1, 3938899, 167);
INSERT INTO `choose_course` VALUES (225238710, 0, 0, 0, 1, 56514922, 148);
INSERT INTO `choose_course` VALUES (231419871, 0, 0, 0, 1, 61927552, 40);
INSERT INTO `choose_course` VALUES (232026997, 0, 1, 0, 1, 70746323, 32);
INSERT INTO `choose_course` VALUES (232118239, 0, 0, 0, 1, 29403528, 117);
INSERT INTO `choose_course` VALUES (232175107, 0, 0, 0, 1, 6938200, 143);
INSERT INTO `choose_course` VALUES (242120755, 0, 0, 0, 0, 98909663, 139);
INSERT INTO `choose_course` VALUES (249112910, 0, 0, 0, 1, 34385077, 128);
INSERT INTO `choose_course` VALUES (251114738, 0, 0, 0, 0, 83344817, 89);
INSERT INTO `choose_course` VALUES (251428810, 0, 0, 0, 0, 74703959, 30);
INSERT INTO `choose_course` VALUES (262210678, 0, 0, 0, 1, 91161667, 102);
INSERT INTO `choose_course` VALUES (318113910, 1, 0, 0, 1, 57845728, 78);
INSERT INTO `choose_course` VALUES (713267210, 0, 0, 0, 1, 31691972, 34);
INSERT INTO `choose_course` VALUES (923201018, 0, 0, 0, 0, 82446964, 24);
INSERT INTO `choose_course` VALUES (1122156104, 0, 0, 0, 1, 70195151, 6);
INSERT INTO `choose_course` VALUES (1326151103, 0, 0, 0, 1, 57353425, 90);
INSERT INTO `choose_course` VALUES (1512138910, 0, 0, 0, 0, 34615496, 72);
INSERT INTO `choose_course` VALUES (1622131064, 0, 1, 0, 1, 71078070, 86);
INSERT INTO `choose_course` VALUES (1622210210, 0, 0, 0, 1, 75127146, 165);
INSERT INTO `choose_course` VALUES (1918107810, 0, 0, 0, 1, 41696054, 52);
INSERT INTO `choose_course` VALUES (2021254110, 0, 0, 0, 1, 574181, 19);
INSERT INTO `choose_course` VALUES (2024121710, 0, 0, 0, 1, 31955829, 63);
INSERT INTO `choose_course` VALUES (2111163102, 0, 0, 0, 1, 82575303, 110);
INSERT INTO `choose_course` VALUES (2225731010, 0, 0, 0, 1, 25714009, 142);
INSERT INTO `choose_course` VALUES (2226239101, 0, 0, 0, 1, 2727632, 75);
INSERT INTO `choose_course` VALUES (2410251046, 0, 0, 0, 1, 9028823, 64);
INSERT INTO `choose_course` VALUES (2414251016, 0, 0, 0, 1, 96830032, 171);
INSERT INTO `choose_course` VALUES (2514161032, 0, 0, 0, 0, 69413460, 120);
INSERT INTO `choose_course` VALUES (2516510108, 0, 0, 0, 1, 76712685, 134);
INSERT INTO `choose_course` VALUES (2615179102, 0, 0, 0, 1, 30320446, 9);
INSERT INTO `choose_course` VALUES (2615241048, 0, 0, 0, 0, 92435019, 113);
INSERT INTO `choose_course` VALUES (8152210410, 0, 0, 0, 1, 69897143, 41);
INSERT INTO `choose_course` VALUES (11222661010, 0, 0, 0, 1, 71671622, 109);
INSERT INTO `choose_course` VALUES (15252610110, 0, 0, 0, 1, 80483359, 42);
INSERT INTO `choose_course` VALUES (19142310109, 0, 0, 0, 0, 97557511, 65);
INSERT INTO `choose_course` VALUES (21222011010, 0, 0, 0, 0, 60089312, 39);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `grade` int NOT NULL COMMENT '所在年级',
  `teach_id` bigint NOT NULL COMMENT '班主任id',
  `class_num` int NOT NULL COMMENT '班号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `class_num`(`class_num` ASC, `grade` ASC) USING BTREE,
  UNIQUE INDEX `fk_class_idx`(`teach_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '班级信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (201501, 15, 4, 1);
INSERT INTO `class_info` VALUES (201502, 15, 5, 2);
INSERT INTO `class_info` VALUES (201506, 15, 6, 6);
INSERT INTO `class_info` VALUES (201507, 15, 7, 7);
INSERT INTO `class_info` VALUES (201508, 15, 8, 8);
INSERT INTO `class_info` VALUES (201510, 15, 9, 10);
INSERT INTO `class_info` VALUES (201601, 16, 10, 1);
INSERT INTO `class_info` VALUES (201602, 16, 11, 2);
INSERT INTO `class_info` VALUES (201603, 16, 12, 3);
INSERT INTO `class_info` VALUES (201604, 16, 13, 4);
INSERT INTO `class_info` VALUES (201605, 16, 14, 5);
INSERT INTO `class_info` VALUES (201606, 16, 15, 6);
INSERT INTO `class_info` VALUES (201607, 16, 16, 7);
INSERT INTO `class_info` VALUES (201608, 16, 17, 8);
INSERT INTO `class_info` VALUES (201701, 17, 18, 1);
INSERT INTO `class_info` VALUES (201703, 17, 19, 3);
INSERT INTO `class_info` VALUES (201705, 17, 20, 5);
INSERT INTO `class_info` VALUES (201706, 17, 21, 6);
INSERT INTO `class_info` VALUES (201707, 17, 22, 7);
INSERT INTO `class_info` VALUES (201708, 17, 23, 8);
INSERT INTO `class_info` VALUES (201710, 17, 24, 10);
INSERT INTO `class_info` VALUES (201801, 18, 25, 1);
INSERT INTO `class_info` VALUES (201802, 18, 26, 2);
INSERT INTO `class_info` VALUES (201803, 18, 27, 3);
INSERT INTO `class_info` VALUES (201804, 18, 28, 4);
INSERT INTO `class_info` VALUES (201805, 18, 29, 5);
INSERT INTO `class_info` VALUES (201806, 18, 30, 6);
INSERT INTO `class_info` VALUES (201807, 18, 31, 7);
INSERT INTO `class_info` VALUES (201810, 18, 32, 10);
INSERT INTO `class_info` VALUES (201901, 19, 33, 1);
INSERT INTO `class_info` VALUES (201902, 19, 34, 2);
INSERT INTO `class_info` VALUES (201903, 19, 35, 3);
INSERT INTO `class_info` VALUES (201907, 19, 36, 7);
INSERT INTO `class_info` VALUES (201910, 19, 37, 10);
INSERT INTO `class_info` VALUES (202001, 20, 38, 1);
INSERT INTO `class_info` VALUES (202002, 20, 39, 2);
INSERT INTO `class_info` VALUES (202003, 20, 40, 3);
INSERT INTO `class_info` VALUES (202004, 20, 41, 4);
INSERT INTO `class_info` VALUES (202006, 20, 42, 6);
INSERT INTO `class_info` VALUES (202007, 20, 43, 7);
INSERT INTO `class_info` VALUES (202008, 20, 44, 8);
INSERT INTO `class_info` VALUES (202101, 21, 45, 1);
INSERT INTO `class_info` VALUES (202102, 21, 46, 2);
INSERT INTO `class_info` VALUES (202105, 21, 47, 5);
INSERT INTO `class_info` VALUES (202106, 21, 48, 6);
INSERT INTO `class_info` VALUES (202107, 21, 49, 7);
INSERT INTO `class_info` VALUES (202109, 21, 50, 9);
INSERT INTO `class_info` VALUES (202110, 21, 51, 10);
INSERT INTO `class_info` VALUES (202201, 22, 52, 1);
INSERT INTO `class_info` VALUES (202204, 22, 53, 4);
INSERT INTO `class_info` VALUES (202205, 22, 54, 5);
INSERT INTO `class_info` VALUES (202206, 22, 55, 6);
INSERT INTO `class_info` VALUES (202207, 22, 56, 7);
INSERT INTO `class_info` VALUES (202208, 22, 57, 8);
INSERT INTO `class_info` VALUES (202302, 23, 58, 2);
INSERT INTO `class_info` VALUES (202303, 23, 59, 3);
INSERT INTO `class_info` VALUES (202305, 23, 60, 5);
INSERT INTO `class_info` VALUES (202306, 23, 61, 6);
INSERT INTO `class_info` VALUES (202309, 23, 62, 9);
INSERT INTO `class_info` VALUES (202310, 23, 63, 10);
INSERT INTO `class_info` VALUES (202403, 24, 64, 3);
INSERT INTO `class_info` VALUES (202404, 24, 65, 4);
INSERT INTO `class_info` VALUES (202406, 24, 66, 6);
INSERT INTO `class_info` VALUES (202408, 24, 67, 8);
INSERT INTO `class_info` VALUES (202410, 24, 68, 10);
INSERT INTO `class_info` VALUES (202501, 25, 69, 1);
INSERT INTO `class_info` VALUES (202502, 25, 70, 2);
INSERT INTO `class_info` VALUES (202503, 25, 71, 3);
INSERT INTO `class_info` VALUES (202504, 25, 72, 4);
INSERT INTO `class_info` VALUES (202505, 25, 73, 5);
INSERT INTO `class_info` VALUES (202506, 25, 74, 6);
INSERT INTO `class_info` VALUES (202507, 25, 75, 7);
INSERT INTO `class_info` VALUES (202508, 25, 76, 8);
INSERT INTO `class_info` VALUES (202509, 25, 77, 9);
INSERT INTO `class_info` VALUES (202602, 26, 78, 2);
INSERT INTO `class_info` VALUES (202604, 26, 79, 4);
INSERT INTO `class_info` VALUES (202605, 26, 80, 5);
INSERT INTO `class_info` VALUES (202606, 26, 81, 6);
INSERT INTO `class_info` VALUES (202607, 26, 82, 7);
INSERT INTO `class_info` VALUES (202608, 26, 83, 8);
INSERT INTO `class_info` VALUES (202609, 26, 84, 9);
INSERT INTO `class_info` VALUES (202702, 27, 85, 2);
INSERT INTO `class_info` VALUES (202703, 27, 86, 3);
INSERT INTO `class_info` VALUES (202704, 27, 87, 4);
INSERT INTO `class_info` VALUES (202705, 27, 88, 5);
INSERT INTO `class_info` VALUES (202706, 27, 89, 6);
INSERT INTO `class_info` VALUES (202707, 27, 90, 7);
INSERT INTO `class_info` VALUES (202708, 27, 91, 8);
INSERT INTO `class_info` VALUES (202802, 28, 92, 2);
INSERT INTO `class_info` VALUES (202803, 28, 93, 3);
INSERT INTO `class_info` VALUES (202804, 28, 94, 4);
INSERT INTO `class_info` VALUES (202805, 28, 95, 5);
INSERT INTO `class_info` VALUES (202807, 28, 96, 7);
INSERT INTO `class_info` VALUES (202808, 28, 97, 8);
INSERT INTO `class_info` VALUES (202809, 28, 98, 9);
INSERT INTO `class_info` VALUES (202810, 28, 99, 10);
INSERT INTO `class_info` VALUES (202901, 29, 100, 1);
INSERT INTO `class_info` VALUES (202902, 29, 101, 2);
INSERT INTO `class_info` VALUES (202904, 29, 102, 4);
INSERT INTO `class_info` VALUES (202905, 29, 103, 5);
INSERT INTO `class_info` VALUES (202906, 29, 104, 6);
INSERT INTO `class_info` VALUES (202908, 29, 105, 8);
INSERT INTO `class_info` VALUES (202909, 29, 106, 9);
INSERT INTO `class_info` VALUES (203001, 30, 107, 1);
INSERT INTO `class_info` VALUES (203002, 30, 108, 2);
INSERT INTO `class_info` VALUES (203004, 30, 109, 4);
INSERT INTO `class_info` VALUES (203005, 30, 110, 5);
INSERT INTO `class_info` VALUES (203006, 30, 111, 6);
INSERT INTO `class_info` VALUES (203007, 30, 112, 7);
INSERT INTO `class_info` VALUES (203008, 30, 113, 8);
INSERT INTO `class_info` VALUES (203009, 30, 114, 9);
INSERT INTO `class_info` VALUES (203010, 30, 115, 10);

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info`  (
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
  INDEX `fk_fac`(`fac_id` ASC) USING BTREE,
  INDEX `fk_teach`(`teach_id` ASC) USING BTREE,
  CONSTRAINT `fk_fac` FOREIGN KEY (`fac_id`) REFERENCES `faculties_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES (1, '大学物理（理）', '专必', 20, 2, 84, '考试', 28, 3, 1, 133);
INSERT INTO `course_info` VALUES (2, '工程制图与CAD（一）', '公必', 21, 3, 89, '考试', 28, 2, 1, 31);
INSERT INTO `course_info` VALUES (3, '体育(篮球)', '专必', 22, 4, 67, '考试', 28, 1, 1, 49);
INSERT INTO `course_info` VALUES (4, '古典音乐的缤纷世界', '公选', 23, 3, 90, '考试', 24, 3, 1, 165);
INSERT INTO `course_info` VALUES (5, '气候变化：人类社会的历史责任和义务', '公必', 24, 5, 82, '考试', 24, 1, 1, 36);
INSERT INTO `course_info` VALUES (6, '媒介与社会发展', '专必', 25, 5, 34, '考试', 21, 1, 1, 62);
INSERT INTO `course_info` VALUES (7, '现代生物技术导论（核心通识）', '专必', 26, 4, 44, '考试', 16, 1, 1, 149);
INSERT INTO `course_info` VALUES (8, '离散数学基础', '公必', 27, 2, 32, '考试', 21, 2, 1, 112);
INSERT INTO `course_info` VALUES (9, '清洁生产与循环经济(核心通识)', '专必', 28, 2, 96, '考试', 28, 2, 1, 4);
INSERT INTO `course_info` VALUES (10, '地理空间信息技术与应用', '专必', 29, 4, 63, '考试', 24, 3, 1, 150);
INSERT INTO `course_info` VALUES (11, '计算机编程(Python)基础', '公必', 30, 1, 90, '考试', 28, 2, 1, 123);
INSERT INTO `course_info` VALUES (12, '数据结构与算法', '专必', 31, 0, 66, '考试', 29, 3, 1, 50);
INSERT INTO `course_info` VALUES (13, '体育(网球)', '公必', 32, 3, 20, '考试', 17, 1, 1, 124);
INSERT INTO `course_info` VALUES (14, '国际医疗卫生系统与热点问题分析', '专必', 33, 0, 66, '考试', 30, 3, 1, 79);
INSERT INTO `course_info` VALUES (15, '体育(跆拳道)', '公必', 34, 3, 49, '考试', 17, 1, 1, 113);
INSERT INTO `course_info` VALUES (16, '生命科学史', '专必', 35, 5, 61, '考试', 29, 3, 1, 5);
INSERT INTO `course_info` VALUES (17, '体育(足球)', '公选', 36, 3, 57, '考试', 26, 2, 1, 23);
INSERT INTO `course_info` VALUES (18, '毛泽东思想和中国特色社会主义理论体系概论', '专必', 37, 5, 25, '考试', 22, 3, 1, 37);
INSERT INTO `course_info` VALUES (19, '故事中的全球史', '公选', 38, 2, 30, '考试', 18, 2, 1, 166);
INSERT INTO `course_info` VALUES (20, '测绘学概论', '专必', 39, 0, 33, '考试', 18, 3, 1, 167);
INSERT INTO `course_info` VALUES (21, '行为决策概论', '公选', 40, 4, 11, '考试', 23, 2, 1, 32);
INSERT INTO `course_info` VALUES (22, '高级英语', '公选', 41, 0, 2, '考试', 19, 1, 1, 63);
INSERT INTO `course_info` VALUES (23, '新生研讨课', '公必', 42, 3, 55, '考试', 26, 3, 1, 142);
INSERT INTO `course_info` VALUES (24, '大学化学（二）上', '专必', 43, 3, 98, '考试', 25, 1, 1, 24);
INSERT INTO `course_info` VALUES (25, '大学化学实验（一）上', '专必', 44, 1, 65, '考试', 19, 2, 1, 114);
INSERT INTO `course_info` VALUES (26, '地球系统科学概论（上）', '公必', 45, 2, 29, '考试', 21, 1, 1, 64);
INSERT INTO `course_info` VALUES (27, '网络与数据法概论', '公必', 46, 4, 25, '考试', 29, 1, 1, 65);
INSERT INTO `course_info` VALUES (28, '体育(乒乓球)', '公必', 47, 3, 18, '考试', 29, 1, 1, 25);
INSERT INTO `course_info` VALUES (29, '行为决策概论', '专必', 48, 5, 95, '考试', 26, 3, 1, 51);
INSERT INTO `course_info` VALUES (30, '水文学基础', '公必', 49, 3, 93, '考试', 24, 1, 1, 115);
INSERT INTO `course_info` VALUES (31, '《乐理与视唱》', '公必', 50, 4, 7, '考试', 28, 3, 1, 71);
INSERT INTO `course_info` VALUES (32, '大学物理实验（理）（上）', '专必', 51, 1, 45, '考试', 19, 1, 1, 143);
INSERT INTO `course_info` VALUES (33, '今日化学与材料', '公选', 52, 1, 32, '考试', 28, 2, 1, 173);
INSERT INTO `course_info` VALUES (34, '体育(形体)', '公选', 53, 2, 38, '考试', 22, 2, 1, 38);
INSERT INTO `course_info` VALUES (35, '体育(网球)', '公选', 54, 3, 85, '考试', 23, 2, 1, 168);
INSERT INTO `course_info` VALUES (36, '清洁生产与循环经济(核心通识)', '公必', 55, 4, 96, '考试', 26, 3, 1, 13);
INSERT INTO `course_info` VALUES (37, '国际医疗卫生系统与热点问题分析', '公必', 30, 4, 49, '考试', 17, 2, 1, 134);
INSERT INTO `course_info` VALUES (38, '国际医疗卫生系统与热点问题分析', '公必', 31, 1, 58, '考试', 16, 3, 1, 14);
INSERT INTO `course_info` VALUES (39, '普通心理学实验', '专必', 32, 4, 91, '考试', 26, 3, 1, 84);
INSERT INTO `course_info` VALUES (40, '大学化学（二）上', '公选', 33, 3, 35, '考试', 25, 1, 1, 6);
INSERT INTO `course_info` VALUES (41, '大学化学实验（二）上', '专必', 34, 2, 40, '考试', 16, 2, 1, 72);
INSERT INTO `course_info` VALUES (42, '体育(篮球)', '公必', 35, 3, 56, '考试', 30, 3, 1, 125);
INSERT INTO `course_info` VALUES (43, '体育(跆拳道)', '专必', 36, 1, 24, '考试', 18, 1, 1, 169);
INSERT INTO `course_info` VALUES (44, '材料力学（含实验）', '公选', 37, 5, 38, '考试', 19, 2, 1, 85);
INSERT INTO `course_info` VALUES (45, '中华文明中的化学', '公必', 38, 0, 19, '考试', 24, 3, 1, 116);
INSERT INTO `course_info` VALUES (46, '逻辑学', '公必', 39, 1, 28, '考试', 30, 3, 1, 94);
INSERT INTO `course_info` VALUES (47, '数据库技术及应用（核心通识）', '专必', 40, 4, 75, '考试', 21, 3, 1, 126);
INSERT INTO `course_info` VALUES (48, '《乐理与视唱》', '公选', 41, 4, 5, '考试', 15, 2, 1, 80);
INSERT INTO `course_info` VALUES (49, '数据结构与算法', '专必', 42, 4, 47, '考试', 24, 1, 1, 55);
INSERT INTO `course_info` VALUES (50, '中国近现代史纲要', '专必', 43, 5, 93, '考试', 24, 1, 1, 86);
INSERT INTO `course_info` VALUES (51, '体育(定向)', '专必', 44, 4, 2, '考试', 20, 3, 1, 73);
INSERT INTO `course_info` VALUES (52, '《马克思恩格斯原始手稿导论》', '公必', 45, 3, 7, '考试', 19, 3, 1, 15);
INSERT INTO `course_info` VALUES (53, '大学生物I', '公选', 46, 3, 10, '考试', 18, 3, 1, 39);
INSERT INTO `course_info` VALUES (54, '体育(排球)', '专必', 47, 2, 51, '考试', 23, 3, 1, 16);
INSERT INTO `course_info` VALUES (55, '呵护胃肠：影像在佑', '专必', 48, 3, 60, '考试', 15, 2, 1, 74);
INSERT INTO `course_info` VALUES (56, '体育(篮球)', '专必', 49, 2, 7, '考试', 19, 2, 1, 160);
INSERT INTO `course_info` VALUES (57, '三维技术与应用概览', '公选', 50, 1, 10, '考试', 15, 2, 1, 117);
INSERT INTO `course_info` VALUES (58, '习近平新时代中国特色社会主义思想概论', '公必', 51, 3, 95, '考试', 18, 3, 1, 144);
INSERT INTO `course_info` VALUES (59, '大气科学基础', '专必', 52, 2, 87, '考试', 27, 3, 1, 56);
INSERT INTO `course_info` VALUES (60, '心理、情感与社会（核心通识）', '专必', 53, 3, 85, '考试', 26, 2, 1, 101);
INSERT INTO `course_info` VALUES (61, '辐射与健康', '公选', 54, 1, 5, '考试', 16, 1, 1, 102);
INSERT INTO `course_info` VALUES (62, '诗词地理学（核心通识）', '公必', 55, 1, 36, '考试', 15, 2, 1, 66);
INSERT INTO `course_info` VALUES (63, '软件工程实训（初级）', '专必', 56, 2, 7, '考试', 26, 3, 1, 135);
INSERT INTO `course_info` VALUES (64, '中国近现代史纲要', '专必', 57, 0, 8, '考试', 19, 2, 1, 170);
INSERT INTO `course_info` VALUES (65, '工程认识实习', '公选', 58, 1, 88, '考试', 28, 2, 1, 26);
INSERT INTO `course_info` VALUES (66, '大学物理（工）上', '公选', 59, 2, 75, '考试', 22, 2, 1, 103);
INSERT INTO `course_info` VALUES (67, '数据结构与算法实验', '公必', 60, 0, 62, '考试', 28, 2, 1, 136);
INSERT INTO `course_info` VALUES (68, '软件工程实训（初级）', '公选', 61, 4, 28, '考试', 29, 1, 1, 7);
INSERT INTO `course_info` VALUES (69, '普通心理学实验', '公选', 62, 4, 85, '考试', 24, 3, 1, 171);
INSERT INTO `course_info` VALUES (70, '大气科学基础', '公必', 63, 3, 85, '考试', 29, 1, 1, 52);
INSERT INTO `course_info` VALUES (71, '行为决策概论', '公选', 64, 3, 92, '考试', 19, 2, 1, 67);
INSERT INTO `course_info` VALUES (72, '体育(太极拳)', '公必', 65, 4, 5, '考试', 30, 1, 1, 40);
INSERT INTO `course_info` VALUES (73, '体育(体能)', '专必', 66, 5, 73, '考试', 21, 3, 1, 174);
INSERT INTO `course_info` VALUES (74, '体育(游泳)', '公选', 67, 1, 71, '考试', 29, 3, 1, 137);
INSERT INTO `course_info` VALUES (75, '香港经济', '专必', 40, 5, 5, '考试', 17, 2, 1, 104);
INSERT INTO `course_info` VALUES (76, '大气化学', '公选', 41, 4, 73, '考试', 27, 1, 1, 8);
INSERT INTO `course_info` VALUES (77, '体育(排球)', '专必', 42, 3, 17, '考试', 23, 2, 1, 138);
INSERT INTO `course_info` VALUES (78, '体育(乒乓球)', '公选', 43, 3, 55, '考试', 29, 3, 1, 139);
INSERT INTO `course_info` VALUES (79, '数据结构与算法实验', '公必', 44, 0, 96, '考试', 24, 2, 1, 95);
INSERT INTO `course_info` VALUES (80, '网络与数据法概论', '专必', 45, 2, 3, '考试', 20, 2, 1, 127);
INSERT INTO `course_info` VALUES (81, '体育(中国短兵)', '公必', 46, 1, 98, '考试', 18, 2, 1, 57);
INSERT INTO `course_info` VALUES (82, '体育(健身)', '专必', 47, 4, 95, '考试', 25, 3, 1, 145);
INSERT INTO `course_info` VALUES (83, '中美关系与台湾问题', '专必', 48, 3, 24, '考试', 19, 3, 1, 151);
INSERT INTO `course_info` VALUES (84, '辐射与健康', '专必', 49, 5, 63, '考试', 21, 3, 1, 75);
INSERT INTO `course_info` VALUES (85, '逻辑学', '专必', 50, 5, 41, '考试', 20, 1, 1, 96);
INSERT INTO `course_info` VALUES (86, '地球系统科学', '专必', 51, 4, 68, '考试', 25, 1, 1, 105);
INSERT INTO `course_info` VALUES (87, '体育(健身气功)', '公选', 52, 5, 14, '考试', 21, 3, 1, 53);
INSERT INTO `course_info` VALUES (88, '军事课', '公必', 53, 0, 82, '考试', 20, 2, 1, 76);
INSERT INTO `course_info` VALUES (89, '电路理论基础实验', '专必', 54, 2, 16, '考试', 15, 2, 1, 87);
INSERT INTO `course_info` VALUES (90, '大气探测学', '公必', 55, 1, 100, '考试', 23, 3, 1, 33);
INSERT INTO `course_info` VALUES (91, '普通心理学', '公必', 56, 0, 83, '考试', 25, 3, 1, 175);
INSERT INTO `course_info` VALUES (92, '程序设计实验', '公必', 57, 5, 90, '考试', 20, 3, 1, 58);
INSERT INTO `course_info` VALUES (93, '胃肠疾病与健康', '公选', 58, 0, 77, '考试', 15, 3, 1, 152);
INSERT INTO `course_info` VALUES (94, '辐射与健康', '公必', 59, 4, 55, '考试', 29, 2, 1, 68);
INSERT INTO `course_info` VALUES (95, '土木、水利与海洋工程概论', '公必', 60, 1, 60, '考试', 17, 3, 1, 140);
INSERT INTO `course_info` VALUES (96, '体育(击剑)', '公选', 61, 2, 79, '考试', 20, 3, 1, 41);
INSERT INTO `course_info` VALUES (97, '体育(高尔夫)', '公选', 62, 5, 80, '考试', 25, 3, 1, 161);
INSERT INTO `course_info` VALUES (98, '大学化学（三）', '专必', 63, 5, 4, '考试', 29, 2, 1, 106);
INSERT INTO `course_info` VALUES (99, '生活中不能忽视的“小病小痛”', '公必', 64, 0, 95, '考试', 27, 2, 1, 146);
INSERT INTO `course_info` VALUES (100, '中国花鸟画技法训练', '专必', 65, 1, 86, '考试', 17, 2, 1, 77);
INSERT INTO `course_info` VALUES (101, '高等数学一（I）', '专必', 66, 2, 61, '考试', 28, 3, 1, 107);
INSERT INTO `course_info` VALUES (102, '军事课', '公必', 67, 4, 61, '考试', 25, 3, 1, 118);
INSERT INTO `course_info` VALUES (103, '生活中不能忽视的“小病小痛”', '公选', 68, 4, 22, '考试', 24, 1, 1, 128);
INSERT INTO `course_info` VALUES (104, '学术交流英语', '专必', 69, 1, 9, '考试', 15, 2, 1, 147);
INSERT INTO `course_info` VALUES (105, '中美关系与台湾问题', '公必', 70, 0, 88, '考试', 20, 2, 1, 88);
INSERT INTO `course_info` VALUES (106, '数字电路与逻辑设计', '公必', 71, 1, 71, '考试', 17, 1, 1, 17);
INSERT INTO `course_info` VALUES (107, '高等数学一（I）', '公必', 72, 2, 96, '考试', 22, 1, 1, 129);
INSERT INTO `course_info` VALUES (108, '体育(足球)', '公必', 73, 0, 74, '考试', 25, 3, 1, 18);
INSERT INTO `course_info` VALUES (109, '《马克思恩格斯原始手稿导论》', '专必', 74, 1, 41, '考试', 17, 3, 1, 81);
INSERT INTO `course_info` VALUES (110, '离散数学基础', '专必', 75, 0, 59, '考试', 17, 3, 1, 119);
INSERT INTO `course_info` VALUES (111, '毛泽东思想和中国特色社会主义理论体系概论', '公必', 76, 1, 63, '考试', 17, 2, 1, 130);
INSERT INTO `course_info` VALUES (112, '计算机组成原理实验', '专必', 77, 4, 70, '考试', 29, 2, 1, 148);
INSERT INTO `course_info` VALUES (113, '大气化学', '公必', 78, 5, 59, '考试', 17, 3, 1, 59);
INSERT INTO `course_info` VALUES (114, '线性代数', '专必', 79, 3, 36, '考试', 30, 3, 1, 27);
INSERT INTO `course_info` VALUES (115, '线性代数', '专必', 80, 1, 62, '考试', 18, 1, 1, 153);
INSERT INTO `course_info` VALUES (116, 'Web3与元宇宙', '公必', 81, 2, 73, '考试', 20, 1, 1, 141);
INSERT INTO `course_info` VALUES (117, '中国花鸟画技法训练', '专必', 82, 5, 9, '考试', 27, 1, 1, 172);
INSERT INTO `course_info` VALUES (118, '体育(太极拳)', '专必', 50, 0, 81, '考试', 20, 1, 1, 162);
INSERT INTO `course_info` VALUES (119, '体育(太极拳)', '公必', 51, 1, 3, '考试', 25, 1, 1, 131);
INSERT INTO `course_info` VALUES (120, '中国文化英语再现(核心通识)', '专必', 52, 5, 49, '考试', 28, 1, 1, 28);
INSERT INTO `course_info` VALUES (121, '理论力学', '公必', 53, 5, 75, '考试', 24, 2, 1, 69);
INSERT INTO `course_info` VALUES (122, '中美关系与台湾问题', '公必', 54, 0, 3, '考试', 29, 2, 1, 97);
INSERT INTO `course_info` VALUES (123, '数据结构与算法实验', '公必', 55, 5, 52, '考试', 20, 1, 1, 163);
INSERT INTO `course_info` VALUES (124, '体育(排球)', '公选', 56, 1, 16, '考试', 30, 3, 1, 98);
INSERT INTO `course_info` VALUES (125, '粤剧经典唱段赏析与实践', '专必', 57, 4, 74, '考试', 26, 3, 1, 60);
INSERT INTO `course_info` VALUES (126, '智慧旅游', '专必', 58, 0, 43, '考试', 30, 3, 1, 108);
INSERT INTO `course_info` VALUES (127, '西方法理学', '专必', 59, 3, 7, '考试', 24, 3, 1, 78);
INSERT INTO `course_info` VALUES (128, '中国花鸟画技法训练', '专必', 60, 4, 16, '考试', 23, 3, 1, 89);
INSERT INTO `course_info` VALUES (129, '现代生物技术导论（核心通识）', '公选', 61, 1, 49, '考试', 25, 2, 1, 154);
INSERT INTO `course_info` VALUES (130, '体育(足球)', '专必', 62, 4, 26, '考试', 25, 2, 1, 99);
INSERT INTO `course_info` VALUES (131, '网络与数据法概论', '专必', 63, 5, 60, '考试', 18, 1, 1, 164);
INSERT INTO `course_info` VALUES (132, '国际医疗卫生系统与热点问题分析', '公必', 64, 1, 95, '考试', 20, 3, 1, 42);
INSERT INTO `course_info` VALUES (133, '工程制图与CAD（一）', '专必', 65, 2, 99, '考试', 20, 3, 1, 43);
INSERT INTO `course_info` VALUES (134, '中国文化英语再现(核心通识)', '专必', 66, 3, 19, '考试', 16, 2, 1, 100);
INSERT INTO `course_info` VALUES (135, '高等数学二（I）', '专必', 67, 3, 55, '考试', 29, 2, 1, 9);
INSERT INTO `course_info` VALUES (136, '土木、水利与海洋工程概论', '公选', 68, 1, 81, '考试', 23, 2, 1, 44);
INSERT INTO `course_info` VALUES (137, '体育(飞镖)', '专必', 69, 1, 17, '考试', 23, 2, 1, 155);
INSERT INTO `course_info` VALUES (138, '工程认识实习', '专必', 60, 4, 36, '考试', 24, 1, 1, 82);
INSERT INTO `course_info` VALUES (139, '实验室安全与学术道德', '公选', 61, 3, 90, '考试', 26, 1, 1, 61);
INSERT INTO `course_info` VALUES (140, '毛泽东思想和中国特色社会主义理论体系概论', '公必', 62, 2, 91, '考试', 15, 3, 1, 10);
INSERT INTO `course_info` VALUES (141, '智慧旅游', '公选', 63, 1, 32, '考试', 26, 1, 1, 29);
INSERT INTO `course_info` VALUES (142, '中美关系与台湾问题', '公选', 64, 0, 45, '考试', 17, 1, 1, 34);
INSERT INTO `course_info` VALUES (143, '计算机编程(Python)基础', '专必', 65, 0, 88, '考试', 16, 2, 1, 90);
INSERT INTO `course_info` VALUES (144, '数字电路与逻辑设计实验', '公必', 66, 3, 66, '考试', 29, 3, 1, 109);
INSERT INTO `course_info` VALUES (145, '东北亚国际关系史专题研究', '公选', 67, 4, 61, '考试', 29, 2, 1, 110);
INSERT INTO `course_info` VALUES (146, '软件工程导论', '公选', 68, 5, 85, '考试', 18, 3, 1, 70);
INSERT INTO `course_info` VALUES (147, '体育(飞镖)', '公选', 69, 1, 36, '考试', 27, 3, 1, 176);
INSERT INTO `course_info` VALUES (148, '体育(游泳)', '公必', 70, 5, 84, '考试', 20, 1, 1, 30);
INSERT INTO `course_info` VALUES (149, '中国花鸟画技法训练', '专必', 71, 4, 14, '考试', 27, 2, 1, 83);
INSERT INTO `course_info` VALUES (150, '大学英语I', '公选', 72, 4, 38, '考试', 29, 2, 1, 156);
INSERT INTO `course_info` VALUES (151, '香港经济', '专必', 73, 5, 38, '考试', 16, 1, 1, 45);
INSERT INTO `course_info` VALUES (152, '土木、水利与海洋工程概论', '公选', 74, 3, 56, '考试', 27, 2, 1, 11);
INSERT INTO `course_info` VALUES (153, '软件工程导论', '公必', 75, 5, 51, '考试', 26, 1, 1, 19);
INSERT INTO `course_info` VALUES (154, '普通生物学', '公必', 76, 0, 77, '考试', 30, 3, 1, 46);
INSERT INTO `course_info` VALUES (155, '中华文明中的化学', '公必', 77, 5, 50, '考试', 26, 2, 1, 54);
INSERT INTO `course_info` VALUES (156, '胃肠疾病与健康', '公选', 78, 1, 38, '考试', 22, 2, 1, 91);
INSERT INTO `course_info` VALUES (157, '辐射与健康', '专必', 79, 2, 74, '考试', 18, 3, 1, 120);
INSERT INTO `course_info` VALUES (158, '中美关系与台湾问题', '公选', 80, 1, 2, '考试', 15, 1, 1, 111);
INSERT INTO `course_info` VALUES (159, '计算机组成原理实验', '公选', 81, 4, 7, '考试', 18, 3, 1, 47);
INSERT INTO `course_info` VALUES (160, '工程制图与CAD（一）', '公选', 82, 1, 40, '考试', 17, 2, 1, 157);
INSERT INTO `course_info` VALUES (161, '媒介与社会发展', '公必', 83, 0, 52, '考试', 27, 2, 1, 20);
INSERT INTO `course_info` VALUES (162, '大气探测综合实习', '专必', 84, 0, 62, '考试', 21, 3, 1, 121);
INSERT INTO `course_info` VALUES (163, '香港经济', '专必', 85, 4, 11, '考试', 17, 2, 1, 158);
INSERT INTO `course_info` VALUES (164, '毛泽东思想和中国特色社会主义理论体系概论', '公必', 86, 0, 65, '考试', 15, 3, 1, 12);
INSERT INTO `course_info` VALUES (165, '体育(高尔夫)', '公必', 87, 5, 62, '考试', 18, 2, 1, 122);
INSERT INTO `course_info` VALUES (166, '香港经济', '公必', 88, 4, 44, '考试', 20, 3, 1, 48);
INSERT INTO `course_info` VALUES (167, '国际医疗卫生系统与热点问题分析', '公必', 89, 0, 16, '考试', 27, 2, 1, 92);
INSERT INTO `course_info` VALUES (168, '生命科学史', '公必', 90, 4, 71, '考试', 15, 3, 1, 132);
INSERT INTO `course_info` VALUES (169, '体育(高尔夫)', '专必', 91, 4, 81, '考试', 17, 1, 1, 35);
INSERT INTO `course_info` VALUES (170, '体育(飞镖)', '专必', 92, 4, 39, '考试', 29, 2, 1, 93);
INSERT INTO `course_info` VALUES (171, '智慧旅游', '专必', 93, 1, 75, '考试', 20, 2, 1, 159);
INSERT INTO `course_info` VALUES (172, '软件工程实训（初级）', '公必', 94, 2, 7, '考试', 25, 1, 1, 21);
INSERT INTO `course_info` VALUES (173, '风景背后的故事', '公选', 95, 0, 78, '考试', 26, 3, 1, 22);

-- ----------------------------
-- Table structure for faculties_info
-- ----------------------------
DROP TABLE IF EXISTS `faculties_info`;
CREATE TABLE `faculties_info`  (
  `id` bigint NOT NULL COMMENT '专业id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业名字',
  `campus` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属学院',
  `teach_id` bigint NOT NULL COMMENT '该专业教务老师id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teach_id_idx`(`teach_id` ASC) USING BTREE,
  CONSTRAINT `fk_teachid` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'stu_info', '学生信息表', NULL, NULL, 'StuInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'info', 'Student', 'clement', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-06-18 11:04:33', '', '2024-06-18 13:44:24', NULL);
INSERT INTO `gen_table` VALUES (2, 'score_info', '学生成绩表', NULL, NULL, 'ScoreInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'score', '成绩管理', 'clement', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-06-21 13:29:43', '', '2024-06-21 13:31:50', NULL);
INSERT INTO `gen_table` VALUES (3, 'tea_info', '教师信息', NULL, NULL, 'TeaInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'teacher', '教师信息', 'clement', '0', '/', '{}', 'admin', '2024-06-22 13:48:44', '', '2024-07-06 07:52:41', NULL);
INSERT INTO `gen_table` VALUES (4, 'major_info', '专业信息', NULL, NULL, 'MajorInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'major', '专业', 'clement', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-07-06 07:39:20', '', '2024-07-06 07:40:47', NULL);
INSERT INTO `gen_table` VALUES (5, 'choose_course', '选课信息表', NULL, NULL, 'ChooseCourse', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'choose', '选课', 'clement', '0', '/', '{}', 'admin', '2024-07-06 08:05:59', '', '2024-07-06 08:06:37', NULL);
INSERT INTO `gen_table` VALUES (6, 'course_info', '课程信息表', NULL, NULL, 'CourseInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'Course', '课程信息', 'clement', '0', '/', '{}', 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47', NULL);
INSERT INTO `gen_table` VALUES (7, 'class_info', '班级信息表', NULL, NULL, 'ClassInfo', 'crud', 'element-ui', 'com.ruoyi.tm', 'tm', 'Class', '班级信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-07-08 15:34:20', '', '2024-07-08 15:36:00', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `gen_table_column` VALUES (38, 6, 'id', '课程id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (39, 6, 'name', '课程名字', 'varchar(45)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (40, 6, 'type', '课程类型', 'varchar(45)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (41, 6, 'peo_limit', '人数限制', 'int', 'Long', 'peoLimit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (42, 6, 'credit', '学分', 'int', 'Long', 'credit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (43, 6, 'tot_time', '总学时', 'int', 'Long', 'totTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (44, 6, 'final_method', '期末考试方法', 'varchar(45)', 'String', 'finalMethod', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (45, 6, 'start_year', '开办学年', 'int', 'Long', 'startYear', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (46, 6, 'start_sem', '开办学期', 'int', 'Long', 'startSem', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (47, 6, 'fac_id', '开办学院id', 'int', 'Long', 'facId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (48, 6, 'teach_id', '授课老师id', 'int', 'Long', 'teachId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-07-07 14:33:09', '', '2024-07-07 14:34:47');
INSERT INTO `gen_table_column` VALUES (49, 7, 'id', '班级id', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-08 15:34:20', '', '2024-07-08 15:36:00');
INSERT INTO `gen_table_column` VALUES (50, 7, 'grade', '所在年级', 'int', 'Long', 'grade', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-08 15:34:20', '', '2024-07-08 15:36:00');
INSERT INTO `gen_table_column` VALUES (51, 7, 'teach_id', '班主任id', 'bigint', 'Long', 'teachId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-08 15:34:20', '', '2024-07-08 15:36:00');
INSERT INTO `gen_table_column` VALUES (52, 7, 'class_num', '班号', 'int', 'Long', 'classNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-08 15:34:20', '', '2024-07-08 15:36:00');

-- ----------------------------
-- Table structure for major_info
-- ----------------------------
DROP TABLE IF EXISTS `major_info`;
CREATE TABLE `major_info`  (
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
  INDEX `major_info_ibfk_1`(`fac_id` ASC) USING BTREE,
  CONSTRAINT `fk_facu` FOREIGN KEY (`fac_id`) REFERENCES `faculties_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of major_info
-- ----------------------------
INSERT INTO `major_info` VALUES (1, '人工智能', 20, 114, 18, 37, 8, 177, 1);
INSERT INTO `major_info` VALUES (2, '集成电路', 21, 99, 25, 37, 8, 169, 1);
INSERT INTO `major_info` VALUES (3, '心理学', 8, 56, 20, 45, 16, 137, 1);
INSERT INTO `major_info` VALUES (4, '电子与通信工程', 17, 89, 25, 31, 16, 161, 1);
INSERT INTO `major_info` VALUES (5, '海洋科学', 8, 64, 30, 47, 17, 158, 1);
INSERT INTO `major_info` VALUES (6, '大气科学', 12, 66, 39, 35, 16, 156, 1);
INSERT INTO `major_info` VALUES (7, '先进制造', 21, 115, 18, 37, 8, 178, 1);
INSERT INTO `major_info` VALUES (8, '材料科学与工程', 16, 79, 22, 31, 16, 148, 1);
INSERT INTO `major_info` VALUES (9, '化学学院', 5, 69, 21, 52, 13, 155, 1);
INSERT INTO `major_info` VALUES (10, '海洋工程与技术', 17, 100, 9, 31, 16, 156, 1);
INSERT INTO `major_info` VALUES (11, '测绘科学与技术', 19, 98, 14, 32, 12, 156, 1);
INSERT INTO `major_info` VALUES (12, '土木工程', 17, 92, 26, 31, 16, 165, 1);
INSERT INTO `major_info` VALUES (13, '护理学', 3, 109, 34, 47, 10, 201, 1);
INSERT INTO `major_info` VALUES (14, '软件工程', 20, 106, 24, 37, 8, 175, 1);
INSERT INTO `major_info` VALUES (15, '先进能源', 21, 97, 27, 37, 8, 169, 1);
INSERT INTO `major_info` VALUES (16, '航空航天学', 15, 69, 47, 38, 16, 170, 1);
INSERT INTO `major_info` VALUES (17, '化学工程与技术', 16, 100, 14, 33, 16, 163, 1);
INSERT INTO `major_info` VALUES (18, '地球科学与工程', 5, 53, 32, 50, 12, 147, 1);
INSERT INTO `major_info` VALUES (19, '环境科学与工程', 5, 52, 40, 51, 12, 155, 1);
INSERT INTO `major_info` VALUES (20, '材料学', 17, 100, 12, 31, 16, 159, 1);
INSERT INTO `major_info` VALUES (21, '空专业', 21, 97, 27, 37, 8, 169, 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for score_info
-- ----------------------------
DROP TABLE IF EXISTS `score_info`;
CREATE TABLE `score_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usual_por` int NOT NULL,
  `usual_sco` int NOT NULL,
  `mid_por` int NOT NULL,
  `mid_sco` int NOT NULL,
  `final_por` int NOT NULL,
  `final_sco` int NOT NULL,
  `others` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `choose_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_course_idx`(`choose_id` ASC) USING BTREE,
  CONSTRAINT `fk_choose` FOREIGN KEY (`choose_id`) REFERENCES `choose_course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score_info
-- ----------------------------
INSERT INTO `score_info` VALUES (1, 0, 0, 0, 0, 100, 23, NULL, 319886);
INSERT INTO `score_info` VALUES (2, 0, 0, 0, 0, 100, 33, NULL, 21822389);
INSERT INTO `score_info` VALUES (3, 0, 0, 0, 0, 100, 59, NULL, 91719521);
INSERT INTO `score_info` VALUES (4, 0, 0, 0, 0, 100, 19, NULL, 13419398);
INSERT INTO `score_info` VALUES (5, 0, 0, 0, 0, 100, 70, NULL, 22251819);
INSERT INTO `score_info` VALUES (6, 0, 0, 0, 0, 100, 8, NULL, 1122156104);
INSERT INTO `score_info` VALUES (7, 0, 0, 0, 0, 100, 41, NULL, 2371372);
INSERT INTO `score_info` VALUES (8, 0, 0, 0, 0, 100, 6, NULL, 13249193);
INSERT INTO `score_info` VALUES (9, 0, 0, 0, 0, 100, 16, NULL, 2615179102);
INSERT INTO `score_info` VALUES (10, 0, 0, 0, 0, 100, 54, NULL, 71417216);
INSERT INTO `score_info` VALUES (11, 0, 0, 0, 0, 100, 69, NULL, 26215876);
INSERT INTO `score_info` VALUES (12, 0, 0, 0, 0, 100, 42, NULL, 18813937);
INSERT INTO `score_info` VALUES (13, 0, 0, 0, 0, 100, 73, NULL, 122114349);
INSERT INTO `score_info` VALUES (14, 0, 0, 0, 0, 100, 87, NULL, 26220619);
INSERT INTO `score_info` VALUES (15, 0, 0, 0, 0, 100, 73, NULL, 23287210);
INSERT INTO `score_info` VALUES (16, 0, 0, 0, 0, 100, 31, NULL, 16249381);
INSERT INTO `score_info` VALUES (17, 0, 0, 0, 0, 100, 47, NULL, 25156107);
INSERT INTO `score_info` VALUES (18, 0, 0, 0, 0, 100, 7, NULL, 15541037);
INSERT INTO `score_info` VALUES (19, 0, 0, 0, 0, 100, 45, NULL, 2021254110);
INSERT INTO `score_info` VALUES (20, 0, 0, 0, 0, 100, 49, NULL, 13156323);
INSERT INTO `score_info` VALUES (21, 0, 0, 0, 0, 100, 28, NULL, 96249710);
INSERT INTO `score_info` VALUES (22, 0, 0, 0, 0, 100, 14, NULL, 18268581);
INSERT INTO `score_info` VALUES (23, 0, 0, 0, 0, 100, 33, NULL, 24123379);
INSERT INTO `score_info` VALUES (24, 0, 0, 0, 0, 100, 10, NULL, 923201018);
INSERT INTO `score_info` VALUES (25, 0, 0, 0, 0, 100, 97, NULL, 118177108);
INSERT INTO `score_info` VALUES (26, 0, 0, 0, 0, 100, 4, NULL, 1224768);
INSERT INTO `score_info` VALUES (27, 0, 0, 0, 0, 100, 73, NULL, 10113725);
INSERT INTO `score_info` VALUES (28, 0, 0, 0, 0, 100, 92, NULL, 26371098);
INSERT INTO `score_info` VALUES (29, 0, 0, 0, 0, 100, 85, NULL, 91123624);
INSERT INTO `score_info` VALUES (30, 0, 0, 0, 0, 100, 55, NULL, 251428810);
INSERT INTO `score_info` VALUES (31, 0, 0, 0, 0, 100, 14, NULL, 28255310);
INSERT INTO `score_info` VALUES (32, 0, 0, 0, 0, 100, 8, NULL, 232026997);
INSERT INTO `score_info` VALUES (33, 0, 0, 0, 0, 100, 56, NULL, 12138359);
INSERT INTO `score_info` VALUES (34, 0, 0, 0, 0, 100, 98, NULL, 713267210);
INSERT INTO `score_info` VALUES (35, 0, 0, 0, 0, 100, 99, NULL, 41618127);
INSERT INTO `score_info` VALUES (36, 0, 0, 0, 0, 100, 37, NULL, 13120763);
INSERT INTO `score_info` VALUES (37, 0, 0, 0, 0, 100, 6, NULL, 23613138);
INSERT INTO `score_info` VALUES (38, 0, 0, 0, 0, 100, 91, NULL, 16189753);
INSERT INTO `score_info` VALUES (39, 0, 0, 0, 0, 100, 99, NULL, 21222011010);
INSERT INTO `score_info` VALUES (40, 0, 0, 0, 0, 100, 33, NULL, 231419871);
INSERT INTO `score_info` VALUES (41, 0, 0, 0, 0, 100, 72, NULL, 8152210410);
INSERT INTO `score_info` VALUES (42, 0, 0, 0, 0, 100, 56, NULL, 15252610110);
INSERT INTO `score_info` VALUES (43, 0, 0, 0, 0, 100, 89, NULL, 12221591);
INSERT INTO `score_info` VALUES (44, 0, 0, 0, 0, 100, 63, NULL, 22113281);
INSERT INTO `score_info` VALUES (45, 0, 0, 0, 0, 100, 84, NULL, 171116429);
INSERT INTO `score_info` VALUES (46, 0, 0, 0, 0, 100, 15, NULL, 23246669);
INSERT INTO `score_info` VALUES (47, 0, 0, 0, 0, 100, 14, NULL, 141326949);
INSERT INTO `score_info` VALUES (48, 0, 0, 0, 0, 100, 89, NULL, 6108752);
INSERT INTO `score_info` VALUES (49, 0, 0, 0, 0, 100, 49, NULL, 6220799);
INSERT INTO `score_info` VALUES (50, 0, 0, 0, 0, 100, 89, NULL, 22264159);
INSERT INTO `score_info` VALUES (51, 0, 0, 0, 0, 100, 12, NULL, 171025675);
INSERT INTO `score_info` VALUES (52, 0, 0, 0, 0, 100, 2, NULL, 1918107810);
INSERT INTO `score_info` VALUES (53, 0, 0, 0, 0, 100, 63, NULL, 201531074);
INSERT INTO `score_info` VALUES (54, 0, 0, 0, 0, 100, 10, NULL, 3269258);
INSERT INTO `score_info` VALUES (55, 0, 0, 0, 0, 100, 82, NULL, 7524753);
INSERT INTO `score_info` VALUES (56, 0, 0, 0, 0, 100, 1, NULL, 5210891);
INSERT INTO `score_info` VALUES (57, 0, 0, 0, 0, 100, 75, NULL, 1824786);
INSERT INTO `score_info` VALUES (58, 0, 0, 0, 0, 100, 98, NULL, 19128109);
INSERT INTO `score_info` VALUES (59, 0, 0, 0, 0, 100, 26, NULL, 84181098);
INSERT INTO `score_info` VALUES (60, 0, 0, 0, 0, 100, 23, NULL, 7524742);
INSERT INTO `score_info` VALUES (61, 0, 0, 0, 0, 100, 28, NULL, 17122345);
INSERT INTO `score_info` VALUES (62, 0, 0, 0, 0, 100, 42, NULL, 215224106);
INSERT INTO `score_info` VALUES (63, 0, 0, 0, 0, 100, 97, NULL, 2024121710);
INSERT INTO `score_info` VALUES (64, 0, 0, 0, 0, 100, 39, NULL, 2410251046);
INSERT INTO `score_info` VALUES (65, 0, 0, 0, 0, 100, 94, NULL, 19142310109);
INSERT INTO `score_info` VALUES (66, 0, 0, 0, 0, 100, 27, NULL, 8231338);
INSERT INTO `score_info` VALUES (67, 0, 0, 0, 0, 100, 94, NULL, 182521646);
INSERT INTO `score_info` VALUES (68, 0, 0, 0, 0, 100, 86, NULL, 8613294);
INSERT INTO `score_info` VALUES (69, 0, 0, 0, 0, 100, 54, NULL, 52613284);
INSERT INTO `score_info` VALUES (70, 0, 0, 0, 0, 100, 51, NULL, 161418933);
INSERT INTO `score_info` VALUES (71, 0, 0, 0, 0, 100, 49, NULL, 2134942);
INSERT INTO `score_info` VALUES (72, 0, 0, 0, 0, 100, 84, NULL, 1512138910);
INSERT INTO `score_info` VALUES (73, 0, 0, 0, 0, 100, 41, NULL, 8102321);
INSERT INTO `score_info` VALUES (74, 0, 0, 0, 0, 100, 42, NULL, 101319556);
INSERT INTO `score_info` VALUES (75, 0, 0, 0, 0, 100, 19, NULL, 2226239101);
INSERT INTO `score_info` VALUES (76, 0, 0, 0, 0, 100, 2, NULL, 214151052);
INSERT INTO `score_info` VALUES (77, 0, 0, 0, 0, 100, 39, NULL, 61021843);
INSERT INTO `score_info` VALUES (78, 0, 0, 0, 0, 100, 55, NULL, 318113910);
INSERT INTO `score_info` VALUES (79, 0, 0, 0, 0, 100, 70, NULL, 142625348);
INSERT INTO `score_info` VALUES (80, 0, 0, 0, 0, 100, 17, NULL, 7912594);
INSERT INTO `score_info` VALUES (81, 0, 0, 0, 0, 100, 34, NULL, 137171039);
INSERT INTO `score_info` VALUES (82, 0, 0, 0, 0, 100, 93, NULL, 181722917);
INSERT INTO `score_info` VALUES (83, 0, 0, 0, 0, 100, 48, NULL, 61115647);
INSERT INTO `score_info` VALUES (84, 0, 0, 0, 0, 100, 74, NULL, 18623510);
INSERT INTO `score_info` VALUES (85, 0, 0, 0, 0, 100, 9, NULL, 12310858);
INSERT INTO `score_info` VALUES (86, 0, 0, 0, 0, 100, 38, NULL, 1622131064);
INSERT INTO `score_info` VALUES (87, 0, 0, 0, 0, 100, 93, NULL, 72102810);
INSERT INTO `score_info` VALUES (88, 0, 0, 0, 0, 100, 69, NULL, 3149634);
INSERT INTO `score_info` VALUES (89, 0, 0, 0, 0, 100, 28, NULL, 251114738);
INSERT INTO `score_info` VALUES (90, 0, 0, 0, 0, 100, 45, NULL, 1326151103);
INSERT INTO `score_info` VALUES (91, 0, 0, 0, 0, 100, 99, NULL, 5162338);
INSERT INTO `score_info` VALUES (92, 0, 0, 0, 0, 100, 7, NULL, 121423131);
INSERT INTO `score_info` VALUES (93, 0, 0, 0, 0, 100, 4, NULL, 162015157);
INSERT INTO `score_info` VALUES (94, 0, 0, 0, 0, 100, 91, NULL, 82171098);
INSERT INTO `score_info` VALUES (95, 0, 0, 0, 0, 100, 11, NULL, 3425456);
INSERT INTO `score_info` VALUES (96, 0, 0, 0, 0, 100, 48, NULL, 2086549);
INSERT INTO `score_info` VALUES (97, 0, 0, 0, 0, 100, 21, NULL, 2207965);
INSERT INTO `score_info` VALUES (98, 0, 0, 0, 0, 100, 4, NULL, 11220287);
INSERT INTO `score_info` VALUES (99, 0, 0, 0, 0, 100, 5, NULL, 152019532);
INSERT INTO `score_info` VALUES (100, 0, 0, 0, 0, 100, 21, NULL, 22187172);
INSERT INTO `score_info` VALUES (101, 0, 0, 0, 0, 100, 21, NULL, 13621367);
INSERT INTO `score_info` VALUES (102, 0, 0, 0, 0, 100, 73, NULL, 262210678);
INSERT INTO `score_info` VALUES (103, 0, 0, 0, 0, 100, 79, NULL, 89152310);
INSERT INTO `score_info` VALUES (104, 0, 0, 0, 0, 100, 1, NULL, 9242263);
INSERT INTO `score_info` VALUES (105, 0, 0, 0, 0, 100, 8, NULL, 162251028);
INSERT INTO `score_info` VALUES (106, 0, 0, 0, 0, 100, 49, NULL, 191113665);
INSERT INTO `score_info` VALUES (107, 0, 0, 0, 0, 100, 81, NULL, 201017822);
INSERT INTO `score_info` VALUES (108, 0, 0, 0, 0, 100, 97, NULL, 82236101);
INSERT INTO `score_info` VALUES (109, 0, 0, 0, 0, 100, 88, NULL, 11222661010);
INSERT INTO `score_info` VALUES (110, 0, 0, 0, 0, 100, 90, NULL, 2111163102);
INSERT INTO `score_info` VALUES (111, 0, 0, 0, 0, 100, 85, NULL, 4143625);
INSERT INTO `score_info` VALUES (112, 0, 0, 0, 0, 100, 49, NULL, 61922456);
INSERT INTO `score_info` VALUES (113, 0, 0, 0, 0, 100, 66, NULL, 2615241048);
INSERT INTO `score_info` VALUES (114, 0, 0, 0, 0, 100, 21, NULL, 17134562);
INSERT INTO `score_info` VALUES (115, 0, 0, 0, 0, 100, 12, NULL, 19923132);
INSERT INTO `score_info` VALUES (116, 0, 0, 0, 0, 100, 59, NULL, 25221931);
INSERT INTO `score_info` VALUES (117, 0, 0, 0, 0, 100, 76, NULL, 232118239);
INSERT INTO `score_info` VALUES (118, 0, 0, 0, 0, 100, 83, NULL, 1192286);
INSERT INTO `score_info` VALUES (119, 0, 0, 0, 0, 100, 88, NULL, 23918375);
INSERT INTO `score_info` VALUES (120, 0, 0, 0, 0, 100, 10, NULL, 2514161032);
INSERT INTO `score_info` VALUES (121, 0, 0, 0, 0, 100, 97, NULL, 5113866);
INSERT INTO `score_info` VALUES (122, 0, 0, 0, 0, 100, 60, NULL, 162231210);
INSERT INTO `score_info` VALUES (123, 0, 0, 0, 0, 100, 73, NULL, 62596107);
INSERT INTO `score_info` VALUES (124, 0, 0, 0, 0, 100, 33, NULL, 221123177);
INSERT INTO `score_info` VALUES (125, 0, 0, 0, 0, 100, 10, NULL, 93111091);
INSERT INTO `score_info` VALUES (126, 0, 0, 0, 0, 100, 59, NULL, 6111547);
INSERT INTO `score_info` VALUES (127, 0, 0, 0, 0, 100, 32, NULL, 161014252);
INSERT INTO `score_info` VALUES (128, 0, 0, 0, 0, 100, 40, NULL, 249112910);
INSERT INTO `score_info` VALUES (129, 0, 0, 0, 0, 100, 36, NULL, 5248719);
INSERT INTO `score_info` VALUES (130, 0, 0, 0, 0, 100, 83, NULL, 6223777);
INSERT INTO `score_info` VALUES (131, 0, 0, 0, 0, 100, 33, NULL, 72253910);
INSERT INTO `score_info` VALUES (132, 0, 0, 0, 0, 100, 18, NULL, 26924822);
INSERT INTO `score_info` VALUES (133, 0, 0, 0, 0, 100, 52, NULL, 149310110);
INSERT INTO `score_info` VALUES (134, 0, 0, 0, 0, 100, 7, NULL, 2516510108);
INSERT INTO `score_info` VALUES (135, 0, 0, 0, 0, 100, 62, NULL, 92423697);
INSERT INTO `score_info` VALUES (136, 0, 0, 0, 0, 100, 8, NULL, 15814948);
INSERT INTO `score_info` VALUES (137, 0, 0, 0, 0, 100, 10, NULL, 8139654);
INSERT INTO `score_info` VALUES (138, 0, 0, 0, 0, 100, 79, NULL, 111810610);
INSERT INTO `score_info` VALUES (139, 0, 0, 0, 0, 100, 75, NULL, 242120755);
INSERT INTO `score_info` VALUES (140, 0, 0, 0, 0, 100, 98, NULL, 13218210);
INSERT INTO `score_info` VALUES (141, 0, 0, 0, 0, 100, 70, NULL, 846539);
INSERT INTO `score_info` VALUES (142, 0, 0, 0, 0, 100, 45, NULL, 2225731010);
INSERT INTO `score_info` VALUES (143, 0, 0, 0, 0, 100, 26, NULL, 232175107);
INSERT INTO `score_info` VALUES (144, 0, 0, 0, 0, 100, 81, NULL, 8520575);
INSERT INTO `score_info` VALUES (145, 0, 0, 0, 0, 100, 33, NULL, 22319166);
INSERT INTO `score_info` VALUES (146, 0, 0, 0, 0, 100, 61, NULL, 62210719);
INSERT INTO `score_info` VALUES (147, 0, 0, 0, 0, 100, 36, NULL, 147231087);
INSERT INTO `score_info` VALUES (148, 0, 0, 0, 0, 100, 54, NULL, 225238710);
INSERT INTO `score_info` VALUES (149, 0, 0, 0, 0, 100, 58, NULL, 8121184);
INSERT INTO `score_info` VALUES (150, 0, 0, 0, 0, 100, 74, NULL, 42625218);
INSERT INTO `score_info` VALUES (151, 0, 0, 0, 0, 100, 98, NULL, 20113343);
INSERT INTO `score_info` VALUES (152, 0, 0, 0, 0, 100, 96, NULL, 42413328);
INSERT INTO `score_info` VALUES (153, 0, 0, 0, 0, 100, 70, NULL, 26183624);
INSERT INTO `score_info` VALUES (154, 0, 0, 0, 0, 100, 38, NULL, 20119413);
INSERT INTO `score_info` VALUES (155, 0, 0, 0, 0, 100, 75, NULL, 192325761);
INSERT INTO `score_info` VALUES (156, 0, 0, 0, 0, 100, 84, NULL, 528577);
INSERT INTO `score_info` VALUES (157, 0, 0, 0, 0, 100, 89, NULL, 6414929);
INSERT INTO `score_info` VALUES (158, 0, 0, 0, 0, 100, 88, NULL, 9202498);
INSERT INTO `score_info` VALUES (159, 0, 0, 0, 0, 100, 79, NULL, 8223255);
INSERT INTO `score_info` VALUES (160, 0, 0, 0, 0, 100, 24, NULL, 3820914);
INSERT INTO `score_info` VALUES (161, 0, 0, 0, 0, 100, 25, NULL, 24146496);
INSERT INTO `score_info` VALUES (162, 0, 0, 0, 0, 100, 69, NULL, 628439);
INSERT INTO `score_info` VALUES (163, 0, 0, 0, 0, 100, 92, NULL, 191012972);
INSERT INTO `score_info` VALUES (164, 0, 0, 0, 0, 100, 55, NULL, 112625364);
INSERT INTO `score_info` VALUES (165, 0, 0, 0, 0, 100, 84, NULL, 1622210210);
INSERT INTO `score_info` VALUES (166, 0, 0, 0, 0, 100, 90, NULL, 23526595);
INSERT INTO `score_info` VALUES (167, 0, 0, 0, 0, 100, 51, NULL, 221813494);
INSERT INTO `score_info` VALUES (168, 0, 0, 0, 0, 100, 46, NULL, 111314392);
INSERT INTO `score_info` VALUES (169, 0, 0, 0, 0, 100, 90, NULL, 21226976);
INSERT INTO `score_info` VALUES (170, 0, 0, 0, 0, 100, 91, NULL, 181751015);
INSERT INTO `score_info` VALUES (171, 0, 0, 0, 0, 100, 90, NULL, 2414251016);
INSERT INTO `score_info` VALUES (172, 0, 0, 0, 0, 100, 57, NULL, 22185118);
INSERT INTO `score_info` VALUES (173, 0, 0, 0, 0, 100, 5, NULL, 32161039);

-- ----------------------------
-- Table structure for stu_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info`  (
  `id` bigint NOT NULL COMMENT '学生id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生姓名',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生类型',
  `adm_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入学方式',
  `in_school` int NULL DEFAULT NULL COMMENT '是否在校（0在校，1不在校）',
  `stu_status` int NULL DEFAULT NULL COMMENT '学生状态（0正常，1异常）',
  `class_id` bigint NULL DEFAULT NULL COMMENT '班级id',
  `major_id` bigint NULL DEFAULT NULL COMMENT '专业id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_majorid`(`major_id` ASC) USING BTREE,
  INDEX `fk_classid`(`class_id` ASC) USING BTREE,
  CONSTRAINT `fk_major` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_class` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_stuid` FOREIGN KEY (`id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES (1, 'adm', '普通考生', '一般统考', 0, 1, NULL, NULL);
INSERT INTO `stu_info` VALUES (383842, '将勒杯靳', '普通高校本专科学生', '民族班', 0, 1, 202508, 21);
INSERT INTO `stu_info` VALUES (410555, '怒又卡', '普通高校本专科学生', '民族班', 0, 0, 202909, 19);
INSERT INTO `stu_info` VALUES (574181, '总站枯', '普通高校本专科学生', '其他', 0, 0, 201607, 5);
INSERT INTO `stu_info` VALUES (1058795, '岂析※', '普通高校本专科学生', '港澳台生', 0, 0, 202110, 14);
INSERT INTO `stu_info` VALUES (1287420, '防阶里肯', '普通高校本专科学生', '来华留学', 0, 0, 202609, 1);
INSERT INTO `stu_info` VALUES (2292962, '充历偿母', '普通高校本专科学生', '一般统考生', 0, 0, 201608, 19);
INSERT INTO `stu_info` VALUES (2326791, '都妨熟午', '普通高校本专科学生', '来华留学', 0, 0, 201708, 17);
INSERT INTO `stu_info` VALUES (2727632, '旧擅军', '普通高校本专科学生', '来华留学', 0, 0, 201604, 8);
INSERT INTO `stu_info` VALUES (3938899, '夫钦充▲', '普通高校本专科学生', '其他', 0, 0, 201803, 18);
INSERT INTO `stu_info` VALUES (4754552, '菩笛停', '普通高校本专科学生', '一般统考生', 0, 0, 203009, 8);
INSERT INTO `stu_info` VALUES (4803919, '用裔蛊', '普通高校本专科学生', '来华留学', 0, 0, 202109, 15);
INSERT INTO `stu_info` VALUES (5368505, '霜石▲', '普通高校本专科学生', '一般统考生', 0, 0, 202506, 10);
INSERT INTO `stu_info` VALUES (5521063, '浮皮蔡§', '普通高校本专科学生', '来华留学', 0, 0, 202810, 11);
INSERT INTO `stu_info` VALUES (6938200, '问勒鹏惮', '普通高校本专科学生', '港澳台生', 0, 0, 201801, 11);
INSERT INTO `stu_info` VALUES (7276262, '遇帝他', '普通高校本专科学生', '来华留学', 0, 0, 202605, 5);
INSERT INTO `stu_info` VALUES (7812089, '丰毫餐※', '普通高校本专科学生', '港澳台生', 0, 0, 202703, 16);
INSERT INTO `stu_info` VALUES (9028823, '睡垢十', '普通高校本专科学生', '港澳台生', 0, 0, 202107, 6);
INSERT INTO `stu_info` VALUES (9626596, '忙丸', '普通高校本专科学生', '民族班', 0, 0, 202608, 8);
INSERT INTO `stu_info` VALUES (9877012, '毕蚜※', '普通高校本专科学生', '一般统考生', 0, 0, 202105, 19);
INSERT INTO `stu_info` VALUES (10165672, '柱冷狈探', '普通高校本专科学生', '一般统考生', 0, 0, 201901, 2);
INSERT INTO `stu_info` VALUES (10348131, '八客京§', '普通高校本专科学生', '其他', 0, 0, 203002, 14);
INSERT INTO `stu_info` VALUES (10983982, '腐办蝗☆', '普通高校本专科学生', '来华留学', 0, 0, 202805, 14);
INSERT INTO `stu_info` VALUES (11540548, '靠符早末访', '普通高校本专科学生', '港澳台生', 0, 0, 202802, 11);
INSERT INTO `stu_info` VALUES (12498507, '低辑拨寄', '普通高校本专科学生', '来华留学', 0, 0, 202905, 9);
INSERT INTO `stu_info` VALUES (13640242, '弹友机仁', '普通高校本专科学生', '港澳台生', 0, 0, 202505, 4);
INSERT INTO `stu_info` VALUES (13700480, '凌另捏践', '普通高校本专科学生', '来华留学', 0, 0, 201802, 9);
INSERT INTO `stu_info` VALUES (14206566, '佳汛虚炔愈苦灶勋形合邦关还衙韩', '普通高校本专科学生', '其他', 0, 0, 202205, 18);
INSERT INTO `stu_info` VALUES (15512203, '步相载哈', '普通高校本专科学生', '其他', 0, 0, 202505, 11);
INSERT INTO `stu_info` VALUES (16238926, '磁夏纲窟', '普通高校本专科学生', '港澳台生', 0, 0, 202106, 3);
INSERT INTO `stu_info` VALUES (16413341, '瘤氛吵反', '普通高校本专科学生', '港澳台生', 0, 0, 202310, 19);
INSERT INTO `stu_info` VALUES (16466043, '诉睛貌从', '普通高校本专科学生', '港澳台生', 0, 0, 203004, 11);
INSERT INTO `stu_info` VALUES (16872358, '瘫具于初', '普通高校本专科学生', '其他', 0, 0, 202506, 18);
INSERT INTO `stu_info` VALUES (16947368, '辰眩条', '普通高校本专科学生', '其他', 0, 0, 202502, 19);
INSERT INTO `stu_info` VALUES (17342616, '拉贸尹宋', '普通高校本专科学生', '民族班', 0, 0, 202503, 15);
INSERT INTO `stu_info` VALUES (18880597, '沁木怖', '普通高校本专科学生', '来华留学', 0, 0, 202302, 10);
INSERT INTO `stu_info` VALUES (19284332, '羚往氧', '普通高校本专科学生', '港澳台生', 0, 0, 202607, 13);
INSERT INTO `stu_info` VALUES (20322299, '击靠蕴', '普通高校本专科学生', '民族班', 0, 0, 202604, 12);
INSERT INTO `stu_info` VALUES (20747376, '送珊袁※', '普通高校本专科学生', '港澳台生', 0, 0, 202404, 5);
INSERT INTO `stu_info` VALUES (20801640, '护寺恩', '普通高校本专科学生', '港澳台生', 0, 0, 202904, 10);
INSERT INTO `stu_info` VALUES (21567431, '爸落徊', '普通高校本专科学生', '其他', 0, 0, 201806, 18);
INSERT INTO `stu_info` VALUES (21592853, '男胸', '普通高校本专科学生', '港澳台生', 0, 0, 201801, 10);
INSERT INTO `stu_info` VALUES (21623323, '状枯煎', '普通高校本专科学生', '其他', 0, 0, 202207, 13);
INSERT INTO `stu_info` VALUES (23848233, '做昌参服', '普通高校本专科学生', '来华留学', 0, 0, 201706, 9);
INSERT INTO `stu_info` VALUES (24671403, '客脚娥赶此▲', '普通高校本专科学生', '其他', 0, 0, 202208, 13);
INSERT INTO `stu_info` VALUES (25366535, '兆早', '普通高校本专科学生', '其他', 0, 0, 201607, 13);
INSERT INTO `stu_info` VALUES (25429888, '杂敌专※', '普通高校本专科学生', '民族班', 0, 0, 202001, 13);
INSERT INTO `stu_info` VALUES (25714009, '延孝径', '普通高校本专科学生', '港澳台生', 0, 0, 202902, 8);
INSERT INTO `stu_info` VALUES (26892624, '杨睦丁', '普通高校本专科学生', '一般统考生', 0, 1, 201501, 21);
INSERT INTO `stu_info` VALUES (26893032, '木槐项', '普通高校本专科学生', '其他', 0, 0, 202706, 14);
INSERT INTO `stu_info` VALUES (27205513, '瞧槽矗博', '普通高校本专科学生', '来华留学', 0, 0, 202909, 12);
INSERT INTO `stu_info` VALUES (27382426, '规携限', '普通高校本专科学生', '民族班', 0, 0, 201507, 13);
INSERT INTO `stu_info` VALUES (27728917, '胃﻿祝', '普通高校本专科学生', '一般统考生', 0, 0, 201805, 2);
INSERT INTO `stu_info` VALUES (29403528, '孺郡研', '普通高校本专科学生', '港澳台生', 0, 0, 202702, 18);
INSERT INTO `stu_info` VALUES (30105924, '圣笔半', '普通高校本专科学生', '其他', 1, 0, 202602, 11);
INSERT INTO `stu_info` VALUES (30320446, '严彭于', '普通高校本专科学生', '民族班', 0, 0, 202904, 6);
INSERT INTO `stu_info` VALUES (30725848, '某郭农', '普通高校本专科学生', '民族班', 0, 0, 202501, 6);
INSERT INTO `stu_info` VALUES (31691972, '卉玫便', '普通高校本专科学生', '港澳台生', 1, 0, 202702, 10);
INSERT INTO `stu_info` VALUES (31955829, '烛妈驯', '普通高校本专科学生', '其他', 0, 0, 202110, 15);
INSERT INTO `stu_info` VALUES (32672631, '镜衣敝秀', '普通高校本专科学生', '港澳台生', 0, 0, 202602, 10);
INSERT INTO `stu_info` VALUES (33353163, '曹面腋', '普通高校本专科学生', '其他', 0, 0, 202604, 1);
INSERT INTO `stu_info` VALUES (33875134, '茅雄措', '普通高校本专科学生', '其他', 0, 0, 202502, 16);
INSERT INTO `stu_info` VALUES (34279044, '玲佳群', '普通高校本专科学生', '港澳台生', 0, 1, 202507, 21);
INSERT INTO `stu_info` VALUES (34385077, '册距充☆', '普通高校本专科学生', '港澳台生', 0, 0, 202101, 16);
INSERT INTO `stu_info` VALUES (34532930, '祭熟球', '普通高校本专科学生', '港澳台生', 0, 0, 202206, 17);
INSERT INTO `stu_info` VALUES (34615496, '矣二地纸', '普通高校本专科学生', '来华留学', 0, 0, 202704, 19);
INSERT INTO `stu_info` VALUES (35390314, '孔东导曙', '普通高校本专科学生', '一般统考生', 0, 0, 202410, 15);
INSERT INTO `stu_info` VALUES (35979444, '唐膛汉☆', '普通高校本专科学生', '民族班', 0, 0, 202206, 3);
INSERT INTO `stu_info` VALUES (36312541, '滁怪渗▲', '普通高校本专科学生', '来华留学', 0, 0, 202008, 15);
INSERT INTO `stu_info` VALUES (37367576, '车乐迎套', '普通高校本专科学生', '一般统考生', 0, 0, 202606, 16);
INSERT INTO `stu_info` VALUES (38930007, '就集吵', '普通高校本专科学生', '港澳台生', 0, 0, 202002, 10);
INSERT INTO `stu_info` VALUES (39247618, '暮健遁蜂', '普通高校本专科学生', '港澳台生', 0, 0, 202007, 1);
INSERT INTO `stu_info` VALUES (39449157, '熊笺慈正', '普通高校本专科学生', '来华留学', 0, 0, 201602, 16);
INSERT INTO `stu_info` VALUES (40288386, '暮甲厂▲', '普通高校本专科学生', '民族班', 0, 0, 202504, 15);
INSERT INTO `stu_info` VALUES (40546882, '伙料疹照熊', '普通高校本专科学生', '一般统考生', 1, 1, 201701, 21);
INSERT INTO `stu_info` VALUES (41696054, '卵边寅', '普通高校本专科学生', '来华留学', 0, 0, 202106, 16);
INSERT INTO `stu_info` VALUES (41796459, '张个载', '普通高校本专科学生', '来华留学', 0, 0, 203009, 2);
INSERT INTO `stu_info` VALUES (43327618, '们拨囤※', '普通高校本专科学生', '港澳台生', 0, 0, 201703, 16);
INSERT INTO `stu_info` VALUES (44967351, '晤遁§', '普通高校本专科学生', '民族班', 0, 0, 202807, 7);
INSERT INTO `stu_info` VALUES (46079310, '沫梳戚※', '普通高校本专科学生', '民族班', 0, 0, 202810, 1);
INSERT INTO `stu_info` VALUES (46160734, '箕着令毫', '普通高校本专科学生', '一般统考生', 0, 0, 202201, 5);
INSERT INTO `stu_info` VALUES (46494071, '巨盛▲', '普通高校本专科学生', '一般统考生', 0, 0, 201807, 20);
INSERT INTO `stu_info` VALUES (46573540, '雷象燕', '普通高校本专科学生', '一般统考生', 0, 0, 203006, 12);
INSERT INTO `stu_info` VALUES (47529373, '除思篓曾▲', '普通高校本专科学生', '其他', 0, 0, 201603, 13);
INSERT INTO `stu_info` VALUES (47867461, '萌玲设播', '普通高校本专科学生', '港澳台生', 0, 0, 201708, 4);
INSERT INTO `stu_info` VALUES (48413974, '露钡短', '普通高校本专科学生', '港澳台生', 0, 0, 202106, 12);
INSERT INTO `stu_info` VALUES (48855368, '备曾美', '普通高校本专科学生', '其他', 0, 0, 203008, 1);
INSERT INTO `stu_info` VALUES (50754534, '壮割雁§', '普通高校本专科学生', '其他', 0, 0, 202207, 15);
INSERT INTO `stu_info` VALUES (51009835, '詹珊房', '普通高校本专科学生', '来华留学', 0, 0, 202406, 15);
INSERT INTO `stu_info` VALUES (52372365, '项诡', '普通高校本专科学生', '民族班', 0, 0, 202501, 16);
INSERT INTO `stu_info` VALUES (52921408, '语征靠翻※', '普通高校本专科学生', '民族班', 0, 0, 202204, 4);
INSERT INTO `stu_info` VALUES (53141621, '桑赵弱盾', '普通高校本专科学生', '一般统考生', 0, 0, 202310, 12);
INSERT INTO `stu_info` VALUES (54133590, '愈播裔', '普通高校本专科学生', '港澳台生', 0, 0, 203002, 20);
INSERT INTO `stu_info` VALUES (54974544, '骨专她▲', '普通高校本专科学生', '其他', 0, 0, 201707, 12);
INSERT INTO `stu_info` VALUES (55241061, '型坤狠', '普通高校本专科学生', '港澳台生', 1, 0, 202106, 3);
INSERT INTO `stu_info` VALUES (56180260, '郎未铜', '普通高校本专科学生', '来华留学', 0, 0, 202309, 19);
INSERT INTO `stu_info` VALUES (56514922, '丑陆甸', '普通高校本专科学生', '其他', 0, 0, 202606, 19);
INSERT INTO `stu_info` VALUES (57353425, '顶敬众邦', '普通高校本专科学生', '民族班', 0, 0, 202606, 12);
INSERT INTO `stu_info` VALUES (57404657, '肃蕴折陪娟', '普通高校本专科学生', '来华留学', 0, 0, 202306, 8);
INSERT INTO `stu_info` VALUES (57516039, '灭火太▲', '普通高校本专科学生', '其他', 0, 0, 202207, 16);
INSERT INTO `stu_info` VALUES (57845728, '象粳免', '普通高校本专科学生', '来华留学', 0, 0, 203005, 10);
INSERT INTO `stu_info` VALUES (58625953, '哲相如☆', '普通高校本专科学生', '来华留学', 0, 0, 202403, 7);
INSERT INTO `stu_info` VALUES (60089312, '贾笔庆▲', '普通高校本专科学生', '来华留学', 0, 0, 202708, 2);
INSERT INTO `stu_info` VALUES (61927552, '决极壕龙', '普通高校本专科学生', '民族班', 0, 0, 203001, 1);
INSERT INTO `stu_info` VALUES (61983195, '哎兰亭林', '普通高校本专科学生', '民族班', 0, 1, 202406, 21);
INSERT INTO `stu_info` VALUES (62669538, '绿应磨', '普通高校本专科学生', '一般统考生', 0, 0, 201902, 3);
INSERT INTO `stu_info` VALUES (64512565, '麦惟间', '普通高校本专科学生', '来华留学', 0, 0, 202901, 18);
INSERT INTO `stu_info` VALUES (64771866, '驯山航', '普通高校本专科学生', '其他', 0, 0, 201807, 2);
INSERT INTO `stu_info` VALUES (65669036, '住陈替四', '普通高校本专科学生', '其他', 0, 0, 201508, 11);
INSERT INTO `stu_info` VALUES (66498413, '瓣费提征', '普通高校本专科学生', '港澳台生', 0, 0, 202204, 7);
INSERT INTO `stu_info` VALUES (67418410, '际郑阿', '普通高校本专科学生', '来华留学', 0, 0, 201501, 3);
INSERT INTO `stu_info` VALUES (68135231, '圣沸马倒亢', '普通高校本专科学生', '其他', 0, 0, 201903, 14);
INSERT INTO `stu_info` VALUES (68430192, '香迷穗※', '普通高校本专科学生', '民族班', 0, 0, 202404, 18);
INSERT INTO `stu_info` VALUES (69413460, '团羹肩', '普通高校本专科学生', '民族班', 0, 0, 202808, 3);
INSERT INTO `stu_info` VALUES (69897143, '椿笔通▲', '普通高校本专科学生', '民族班', 0, 0, 202908, 5);
INSERT INTO `stu_info` VALUES (70004430, '味则蜡', '普通高校本专科学生', '民族班', 0, 0, 202505, 9);
INSERT INTO `stu_info` VALUES (70195151, '亭吃敏翠☆', '普通高校本专科学生', '一般统考生', 0, 0, 201605, 5);
INSERT INTO `stu_info` VALUES (70305853, '每乃土咸', '普通高校本专科学生', '民族班', 0, 0, 202505, 10);
INSERT INTO `stu_info` VALUES (70632774, '砚睛页步', '普通高校本专科学生', '港澳台生', 0, 0, 202408, 9);
INSERT INTO `stu_info` VALUES (70746323, '菌坍被', '普通高校本专科学生', '来华留学', 0, 0, 202004, 9);
INSERT INTO `stu_info` VALUES (71078070, '例它厉', '普通高校本专科学生', '一般统考生', 0, 0, 201807, 20);
INSERT INTO `stu_info` VALUES (71671622, '鼎冯', '普通高校本专科学生', '民族班', 0, 0, 201604, 12);
INSERT INTO `stu_info` VALUES (72603778, '十振责苗', '普通高校本专科学生', '一般统考生', 0, 0, 202909, 8);
INSERT INTO `stu_info` VALUES (73925439, '绵预舜', '普通高校本专科学生', '来华留学', 0, 0, 202803, 20);
INSERT INTO `stu_info` VALUES (73983944, '激描他', '普通高校本专科学生', '民族班', 0, 0, 201502, 15);
INSERT INTO `stu_info` VALUES (74703959, '敏胸刀听', '普通高校本专科学生', '一般统考生', 0, 0, 201806, 6);
INSERT INTO `stu_info` VALUES (74741150, '婉稳获', '普通高校本专科学生', '其他', 0, 0, 202507, 14);
INSERT INTO `stu_info` VALUES (74884313, '渐束※', '普通高校本专科学生', '民族班', 0, 0, 202606, 7);
INSERT INTO `stu_info` VALUES (75127146, '宝锭', '普通高校本专科学生', '一般统考生', 0, 0, 202702, 7);
INSERT INTO `stu_info` VALUES (75479404, '姚宾粤他', '普通高校本专科学生', '其他', 1, 0, 201810, 4);
INSERT INTO `stu_info` VALUES (76324172, '克输', '普通高校本专科学生', '一般统考生', 0, 0, 202810, 19);
INSERT INTO `stu_info` VALUES (76529911, '升日训', '普通高校本专科学生', '来华留学', 0, 0, 202204, 12);
INSERT INTO `stu_info` VALUES (76712685, '控统信§', '普通高校本专科学生', '民族班', 0, 0, 202707, 1);
INSERT INTO `stu_info` VALUES (77432322, '纸葫式', '普通高校本专科学生', '一般统考生', 0, 0, 201510, 11);
INSERT INTO `stu_info` VALUES (77832257, '背锡屈▲', '普通高校本专科学生', '民族班', 0, 0, 201806, 1);
INSERT INTO `stu_info` VALUES (78089028, '排愉', '普通高校本专科学生', '民族班', 0, 0, 202410, 13);
INSERT INTO `stu_info` VALUES (78618234, '孺量', '普通高校本专科学生', '一般统考生', 0, 0, 202807, 1);
INSERT INTO `stu_info` VALUES (78619302, '靠常▲', '普通高校本专科学生', '来华留学', 0, 0, 202102, 11);
INSERT INTO `stu_info` VALUES (79260743, '洼从皿穆', '普通高校本专科学生', '一般统考生', 0, 0, 203007, 6);
INSERT INTO `stu_info` VALUES (79520505, '景伦肝灰', '普通高校本专科学生', '一般统考生', 0, 0, 202602, 9);
INSERT INTO `stu_info` VALUES (80483359, '并惟囤引', '普通高校本专科学生', '来华留学', 0, 0, 201804, 20);
INSERT INTO `stu_info` VALUES (80663518, '骤左玉', '普通高校本专科学生', '民族班', 0, 0, 202905, 5);
INSERT INTO `stu_info` VALUES (80841877, '辞痊诬', '普通高校本专科学生', '民族班', 0, 0, 201705, 2);
INSERT INTO `stu_info` VALUES (81284889, '闪莉感※', '普通高校本专科学生', '来华留学', 0, 0, 203010, 2);
INSERT INTO `stu_info` VALUES (81842162, '狱讨菱☆', '普通高校本专科学生', '其他', 0, 0, 202003, 14);
INSERT INTO `stu_info` VALUES (82446964, '夕捍滑', '普通高校本专科学生', '来华留学', 0, 0, 201605, 2);
INSERT INTO `stu_info` VALUES (82575303, '价多肆', '普通高校本专科学生', '一般统考生', 0, 0, 201807, 9);
INSERT INTO `stu_info` VALUES (82791768, '喷赴傣', '普通高校本专科学生', '民族班', 0, 0, 201506, 6);
INSERT INTO `stu_info` VALUES (83344817, '兼朋', '普通高校本专科学生', '港澳台生', 0, 0, 201910, 13);
INSERT INTO `stu_info` VALUES (84395738, '斜玉植', '普通高校本专科学生', '民族班', 0, 0, 202302, 12);
INSERT INTO `stu_info` VALUES (85490122, '临生持', '普通高校本专科学生', '一般统考生', 0, 0, 202303, 7);
INSERT INTO `stu_info` VALUES (85720734, '题常万', '普通高校本专科学生', '来华留学', 0, 0, 202305, 17);
INSERT INTO `stu_info` VALUES (86323976, '葫真完☆', '普通高校本专科学生', '一般统考生', 0, 0, 202905, 9);
INSERT INTO `stu_info` VALUES (86880776, '魁梨管', '普通高校本专科学生', '港澳台生', 0, 0, 201804, 16);
INSERT INTO `stu_info` VALUES (87639440, '献匡蜗', '普通高校本专科学生', '其他', 0, 0, 201606, 4);
INSERT INTO `stu_info` VALUES (88413887, '翁相', '普通高校本专科学生', '港澳台生', 0, 0, 202106, 8);
INSERT INTO `stu_info` VALUES (90440841, '总栈异', '普通高校本专科学生', '民族班', 0, 0, 201701, 5);
INSERT INTO `stu_info` VALUES (90787616, '类盐段刊述凹先慢惫束有须旋矗', '普通高校本专科学生', '港澳台生', 0, 0, 201802, 2);
INSERT INTO `stu_info` VALUES (90854599, '倦检去', '普通高校本专科学生', '来华留学', 1, 0, 202502, 18);
INSERT INTO `stu_info` VALUES (91161667, '主牟', '普通高校本专科学生', '一般统考生', 0, 0, 202509, 1);
INSERT INTO `stu_info` VALUES (91197802, '癸帛棕骤', '普通高校本专科学生', '其他', 0, 0, 201804, 5);
INSERT INTO `stu_info` VALUES (92435019, '否务侵', '普通高校本专科学生', '来华留学', 0, 0, 202704, 16);
INSERT INTO `stu_info` VALUES (92614677, '虽侠充☆', '普通高校本专科学生', '港澳台生', 0, 0, 201907, 9);
INSERT INTO `stu_info` VALUES (93791211, '和谴锡', '普通高校本专科学生', '民族班', 0, 0, 201710, 3);
INSERT INTO `stu_info` VALUES (93961187, '童戏后担', '普通高校本专科学生', '港澳台生', 0, 0, 201903, 17);
INSERT INTO `stu_info` VALUES (94095291, '恨餐夺※', '普通高校本专科学生', '来华留学', 0, 1, 202906, 21);
INSERT INTO `stu_info` VALUES (95350141, '蜂匀俯夹', '普通高校本专科学生', '港澳台生', 0, 0, 202006, 6);
INSERT INTO `stu_info` VALUES (96577697, '攻碑喷', '普通高校本专科学生', '港澳台生', 0, 0, 201601, 9);
INSERT INTO `stu_info` VALUES (96830032, '式图力', '普通高校本专科学生', '港澳台生', 0, 0, 203006, 15);
INSERT INTO `stu_info` VALUES (97135574, '期片板', '普通高校本专科学生', '其他', 0, 0, 202309, 6);
INSERT INTO `stu_info` VALUES (97557511, '倾毛璃', '普通高校本专科学生', '民族班', 0, 0, 202704, 20);
INSERT INTO `stu_info` VALUES (98909663, '补怕低桓', '普通高校本专科学生', '民族班', 0, 0, 202705, 10);
INSERT INTO `stu_info` VALUES (99213668, '媳埃脱', '普通高校本专科学生', '民族班', 0, 0, 202804, 1);
INSERT INTO `stu_info` VALUES (99729325, '订龄', '普通高校本专科学生', '民族班', 0, 0, 202509, 8);

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-31 23:32:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'N', 'admin', '2024-05-31 23:32:48', 'admin', '2024-07-08 00:24:39', '是否开启验证码功能（true开启，false关闭）');
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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '中山大学', 0, '钟明廷', '15888888888', 'test@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-06-21 09:31:50');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '珠海校区', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:33:27');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '南校区', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:33:37');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '软件工程学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:34:10');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '人工智能学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:34:30');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '微电子学院', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:34:46');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '土木工程学院', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:35:03');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-31 23:32:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '管理学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:34:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '数学学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:35:34');

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-06 17:38:52');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 17:39:05');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 19:31:39');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-06 19:53:25');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 19:53:28');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 19:53:32');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 20:07:51');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 22:10:01');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 08:13:02');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-07 11:11:28');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-07 12:33:35');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 12:33:39');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 16:33:48');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 19:32:12');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 23:08:45');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:23:45');
INSERT INTO `sys_logininfor` VALUES (168, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:23:55');
INSERT INTO `sys_logininfor` VALUES (169, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:24:19');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:24:24');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:26:13');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:27:31');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:27:36');
INSERT INTO `sys_logininfor` VALUES (174, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:27:48');
INSERT INTO `sys_logininfor` VALUES (175, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:28:20');
INSERT INTO `sys_logininfor` VALUES (176, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:28:31');
INSERT INTO `sys_logininfor` VALUES (177, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:29:47');
INSERT INTO `sys_logininfor` VALUES (178, 'wu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:29:58');
INSERT INTO `sys_logininfor` VALUES (179, 'wu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 00:30:20');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:30:27');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-08 09:00:04');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 09:00:06');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 12:59:22');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:30:09');
INSERT INTO `sys_logininfor` VALUES (185, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-08 14:30:21');
INSERT INTO `sys_logininfor` VALUES (186, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:30:32');
INSERT INTO `sys_logininfor` VALUES (187, 'lan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:30:39');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:30:43');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:31:34');
INSERT INTO `sys_logininfor` VALUES (190, 'stu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:31:41');
INSERT INTO `sys_logininfor` VALUES (191, 'stu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:31:51');
INSERT INTO `sys_logininfor` VALUES (192, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-08 14:32:02');
INSERT INTO `sys_logininfor` VALUES (193, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:32:04');
INSERT INTO `sys_logininfor` VALUES (194, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:32:10');
INSERT INTO `sys_logininfor` VALUES (195, 'wu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:32:17');
INSERT INTO `sys_logininfor` VALUES (196, 'wu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:32:24');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:32:29');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-08 14:32:47');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:33:08');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 15:22:28');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 18:24:08');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 21:01:32');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 22:23:41');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 23:34:48');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 01:29:07');
INSERT INTO `sys_logininfor` VALUES (206, 'test0', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-09 01:29:14');
INSERT INTO `sys_logininfor` VALUES (207, 'test0', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-09 01:29:19');
INSERT INTO `sys_logininfor` VALUES (208, 'test0', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-09 01:29:31');
INSERT INTO `sys_logininfor` VALUES (209, 'test0', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-09 01:29:36');
INSERT INTO `sys_logininfor` VALUES (210, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-09 01:29:47');
INSERT INTO `sys_logininfor` VALUES (211, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-09 01:29:55');
INSERT INTO `sys_logininfor` VALUES (212, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-09 01:30:04');
INSERT INTO `sys_logininfor` VALUES (213, 'su', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-09 01:30:09');
INSERT INTO `sys_logininfor` VALUES (214, 'Tim', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-09 01:31:14');
INSERT INTO `sys_logininfor` VALUES (215, 'Tim', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-09 01:31:27');
INSERT INTO `sys_logininfor` VALUES (216, 'Tim', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 01:31:32');
INSERT INTO `sys_logininfor` VALUES (217, 'Tim', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 01:36:08');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 01:36:17');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 01:51:57');
INSERT INTO `sys_logininfor` VALUES (220, 'Tim', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 01:52:11');
INSERT INTO `sys_logininfor` VALUES (221, 'Tim', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 01:53:28');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 01:53:33');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 02:08:34');
INSERT INTO `sys_logininfor` VALUES (224, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 02:08:48');
INSERT INTO `sys_logininfor` VALUES (225, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 02:09:49');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 02:10:00');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 03:43:50');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 04:30:42');
INSERT INTO `sys_logininfor` VALUES (229, '383842', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 04:31:20');
INSERT INTO `sys_logininfor` VALUES (230, '383842', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 04:32:10');
INSERT INTO `sys_logininfor` VALUES (231, 'Anna', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 04:32:38');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:37:06', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:37:13', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:37:24', '系统工具目录');
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
INSERT INTO `sys_menu` VALUES (2000, '成绩分析', 0, 1, 'tm', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2024-06-12 19:09:17', 'admin', '2024-07-08 00:36:59', '');
INSERT INTO `sys_menu` VALUES (2001, '成绩', 2000, 0, 'score', 'tm/score/index', NULL, 1, 0, 'C', '0', '0', 'tm:score:list', '#', 'admin', '2024-06-12 19:10:25', 'admin', '2024-07-09 00:51:23', '');
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
INSERT INTO `sys_menu` VALUES (2027, '管理员首页', 0, 0, 'indexTM', 'indexTM', NULL, 1, 0, 'C', '0', '0', '', 'people', 'admin', '2024-07-06 20:11:09', 'admin', '2024-07-08 14:12:08', '');
INSERT INTO `sys_menu` VALUES (2028, '课程信息', 2000, 1, 'Course', 'tm/Course/index', NULL, 1, 0, 'C', '0', '0', 'tm:Course:list', '#', 'admin', '2024-07-07 14:36:32', 'admin', '2024-07-08 10:23:30', '课程信息菜单');
INSERT INTO `sys_menu` VALUES (2029, '课程信息查询', 2028, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Course:query', '#', 'admin', '2024-07-07 14:36:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '课程信息新增', 2028, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Course:add', '#', 'admin', '2024-07-07 14:36:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '课程信息修改', 2028, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Course:edit', '#', 'admin', '2024-07-07 14:36:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '课程信息删除', 2028, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Course:remove', '#', 'admin', '2024-07-07 14:36:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '课程信息导出', 2028, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Course:export', '#', 'admin', '2024-07-07 14:36:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '成绩查询', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:query', '#', 'admin', '2024-07-08 00:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '成绩新增', 2001, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:add', '#', 'admin', '2024-07-08 00:42:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '成绩修改', 2001, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:edit', '#', 'admin', '2024-07-08 00:42:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '成绩删除', 2001, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:remove', '#', 'admin', '2024-07-08 00:43:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '成绩导出', 2001, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:export', '#', 'admin', '2024-07-08 00:44:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '成绩导入', 2001, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:import', '#', 'admin', '2024-07-08 00:44:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '教师首页', 0, 0, 'normal_teacher', 'normal_teacher', NULL, 1, 0, 'C', '0', '0', NULL, 'education', 'admin', '2024-07-08 14:13:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '班主任首页', 0, 0, 'teacher_welcome', 'teacher_welcome', NULL, 1, 0, 'C', '0', '0', NULL, 'education', 'admin', '2024-07-08 14:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '学生首页', 0, 0, 'index', 'index', NULL, 1, 0, 'C', '0', '0', NULL, 'people', 'admin', '2024-07-08 14:14:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '班级信息', 2000, 1, 'Class', 'tm/Class/index', NULL, 1, 0, 'C', '0', '0', 'tm:Class:list', '#', 'admin', '2024-07-08 15:39:48', '', NULL, '班级信息菜单');
INSERT INTO `sys_menu` VALUES (2044, '班级信息查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Class:query', '#', 'admin', '2024-07-08 15:39:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '班级信息新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Class:add', '#', 'admin', '2024-07-08 15:39:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '班级信息修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Class:edit', '#', 'admin', '2024-07-08 15:39:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '班级信息删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Class:remove', '#', 'admin', '2024-07-08 15:39:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '班级信息导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tm:Class:export', '#', 'admin', '2024-07-08 15:39:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, 'Student导入', 2003, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:info:import', '#', 'admin', '2024-07-09 00:50:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '专业导入', 2009, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:major:import', '#', 'admin', '2024-07-09 00:55:50', 'admin', '2024-07-09 00:56:03', '');
INSERT INTO `sys_menu` VALUES (2051, '教师信息导入', 2015, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:teacher:import', '#', 'admin', '2024-07-09 00:56:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '选课导入', 2021, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:choose:import', '#', 'admin', '2024-07-09 00:59:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '课程信息导入', 2028, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:Course:import', '#', 'admin', '2024-07-09 01:00:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '班级信息导入', 2043, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:Class:import', '#', 'admin', '2024-07-09 01:03:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '学生成绩', 2000, 0, 'stuscore', 'tm/score/stuindex', NULL, 1, 0, 'C', '0', '0', 'tm:score:list', '#', 'admin', '2024-07-09 01:43:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '学生成绩查询', 2056, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:query', '#', 'admin', '2024-07-09 01:58:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '学生成绩详情', 2056, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tm:score:detail', '#', 'admin', '2024-07-09 01:59:08', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 319 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_oper_log` VALUES (166, '成绩管理', 5, 'com.ruoyi.tm.controller.ScoreInfoController.export()', 'POST', 1, 'admin', '研发部门', '/tm/score/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-07-06 19:53:56', 835);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"indexMT\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexMT\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 20:11:09', 20);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"indexMT\",\"createTime\":\"2024-07-06 20:11:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexMT\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 20:11:43', 9);
INSERT INTO `sys_oper_log` VALUES (169, '成绩管理', 3, 'com.ruoyi.tm.controller.ScoreInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tm/score/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 22:51:14', 13);
INSERT INTO `sys_oper_log` VALUES (170, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 09:15:46', 24);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"indexTM\",\"createTime\":\"2024-07-06 20:11:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexTM\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 09:16:02', 16);
INSERT INTO `sys_oper_log` VALUES (172, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"test\",\"classId\":1,\"id\":2,\"inSchool\":1,\"majorId\":1,\"name\":\"李四\",\"params\":{},\"sex\":\"1\",\"type\":\"普通本科\",\"user_name\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:34:24', 17);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"course_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 14:33:09', 102);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"CourseInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":38,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名字\",\"columnId\":39,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"课程类型\",\"columnId\":40,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PeoLimit\",\"columnComment\":\"人数限制\",\"columnId\":41,\"columnName\":\"peo_limit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"peoLimit\",\"javaType\":\"Long\",\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 14:34:11', 26);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Course\",\"className\":\"CourseInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":38,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 14:34:11\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名字\",\"columnId\":39,\"columnName\":\"name\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 14:34:11\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"课程类型\",\"columnId\":40,\"columnName\":\"type\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 14:34:11\",\"usableColumn\":false},{\"capJavaField\":\"PeoLimit\",\"columnComment\":\"人数限制\",\"columnId\":41,\"columnName\":\"peo_limit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 14:33:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 14:34:47', 21);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"course_info\"}', NULL, 0, NULL, '2024-07-07 14:34:51', 112);
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"教师2\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"教师\",\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":164,\"userName\":\"Tea2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 23:57:01', 29);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"教师1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"教师\",\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":163,\"userName\":\"Tea1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 23:57:18', 12);
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"学生1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"学生\",\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":160,\"userName\":\"test1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 23:57:24', 11);
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"学生0\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"学生\",\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":161,\"userName\":\"test0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 23:57:29', 10);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:39:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"15@qq.com\",\"loginIp\":\"\",\"nickName\":\"苏老师\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"苏老师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 23:57:39', 16);
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:17:53', 78);
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"蓝老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:19:45', 16);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"蓝老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:19:52', 14);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"蓝老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:19:59', 14);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:39:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"15@qq.com\",\"loginIp\":\"\",\"nickName\":\"苏老师\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[103],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"苏老师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:20:47', 14);
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:40:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"email\":\"156@qq.com\",\"loginIp\":\"\",\"nickName\":\"吴某\",\"params\":{},\"phonenumber\":\"15094826584\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"吴老师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:20:58', 15);
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"学生1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"学生\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":160,\"userName\":\"test1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:21:07', 11);
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":160}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:21:15', 79);
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:21:24', 80);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:21:33', 77);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":157}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:22:54', 79);
INSERT INTO `sys_oper_log` VALUES (193, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:48\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:24:39', 15);
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,3,2001,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:25:02', 21);
INSERT INTO `sys_oper_log` VALUES (195, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2028,2029,2030,2031,2032,2033,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:25:17', 15);
INSERT INTO `sys_oper_log` VALUES (196, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:25:48', 13);
INSERT INTO `sys_oper_log` VALUES (197, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:26:03', 10);
INSERT INTO `sys_oper_log` VALUES (198, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:31:20', 13);
INSERT INTO `sys_oper_log` VALUES (199, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"珠海校区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"中山大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:33:27', 17);
INSERT INTO `sys_oper_log` VALUES (200, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"南校区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"中山大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:33:37', 10);
INSERT INTO `sys_oper_log` VALUES (201, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"管理学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"南校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:34:00', 9);
INSERT INTO `sys_oper_log` VALUES (202, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件工程学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:34:10', 10);
INSERT INTO `sys_oper_log` VALUES (203, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"人工智能学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:34:30', 14);
INSERT INTO `sys_oper_log` VALUES (204, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"微电子学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:34:46', 9);
INSERT INTO `sys_oper_log` VALUES (205, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"土木工程学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"珠海校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:35:03', 9);
INSERT INTO `sys_oper_log` VALUES (206, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:35:13', 6);
INSERT INTO `sys_oper_log` VALUES (207, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"管理学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"南校区\",\"phone\":\"15888888888\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'管理学院\'失败，部门名称已存在\",\"code\":500}', 0, NULL, '2024-07-08 00:35:27', 2);
INSERT INTO `sys_oper_log` VALUES (208, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"数学学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"南校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:35:34', 8);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-07-08 00:36:03', 2);
INSERT INTO `sys_oper_log` VALUES (210, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-31 23:32:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,3,2001,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:36:12', 15);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-07-08 00:36:20', 3);
INSERT INTO `sys_oper_log` VALUES (212, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2028,2029,2030,2031,2032,2033,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:36:35', 13);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:36:44', 5);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-12 19:09:17\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"成绩分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:36:59', 10);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-31 23:32:47\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:37:06', 6);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-31 23:32:47\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:37:13', 6);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-31 23:32:47\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:37:24', 6);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:42:04', 6);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:42:30', 6);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:42:53', 5);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:43:43', 5);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:44:15', 6);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"perms\":\"tm:score:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 00:44:56', 6);
INSERT INTO `sys_oper_log` VALUES (224, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-07-08 09:01:46', 75);
INSERT INTO `sys_oper_log` VALUES (225, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2024-07-08 09:03:32', 5);
INSERT INTO `sys_oper_log` VALUES (226, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2024-07-08 09:05:46', 191);
INSERT INTO `sys_oper_log` VALUES (227, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":5,\"facId\":1,\"name\":\"概率统计\",\"params\":{},\"peoLimit\":120,\"startSem\":1,\"startYear\":22,\"teachId\":100,\"totTime\":20}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,                          peo_limit,             credit,             tot_time,                          start_year,             start_sem,             fac_id,             teach_id )           values ( ?,                          ?,             ?,             ?,                          ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2024-07-08 09:12:56', 8);
INSERT INTO `sys_oper_log` VALUES (228, '课程信息', 2, 'com.ruoyi.tm.controller.CourseInfoController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":4,\"facId\":1,\"finalMethod\":\"考试\",\"id\":1,\"name\":\"计算机组成原理\",\"params\":{},\"peoLimit\":50,\"startSem\":1,\"startYear\":21,\"teachId\":100,\"totTime\":201,\"type\":\"专必\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 09:18:52', 9);
INSERT INTO `sys_oper_log` VALUES (229, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":2,\"name\":\"adm\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\StuInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.StuInfoMapper.updateStuInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update stu_info          SET name = ?,             type = ?,             adm_method = ?,             in_school = ?,             stu_status = ?,             class_id = ?,             major_id = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)', '2024-07-08 09:21:17', 13);
INSERT INTO `sys_oper_log` VALUES (230, 'Student', 2, 'com.ruoyi.tm.controller.StuInfoController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"一般统考\",\"classId\":1,\"id\":1,\"inSchool\":0,\"majorId\":1,\"name\":\"adm\",\"params\":{},\"sex\":\"1\",\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 09:21:22', 6);
INSERT INTO `sys_oper_log` VALUES (231, '专业', 1, 'com.ruoyi.tm.controller.MajorInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/major', '127.0.0.1', '内网IP', '{\"dura\":18,\"facId\":1,\"graScore\":90,\"id\":2,\"majChoose\":30,\"majMust\":20,\"name\":\"人工智能\",\"params\":{},\"pubChoose\":10,\"pubMust\":30}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 09:36:30', 16);
INSERT INTO `sys_oper_log` VALUES (232, '专业', 3, 'com.ruoyi.tm.controller.MajorInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/major/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`))\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\MajorInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.MajorInfoMapper.deleteMajorInfoByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from major_info where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`tm_db`.`stu_info`, CONSTRAINT `fk_majorid` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`id`))', '2024-07-08 09:50:06', 9);
INSERT INTO `sys_oper_log` VALUES (233, '专业', 3, 'com.ruoyi.tm.controller.MajorInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/major/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 09:50:08', 4);
INSERT INTO `sys_oper_log` VALUES (234, '教师信息', 2, 'com.ruoyi.tm.controller.TeaInfoController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"id\":100,\"name\":\"吴老师\",\"params\":{},\"type\":\"教师\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\TeaInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.TeaInfoMapper.updateTeaInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update tea_info          SET name = ?,             type = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'\n; Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'吴老师\' for key \'tea_info.fk_Name\'', '2024-07-08 10:12:35', 10);
INSERT INTO `sys_oper_log` VALUES (235, '选课', 1, 'com.ruoyi.tm.controller.ChooseCourseController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/choose', '127.0.0.1', '内网IP', '{\"courseId\":3,\"deferSign\":0,\"numMakeup\":0,\"numRebuild\":0,\"params\":{},\"pass\":0,\"stuId\":160}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 10:18:29', 10);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/Course/index\",\"createTime\":\"2024-07-07 14:36:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"Course\",\"perms\":\"tm:Course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 10:23:30', 13);
INSERT INTO `sys_oper_log` VALUES (237, '教师信息', 2, 'com.ruoyi.tm.controller.TeaInfoController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"id\":162,\"name\":\"Tea3\",\"params\":{},\"type\":\"教师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 10:33:24', 5);
INSERT INTO `sys_oper_log` VALUES (238, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":5,\"facId\":1,\"finalMethod\":\"考试\",\"id\":9,\"name\":\"数据结构\",\"params\":{},\"peoLimit\":100,\"startSem\":2,\"startYear\":20,\"teachId\":100,\"totTime\":30,\"type\":\"专必\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 13:02:09', 16);
INSERT INTO `sys_oper_log` VALUES (239, '教师信息', 1, 'com.ruoyi.tm.controller.TeaInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"name\":\"洋溢辉\",\"params\":{}}', NULL, 1, 'Cannot invoke \"String.equals(Object)\" because the return value of \"com.ruoyi.tm.domain.TeaInfo.getType()\" is null', '2024-07-08 13:20:53', 75);
INSERT INTO `sys_oper_log` VALUES (240, '教师信息', 1, 'com.ruoyi.tm.controller.TeaInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"id\":166,\"name\":\"洋溢辉\",\"params\":{},\"type\":\"教师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 13:27:34', 94);
INSERT INTO `sys_oper_log` VALUES (241, '教师信息', 1, 'com.ruoyi.tm.controller.TeaInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"id\":167,\"name\":\"钢铁侠\",\"params\":{},\"type\":\"教务老师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 13:28:38', 88);
INSERT INTO `sys_oper_log` VALUES (242, '教师信息', 1, 'com.ruoyi.tm.controller.TeaInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"id\":168,\"name\":\"超人强\",\"params\":{},\"type\":\"班主任\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 13:28:48', 89);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"indexTM\",\"createTime\":\"2024-07-06 20:11:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"管理员首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"indexTM\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:12:08', 6);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"normal_teacher\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教师首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"normal_teacher\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:13:44', 10);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"teacher_welcome\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"班主任首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"teacher_welcome\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:14:14', 5);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:14:44', 7);
INSERT INTO `sys_oper_log` VALUES (247, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2000,2001,2034,2035,2036,2037,2038,2039,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:16:31', 22);
INSERT INTO `sys_oper_log` VALUES (248, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2042,2034],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:16:54', 15);
INSERT INTO `sys_oper_log` VALUES (249, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2040,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:17:10', 11);
INSERT INTO `sys_oper_log` VALUES (250, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2041,2000,2001,2034,2035,2036,2037,2038,2039,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:17:20', 10);
INSERT INTO `sys_oper_log` VALUES (251, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-31 23:32:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"微电子学院\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-31 23:32:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"lan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:19:00', 20);
INSERT INTO `sys_oper_log` VALUES (252, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:39:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"人工智能学院\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"15@qq.com\",\"loginIp\":\"\",\"nickName\":\"苏老师\",\"params\":{},\"phonenumber\":\"15016248165\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[103],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"苏老师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:19:38', 11);
INSERT INTO `sys_oper_log` VALUES (253, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-01 19:40:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"人工智能学院\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"156@qq.com\",\"loginIp\":\"\",\"nickName\":\"吴某\",\"params\":{},\"phonenumber\":\"15094826584\",\"postIds\":[4],\"remark\":\"老师\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"吴老师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:19:43', 9);
INSERT INTO `sys_oper_log` VALUES (254, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '软件工程学院', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:31:17', 81);
INSERT INTO `sys_oper_log` VALUES (255, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '软件工程学院', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:31:24', 78);
INSERT INTO `sys_oper_log` VALUES (256, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '软件工程学院', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":157}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 14:31:31', 79);
INSERT INTO `sys_oper_log` VALUES (257, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程学院', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"class_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 15:34:20', 71);
INSERT INTO `sys_oper_log` VALUES (258, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '软件工程学院', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"ClassInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"班级id\",\"columnId\":49,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Grade\",\"columnComment\":\"所在年级\",\"columnId\":50,\"columnName\":\"grade\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"grade\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TeachId\",\"columnComment\":\"班主任id\",\"columnId\":51,\"columnName\":\"teach_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teachId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassNum\",\"columnComment\":\"班号\",\"columnId\":52,\"columnName\":\"class_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classNum\",\"javaType\":\"Long\",\"list\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 15:35:00', 24);
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '软件工程学院', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Class\",\"className\":\"ClassInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"班级id\",\"columnId\":49,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-07-08 15:35:00\",\"usableColumn\":false},{\"capJavaField\":\"Grade\",\"columnComment\":\"所在年级\",\"columnId\":50,\"columnName\":\"grade\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"grade\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-07-08 15:35:00\",\"usableColumn\":false},{\"capJavaField\":\"TeachId\",\"columnComment\":\"班主任id\",\"columnId\":51,\"columnName\":\"teach_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teachId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-07-08 15:35:00\",\"usableColumn\":false},{\"capJavaField\":\"ClassNum\",\"columnComment\":\"班号\",\"columnId\":52,\"columnName\":\"class_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-08 15:34:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 15:36:00', 11);
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '软件工程学院', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"class_info\"}', NULL, 0, NULL, '2024-07-08 15:36:03', 291);
INSERT INTO `sys_oper_log` VALUES (261, '选课', 1, 'com.ruoyi.tm.controller.ChooseCourseController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/choose', '127.0.0.1', '内网IP', '{\"courseId\":1,\"deferSign\":0,\"numMakeup\":0,\"numRebuild\":0,\"params\":{},\"pass\":1,\"stuId\":157}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 19:21:49', 14);
INSERT INTO `sys_oper_log` VALUES (262, '教师信息', 2, 'com.ruoyi.tm.controller.TeaInfoController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/tm/teacher', '127.0.0.1', '内网IP', '{\"id\":168,\"name\":\"超人强\",\"params\":{},\"type\":\"教师\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 21:39:19', 12);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Student导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"perms\":\"system:info:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:50:45', 100);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/score/index\",\"createTime\":\"2024-06-12 19:10:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"成绩\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"score\",\"perms\":\"tm:score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:51:23', 10);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-07-09 00:51:30', 7);
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2040,2001,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:51:50', 31);
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2027,2001,2034,2035,2036,2037,2038,2039,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:52:03', 22);
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2041,2001,2034,2035,2036,2037,2038,2039,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:52:10', 14);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:52:19', 8);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"专业导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2009,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:55:50', 14);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-09 00:55:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"专业导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2009,\"path\":\"\",\"perms\":\"tm:major:import\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:56:03', 10);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教师信息导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2015,\"perms\":\"tm:teacher:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:56:38', 15);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"选课导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2021,\"perms\":\"tm:choose:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 00:59:05', 15);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程信息导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2028,\"perms\":\"tm:Course:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:00:31', 15);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"班级信息导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2043,\"perms\":\"tm:Class:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:03:48', 13);
INSERT INTO `sys_oper_log` VALUES (276, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2015,2028,2043,2042,2034,2038,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:06:48', 22);
INSERT INTO `sys_oper_log` VALUES (277, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:13:37', 18);
INSERT INTO `sys_oper_log` VALUES (278, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2000,2001,2034,2035,2036,2037,2038,2039,2003,2004,2005,2006,2007,2008,2049,2009,2010,2011,2012,2013,2014,2050,2015,2016,2017,2018,2019,2020,2051,2021,2022,2023,2024,2025,2026,2052,2028,2029,2030,2031,2032,2033,2053,2043,2044,2045,2046,2047,2048,2054],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:20:27', 13);
INSERT INTO `sys_oper_log` VALUES (279, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2041,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:21:24', 12);
INSERT INTO `sys_oper_log` VALUES (280, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:21:36', 18);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/score/stuindex\",\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"stuscore\",\"perms\":\"tm:score:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:40:27', 22);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/system/menu/2055', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:42:11', 18);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tm/score/stuindex\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"stuscore\",\"perms\":\"tm:score:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:43:02', 16);
INSERT INTO `sys_oper_log` VALUES (284, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2015,2028,2043,2042,2034,2038,2056,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:45:39', 27);
INSERT INTO `sys_oper_log` VALUES (285, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2056,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:45:48', 22);
INSERT INTO `sys_oper_log` VALUES (286, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2000,2001,2034,2035,2036,2037,2038,2039,2056,2003,2004,2005,2006,2007,2008,2049,2009,2010,2011,2012,2013,2014,2050,2015,2016,2017,2018,2019,2020,2051,2021,2022,2023,2024,2025,2026,2052,2028,2029,2030,2031,2032,2033,2053,2043,2044,2045,2046,2047,2048,2054],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:46:05', 15);
INSERT INTO `sys_oper_log` VALUES (287, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2041,2001,2034,2035,2036,2037,2038,2039,2056,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:46:17', 11);
INSERT INTO `sys_oper_log` VALUES (288, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2040,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"教师权限\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:50:04', 12);
INSERT INTO `sys_oper_log` VALUES (289, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:51:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2027,2001,2034,2035,2036,2037,2038,2039,2003,2004,2005,2006,2007,2008,2049,2009,2010,2011,2012,2013,2014,2050,2015,2016,2017,2018,2019,2020,2051,2021,2022,2023,2024,2025,2026,2052,2028,2029,2030,2031,2032,2033,2053,2043,2044,2045,2046,2047,2048,2054],\"params\":{},\"remark\":\"教务老师权限\",\"roleId\":102,\"roleKey\":\"m_teacher\",\"roleName\":\"教务老师\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:50:12', 15);
INSERT INTO `sys_oper_log` VALUES (290, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-05 21:10:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2003,2009,2015,2021,2028,2043,2041,2001,2034,2035,2036,2037,2038,2039,2004,2008,2010,2014,2016,2020,2022,2026,2029,2033,2044,2048],\"params\":{},\"remark\":\"班主任权限\",\"roleId\":103,\"roleKey\":\"ClassTeacher\",\"roleName\":\"班主任\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:50:20', 18);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩查询\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2056,\"perms\":\"tm:score:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:58:20', 5);
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2056,\"perms\":\"tm:score:detail\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 01:59:08', 6);
INSERT INTO `sys_oper_log` VALUES (293, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2015,2028,2043,2042,2034,2038,2056,2057,2058,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:01:57', 19);
INSERT INTO `sys_oper_log` VALUES (294, 'Student', 1, 'com.ruoyi.tm.controller.StuInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/system/info', '127.0.0.1', '内网IP', '{\"admMethod\":\"普通统考\",\"classId\":2,\"id\":172,\"inSchool\":0,\"majorId\":2,\"name\":\"test\",\"params\":{},\"stuStatus\":1,\"type\":\"普通考生\",\"user_name\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:08:25', 80);
INSERT INTO `sys_oper_log` VALUES (295, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '软件工程学院', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-21 08:50:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2009,2015,2028,2043,2042,2056,2057,2058,2010,2014,2016,2020,2029,2033,2044,2048],\"params\":{},\"remark\":\"学生的权限\",\"roleId\":100,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:10:17', 10);
INSERT INTO `sys_oper_log` VALUES (296, 'Student', 3, 'com.ruoyi.tm.controller.StuInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/system/info/172', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:28:55', 7);
INSERT INTO `sys_oper_log` VALUES (297, '班级信息', 3, 'com.ruoyi.tm.controller.ClassInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Class/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:40:42', 11);
INSERT INTO `sys_oper_log` VALUES (298, '班级信息', 3, 'com.ruoyi.tm.controller.ClassInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Class/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:40:44', 6);
INSERT INTO `sys_oper_log` VALUES (299, '班级信息', 3, 'com.ruoyi.tm.controller.ClassInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Class/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:40:45', 5);
INSERT INTO `sys_oper_log` VALUES (300, '班级信息', 3, 'com.ruoyi.tm.controller.ClassInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Class/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:40:47', 5);
INSERT INTO `sys_oper_log` VALUES (301, '班级信息', 3, 'com.ruoyi.tm.controller.ClassInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Class/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 02:40:48', 5);
INSERT INTO `sys_oper_log` VALUES (302, '专业', 3, 'com.ruoyi.tm.controller.MajorInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/major/1,2,3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 03:44:01', 12);
INSERT INTO `sys_oper_log` VALUES (303, '专业', 3, 'com.ruoyi.tm.controller.MajorInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/major/11,12,13,14,15,16,17,18,19,20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 03:44:03', 6);
INSERT INTO `sys_oper_log` VALUES (304, '专业', 3, 'com.ruoyi.tm.controller.MajorInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/major/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 03:44:06', 7);
INSERT INTO `sys_oper_log` VALUES (305, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":1,\"facId\":1,\"finalMethod\":\"考试\",\"name\":\"1\",\"params\":{},\"peoLimit\":1,\"startSem\":1,\"startYear\":1,\"teachId\":1,\"totTime\":1,\"type\":\"专必\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`course_info`, CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT)\r\n### The error may exist in file [F:\\grade_sys\\grade_inquiry_system\\ruoyi-tm\\target\\classes\\mapper\\tm\\CourseInfoMapper.xml]\r\n### The error may involve com.ruoyi.tm.mapper.CourseInfoMapper.insertCourseInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course_info          ( name,             type,             peo_limit,             credit,             tot_time,             final_method,             start_year,             start_sem,             fac_id,             teach_id )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`course_info`, CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT)\n; Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`course_info`, CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`tm_db`.`course_info`, CONSTRAINT `fk_tea` FOREIGN KEY (`teach_id`) REFERENCES `tea_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT)', '2024-07-09 04:02:50', 44);
INSERT INTO `sys_oper_log` VALUES (306, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":1,\"facId\":1,\"finalMethod\":\"考试\",\"id\":13,\"name\":\"1\",\"params\":{},\"peoLimit\":1,\"startSem\":1,\"startYear\":1,\"teachId\":2,\"totTime\":1,\"type\":\"专必\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:02:53', 6);
INSERT INTO `sys_oper_log` VALUES (307, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:02:58', 6);
INSERT INTO `sys_oper_log` VALUES (308, '课程信息', 1, 'com.ruoyi.tm.controller.CourseInfoController.add()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course', '127.0.0.1', '内网IP', '{\"credit\":1,\"facId\":1,\"finalMethod\":\"考试\",\"id\":14,\"name\":\"1\",\"params\":{},\"peoLimit\":1,\"startSem\":1,\"startYear\":1,\"teachId\":2,\"totTime\":1,\"type\":\"专必\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:03:20', 4);
INSERT INTO `sys_oper_log` VALUES (309, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:10:46', 3);
INSERT INTO `sys_oper_log` VALUES (310, '课程信息', 5, 'com.ruoyi.tm.controller.CourseInfoController.export()', 'POST', 1, 'admin', '软件工程学院', '/tm/Course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-07-09 04:14:59', 609);
INSERT INTO `sys_oper_log` VALUES (311, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:15:10', 6);
INSERT INTO `sys_oper_log` VALUES (312, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:15:13', 5);
INSERT INTO `sys_oper_log` VALUES (313, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:15:15', 4);
INSERT INTO `sys_oper_log` VALUES (314, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:15:17', 4);
INSERT INTO `sys_oper_log` VALUES (315, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:16:58', 4);
INSERT INTO `sys_oper_log` VALUES (316, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:17:00', 4);
INSERT INTO `sys_oper_log` VALUES (317, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:17:29', 5);
INSERT INTO `sys_oper_log` VALUES (318, '课程信息', 3, 'com.ruoyi.tm.controller.CourseInfoController.remove()', 'DELETE', 1, 'admin', '软件工程学院', '/tm/Course/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-09 04:17:30', 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

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
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `role_name`(`role_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-31 23:32:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 00:36:12', '普通角色');
INSERT INTO `sys_role` VALUES (100, '学生', 'student', 3, '1', 1, 1, '0', '0', 'admin', '2024-06-21 08:50:06', 'admin', '2024-07-09 02:10:17', '学生的权限');
INSERT INTO `sys_role` VALUES (101, '教师', 'teacher', 4, '1', 1, 1, '0', '0', 'admin', '2024-06-21 08:50:55', 'admin', '2024-07-09 01:50:04', '教师权限');
INSERT INTO `sys_role` VALUES (102, '教务老师', 'm_teacher', 5, '1', 1, 1, '0', '0', 'admin', '2024-06-21 08:51:36', 'admin', '2024-07-09 01:50:12', '教务老师权限');
INSERT INTO `sys_role` VALUES (103, '班主任', 'ClassTeacher', 6, '1', 1, 1, '0', '0', 'admin', '2024-07-05 21:10:36', 'admin', '2024-07-09 01:50:20', '班主任权限');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
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
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2026);
INSERT INTO `sys_role_menu` VALUES (101, 2028);
INSERT INTO `sys_role_menu` VALUES (101, 2029);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (101, 2036);
INSERT INTO `sys_role_menu` VALUES (101, 2037);
INSERT INTO `sys_role_menu` VALUES (101, 2038);
INSERT INTO `sys_role_menu` VALUES (101, 2039);
INSERT INTO `sys_role_menu` VALUES (101, 2040);
INSERT INTO `sys_role_menu` VALUES (101, 2043);
INSERT INTO `sys_role_menu` VALUES (101, 2044);
INSERT INTO `sys_role_menu` VALUES (101, 2048);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (102, 2006);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 2010);
INSERT INTO `sys_role_menu` VALUES (102, 2011);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (102, 2013);
INSERT INTO `sys_role_menu` VALUES (102, 2014);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2017);
INSERT INTO `sys_role_menu` VALUES (102, 2018);
INSERT INTO `sys_role_menu` VALUES (102, 2019);
INSERT INTO `sys_role_menu` VALUES (102, 2020);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);
INSERT INTO `sys_role_menu` VALUES (102, 2025);
INSERT INTO `sys_role_menu` VALUES (102, 2026);
INSERT INTO `sys_role_menu` VALUES (102, 2027);
INSERT INTO `sys_role_menu` VALUES (102, 2028);
INSERT INTO `sys_role_menu` VALUES (102, 2029);
INSERT INTO `sys_role_menu` VALUES (102, 2030);
INSERT INTO `sys_role_menu` VALUES (102, 2031);
INSERT INTO `sys_role_menu` VALUES (102, 2032);
INSERT INTO `sys_role_menu` VALUES (102, 2033);
INSERT INTO `sys_role_menu` VALUES (102, 2034);
INSERT INTO `sys_role_menu` VALUES (102, 2035);
INSERT INTO `sys_role_menu` VALUES (102, 2036);
INSERT INTO `sys_role_menu` VALUES (102, 2037);
INSERT INTO `sys_role_menu` VALUES (102, 2038);
INSERT INTO `sys_role_menu` VALUES (102, 2039);
INSERT INTO `sys_role_menu` VALUES (102, 2043);
INSERT INTO `sys_role_menu` VALUES (102, 2044);
INSERT INTO `sys_role_menu` VALUES (102, 2045);
INSERT INTO `sys_role_menu` VALUES (102, 2046);
INSERT INTO `sys_role_menu` VALUES (102, 2047);
INSERT INTO `sys_role_menu` VALUES (102, 2048);
INSERT INTO `sys_role_menu` VALUES (102, 2049);
INSERT INTO `sys_role_menu` VALUES (102, 2050);
INSERT INTO `sys_role_menu` VALUES (102, 2051);
INSERT INTO `sys_role_menu` VALUES (102, 2052);
INSERT INTO `sys_role_menu` VALUES (102, 2053);
INSERT INTO `sys_role_menu` VALUES (102, 2054);
INSERT INTO `sys_role_menu` VALUES (103, 2000);
INSERT INTO `sys_role_menu` VALUES (103, 2001);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2004);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 2009);
INSERT INTO `sys_role_menu` VALUES (103, 2010);
INSERT INTO `sys_role_menu` VALUES (103, 2014);
INSERT INTO `sys_role_menu` VALUES (103, 2015);
INSERT INTO `sys_role_menu` VALUES (103, 2016);
INSERT INTO `sys_role_menu` VALUES (103, 2020);
INSERT INTO `sys_role_menu` VALUES (103, 2021);
INSERT INTO `sys_role_menu` VALUES (103, 2022);
INSERT INTO `sys_role_menu` VALUES (103, 2026);
INSERT INTO `sys_role_menu` VALUES (103, 2028);
INSERT INTO `sys_role_menu` VALUES (103, 2029);
INSERT INTO `sys_role_menu` VALUES (103, 2033);
INSERT INTO `sys_role_menu` VALUES (103, 2034);
INSERT INTO `sys_role_menu` VALUES (103, 2035);
INSERT INTO `sys_role_menu` VALUES (103, 2036);
INSERT INTO `sys_role_menu` VALUES (103, 2037);
INSERT INTO `sys_role_menu` VALUES (103, 2038);
INSERT INTO `sys_role_menu` VALUES (103, 2039);
INSERT INTO `sys_role_menu` VALUES (103, 2041);
INSERT INTO `sys_role_menu` VALUES (103, 2043);
INSERT INTO `sys_role_menu` VALUES (103, 2044);
INSERT INTO `sys_role_menu` VALUES (103, 2048);

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
  INDEX `user_name`(`user_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99729326 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-09 03:43:50', 'admin', '2024-05-31 23:32:47', '', '2024-07-09 03:43:50', '管理员');
INSERT INTO `sys_user` VALUES (2, 103, 'lan', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-08 14:30:32', 'admin', '2024-05-31 23:32:47', 'admin', '2024-07-08 14:30:32', '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'Anna', 'Anna', '00', '', '', '0', '', '$2a$10$nTKMFarDhmyE7LzqObCE2O2.6Qr4re2tNlNbJmBD7h834410q4ivG', '0', '0', '127.0.0.1', '2024-07-09 04:32:39', NULL, '2024-07-09 03:46:08', '', '2024-07-09 04:32:38', '教务老师');
INSERT INTO `sys_user` VALUES (4, NULL, 'James', 'James', '00', '', '', '0', '', '$2a$10$fywen5orxXBJ1yQRXYYtc.eC1xu3.6Bnq1UeVcaD64BCSg7nEkh1u', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (5, NULL, 'Poul', 'Poul', '00', '', '', '0', '', '$2a$10$rPPg92KV3u0hEmAFRoXlv.YL47PRf8k7D6Lizv.hE4Faszkg8XDO.', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (6, NULL, 'John', 'John', '00', '', '', '0', '', '$2a$10$QbYs5XywCjpfdJv13jlQZeOzpI5UoiJ/q0X7K0nCzGJJOM6R7RVLO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (7, NULL, 'Alice', 'Alice', '00', '', '', '0', '', '$2a$10$zngzrsJp11MLDGpmNMVkT.6Ce77vKTurlQiqyTSH59uT8MOvdUsLC', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (8, NULL, 'Mary', 'Mary', '00', '', '', '0', '', '$2a$10$AxCtZHWLCyadlqznDvGsGu95dyyPhURk.3Bu/ssGCxOdiihk.ibpq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (9, NULL, 'David', 'David', '00', '', '', '0', '', '$2a$10$tPPnhdst.Nh2SPaDOLTrmOyoDAcoFnoMsGu.H.yAfl2jiQU4o/.L.', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (10, NULL, 'Michael', 'Michael', '00', '', '', '0', '', '$2a$10$KA7MM4crKfVMSWrljs26ROkH4bq7k1eMlgUonIPeB44Yg4UMYnE4W', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (11, NULL, 'Emily', 'Emily', '00', '', '', '0', '', '$2a$10$Y.BawyaJpzfEfB6K4qIbTe4Uf92Wb/SvOP3gFeoQyYtSUMAsJJTYa', '0', '0', '', NULL, NULL, '2024-07-09 03:46:08', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (12, NULL, 'Robert', 'Robert', '00', '', '', '0', '', '$2a$10$W3CvKoyp580opgc/wRLpCe.GS7hrBtX7.193CF467W9t2YKxf9G0a', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (13, NULL, 'Jessica', 'Jessica', '00', '', '', '0', '', '$2a$10$XPh8.hqiryydAg9n4IUI4.MHXKKkJ8zMqxb.C8sOHb/flH5OWk7zq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (14, NULL, 'Daniel', 'Daniel', '00', '', '', '0', '', '$2a$10$wOqCWqEMbfWVqyJvaO806u8EY2i2M1g9Po/Dfr53HzxzA4hneTfp2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (15, NULL, 'Sarah', 'Sarah', '00', '', '', '0', '', '$2a$10$Pc/G059abxmZrKR.P1u9zePD5zmy1KdqisRPzRNcVmR8hG8d7jTbO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (16, NULL, 'Matthew', 'Matthew', '00', '', '', '0', '', '$2a$10$O4dSQAdHG7gZQFPTqFCPzuQVowmGM8CSNbZ1ilUDW.I3Z3uocp4Ka', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (17, NULL, 'Jennifer', 'Jennifer', '00', '', '', '0', '', '$2a$10$aiH4Tk0Dw8KzwA7QgqJ3Z.XP7T./1.NeZ8ntw3p0xNnQO56INRJme', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (18, NULL, 'Christopher', 'Christopher', '00', '', '', '0', '', '$2a$10$2NGfDtVu1.Yz5j3/2iw.h.R6D6V./ePLDkTMJ8bxe/L7JGqvJ7mQy', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (19, NULL, 'Elizabeth', 'Elizabeth', '00', '', '', '0', '', '$2a$10$eHgsrY8vtE/PmCNG5mwkjuD2zIxuax/8IFD/FQd2tQt1TOKOfL4d.', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (20, NULL, 'Joshua', 'Joshua', '00', '', '', '0', '', '$2a$10$mcCHUyf7vuZNpzvNKZuMbeTzXxskoWI.aOuAJtaHK7fXww8qS5POO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (21, NULL, 'Linda', 'Linda', '00', '', '', '0', '', '$2a$10$IJe8iC/Hce7v7KlBdfLfWuVU70MZWIoN1qpzxX2iqogV158g4rbYO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (22, NULL, 'Andrew', 'Andrew', '00', '', '', '0', '', '$2a$10$8E8CMC/1ewLZn0O3ThWwau.zJt895tlPZyuUwH2y92rMz..X/QOry', '0', '0', '', NULL, NULL, '2024-07-09 03:46:09', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (23, NULL, 'Karen', 'Karen', '00', '', '', '0', '', '$2a$10$TzTeOX7ZPZO80o3eFk7rROZ0PQp7xKHI38OXgL/3Mdmdt4vpkRo/6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (24, NULL, 'Kevin', 'Kevin', '00', '', '', '0', '', '$2a$10$CXOiiE8LG.ZwTtO5sayAHOIJdqNZRU1TIfe8bXs6VvEe4JFlh6bpC', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (25, NULL, 'Nancy', 'Nancy', '00', '', '', '0', '', '$2a$10$9gLXqk61k0rnwQ6g8h2AFOjua7ptWD0G9RhTon0gZiO/AT66/nWFi', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (26, NULL, 'Brian', 'Brian', '00', '', '', '0', '', '$2a$10$D4Qq14DCjQQoYDPyb2IyluEbixCq9VcApiKws2H5JuvSSRgb4bEHS', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (27, NULL, 'Lisa', 'Lisa', '00', '', '', '0', '', '$2a$10$ubThKZ8PtX8coparYM4NS.KmP2JNbUXKSrZyhJGOw26Mub6pIj7B6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (28, NULL, 'Mark', 'Mark', '00', '', '', '0', '', '$2a$10$kyUskJFseYSUvd3t7lXINeG0B58gyGnBShq3p.bNUMtJCnvE4CdFu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (29, NULL, 'Betty', 'Betty', '00', '', '', '0', '', '$2a$10$giAMG3Y03GwOC3/JcPrsL.hkgy8aqVRXH42g.A84WCErPAnT7tqbS', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (30, NULL, 'Paul', 'Paul', '00', '', '', '0', '', '$2a$10$XdEf3qVolw4UfjerrJjbtesRzNb8MtuWQ6pf5xieo8hMMCf3KJljm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (31, NULL, 'Margaret', 'Margaret', '00', '', '', '0', '', '$2a$10$WPliVpKT19ToOjihlkAN8eew/25rbsRNKAuctQtY6oaLvXA6MVchu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (32, NULL, 'Donald', 'Donald', '00', '', '', '0', '', '$2a$10$C3TDqavDldNrlV3rePD3Q.34TdTuX1xos1fKGzXGMrcDTA.sYQOSu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:10', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (33, NULL, 'Sandra', 'Sandra', '00', '', '', '0', '', '$2a$10$kWcZjCYh01a5GwcTLGhWh.K76FQTIbf.nxjdM79itIacn0ROYwSK2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (34, NULL, 'George', 'George', '00', '', '', '0', '', '$2a$10$Cwav67DJ3joX.8c7nmXa6ubCU23BPkwrmLTOdDIl4vXlAn424Q16q', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (35, NULL, 'Ashley', 'Ashley', '00', '', '', '0', '', '$2a$10$Ux3EGKW281JgmgkCRrHCqum1/bPzn3pUqatFA9VgsxBY/glyPnh3m', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (36, NULL, 'Kenneth', 'Kenneth', '00', '', '', '0', '', '$2a$10$Jm/XXpvcDhxeCM.D1SxntOR3qldjDp02uSf59jjvnrv9g4NMg9WZ6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (37, NULL, 'Susan', 'Susan', '00', '', '', '0', '', '$2a$10$.BslZKGRoBhFlY6kCL8UkusXfQmWQoFV91zVT2Uhyy8wOwNv1J0mG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (38, NULL, 'Steven', 'Steven', '00', '', '', '0', '', '$2a$10$C6SfDKOq1DGWQ5TIJSD/teL5JKGBudgfu0Ob5WeLqZGFVpKgopK.G', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (39, NULL, 'Dorothy', 'Dorothy', '00', '', '', '0', '', '$2a$10$iW.sgTO00qpE7VXVWvLY1eVJN1C.uJ/bK8iBRC9Tcfp5ikRthHIsC', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (40, NULL, 'Edward', 'Edward', '00', '', '', '0', '', '$2a$10$XsNoxt5BD7YqBQ/QZiAXg.rz1LgUeqwGTI644L88UuzsofBnQ3Ule', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (41, NULL, 'Jessica', 'Jessica', '00', '', '', '0', '', '$2a$10$R4uCwZXUAIZHnE3.GKVZuuo5C1EfUCT.7ZJQyeE0KqrdmMTqqplcO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (42, NULL, 'Ronald', 'Ronald', '00', '', '', '0', '', '$2a$10$R7JuYR/T4ZuGvFboixsvwuJNkexY80giHdFJUw.zCcosXtS1kqIve', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (43, NULL, 'Kimberly', 'Kimberly', '00', '', '', '0', '', '$2a$10$H/B4FYB6ghgi17jNzheHCey8WRuog3IYPJknPQVjClKKAFyNZ107e', '0', '0', '', NULL, NULL, '2024-07-09 03:46:11', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (44, NULL, 'Anthony', 'Anthony', '00', '', '', '0', '', '$2a$10$0XX6bEgJusBJt/t7x4QgA.VHtwy3zorhWptPtguxd5Z4dWG93Z5h2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (45, NULL, 'Donna', 'Donna', '00', '', '', '0', '', '$2a$10$2p7AkoFkcmEsjagpdCKsweWx9IZk6noYwWezenqCR5U3zF7z.u8bO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (46, NULL, 'Emily', 'Emily', '00', '', '', '0', '', '$2a$10$b4W8ejBevjKlQNZfwYxc4.b5M91MJu8qhAtLB6Bc6mQYHPpO5E7Ea', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (47, NULL, 'Charles', 'Charles', '00', '', '', '0', '', '$2a$10$E/ANTZRk/lZEF5eGrbcW1eHbCKlszjhgKzAVrPLlbGhLPZk7FG5ba', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (48, NULL, 'Amanda', 'Amanda', '00', '', '', '0', '', '$2a$10$6BEmCgmLVTeCZPA4Izy.ZOPRrZ45/EWGqkcBsNhPInvcEhnY2B3pa', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (49, NULL, 'Patrick', 'Patrick', '00', '', '', '0', '', '$2a$10$MytpHNKFK58ErsOlbFv4a.8zPAROVKzsVEDTy1wl0B7rpFNnV8OQi', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (50, NULL, 'Helen', 'Helen', '00', '', '', '0', '', '$2a$10$dintsfZm/S8gQH8mQOpbbeMJUtVpYvnCDvFStcI7GfRwToee9LtEW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (51, NULL, 'Stephen', 'Stephen', '00', '', '', '0', '', '$2a$10$lysyHJ.dG4cc.6Ak.11gYe7irgAh97IKA1Mr5iBFw8zja3FLmV132', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (52, NULL, 'Megan', 'Megan', '00', '', '', '0', '', '$2a$10$tbxjmZQr8/wDC7f7NE6dEusu3Rz35rejMFxLQN2nTHzyfmuf3rKj6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (53, NULL, 'Timothy', 'Timothy', '00', '', '', '0', '', '$2a$10$TnuJ5CAGxvPeuj62d/WGRe7MC.x.D4SAUHtNOEZZbAtfcvmto/kSC', '0', '0', '', NULL, NULL, '2024-07-09 03:46:12', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (54, NULL, 'Rebecca', 'Rebecca', '00', '', '', '0', '', '$2a$10$DlnGIG5xuw64qBwligF50uYsDKOJcG669NIINnYiugXl.PfSsSzga', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (55, NULL, 'Larry', 'Larry', '00', '', '', '0', '', '$2a$10$UT7hE8bFtC9HxYuVSvA2huGLIR6o0NOH.tHJ4DlkjsWRKTmVFTsF2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (56, NULL, 'Laura', 'Laura', '00', '', '', '0', '', '$2a$10$scHbrID7Tqf34tkMbOcU5.I2lW2antWWwgxXmUJuq/H/1IJ6uUBgO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (57, NULL, 'Justin', 'Justin', '00', '', '', '0', '', '$2a$10$mob70OKDzyHaFKZjQ2L/v.dmPdcP5812L7Ko4E9xlPHiYjynET6JG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (58, NULL, 'Teresa', 'Teresa', '00', '', '', '0', '', '$2a$10$Hqy6TW4iTldA0iZ666oB3ulPWpjNliTg5DeMHl8gHAGg52UIlq4ky', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (59, NULL, 'Brenda', 'Brenda', '00', '', '', '0', '', '$2a$10$H.vqDa4iLP/R.aFgO3zdE.IHr7JSNwznVv54hohdopMWeFZbRYCyW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (60, NULL, 'Frank', 'Frank', '00', '', '', '0', '', '$2a$10$IFu4PF9jB7ZyKjfQ5hkgSOvSwWvv94JFUTIyAbYM1i.VQYhac.cIy', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (61, NULL, 'Pamela', 'Pamela', '00', '', '', '0', '', '$2a$10$nthfhfQ9DsmSPFm/pj5giuGFkEZQRdcSXb8JDzkuNKua4gu8Ya.Ta', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (62, NULL, 'Brandon', 'Brandon', '00', '', '', '0', '', '$2a$10$7Dx/auyCqpv1kVJD/qMT/eRDAR7uMfsZ2254z61CeK2mQVwYpZ7G2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (63, NULL, 'Angela', 'Angela', '00', '', '', '0', '', '$2a$10$8wXHiONso0QabO5GMT..7.ndXLfLL4H/UN/3thYp.jjO8s4jYxloi', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (64, NULL, 'Scott', 'Scott', '00', '', '', '0', '', '$2a$10$DORGwGHL9bpj4kAXLh76Delbu1LupnE.UmlcoheNM69H3XDiCce7W', '0', '0', '', NULL, NULL, '2024-07-09 03:46:13', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (65, NULL, 'Sharon', 'Sharon', '00', '', '', '0', '', '$2a$10$Vx4ELUMjJI6aNhZmRy2GteiuZ0rHcHLo9vP1DqFg7szyvnWMS/Yvq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (66, NULL, 'Benjamin', 'Benjamin', '00', '', '', '0', '', '$2a$10$TYNBMLfZDqMqmzCkpnI3beIbrahYLjIxLfD6C3MQgURqVRyS8ORDG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (67, NULL, 'Kathleen', 'Kathleen', '00', '', '', '0', '', '$2a$10$GOvejeTOVM.WOflDUrwQAOj0G9ZFFQWDbEphUlIPR0KWQwmQvzm.W', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (68, NULL, 'Gregory', 'Gregory', '00', '', '', '0', '', '$2a$10$QoTH0u.F5r26WHsnj4YTM.Ear0MkXuJzeDGkeYktUylmZwmnQFQou', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (69, NULL, 'Deborah', 'Deborah', '00', '', '', '0', '', '$2a$10$Pj6OBxINjas148p3JYx6uOCycTQTyEUO.K10JEZSWzRSBkMGh6MlG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (70, NULL, 'Raymond', 'Raymond', '00', '', '', '0', '', '$2a$10$7hN4WcKYjyjFs0tK9YSbKukAfq7drumT9H2Ed9X42VZLs1ef8jRnu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (71, NULL, 'Amy', 'Amy', '00', '', '', '0', '', '$2a$10$PUtpphurmwh414JGJTJQd.UFz5o.UXBrYJtRfanfiDV91HG1Ptn8G', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (72, NULL, 'Patrick', 'Patrick', '00', '', '', '0', '', '$2a$10$YhUIoMx1lfY.MZF6j/RHa.foYhk9.lQtTX.jvuVRACRPUcKGkIkIm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (73, NULL, 'Martha', 'Martha', '00', '', '', '0', '', '$2a$10$mPA95iWLFYO2sUu/vZ2SKe0GUCfyZ/KXDJnbB6Nau8ro7Cn5r.lTW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (74, NULL, 'Alexander', 'Alexander', '00', '', '', '0', '', '$2a$10$dROR7CTKlQqKLaeIENJc8.08GvX2dcaM/ehJTR3gvvIHoo5GEeQTG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (75, NULL, 'Carol', 'Carol', '00', '', '', '0', '', '$2a$10$hHSWrot9rKVwwU0gZ0gse.QhPJQoaWnaOjtrr89nxVcGrqeBfSUjS', '0', '0', '', NULL, NULL, '2024-07-09 03:46:14', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (76, NULL, 'Gerald', 'Gerald', '00', '', '', '0', '', '$2a$10$uHBxrXarV9sKsOzQgaAzCORv4UJf5RDNHNsTj1md2JmqlKp4wnQZm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (77, NULL, 'Christine', 'Christine', '00', '', '', '0', '', '$2a$10$WOEmS85MvGM8zgOyIPNX.OiU8jr0GD9Iui/GbgYXA7qickDr3q23W', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (78, NULL, 'Samuel', 'Samuel', '00', '', '', '0', '', '$2a$10$WYVViivHTE7.cERvdPPOkOeHb8UiEehxoqTereNO/HZNztLDDRwK.', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (79, NULL, 'Janet', 'Janet', '00', '', '', '0', '', '$2a$10$fp8zkRgiw2pBLHBw1rnXzuuy7xg0/D70ym4RQEQmLaBRZqpCu64P6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (80, NULL, 'Dennis', 'Dennis', '00', '', '', '0', '', '$2a$10$RhK2sN34DbuRzJaoC/MeGOOWafrRWwStVBhi7EdqBxjWvnOXZDMSW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (81, NULL, 'Marie', 'Marie', '00', '', '', '0', '', '$2a$10$UTR7AkhngaLCXaHQFeykD.a9QLtoT13VEubeuLMTVgSbRGjEkglvK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (82, NULL, 'Jerry', 'Jerry', '00', '', '', '0', '', '$2a$10$DlpJZfoYowrW3DbVTdjeS.3Oco3hE2TzcuMDZBR8emmk4mJ/HfVcu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (83, NULL, 'Jacqueline', 'Jacqueline', '00', '', '', '0', '', '$2a$10$UPmwbgiFXg/kR31EK.2bq.4m6EC/gn4hOj5DhQLo4m7eywR.s2926', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (84, NULL, 'Henry', 'Henry', '00', '', '', '0', '', '$2a$10$Zj1/0MVb1M0Xm8TlSCT60Owo9CgKhED0Y8VsCk20LMRNrXnfWyPyu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (85, NULL, 'Ruth', 'Ruth', '00', '', '', '0', '', '$2a$10$u3/4aRO60cjeUMXj3xxM.eodnSnAe4ZFYXc2a4M.bcUVnPWHQLIVK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (86, NULL, 'Douglas', 'Douglas', '00', '', '', '0', '', '$2a$10$zxWJKvQ9SEkK4jDcKZ7uleKmUqmMkO8LZbVUb0W4yuatV8yLMxG.S', '0', '0', '', NULL, NULL, '2024-07-09 03:46:15', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (87, NULL, 'Victoria', 'Victoria', '00', '', '', '0', '', '$2a$10$ANnrrn5eSSWM66/LoSO3qeUIdzHgBuTWs7UTl5n65KUaBrTnwhNJ2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (88, NULL, 'Arthur', 'Arthur', '00', '', '', '0', '', '$2a$10$bwCd4QGWdk2DT3aqisSy3utOyuwW7d69spFxG9o4Y2meqyhrvNUAm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (89, NULL, 'Judith', 'Judith', '00', '', '', '0', '', '$2a$10$zS2Xvl/7uQb.V/2TrpwqJ.8MT9VvYt.Hvaxpo8Dl2oLCwJlRJOm9i', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (90, NULL, 'Wayne', 'Wayne', '00', '', '', '0', '', '$2a$10$HKJpVWwZixKBnAiMD4aAxOqM7Pebyyb33xXYga3LmrtDONfAFn5WO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (91, NULL, 'Rose', 'Rose', '00', '', '', '0', '', '$2a$10$VfJOXVxkHOYEWAVpjXT2Tuc1rxQt/bW28dxBRhrx1Dec4CuES3l46', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (92, NULL, 'Joe', 'Joe', '00', '', '', '0', '', '$2a$10$GMcGFqYMi9ROa5FMZVrQ0.58oX4O9id.XvRoeSc0brrSHWC862sLq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (93, NULL, 'Evelyn', 'Evelyn', '00', '', '', '0', '', '$2a$10$6VDAOEuPq2.LXceeIPRB9.j6XNpy17LGC7wF6791BsZZIuPjsWw7K', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (94, NULL, 'Roy', 'Roy', '00', '', '', '0', '', '$2a$10$vjgvrz4wJUPaIXdI0AMkqO9.YB2CqrZv/ae7JgoeAtcSif9DT5EVm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (95, NULL, 'Joan', 'Joan', '00', '', '', '0', '', '$2a$10$0/8OPkR22wSJWGkeIt7QRO4Qb0B8si8pvhz8mi1EP3nTT8OLZk83O', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (96, NULL, 'Willie', 'Willie', '00', '', '', '0', '', '$2a$10$gyA1XxSH2YSKo5V2JmRqzOr.lTgZ3yV4FmjWjFGeh4DLvXE1Eatkq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (97, NULL, 'Jean', 'Jean', '00', '', '', '0', '', '$2a$10$2OsQjfcqNFvSmi6B2Flh8OoD1roF7x2P1kn4c9LERjpQ8s8qUVBe2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:16', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (98, NULL, 'Johnny', 'Johnny', '00', '', '', '0', '', '$2a$10$rh6ZUVl6WsTbd8Vo1/bXr.9H6GeQVM8cLNDRdjit9YESWlqx3Rcl2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (99, NULL, 'Theresa', 'Theresa', '00', '', '', '0', '', '$2a$10$O8FiUC0XMX719alhFwndhuHPOWG.MnRsE/hHtU9Za20S6E//Lg1iO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (100, NULL, 'Clarence', 'Clarence', '00', '', '', '0', '', '$2a$10$AvGNo7MZTRmgLUKqSIe8l.kSCaZhBiE7TDYAjBoLWBbeqCCYsYfk6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (101, NULL, 'Gloria', 'Gloria', '00', '', '', '0', '', '$2a$10$QvkSmJH.EXH/MWQQivlYQuFaEaAQJoZyALZZHe76qdwl59cuv6wk6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (102, NULL, 'Martin', 'Martin', '00', '', '', '0', '', '$2a$10$K0evyh.Re0uQRi.13V/h/.qmHw2zIb/TlbV5OBAF63OFYyIUUD/4G', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (103, NULL, 'Martha', 'Martha', '00', '', '', '0', '', '$2a$10$J.QHmMteUE5ifs/QgtzAHOZV9HHjYcTaaerwMJMsiFuLLu54mK1Ea', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (104, NULL, 'Billy', 'Billy', '00', '', '', '0', '', '$2a$10$IPWVMkEZAXQAblOLUTzzx.QGooNny2DZlG9PLejCmyo76MgBBosbS', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (105, NULL, 'Annie', 'Annie', '00', '', '', '0', '', '$2a$10$s2k5908NvBgFEFZlJE6H1OfbVoU0wycpy3cN/B2lVjpC4RpXcrDU2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (106, NULL, 'Frederick', 'Frederick', '00', '', '', '0', '', '$2a$10$j.Hvn/g.z2.Otp9Pg6tgRO94YU5vhwm0ryXt9SeiiIZTWaI74kbZe', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (107, NULL, 'Eleanor', 'Eleanor', '00', '', '', '0', '', '$2a$10$PvOnTFZZZbgxLdjNeTQ8NeHZ7GJtpziaRCDqIVbLj2Lz9NS7uWCOm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (108, NULL, 'Eugene', 'Eugene', '00', '', '', '0', '', '$2a$10$ZTNw7l46FpWRWmGaXd9KBeGeRdI3fIQAYbUeluD9LwY9p7pFqgVQW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:17', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (109, NULL, 'Grace', 'Grace', '00', '', '', '0', '', '$2a$10$JYfUDPIf8HV5Glo/MgonDePa1Ex3rn3bwwjkxBdiaO9RID.0Cwane', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (110, NULL, 'Wayne', 'Wayne', '00', '', '', '0', '', '$2a$10$r/P9bQQCvTa7SBep4dMb/umMNSo8cFvVGMu.AvtoD3W8DKvTjOcDa', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (111, NULL, 'Ruby', 'Ruby', '00', '', '', '0', '', '$2a$10$gncRei295psOmYgxa7hVreDDvxJm.diTeSC0HYZVzJHHURTcMQfqK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (112, NULL, 'Lewis', 'Lewis', '00', '', '', '0', '', '$2a$10$poCBmd4sW9K8w471LBFejOGO4pwVzrXOjEYFZmXUpHY1CMsdw4Jvu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (113, NULL, 'Florence', 'Florence', '00', '', '', '0', '', '$2a$10$4obmaqxD0gFm1gM79cIf5eBATq0VaKJUgkAsveGu2viHdIcY/XHP2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (114, NULL, 'Russell', 'Russell', '00', '', '', '0', '', '$2a$10$5VGd3QFTQLd5bWVFx4NAZ.D9ntxmXUhMyZs/kS/SzkIuCwbMYpmWy', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (115, NULL, 'Norma', 'Norma', '00', '', '', '0', '', '$2a$10$4XVsLQsf45/oF0Aq8ZgKnu.Jv8zqhXOXi0C/Xj5jr3QnqJFUGyzY6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '班主任');
INSERT INTO `sys_user` VALUES (116, NULL, 'Andy', 'Andy', '00', '', '', '0', '', '$2a$10$yQdY3zceTaJNUJ91zi5ZSO9TsVRMY4yIzxv/T/pD/E01l8bC394Fu', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (117, NULL, 'Alex', 'Alex', '00', '', '', '0', '', '$2a$10$VpvkubA2sigXAaobVUCgjeV4JrkU.PjX3aMOteQFs2C4Ify5tMlWq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (118, NULL, 'Ben', 'Ben', '00', '', '', '0', '', '$2a$10$IxnUz5ALEmdowVEiUx3WdulG8rMatHl4Qor3gdhIgvEddYBW4cg2G', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (119, NULL, 'Chris', 'Chris', '00', '', '', '0', '', '$2a$10$2x7gB/fOhQQZTzMhZrBxVOn9EfwaIfjhsVLc7YLvLD4npo4k9jKMa', '0', '0', '', NULL, NULL, '2024-07-09 03:46:18', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (120, NULL, 'Daniel', 'Daniel', '00', '', '', '0', '', '$2a$10$ZHKMIdKDzzVU4WrHHLYir.dXNSpxYzwlZiej7dfjxY43F22q.faxG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (121, NULL, 'Eva', 'Eva', '00', '', '', '0', '', '$2a$10$YvPar7tiEnP21MpLzNYFeeYJN.qOaR.dpJpcJliQgiZFa7dR2BSDm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (122, NULL, 'Frank', 'Frank', '00', '', '', '0', '', '$2a$10$W/rzsXmfOZU0U4.2oNuIhOXwFPBV9HxVgyOjOF62kRonvVRCiVCe2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (123, NULL, 'George', 'George', '00', '', '', '0', '', '$2a$10$ecI4eFgL85KQOAs/zXbP2Ox8jtD8IkrD9ut6z4YWSuVR9atEZkdeK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (124, NULL, 'Hank', 'Hank', '00', '', '', '0', '', '$2a$10$yxkiILSrmSAlWcd8z2/JCu4kzpTyrvBwjY0OSZOlIxTqDMVw68xbe', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (125, NULL, 'iPhone', 'iPhone', '00', '', '', '0', '', '$2a$10$0.hVXTruF0A5uh7t.mJY9uKC2wKIldCO/S0DY8/EdPd3fxlFPbcc2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (126, NULL, 'Jack', 'Jack', '00', '', '', '0', '', '$2a$10$g/88i31XteuE7CiSEt1ueOVxSJHRpz7DtuTeTmcnUB3cnX6MBeEgW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (127, NULL, 'Kevin', 'Kevin', '00', '', '', '0', '', '$2a$10$TVkhWc0ZQx4FxLxn2RhtFO2C/HEMYoeF5H/q25ADV86MbIPDlGGp2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (128, NULL, 'Mark', 'Mark', '00', '', '', '0', '', '$2a$10$aVUd.ZW6fq3bvHYQTWh0buqar/SdWieDpxm.MweonIlO1dIXHRv1i', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (129, NULL, 'Nick', 'Nick', '00', '', '', '0', '', '$2a$10$LTPUv8NMpeJlCrFWTr8vQOrwpnaAKurdo9bzOH.mKVKV2JtWDcVCO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:19', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (130, NULL, 'Oliver', 'Oliver', '00', '', '', '0', '', '$2a$10$sKE/PjUoEUYTob.en4EOv.TeHUSG0jX2LecKZAz9BzDFMaaXSX2Y2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (131, NULL, 'Peter', 'Peter', '00', '', '', '0', '', '$2a$10$yECNUxT6keX5hxvIzU.atup2GQzy7nZKfcrPm1qSClOWVoi51d0Ni', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (132, NULL, 'Randy', 'Randy', '00', '', '', '0', '', '$2a$10$4ZZon50t5ZB1nHr/sJm1FeSs.X/40JFb915AAAnIRzB5mCZ8i3CUi', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (133, NULL, 'Sam', 'Sam', '00', '', '', '0', '', '$2a$10$GOHBPJdAy8y0KlZwS1Q1Re60/2KrEaT/G9PSkWdDS3bCQXPVAV15O', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (134, NULL, 'Tim', 'Tim', '00', '', '', '0', '', '$2a$10$XaWwa/DVMqEeklYu6wP.pOLHrVoS.V19DRgM7bme13jG9eLy3IZMq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (135, NULL, 'Willian', 'Willian', '00', '', '', '0', '', '$2a$10$cJcNd01Cf.Tco8O38sGeHeOva05jZYUej2tS6nW3/hEr0gLOefMvq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (136, NULL, 'Luv', 'Luv', '00', '', '', '0', '', '$2a$10$3TiUrFlKhopQrgyyuTiisOlyBRqmSPsLoHjYABqI.PBKSM2doSJES', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (137, NULL, 'Doja', 'Doja', '00', '', '', '0', '', '$2a$10$IExOUZa8a8tSsna5TzOTEOofF7LQN755HlKR6a6h0UsCZX7OpXyjS', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (138, NULL, 'Tasa', 'Tasa', '00', '', '', '0', '', '$2a$10$VQNLrHYIDqne0Kt1uHZBj.Envx2uomxTTvESrXWBoMPyLB8CcSWA.', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (139, NULL, 'Hammer', 'Hammer', '00', '', '', '0', '', '$2a$10$vqk/JwUe.VjyaxfXBk6Iy.Hqwe8y7CgUY.wDSpv.qnVPWrQ8.4H.a', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (140, NULL, 'Joey', 'Joey', '00', '', '', '0', '', '$2a$10$sxMk77Ii3dasziAypbnPt.nul4QNFmWvzyuuAjCeBdrLh/OD8Rk26', '0', '0', '', NULL, NULL, '2024-07-09 03:46:20', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (141, NULL, 'Kerry', 'Kerry', '00', '', '', '0', '', '$2a$10$0foP3rzLfJ/pVdnmmYiot.pbgs8TBoZ6EwDikmroU4ToqsdXe/DJK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (142, NULL, 'Quare', 'Quare', '00', '', '', '0', '', '$2a$10$LZpxU2kqpKEy3/xD6uC6PeA1.O5sSziyMf3GQz2DHIe3Zs33JAAiq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (143, NULL, 'Perk', 'Perk', '00', '', '', '0', '', '$2a$10$IZ/1NsKhjDIBkfDsk5/Tu.T57ylIIOLfuTYpePEJ96bn/wM0nlk4a', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (144, NULL, 'Smith', 'Smith', '00', '', '', '0', '', '$2a$10$OitB9S21GjAnHfKnWJrh7ui/dJ4zW/kIWI5R6cZL94bflcvxv3zSG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (145, NULL, 'Johnson', 'Johnson', '00', '', '', '0', '', '$2a$10$z2VMXyxaQCxWt1Wb8xCPo.mVVqUMwjXdI8kFkx9WlmagysTtgP2iC', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (146, NULL, 'Williams', 'Williams', '00', '', '', '0', '', '$2a$10$rCZqRvFXg9IKLH57PXl7aOrelHAjC37uMtQoO7E9EBANOQ.IjAKoO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (147, NULL, 'Brown', 'Brown', '00', '', '', '0', '', '$2a$10$gnTrA/.Wkflg7CC4jFSeq.OMUBD29LVasNjtvpUb7DDLnGAEGa1a6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (148, NULL, 'Ava', 'Ava', '00', '', '', '0', '', '$2a$10$aI6I7SGsbyUfWFvLAHOihu1aYirTRqWwsiGvAykxV21WknxLju7iC', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (149, NULL, 'Davis', 'Davis', '00', '', '', '0', '', '$2a$10$oUDMv/uFvFBzKI/kgTmXSOzg8MUBk3R1X03zK5Uy8GggfL2DzOiXm', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (150, NULL, 'Miller', 'Miller', '00', '', '', '0', '', '$2a$10$ms4Mg4.svfno/Wmf9Gr/yuhwAR05EHVZdRN9.xtorkXDFKYJRSsYy', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (151, NULL, 'Smith', 'Smith', '00', '', '', '0', '', '$2a$10$IEtmHbEisRvJLMRqFUGkmelN6SUbsPwdZn85.KyKeZf7Odbk7BjIi', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (152, NULL, 'Johnson', 'Johnson', '00', '', '', '0', '', '$2a$10$73NUh0iBqcLLsVKZyYbRVO/R30jiNKkVileIcqqKUFuhPvlXSRIYe', '0', '0', '', NULL, NULL, '2024-07-09 03:46:21', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (153, NULL, 'Williams', 'Williams', '00', '', '', '0', '', '$2a$10$71GWmwn46KrCIAnVEQlzv.dfq00VR0yrhOjfdtBq8fgx3q8bpn9b2', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (154, NULL, 'Jones', 'Jones', '00', '', '', '0', '', '$2a$10$huyIvlWlKt6RmVeMtmPTieCWCiBse8d4vK1NmLlGJJSPDL2S/DWjK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (155, NULL, 'Brown', 'Brown', '00', '', '', '0', '', '$2a$10$vsVCMt7kBx5ifSybrleHkeEjdG0TwkToCpqGKGWVVEO4ZHhzfRNX6', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (156, NULL, 'Davis', 'Davis', '00', '', '', '0', '', '$2a$10$QMLTp8JV8zukAucyqgRhYeg8BbbZ41ZS9iCfXK2dye.pUXC4LiT9i', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (157, NULL, 'Miller', 'Miller', '00', '', '', '0', '', '$2a$10$eH.E1fzivS0iPjL9FDVqju6EKf3.NN8jXM4xpnDlmdgPI/FJI7/fe', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (158, NULL, 'Wilson', 'Wilson', '00', '', '', '0', '', '$2a$10$tTl7CVixRk2TqJnqaG00ceQJGOIqp5quFYnZPtoo/HKNOYVeTZRXG', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (159, NULL, 'Moore', 'Moore', '00', '', '', '0', '', '$2a$10$J7unjG7Atvs/6Q0SQWdsXeoaL8voAjYQgCM9fjCrbqYbwgJo9iZOO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (160, NULL, 'Taylor', 'Taylor', '00', '', '', '0', '', '$2a$10$hEhg.2ppvGz/IV/3EcHJLOQPmWLQC6qUVzlI33mVIM1W3yfLwQT9G', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (161, NULL, 'Anderson', 'Anderson', '00', '', '', '0', '', '$2a$10$FBpPv9J5aKg279uL9ax0f.TsjDIS3QVOXecXyDwB/cQORT5iLJ/pW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (162, NULL, 'Thomas', 'Thomas', '00', '', '', '0', '', '$2a$10$3aI4kvxgVJeoHhs9dB09V.P0P5aVYXIfTEE//2JiNCQRX/v6DvOlO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (163, NULL, 'Jackson', 'Jackson', '00', '', '', '0', '', '$2a$10$DPgNkqwVzPlqs2DYx8KdPONdmJuTK9kMxMPqxT4/EnUskV/zdzcgW', '0', '0', '', NULL, NULL, '2024-07-09 03:46:22', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (164, NULL, 'White', 'White', '00', '', '', '0', '', '$2a$10$YR1VxlCLBfraCidEGyrKqOewYYUgDCpZIoCzxw/R0j1zZERfDCCCa', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (165, NULL, 'Harris', 'Harris', '00', '', '', '0', '', '$2a$10$5EZnlG5LEdPNI.3MEkYZX.jobdOJPIGcnBwpTNVDnXLHcaerTtNrO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (166, NULL, 'Martin', 'Martin', '00', '', '', '0', '', '$2a$10$u5xKzrEBpSIZgYKyU/3VOurj25NMltRMdf3Wyo23zJardp1qY8N3q', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (167, NULL, 'Thompson', 'Thompson', '00', '', '', '0', '', '$2a$10$X//RZsEOoLgtpfSSuJ5BievI/T3xYbqutk5VciK9En.Qw6iqj.Cxe', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (168, NULL, 'Garcia', 'Garcia', '00', '', '', '0', '', '$2a$10$WGucDXPQK.nRCy.GTMzhK.p0WnbQb3kKFalLREOpE9NlEfTur01uO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (169, NULL, 'Martinez', 'Martinez', '00', '', '', '0', '', '$2a$10$Juun6wYwX4d7PMsH7AE3GO9MXHB950NOSfGLX59L6VzBDS9AJvUhO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (170, NULL, 'Robinson', 'Robinson', '00', '', '', '0', '', '$2a$10$nAYApmw.CLMia./EjN77ZeCiW2RkL1Zjmwiub1c/2YbHAj40HLEBa', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (171, NULL, 'Clark', 'Clark', '00', '', '', '0', '', '$2a$10$4PKvaFdHA6LhuEdNSkGsX.uBCKyBZE6Yuy3TWKAQq2I8VlfgIxUPO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (172, NULL, 'Rodriguez', 'Rodriguez', '00', '', '', '0', '', '$2a$10$KGOmzs/HXBJHb0QRTNw5FOHKgvoVyaBcwm1cfL6qA4F7kc4eJj3dq', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (173, NULL, 'Lewis', 'Lewis', '00', '', '', '0', '', '$2a$10$Ne6e7pdslLNmBpXXUmJQh.zAUJq/4JlEK/izsqKQeA5oQ6/GmjWE.', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (174, NULL, 'Lee', 'Lee', '00', '', '', '0', '', '$2a$10$zsI8B2kD/ysDWaXkTtFb5eiCVKRNqiDUqVMVe68veXXn8IAaM0PpK', '0', '0', '', NULL, NULL, '2024-07-09 03:46:23', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (175, NULL, 'Walker', 'Walker', '00', '', '', '0', '', '$2a$10$DQ9XsMukzZ/KfLjbaTk/Ru.oKqYuYpRpn9YYfhhOB1cyaDoG8Gg9i', '0', '0', '', NULL, NULL, '2024-07-09 03:46:24', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (176, NULL, 'Hall', 'Hall', '00', '', '', '0', '', '$2a$10$7JNcC8/USeN5bvYjloi8zOeieweCctMaCwLFGYxfgcRxww3U/DhvO', '0', '0', '', NULL, NULL, '2024-07-09 03:46:24', '', NULL, '教师');
INSERT INTO `sys_user` VALUES (383842, 21, '383842', '将勒杯靳', '00', NULL, NULL, '0', NULL, '$2a$10$RZeG5itCPGLrJgLu/YpKs.IdSGEB99vrRiR3D.TgV1JxstOVzI38.', '0', '0', '127.0.0.1', '2024-07-09 04:31:20', NULL, '2024-07-09 04:11:54', '', '2024-07-09 04:31:20', '学生');
INSERT INTO `sys_user` VALUES (410555, 19, '410555', '怒又卡', '00', NULL, NULL, '0', NULL, '$2a$10$1YtqBTnyqogETxvZ6qO2curAcn26WG/5ooF5YzUU5D86AyvKPw67G', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (574181, 5, '574181', '总站枯', '00', NULL, NULL, '0', NULL, '$2a$10$Wm5BkPY8rYb/EigXC8YJ8eGMlzlsVgiyX45x3H1n8M75TfO0xemny', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (1058795, 14, '1058795', '岂析※', '00', NULL, NULL, '1', NULL, '$2a$10$YWSP8Q1KT5JmwyNB92yTCOPZOKjItezI/ZcaxUPwdocUyYxYjj8ki', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (1287420, 1, '1287420', '防阶里肯', '00', NULL, NULL, '0', NULL, '$2a$10$9I3rEbuJ.aGh1ZZIqkeSr.Dpsi2/Ia/uwdJn9gdT8Dkor7li9f6C.', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (2292962, 19, '2292962', '充历偿母', '00', NULL, NULL, '0', NULL, '$2a$10$m7OMxQbMaDPYzK.riVALlO55Z6LEkE3HsvXU4pIWJbqSEY0GfnCoi', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (2326791, 17, '2326791', '都妨熟午', '00', NULL, NULL, '0', NULL, '$2a$10$YKGx/Bndz62BmO0fgxKoQOugdnGwmgYPwoWtefV/uPicM2lhxLZGS', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (2727632, 8, '2727632', '旧擅军', '00', NULL, NULL, '0', NULL, '$2a$10$3T4djyFBJwzOzYRPYd4BVuuC.eK.RRXVroBcnJgXrba0wIcrnaWDW', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (3938899, 18, '3938899', '夫钦充▲', '00', NULL, NULL, '0', NULL, '$2a$10$IJDcsLAotblKdq3KTW/YhOin3m//AjaLCsKMjW3sn5dkq8seY8qey', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (4754552, 8, '4754552', '菩笛停', '00', NULL, NULL, '0', NULL, '$2a$10$TFqvjnQciI5MPNjEchHC9.BdU3opraZ2dARzRGHKRpIVx5LrS1cha', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (4803919, 15, '4803919', '用裔蛊', '00', NULL, NULL, '0', NULL, '$2a$10$r0Wj4Patrkl8uceOCUGgtOFtD2jUWFXafLr5IHgxdtb0ShqAJEZyq', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (5368505, 10, '5368505', '霜石▲', '00', NULL, NULL, '0', NULL, '$2a$10$OPNj5bqU7bQMYYfffHFNceMR5Gn/B0GySXw3La/46iYk73kSSRtf6', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (5521063, 11, '5521063', '浮皮蔡§', '00', NULL, NULL, '0', NULL, '$2a$10$1CU35UqhX0/n8wWdEpxNg.OBRTdr2cg4mdwBrhQhwseRhwD9ci2Z2', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (6938200, 11, '6938200', '问勒鹏惮', '00', NULL, NULL, '0', NULL, '$2a$10$CS02s6ZgqVzpxnNpR0bC9O0XBn1D9N6J1MMKvtcjY55Ro0.YbhUoq', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (7276262, 5, '7276262', '遇帝他', '00', NULL, NULL, '0', NULL, '$2a$10$IvL/jKVTa9G8qGy/sS017uhN36D41wE43GnJvccMLyMNYB0mG.QEC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (7812089, 16, '7812089', '丰毫餐※', '00', NULL, NULL, '1', NULL, '$2a$10$anP29XH.GSsUc9ndILVCm.IA3NcB4HQ9K/nbKqFe6anQIocV.R6L6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (9028823, 6, '9028823', '睡垢十', '00', NULL, NULL, '0', NULL, '$2a$10$MJ2SRQR/qxbuBZNoWOrLnOgOZTEdzQKZfXWcMUqzRonQy.rjB3UcS', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (9626596, 8, '9626596', '忙丸', '00', NULL, NULL, '0', NULL, '$2a$10$1ScLiZNOgnHRRJlsMeUXBORqKHYE.g0dfSTCAuMrDM0jR3SNdS5RG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (9877012, 19, '9877012', '毕蚜※', '00', NULL, NULL, '0', NULL, '$2a$10$6aZQFi9hxwFL8FL7rqOtfeWBKUjr/LOuNWdOkySmHYkbRb0jumDiC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (10165672, 2, '10165672', '柱冷狈探', '00', NULL, NULL, '0', NULL, '$2a$10$0hrqqWciIUmnjE1KQx16aOQ60WXfR9qbFs79aaV5YY5r9AOZJfNAG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (10348131, 14, '10348131', '八客京§', '00', NULL, NULL, '0', NULL, '$2a$10$xrhRqLqVacJvEwFOOUhez.46rb4T2onSKt8rLSaMMir2jc5fnFyAm', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (10983982, 14, '10983982', '腐办蝗☆', '00', NULL, NULL, '0', NULL, '$2a$10$DoP/NZiO.dsKKz.gDkHzaeFrP.3erRum2QEcEeXEVZBBEgJpfhvZO', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (11540548, 11, '11540548', '靠符早末访', '00', NULL, NULL, '0', NULL, '$2a$10$IXTGJxcC/hGznIsohut4GudjWffIO6hrCMhB9ZiWsmJnnLGXv2Vh2', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (12498507, 9, '12498507', '低辑拨寄', '00', NULL, NULL, '0', NULL, '$2a$10$WFyxqZhYeBBd8T5ra.OZ0u3l2ZGI4fUyaoYF2nfjQTaTHB6p5GDa6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (13640242, 4, '13640242', '弹友机仁', '00', NULL, NULL, '0', NULL, '$2a$10$bsJ46gasPZva7b1vt2lHsO2S/fxPD8MMjbC8S.j1pIOsc1VEmKopm', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (13700480, 9, '13700480', '凌另捏践', '00', NULL, NULL, '0', NULL, '$2a$10$76YE.rT4R3Jh92pbjKGzeu1Mg73xVZJJGSLCGha6Dgv.35Ce3e/Gi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (14206566, 18, '14206566', '佳汛虚炔愈苦灶勋形合邦关还衙韩', '00', NULL, NULL, '0', NULL, '$2a$10$W1sfjQziAikt8fJkblPV.ud1pxb8lb/zxC3Q4iPxMS2t8s0W9zw06', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (15512203, 11, '15512203', '步相载哈', '00', NULL, NULL, '0', NULL, '$2a$10$LjvnZ0KIubzSZzziBzDj8uFSse/YQ.Iq4bDaM4faIJF1LSdg8/qUq', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (16238926, 3, '16238926', '磁夏纲窟', '00', NULL, NULL, '0', NULL, '$2a$10$9/3kPqgf4oS6fwjuAomiDOGZiqb40ZhxtkUeI7ziAOl1Y/7V1YZHO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (16413341, 19, '16413341', '瘤氛吵反', '00', NULL, NULL, '0', NULL, '$2a$10$TXbXzIqPpanbYzFYN9RgvOY4ET4pGUWhtPn4i6EmxXNQ5TbANrwFy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (16466043, 11, '16466043', '诉睛貌从', '00', NULL, NULL, '0', NULL, '$2a$10$FjKR6CxC9yQjBBkvULg7fOF0QK/08P6stghWwuBVUdszdRRnbl5Fy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (16872358, 18, '16872358', '瘫具于初', '00', NULL, NULL, '0', NULL, '$2a$10$4.nUZRM2aVPELLhc7oV8W.nwViLpdtN.HkCDdopOHBtRIAPH4VeJi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (16947368, 19, '16947368', '辰眩条', '00', NULL, NULL, '0', NULL, '$2a$10$sJGxaX0nFYUkP1pJr4KnOuWVKKK4yrccitpjNAM9ZOd/gt/p8kpM6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (17342616, 15, '17342616', '拉贸尹宋', '00', NULL, NULL, '0', NULL, '$2a$10$g2OWRbMDjg4n9ik2hRmcY.z2sajPcwKBiTq2ROfV6mXae6Ezdh/AK', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (18880597, 10, '18880597', '沁木怖', '00', NULL, NULL, '0', NULL, '$2a$10$niENNcNjvaSyFDwhrQecKefjW18ocMEIWVZgvr0Dp0C/MRuhx8L3K', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (19284332, 13, '19284332', '羚往氧', '00', NULL, NULL, '0', NULL, '$2a$10$3n6.8lVgAjf25Lp70Y1.DOjnkBftLBZPM4LfmEKUxneC5Nu0KBM52', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (20322299, 12, '20322299', '击靠蕴', '00', NULL, NULL, '0', NULL, '$2a$10$tFA/ylKR5ChODsdxVrvekuerYSzp19yBMeT0ZmIjAK.FySYLVN0di', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (20747376, 5, '20747376', '送珊袁※', '00', NULL, NULL, '1', NULL, '$2a$10$A1m2MIbJcSsgQIs0THU8Iu1bfi6bIyUUL.yw2cy1tJkstwcKw4Wt2', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (20801640, 10, '20801640', '护寺恩', '00', NULL, NULL, '0', NULL, '$2a$10$tsRsSV0u7OGS4jyCBMGWDenZt3Am7Lu.Rj7gc0YJHaQTvfajjwcdm', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (21567431, 18, '21567431', '爸落徊', '00', NULL, NULL, '0', NULL, '$2a$10$J/VlCzhr4TCucZiKjTQPie6jBbsBB3eoqv31VI008YHvj.pL5DyOG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (21592853, 10, '21592853', '男胸', '00', NULL, NULL, '0', NULL, '$2a$10$KuC6td16osd0be/Oxz/Jk.RnROinicWhY3UxawFfT8P0xCjaiand.', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (21623323, 13, '21623323', '状枯煎', '00', NULL, NULL, '0', NULL, '$2a$10$x2GvmGkyhsEFgGODLZ6KH.Fo6YplxBw5ibHCglCtf5TUSPR9S8Zcu', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (23848233, 9, '23848233', '做昌参服', '00', NULL, NULL, '0', NULL, '$2a$10$qZy8xhxOB5ITgC8884FXo.jAdOXVu7GeUyKUoAwlQXOsZ578VIKSC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (24671403, 13, '24671403', '客脚娥赶此▲', '00', NULL, NULL, '0', NULL, '$2a$10$5Ig/Q6vxdMYXtBIv9DyXF.m9E.W5XvmOBlesIN4eq6XB7hXaSAh3.', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (25366535, 13, '25366535', '兆早', '00', NULL, NULL, '0', NULL, '$2a$10$3ydlcJxRp/eTHBMD8PPoUOxCm9oIIKp/X73oK1F7sZpNscxsQUmHm', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (25429888, 13, '25429888', '杂敌专※', '00', NULL, NULL, '1', NULL, '$2a$10$zNLRdIpLjLyTf5Jqk2lVneLiNGciEgH.vH0p.u2R/BJ7E9XXx9Xeq', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (25714009, 8, '25714009', '延孝径', '00', NULL, NULL, '0', NULL, '$2a$10$teqoUhPWAgIj5x.y/I3V1./Lbi39fzzlA4fGXORP5g7P/K3XRsJR2', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (26892624, 21, '26892624', '杨睦丁', '00', NULL, NULL, '0', NULL, '$2a$10$gkmFHzk2o/KsXhdGaRnfPefRURK9hro5Umn0PIN02.qCLcUVuAjJ6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (26893032, 14, '26893032', '木槐项', '00', NULL, NULL, '0', NULL, '$2a$10$nPyxmgrvwOa6gHk7QypZaunwtgc4rZBvNKrHalSf4vgdNCptyD5Oy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (27205513, 12, '27205513', '瞧槽矗博', '00', NULL, NULL, '0', NULL, '$2a$10$dLiryLfB.81yrAWelFx6de4dGCC5m9PNppFpjexj.Uba4EJYkn18W', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (27382426, 13, '27382426', '规携限', '00', NULL, NULL, '0', NULL, '$2a$10$iUMpTdQgQJJh6e5aCBUAQuI0D4dtwt6b.32sBUnIQi3Lbg3CvGAhS', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (27728917, 2, '27728917', '胃﻿祝', '00', NULL, NULL, '0', NULL, '$2a$10$9P/Wq.anGLWjEtpcWerdIOUsb0DK7qs8by.9zdqxBD4v/.3K4aE/a', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (29403528, 18, '29403528', '孺郡研', '00', NULL, NULL, '0', NULL, '$2a$10$f6rT0/PzhmooTvbL9JOypOnaZx489DCV34HzsZFp1P8sBUChGASy.', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (30105924, 11, '30105924', '圣笔半', '00', NULL, NULL, '0', NULL, '$2a$10$CDRmO8v.87Nf53JO2Yz34eBygilOBORk2V1xYdKJ6Hek1obdq1NSa', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (30320446, 6, '30320446', '严彭于', '00', NULL, NULL, '0', NULL, '$2a$10$U4K2uAQbAE3OZiLPQ/xBCOISEbI6/e72pnboJrtFvn1gShPekuR22', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (30725848, 6, '30725848', '某郭农', '00', NULL, NULL, '0', NULL, '$2a$10$RJCkJ4h1BYmzUJ84.UQaMOLZgW4PPWztli/BBJ6BnGddJLGNzeaAe', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (31691972, 10, '31691972', '卉玫便', '00', NULL, NULL, '0', NULL, '$2a$10$PCqBl0bu70BmWJtV7Doa3uF.jV9Jb7Pk1BPnxZtQjBSvvJZvIuk9G', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (31955829, 15, '31955829', '烛妈驯', '00', NULL, NULL, '0', NULL, '$2a$10$Em/fKJBFUZ9B/.qDibFa0.V7JjMwUc/AQbsJWlCYGQnKHGFzEIrT.', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (32672631, 10, '32672631', '镜衣敝秀', '00', NULL, NULL, '0', NULL, '$2a$10$/sYJgqVYQP0skE/9AGggdOmhulbqFdfQQbhQY/QsrDuldltFoZcIO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (33353163, 1, '33353163', '曹面腋', '00', NULL, NULL, '0', NULL, '$2a$10$z8SeYWu4jxSGZ9.Mh9woX.DNJVQYFuUhiZfGE5wrrT0Cc2rDu1TDa', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (33875134, 16, '33875134', '茅雄措', '00', NULL, NULL, '0', NULL, '$2a$10$H6waiN0k1TBcLvnOncRr/OUVnUzaLcz/KqN78L73DJhhsqlzxhAju', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (34279044, 21, '34279044', '玲佳群', '00', NULL, NULL, '0', NULL, '$2a$10$mKgqhR.AOdbKm3XSFeZIdOgYrTZvmNSp48qmAqv2Rjsf8dzSKCj9u', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (34385077, 16, '34385077', '册距充☆', '00', NULL, NULL, '0', NULL, '$2a$10$azdS5tEi7Wnmw8Aoo6vMduhSy0nlmgKCCFayGePeXajpnt00cyvxy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (34532930, 17, '34532930', '祭熟球', '00', NULL, NULL, '0', NULL, '$2a$10$vb35MOJ4mKRrYsuKLiuJQOC38c9d7WEVJvbp6R2M7CK0iwKWY0wbG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (34615496, 19, '34615496', '矣二地纸', '00', NULL, NULL, '0', NULL, '$2a$10$S5TcCiXB4sux438piwSZz.5Qw7/SmzyCLIQqkgUGnGxXsDtFDq9Ti', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (35390314, 15, '35390314', '孔东导曙', '00', NULL, NULL, '0', NULL, '$2a$10$wcZmODcpYFEL36lTO.89jOrHLelUHzIvS.oP1ue9.jRM3xC4Bipdq', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (35979444, 3, '35979444', '唐膛汉☆', '00', NULL, NULL, '0', NULL, '$2a$10$tal/z9zWkMV36Kw1V5CtNex92NYOwPJ.WYedhidkh7bhIZoYR6jUi', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (36312541, 15, '36312541', '滁怪渗▲', '00', NULL, NULL, '0', NULL, '$2a$10$YK5h9M20Fhap4MPdwodjSe8FN8.zAzgxzurJI1pY7VwfoIg31jFiG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (37367576, 16, '37367576', '车乐迎套', '00', NULL, NULL, '0', NULL, '$2a$10$ksAvmbDZCE6rvOW.wRDLlOAgM8U7KTVKrymBOWbkh3s4fyIaNlYKa', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (38930007, 10, '38930007', '就集吵', '00', NULL, NULL, '0', NULL, '$2a$10$Wst2DWP/qYeoocOSKMmJxOSafMT/k/boMNOR/1uimw83z81Yxi42G', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (39247618, 1, '39247618', '暮健遁蜂', '00', NULL, NULL, '0', NULL, '$2a$10$98p8UUoL67sbVmdFiUKIZe6s1rk0y3WSI/UKJZQsii1Poh42Z13oy', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (39449157, 16, '39449157', '熊笺慈正', '00', NULL, NULL, '0', NULL, '$2a$10$6fCRzlWMfIf7.jEOQvbiG.pybRGfVuKo7Z7Ghm4niZuJDuFsdj6Qi', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (40288386, 15, '40288386', '暮甲厂▲', '00', NULL, NULL, '0', NULL, '$2a$10$JOIvB7yeMaj0yxuFQTaVF.8ZOfx/abVq6d8OZQ7VMCiBSc5j8q.sO', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (40546882, 21, '40546882', '伙料疹照熊', '00', NULL, NULL, '0', NULL, '$2a$10$h06lV4V2l.V.8shwjntiee3UmPhRRwob1D35a.bp6.yQWWr6y5MTm', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (41696054, 16, '41696054', '卵边寅', '00', NULL, NULL, '0', NULL, '$2a$10$rZrCBpraD5Yb.RlVN.g3A.f6McXPips0Mc4P/k6bIDB3HRhcuI3Be', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (41796459, 2, '41796459', '张个载', '00', NULL, NULL, '0', NULL, '$2a$10$Da1eiN8xv4UP5YpPxHMFruoWM87qvQV2VgoUiVFO/fuAxdySKhqw6', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (43327618, 16, '43327618', '们拨囤※', '00', NULL, NULL, '1', NULL, '$2a$10$S2OOvLuYrmgh6QeL9vjh3u4PU49G0s9NZHUskeC/Fiq2qOFCtv8L6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (44967351, 7, '44967351', '晤遁§', '00', NULL, NULL, '0', NULL, '$2a$10$XM7/AeHfpjdeSyHnO2vnpOXG4Awpkc/g7Y4KRNoT7hI.EtcqB4WpK', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (46079310, 1, '46079310', '沫梳戚※', '00', NULL, NULL, '1', NULL, '$2a$10$tX6NA.g6nZn0n1NFJDT81.bH9lSWBrAqabsnkJV0EFD2AWWujsAFG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (46160734, 5, '46160734', '箕着令毫', '00', NULL, NULL, '0', NULL, '$2a$10$.5gVy2VpmK4dAeOXjvKHTePzRYUdmq/wkIXiR1/LCVcFz4CgOcZsu', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (46494071, 20, '46494071', '巨盛▲', '00', NULL, NULL, '0', NULL, '$2a$10$ebVUXqzHpaxxR0U5zSCtqOObR0P0xB1.jfMZu5blyek76wFN8TD/W', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (46573540, 12, '46573540', '雷象燕', '00', NULL, NULL, '0', NULL, '$2a$10$8MddCxMNkBqtBjjZez4EKe1gyt8mwKN02cv1e2i5HS.fc8A19LEBa', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (47529373, 13, '47529373', '除思篓曾▲', '00', NULL, NULL, '0', NULL, '$2a$10$KrvR/VJNg4lCq4JU4V2ayO5azghUyX1Tpvh4QzCDnfj7EUraVtP0m', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (47867461, 4, '47867461', '萌玲设播', '00', NULL, NULL, '0', NULL, '$2a$10$kKyQTTqd0XoSTR/4WOYkgOhQPoeWZQhnuAe9.I53x0aedNu2/gOZu', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (48413974, 12, '48413974', '露钡短', '00', NULL, NULL, '0', NULL, '$2a$10$9Nhoe.DShrS.Ton1FsqZu.Uc4Io655jaOo4.FT76nmX3uDlSM3RhG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (48855368, 1, '48855368', '备曾美', '00', NULL, NULL, '0', NULL, '$2a$10$gpalwVCV1nbjkW6pPrNOu.Xv8pPXwX5/Lwk.UMf7wR2Way9c/DpGG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (50754534, 15, '50754534', '壮割雁§', '00', NULL, NULL, '0', NULL, '$2a$10$CuJuwQbRxxU5/kqYf8le4Of7vJrWJO6oYeCxc9xqGDJfgB6Z4EnzW', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (51009835, 15, '51009835', '詹珊房', '00', NULL, NULL, '0', NULL, '$2a$10$3KkqhYdzd.bpcSEQ6y8zKOLvf5INWnk9hb37oCw7/V7wBHPI/TY2O', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (52372365, 16, '52372365', '项诡', '00', NULL, NULL, '0', NULL, '$2a$10$bNGauavdCsqa61PjOg5.PebGWlVnCQn8E2dpHepr6HFcfcihc21Ke', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (52921408, 4, '52921408', '语征靠翻※', '00', NULL, NULL, '1', NULL, '$2a$10$NodGGYGPVJ2nCZIw2BAh2.qJcmcWg6PBP22z0PP4Me0X8F1Spsae2', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (53141621, 12, '53141621', '桑赵弱盾', '00', NULL, NULL, '0', NULL, '$2a$10$2bWOlXvrTZc0CIei0Is95.uNqEeTH4S/ZzL2VW4PzuPB41JjxZUOa', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (54133590, 20, '54133590', '愈播裔', '00', NULL, NULL, '0', NULL, '$2a$10$6c15SlYq1GH0pEbmoDQaje94O7AjmZF0DMlwXzspLgAY2mc8vYZp6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (54974544, 12, '54974544', '骨专她▲', '00', NULL, NULL, '0', NULL, '$2a$10$oBZfZXdnqQV7VL6zMfFc1usf3hUzU7hd.Wse.UqHg4/Av6eXfEDeC', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (55241061, 3, '55241061', '型坤狠', '00', NULL, NULL, '0', NULL, '$2a$10$Cy1RIPrMgnMIFwalGc6pMehl2P8srpVpaFO01wtEjubpicYqE3QrG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (56180260, 19, '56180260', '郎未铜', '00', NULL, NULL, '0', NULL, '$2a$10$uzU6grCk74NOib7bvvaCcOJAgCnULbWKmPwvfZNpmJjGDzTrTkKbK', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (56514922, 19, '56514922', '丑陆甸', '00', NULL, NULL, '0', NULL, '$2a$10$1cr2ldIlxHj.tdxQFNyfv.xeqRAW08UM8OzC75viqFQXLXSBlz5Oa', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (57353425, 12, '57353425', '顶敬众邦', '00', NULL, NULL, '0', NULL, '$2a$10$P.flYN4BI5monXuktibVL.UyEQcL8SOpJwmus4E.1zr1Yhv9.8PZS', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (57404657, 8, '57404657', '肃蕴折陪娟', '00', NULL, NULL, '0', NULL, '$2a$10$gu2u1MwjRJvfFFMWU8Tbi.SNtNjWpDl1vEvNexfPVPs9P5MogM6QW', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (57516039, 16, '57516039', '灭火太▲', '00', NULL, NULL, '0', NULL, '$2a$10$5VzZk6CXtrQr2rTjZSj6pOJvRfNMs8OjIVOzqZXIdMGPzRWtXKFQO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (57845728, 10, '57845728', '象粳免', '00', NULL, NULL, '0', NULL, '$2a$10$sLQXRpJPAmM5.Ep611V/p.5gTwTs09zPwFUo0ZUfvulc/md5YlRJC', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (58625953, 7, '58625953', '哲相如☆', '00', NULL, NULL, '0', NULL, '$2a$10$9MaYbs7Fg61yBnW9RVya7u.cYXFck9jYLUFZH8n4rO9J0o1ChMTLa', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (60089312, 2, '60089312', '贾笔庆▲', '00', NULL, NULL, '0', NULL, '$2a$10$0B29znHyzu3AK9hcLwcecuPqnLFRBXvlJM7uwu1bMqUN1B2V7WTlq', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (61927552, 1, '61927552', '决极壕龙', '00', NULL, NULL, '0', NULL, '$2a$10$q6gJVh1lhJFCER2DjQrOrOa/rBZJghVUzS4mTclo5hRyL1yM9Q/pi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (61983195, 21, '61983195', '哎兰亭林', '00', NULL, NULL, '0', NULL, '$2a$10$zlDxzEY.YmP5xifZyQslaugwaS9YwM2ELt//xbA7uZtCxQm2yT1yC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (62669538, 3, '62669538', '绿应磨', '00', NULL, NULL, '0', NULL, '$2a$10$J2XhaYOcLMNbjCoKut23peUXa9GJWOuN8JehwwJOVsnbziZLRb6.G', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (64512565, 18, '64512565', '麦惟间', '00', NULL, NULL, '0', NULL, '$2a$10$OF/XOyvfFM0Uj3IGMNFUrOp.xAXQoGULfTZv1aVPIGDA8cgEt7mZy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (64771866, 2, '64771866', '驯山航', '00', NULL, NULL, '0', NULL, '$2a$10$sfIPbACkrR3SiOwPGcLwAuIdtZoi66PWaR0o68QzwdaOW6UIMFv2S', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (65669036, 11, '65669036', '住陈替四', '00', NULL, NULL, '0', NULL, '$2a$10$96jmfd/jvYOIU3ettjQR6u7r5skpC6omZ.VFstkoYT1c90NkR6Qry', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (66498413, 7, '66498413', '瓣费提征', '00', NULL, NULL, '0', NULL, '$2a$10$WSbF7qZcIbf70lBGEowMOu42OOWx3Y4/5bYkgCArKI/ZsCuwPaodi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (67418410, 3, '67418410', '际郑阿', '00', NULL, NULL, '0', NULL, '$2a$10$XRBcI39WZz6QvUFcLLIEou8erJYWXSD2uJWFwpKH0twmym3DG8xS6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (68135231, 14, '68135231', '圣沸马倒亢', '00', NULL, NULL, '0', NULL, '$2a$10$LeDEj.jQTs755HKXxS2BgeXHkH8JAt4K5iBM9IAF9Jp2dKjIAxaQu', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (68430192, 18, '68430192', '香迷穗※', '00', NULL, NULL, '1', NULL, '$2a$10$YFjNicgXlUUxcDuoKbRaeuX3MIqEUV.MjgUEWO7iaLr7FjCLGs9cq', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (69413460, 3, '69413460', '团羹肩', '00', NULL, NULL, '0', NULL, '$2a$10$EVa6c42h4vgzedmbgWkm1.hk/drFMR00dbonWFvROGy9iTLX9z1HG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (69897143, 5, '69897143', '椿笔通▲', '00', NULL, NULL, '0', NULL, '$2a$10$gucrL9nZPHmGGfVBraUXoeHxgra7BbJ.VyrzJHuo9S4RmRGY1CoYq', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (70004430, 9, '70004430', '味则蜡', '00', NULL, NULL, '0', NULL, '$2a$10$Nbf7oZFINVSDH51vY/07eO0tzrg1I3tm9QM4aSLxPHKUC5dXc1Jza', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (70195151, 5, '70195151', '亭吃敏翠☆', '00', NULL, NULL, '0', NULL, '$2a$10$SzPJQao6Wwycv27S5b4sOuWvO5Ztec34GbtGAyZJQpgF.VuLDVjcS', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (70305853, 10, '70305853', '每乃土咸', '00', NULL, NULL, '0', NULL, '$2a$10$LBvTWqe0Z7KFMaXwsLzACuer9LBtrvm0AeQ5WyrmxWrVcR7wbwNLe', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (70632774, 9, '70632774', '砚睛页步', '00', NULL, NULL, '0', NULL, '$2a$10$N0Xy9YZIguYnHTt6WXMtUug.aK.elvcG07sp1RxdpsC26LaisCAhq', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (70746323, 9, '70746323', '菌坍被', '00', NULL, NULL, '0', NULL, '$2a$10$g9J4tG5sHV8jN4cangEzMeFDt4XBKp8IdpE7M9dL3B3AJnC1ortVS', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (71078070, 20, '71078070', '例它厉', '00', NULL, NULL, '0', NULL, '$2a$10$AhbqyWrd/mTfUXFyuG7uv.2L4Y716Dd432DODFLeZ2IYDkVwq.OfW', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (71671622, 12, '71671622', '鼎冯', '00', NULL, NULL, '0', NULL, '$2a$10$0F4WIdS9oqTyeT74NcDYbuG4S8OVJTm2mH.4pBNGmMJUH0e5IL2xm', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (72603778, 8, '72603778', '十振责苗', '00', NULL, NULL, '0', NULL, '$2a$10$m/LcfTBpuz0rLNK5vK9b2e7X2SouIzNglRpF33nyfyHK50pL6olOi', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (73925439, 20, '73925439', '绵预舜', '00', NULL, NULL, '0', NULL, '$2a$10$rcZO.1HhnjlrchVC7JYbCeCY6nqEKZDYIgsXf5cQtKsmEB3VQotzi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (73983944, 15, '73983944', '激描他', '00', NULL, NULL, '0', NULL, '$2a$10$SbeVa3jNm9DAsHY6LFONFulTjCTTGWKZ2j5vPJ70Vv7Balve3VsSG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (74703959, 6, '74703959', '敏胸刀听', '00', NULL, NULL, '0', NULL, '$2a$10$zj5FKrPQQI5MMq12J88XoOSHx6lxjAz7pRbrbxISTEZJsv.2rfBsu', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (74741150, 14, '74741150', '婉稳获', '00', NULL, NULL, '0', NULL, '$2a$10$5tRA63PhcpCWHo6JKs46FOwETWT8/QTUVNtFCVBWUEgoW/Uc657wi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (74884313, 7, '74884313', '渐束※', '00', NULL, NULL, '0', NULL, '$2a$10$b1gDBEqZI3OI04YtvrtSheHZm5dgCuAT2t2TBlB3Svf59805YtTu.', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (75127146, 7, '75127146', '宝锭', '00', NULL, NULL, '0', NULL, '$2a$10$Hob1NWI1DjB5ZXfPa51dB.COEzXgEmrGxwjgvoTcMNQvcR1i5G5a6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (75479404, 4, '75479404', '姚宾粤他', '00', NULL, NULL, '0', NULL, '$2a$10$XG58bkPBWesMNF3qaJeaN./eVsiFdJRkvNp1LRISIGbofg8gLdM6a', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (76324172, 19, '76324172', '克输', '00', NULL, NULL, '0', NULL, '$2a$10$A3gU/KRlwjsyWPbIeTqlGuf1KJe4GHc/Y.XmV8LyUgYFzRAEEEmkC', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (76529911, 12, '76529911', '升日训', '00', NULL, NULL, '0', NULL, '$2a$10$UrE1y9.mh/GtN5u5OQXr4uU/YOvGNuYqBpuTbJAHv/VF54jz2I3KG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (76712685, 1, '76712685', '控统信§', '00', NULL, NULL, '0', NULL, '$2a$10$AkbPBOMboTCw.IO/153NBuBRU49NvlZQfBAQPGlGtdAV5jUYKoYUy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (77432322, 11, '77432322', '纸葫式', '00', NULL, NULL, '0', NULL, '$2a$10$p0opIWTuISWg4utYvxH8EeWdb.8i956lSJMTe0yJwSpxYBtpWT8Lm', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (77832257, 1, '77832257', '背锡屈▲', '00', NULL, NULL, '0', NULL, '$2a$10$Rh/loXSbe74AOrHEqxNfJOHBKRVVWslWbNZPonxDIrulxUBBY8cHe', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (78089028, 13, '78089028', '排愉', '00', NULL, NULL, '0', NULL, '$2a$10$sCmrc/oBFuQ1QZcbg0UrLeCvoY4/mKbf0EQG1yaSMqhB2/o9o81tO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (78618234, 1, '78618234', '孺量', '00', NULL, NULL, '0', NULL, '$2a$10$NBcxVrEBmyBM8t7QpEK.V.kVjAqLHShU444VOwU6B.z4T6Oq/BJwq', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (78619302, 11, '78619302', '靠常▲', '00', NULL, NULL, '0', NULL, '$2a$10$27WtQQMCbnLeS3C9avuOfeZB1aOwV2AOx8uQFvFAYrW8Qrq9wun12', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (79260743, 6, '79260743', '洼从皿穆', '00', NULL, NULL, '0', NULL, '$2a$10$Z04a6h6GQSTeeBjQgFrpQePS.fChZqhLST.97lgttkE1W5JhoEScG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (79520505, 9, '79520505', '景伦肝灰', '00', NULL, NULL, '0', NULL, '$2a$10$GigwmYzJEwY4eDj.T3QwyuEiaEijaI8erlZUPacyP2h797LQKKImC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (80483359, 20, '80483359', '并惟囤引', '00', NULL, NULL, '0', NULL, '$2a$10$dTJzS3btT.QnmSYN272/HeIzjmMkLAe3of54s9xA1pIExfAZav3pS', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (80663518, 5, '80663518', '骤左玉', '00', NULL, NULL, '0', NULL, '$2a$10$bRgYM5e80F0ch8DlZ7K8DuuVj1EUxq2FG39hB6llEPjOGEw8IVqv2', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (80841877, 2, '80841877', '辞痊诬', '00', NULL, NULL, '0', NULL, '$2a$10$yVsUifzBKHi7GATifufhOOUxk3D8XUSeKYvNK.l5mMTbM.u27npOC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (81284889, 2, '81284889', '闪莉感※', '00', NULL, NULL, '1', NULL, '$2a$10$QGbzxsT78vrxYgRQInyKC.YOFMfMv7.6W1h7N4W4kqjbUCzXp8o9.', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (81842162, 14, '81842162', '狱讨菱☆', '00', NULL, NULL, '0', NULL, '$2a$10$sijA8J5XiHZBajHlgbGlt.EiQBr6jfC20LLLVIDottzP0bBxCEZdC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (82446964, 2, '82446964', '夕捍滑', '00', NULL, NULL, '0', NULL, '$2a$10$9x13Iw9a3EKJtqlzlJ0H.OlbICkKrVP5d6rhiqmRf4IJZzzv2vqVG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (82575303, 9, '82575303', '价多肆', '00', NULL, NULL, '0', NULL, '$2a$10$F7BoOrgzxJyNeu7eo0lLGe4i822gdl4LKpH7ljMFhK0MKxrbRTceG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (82791768, 6, '82791768', '喷赴傣', '00', NULL, NULL, '0', NULL, '$2a$10$7V2PCM0S21rYieAmRg/wpuxy6LEEj7wFBI586UEY6bDZ9ASyWWnhG', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (83344817, 13, '83344817', '兼朋', '00', NULL, NULL, '0', NULL, '$2a$10$y5ywN8CzDSfmPLs4IO/RxOYJ7grENQ9AQVQLtMVdqlkRUVVpY6BTa', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (84395738, 12, '84395738', '斜玉植', '00', NULL, NULL, '0', NULL, '$2a$10$DOIh2WHQ5QrGFmLgslyOMuemOcNo/zsrPhponP0o2HzqNBLyNVSAO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:55', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (85490122, 7, '85490122', '临生持', '00', NULL, NULL, '0', NULL, '$2a$10$P6tyHTG2SSQ.qxAdTr9zh.36Glh5hBrl1QCtqoig.j/CdK/6/DOa6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (85720734, 17, '85720734', '题常万', '00', NULL, NULL, '0', NULL, '$2a$10$aHHpIilc/kXTO/kpExnd2O7d9.VKT92WjvTzeL2EqYLu52ISpLQEW', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (86323976, 9, '86323976', '葫真完☆', '00', NULL, NULL, '0', NULL, '$2a$10$oJTCQutDZ3IHtjoFYKxPqur3ISU/6RICUx/8hrPpXJ0JlSO3W2JOS', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (86880776, 16, '86880776', '魁梨管', '00', NULL, NULL, '0', NULL, '$2a$10$NNNIZ0dvN6zoBNq9p3cpgO07sUi4N3eJbfCk6ZMyndAzRsU213TI2', '0', '0', '', NULL, NULL, '2024-07-09 04:11:56', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (87639440, 4, '87639440', '献匡蜗', '00', NULL, NULL, '0', NULL, '$2a$10$wBjU0zCEOabGOjfsovh70eYU1CuSeDXX.GAj2TxiDtAu49PMJzQGi', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (88413887, 8, '88413887', '翁相', '00', NULL, NULL, '0', NULL, '$2a$10$dkuKf8F2Ahn5iHJOkUYwReD5iOhfbC8d7mWgv.NV0rurJdJ91VYWO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:54', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (90440841, 5, '90440841', '总栈异', '00', NULL, NULL, '0', NULL, '$2a$10$S5xvgYvixeXE11JLctF5ru/5k1JDf9KoyeBNcBiEvHb1P1NjKs.Ve', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (90787616, 2, '90787616', '类盐段刊述凹先慢惫束有须旋矗', '00', NULL, NULL, '0', NULL, '$2a$10$lzK7SicQ8DnULWydTeCmiOIDnb7x0a2nlr6cbpzEkA9YF1j1G6gq6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (90854599, 18, '90854599', '倦检去', '00', NULL, NULL, '0', NULL, '$2a$10$bHzbbVJouWp0/ue8qqI3yenTmH82Bhx9oUNHXbxhQClBJdbl3ISbG', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (91161667, 1, '91161667', '主牟', '00', NULL, NULL, '0', NULL, '$2a$10$E7PU82vQa.Df2fbJ/uIjyOYwOY.e.GMDit1jdFJif9NWHnd.XBpUO', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (91197802, 5, '91197802', '癸帛棕骤', '00', NULL, NULL, '0', NULL, '$2a$10$uRlvqzcz61cwLXpFdpjZceT0Khs2bY/er6PF7aHF3T8Z.JfW2datq', '0', '0', '', NULL, NULL, '2024-07-09 04:11:57', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (92435019, 16, '92435019', '否务侵', '00', NULL, NULL, '0', NULL, '$2a$10$WDOlfSPQRcp3rV4M2mTkJul3cqyMvaR/xUHtLeuf4hUrTtTZNwfjO', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (92614677, 9, '92614677', '虽侠充☆', '00', NULL, NULL, '0', NULL, '$2a$10$MpDHQSs0uvVYFs1GLOkrPOxVdXi1KRlHdbUpaQkETIrcI2fEBEv/K', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (93791211, 3, '93791211', '和谴锡', '00', NULL, NULL, '0', NULL, '$2a$10$Xlr3l99u1KZx7H5gMYXGzemLcPGfS/YklFXOi1UaUCc7KPa6rIpM2', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (93961187, 17, '93961187', '童戏后担', '00', NULL, NULL, '0', NULL, '$2a$10$uT/TnaIz.0F.ITtLkO6pheYad18J.3YrRgZQjIapMjzUFZdTJrp1G', '0', '0', '', NULL, NULL, '2024-07-09 04:12:00', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (94095291, 21, '94095291', '恨餐夺※', '00', NULL, NULL, '1', NULL, '$2a$10$KoFmP/N2XvM8X/tDViDPieFUWfkn7jmg2EIJTMUUXVhwMBR/tr8Ju', '0', '0', '', NULL, NULL, '2024-07-09 04:12:04', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (95350141, 6, '95350141', '蜂匀俯夹', '00', NULL, NULL, '0', NULL, '$2a$10$nAox3E1DRobh0dcR/B/xb.Q.pUYK/LBirP3hZqmgKJKTl9kqO0yjy', '0', '0', '', NULL, NULL, '2024-07-09 04:12:02', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (96577697, 9, '96577697', '攻碑喷', '00', NULL, NULL, '0', NULL, '$2a$10$B2NCGVCBP0/f/pJDQkw5L.67xpIgpS1M2Vt6poopusqSV9VynsRUe', '0', '0', '', NULL, NULL, '2024-07-09 04:11:59', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (96830032, 15, '96830032', '式图力', '00', NULL, NULL, '0', NULL, '$2a$10$uNTvUS5ZRIxr8hV9.Uw7JOoobIqUjlZIvkZOiHBTP9ddV55N5sT/K', '0', '0', '', NULL, NULL, '2024-07-09 04:12:05', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (97135574, 6, '97135574', '期片板', '00', NULL, NULL, '0', NULL, '$2a$10$9S4QFw9gsQiODgsp3r/DwuHoF/ZB3/.xbwkRSP8cEuOH10OehSeS6', '0', '0', '', NULL, NULL, '2024-07-09 04:12:01', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (97557511, 20, '97557511', '倾毛璃', '00', NULL, NULL, '0', NULL, '$2a$10$9Cb/q/7nVdLZmLTIB.Qg4eq22FlqRrMpMXFMiMQ2nD8zB7nUUXcNO', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (98909663, 10, '98909663', '补怕低桓', '00', NULL, NULL, '0', NULL, '$2a$10$2dkhMPBjC1LgvxbH9Na06e2Vp4YjmzcLuAcRf.3I.YEqTlFZgFokC', '0', '0', '', NULL, NULL, '2024-07-09 04:12:03', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (99213668, 1, '99213668', '媳埃脱', '00', NULL, NULL, '0', NULL, '$2a$10$GzzjrFtZCJ2rWExaid6AIuBLPAVzDLwjraXxKRTkV/VoG3fRiur0W', '0', '0', '', NULL, NULL, '2024-07-09 04:11:53', '', NULL, '学生');
INSERT INTO `sys_user` VALUES (99729325, 8, '99729325', '订龄', '00', NULL, NULL, '0', NULL, '$2a$10$kigpKLOjG.ATir4V/Bln8ui65RfP2DbEDlvDvl64WDf/JT0rBp.02', '0', '0', '', NULL, NULL, '2024-07-09 04:11:58', '', NULL, '学生');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  CONSTRAINT `fk_roleuser` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 102);
INSERT INTO `sys_user_role` VALUES (3, 102);
INSERT INTO `sys_user_role` VALUES (4, 103);
INSERT INTO `sys_user_role` VALUES (5, 103);
INSERT INTO `sys_user_role` VALUES (6, 103);
INSERT INTO `sys_user_role` VALUES (7, 103);
INSERT INTO `sys_user_role` VALUES (8, 103);
INSERT INTO `sys_user_role` VALUES (9, 103);
INSERT INTO `sys_user_role` VALUES (10, 103);
INSERT INTO `sys_user_role` VALUES (11, 103);
INSERT INTO `sys_user_role` VALUES (12, 103);
INSERT INTO `sys_user_role` VALUES (13, 103);
INSERT INTO `sys_user_role` VALUES (14, 103);
INSERT INTO `sys_user_role` VALUES (15, 103);
INSERT INTO `sys_user_role` VALUES (16, 103);
INSERT INTO `sys_user_role` VALUES (17, 103);
INSERT INTO `sys_user_role` VALUES (18, 103);
INSERT INTO `sys_user_role` VALUES (19, 103);
INSERT INTO `sys_user_role` VALUES (20, 103);
INSERT INTO `sys_user_role` VALUES (21, 103);
INSERT INTO `sys_user_role` VALUES (22, 103);
INSERT INTO `sys_user_role` VALUES (23, 103);
INSERT INTO `sys_user_role` VALUES (24, 103);
INSERT INTO `sys_user_role` VALUES (25, 103);
INSERT INTO `sys_user_role` VALUES (26, 103);
INSERT INTO `sys_user_role` VALUES (27, 103);
INSERT INTO `sys_user_role` VALUES (28, 103);
INSERT INTO `sys_user_role` VALUES (29, 103);
INSERT INTO `sys_user_role` VALUES (30, 103);
INSERT INTO `sys_user_role` VALUES (31, 103);
INSERT INTO `sys_user_role` VALUES (32, 103);
INSERT INTO `sys_user_role` VALUES (33, 103);
INSERT INTO `sys_user_role` VALUES (34, 103);
INSERT INTO `sys_user_role` VALUES (35, 103);
INSERT INTO `sys_user_role` VALUES (36, 103);
INSERT INTO `sys_user_role` VALUES (37, 103);
INSERT INTO `sys_user_role` VALUES (38, 103);
INSERT INTO `sys_user_role` VALUES (39, 103);
INSERT INTO `sys_user_role` VALUES (40, 103);
INSERT INTO `sys_user_role` VALUES (41, 103);
INSERT INTO `sys_user_role` VALUES (42, 103);
INSERT INTO `sys_user_role` VALUES (43, 103);
INSERT INTO `sys_user_role` VALUES (44, 103);
INSERT INTO `sys_user_role` VALUES (45, 103);
INSERT INTO `sys_user_role` VALUES (46, 103);
INSERT INTO `sys_user_role` VALUES (47, 103);
INSERT INTO `sys_user_role` VALUES (48, 103);
INSERT INTO `sys_user_role` VALUES (49, 103);
INSERT INTO `sys_user_role` VALUES (50, 103);
INSERT INTO `sys_user_role` VALUES (51, 103);
INSERT INTO `sys_user_role` VALUES (52, 103);
INSERT INTO `sys_user_role` VALUES (53, 103);
INSERT INTO `sys_user_role` VALUES (54, 103);
INSERT INTO `sys_user_role` VALUES (55, 103);
INSERT INTO `sys_user_role` VALUES (56, 103);
INSERT INTO `sys_user_role` VALUES (57, 103);
INSERT INTO `sys_user_role` VALUES (58, 103);
INSERT INTO `sys_user_role` VALUES (59, 103);
INSERT INTO `sys_user_role` VALUES (60, 103);
INSERT INTO `sys_user_role` VALUES (61, 103);
INSERT INTO `sys_user_role` VALUES (62, 103);
INSERT INTO `sys_user_role` VALUES (63, 103);
INSERT INTO `sys_user_role` VALUES (64, 103);
INSERT INTO `sys_user_role` VALUES (65, 103);
INSERT INTO `sys_user_role` VALUES (66, 103);
INSERT INTO `sys_user_role` VALUES (67, 103);
INSERT INTO `sys_user_role` VALUES (68, 103);
INSERT INTO `sys_user_role` VALUES (69, 103);
INSERT INTO `sys_user_role` VALUES (70, 103);
INSERT INTO `sys_user_role` VALUES (71, 103);
INSERT INTO `sys_user_role` VALUES (72, 103);
INSERT INTO `sys_user_role` VALUES (73, 103);
INSERT INTO `sys_user_role` VALUES (74, 103);
INSERT INTO `sys_user_role` VALUES (75, 103);
INSERT INTO `sys_user_role` VALUES (76, 103);
INSERT INTO `sys_user_role` VALUES (77, 103);
INSERT INTO `sys_user_role` VALUES (78, 103);
INSERT INTO `sys_user_role` VALUES (79, 103);
INSERT INTO `sys_user_role` VALUES (80, 103);
INSERT INTO `sys_user_role` VALUES (81, 103);
INSERT INTO `sys_user_role` VALUES (82, 103);
INSERT INTO `sys_user_role` VALUES (83, 103);
INSERT INTO `sys_user_role` VALUES (84, 103);
INSERT INTO `sys_user_role` VALUES (85, 103);
INSERT INTO `sys_user_role` VALUES (86, 103);
INSERT INTO `sys_user_role` VALUES (87, 103);
INSERT INTO `sys_user_role` VALUES (88, 103);
INSERT INTO `sys_user_role` VALUES (89, 103);
INSERT INTO `sys_user_role` VALUES (90, 103);
INSERT INTO `sys_user_role` VALUES (91, 103);
INSERT INTO `sys_user_role` VALUES (92, 103);
INSERT INTO `sys_user_role` VALUES (93, 103);
INSERT INTO `sys_user_role` VALUES (94, 103);
INSERT INTO `sys_user_role` VALUES (95, 103);
INSERT INTO `sys_user_role` VALUES (96, 103);
INSERT INTO `sys_user_role` VALUES (97, 103);
INSERT INTO `sys_user_role` VALUES (98, 103);
INSERT INTO `sys_user_role` VALUES (99, 103);
INSERT INTO `sys_user_role` VALUES (100, 103);
INSERT INTO `sys_user_role` VALUES (101, 103);
INSERT INTO `sys_user_role` VALUES (102, 103);
INSERT INTO `sys_user_role` VALUES (103, 103);
INSERT INTO `sys_user_role` VALUES (104, 103);
INSERT INTO `sys_user_role` VALUES (105, 103);
INSERT INTO `sys_user_role` VALUES (106, 103);
INSERT INTO `sys_user_role` VALUES (107, 103);
INSERT INTO `sys_user_role` VALUES (108, 103);
INSERT INTO `sys_user_role` VALUES (109, 103);
INSERT INTO `sys_user_role` VALUES (110, 103);
INSERT INTO `sys_user_role` VALUES (111, 103);
INSERT INTO `sys_user_role` VALUES (112, 103);
INSERT INTO `sys_user_role` VALUES (113, 103);
INSERT INTO `sys_user_role` VALUES (114, 103);
INSERT INTO `sys_user_role` VALUES (115, 103);
INSERT INTO `sys_user_role` VALUES (116, 101);
INSERT INTO `sys_user_role` VALUES (117, 101);
INSERT INTO `sys_user_role` VALUES (118, 101);
INSERT INTO `sys_user_role` VALUES (119, 101);
INSERT INTO `sys_user_role` VALUES (120, 101);
INSERT INTO `sys_user_role` VALUES (121, 101);
INSERT INTO `sys_user_role` VALUES (122, 101);
INSERT INTO `sys_user_role` VALUES (123, 101);
INSERT INTO `sys_user_role` VALUES (124, 101);
INSERT INTO `sys_user_role` VALUES (125, 101);
INSERT INTO `sys_user_role` VALUES (126, 101);
INSERT INTO `sys_user_role` VALUES (127, 101);
INSERT INTO `sys_user_role` VALUES (128, 101);
INSERT INTO `sys_user_role` VALUES (129, 101);
INSERT INTO `sys_user_role` VALUES (130, 101);
INSERT INTO `sys_user_role` VALUES (131, 101);
INSERT INTO `sys_user_role` VALUES (132, 101);
INSERT INTO `sys_user_role` VALUES (133, 101);
INSERT INTO `sys_user_role` VALUES (134, 101);
INSERT INTO `sys_user_role` VALUES (135, 101);
INSERT INTO `sys_user_role` VALUES (136, 101);
INSERT INTO `sys_user_role` VALUES (137, 101);
INSERT INTO `sys_user_role` VALUES (138, 101);
INSERT INTO `sys_user_role` VALUES (139, 101);
INSERT INTO `sys_user_role` VALUES (140, 101);
INSERT INTO `sys_user_role` VALUES (141, 101);
INSERT INTO `sys_user_role` VALUES (142, 101);
INSERT INTO `sys_user_role` VALUES (143, 101);
INSERT INTO `sys_user_role` VALUES (144, 101);
INSERT INTO `sys_user_role` VALUES (145, 101);
INSERT INTO `sys_user_role` VALUES (146, 101);
INSERT INTO `sys_user_role` VALUES (147, 101);
INSERT INTO `sys_user_role` VALUES (148, 101);
INSERT INTO `sys_user_role` VALUES (149, 101);
INSERT INTO `sys_user_role` VALUES (150, 101);
INSERT INTO `sys_user_role` VALUES (151, 101);
INSERT INTO `sys_user_role` VALUES (152, 101);
INSERT INTO `sys_user_role` VALUES (153, 101);
INSERT INTO `sys_user_role` VALUES (154, 101);
INSERT INTO `sys_user_role` VALUES (155, 101);
INSERT INTO `sys_user_role` VALUES (156, 101);
INSERT INTO `sys_user_role` VALUES (157, 101);
INSERT INTO `sys_user_role` VALUES (158, 101);
INSERT INTO `sys_user_role` VALUES (159, 101);
INSERT INTO `sys_user_role` VALUES (160, 101);
INSERT INTO `sys_user_role` VALUES (161, 101);
INSERT INTO `sys_user_role` VALUES (162, 101);
INSERT INTO `sys_user_role` VALUES (163, 101);
INSERT INTO `sys_user_role` VALUES (164, 101);
INSERT INTO `sys_user_role` VALUES (165, 101);
INSERT INTO `sys_user_role` VALUES (166, 101);
INSERT INTO `sys_user_role` VALUES (167, 101);
INSERT INTO `sys_user_role` VALUES (168, 101);
INSERT INTO `sys_user_role` VALUES (169, 101);
INSERT INTO `sys_user_role` VALUES (170, 101);
INSERT INTO `sys_user_role` VALUES (171, 101);
INSERT INTO `sys_user_role` VALUES (172, 101);
INSERT INTO `sys_user_role` VALUES (173, 101);
INSERT INTO `sys_user_role` VALUES (174, 101);
INSERT INTO `sys_user_role` VALUES (175, 101);
INSERT INTO `sys_user_role` VALUES (176, 101);
INSERT INTO `sys_user_role` VALUES (383842, 100);
INSERT INTO `sys_user_role` VALUES (410555, 100);
INSERT INTO `sys_user_role` VALUES (574181, 100);
INSERT INTO `sys_user_role` VALUES (1058795, 100);
INSERT INTO `sys_user_role` VALUES (1287420, 100);
INSERT INTO `sys_user_role` VALUES (2292962, 100);
INSERT INTO `sys_user_role` VALUES (2326791, 100);
INSERT INTO `sys_user_role` VALUES (2727632, 100);
INSERT INTO `sys_user_role` VALUES (3938899, 100);
INSERT INTO `sys_user_role` VALUES (4754552, 100);
INSERT INTO `sys_user_role` VALUES (4803919, 100);
INSERT INTO `sys_user_role` VALUES (5368505, 100);
INSERT INTO `sys_user_role` VALUES (5521063, 100);
INSERT INTO `sys_user_role` VALUES (6938200, 100);
INSERT INTO `sys_user_role` VALUES (7276262, 100);
INSERT INTO `sys_user_role` VALUES (7812089, 100);
INSERT INTO `sys_user_role` VALUES (9028823, 100);
INSERT INTO `sys_user_role` VALUES (9626596, 100);
INSERT INTO `sys_user_role` VALUES (9877012, 100);
INSERT INTO `sys_user_role` VALUES (10165672, 100);
INSERT INTO `sys_user_role` VALUES (10348131, 100);
INSERT INTO `sys_user_role` VALUES (10983982, 100);
INSERT INTO `sys_user_role` VALUES (11540548, 100);
INSERT INTO `sys_user_role` VALUES (12498507, 100);
INSERT INTO `sys_user_role` VALUES (13640242, 100);
INSERT INTO `sys_user_role` VALUES (13700480, 100);
INSERT INTO `sys_user_role` VALUES (14206566, 100);
INSERT INTO `sys_user_role` VALUES (15512203, 100);
INSERT INTO `sys_user_role` VALUES (16238926, 100);
INSERT INTO `sys_user_role` VALUES (16413341, 100);
INSERT INTO `sys_user_role` VALUES (16466043, 100);
INSERT INTO `sys_user_role` VALUES (16872358, 100);
INSERT INTO `sys_user_role` VALUES (16947368, 100);
INSERT INTO `sys_user_role` VALUES (17342616, 100);
INSERT INTO `sys_user_role` VALUES (18880597, 100);
INSERT INTO `sys_user_role` VALUES (19284332, 100);
INSERT INTO `sys_user_role` VALUES (20322299, 100);
INSERT INTO `sys_user_role` VALUES (20747376, 100);
INSERT INTO `sys_user_role` VALUES (20801640, 100);
INSERT INTO `sys_user_role` VALUES (21567431, 100);
INSERT INTO `sys_user_role` VALUES (21592853, 100);
INSERT INTO `sys_user_role` VALUES (21623323, 100);
INSERT INTO `sys_user_role` VALUES (23848233, 100);
INSERT INTO `sys_user_role` VALUES (24671403, 100);
INSERT INTO `sys_user_role` VALUES (25366535, 100);
INSERT INTO `sys_user_role` VALUES (25429888, 100);
INSERT INTO `sys_user_role` VALUES (25714009, 100);
INSERT INTO `sys_user_role` VALUES (26892624, 100);
INSERT INTO `sys_user_role` VALUES (26893032, 100);
INSERT INTO `sys_user_role` VALUES (27205513, 100);
INSERT INTO `sys_user_role` VALUES (27382426, 100);
INSERT INTO `sys_user_role` VALUES (27728917, 100);
INSERT INTO `sys_user_role` VALUES (29403528, 100);
INSERT INTO `sys_user_role` VALUES (30105924, 100);
INSERT INTO `sys_user_role` VALUES (30320446, 100);
INSERT INTO `sys_user_role` VALUES (30725848, 100);
INSERT INTO `sys_user_role` VALUES (31691972, 100);
INSERT INTO `sys_user_role` VALUES (31955829, 100);
INSERT INTO `sys_user_role` VALUES (32672631, 100);
INSERT INTO `sys_user_role` VALUES (33353163, 100);
INSERT INTO `sys_user_role` VALUES (33875134, 100);
INSERT INTO `sys_user_role` VALUES (34279044, 100);
INSERT INTO `sys_user_role` VALUES (34385077, 100);
INSERT INTO `sys_user_role` VALUES (34532930, 100);
INSERT INTO `sys_user_role` VALUES (34615496, 100);
INSERT INTO `sys_user_role` VALUES (35390314, 100);
INSERT INTO `sys_user_role` VALUES (35979444, 100);
INSERT INTO `sys_user_role` VALUES (36312541, 100);
INSERT INTO `sys_user_role` VALUES (37367576, 100);
INSERT INTO `sys_user_role` VALUES (38930007, 100);
INSERT INTO `sys_user_role` VALUES (39247618, 100);
INSERT INTO `sys_user_role` VALUES (39449157, 100);
INSERT INTO `sys_user_role` VALUES (40288386, 100);
INSERT INTO `sys_user_role` VALUES (40546882, 100);
INSERT INTO `sys_user_role` VALUES (41696054, 100);
INSERT INTO `sys_user_role` VALUES (41796459, 100);
INSERT INTO `sys_user_role` VALUES (43327618, 100);
INSERT INTO `sys_user_role` VALUES (44967351, 100);
INSERT INTO `sys_user_role` VALUES (46079310, 100);
INSERT INTO `sys_user_role` VALUES (46160734, 100);
INSERT INTO `sys_user_role` VALUES (46494071, 100);
INSERT INTO `sys_user_role` VALUES (46573540, 100);
INSERT INTO `sys_user_role` VALUES (47529373, 100);
INSERT INTO `sys_user_role` VALUES (47867461, 100);
INSERT INTO `sys_user_role` VALUES (48413974, 100);
INSERT INTO `sys_user_role` VALUES (48855368, 100);
INSERT INTO `sys_user_role` VALUES (50754534, 100);
INSERT INTO `sys_user_role` VALUES (51009835, 100);
INSERT INTO `sys_user_role` VALUES (52372365, 100);
INSERT INTO `sys_user_role` VALUES (52921408, 100);
INSERT INTO `sys_user_role` VALUES (53141621, 100);
INSERT INTO `sys_user_role` VALUES (54133590, 100);
INSERT INTO `sys_user_role` VALUES (54974544, 100);
INSERT INTO `sys_user_role` VALUES (55241061, 100);
INSERT INTO `sys_user_role` VALUES (56180260, 100);
INSERT INTO `sys_user_role` VALUES (56514922, 100);
INSERT INTO `sys_user_role` VALUES (57353425, 100);
INSERT INTO `sys_user_role` VALUES (57404657, 100);
INSERT INTO `sys_user_role` VALUES (57516039, 100);
INSERT INTO `sys_user_role` VALUES (57845728, 100);
INSERT INTO `sys_user_role` VALUES (58625953, 100);
INSERT INTO `sys_user_role` VALUES (60089312, 100);
INSERT INTO `sys_user_role` VALUES (61927552, 100);
INSERT INTO `sys_user_role` VALUES (61983195, 100);
INSERT INTO `sys_user_role` VALUES (62669538, 100);
INSERT INTO `sys_user_role` VALUES (64512565, 100);
INSERT INTO `sys_user_role` VALUES (64771866, 100);
INSERT INTO `sys_user_role` VALUES (65669036, 100);
INSERT INTO `sys_user_role` VALUES (66498413, 100);
INSERT INTO `sys_user_role` VALUES (67418410, 100);
INSERT INTO `sys_user_role` VALUES (68135231, 100);
INSERT INTO `sys_user_role` VALUES (68430192, 100);
INSERT INTO `sys_user_role` VALUES (69413460, 100);
INSERT INTO `sys_user_role` VALUES (69897143, 100);
INSERT INTO `sys_user_role` VALUES (70004430, 100);
INSERT INTO `sys_user_role` VALUES (70195151, 100);
INSERT INTO `sys_user_role` VALUES (70305853, 100);
INSERT INTO `sys_user_role` VALUES (70632774, 100);
INSERT INTO `sys_user_role` VALUES (70746323, 100);
INSERT INTO `sys_user_role` VALUES (71078070, 100);
INSERT INTO `sys_user_role` VALUES (71671622, 100);
INSERT INTO `sys_user_role` VALUES (72603778, 100);
INSERT INTO `sys_user_role` VALUES (73925439, 100);
INSERT INTO `sys_user_role` VALUES (73983944, 100);
INSERT INTO `sys_user_role` VALUES (74703959, 100);
INSERT INTO `sys_user_role` VALUES (74741150, 100);
INSERT INTO `sys_user_role` VALUES (74884313, 100);
INSERT INTO `sys_user_role` VALUES (75127146, 100);
INSERT INTO `sys_user_role` VALUES (75479404, 100);
INSERT INTO `sys_user_role` VALUES (76324172, 100);
INSERT INTO `sys_user_role` VALUES (76529911, 100);
INSERT INTO `sys_user_role` VALUES (76712685, 100);
INSERT INTO `sys_user_role` VALUES (77432322, 100);
INSERT INTO `sys_user_role` VALUES (77832257, 100);
INSERT INTO `sys_user_role` VALUES (78089028, 100);
INSERT INTO `sys_user_role` VALUES (78618234, 100);
INSERT INTO `sys_user_role` VALUES (78619302, 100);
INSERT INTO `sys_user_role` VALUES (79260743, 100);
INSERT INTO `sys_user_role` VALUES (79520505, 100);
INSERT INTO `sys_user_role` VALUES (80483359, 100);
INSERT INTO `sys_user_role` VALUES (80663518, 100);
INSERT INTO `sys_user_role` VALUES (80841877, 100);
INSERT INTO `sys_user_role` VALUES (81284889, 100);
INSERT INTO `sys_user_role` VALUES (81842162, 100);
INSERT INTO `sys_user_role` VALUES (82446964, 100);
INSERT INTO `sys_user_role` VALUES (82575303, 100);
INSERT INTO `sys_user_role` VALUES (82791768, 100);
INSERT INTO `sys_user_role` VALUES (83344817, 100);
INSERT INTO `sys_user_role` VALUES (84395738, 100);
INSERT INTO `sys_user_role` VALUES (85490122, 100);
INSERT INTO `sys_user_role` VALUES (85720734, 100);
INSERT INTO `sys_user_role` VALUES (86323976, 100);
INSERT INTO `sys_user_role` VALUES (86880776, 100);
INSERT INTO `sys_user_role` VALUES (87639440, 100);
INSERT INTO `sys_user_role` VALUES (88413887, 100);
INSERT INTO `sys_user_role` VALUES (90440841, 100);
INSERT INTO `sys_user_role` VALUES (90787616, 100);
INSERT INTO `sys_user_role` VALUES (90854599, 100);
INSERT INTO `sys_user_role` VALUES (91161667, 100);
INSERT INTO `sys_user_role` VALUES (91197802, 100);
INSERT INTO `sys_user_role` VALUES (92435019, 100);
INSERT INTO `sys_user_role` VALUES (92614677, 100);
INSERT INTO `sys_user_role` VALUES (93791211, 100);
INSERT INTO `sys_user_role` VALUES (93961187, 100);
INSERT INTO `sys_user_role` VALUES (94095291, 100);
INSERT INTO `sys_user_role` VALUES (95350141, 100);
INSERT INTO `sys_user_role` VALUES (96577697, 100);
INSERT INTO `sys_user_role` VALUES (96830032, 100);
INSERT INTO `sys_user_role` VALUES (97135574, 100);
INSERT INTO `sys_user_role` VALUES (97557511, 100);
INSERT INTO `sys_user_role` VALUES (98909663, 100);
INSERT INTO `sys_user_role` VALUES (99213668, 100);
INSERT INTO `sys_user_role` VALUES (99729325, 100);

-- ----------------------------
-- Table structure for tea_info
-- ----------------------------
DROP TABLE IF EXISTS `tea_info`;
CREATE TABLE `tea_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师姓名',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_name`(`name` ASC) USING BTREE,
  INDEX `fl_type`(`type` ASC) USING BTREE,
  CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fl_type` FOREIGN KEY (`type`) REFERENCES `sys_role` (`role_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tea_info
-- ----------------------------
INSERT INTO `tea_info` VALUES (2, 'lan', '教务老师');
INSERT INTO `tea_info` VALUES (3, 'Anna', '教务老师');
INSERT INTO `tea_info` VALUES (4, 'James', '班主任');
INSERT INTO `tea_info` VALUES (5, 'Poul', '班主任');
INSERT INTO `tea_info` VALUES (6, 'John', '班主任');
INSERT INTO `tea_info` VALUES (7, 'Alice', '班主任');
INSERT INTO `tea_info` VALUES (8, 'Mary', '班主任');
INSERT INTO `tea_info` VALUES (9, 'David', '班主任');
INSERT INTO `tea_info` VALUES (10, 'Michael', '班主任');
INSERT INTO `tea_info` VALUES (11, 'Emily', '班主任');
INSERT INTO `tea_info` VALUES (12, 'Robert', '班主任');
INSERT INTO `tea_info` VALUES (13, 'Jessica', '班主任');
INSERT INTO `tea_info` VALUES (14, 'Daniel', '班主任');
INSERT INTO `tea_info` VALUES (15, 'Sarah', '班主任');
INSERT INTO `tea_info` VALUES (16, 'Matthew', '班主任');
INSERT INTO `tea_info` VALUES (17, 'Jennifer', '班主任');
INSERT INTO `tea_info` VALUES (18, 'Christopher', '班主任');
INSERT INTO `tea_info` VALUES (19, 'Elizabeth', '班主任');
INSERT INTO `tea_info` VALUES (20, 'Joshua', '班主任');
INSERT INTO `tea_info` VALUES (21, 'Linda', '班主任');
INSERT INTO `tea_info` VALUES (22, 'Andrew', '班主任');
INSERT INTO `tea_info` VALUES (23, 'Karen', '班主任');
INSERT INTO `tea_info` VALUES (24, 'Kevin', '班主任');
INSERT INTO `tea_info` VALUES (25, 'Nancy', '班主任');
INSERT INTO `tea_info` VALUES (26, 'Brian', '班主任');
INSERT INTO `tea_info` VALUES (27, 'Lisa', '班主任');
INSERT INTO `tea_info` VALUES (28, 'Mark', '班主任');
INSERT INTO `tea_info` VALUES (29, 'Betty', '班主任');
INSERT INTO `tea_info` VALUES (30, 'Paul', '班主任');
INSERT INTO `tea_info` VALUES (31, 'Margaret', '班主任');
INSERT INTO `tea_info` VALUES (32, 'Donald', '班主任');
INSERT INTO `tea_info` VALUES (33, 'Sandra', '班主任');
INSERT INTO `tea_info` VALUES (34, 'George', '班主任');
INSERT INTO `tea_info` VALUES (35, 'Ashley', '班主任');
INSERT INTO `tea_info` VALUES (36, 'Kenneth', '班主任');
INSERT INTO `tea_info` VALUES (37, 'Susan', '班主任');
INSERT INTO `tea_info` VALUES (38, 'Steven', '班主任');
INSERT INTO `tea_info` VALUES (39, 'Dorothy', '班主任');
INSERT INTO `tea_info` VALUES (40, 'Edward', '班主任');
INSERT INTO `tea_info` VALUES (41, 'Jessica', '班主任');
INSERT INTO `tea_info` VALUES (42, 'Ronald', '班主任');
INSERT INTO `tea_info` VALUES (43, 'Kimberly', '班主任');
INSERT INTO `tea_info` VALUES (44, 'Anthony', '班主任');
INSERT INTO `tea_info` VALUES (45, 'Donna', '班主任');
INSERT INTO `tea_info` VALUES (46, 'Emily', '班主任');
INSERT INTO `tea_info` VALUES (47, 'Charles', '班主任');
INSERT INTO `tea_info` VALUES (48, 'Amanda', '班主任');
INSERT INTO `tea_info` VALUES (49, 'Patrick', '班主任');
INSERT INTO `tea_info` VALUES (50, 'Helen', '班主任');
INSERT INTO `tea_info` VALUES (51, 'Stephen', '班主任');
INSERT INTO `tea_info` VALUES (52, 'Megan', '班主任');
INSERT INTO `tea_info` VALUES (53, 'Timothy', '班主任');
INSERT INTO `tea_info` VALUES (54, 'Rebecca', '班主任');
INSERT INTO `tea_info` VALUES (55, 'Larry', '班主任');
INSERT INTO `tea_info` VALUES (56, 'Laura', '班主任');
INSERT INTO `tea_info` VALUES (57, 'Justin', '班主任');
INSERT INTO `tea_info` VALUES (58, 'Teresa', '班主任');
INSERT INTO `tea_info` VALUES (59, 'Brenda', '班主任');
INSERT INTO `tea_info` VALUES (60, 'Frank', '班主任');
INSERT INTO `tea_info` VALUES (61, 'Pamela', '班主任');
INSERT INTO `tea_info` VALUES (62, 'Brandon', '班主任');
INSERT INTO `tea_info` VALUES (63, 'Angela', '班主任');
INSERT INTO `tea_info` VALUES (64, 'Scott', '班主任');
INSERT INTO `tea_info` VALUES (65, 'Sharon', '班主任');
INSERT INTO `tea_info` VALUES (66, 'Benjamin', '班主任');
INSERT INTO `tea_info` VALUES (67, 'Kathleen', '班主任');
INSERT INTO `tea_info` VALUES (68, 'Gregory', '班主任');
INSERT INTO `tea_info` VALUES (69, 'Deborah', '班主任');
INSERT INTO `tea_info` VALUES (70, 'Raymond', '班主任');
INSERT INTO `tea_info` VALUES (71, 'Amy', '班主任');
INSERT INTO `tea_info` VALUES (72, 'Patrick', '班主任');
INSERT INTO `tea_info` VALUES (73, 'Martha', '班主任');
INSERT INTO `tea_info` VALUES (74, 'Alexander', '班主任');
INSERT INTO `tea_info` VALUES (75, 'Carol', '班主任');
INSERT INTO `tea_info` VALUES (76, 'Gerald', '班主任');
INSERT INTO `tea_info` VALUES (77, 'Christine', '班主任');
INSERT INTO `tea_info` VALUES (78, 'Samuel', '班主任');
INSERT INTO `tea_info` VALUES (79, 'Janet', '班主任');
INSERT INTO `tea_info` VALUES (80, 'Dennis', '班主任');
INSERT INTO `tea_info` VALUES (81, 'Marie', '班主任');
INSERT INTO `tea_info` VALUES (82, 'Jerry', '班主任');
INSERT INTO `tea_info` VALUES (83, 'Jacqueline', '班主任');
INSERT INTO `tea_info` VALUES (84, 'Henry', '班主任');
INSERT INTO `tea_info` VALUES (85, 'Ruth', '班主任');
INSERT INTO `tea_info` VALUES (86, 'Douglas', '班主任');
INSERT INTO `tea_info` VALUES (87, 'Victoria', '班主任');
INSERT INTO `tea_info` VALUES (88, 'Arthur', '班主任');
INSERT INTO `tea_info` VALUES (89, 'Judith', '班主任');
INSERT INTO `tea_info` VALUES (90, 'Wayne', '班主任');
INSERT INTO `tea_info` VALUES (91, 'Rose', '班主任');
INSERT INTO `tea_info` VALUES (92, 'Joe', '班主任');
INSERT INTO `tea_info` VALUES (93, 'Evelyn', '班主任');
INSERT INTO `tea_info` VALUES (94, 'Roy', '班主任');
INSERT INTO `tea_info` VALUES (95, 'Joan', '班主任');
INSERT INTO `tea_info` VALUES (96, 'Willie', '班主任');
INSERT INTO `tea_info` VALUES (97, 'Jean', '班主任');
INSERT INTO `tea_info` VALUES (98, 'Johnny', '班主任');
INSERT INTO `tea_info` VALUES (99, 'Theresa', '班主任');
INSERT INTO `tea_info` VALUES (100, 'Clarence', '班主任');
INSERT INTO `tea_info` VALUES (101, 'Gloria', '班主任');
INSERT INTO `tea_info` VALUES (102, 'Martin', '班主任');
INSERT INTO `tea_info` VALUES (103, 'Martha', '班主任');
INSERT INTO `tea_info` VALUES (104, 'Billy', '班主任');
INSERT INTO `tea_info` VALUES (105, 'Annie', '班主任');
INSERT INTO `tea_info` VALUES (106, 'Frederick', '班主任');
INSERT INTO `tea_info` VALUES (107, 'Eleanor', '班主任');
INSERT INTO `tea_info` VALUES (108, 'Eugene', '班主任');
INSERT INTO `tea_info` VALUES (109, 'Grace', '班主任');
INSERT INTO `tea_info` VALUES (110, 'Wayne', '班主任');
INSERT INTO `tea_info` VALUES (111, 'Ruby', '班主任');
INSERT INTO `tea_info` VALUES (112, 'Lewis', '班主任');
INSERT INTO `tea_info` VALUES (113, 'Florence', '班主任');
INSERT INTO `tea_info` VALUES (114, 'Russell', '班主任');
INSERT INTO `tea_info` VALUES (115, 'Norma', '班主任');
INSERT INTO `tea_info` VALUES (116, 'Andy', '教师');
INSERT INTO `tea_info` VALUES (117, 'Alex', '教师');
INSERT INTO `tea_info` VALUES (118, 'Ben', '教师');
INSERT INTO `tea_info` VALUES (119, 'Chris', '教师');
INSERT INTO `tea_info` VALUES (120, 'Daniel', '教师');
INSERT INTO `tea_info` VALUES (121, 'Eva', '教师');
INSERT INTO `tea_info` VALUES (122, 'Frank', '教师');
INSERT INTO `tea_info` VALUES (123, 'George', '教师');
INSERT INTO `tea_info` VALUES (124, 'Hank', '教师');
INSERT INTO `tea_info` VALUES (125, 'iPhone', '教师');
INSERT INTO `tea_info` VALUES (126, 'Jack', '教师');
INSERT INTO `tea_info` VALUES (127, 'Kevin', '教师');
INSERT INTO `tea_info` VALUES (128, 'Mark', '教师');
INSERT INTO `tea_info` VALUES (129, 'Nick', '教师');
INSERT INTO `tea_info` VALUES (130, 'Oliver', '教师');
INSERT INTO `tea_info` VALUES (131, 'Peter', '教师');
INSERT INTO `tea_info` VALUES (132, 'Randy', '教师');
INSERT INTO `tea_info` VALUES (133, 'Sam', '教师');
INSERT INTO `tea_info` VALUES (134, 'Tim', '教师');
INSERT INTO `tea_info` VALUES (135, 'Willian', '教师');
INSERT INTO `tea_info` VALUES (136, 'Luv', '教师');
INSERT INTO `tea_info` VALUES (137, 'Doja', '教师');
INSERT INTO `tea_info` VALUES (138, 'Tasa', '教师');
INSERT INTO `tea_info` VALUES (139, 'Hammer', '教师');
INSERT INTO `tea_info` VALUES (140, 'Joey', '教师');
INSERT INTO `tea_info` VALUES (141, 'Kerry', '教师');
INSERT INTO `tea_info` VALUES (142, 'Quare', '教师');
INSERT INTO `tea_info` VALUES (143, 'Perk', '教师');
INSERT INTO `tea_info` VALUES (144, 'Smith', '教师');
INSERT INTO `tea_info` VALUES (145, 'Johnson', '教师');
INSERT INTO `tea_info` VALUES (146, 'Williams', '教师');
INSERT INTO `tea_info` VALUES (147, 'Brown', '教师');
INSERT INTO `tea_info` VALUES (148, 'Ava', '教师');
INSERT INTO `tea_info` VALUES (149, 'Davis', '教师');
INSERT INTO `tea_info` VALUES (150, 'Miller', '教师');
INSERT INTO `tea_info` VALUES (151, 'Smith', '教师');
INSERT INTO `tea_info` VALUES (152, 'Johnson', '教师');
INSERT INTO `tea_info` VALUES (153, 'Williams', '教师');
INSERT INTO `tea_info` VALUES (154, 'Jones', '教师');
INSERT INTO `tea_info` VALUES (155, 'Brown', '教师');
INSERT INTO `tea_info` VALUES (156, 'Davis', '教师');
INSERT INTO `tea_info` VALUES (157, 'Miller', '教师');
INSERT INTO `tea_info` VALUES (158, 'Wilson', '教师');
INSERT INTO `tea_info` VALUES (159, 'Moore', '教师');
INSERT INTO `tea_info` VALUES (160, 'Taylor', '教师');
INSERT INTO `tea_info` VALUES (161, 'Anderson', '教师');
INSERT INTO `tea_info` VALUES (162, 'Thomas', '教师');
INSERT INTO `tea_info` VALUES (163, 'Jackson', '教师');
INSERT INTO `tea_info` VALUES (164, 'White', '教师');
INSERT INTO `tea_info` VALUES (165, 'Harris', '教师');
INSERT INTO `tea_info` VALUES (166, 'Martin', '教师');
INSERT INTO `tea_info` VALUES (167, 'Thompson', '教师');
INSERT INTO `tea_info` VALUES (168, 'Garcia', '教师');
INSERT INTO `tea_info` VALUES (169, 'Martinez', '教师');
INSERT INTO `tea_info` VALUES (170, 'Robinson', '教师');
INSERT INTO `tea_info` VALUES (171, 'Clark', '教师');
INSERT INTO `tea_info` VALUES (172, 'Rodriguez', '教师');
INSERT INTO `tea_info` VALUES (173, 'Lewis', '教师');
INSERT INTO `tea_info` VALUES (174, 'Lee', '教师');
INSERT INTO `tea_info` VALUES (175, 'Walker', '教师');
INSERT INTO `tea_info` VALUES (176, 'Hall', '教师');

SET FOREIGN_KEY_CHECKS = 1;
