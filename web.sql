-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: web
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL,
  `bname` varchar(40) DEFAULT NULL,
  `btag` varchar(20) DEFAULT NULL,
  `bauthor` varchar(20) DEFAULT NULL,
  `bstate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (2,'《从零开始的JSP学习》','计算机','蒋星星','借出'),(3,'《论捡灯笼的技巧》','心理学','Uzi','借出'),(4,'《如何和恩静进一步发展》','青春文学','FAKER','借出'),(5,'《我与饮水机的故事》','生活','MLXG','未借出'),(6,'《海子的诗》','诗歌','海子','未借出'),(7,'《小王子》','童话','圣埃克苏佩里','借出'),(8,'《老人与海》','文学作品','海明威','未借出'),(11,'《偶像练习生》','娱乐','蔡徐坤','借出');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reade`
--

DROP TABLE IF EXISTS `reade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reade` (
  `rid` int(11) NOT NULL,
  `user` varchar(20) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `bname` varchar(40) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reade`
--

LOCK TABLES `reade` WRITE;
/*!40000 ALTER TABLE `reade` DISABLE KEYS */;
INSERT INTO `reade` VALUES (1,'star','star',1,'C==','已归还'),(2,'star','star',2,'《从零开始的JSP学习》','已归还'),(3,'star','star',7,'《小王子》','已归还'),(4,'star','star',8,'《老人与海》','未归还'),(5,'test','ces测试',1,'C==','已归还'),(6,'test','ces测试',2,'《从零开始的JSP学习》','未归还'),(7,'star','star',11,'《偶像练习生》','未归还'),(8,'star','star',3,'《论捡灯笼的技巧》','已归还'),(9,'star','star',4,'《如何和恩静进一步发展》','已归还');
/*!40000 ALTER TABLE `reade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usertable` (
  `user` varchar(40) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `passwords` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `authority` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertable`
--

LOCK TABLES `usertable` WRITE;
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` VALUES ('admin','admin','admin','123','1'),('star','starstartsat','star','18473465306','0'),('test','ce测试','test','18473465306','0');
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'web'
--

--
-- Dumping routines for database 'web'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-17 10:55:25
