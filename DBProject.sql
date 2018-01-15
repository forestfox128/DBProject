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
INSERT INTO `Adresy` VALUES (2,'Sklodowskiej','46/3','Wroclaw','50369');
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
INSERT INTO `Klient` VALUES (2,'Maciej','Hajduk','BIURO KONSTRUKCYJNO-BUDOWLANE HAJDUK',732004772,'8941198576');
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
INSERT INTO `Platnosc` VALUES (0,'gotówka');
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
INSERT INTO `Producent` VALUES (1,'Bimbrownia Bialystok'),(2,'Polska Grupa Piwowarska'),(3,'Browar Namyslow'),(4,'Biedronka S.A.'),(5,'Franzua Sietoblo');
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
INSERT INTO `Produkty` VALUES (1,1,'Wodka',21.37,'Czysta, gesta i swieza.',1,412),(2,1,'Koniak',39.55,'Ukrainsko - Francuski winiak.',2,307),(3,2,'Kasztelan',3.29,'Browarnik dopilnowal i piwa nie spasteryzowal.',3,3439),(4,3,'Tequiller',2.55,'Piwo o smaku wodki z kuktasa.',3,242),(5,3,'Namyslow',2.99,'Miedzynarodowy jasny lager.',3,101),(6,4,'Amarena',4.55,'Wspanaly, niepowtarzalny smak.',4,2466),(7,5,'Shardone',48.99,'Wloskie wino z poludniowych stokow Toskanii.',4,356);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ProduktyT1
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ProduktyT3
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ProduktyT4
  BEFORE INSERT ON Produkty
  FOR EACH ROW
BEGIN

  DECLARE nameP VARCHAR(50);
  SET nameP = new.nazwa;
IF (SELECT COUNT(*) AS total FROM Produkty WHERE Produkty.ID_Produkt = nameP) > 0
THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'An duplicaste name error occurred';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ProduktyT
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
INSERT INTO `Status_zamowienia` VALUES (0,'2018-01-14 18:47:33','nieprzygotowany');
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
INSERT INTO `Typ` VALUES (1,'Wódki'),(2,'Koniaki'),(3,'Piwa'),(4,'Wina');
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
INSERT INTO `Wysylka` VALUES (0,9.5,'kurier');
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
  `data_zamowienia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_Produnkt` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `koszt` float NOT NULL,
  `faktura` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Zamowienia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zamowienia`
--

LOCK TABLES `Zamowienia` WRITE;
/*!40000 ALTER TABLE `Zamowienia` DISABLE KEYS */;
INSERT INTO `Zamowienia` VALUES (0,2,0,0,'2018-01-14 18:47:33',3,3,9.87,0);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ZamowieniaDel
AFTER DELETE ON Zamowienia
FOR EACH ROW
BEGIN
  DECLARE idWys INT;
  DECLARE idPlat INT;
  DECLARE idST INT;
  SET idWys = old.ID_Wysylki;

  SET idPlat = old.ID_Platnosci;

  SET idST = old.ID_Zamowienia;

  DELETE FROM Wysylka WHERE Wysylka.ID_Wysylka = idWys;

  DELETE FROM Platnosc WHERE Platnosc.ID_Platnosc = idPlat;

  DELETE FROM Status_zamowienia WHERE Status_zamowienia.ID_Zamowienia = idST;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'DBProject'
--
/*!50003 DROP FUNCTION IF EXISTS `giveNotSend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `giveNotSend`() RETURNS int(11)
BEGIN

    DECLARE counter INT;

    SET counter = (SELECT COUNT(*) FROM Status_zamowienia WHERE status_zamowienia = 'nieprzygotowany' OR status_zamowienia = 'przygotowany');
    RETURN (counter);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertAdres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAdres`(ID INT, street VARCHAR(40), hNumber VARCHAR(10), town VARCHAR(20), postCode INT)
BEGIN

    INSERT INTO `Adresy` (`ID_Klient`, `ulica`, `nr_domu`, `miejscowosc`,`kod_pocztowy`) VALUES
      (ID,street,hNumber,town,postCode);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertKlient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertKlient`(ID INT, name VARCHAR(20), surname VARCHAR(40), firma VARCHAR(40), telefon INT, nNIP INT)
BEGIN

    INSERT INTO `Klient` (`ID_Klient`, `imie`, `nazwisko`, `nazwa_firmy`,`numer_telefonu`, `NIP`) VALUES
      (ID,name,surname,firma,telefon,nNIP);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProducent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProducent`(IDpd INT,IDpr INT, pName VARCHAR(50), price FLOAT, descr TEXT, type INT, amount INT)
BEGIN

    INSERT INTO `Produkty` (`ID_Produkt`, `ID_Producent`, `nazwa`, `cena`,`opis`, `typ`,`ilosc`) VALUES
      (IDpd,IDpr,pName,price,descr,type,amount);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProdukt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProdukt`(IDp INT,name VARCHAR(30))
BEGIN

    INSERT INTO `Producent` ( `ID_Producent`, `nazwa`) VALUES
      (IDp,name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertZamowienia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertZamowienia`(IN IDk INT, IN IDprod INT, IN amount INT, IN sum FLOAT)
BEGIN

    DECLARE currentAmount INT;
    DECLARE id_zam INT;
    DECLARE id_wys INT;
    DECLARE id_pla INT;


    SET currentAmount = (SELECT Produkty.ilosc
                         FROM Produkty
                         WHERE Produkty.ID_Produkt = IDprod);

    SET id_zam = (SELECT MAX(Zamowienia.ID_Zamowienia) + 1
                  FROM Zamowienia);
    IF id_zam IS NULL
    THEN
      SET id_zam = 0; END IF;

    SET id_wys = (SELECT MAX(Zamowienia.ID_Zamowienia) + 1
                  FROM Zamowienia);
    IF id_wys IS NULL
    THEN
      SET id_wys = 0; END IF;

    SET id_pla = (SELECT MAX(Zamowienia.ID_Zamowienia) + 1
                  FROM Zamowienia);
    IF id_pla IS NULL
    THEN
      SET id_pla = 0; END IF;

    START TRANSACTION;

    INSERT INTO `Zamowienia` (`ID_Zamowienia`, `ID_Klient`, `ID_Platnosci`, `ID_Wysylki`, `ID_Produnkt`, `ilosc`, `koszt`, `faktura`)
    VALUES
      (id_zam, IDk, id_pla, id_wys, IDprod, amount, sum, FALSE);

    INSERT INTO `Wysylka` (`ID_Wysylka`, `koszt`, `opis`) VALUES
      (id_wys, 9.5, 'Poczta Polska');

    INSERT INTO `Platnosc` (`ID_Platnosc`, `opis`) VALUES
      (id_pla, 'przelew');

    INSERT INTO `Status_zamowienia` (`ID_Zamowienia`, `status_zamowienia`) VALUES
      (id_zam, 'nieprzygotowany');

    IF currentAmount < amount
    THEN
      ROLLBACK;
    ELSE
      COMMIT;
      UPDATE Produkty
      SET Produkty.ilosc = currentAmount - amount
      WHERE Produkty.ID_Produkt = IDprod;
    END IF;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateStatus_zamowienia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateStatus_zamowienia`(IDz INT, statusZ VARCHAR(20))
BEGIN

    UPDATE `Status_zamowienia` SET status_zamowienia = statusZ WHERE ID_Zamowienia = IDz;

END ;;
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

-- Dump completed on 2018-01-15 15:47:14
