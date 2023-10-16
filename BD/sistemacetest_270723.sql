CREATE DATABASE  IF NOT EXISTS `sistemacetest`;
USE `sistemacetest`;

--
-- Table structure for table `agua`
--

DROP TABLE IF EXISTS `agua`;
CREATE TABLE `agua` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(40) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `cptecGeral` varchar(20) DEFAULT NULL,
  `torres` varchar(20) DEFAULT NULL,
  `agua` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2; 

--
-- Dumping data for table `agua`
--

LOCK TABLES `agua` WRITE;
/*!40000 ALTER TABLE `agua` DISABLE KEYS */;
INSERT INTO `agua` VALUES (1,'Joao','2023-07-25','2023-07-25 16:04:54','34','54','56');
/*!40000 ALTER TABLE `agua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arCondicionado`
--

DROP TABLE IF EXISTS `arCondicionado`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2;  

--
-- Dumping data for table `arCondicionado`
--

LOCK TABLES `arCondicionado` WRITE;
/*!40000 ALTER TABLE `arCondicionado` DISABLE KEYS */;
INSERT INTO `arCondicionado` VALUES (1,'Joao','2023-07-25','2023-07-25 16:04:39','124','66','55','77');
/*!40000 ALTER TABLE `arCondicionado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cag`
--

DROP TABLE IF EXISTS `cag`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cag`
--

LOCK TABLES `cag` WRITE;
/*!40000 ALTER TABLE `cag` DISABLE KEYS */;
INSERT INTO `cag` VALUES (1,'Joao','2023-07-25','2023-07-25 16:04:47','23','54','43','34');
/*!40000 ALTER TABLE `cag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combustivel`
--

DROP TABLE IF EXISTS `combustivel`;
CREATE TABLE `combustivel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(40) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `taCM` varchar(20) DEFAULT NULL,
  `taLitro` varchar(20) DEFAULT NULL,
  `tbCM` varchar(20) DEFAULT NULL,
  `tbLitro` varchar(20) DEFAULT NULL,
  `tcCM` varchar(20) DEFAULT NULL,
  `tcLitro` varchar(20) DEFAULT NULL,
  `totalLitro` varchar(20) DEFAULT NULL,
  `oleoIn` varchar(20) DEFAULT NULL,
  `oleoOut` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combustivel`
--

LOCK TABLES `combustivel` WRITE;
/*!40000 ALTER TABLE `combustivel` DISABLE KEYS */;
INSERT INTO `combustivel` VALUES (1,'Joao','2023-07-26','2023-07-26 15:50:36','1','7.00','2','19.00','3','30.00','56.00','4','5'),(2,'Joao','2023-07-26','2023-07-26 15:50:57','1','7.00','2','19.00','3','30.00','56.00','4','5'),(3,'Joao','2023-07-26','2023-07-26 15:51:28','5','75.00','6','98.00','7','107.00','280.00','8','9'),(4,'Joao','2023-07-26','2023-07-26 15:52:38','1','7.00','2','19.00','3','30.00','56.00','45','56');
/*!40000 ALTER TABLE `combustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenter`
--

DROP TABLE IF EXISTS `datacenter`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
INSERT INTO `datacenter` VALUES (1,'Joao','2023-07-25','2023-07-25 16:04:18','12','32','23','43','55','67');
/*!40000 ALTER TABLE `datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerador`
--

DROP TABLE IF EXISTS `gerador`;
CREATE TABLE `gerador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(40) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `g1hora` varchar(20) DEFAULT NULL,
  `g1kwh` varchar(20) DEFAULT NULL,
  `g1tempAgua` varchar(20) DEFAULT NULL,
  `g1tempOleo` varchar(20) DEFAULT NULL,
  `g1batA` varchar(20) DEFAULT NULL,
  `g1batB` varchar(20) DEFAULT NULL,
  `g1batTotal` varchar(20) DEFAULT NULL,
  `g2hora` varchar(20) DEFAULT NULL,
  `g2kwh` varchar(20) DEFAULT NULL,
  `g2tempAgua` varchar(20) DEFAULT NULL,
  `g2tempOleo` varchar(20) DEFAULT NULL,
  `g2batA` varchar(20) DEFAULT NULL,
  `g2batB` varchar(20) DEFAULT NULL,
  `g2batTotal` varchar(20) DEFAULT NULL,
  `g3hora` varchar(20) DEFAULT NULL,
  `g3kwh` varchar(20) DEFAULT NULL,
  `g3tempAgua` varchar(20) DEFAULT NULL,
  `g3tempOleo` varchar(20) DEFAULT NULL,
  `g3batA` varchar(20) DEFAULT NULL,
  `g3batB` varchar(20) DEFAULT NULL,
  `g3batTotal` varchar(20) DEFAULT NULL,
  `g4hora` varchar(20) DEFAULT NULL,
  `g4kwh` varchar(20) DEFAULT NULL,
  `g4tempAgua` varchar(20) DEFAULT NULL,
  `g4tempOleo` varchar(20) DEFAULT NULL,
  `g4batA` varchar(20) DEFAULT NULL,
  `g4batB` varchar(20) DEFAULT NULL,
  `g4batTotal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerador`
--

LOCK TABLES `gerador` WRITE;
/*!40000 ALTER TABLE `gerador` DISABLE KEYS */;
INSERT INTO `gerador` VALUES (2,'Joao','2023-07-26','2023-07-26 14:55:59','1','1','1','2','2','2','4','1','1','1','2','2','2','4','1','1','1','2','2','2','4','1','1','1','2','2','2','4');
/*!40000 ALTER TABLE `gerador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operador`
--

DROP TABLE IF EXISTS `operador`;
CREATE TABLE `operador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(45) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `email` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador`
--

LOCK TABLES `operador` WRITE;
/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
INSERT INTO `operador` VALUES (1,'Joao','ed2befb11499489e2570cb053f774b8ed93e89eddab3f78867a2a5f32c58845e','joao.guimaraes@inpe.br','Datainfo'),(2,'Luca','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','luca.couto@inpe.br','Datainfo - INPE'),(3,'Marcelo','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','marcelo.prado@inpe.br','INPE'),(16,'Teste','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5','teste@teste.br','teste');
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supercomputacao`
--

DROP TABLE IF EXISTS `supercomputacao`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supercomputacao`
--

LOCK TABLES `supercomputacao` WRITE;
/*!40000 ALTER TABLE `supercomputacao` DISABLE KEYS */;
INSERT INTO `supercomputacao` VALUES (1,'Joao','2023-07-25','2023-07-25 16:07:13','12','32','445','55','54','65','34','43','23','43'),(2,'Teste','2023-07-24','2023-07-25 16:16:58','45','4','456','67','77','88','56','88','55','7');
/*!40000 ALTER TABLE `supercomputacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanques`
--

DROP TABLE IF EXISTS `tanques`;
CREATE TABLE `tanques` (
  `cm` varchar(3) DEFAULT NULL,
  `externo` varchar(7) DEFAULT NULL,
  `interno` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanques`
--

LOCK TABLES `tanques` WRITE;
/*!40000 ALTER TABLE `tanques` DISABLE KEYS */;
INSERT INTO `tanques` VALUES ('1','7','5,93'),('2','19','16,71'),('3','35','30,6'),('4','53','46,97'),('5','75','65,43'),('6','98','85,73'),('7','123','107,68'),('8','150','131,13'),('9','179','155,95'),('10','209','182,04'),('11','241','209,32'),('12','274','237,7'),('13','309','267,11'),('14','344','297,49'),('15','381','328,79'),('16','419','360,95'),('17','459','393,93'),('18','499','427,68'),('19','540','462,16'),('20','582','197,33'),('21','625','533,16'),('22','670','569,61'),('23','714','606,64'),('24','760','644,24'),('25','807','682,36'),('26','854','720,98'),('27','902','760,07'),('28','951','799,61'),('29','1000','839,58'),('30','1052','879,91'),('31','1103','920,63'),('32','1154','961,7'),('33','1207','1003,09'),('34','1260','1044,78'),('35','1313','1086,76'),('36','1367','1128,99'),('37','1422','1171,46'),('38','1478','1214,15'),('39','1534','1257,03'),('40','1590','1300,09'),('41','1647','1343,31'),('42','1705','1386,66'),('43','1763','1430,13'),('44','1821','1473,7'),('45','1880','1517,35'),('46','1940','1561,06'),('47','1999','1604,82'),('48','2060','1648,59'),('49','2120','1692,68'),('50','2181','1736,44'),('51','2243','1780,17'),('52','2305','1823,84'),('53','2367','1867,45'),('54','2430','1910,96'),('55','2493','1954,37'),('56','2556','1997,64'),('57','2620','2040,77'),('58','2684','2083,72'),('59','2748','2126,49'),('60','2812','2169,05'),('61','2877','2211,38'),('62','2942','2253,46'),('63','3008','2295,27'),('64','3073','2336,78'),('65','3139','2377,98'),('66','3206','2418,84'),('67','3272','2459,34'),('68','3339','2499,46'),('69','3406','2539,17'),('70','3473','2578,44'),('71','3540','2617,25'),('72','3607','2655,58'),('73','3675','2693,38'),('74','3743','2730,65'),('75','3811','2767,33'),('76','3879','2803,41'),('77','3947','2838,85'),('78','4016','2873,61'),('79','4084','2907,66'),('80','4153','2940,95'),('81','4222','2973,44'),('82','4291','3005,09'),('83','4360','3035,85'),('84','4429','3065,66'),('85','4498','3094,46'),('86','4568','3122,18'),('87','4637','3148,76'),('88','4707','3174,1'),('89','4776','3198,11'),('90','4846','3220,68'),('91','4915','3241,66'),('92','4985','3260,88'),('93','5055','3278,12'),('94','5124','3293,06'),('95','5194','3305,19'),('96','5264','3313,5'),('97','5334',''),('98','5403',''),('99','5473',''),('100','5543',''),('101','5612',''),('102','5682',''),('103','5751',''),('104','5821',''),('105','5890',''),('106','5960',''),('107','6029',''),('108','6098',''),('109','6167',''),('110','6236',''),('111','6305',''),('112','6374',''),('113','6442',''),('114','6511',''),('115','6579',''),('116','6647',''),('117','6715',''),('118','6783',''),('119','6851',''),('120','6918',''),('121','6985',''),('122','7052',''),('123','7119',''),('124','7186',''),('125','7252',''),('126','7319',''),('127','7385',''),('128','7450',''),('129','7516',''),('130','7581',''),('131','7646',''),('132','7710',''),('133','7774',''),('134','7838',''),('135','7902',''),('136','7965',''),('137','8028',''),('138','8091',''),('139','8153',''),('140','8215',''),('141','8277',''),('142','8338',''),('143','8398',''),('144','8459',''),('145','8518',''),('146','8578',''),('147','8637',''),('148','8695',''),('149','8753',''),('150','8811',''),('151','8868',''),('152','8924',''),('153','8990',''),('154','9036',''),('155','9091',''),('156','9145',''),('157','9198',''),('158','9251',''),('159','9304',''),('160','9355',''),('161','9406',''),('162','9457',''),('163','9507',''),('164','9555',''),('165','9604',''),('166','9651',''),('167','9698',''),('168','9744',''),('169','9788',''),('170','9833',''),('171','9876',''),('172','9918',''),('173','9959',''),('174','9999',''),('175','10039',''),('176','10077',''),('177','10114',''),('178','10149',''),('179','10194',''),('180','10217',''),('181','10249',''),('182','10279',''),('183','10308',''),('184','10335',''),('185','10360',''),('186','10383',''),('187','10405',''),('188','10423',''),('189','10439',''),('190','10451',''),('191','10468',''),('192','10482','');
/*!40000 ALTER TABLE `tanques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilidades`
--

DROP TABLE IF EXISTS `utilidades`;
CREATE TABLE `utilidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operador` varchar(20) NOT NULL,
  `data` date DEFAULT NULL,
  `registro` datetime DEFAULT NULL,
  `bte1030kwh` varchar(20) DEFAULT NULL,
  `bte1030kw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;  
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilidades`
--

LOCK TABLES `utilidades` WRITE;
/*!40000 ALTER TABLE `utilidades` DISABLE KEYS */;
INSERT INTO `utilidades` VALUES (1,'Joao','2023-07-25','2023-07-25 16:04:27','22','45');
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

-- Dump completed on 2023-07-27  9:24:41
