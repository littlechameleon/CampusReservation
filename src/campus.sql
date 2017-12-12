-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: campusreservation
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `forder` int(11) NOT NULL AUTO_INCREMENT,
  `follower` varchar(20) DEFAULT NULL,
  `followed` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`forder`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (6,'1150310620','123456'),(8,'1150310608','123456');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sreservation`
--

DROP TABLE IF EXISTS `sreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreservation` (
  `Sorder` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(20) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `Sstate` int(11) NOT NULL,
  `Torder` int(11) NOT NULL,
  `TeacherID` varchar(20) NOT NULL,
  PRIMARY KEY (`Sorder`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sreservation`
--

LOCK TABLES `sreservation` WRITE;
/*!40000 ALTER TABLE `sreservation` DISABLE KEYS */;
INSERT INTO `sreservation` VALUES (4,'1150310620','无主题',1,1,'123456'),(8,'1150310608','有主主题',4,1,'123456');
/*!40000 ALTER TABLE `sreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treservation`
--

DROP TABLE IF EXISTS `treservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treservation` (
  `Torder` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherID` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place` varchar(20) NOT NULL,
  `Tstate` int(11) NOT NULL,
  `Sorder` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`Torder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treservation`
--

LOCK TABLES `treservation` WRITE;
/*!40000 ALTER TABLE `treservation` DISABLE KEYS */;
INSERT INTO `treservation` VALUES (1,'123456','2017-12-14','08:00:00','征信32',1,4,NULL);
/*!40000 ALTER TABLE `treservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT 'user',
  `type` tinyint(1) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `college` varchar(20) DEFAULT NULL,
  `workplace` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `question` varchar(20) DEFAULT NULL,
  `answer` varchar(20) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '100',
  `followNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1150310608','李志琛',0,1,'helloworld147','计算机科学与技术学院',NULL,'18845897065','1471585088@qq.com','父亲？','李勇','我是哈工大的',80,1),('1150310620','王方帅',0,0,'hbh828hbh','计算机科学与技术学院','','18800427152','1187307315@qq.com','姓名？','王方帅','计算机科学与技术6班',80,1),('123456','张岩',1,1,'123456','计算机','征信32','123456','123456@qq.com','123','123','123',80,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11 16:21:16
