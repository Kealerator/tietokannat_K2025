-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: kirjastotietokanta
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `asiakas`
--

DROP TABLE IF EXISTS `asiakas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiakas` (
  `idAsiakas` int NOT NULL AUTO_INCREMENT,
  `Etunimi` varchar(45) NOT NULL,
  `Sukunimi` varchar(45) NOT NULL,
  `Osoite` varchar(90) NOT NULL,
  `Sähköposti` varchar(90) NOT NULL,
  `Korttinumero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAsiakas`),
  UNIQUE KEY `Korttinumero_UNIQUE` (`Korttinumero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiakas`
--

LOCK TABLES `asiakas` WRITE;
/*!40000 ALTER TABLE `asiakas` DISABLE KEYS */;
INSERT INTO `asiakas` VALUES (1,'Roope','Ankka','Rahasäiliö','lantti.roope@luukku.fi','00014756'),(2,'Aku','Ankka','Paratiisitie 13','a.ankka@outlook.com','0005875');
/*!40000 ALTER TABLE `asiakas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hylly`
--

DROP TABLE IF EXISTS `hylly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hylly` (
  `idHylly` int NOT NULL,
  `idOsasto` int NOT NULL,
  PRIMARY KEY (`idHylly`,`idOsasto`),
  KEY `fk_Hylly_Osasto1_idx` (`idOsasto`),
  CONSTRAINT `fk_Hylly_Osasto1` FOREIGN KEY (`idOsasto`) REFERENCES `osasto` (`idOsasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hylly`
--

LOCK TABLES `hylly` WRITE;
/*!40000 ALTER TABLE `hylly` DISABLE KEYS */;
INSERT INTO `hylly` VALUES (4,1),(13,1);
/*!40000 ALTER TABLE `hylly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kaikkikirjat`
--

DROP TABLE IF EXISTS `kaikkikirjat`;
/*!50001 DROP VIEW IF EXISTS `kaikkikirjat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kaikkikirjat` AS SELECT 
 1 AS `idKirja`,
 1 AS `Tekijä`,
 1 AS `Nimi`,
 1 AS `Laji`,
 1 AS `Kieli`,
 1 AS `Hylly nro`,
 1 AS `Osasto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kirja`
--

DROP TABLE IF EXISTS `kirja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kirja` (
  `idKirja` int NOT NULL AUTO_INCREMENT,
  `idTeos` int NOT NULL,
  `Laji` varchar(45) DEFAULT NULL,
  `Kieli` varchar(45) DEFAULT NULL,
  `Julkaisu` date DEFAULT NULL,
  `Koodi` varchar(64) DEFAULT NULL,
  `idOsasto` int NOT NULL,
  `idHylly` int DEFAULT NULL,
  PRIMARY KEY (`idKirja`),
  KEY `fk_Kirja_Teos1_idx` (`idTeos`),
  KEY `fk_Kirja_Hylly1_idx` (`idHylly`,`idOsasto`),
  CONSTRAINT `fk_Kirja_Hylly1` FOREIGN KEY (`idHylly`, `idOsasto`) REFERENCES `hylly` (`idHylly`, `idOsasto`),
  CONSTRAINT `fk_Kirja_Teos1` FOREIGN KEY (`idTeos`) REFERENCES `teos` (`idTeos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kirja`
--

LOCK TABLES `kirja` WRITE;
/*!40000 ALTER TABLE `kirja` DISABLE KEYS */;
INSERT INTO `kirja` VALUES (1,2,'Fantasia','Englanti','2012-09-01','ISBN9780547928241',1,4),(2,3,'Fantasia','Englanti','1991-07-04','ISBN9780261102354',1,4),(4,4,'Lasten & Nuorten kaunokirjallisuus','Suomi','2024-08-09','ISBN9789522563477',1,13),(5,5,'Fantasia','Englanti','2007-04-01','ISBN9780261102361',1,4),(6,2,'Fantasia','Englanti','2012-09-01','ISBN9780547928241',1,4);
/*!40000 ALTER TABLE `kirja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lainaus`
--

DROP TABLE IF EXISTS `lainaus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lainaus` (
  `idLainaus` int NOT NULL AUTO_INCREMENT,
  `idAsiakas` int NOT NULL,
  `idKirja` int NOT NULL,
  `Alkupvm` date NOT NULL,
  `Loppupvm` date NOT NULL,
  PRIMARY KEY (`idLainaus`),
  KEY `fk_Lainaus_Kirja1_idx` (`idKirja`),
  KEY `fk_Lainaus_Asiakas1_idx` (`idAsiakas`),
  CONSTRAINT `fk_Lainaus_Asiakas1` FOREIGN KEY (`idAsiakas`) REFERENCES `asiakas` (`idAsiakas`),
  CONSTRAINT `fk_Lainaus_Kirja1` FOREIGN KEY (`idKirja`) REFERENCES `kirja` (`idKirja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lainaus`
--

LOCK TABLES `lainaus` WRITE;
/*!40000 ALTER TABLE `lainaus` DISABLE KEYS */;
INSERT INTO `lainaus` VALUES (1,1,1,'2025-06-26','2025-07-26'),(3,2,1,'2025-06-27','2025-07-26');
/*!40000 ALTER TABLE `lainaus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osasto`
--

DROP TABLE IF EXISTS `osasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osasto` (
  `idOsasto` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(45) NOT NULL,
  PRIMARY KEY (`idOsasto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osasto`
--

LOCK TABLES `osasto` WRITE;
/*!40000 ALTER TABLE `osasto` DISABLE KEYS */;
INSERT INTO `osasto` VALUES (1,'Alpha');
/*!40000 ALTER TABLE `osasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tekijä`
--

DROP TABLE IF EXISTS `tekijä`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tekijä` (
  `idTekijä` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(120) NOT NULL,
  PRIMARY KEY (`idTekijä`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tekijä`
--

LOCK TABLES `tekijä` WRITE;
/*!40000 ALTER TABLE `tekijä` DISABLE KEYS */;
INSERT INTO `tekijä` VALUES (1,'J.R.R. Tolkien'),(2,'Sarah Courtauld'),(3,'Rosie Dickins');
/*!40000 ALTER TABLE `tekijä` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tekijä_has_teos`
--

DROP TABLE IF EXISTS `tekijä_has_teos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tekijä_has_teos` (
  `idTekijä` int NOT NULL,
  `idTeos` int NOT NULL,
  KEY `fk_Teos_has_Tekijä_Tekijä1_idx` (`idTekijä`),
  KEY `fk_Teos_has_Tekijä_Teos_idx` (`idTeos`),
  CONSTRAINT `fk_Teos_has_Tekijä_Tekijä1` FOREIGN KEY (`idTekijä`) REFERENCES `tekijä` (`idTekijä`),
  CONSTRAINT `fk_Teos_has_Tekijä_Teos` FOREIGN KEY (`idTeos`) REFERENCES `teos` (`idTeos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tekijä_has_teos`
--

LOCK TABLES `tekijä_has_teos` WRITE;
/*!40000 ALTER TABLE `tekijä_has_teos` DISABLE KEYS */;
INSERT INTO `tekijä_has_teos` VALUES (1,2),(1,3),(2,4),(3,4),(1,5),(1,6);
/*!40000 ALTER TABLE `tekijä_has_teos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teos`
--

DROP TABLE IF EXISTS `teos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teos` (
  `idTeos` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(90) NOT NULL,
  `Julkaisuvuosi` year DEFAULT NULL,
  PRIMARY KEY (`idTeos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teos`
--

LOCK TABLES `teos` WRITE;
/*!40000 ALTER TABLE `teos` DISABLE KEYS */;
INSERT INTO `teos` VALUES (2,'The Hobbit, or There and Back Again',1937),(3,'The Fellowship of The Ring',1954),(4,'Lasten toivesatukirja',2024),(5,'The Two Towers',1954),(6,'The Return of The King',1955);
/*!40000 ALTER TABLE `teos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `kaikkikirjat`
--

/*!50001 DROP VIEW IF EXISTS `kaikkikirjat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Matti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kaikkikirjat` AS select `k`.`idKirja` AS `idKirja`,`tek`.`Nimi` AS `Tekijä`,`t`.`Nimi` AS `Nimi`,`k`.`Laji` AS `Laji`,`k`.`Kieli` AS `Kieli`,`h`.`idHylly` AS `Hylly nro`,`o`.`Nimi` AS `Osasto` from (((((`tekijä` `tek` join `tekijä_has_teos` `tht` on((`tek`.`idTekijä` = `tht`.`idTekijä`))) join `kirja` `k` on((`tht`.`idTeos` = `k`.`idTeos`))) join `teos` `t` on((`k`.`idTeos` = `t`.`idTeos`))) join `hylly` `h` on((`k`.`idHylly` = `h`.`idHylly`))) join `osasto` `o` on((`h`.`idOsasto` = `o`.`idOsasto`))) */;
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

-- Dump completed on 2025-06-26 14:41:53
