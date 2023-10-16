-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: sistemacetest
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `agua`
--
use sistemacetest;

DROP TABLE IF EXISTS `agua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agua` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(40) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `cptecGeral` varchar(20) DEFAULT NULL,
  `torres` varchar(20) DEFAULT NULL,
  `agua` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agua`
--

LOCK TABLES `agua` WRITE;
/*!40000 ALTER TABLE `agua` DISABLE KEYS */;
INSERT INTO `agua` VALUES (1,'Joao','2023-07-18','2023-07-18 10:46:07','77676','66','15'),(2,'Joao','2023-07-19','2023-07-19 15:44:10','23','45','56');
/*!40000 ALTER TABLE `agua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arCondicionado`
--

DROP TABLE IF EXISTS `arCondicionado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arCondicionado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(20) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `bte1040kwh` varchar(20) DEFAULT NULL,
  `bte1040kw` varchar(20) DEFAULT NULL,
  `bte1050kwh` varchar(20) DEFAULT NULL,
  `bte1050kw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arCondicionado`
--

LOCK TABLES `arCondicionado` WRITE;
/*!40000 ALTER TABLE `arCondicionado` DISABLE KEYS */;
INSERT INTO `arCondicionado` VALUES (1,'Joao','2023-07-18','2023-07-18 10:45:50','444',NULL,'5565',NULL),(2,'Joao','2023-07-19','2023-07-19 15:11:14','34','76','54','456');
/*!40000 ALTER TABLE `arCondicionado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cag`
--

DROP TABLE IF EXISTS `cag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(45) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `bte10515kwh` varchar(20) DEFAULT NULL,
  `bte10515kw` varchar(20) DEFAULT NULL,
  `bte10401kwh` varchar(20) DEFAULT NULL,
  `bte10401kw` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cag`
--

LOCK TABLES `cag` WRITE;
/*!40000 ALTER TABLE `cag` DISABLE KEYS */;
INSERT INTO `cag` VALUES (1,'Joao','2023-07-18','2023-07-18 10:45:58','6454',NULL,'456',NULL),(2,'Joao','2023-07-19','2023-07-19 15:38:49','43','765','78','987');
/*!40000 ALTER TABLE `cag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenter`
--

DROP TABLE IF EXISTS `datacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datacenter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(20) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `bte1020kwh` varchar(20) DEFAULT NULL,
  `bte1020kw` varchar(20) DEFAULT NULL,
  `bte10200kwh` varchar(20) DEFAULT NULL,
  `bte10200kw` varchar(20) DEFAULT NULL,
  `ups01kw` varchar(20) DEFAULT NULL,
  `ups02kw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
INSERT INTO `datacenter` VALUES (1,'Joao','2023-07-18','2023-07-18 10:45:33','245',NULL,'6778',NULL,NULL,NULL),(2,'Joao','2023-07-19','2023-07-19 13:48:24','23','45','43','56','76','87');
/*!40000 ALTER TABLE `datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supercomputacao`
--

DROP TABLE IF EXISTS `supercomputacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supercomputacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(20) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `bte1010kwh` varchar(20) DEFAULT NULL,
  `bte1010kw` varchar(20) DEFAULT NULL,
  `bte101000kwh` varchar(20) DEFAULT NULL,
  `bte101000kw` varchar(20) DEFAULT NULL,
  `ups05kwh` varchar(20) DEFAULT NULL,
  `ups05kw` varchar(20) DEFAULT NULL,
  `ups06kwh` varchar(20) DEFAULT NULL,
  `ups06kw` varchar(20) DEFAULT NULL,
  `pdu05kwh` varchar(20) DEFAULT NULL,
  `pdu05kw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supercomputacao`
--

LOCK TABLES `supercomputacao` WRITE;
/*!40000 ALTER TABLE `supercomputacao` DISABLE KEYS */;
INSERT INTO `supercomputacao` VALUES (1,'Joao','2023-07-18','2023-07-18 10:45:26','2342',NULL,'234',NULL,'23432',NULL,'234',NULL,'432',NULL),(2,'Joao','2023-07-19','2023-07-19 13:25:20','5','67','45','54','78','98','65','43','7','65');
/*!40000 ALTER TABLE `supercomputacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilidades`
--

DROP TABLE IF EXISTS `utilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(20) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `bte1030kwh` varchar(20) DEFAULT NULL,
  `bte1030kw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilidades`
--

LOCK TABLES `utilidades` WRITE;
/*!40000 ALTER TABLE `utilidades` DISABLE KEYS */;
INSERT INTO `utilidades` VALUES (1,'Joao','2023-07-18','2023-07-18 10:45:40','999',NULL),(2,'Joao','2023-07-19','2023-07-19 15:04:33','32','34'),(3,'Joao','2023-07-20','2023-07-20 16:39:52','10','100');
/*!40000 ALTER TABLE `utilidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-25  8:24:03
