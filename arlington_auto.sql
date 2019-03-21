-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: car_rental_app
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `capacity` tinyint(1) NOT NULL,
  `weekday_rate` decimal(13,2) NOT NULL,
  `weekend_rate` decimal(13,2) NOT NULL,
  `weekly_rate` decimal(13,2) NOT NULL,
  `daily_gps` decimal(13,2) NOT NULL,
  `daily_onstar` decimal(13,2) NOT NULL,
  `daily_sirius` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idname_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'Smart',1,100.00,120.00,150.00,12.00,15.00,20.00),(2,'Bomart',3,200.00,220.00,250.00,15.00,15.00,20.00),(3,'Ultron',5,10.00,20.00,100.00,1.00,2.00,3.00),(4,'Bus',7,130.00,320.00,1150.00,32.00,15.00,20.00),(5,'Test',6,125.75,68.99,100.00,2.50,2.50,8.00),(6,'Economy',3,39.99,44.99,279.93,3.00,5.00,7.00);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name_on_card` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Allow null, if null then the name on card is user.first + â€˜ â€˜ +user.last, therefore on web page add check box â€œuse same name as person making reservationâ€',
  `card_number` char(16) COLLATE utf8_bin NOT NULL,
  `card_expires` date NOT NULL,
  `card_security_code` char(3) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'Arunika Oyshi','1234567890987654','2018-12-31','123'),(2,2,'Anindita Arpa','1234567890987654','2018-09-30','333'),(3,1,'Arsad','2132435645645646','2018-11-11','123'),(4,1,'sadsad','2132432432423423','2018-11-11','423'),(5,1,'sdsdf','2131231232131231','2018-12-31','123'),(6,1,'sad','1234556787988008','2018-12-31','344'),(7,1,'Rose Choi','2314567756765765','2018-11-30','123'),(8,6,'some dude','1111111111111111','2018-12-31','123'),(9,6,'abc','1111111111111111','2018-11-30','123'),(10,6,'Evil Hacker','3333333333333333','2018-10-31','666'),(11,6,'Testing testing','1234123412341234','2018-12-31','123'),(12,6,'sdfsd','2323423423423423','2019-01-31','123'),(13,6,'John','1001397222100139','2020-01-31','123'),(14,6,'sdfsd','2323423423423423','2019-01-31','123'),(15,6,'sdfsd','2323423423423423','2019-01-31','123'),(16,6,'sdfsd','2323423423423423','2019-01-31','123'),(17,6,'John','1001397222100139','2020-01-31','123'),(18,6,'John','1001397222100139','2020-01-31','123'),(19,6,'John','1001397222100139','2020-01-31','123'),(20,6,'Jane Doe','4321568745679032','2018-12-31','657'),(21,6,'Jane Doe','4321568745679032','2018-12-31','657'),(22,6,'Jane Doe','4321568745679032','2018-12-31','657'),(23,6,'Jane Doe','4321568745679032','2018-12-31','657'),(24,6,'John','1001397222100139','2020-01-31','123'),(25,6,'Jane Doe','4321568745679032','2018-12-31','657');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `hasgps` tinyint(1) NOT NULL DEFAULT '0',
  `hasonstar` tinyint(1) NOT NULL DEFAULT '0',
  `hassirius` tinyint(1) NOT NULL DEFAULT '0',
  `iscanceled` tinyint(1) NOT NULL DEFAULT '0',
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `total_price` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_car_idx` (`car_id`),
  KEY `fk_payment_idx` (`payment_id`),
  CONSTRAINT `fk_car` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2018-09-05 08:00:00','2018-09-10 08:00:00',1,1,1,0,0,325.75),(2,2,2,'2018-09-09 08:00:00','2018-09-15 08:00:00',0,0,0,0,0,525.75),(3,3,2,'2018-09-02 08:00:00','2018-09-04 08:00:00',0,0,0,0,0,25.00),(4,3,2,'2018-10-10 00:00:00','2018-10-20 00:00:00',1,0,1,0,1,777.70),(5,1,2,'2018-10-01 00:00:00','2018-10-05 00:00:00',1,0,0,0,0,150.99),(7,2,3,'2018-09-16 00:00:00','2018-09-26 00:00:00',0,0,1,0,1,2000.00),(8,3,4,'2018-09-16 00:00:00','2018-09-26 00:00:00',0,0,1,0,1,5000.00),(9,1,5,'2018-11-01 00:00:00','2018-11-10 00:00:00',0,0,1,1,0,520.80),(10,1,6,'2018-11-01 00:00:00','2018-11-10 00:00:00',0,0,1,0,1,520.80),(12,3,7,'2018-10-10 00:00:00','2018-10-15 00:00:00',1,0,1,0,0,97.65),(13,3,8,'2018-10-18 15:00:00','2018-10-18 20:00:00',1,1,1,1,0,259.15),(14,3,9,'2018-10-19 12:00:00','2018-10-19 15:00:00',1,1,1,1,0,259.15),(15,4,10,'2018-10-20 15:00:00','2018-10-31 15:00:00',1,0,1,0,1,2798.04),(16,5,11,'2018-11-08 10:00:00','2018-11-08 10:01:00',1,1,1,0,1,420.82),(17,2,12,'2019-03-01 08:00:00','2019-03-28 16:00:00',1,1,1,1,0,3000.69),(18,2,13,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,1,0,1500.34),(19,1,14,'2019-03-01 08:00:00','2019-03-10 16:00:00',1,1,1,1,0,1178.84),(20,4,15,'2018-12-12 12:00:00','2019-03-10 12:00:00',0,0,0,0,0,14379.93),(21,3,16,'2018-12-12 12:00:00','2018-12-31 12:00:00',0,0,1,0,0,543.63),(22,2,17,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,0,1,1500.34),(23,2,18,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,1,0,1500.34),(24,2,19,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,0,1,1500.34),(25,2,20,'2022-03-10 12:00:00','2022-03-15 12:00:00',0,0,0,1,0,1256.78),(26,6,21,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,1,0,521.17),(27,3,22,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,0,1,340.98),(28,5,23,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,0,0,808.85),(29,2,24,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,0,0,1500.34),(30,6,25,'2022-03-10 12:00:00','2022-03-15 12:00:00',1,1,1,0,0,521.17);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utaid` char(10) COLLATE utf8_bin NOT NULL,
  `username` varchar(16) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(16) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `aacmembership` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'customer',
  `isrevoked` tinyint(1) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1000969278','axo9278','Aru','Oyshi','Hi..There..001','aru@aol.org',0,'Customer',0,25),(2,'1000979501','arpa','Anindita','Arpa','Hi..There..001','djArpz@gmail.com',1,'Customer',0,26),(3,'2000000000','manager','manager','manager','Hi..There..001','manager@gmail.com',0,'Manager',0,35),(4,'1000000000','admin','admin','admin','Hi..There..001','admin@aol.org',0,'Admin',0,130),(5,'1000976896','bootek123','Bootek','Lim','Hi..There..001','buttock@aol.net',1,'Admin',0,37),(6,'1000000000','customer','customer','customer','Hi..There..001','customer@aol.org',1,'Customer',0,24),(7,'1111111111','tester123','tester','tester','Passwrd.1','passwrd@net.com',0,'Customer',0,18),(8,'0000000000','arevokee','REVOKED','RENTER','Hi..There..001','revoked@aol.net',0,'Customer',1,130),(9,'1000938439','refactored','Refactor','This','Hi..There..001','refactorThis@gmail.com',1,'Customer',0,50),(10,'1234567899','sxa1234','shuvrima','alam','Hi..There..001','shuz@ashami.com',1,'Admin',0,24);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-20 20:21:27
