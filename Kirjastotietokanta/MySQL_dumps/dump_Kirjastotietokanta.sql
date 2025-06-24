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
-- Table structure for table `Asiakas`
--

DROP TABLE IF EXISTS `Asiakas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asiakas` (
  `idAsiakas` int NOT NULL AUTO_INCREMENT,
  `Etunimi` varchar(45) DEFAULT NULL,
  `Sukunimi` varchar(45) DEFAULT NULL,
  `Osoite` varchar(90) DEFAULT NULL,
  `Sähköposti` varchar(90) DEFAULT NULL,
  `Korttinumero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAsiakas`),
  UNIQUE KEY `Korttinumero_UNIQUE` (`Korttinumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asiakas`
--

LOCK TABLES `Asiakas` WRITE;
/*!40000 ALTER TABLE `Asiakas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asiakas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hylly`
--

DROP TABLE IF EXISTS `Hylly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hylly` (
  `idHylly` int NOT NULL,
  `idOsasto` int NOT NULL,
  PRIMARY KEY (`idHylly`,`idOsasto`),
  KEY `fk_Hylly_Osasto1_idx` (`idOsasto`),
  CONSTRAINT `fk_Hylly_Osasto1` FOREIGN KEY (`idOsasto`) REFERENCES `Osasto` (`idOsasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hylly`
--

LOCK TABLES `Hylly` WRITE;
/*!40000 ALTER TABLE `Hylly` DISABLE KEYS */;
INSERT INTO `Hylly` VALUES (4,1);
/*!40000 ALTER TABLE `Hylly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kirja`
--

DROP TABLE IF EXISTS `Kirja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kirja` (
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
  CONSTRAINT `fk_Kirja_Hylly1` FOREIGN KEY (`idHylly`, `idOsasto`) REFERENCES `Hylly` (`idHylly`, `idOsasto`),
  CONSTRAINT `fk_Kirja_Teos1` FOREIGN KEY (`idTeos`) REFERENCES `Teos` (`idTeos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kirja`
--

LOCK TABLES `Kirja` WRITE;
/*!40000 ALTER TABLE `Kirja` DISABLE KEYS */;
INSERT INTO `Kirja` VALUES (1,2,'Fantasia','Englanti','2012-09-01','ISBN9780547928241',1,4),(2,3,'Fantasia','Englanti','1991-07-04','ISBN9780261102354',1,4);
/*!40000 ALTER TABLE `Kirja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lainaus`
--

DROP TABLE IF EXISTS `Lainaus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lainaus` (
  `idLainaus` int NOT NULL AUTO_INCREMENT,
  `idAsiakas` int NOT NULL,
  `idKirja` int NOT NULL,
  `Alku pvm` date DEFAULT NULL,
  `Loppu pvm` date DEFAULT NULL,
  PRIMARY KEY (`idLainaus`),
  KEY `fk_Lainaus_Kirja1_idx` (`idKirja`),
  KEY `fk_Lainaus_Asiakas1_idx` (`idAsiakas`),
  CONSTRAINT `fk_Lainaus_Asiakas1` FOREIGN KEY (`idAsiakas`) REFERENCES `Asiakas` (`idAsiakas`),
  CONSTRAINT `fk_Lainaus_Kirja1` FOREIGN KEY (`idKirja`) REFERENCES `Kirja` (`idKirja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lainaus`
--

LOCK TABLES `Lainaus` WRITE;
/*!40000 ALTER TABLE `Lainaus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lainaus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Osasto`
--

DROP TABLE IF EXISTS `Osasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Osasto` (
  `idOsasto` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(45) NOT NULL,
  PRIMARY KEY (`idOsasto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Osasto`
--

LOCK TABLES `Osasto` WRITE;
/*!40000 ALTER TABLE `Osasto` DISABLE KEYS */;
INSERT INTO `Osasto` VALUES (1,'Alpha');
/*!40000 ALTER TABLE `Osasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tekijä`
--

DROP TABLE IF EXISTS `Tekijä`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tekijä` (
  `idTekijä` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(120) NOT NULL,
  PRIMARY KEY (`idTekijä`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tekijä`
--

LOCK TABLES `Tekijä` WRITE;
/*!40000 ALTER TABLE `Tekijä` DISABLE KEYS */;
INSERT INTO `Tekijä` VALUES (1,'J.R.R. Tolkien');
/*!40000 ALTER TABLE `Tekijä` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tekijä_has_Teos`
--

DROP TABLE IF EXISTS `Tekijä_has_Teos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tekijä_has_Teos` (
  `idTekijä` int NOT NULL,
  `idTeos` int NOT NULL,
  PRIMARY KEY (`idTekijä`,`idTeos`),
  KEY `fk_Teos_has_Tekijä_Tekijä1_idx` (`idTekijä`),
  KEY `fk_Teos_has_Tekijä_Teos_idx` (`idTeos`),
  CONSTRAINT `fk_Teos_has_Tekijä_Tekijä1` FOREIGN KEY (`idTekijä`) REFERENCES `Tekijä` (`idTekijä`),
  CONSTRAINT `fk_Teos_has_Tekijä_Teos` FOREIGN KEY (`idTeos`) REFERENCES `Teos` (`idTeos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tekijä_has_Teos`
--

LOCK TABLES `Tekijä_has_Teos` WRITE;
/*!40000 ALTER TABLE `Tekijä_has_Teos` DISABLE KEYS */;
INSERT INTO `Tekijä_has_Teos` VALUES (1,2),(1,3);
/*!40000 ALTER TABLE `Tekijä_has_Teos` ENABLE KEYS */;
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
  `Julkaisuvuosi` year DEFAULT NULL,
  PRIMARY KEY (`idTeos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teos`
--

LOCK TABLES `Teos` WRITE;
/*!40000 ALTER TABLE `Teos` DISABLE KEYS */;
INSERT INTO `Teos` VALUES (2,'The Hobbit, or There and Back Again',1937),(3,'The Fellowship of The Ring',1954);
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

-- Dump completed on 2025-06-24 15:26:36
