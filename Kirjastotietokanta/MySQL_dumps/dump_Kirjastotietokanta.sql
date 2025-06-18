-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Kirjastotietokanta
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
-- Temporary view structure for view `KaikkiTeoksetJaNiidenTekijät`
--

DROP TABLE IF EXISTS `KaikkiTeoksetJaNiidenTekijät`;
/*!50001 DROP VIEW IF EXISTS `KaikkiTeoksetJaNiidenTekijät`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `KaikkiTeoksetJaNiidenTekijät` AS SELECT 
 1 AS `Etunimi`,
 1 AS `Sukunimi`,
 1 AS `Nimi`,
 1 AS `Julkaisuvuosi`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Tekijä`
--

DROP TABLE IF EXISTS `Tekijä`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tekijä` (
  `idTekijä` int NOT NULL AUTO_INCREMENT,
  `Etunimi` varchar(45) DEFAULT NULL,
  `Sukunimi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTekijä`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tekijä`
--

LOCK TABLES `Tekijä` WRITE;
/*!40000 ALTER TABLE `Tekijä` DISABLE KEYS */;
INSERT INTO `Tekijä` VALUES (1,'R.A.','Salvatore'),(2,'J.R.R.','Tolkien');
/*!40000 ALTER TABLE `Tekijä` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teos`
--

DROP TABLE IF EXISTS `Teos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teos` (
  `idTeos` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(90) NOT NULL,
  `Julkaisuvuosi` year NOT NULL,
  PRIMARY KEY (`idTeos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teos`
--

LOCK TABLES `Teos` WRITE;
/*!40000 ALTER TABLE `Teos` DISABLE KEYS */;
INSERT INTO `Teos` VALUES (1,'The Dark Elf Trilogies: Homeland',1990),(2,'The Hobbit',1937),(3,'The Icewind Dale Trilogy: The Crystal Shard',1988);
/*!40000 ALTER TABLE `Teos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teos_Tekijä`
--

DROP TABLE IF EXISTS `Teos_Tekijä`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teos_Tekijä` (
  `idTeos` int NOT NULL,
  `idTekijä` int NOT NULL,
  KEY `fk_Teos_has_Tekijä_Tekijä1_idx` (`idTekijä`),
  KEY `fk_Teos_has_Tekijä_Teos_idx` (`idTeos`),
  CONSTRAINT `fk_Teos_has_Tekijä_Tekijä1` FOREIGN KEY (`idTekijä`) REFERENCES `Tekijä` (`idTekijä`),
  CONSTRAINT `fk_Teos_has_Tekijä_Teos` FOREIGN KEY (`idTeos`) REFERENCES `Teos` (`idTeos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teos_Tekijä`
--

LOCK TABLES `Teos_Tekijä` WRITE;
/*!40000 ALTER TABLE `Teos_Tekijä` DISABLE KEYS */;
INSERT INTO `Teos_Tekijä` VALUES (1,1),(2,2),(3,1);
/*!40000 ALTER TABLE `Teos_Tekijä` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `KaikkiTeoksetJaNiidenTekijät`
--

/*!50001 DROP VIEW IF EXISTS `KaikkiTeoksetJaNiidenTekijät`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Matti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `KaikkiTeoksetJaNiidenTekijät` AS select `Tekijä`.`Etunimi` AS `Etunimi`,`Tekijä`.`Sukunimi` AS `Sukunimi`,`te`.`Nimi` AS `Nimi`,`te`.`Julkaisuvuosi` AS `Julkaisuvuosi` from ((`Tekijä` join `Teos_Tekijä` `te_te` on((`Tekijä`.`idTekijä` = `te_te`.`idTekijä`))) join `Teos` `te` on((`te_te`.`idTeos` = `te`.`idTeos`))) */;
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

-- Dump completed on 2025-06-18 14:16:23
