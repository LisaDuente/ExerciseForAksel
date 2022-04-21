-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: exerciseaksel
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Street` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'Kirchdorfer strasse 5','30890','Barsinghausen','Germany'),(2,'Loopstrasse 12','30890','Barsinghausen','Germany'),(3,'Loopstrasse 12','30890','Barsinghausen','Germany'),(4,'hallotest 2','30167','Hannover','Germany'),(5,'Teststasse 56','12983','Berlin','Germany');
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birthday`
--

DROP TABLE IF EXISTS `birthday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birthday` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Day` int unsigned DEFAULT NULL,
  `Month` int unsigned DEFAULT NULL,
  `Year` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Day` (`Day`),
  KEY `Month` (`Month`),
  KEY `Year` (`Year`),
  CONSTRAINT `birthday_ibfk_1` FOREIGN KEY (`Day`) REFERENCES `day` (`Day`),
  CONSTRAINT `birthday_ibfk_2` FOREIGN KEY (`Month`) REFERENCES `month` (`ID`),
  CONSTRAINT `birthday_ibfk_3` FOREIGN KEY (`Year`) REFERENCES `year` (`Year`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birthday`
--

LOCK TABLES `birthday` WRITE;
/*!40000 ALTER TABLE `birthday` DISABLE KEYS */;
INSERT INTO `birthday` VALUES (1,1,1,1980),(2,30,4,1991),(3,23,12,1992),(4,16,4,2001);
/*!40000 ALTER TABLE `birthday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `birthdayview`
--

DROP TABLE IF EXISTS `birthdayview`;
/*!50001 DROP VIEW IF EXISTS `birthdayview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `birthdayview` AS SELECT 
 1 AS `ID`,
 1 AS `Day`,
 1 AS `Month`,
 1 AS `Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `day`
--

DROP TABLE IF EXISTS `day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day` (
  `Day` int unsigned NOT NULL,
  PRIMARY KEY (`Day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day`
--

LOCK TABLES `day` WRITE;
/*!40000 ALTER TABLE `day` DISABLE KEYS */;
INSERT INTO `day` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31);
/*!40000 ALTER TABLE `day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `month`
--

DROP TABLE IF EXISTS `month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `month` (
  `ID` int unsigned NOT NULL,
  `Month` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `month`
--

LOCK TABLES `month` WRITE;
/*!40000 ALTER TABLE `month` DISABLE KEYS */;
INSERT INTO `month` VALUES (1,'January'),(2,'Febuary'),(3,'March'),(4,'April'),(5,'May'),(6,'June'),(7,'July'),(8,'August'),(9,'September'),(10,'October'),(11,'November'),(12,'December');
/*!40000 ALTER TABLE `month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `AdressID` int unsigned DEFAULT NULL,
  `BirthdayID` int unsigned DEFAULT NULL,
  `surname` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AdressID` (`AdressID`),
  KEY `BirthdayID` (`BirthdayID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`AdressID`) REFERENCES `adress` (`ID`),
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`BirthdayID`) REFERENCES `birthday` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Lisa',1,1,'Duente'),(2,'Tim',3,2,'Duente'),(3,'Lisa',4,3,'Schuppe'),(4,'Jane',5,4,'Meyer');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `persondata`
--

DROP TABLE IF EXISTS `persondata`;
/*!50001 DROP VIEW IF EXISTS `persondata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `persondata` AS SELECT 
 1 AS `Name`,
 1 AS `surname`,
 1 AS `Street`,
 1 AS `PostalCode`,
 1 AS `City`,
 1 AS `Country`,
 1 AS `day`,
 1 AS `Month`,
 1 AS `Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year` (
  `Year` int unsigned NOT NULL,
  PRIMARY KEY (`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1980),(1981),(1982),(1983),(1984),(1985),(1986),(1987),(1988),(1989),(1990),(1991),(1992),(1993),(1994),(1995),(1996),(1997),(1998),(1999),(2000),(2001),(2002),(2003),(2004),(2005),(2006),(2007),(2008),(2009),(2010),(2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019),(2020),(2021),(2022);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'exerciseaksel'
--

--
-- Dumping routines for database 'exerciseaksel'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddPerson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPerson`(`Name` Varchar(100), surname VARCHAR(150), Street VARCHAR(255), PostCode VARCHAR(20), City VARCHAR(255), Country VARCHAR(40), BDay INT, BMonth INT, BYear INT)
BEGIN
SELECT @AdressID := MAX(ID)+1 FROM adress;
SELECT @BirthdayID := MAX(ID)+1 FROM birthday;
INSERT INTO Adress VALUES(@AdressID, Street, PostCode, City, Country);
INSERT INTO Birthday VALUES(@BirthdayID, BDay, BMonth, BYear);
INSERT INTO person VALUES(null, `Name`, @AdressID, @BirthdayID, surname);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `birthdayview`
--

/*!50001 DROP VIEW IF EXISTS `birthdayview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `birthdayview` AS select `birthday`.`ID` AS `ID`,`birthday`.`Day` AS `Day`,`m`.`Month` AS `Month`,`birthday`.`Year` AS `Year` from (`birthday` join `month` `m` on((`birthday`.`Month` = `m`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `persondata`
--

/*!50001 DROP VIEW IF EXISTS `persondata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `persondata` AS select `p`.`Name` AS `Name`,`p`.`surname` AS `surname`,`a`.`Street` AS `Street`,`a`.`PostalCode` AS `PostalCode`,`a`.`City` AS `City`,`a`.`Country` AS `Country`,`b`.`Day` AS `day`,`m`.`Month` AS `Month`,`b`.`Year` AS `Year` from (((`person` `p` join `adress` `a` on((`a`.`ID` = `p`.`AdressID`))) join `birthday` `b` on((`b`.`ID` = `p`.`BirthdayID`))) join `month` `m` on((`b`.`Month` = `m`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-20 15:53:06
