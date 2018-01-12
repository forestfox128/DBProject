-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: DBProject
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Adresy`
--

DROP TABLE IF EXISTS `Adresy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adresy` (
  `ID_Klient` int(11) NOT NULL,
  `ulica` varchar(40) DEFAULT NULL,
  `nr_domu` varchar(10) DEFAULT NULL,
  `miejscowosc` varchar(20) DEFAULT NULL,
  `kod_pocztowy` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_Klient`),
  CONSTRAINT `Adresy_ibfk_1` FOREIGN KEY (`ID_Klient`) REFERENCES `Klient` (`ID_Klient`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adresy`
--

LOCK TABLES `Adresy` WRITE;
/*!40000 ALTER TABLE `Adresy` DISABLE KEYS */;
INSERT INTO `Adresy` VALUES (1,'fff','333','ddd','222'),(2,'w','w','w','2'),(3,'a','a','a','2'),(4,'s','s','s','2'),(5,'w','w','w','w');
/*!40000 ALTER TABLE `Adresy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dostawa`
--

DROP TABLE IF EXISTS `Dostawa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dostawa` (
  `ID_Producent` int(11) NOT NULL,
  `data_dostawy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Producent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dostawa`
--

LOCK TABLES `Dostawa` WRITE;
/*!40000 ALTER TABLE `Dostawa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dostawa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Klient`
--

DROP TABLE IF EXISTS `Klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Klient` (
  `ID_Klient` int(11) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(40) DEFAULT NULL,
  `nazwa_firmy` varchar(40) DEFAULT NULL,
  `numer_telefonu` int(11) NOT NULL,
  `NIP` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Klient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Klient`
--

LOCK TABLES `Klient` WRITE;
/*!40000 ALTER TABLE `Klient` DISABLE KEYS */;
INSERT INTO `Klient` VALUES (1,'sss','sss','-',8888,'-'),(2,'s','s','s',4,'3'),(3,'a','a','a',2,'2'),(4,'q','q','q',22,'1'),(5,'s','s','s',3,'3');
/*!40000 ALTER TABLE `Klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Platnosc`
--

DROP TABLE IF EXISTS `Platnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Platnosc` (
  `ID_Platnosc` int(11) NOT NULL,
  `opis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Platnosc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Platnosc`
--

LOCK TABLES `Platnosc` WRITE;
/*!40000 ALTER TABLE `Platnosc` DISABLE KEYS */;
INSERT INTO `Platnosc` VALUES (1,'platnosc'),(2,'platnosc'),(3,'platnosc'),(4,'platnosc'),(5,'platnosc');
/*!40000 ALTER TABLE `Platnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producent`
--

DROP TABLE IF EXISTS `Producent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producent` (
  `ID_Producent` int(11) NOT NULL,
  `nazwa` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Producent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producent`
--

LOCK TABLES `Producent` WRITE;
/*!40000 ALTER TABLE `Producent` DISABLE KEYS */;
INSERT INTO `Producent` VALUES (1,NULL);
/*!40000 ALTER TABLE `Producent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produkty`
--

DROP TABLE IF EXISTS `Produkty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produkty` (
  `ID_Produkt` int(11) NOT NULL,
  `ID_Producent` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `cena` float NOT NULL,
  `opis` text,
  `typ` int(11) DEFAULT NULL,
  `ilosc` int(11) NOT NULL,
  PRIMARY KEY (`ID_Produkt`),
  KEY `ID_Producent` (`ID_Producent`),
  KEY `typ` (`typ`),
  CONSTRAINT `Produkty_ibfk_1` FOREIGN KEY (`ID_Producent`) REFERENCES `Producent` (`ID_Producent`) ON DELETE CASCADE,
  CONSTRAINT `Produkty_ibfk_2` FOREIGN KEY (`typ`) REFERENCES `Typ` (`ID_Typ`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produkty`
--

LOCK TABLES `Produkty` WRITE;
/*!40000 ALTER TABLE `Produkty` DISABLE KEYS */;
INSERT INTO `Produkty` VALUES (1,1,'Kustosz',1.69,'dobre, tanie, wykwintne piwo',5,12);
/*!40000 ALTER TABLE `Produkty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status_zamowienia`
--

DROP TABLE IF EXISTS `Status_zamowienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status_zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL,
  `data_zamowienia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_zamowienia` enum('nieprzygotowany','przygotowany','wyslany') DEFAULT NULL,
  PRIMARY KEY (`ID_Zamowienia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status_zamowienia`
--

LOCK TABLES `Status_zamowienia` WRITE;
/*!40000 ALTER TABLE `Status_zamowienia` DISABLE KEYS */;
INSERT INTO `Status_zamowienia` VALUES (1,'2018-01-12 18:31:16','nieprzygotowany'),(2,'2018-01-12 18:35:38','nieprzygotowany'),(3,'2018-01-12 18:37:01','nieprzygotowany'),(4,'2018-01-12 18:38:17','nieprzygotowany'),(5,'2018-01-12 18:39:29','nieprzygotowany');
/*!40000 ALTER TABLE `Status_zamowienia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Typ`
--

DROP TABLE IF EXISTS `Typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Typ` (
  `ID_Typ` int(11) NOT NULL,
  `nazwa` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Typ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Typ`
--

LOCK TABLES `Typ` WRITE;
/*!40000 ALTER TABLE `Typ` DISABLE KEYS */;
INSERT INTO `Typ` VALUES (1,NULL),(2,NULL),(5,NULL);
/*!40000 ALTER TABLE `Typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wysylka`
--

DROP TABLE IF EXISTS `Wysylka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wysylka` (
  `ID_Wysylka` int(11) NOT NULL,
  `koszt` float NOT NULL,
  `opis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Wysylka`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wysylka`
--

LOCK TABLES `Wysylka` WRITE;
/*!40000 ALTER TABLE `Wysylka` DISABLE KEYS */;
INSERT INTO `Wysylka` VALUES (1,9.5,'kurier'),(2,9.5,'kurier'),(3,9.5,'kurier'),(4,9.5,'kurier'),(5,9.5,'kurier');
/*!40000 ALTER TABLE `Wysylka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zamowienia`
--

DROP TABLE IF EXISTS `Zamowienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Klient` int(11) NOT NULL,
  `ID_Platnosci` int(11) NOT NULL,
  `ID_Wysylki` int(11) NOT NULL,
  `data_zamowienia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_Produnkt` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `koszt` float NOT NULL,
  `platnosc` int(11) NOT NULL,
  `faktura` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Zamowienia`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zamowienia`
--

LOCK TABLES `Zamowienia` WRITE;
/*!40000 ALTER TABLE `Zamowienia` DISABLE KEYS */;
INSERT INTO `Zamowienia` VALUES (1,1,1,1,'2018-01-12 18:31:16',1,2,3.69,1,0),(2,1,1,1,'2018-01-12 18:35:01',1,2,3.69,1,0),(3,2,1,1,'2018-01-12 18:35:12',1,2,3.69,1,0),(4,2,2,2,'2018-01-12 18:35:38',1,2,3.69,1,0),(5,3,3,3,'2018-01-12 18:37:01',1,2,3.69,1,0),(6,3,3,3,'2018-01-12 18:37:58',1,2,3.69,1,0),(7,4,4,4,'2018-01-12 18:38:17',1,2,3.69,1,0),(8,4,4,4,'2018-01-12 18:39:19',1,2,3.69,1,0),(9,5,5,5,'2018-01-12 18:39:29',1,2,3.69,1,0);
/*!40000 ALTER TABLE `Zamowienia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-12 20:08:13
