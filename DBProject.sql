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
  PRIMARY KEY (`ID_Klient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adresy`
--

LOCK TABLES `Adresy` WRITE;
/*!40000 ALTER TABLE `Adresy` DISABLE KEYS */;
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
  `data_dostawy` date DEFAULT NULL,
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
  PRIMARY KEY (`ID_Klient`),
  CONSTRAINT `Klient_ibfk_1` FOREIGN KEY (`ID_Klient`) REFERENCES `Adresy` (`ID_Klient`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Klient`
--

LOCK TABLES `Klient` WRITE;
/*!40000 ALTER TABLE `Klient` DISABLE KEYS */;
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
INSERT INTO `Produkty` VALUES (1,1,'Amarena',1.69,'dobre, tanie, wykwintne wino',1,12);
/*!40000 ALTER TABLE `Produkty` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tableProduktyTrigger1
  BEFORE INSERT ON Produkty
  FOR EACH ROW
BEGIN

IF (SELECT COUNT(*) AS total FROM Produkty WHERE nazwa = new.nazwa) > 0
THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'An duplicaste name error occurred';
END IF;

IF (SELECT COUNT(*) AS total FROM Produkty WHERE typ = new.typ) > 0
THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'An duplicaste type error occurred';
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER addNewProducent
BEFORE INSERT ON Produkty
FOR EACH ROW
  BEGIN
    DECLARE lookFor BOOLEAN;
    SET lookFor = (SELECT EXISTS(SELECT 1 FROM Producent WHERE Producent.ID_Producent = new.ID_Producent));
  IF lookFor = 0 THEN
    INSERT INTO Producent(ID_Producent,nazwa) VALUES (new.ID_Producent,NULL);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER addNewProduktType
BEFORE INSERT ON Produkty
FOR EACH ROW
  BEGIN
    DECLARE lookFor BOOLEAN;
    SET lookFor = (SELECT EXISTS(SELECT 1 FROM Typ WHERE Typ.ID_Typ = new.typ));
  IF lookFor = 0 THEN
    INSERT INTO Typ(ID_Typ,nazwa) VALUES (new.typ,NULL);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER addNewDostawca
BEFORE INSERT ON Produkty
FOR EACH ROW
  BEGIN
    DECLARE lookFor BOOLEAN;
    SET lookFor = (SELECT EXISTS(SELECT 1 FROM Typ WHERE Typ.ID_Typ = new.typ));
  IF lookFor = 0 THEN
    INSERT INTO Typ(ID_Typ,nazwa) VALUES (new.typ,NULL);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tableProduktyTrigger2
AFTER DELETE ON Produkty
FOR EACH ROW
  BEGIN
 IF old.ilosc <= 0
    THEN
    DELETE FROM Produkty WHERE Produkty.ilosc <= 0;
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Status_zamowienia`
--

DROP TABLE IF EXISTS `Status_zamowienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status_zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL,
  `data_zamowienia` date DEFAULT NULL,
  `status_zamowienia` enum('nieprzygotowany','przygotowany','wyslany') DEFAULT NULL,
  PRIMARY KEY (`ID_Zamowienia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status_zamowienia`
--

LOCK TABLES `Status_zamowienia` WRITE;
/*!40000 ALTER TABLE `Status_zamowienia` DISABLE KEYS */;
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
INSERT INTO `Typ` VALUES (1,NULL);
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
/*!40000 ALTER TABLE `Wysylka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zamowienia`
--

DROP TABLE IF EXISTS `Zamowienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL,
  `ID_Klient` int(11) NOT NULL,
  `ID_Platnosci` int(11) NOT NULL,
  `ID_Wysylki` int(11) NOT NULL,
  `data_zamowienia` date DEFAULT NULL,
  `ID_Produnkt` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `koszt` float NOT NULL,
  `platnosc` int(11) NOT NULL,
  `faktura` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Zamowienia`),
  KEY `ID_Wysylki` (`ID_Wysylki`),
  KEY `ID_Platnosci` (`ID_Platnosci`),
  KEY `ID_Klient` (`ID_Klient`),
  CONSTRAINT `Zamowienia_ibfk_1` FOREIGN KEY (`ID_Zamowienia`) REFERENCES `Status_zamowienia` (`ID_Zamowienia`) ON DELETE CASCADE,
  CONSTRAINT `Zamowienia_ibfk_2` FOREIGN KEY (`ID_Wysylki`) REFERENCES `Wysylka` (`ID_Wysylka`) ON DELETE CASCADE,
  CONSTRAINT `Zamowienia_ibfk_3` FOREIGN KEY (`ID_Platnosci`) REFERENCES `Platnosc` (`ID_Platnosc`) ON DELETE CASCADE,
  CONSTRAINT `Zamowienia_ibfk_4` FOREIGN KEY (`ID_Klient`) REFERENCES `Klient` (`ID_Klient`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zamowienia`
--

LOCK TABLES `Zamowienia` WRITE;
/*!40000 ALTER TABLE `Zamowienia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Zamowienia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tableZamowieniaTrigger1
  BEFORE INSERT ON Zamowienia
  FOR EACH ROW
BEGIN

IF new.ilosc > Produkty.ilosc
THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'An not enough products error occurred';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER addNewKlient
BEFORE INSERT ON Zamowienia
FOR EACH ROW
  BEGIN
    DECLARE lookFor BOOLEAN;
    SET lookFor = (SELECT EXISTS(SELECT 1 FROM Klient WHERE KLient.ID_Klient = new.ID_Klient));
  IF lookFor = 0 THEN
    INSERT INTO Klient(ID_Klient,imie,nazwisko,nazwa_firmy,numer_telefonu,NIP) VALUES (new.ID_Klient,NULL,NULL,NULL,NULL,NULL);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-10 14:27:30
