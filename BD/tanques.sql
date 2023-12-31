-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: mansidao.cptec.inpe.br    Database: sistemacetest
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `tanques`
--
Use sistemacetest;

DROP TABLE IF EXISTS `tanques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanques` (
  `cm` varchar(3) DEFAULT NULL,
  `externo` varchar(7) DEFAULT NULL,
  `interno` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanques`
--

LOCK TABLES `tanques` WRITE;
/*!40000 ALTER TABLE `tanques` DISABLE KEYS */;
INSERT INTO `tanques` VALUES ('1','7','5,93'),('2','19','16,71'),('3','35','30,6'),('4','53','46,97'),('5','75','65,43'),('6','98','85,73'),('7','123','107,68'),('8','150','131,13'),('9','179','155,95'),('10','209','182,04'),('11','241','209,32'),('12','274','237,7'),('13','309','267,11'),('14','344','297,49'),('15','381','328,79'),('16','419','360,95'),('17','459','393,93'),('18','499','427,68'),('19','540','462,16'),('20','582','197,33'),('21','625','533,16'),('22','670','569,61'),('23','714','606,64'),('24','760','644,24'),('25','807','682,36'),('26','854','720,98'),('27','902','760,07'),('28','951','799,61'),('29','1000','839,58'),('30','1052','879,91'),('31','1103','920,63'),('32','1154','961,7'),('33','1207','1003,09'),('34','1260','1044,78'),('35','1313','1086,76'),('36','1367','1128,99'),('37','1422','1171,46'),('38','1478','1214,15'),('39','1534','1257,03'),('40','1590','1300,09'),('41','1647','1343,31'),('42','1705','1386,66'),('43','1763','1430,13'),('44','1821','1473,7'),('45','1880','1517,35'),('46','1940','1561,06'),('47','1999','1604,82'),('48','2060','1648,59'),('49','2120','1692,68'),('50','2181','1736,44'),('51','2243','1780,17'),('52','2305','1823,84'),('53','2367','1867,45'),('54','2430','1910,96'),('55','2493','1954,37'),('56','2556','1997,64'),('57','2620','2040,77'),('58','2684','2083,72'),('59','2748','2126,49'),('60','2812','2169,05'),('61','2877','2211,38'),('62','2942','2253,46'),('63','3008','2295,27'),('64','3073','2336,78'),('65','3139','2377,98'),('66','3206','2418,84'),('67','3272','2459,34'),('68','3339','2499,46'),('69','3406','2539,17'),('70','3473','2578,44'),('71','3540','2617,25'),('72','3607','2655,58'),('73','3675','2693,38'),('74','3743','2730,65'),('75','3811','2767,33'),('76','3879','2803,41'),('77','3947','2838,85'),('78','4016','2873,61'),('79','4084','2907,66'),('80','4153','2940,95'),('81','4222','2973,44'),('82','4291','3005,09'),('83','4360','3035,85'),('84','4429','3065,66'),('85','4498','3094,46'),('86','4568','3122,18'),('87','4637','3148,76'),('88','4707','3174,1'),('89','4776','3198,11'),('90','4846','3220,68'),('91','4915','3241,66'),('92','4985','3260,88'),('93','5055','3278,12'),('94','5124','3293,06'),('95','5194','3305,19'),('96','5264','3313,5'),('97','5334',''),('98','5403',''),('99','5473',''),('100','5543',''),('101','5612',''),('102','5682',''),('103','5751',''),('104','5821',''),('105','5890',''),('106','5960',''),('107','6029',''),('108','6098',''),('109','6167',''),('110','6236',''),('111','6305',''),('112','6374',''),('113','6442',''),('114','6511',''),('115','6579',''),('116','6647',''),('117','6715',''),('118','6783',''),('119','6851',''),('120','6918',''),('121','6985',''),('122','7052',''),('123','7119',''),('124','7186',''),('125','7252',''),('126','7319',''),('127','7385',''),('128','7450',''),('129','7516',''),('130','7581',''),('131','7646',''),('132','7710',''),('133','7774',''),('134','7838',''),('135','7902',''),('136','7965',''),('137','8028',''),('138','8091',''),('139','8153',''),('140','8215',''),('141','8277',''),('142','8338',''),('143','8398',''),('144','8459',''),('145','8518',''),('146','8578',''),('147','8637',''),('148','8695',''),('149','8753',''),('150','8811',''),('151','8868',''),('152','8924',''),('153','8990',''),('154','9036',''),('155','9091',''),('156','9145',''),('157','9198',''),('158','9251',''),('159','9304',''),('160','9355',''),('161','9406',''),('162','9457',''),('163','9507',''),('164','9555',''),('165','9604',''),('166','9651',''),('167','9698',''),('168','9744',''),('169','9788',''),('170','9833',''),('171','9876',''),('172','9918',''),('173','9959',''),('174','9999',''),('175','10039',''),('176','10077',''),('177','10114',''),('178','10149',''),('179','10194',''),('180','10217',''),('181','10249',''),('182','10279',''),('183','10308',''),('184','10335',''),('185','10360',''),('186','10383',''),('187','10405',''),('188','10423',''),('189','10439',''),('190','10451',''),('191','10468',''),('192','10482','');
/*!40000 ALTER TABLE `tanques` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-25 14:44:59
