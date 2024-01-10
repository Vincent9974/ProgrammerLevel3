/*创建LibraryDB数据库*/
/*(1)*/
create database LibraryDB;
/*创建LibraryDB数据库的表*/
/*(2)*/
use librarydb;
 CREATE TABLE 读者表  (
  读者编号 char(6) NOT NULL  PRIMARY KEY,
  姓名 char(10) NOT NULL,
  类别号 char(2) NOT NULL,
  单位 varchar(20) NULL,
  有效性 char(10) NULL
 );
CREATE TABLE 读者类型表  (
  类别号 char(2) NOT NULL PRIMARY KEY ,
  类名 char(10) NOT NULL,
  可借数量 int NULL,
  可借天数 int NULL
 );
 CREATE TABLE 库存表  (
  条码 char(20) NOT NULL  PRIMARY KEY,
  书号 char(10) NOT NULL,
  位置 varchar(20) NOT NULL,
  库存状态 char(10) NULL 
);
 CREATE TABLE 借阅表  (
  借阅号 int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  条码 char(20) NOT NULL,
  读者编号 char(6) NOT NULL,
  借阅日期 date NULL,
  还书日期 date NULL,
  借阅状态 char(6) NULL  
);
CREATE TABLE 图书表  (
  书号 char(10) NOT NULL  PRIMARY KEY , 
  书名 varchar(20) NOT NULL,
  类别 char(10) NOT NULL,
  作者 varchar(20) NOT NULL,
  出版社 varchar(20) NOT NULL,
  单价 float(5, 2) NULL,
  数量 int NULL
);
/*  LibraryDB数据录入*/
/*1*/
-- ----------------------------
-- Records of 借阅表
-- ----------------------------
INSERT INTO `借阅表` VALUES (100001, '123413', '0001', '2020-11-05', NULL, '借阅');
INSERT INTO `借阅表` VALUES (100002, '223411', '0002', '2020-09-28', '2020-10-13', '已还');
INSERT INTO `借阅表` VALUES (100003, '321123', '1001', '2020-07-01', NULL, '过期');
INSERT INTO `借阅表` VALUES (100004, '321124', '2001', '2020-10-09', '2020-10-14', '已还');
INSERT INTO `借阅表` VALUES (100005, '321124', '0001', '2020-10-15', NULL, '借阅');
INSERT INTO `借阅表` VALUES (100006, '223411', '2001', '2020-10-16', NULL, '借阅');
INSERT INTO `借阅表` VALUES (100007, '411111', '1002', '2020-09-01', '2020-09-24', '已还');
INSERT INTO `借阅表` VALUES (100008, '411111', '0001', '2020-09-25', NULL, '借阅');
INSERT INTO `借阅表` VALUES (100009, '411111', '1001', '2020-10-08', NULL, '借阅');
-- ----------------------------
-- Records of 图书表
-- ----------------------------
INSERT INTO `图书表` VALUES ('A0120', '庄子', '文学', '庄周', '吉林大学出版社', 18.50, 5);
INSERT INTO `图书表` VALUES ('A0134', '唐诗三百首', '文学', '李平', '安徽科学出版社', 28.00, 10);
INSERT INTO `图书表` VALUES ('B1101', '西方经济学史', '财经', '莫竹芩', '海南出版社', 39.80, 8);
INSERT INTO `图书表` VALUES ('B2213', '商业博弈', '财经', '孔英', '北京大学出版社', 39.00, 15);
INSERT INTO `图书表` VALUES ('C1269', '数据结构', '计算机', '李刚', '高等教育出版社', 29.00, 20);
INSERT INTO `图书表` VALUES ('C3121', '品牌策划与推广', '计算机', '张晓红', '人民邮电出版社', 42.00, 6);
INSERT INTO `图书表` VALUES ('C3182', 'C语言程序设计', '计算机', '李学刚', '高等教育出版社', 36.80, 11);
INSERT INTO `图书表` VALUES ('C3256', 'MySQL数据库', '计算机', '孙季红', '电子工业出版社', 29.00, 9);
-- ----------------------------
-- Records of 库存表
-- ----------------------------
INSERT INTO `库存表` VALUES ('123412', 'A0120', '1-A-56', '在馆');
INSERT INTO `库存表` VALUES ('123413', 'A0120', '1-A-57', '借出');
INSERT INTO `库存表` VALUES ('223410', 'A0134', '2-B-01', '在馆');
INSERT INTO `库存表` VALUES ('223411', 'A0134', '2-B-02', '借出');
INSERT INTO `库存表` VALUES ('311231', 'B1101', '2-C-23', '在馆');
INSERT INTO `库存表` VALUES ('321123', 'C1269', '3-A-12', '丢失');
INSERT INTO `库存表` VALUES ('321124', 'C1269', '3-A-13', '借出');
INSERT INTO `库存表` VALUES ('411111', 'C3256', '3-B-01', '借出');
INSERT INTO `库存表` VALUES ('411112', 'C3256', '3-B-02', '借出');
INSERT INTO `库存表` VALUES ('411113', 'C3256', '3-B-03', '在馆');
-- ----------------------------
-- Records of 读者类型表
-- ----------------------------
INSERT INTO `读者类型表` VALUES ('1', '学生', 10, 30);
INSERT INTO `读者类型表` VALUES ('2', '教师', 20, 60);
INSERT INTO `读者类型表` VALUES ('3', '职工', 15, 20);
-- ----------------------------
-- Records of 读者表
-- ----------------------------
INSERT INTO `读者表` VALUES ('0001', '张小东', '1', '软件学院', '有效');
INSERT INTO `读者表` VALUES ('0002', '苏明', '1', '财经学院', '有效');
INSERT INTO `读者表` VALUES ('1001', '梁小红', '2', '软件学院', '有效');
INSERT INTO `读者表` VALUES ('1002', '赵明敏', '2', '传媒学院', '有效');
INSERT INTO `读者表` VALUES ('2001', '李丰年', '3', '计财处', '有效');