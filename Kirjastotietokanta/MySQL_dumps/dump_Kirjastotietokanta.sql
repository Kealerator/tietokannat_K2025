-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
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
-- Dumping data for table `Asiakas`
--

LOCK TABLES `Asiakas` WRITE;
/*!40000 ALTER TABLE `Asiakas` DISABLE KEYS */;
INSERT INTO `Asiakas` VALUES (1,'Roope','Ankka','Rahasäiliö','lantti.roope@luukku.fi','00014756'),(2,'Aku','Ankka','Paratiisitie 13','a.ankka@outlook.com','00058754'),(3,'Mikki','Hiiri','Hiirentie 625','hiir.mik@icloud.com','00015975');
/*!40000 ALTER TABLE `Asiakas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Hylly`
--

LOCK TABLES `Hylly` WRITE;
/*!40000 ALTER TABLE `Hylly` DISABLE KEYS */;
INSERT INTO `Hylly` VALUES (4,1),(13,1);
/*!40000 ALTER TABLE `Hylly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Kirja`
--

LOCK TABLES `Kirja` WRITE;
/*!40000 ALTER TABLE `Kirja` DISABLE KEYS */;
INSERT INTO `Kirja` VALUES (1,2,'Fantasia','Englanti','2012-09-01','ISBN9780547928241',1,NULL),(2,3,'Fantasia','Englanti','1991-07-04','ISBN9780261102354',1,NULL),(4,4,'Lasten & Nuorten kaunokirjallisuus','Suomi','2024-08-09','ISBN9789522563477',1,NULL),(5,5,'Fantasia','Englanti','2007-04-01','ISBN9780261102361',1,4),(6,6,'Fantasia','Englanti','2007-04-01','ISBN9780261102378',1,4);
/*!40000 ALTER TABLE `Kirja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Lainaus`
--

LOCK TABLES `Lainaus` WRITE;
/*!40000 ALTER TABLE `Lainaus` DISABLE KEYS */;
INSERT INTO `Lainaus` VALUES (2,2,2,'2025-01-01 13:37:26','2025-02-01'),(3,3,2,'2025-06-27 11:13:44','2025-07-27'),(4,3,4,'2025-04-30 09:53:34','2025-04-30');
/*!40000 ALTER TABLE `Lainaus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Osasto`
--

LOCK TABLES `Osasto` WRITE;
/*!40000 ALTER TABLE `Osasto` DISABLE KEYS */;
INSERT INTO `Osasto` VALUES (1,'Alpha');
/*!40000 ALTER TABLE `Osasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Palautus`
--

LOCK TABLES `Palautus` WRITE;
/*!40000 ALTER TABLE `Palautus` DISABLE KEYS */;
INSERT INTO `Palautus` VALUES (1,2,'2025-02-01 14:20:08');
/*!40000 ALTER TABLE `Palautus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Tekijä`
--

LOCK TABLES `Tekijä` WRITE;
/*!40000 ALTER TABLE `Tekijä` DISABLE KEYS */;
INSERT INTO `Tekijä` VALUES (1,'J.R.R. Tolkien'),(2,'Sarah Courtauld'),(3,'Rosie Dickins');
/*!40000 ALTER TABLE `Tekijä` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Tekijä_has_Teos`
--

LOCK TABLES `Tekijä_has_Teos` WRITE;
/*!40000 ALTER TABLE `Tekijä_has_Teos` DISABLE KEYS */;
INSERT INTO `Tekijä_has_Teos` VALUES (1,2),(1,3),(2,4),(3,4),(1,5),(1,6);
/*!40000 ALTER TABLE `Tekijä_has_Teos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Teos`
--

LOCK TABLES `Teos` WRITE;
/*!40000 ALTER TABLE `Teos` DISABLE KEYS */;
INSERT INTO `Teos` VALUES (2,'The Hobbit, or There and Back Again',1937),(3,'The Fellowship of The Ring',1954),(4,'Lasten toivesatukirja',2024),(5,'The Two Towers',1954),(6,'The Return of The King',1955);
/*!40000 ALTER TABLE `Teos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-29  9:31:38
