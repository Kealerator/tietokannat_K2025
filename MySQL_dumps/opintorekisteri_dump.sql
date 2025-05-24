-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (x86_64)
--
-- Host: localhost    Database: Opintorekisteri
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `arvosana` enum('0','1','2','3','4','5','S','H','K') COLLATE utf16_swedish_ci DEFAULT NULL,
  `student_id` int NOT NULL,
  `kurssi_id` int NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `kurssi_id` (`kurssi_id`),
  CONSTRAINT `arviointi_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `opiskelija` (`student_id`),
  CONSTRAINT `arviointi_ibfk_2` FOREIGN KEY (`kurssi_id`) REFERENCES `Opintojakso` (`kurssi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arviointi`
--

LOCK TABLES `Arviointi` WRITE;
/*!40000 ALTER TABLE `Arviointi` DISABLE KEYS */;
INSERT INTO `Arviointi` VALUES ('3',4,1),('4',1,1),('4',2,1),('4',3,1),('3',5,1),('3',3,3),('2',1,2),('4',3,5);
/*!40000 ALTER TABLE `Arviointi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Opintojakso`
--

DROP TABLE IF EXISTS `Opintojakso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opintojakso` (
  `kurssin_nimi` varchar(250) COLLATE utf16_swedish_ci DEFAULT NULL,
  `laajuus_op` tinyint unsigned DEFAULT NULL,
  `kurssi_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`kurssi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opintojakso`
--

LOCK TABLES `Opintojakso` WRITE;
/*!40000 ALTER TABLE `Opintojakso` DISABLE KEYS */;
INSERT INTO `Opintojakso` VALUES ('Matematiikan perusteet 1',10,1),('Matematiikan perusteet 2',10,2),('Sähkötyöturvallisuus 101',10,3),('Eettinen työosaaminen',6,4),('Alla hejsån på Svenska!',5,5);
/*!40000 ALTER TABLE `Opintojakso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Opiskelija`
--

DROP TABLE IF EXISTS `Opiskelija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opiskelija` (
  `etunimi` varchar(250) COLLATE utf16_swedish_ci DEFAULT NULL,
  `sukunimi` varchar(250) COLLATE utf16_swedish_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf16_swedish_ci DEFAULT NULL,
  `student_id` int NOT NULL AUTO_INCREMENT,
  `Ryhmätunnus` varchar(6) COLLATE utf16_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opiskelija`
--

LOCK TABLES `Opiskelija` WRITE;
/*!40000 ALTER TABLE `Opiskelija` DISABLE KEYS */;
INSERT INTO `Opiskelija` VALUES ('Matti','Mainio','ma.mai97@gmail.com',1,'MTVT25'),('Aku','Ankka','373.aku.ank373@luukku.com',2,'ATVT23'),('Hannu','Hanhi','neliapila42@yahoo.com',3,'ATVT23'),('Mikko','Mallikas','MalliMikko.kas421@outlook.com',4,'MTVT25'),('Otso','Åkerman','akertso87@hotmail.com',5,'MTVT25'),('Iines','Ankka','iinuliinu123@hotmail.com',6,'MTVT25'),('Pelle','Peloton','p.p.peloton@outlook.com',7,'ATVT23'),('Kroisos','Pennonen','sosiKroi2@luukku.com',8,'ATVT23');
/*!40000 ALTER TABLE `Opiskelija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24 12:00:59
