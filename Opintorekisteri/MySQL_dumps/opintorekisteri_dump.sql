-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Opintorekisteri
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `Arviointi`
--

DROP TABLE IF EXISTS `Arviointi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arviointi` (
  `idOpiskelija` int NOT NULL,
  `idOpintojakso` int NOT NULL,
  `Arvosana` tinyint DEFAULT NULL,
  `Päiväys` date DEFAULT NULL,
  UNIQUE KEY `idOpiskelija` (`idOpiskelija`,`idOpintojakso`),
  KEY `fk_Opiskelija_has_Opintojakso_Opintojakso1_idx` (`idOpintojakso`),
  KEY `fk_Opiskelija_has_Opintojakso_Opiskelija_idx` (`idOpiskelija`),
  CONSTRAINT `fk_Opiskelija_has_Opintojakso_Opintojakso1` FOREIGN KEY (`idOpintojakso`) REFERENCES `Opintojakso` (`idOpintojakso`),
  CONSTRAINT `fk_Opiskelija_has_Opintojakso_Opiskelija` FOREIGN KEY (`idOpiskelija`) REFERENCES `Opiskelija` (`idOpiskelija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arviointi`
--

LOCK TABLES `Arviointi` WRITE;
/*!40000 ALTER TABLE `Arviointi` DISABLE KEYS */;
INSERT INTO `Arviointi` VALUES (1,1,1,'2025-05-29'),(1,2,3,'2025-05-29'),(1,3,4,'2025-05-29'),(1,4,5,'2025-05-29'),(2,1,5,'2025-04-01'),(2,2,3,'2025-01-27'),(2,3,2,'2025-05-29'),(3,1,1,'2025-05-01'),(3,2,2,'2025-05-01'),(5,1,1,'2025-05-29'),(5,4,5,'2025-05-29'),(6,1,5,'2025-05-29'),(7,1,5,'2025-03-14'),(7,2,4,'2025-05-30'),(8,1,4,'2025-05-30'),(8,2,5,'2025-05-30'),(8,3,5,'2025-05-30'),(8,4,5,'2025-05-30');
/*!40000 ALTER TABLE `Arviointi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Opintojakso`
--

DROP TABLE IF EXISTS `Opintojakso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opintojakso` (
  `idOpintojakso` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(45) DEFAULT NULL,
  `Laajuus` tinyint DEFAULT NULL,
  `Koodi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOpintojakso`),
  UNIQUE KEY `Koodi` (`Koodi`),
  UNIQUE KEY `Koodi_2` (`Koodi`),
  UNIQUE KEY `Koodi_3` (`Koodi`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opintojakso`
--

LOCK TABLES `Opintojakso` WRITE;
/*!40000 ALTER TABLE `Opintojakso` DISABLE KEYS */;
INSERT INTO `Opintojakso` VALUES (1,'Alla Hejsan På Svenska!',5,'IN06969'),(2,'Matematiikan perusteet 1',10,'IN00686'),(3,'Matematiikan perusteet 2',10,'IN00687'),(4,'Sähkötyöturvallisuus 101',5,'IN00777');
/*!40000 ALTER TABLE `Opintojakso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Opiskelija`
--

DROP TABLE IF EXISTS `Opiskelija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opiskelija` (
  `idOpiskelija` int NOT NULL AUTO_INCREMENT,
  `Etunimi` varchar(45) DEFAULT NULL,
  `Sukunimi` varchar(45) DEFAULT NULL,
  `Luokkatunnus` varchar(45) DEFAULT NULL,
  `Osoite` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOpiskelija`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opiskelija`
--

LOCK TABLES `Opiskelija` WRITE;
/*!40000 ALTER TABLE `Opiskelija` DISABLE KEYS */;
INSERT INTO `Opiskelija` VALUES (1,'Matti','Mainio','TVT25SPL','Verstaskatu 1'),(2,'Kroisos','Pennonen','TVT25SPL','Penninkatu 6'),(3,'Aku','Ankka','TVT25SPL','Paratiisitie 31'),(4,'Hannu','Hanhi','TVT25SPL','Kevätkatu 42'),(5,'Mikko','Mallikas','TVT25SPL','Varastokatu 13'),(6,'Otso','Åkerman','TVT25SPL','Eerikinkatu 2B'),(7,'Iines','Ankka','TVT25SPL','Liisankatu 7'),(8,'Pelle','Peloton','TVT25SPL','Tehdaskatu 9');
/*!40000 ALTER TABLE `Opiskelija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Suoritus`
--

DROP TABLE IF EXISTS `Suoritus`;
/*!50001 DROP VIEW IF EXISTS `Suoritus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Suoritus` AS SELECT 
 1 AS `Sukunimi`,
 1 AS `Etunimi`,
 1 AS `Nimi`,
 1 AS `Arvosana`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `Suoritus`
--

/*!50001 DROP VIEW IF EXISTS `Suoritus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Matti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Suoritus` AS select `Opiskelija`.`Sukunimi` AS `Sukunimi`,`Opiskelija`.`Etunimi` AS `Etunimi`,`Opintojakso`.`Nimi` AS `Nimi`,`Arviointi`.`Arvosana` AS `Arvosana` from ((`Opiskelija` join `Arviointi` on((`Opiskelija`.`idOpiskelija` = `Arviointi`.`idOpiskelija`))) join `Opintojakso` on((`Opintojakso`.`idOpintojakso` = `Arviointi`.`idOpintojakso`))) */;
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

-- Dump completed on 2025-06-19 14:55:39
