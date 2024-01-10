-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: oaec
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `amz_comment`
--

DROP TABLE IF EXISTS `amz_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reply` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nick_name` varchar(50) NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_comment`
--

LOCK TABLES `amz_comment` WRITE;
/*!40000 ALTER TABLE `amz_comment` DISABLE KEYS */;
INSERT INTO `amz_comment` VALUES (1,'最新酷睿笔记本','i7超强配置，赶快下手啦!','2012-08-03 12:56:57','2012-08-03 12:56:57','天天',NULL),(2,'团购无忧','团购上拉手拉手上团购','2012-08-03 12:56:57','2012-08-03 12:56:57','拉手',NULL),(3,'会员特惠月开始','积分大返利，机不可失失不再来!','2012-08-03 12:56:57','2012-08-03 12:56:57','会员',NULL),(4,'加入会员，赢千万大礼包','我是会员我快乐啦啦啦啦啦','2012-09-03 08:49:14','2012-09-03 08:49:14','我是神',NULL),(5,'赢双旦促销大酬宾','元旦圣诞超级大礼包等你拿啦','2012-09-03 08:50:17','2012-09-03 08:50:17','双蛋',NULL),(6,'新年不夜夏，通宵也是开张啦','新年不夜夏，通宵也是开张啦','2012-09-03 08:53:11','2012-09-03 08:53:11','新年',NULL),(7,'积分兑换开始了','积分兑换开始了积分兑换开始了积分兑换开始了','2012-09-03 08:53:11','2012-09-03 08:55:50','兑换',NULL),(8,'配货通知','开始配货开始配货开始配货开始配货!','2012-10-03 08:54:11','2012-10-03 08:56:50','配货','配送在途中'),(9,'团购阿迪1折起','团购阿迪1折起团购阿迪1折起团购阿迪1折起！','2012-10-03 08:54:11','2012-10-03 08:56:50','团购',NULL),(10,'方便','阿什顿','2012-10-03 01:22:04','2013-02-03 01:22:04','飞飞',NULL),(16,'asda','66666666666','2018-07-29 15:33:05','2018-07-29 15:33:05','21312',NULL),(17,'撒旦法','反反复复付','2018-07-29 15:35:32','2018-07-29 15:35:32','234124',NULL),(18,'asdasd','asdasd','2023-04-03 01:49:01','2023-04-03 01:49:01','sadas',NULL);
/*!40000 ALTER TABLE `amz_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_news`
--

DROP TABLE IF EXISTS `amz_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_news` (
  `id` bigint NOT NULL,
  `title` varchar(80) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_news`
--

LOCK TABLES `amz_news` WRITE;
/*!40000 ALTER TABLE `amz_news` DISABLE KEYS */;
INSERT INTO `amz_news` VALUES (1,'会员特惠月开始','积分大返利，机不可失失不再来!','2012-08-03 20:56:50'),(2,'加入会员，赢千万大礼包','我是会员我快乐啦啦啦啦啦','2012-08-22 20:56:52'),(3,'积分兑换开始了','积分兑换开始了积分兑换开始了积分兑换开始了','2012-08-08 20:56:52'),(4,'配货通知','开始配货开始配货开始配货开始配货!','2012-08-18 20:56:52'),(5,'团购阿迪1折起','团购阿迪1折起团购阿迪1折起团购阿迪1折起！','2012-08-01 20:56:52'),(6,'汇源果汁大甩卖','甩卖甩卖甩卖甩卖甩卖甩卖','2012-08-30 20:56:52'),(7,'苹果手机不要钱','不要不要钱不要钱不要钱不要钱','2012-08-29 20:56:52');
/*!40000 ALTER TABLE `amz_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_order`
--

DROP TABLE IF EXISTS `amz_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `uname` varchar(30) NOT NULL,
  `uaddress` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `money` decimal(10,2) NOT NULL,
  `status` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_order`
--

LOCK TABLES `amz_order` WRITE;
/*!40000 ALTER TABLE `amz_order` DISABLE KEYS */;
INSERT INTO `amz_order` VALUES (1,1,'朱琦','重庆','2012-03-19 03:18:52',100.00,1,1),(2,1,'朱琦','重庆','2012-03-20 15:25:31',22191.00,1,1),(3,1,'朱琦','重庆','2012-03-19 03:18:53',100.00,1,1),(4,2,'朱琅','重庆','2012-03-19 03:18:53',1000.00,1,1),(5,3,'刁星辰','东北','2012-03-19 03:18:55',100.00,1,1),(6,2,'朱琅','重庆','2012-03-19 03:18:55',100.00,1,1),(7,3,'刁星辰','东北','2012-03-19 03:18:56',100.00,1,1),(8,4,'刘博','北京','2012-03-19 03:18:57',100.00,1,1),(9,4,'刘博','北京','2012-03-19 03:18:58',100.00,1,1),(10,5,'admin','上海','2012-03-19 03:18:59',100.00,1,1),(20,1,'chen','112312','2018-07-29 08:39:36',536.00,1,1),(21,1,'chen','112312','2018-07-29 08:39:36',792.00,1,1),(22,1,'chen','112312','2018-07-29 08:42:23',578.00,1,1),(23,1,'chen','112312','2018-07-29 08:58:16',186.00,1,1),(24,1,'chen','112312','2018-07-29 09:00:32',216.00,1,1),(25,1,'chen','112312','2018-07-29 09:04:44',69.00,1,1),(26,1,'chen','112312','2018-07-29 09:06:07',279.00,1,1),(27,1,'chen','112312','2018-07-29 09:21:35',8398.00,1,1),(28,1,'chen','112312','2018-07-29 09:21:35',398.00,1,1),(29,1,'chen','112312','2018-07-29 09:21:43',276.00,1,1),(30,1,'chen','112312','2018-07-29 09:27:20',536.00,1,1),(31,1,'chen','112312','2018-07-29 09:27:21',396.00,1,1),(32,1,'chen','112312','2018-07-29 09:28:09',578.00,1,1),(33,1,'chen','112312','2018-07-29 09:28:09',372.00,1,1),(34,1,'chen','112312','2018-07-29 09:33:34',198.00,1,1),(35,1,'chen','112312','2018-07-29 09:33:34',192.00,1,1),(36,1,'chen','112312','2018-07-29 09:43:24',299.00,1,1),(37,1,'chen','112312','2018-07-29 09:43:24',69.00,1,1),(38,1,'chen','112312','2018-07-29 11:09:49',69.00,1,1),(39,1,'chen','112312','2018-07-29 11:12:04',69.00,1,1),(40,1,'chen','112312','2023-04-04 05:52:42',69.00,1,1);
/*!40000 ALTER TABLE `amz_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_order_detail`
--

DROP TABLE IF EXISTS `amz_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oid` bigint NOT NULL,
  `pid` bigint NOT NULL,
  `quantity` bigint NOT NULL,
  `money` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_order_detail`
--

LOCK TABLES `amz_order_detail` WRITE;
/*!40000 ALTER TABLE `amz_order_detail` DISABLE KEYS */;
INSERT INTO `amz_order_detail` VALUES (1,1,1,28,3200.00),(2,2,3,2,200.00),(3,4,2,5,500.00),(4,20,3,2,536.00),(5,21,52,4,792.00),(6,22,1,2,578.00),(7,23,3,1,186.00),(8,24,2,2,216.00),(9,25,1,1,69.00),(10,26,1,1,279.00),(11,27,1,2,8398.00),(12,28,52,2,398.00),(13,29,1,4,276.00),(14,30,41,2,536.00),(15,31,1,2,396.00),(16,32,2,2,578.00),(17,33,52,2,372.00),(18,34,1,2,198.00),(19,35,3,2,192.00),(20,36,41,1,299.00),(21,37,1,1,69.00),(22,38,1,1,69.00),(23,39,1,1,69.00),(24,40,1,1,69.00);
/*!40000 ALTER TABLE `amz_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_product`
--

DROP TABLE IF EXISTS `amz_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` bigint NOT NULL,
  `major_id` bigint NOT NULL,
  `minor_id` bigint NOT NULL,
  `img_source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_product`
--

LOCK TABLES `amz_product` WRITE;
/*!40000 ALTER TABLE `amz_product` DISABLE KEYS */;
INSERT INTO `amz_product` VALUES (1,'乐扣普通型保鲜盒圣诞7件套','圣诞7件套',69.00,1998,2,7,'images/product/2.jpg'),(2,'欧珀莱均衡保湿四件套','均衡保湿四件套',279.00,50,2,8,'images/product/3.jpg'),(3,'联想笔记本电脑 高速独立显存','高速独立显存 I7处理器',4199.00,50,2,16,'images/product/4.jpg'),(4,'德菲丝巧克力','108.00',100.00,0,1,4,'images/product/1.jpg'),(5,'Genius925纯银施华洛世奇水晶吊坠','华洛世奇水晶吊坠',69.00,50,2,12,'images/product/6.jpg'),(6,'利仁2018M福满堂电饼铛 好用实惠','福满堂电饼铛 好用实惠',268.00,50,2,15,'images/product/7.jpg'),(7,'达派高档拉杆箱20寸 经典款式','高档拉杆箱20寸 经典款式',198.00,50,2,14,'images/product/8.jpg'),(8,'爱国者MP4 全屏触摸多格式播放 4G','全屏触摸多格式播放 4G',289.00,50,2,11,'images/product/0.jpg'),(9,'多美滋金装金盾3阶段幼儿配方奶粉','金盾3阶段幼儿配方奶粉',186.00,50,1,10,'images/product/10.jpg'),(10,'德菲丝巧克力','巧克力500g/盒',108.00,100,1,10,'images/product/1.jpg'),(11,'乐扣普通型保鲜盒圣诞7件套','圣诞7件套',69.00,2000,2,7,'images/product/2.jpg'),(12,'欧珀莱均衡保湿四件套','均衡保湿四件套',279.00,50,2,8,'images/product/3.jpg'),(13,'联想笔记本电脑 高速独立显存','高速独立显存 I7处理器',4199.00,50,2,16,'images/product/4.jpg'),(14,'上衣','红色上衣',199.00,100,2,19,'images/product/clothes2.jpg'),(15,'Genius925纯银施华洛世奇水晶吊坠','华洛世奇水晶吊坠',69.00,50,2,12,'images/product/6.jpg'),(16,'利仁2018M福满堂电饼铛 好用实惠','福满堂电饼铛 好用实惠',268.00,50,2,15,'images/product/7.jpg'),(17,'达派高档拉杆箱20寸 经典款式','高档拉杆箱20寸 经典款式',198.00,50,2,14,'images/product/8.jpg'),(18,'爱国者MP4 全屏触摸多格式播放 4G','全屏触摸多格式播放 4G',289.00,50,2,11,'images/product/0.jpg'),(19,'多美滋金装金盾3阶段幼儿配方奶粉','金盾3阶段幼儿配方奶粉',186.00,50,1,10,'images/product/10.jpg'),(20,'上衣','夹克',99.00,100,2,19,'images/product/clothes3.jpg'),(21,'上衣','粉色上衣',96.00,100,2,19,'images/product/clothes5.jpg'),(22,'上衣','灰色上衣',299.00,100,2,19,'images/product/clothes6.jpg'),(23,'上衣','红色上衣',199.00,100,2,19,'images/product/clothes7.jpg'),(24,'上衣','银色上衣',599.00,100,2,19,'images/product/clothes8.jpg'),(25,'上衣','蓝色上衣',399.00,100,2,19,'images/product/clothes9.jpg'),(26,'上衣','浅蓝色上衣',499.00,100,2,19,'images/product/clothes10.jpg'),(27,'上衣','白色上衣',68.00,100,2,19,'images/product/clothes4.jpg'),(28,'皮鞋','黑色皮鞋',299.00,100,21,14,'images/product/shoes1.jpg'),(29,'皮鞋','灰色皮鞋',299.00,100,21,14,'images/product/shoes2.jpg'),(30,'皮鞋','蓝色皮鞋',299.00,100,21,14,'images/product/shoes3.jpg'),(31,'皮鞋','灰色皮鞋',299.00,100,21,14,'images/product/shoes4.jpg'),(32,'皮鞋','棕色皮鞋',299.00,100,21,14,'images/product/shoes5.jpg'),(33,'皮鞋','黑色皮鞋',299.00,100,21,14,'images/product/shoes6.jpg'),(34,'皮鞋','黑色皮鞋',299.00,100,21,14,'images/product/shoes7.jpg'),(35,'皮鞋','黑色皮鞋',299.00,100,21,14,'images/product/shoes8.jpg'),(36,'皮鞋','黑色皮鞋',299.00,100,21,14,'images/product/shoes9.jpg'),(37,'皮鞋','黑色皮鞋',299.00,100,21,14,'images/product/shoes10.jpg'),(38,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass1.jpg'),(39,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass2.jpg'),(40,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass3.jpg'),(41,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass4.jpg'),(42,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass5.jpg'),(43,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass6.jpg'),(44,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass7.jpg'),(45,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass8.jpg'),(46,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass9.jpg'),(47,'眼镜','太阳镜',299.00,100,2,12,'images/product/sunglass10.jpg'),(48,'电视','彩电',1299.00,100,2,15,'images/product/television1.jpg'),(49,'电视','彩电',1299.00,100,2,15,'images/product/television2.jpg'),(50,'电视','彩电',2299.00,100,2,15,'images/product/television3.jpg'),(51,'电视','彩电',2299.00,100,2,15,'images/product/television4.jpg'),(52,'电视','彩电',3299.00,100,2,15,'images/product/television5.jpg'),(53,'电视','彩电',2299.00,100,2,15,'images/product/television6.jpg'),(54,'电视','彩电',4299.00,100,2,15,'images/product/television7.jpg'),(55,'电视','彩电',5299.00,100,2,15,'images/product/television8.jpg'),(56,'电视','彩电',2299.00,100,2,15,'images/product/television9.jpg'),(57,'电视','彩电',6299.00,100,2,15,'images/product/television10.jpg'),(58,'卡地亚','见证你的爱情',22122.00,100,2,13,'images/product/20.jpg'),(59,'卡地亚','见证你的爱情',22122.00,100,22,22,'images/product/20.jpg'),(60,'双色球','来吧',2.00,1000,2,20,'images/product/21.jpg'),(61,'变形金刚','大黄蜂',222.00,1000,21,17,'images/product/23.jpg'),(62,'GPS','导航仪',2222.00,1000,21,18,'images/product/24.jpg');
/*!40000 ALTER TABLE `amz_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_product_category`
--

DROP TABLE IF EXISTS `amz_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_product_category` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_product_category`
--

LOCK TABLES `amz_product_category` WRITE;
/*!40000 ALTER TABLE `amz_product_category` DISABLE KEYS */;
INSERT INTO `amz_product_category` VALUES (1,'图音',1),(2,'百货',2),(4,'音乐',1),(5,'运动健康',0),(7,'家居',2),(8,'美妆',22),(9,'母婴',2),(10,'食品',2),(11,'手机数码',2),(12,'家居首饰',2),(13,'手表饰品',2),(14,'鞋包',21),(15,'家电',2),(16,'电脑办公',2),(17,'玩具文具',21),(18,'汽车用品',21),(19,'服饰',2),(20,'彩票充值',2),(21,'品牌',21),(22,'团购',22),(23,'易买社区',23),(28,'qq',1);
/*!40000 ALTER TABLE `amz_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_shop_cart`
--

DROP TABLE IF EXISTS `amz_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_shop_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `pnum` int NOT NULL,
  `uid` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_shop_cart`
--

LOCK TABLES `amz_shop_cart` WRITE;
/*!40000 ALTER TABLE `amz_shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `amz_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amz_user`
--

DROP TABLE IF EXISTS `amz_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amz_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `sex` int NOT NULL,
  `birthday` date NOT NULL,
  `idcard` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(36) NOT NULL,
  `address` varchar(255) NOT NULL,
  `utype` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amz_user`
--

LOCK TABLES `amz_user` WRITE;
/*!40000 ALTER TABLE `amz_user` DISABLE KEYS */;
INSERT INTO `amz_user` VALUES (1,'chen','chen',0,'1990-12-10','421081199700000000','13986521231','123@asd.com','112312',0),(2,'朱琦','1234',0,'1989-07-02','500235198907026299','sa@sina.com','13011092066','重庆',1),(3,'朱琅','1234',1,'1988-07-02','500235198907026299','sa@sina.com','13011092066','重庆',1),(4,'刁星辰','1234',1,'1990-02-09','123123123123123','web@sohu.com','12312312312','东北',1),(5,'刘博','1234',0,'1989-02-07','500235198907026299','sa@sina.com','13011092066','北京',1),(6,'admin','1234',0,'1989-07-02','12345678912345612X','sa@sina.com','13011092066','上海',1);
/*!40000 ALTER TABLE `amz_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 16:31:19
