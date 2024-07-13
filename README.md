## 项目介绍

该项目为教学管理平台（成绩查询系统（项目4））旨在为学院学生、教师以及教务老师等角色提供多种功能例如

1、成绩信息查询；

2、导入学生成绩单及各班级名单；

3、生成数据分析的可视化界面；

4、提供学生查询成绩排名；

5、班主任查询班级学生学业情况；

6、管理员查询管理全院学业信息等功能。



### 面向角色



1. 学院本科教务老师（管理员，全部权限）

2. 学院各班班主任以及教师（子管理员，按班级或课程划分权限）

3. 全学院学生（信息查询权限）不同的角色会有不同的权限以及不同的菜单。

   但是多种角色使用统一的登录界面，无需切换其他网页

   

   重要的功能如下：

   1. 学生：可查询每门课程分数绩点及排名，各学期排名可视化界面，学业预警（挂科提醒）等；
   2. 老师：班主任可查询本班成员成绩情况的权限，各班级数据的对比情况，挂科学生名单推送提醒班主任等。所有的老师都会显示各自所教的课程的学生的成绩详情；
   3.  教务老师：可以查看所有成绩信息，以及其他多种信息；
   4. 4数据分析：可视化界面，提供数据查询、筛选、聚合分析（平均分，优秀率，良好率，挂科率等）等功能；
   5.  排名：数据分不同学期、不同年级和班级显示，教务老师可直接导出排名名单。





## 项目架构

依托若依开发教学管理系统

* 前端采用Vue、Element UI。
* 后端采用Spring Boot、Spring Security、Redis & Jwt。



#### 运行环境要求

JDK >= 1.8 (推荐1.8版本)
Mysql >= 5.7.0 (推荐5.7版本)
Maven >= 3.0
node >= 12.0
Redis >= 5







## 项目运行

后端: 运行ruoyi-admin/src/main/java/com/ruoyi/RuoYiApplication.java

数据库：首先需要创建一个tm_db数据库，并在数据库中运行\grade_inquiry_system目录下面的tm_db.sql文件。接着运行redis以及相关的数据库即可。

前端:新建页面打开 ruoyi-ui，接着运行 npm run dev。即可出现登录界面。
