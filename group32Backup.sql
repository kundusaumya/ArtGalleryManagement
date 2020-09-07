-- MySQL dump 10.17  Distrib 10.3.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: GROUP32
-- ------------------------------------------------------
-- Server version	10.3.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `GROUP32`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `GROUP32` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `GROUP32`;

--
-- Table structure for table `ADMIN`
--

DROP TABLE IF EXISTS `ADMIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN` (
  `ID` int(11) NOT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN`
--

LOCK TABLES `ADMIN` WRITE;
/*!40000 ALTER TABLE `ADMIN` DISABLE KEYS */;
INSERT INTO `ADMIN` VALUES (1,'DEFAULT','USER','user123');
/*!40000 ALTER TABLE `ADMIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AGENT`
--

DROP TABLE IF EXISTS `AGENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENT` (
  `AID` int(11) NOT NULL AUTO_INCREMENT,
  `AGNAME` varchar(70) NOT NULL,
  `AGEMAILID` varchar(90) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL DEFAULT 'user123',
  `AGPHONE` bigint(20) NOT NULL,
  `AGADDRESS` varchar(70) NOT NULL,
  `AGGENDER` enum('MALE','FEMALE') NOT NULL,
  PRIMARY KEY (`AID`),
  UNIQUE KEY `AGEMAILID` (`AGEMAILID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENT`
--

LOCK TABLES `AGENT` WRITE;
/*!40000 ALTER TABLE `AGENT` DISABLE KEYS */;
INSERT INTO `AGENT` VALUES (1,'Some Agent1','someagent1@example.com','user123',9830020322,'Some Address','MALE'),(2,'Some Agent 2','someagent2@example.com','user123',1234567890,'Some Address','MALE'),(3,'Hello World','helloworld@example.com','user123',9830012345,'Some Address','MALE');
/*!40000 ALTER TABLE `AGENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTIST`
--

DROP TABLE IF EXISTS `ARTIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTIST` (
  `ANAME` varchar(70) NOT NULL,
  `BIRTHPLACE` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `ARTSTYLE` varchar(40) NOT NULL,
  `ABOUT` text DEFAULT NULL,
  PRIMARY KEY (`ANAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTIST`
--

LOCK TABLES `ARTIST` WRITE;
/*!40000 ALTER TABLE `ARTIST` DISABLE KEYS */;
INSERT INTO `ARTIST` VALUES ('Claude Monet','France',85,'Painting','One of the finest Artist Ever Present in Spain'),('Jamini Roy','India',56,'Painting','One of the eminent artist of India who have brought a whole new art-style based on his painting.'),('Leornado Da Vinci','Portugeese',56,'Painting','One of the eminent Portugeese Artist known for painting'),('Michealangelo','Italy',86,'Painting , Sculpture','One of the finest atrist of Italy'),('Nandalal Bose','India',84,'Painting','One of the finest artist in India'),('Pablo Picaso','Spain',85,'Painting','One of the eminent aritst present in span.'),('Rabindranath Tagore','Kolkata',80,'Painting','One of the eminent Painter,Writer and Artist of India.'),('Raja Ravi Varma','India',58,'Painting','One of the famous artists of the time'),('Vincent Van Gogh','France',86,'Painting','One of the finest artist of France');
/*!40000 ALTER TABLE `ARTIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTWORK`
--

DROP TABLE IF EXISTS `ARTWORK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTWORK` (
  `ARTWORKID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(80) NOT NULL,
  `COST` int(11) NOT NULL,
  `YEAR` int(11) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `ANAME` varchar(70) NOT NULL,
  `ORDERID` int(11) DEFAULT NULL,
  `ARTWORKDESC` text DEFAULT NULL,
  PRIMARY KEY (`ARTWORKID`),
  KEY `ARTISTFK1` (`ANAME`),
  KEY `ORDERFK1` (`ORDERID`),
  CONSTRAINT `ARTISTFK1` FOREIGN KEY (`ANAME`) REFERENCES `ARTIST` (`ANAME`),
  CONSTRAINT `ORDERFK1` FOREIGN KEY (`ORDERID`) REFERENCES `ORDERS` (`ORDERID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTWORK`
--

LOCK TABLES `ARTWORK` WRITE;
/*!40000 ALTER TABLE `ARTWORK` DISABLE KEYS */;
INSERT INTO `ARTWORK` VALUES (2,'Bride and the two companion',15600,1971,'Painting','Jamini Roy',3,'One of the eminent artworks of India'),(3,'Monalisa',89000,1961,'Painting','Leornado Da Vinci',2,'One of the world famous art-work'),(4,'A new Artwork',15600,2019,'Painting','Michealangelo',4,'A very Nice Artwork'),(5,'Beneras Ghat',15600,1921,'Painting','Jamini Roy',13,'A paitning of the Beneras Ghat Composed by Jamini Roy'),(6,'Gopini',6500,1921,'Painting','Jamini Roy',17,'One of the finest work of Jamini Roy'),(7,'Dual Cats with One Crayfish',1700,1950,'Painting','Jamini Roy',7,'An Artwork'),(8,'Krishna Jasoda',17500,1950,'Painting','Jamini Roy',13,'Jamini Roys Own Style'),(9,'Fawn',176000,1945,'Painting','Jamini Roy',6,'A new artwork'),(10,'Landscape',1700,1945,'Painting','Rabindranath Tagore',NULL,'A landscape by Rabindranath Tagore'),(11,'Womans Face',15600,1931,'Painting','Rabindranath Tagore',14,'One of the portrait'),(12,'Dancing Woman',17600,1940,'Painting','Rabindranath Tagore',17,'One of the best artworks done by Tagore'),(13,'Head Study',1600,1929,'Painting','Rabindranath Tagore',12,'A modern Artwork'),(14,'New Clouds',16000,1937,'Painting','Nandalal Bose',5,'One of the finest artwork drawn by Nandalal Bose'),(15,'Darjelling and the fog',17600,1940,'Painting','Nandalal Bose',13,'One of the finest Artworks by Nandalal Bose'),(16,'Floating a Canoe',16500,1937,'Painting','Nandalal Bose',15,'One of the finest Artwork of Nandalal Bose'),(17,'Tiller of the Soil',15600,1938,'Painting','Nandalal Bose',17,'One of the finest Works of Nandalal Bose'),(18,'Cotton Spinning',15600,1937,'Painting','Nandalal Bose',5,'A new type of artwork'),(19,'The Last Supper',16000,1498,'Painting','Leornado Da Vinci',NULL,'One of the finest artwork of Leornado Da Vinci'),(20,'Salvator Mundi',16000,1500,'Painting','Leornado Da Vinci',10,'A new-modern style artwork'),(21,'Potrait of a Man in Red Chalk',17000,1512,'Painting','Leornado Da Vinci',14,'One of the new artwork'),(22,'The Battle of Angihiari',17000,1505,'Painting','Leornado Da Vinci',12,'One of the new artwork created by Da Vinci'),(23,'The Baptism of Christ',65000,1475,'Painting','Leornado Da Vinci',11,'Some of the new artwork'),(24,'La belle ferronniere',15600,1490,'Painting','Leornado Da Vinci',NULL,'A new type of artwork'),(25,'Portrait Of A Musician',156000,1490,'A New Type of Artwork','Leornado Da Vinci',15,'One of the new Artwork'),(26,'Guernica',69000,1937,'Painting','Pablo Picaso',8,'One of the new artwork'),(27,'David',65900,1504,'Sculpture','Michealangelo',16,'One of the new Artwork'),(28,'Pieta',56000,1499,'Sculpture','Michealangelo',14,'One of the new artwork by Michealangelo'),(29,'The Last Judgement',16000,1541,'Painting','Michealangelo',10,'One of the new Artwork'),(30,'Brutus',65000,1538,'Painting','Michealangelo',NULL,'One of the new artwork'),(31,'Hercules',19600,1515,'Painting','Michealangelo',9,'One of the new artwork'),(32,'Shakuntala',65000,1870,'Painting','Raja Ravi Varma',NULL,'A new artwork'),(33,'Galaxy Of Musicians',17000,1889,'Painting','Raja Ravi Varma',NULL,'A new type of artwork'),(34,'Stolen Interview',25000,1906,'Painting','Raja Ravi Varma',11,'A new artwork'),(35,'Decking the Bride',18000,1890,'Painting','Raja Ravi Varma',15,'A new artwork'),(36,'Dhruv Narayan',56000,1890,'Painting','Raja Ravi Varma',10,'A new artwork created'),(37,'Maharani Lakshmi Bai',15000,1890,'Painting','Raja Ravi Varma',NULL,'Potrait of Maharani Lakshmi Bai'),(38,'Radha and Krishna',15600,1900,'Painting','Raja Ravi Varma',NULL,'A new type of Painting'),(39,'Sarangiwala',1500,1937,'Painting','Nandalal Bose',18,'One of the artwork of Nandalal Bose'),(40,'Chrysanthemum with a Green Bird',23000,1937,'Painting','Nandalal Bose',NULL,'Painting'),(41,'Ravana Carrying Off Sita And Opposed By Jatayu',16000,1980,'Painting','Raja Ravi Varma',14,'One of the famous scenes of Ramayana depicted by the painter');
/*!40000 ALTER TABLE `ARTWORK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTWORKBELONGS`
--

DROP TABLE IF EXISTS `ARTWORKBELONGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTWORKBELONGS` (
  `ARTWORKID` int(11) NOT NULL,
  `GROUPNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ARTWORKID`,`GROUPNAME`),
  KEY `GROUPFK1` (`GROUPNAME`),
  CONSTRAINT `ARTWORKFK1` FOREIGN KEY (`ARTWORKID`) REFERENCES `ARTWORK` (`ARTWORKID`),
  CONSTRAINT `GROUPFK1` FOREIGN KEY (`GROUPNAME`) REFERENCES `GROUPS` (`GROUPNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTWORKBELONGS`
--

LOCK TABLES `ARTWORKBELONGS` WRITE;
/*!40000 ALTER TABLE `ARTWORKBELONGS` DISABLE KEYS */;
INSERT INTO `ARTWORKBELONGS` VALUES (2,'Retro'),(3,'Retro'),(4,'Pop-style'),(4,'Retro'),(5,'Landscapes'),(6,'Modern Art'),(7,'Contemporary Style'),(8,'Contemporary Style'),(8,'Retro'),(9,'Contemporary Style'),(10,'Landscapes'),(11,'Modern Art'),(11,'Portrait'),(12,'Retro'),(13,'Modern Art'),(14,'Modern Art'),(15,'Landscapes'),(16,'Contemporary Style'),(16,'Modern Art'),(17,'Modern Art'),(18,'Contemporary Style'),(19,'Renaissance'),(20,'Contemporary Style'),(20,'Modern Art'),(21,'Renaissance'),(22,'Portrait'),(22,'Renaissance'),(23,'Renaissance'),(24,'Renaissance'),(25,'Portrait'),(26,'Contemporary Style'),(26,'Modern Art'),(27,'Renaissance'),(28,'Contemporary Style'),(28,'Renaissance'),(29,'Renaissance'),(30,'Renaissance'),(31,'Renaissance'),(32,'Contemporary Style'),(33,'Contemporary Style'),(33,'Renaissance'),(34,'Modern Art'),(35,'Modern Art'),(35,'Pop-style'),(35,'Retro'),(36,'Retro'),(37,'Portrait'),(38,'Contemporary Style'),(38,'Pop-style'),(38,'Retro'),(39,'Retro'),(40,'Retro'),(41,'Contemporary Style'),(41,'Retro');
/*!40000 ALTER TABLE `ARTWORKBELONGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTFACINATES`
--

DROP TABLE IF EXISTS `CUSTFACINATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTFACINATES` (
  `CNAME` varchar(70) NOT NULL,
  `GROUPNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`CNAME`,`GROUPNAME`),
  KEY `GROUPFK2` (`GROUPNAME`),
  CONSTRAINT `CUSTOMERFK2` FOREIGN KEY (`CNAME`) REFERENCES `CUSTOMER` (`CNAME`),
  CONSTRAINT `GROUPFK2` FOREIGN KEY (`GROUPNAME`) REFERENCES `GROUPS` (`GROUPNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTFACINATES`
--

LOCK TABLES `CUSTFACINATES` WRITE;
/*!40000 ALTER TABLE `CUSTFACINATES` DISABLE KEYS */;
INSERT INTO `CUSTFACINATES` VALUES ('A New Name','Contemporary Style'),('A New Name','Landscapes'),('A New Name','Portrait'),('A New Name','Renaissance'),('A New Name','Retro'),('Hello','Contemporary Style'),('Hello','Modern Art'),('Hello','Renaissance'),('Hello','Retro'),('Smith Williams','Contemporary Style'),('Smith Williams','Modern Art'),('Smith Williams','Pop-style'),('Smith Williams','Renaissance'),('Test User','Pop-style'),('Test User','Retro');
/*!40000 ALTER TABLE `CUSTFACINATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTLIKES`
--

DROP TABLE IF EXISTS `CUSTLIKES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTLIKES` (
  `CNAME` varchar(70) NOT NULL,
  `ANAME` varchar(70) NOT NULL,
  PRIMARY KEY (`CNAME`,`ANAME`),
  KEY `ARTISTFK2` (`ANAME`),
  CONSTRAINT `ARTISTFK2` FOREIGN KEY (`ANAME`) REFERENCES `ARTIST` (`ANAME`),
  CONSTRAINT `CUSTOMERFK1` FOREIGN KEY (`CNAME`) REFERENCES `CUSTOMER` (`CNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTLIKES`
--

LOCK TABLES `CUSTLIKES` WRITE;
/*!40000 ALTER TABLE `CUSTLIKES` DISABLE KEYS */;
INSERT INTO `CUSTLIKES` VALUES ('A New Name','Claude Monet'),('A New Name','Jamini Roy'),('A New Name','Nandalal Bose'),('A New Name','Pablo Picaso'),('A New Name','Rabindranath Tagore'),('A New Name','Vincent Van Gogh'),('Hello','Claude Monet'),('Hello','Michealangelo'),('Hello','Pablo Picaso'),('Smith Williams','Claude Monet'),('Smith Williams','Jamini Roy'),('Smith Williams','Michealangelo'),('Test User','Claude Monet'),('Test User','Jamini Roy'),('Test User','Leornado Da Vinci');
/*!40000 ALTER TABLE `CUSTLIKES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CNAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `CPHONE` bigint(20) NOT NULL,
  `CEMAILID` varchar(90) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL,
  PRIMARY KEY (`CNAME`),
  UNIQUE KEY `CPHONE` (`CPHONE`),
  UNIQUE KEY `CEMAILID` (`CEMAILID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES ('A New Name','Some New Address',9830012346,'anewname@example.com','somepassword123'),('Hello','Some New Address',9830012347,'somemailid3@example.com','somepassword123'),('Smith Williams','Some Address',6500112345,'swilliam@example.com','usersmith123'),('Test User','Some Address',1234567891,'somemailid@example.com','user123');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUPS`
--

DROP TABLE IF EXISTS `GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUPS` (
  `GROUPNAME` varchar(50) NOT NULL,
  `GROUPDESC` tinytext DEFAULT NULL,
  PRIMARY KEY (`GROUPNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUPS`
--

LOCK TABLES `GROUPS` WRITE;
/*!40000 ALTER TABLE `GROUPS` DISABLE KEYS */;
INSERT INTO `GROUPS` VALUES ('Contemporary Style','One of the new Styles'),('Landscapes','Scenaries of places'),('Modern Art','Artworks having deeper Meanings'),('Pop-style','Art Style of the Pop-Culture'),('Portrait','Skectches of faces of Humans'),('Renaissance','Renaissance was a period in europian History marking transition for the Middle Ages to the Modernity. The artforms created in this time was more real life than the time previous to it.'),('Retro','Artworks of Old Style');
/*!40000 ALTER TABLE `GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINEORDERS`
--

DROP TABLE IF EXISTS `OFFLINEORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINEORDERS` (
  `ORDERID` int(11) NOT NULL,
  `AID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDERID`),
  KEY `AGENTFK` (`AID`),
  CONSTRAINT `AGENTFK` FOREIGN KEY (`AID`) REFERENCES `AGENT` (`AID`),
  CONSTRAINT `ORDERFK2` FOREIGN KEY (`ORDERID`) REFERENCES `ORDERS` (`ORDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINEORDERS`
--

LOCK TABLES `OFFLINEORDERS` WRITE;
/*!40000 ALTER TABLE `OFFLINEORDERS` DISABLE KEYS */;
INSERT INTO `OFFLINEORDERS` VALUES (7,1),(8,1),(10,1),(11,1),(12,2),(14,2),(16,3),(18,3);
/*!40000 ALTER TABLE `OFFLINEORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ORDERID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERTYPE` enum('ONLINE','OFFLINE') NOT NULL,
  `PAYMENTMODE` enum('CASH','CARD') NOT NULL,
  `ORDERAMOUNT` int(11) NOT NULL,
  `ORDERDATEANDTIME` datetime NOT NULL DEFAULT current_timestamp(),
  `PAYMENTDATEANDTIME` datetime NOT NULL DEFAULT current_timestamp(),
  `CNAME` varchar(70) NOT NULL,
  PRIMARY KEY (`ORDERID`),
  KEY `CUSTOMERFK3` (`CNAME`),
  CONSTRAINT `CUSTOMERFK3` FOREIGN KEY (`CNAME`) REFERENCES `CUSTOMER` (`CNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (2,'ONLINE','CASH',89000,'2020-01-08 18:48:28','2020-01-08 18:48:28','Test User'),(3,'ONLINE','CASH',15600,'2020-01-08 18:50:23','2020-01-08 18:50:23','Test User'),(4,'ONLINE','CARD',15600,'2020-01-08 18:53:24','2020-01-08 18:53:24','Test User'),(5,'ONLINE','CARD',31600,'2020-01-09 22:10:11','2020-01-09 22:10:11','Test User'),(6,'ONLINE','CASH',176000,'2020-01-09 22:28:43','2020-01-09 22:28:43','Test User'),(7,'OFFLINE','CARD',1700,'2020-01-10 12:04:50','2020-01-10 12:04:50','Test User'),(8,'OFFLINE','CARD',69000,'2020-01-10 12:22:36','2020-01-10 12:22:36','Test User'),(9,'ONLINE','CASH',19600,'2020-01-10 12:47:31','2020-01-10 12:47:31','Hello'),(10,'OFFLINE','CASH',88000,'2020-01-11 21:39:18','2020-01-11 21:39:18','Test User'),(11,'OFFLINE','CASH',90000,'2020-01-12 16:29:49','2020-01-12 16:29:49','Smith Williams'),(12,'OFFLINE','CASH',18600,'2020-01-13 07:07:08','2020-01-13 07:07:08','Smith Williams'),(13,'ONLINE','CARD',50700,'2020-01-17 11:56:10','2020-01-17 11:56:10','Smith Williams'),(14,'OFFLINE','CARD',104600,'2020-01-17 12:01:12','2020-01-17 12:01:12','Smith Williams'),(15,'ONLINE','CARD',190500,'2020-01-17 12:10:31','2020-01-17 12:10:31','Hello'),(16,'OFFLINE','CARD',65900,'2020-01-17 12:14:08','2020-01-17 12:14:08','Hello'),(17,'ONLINE','CARD',39700,'2020-01-17 22:41:17','2020-01-17 22:41:17','Test User'),(18,'OFFLINE','CARD',1500,'2020-01-18 14:00:45','2020-01-18 14:00:45','Smith Williams');
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERSPAIDONCARD`
--

DROP TABLE IF EXISTS `ORDERSPAIDONCARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERSPAIDONCARD` (
  `ORDERID` int(11) NOT NULL,
  `CARDID` bigint(20) NOT NULL,
  `CARDVENDOR` varchar(30) NOT NULL,
  `CARDTYPE` enum('CREDIT','DEBIT') NOT NULL,
  PRIMARY KEY (`ORDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERSPAIDONCARD`
--

LOCK TABLES `ORDERSPAIDONCARD` WRITE;
/*!40000 ALTER TABLE `ORDERSPAIDONCARD` DISABLE KEYS */;
INSERT INTO `ORDERSPAIDONCARD` VALUES (4,1560112144351212,'Visa','CREDIT'),(5,1234567890123456,'Visa','DEBIT'),(7,1234567890123456,'Rupay','CREDIT'),(8,1234567890123456,'Rupay','DEBIT'),(13,1234567890123456,'Master Card','CREDIT'),(14,9876543210123456,'Visa','CREDIT'),(15,983002032212345,'Master Card','DEBIT'),(16,1234567890123456,'Rupay','CREDIT'),(17,1234567890123456,'Visa','CREDIT'),(18,1234567890123456,'Visa','CREDIT');
/*!40000 ALTER TABLE `ORDERSPAIDONCARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSIONS`
--

DROP TABLE IF EXISTS `PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSIONS` (
  `ROLE` varchar(10) NOT NULL,
  `ACCESS` varchar(200) NOT NULL,
  `LASTCHANGE` datetime NOT NULL,
  PRIMARY KEY (`ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSIONS`
--

LOCK TABLES `PERMISSIONS` WRITE;
/*!40000 ALTER TABLE `PERMISSIONS` DISABLE KEYS */;
INSERT INTO `PERMISSIONS` VALUES ('AGENT','a:2:{s:12:\"viewArtWorks\";b:1;s:10:\"viewOrders\";b:1;}','2020-03-10 21:32:51'),('CUSTOMER','a:2:{s:12:\"viewArtWorks\";b:1;s:10:\"viewOrders\";b:1;}','2020-01-13 07:32:21');
/*!40000 ALTER TABLE `PERMISSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `TOTALTRANSACTIONS`
--

DROP TABLE IF EXISTS `TOTALTRANSACTIONS`;
/*!50001 DROP VIEW IF EXISTS `TOTALTRANSACTIONS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TOTALTRANSACTIONS` (
  `CNAME` tinyint NOT NULL,
  `TOTALAMTSPENT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `GROUP32`
--

USE `GROUP32`;

--
-- Final view structure for view `TOTALTRANSACTIONS`
--

/*!50001 DROP TABLE IF EXISTS `TOTALTRANSACTIONS`*/;
/*!50001 DROP VIEW IF EXISTS `TOTALTRANSACTIONS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TOTALTRANSACTIONS` AS select `ORDERS`.`CNAME` AS `CNAME`,sum(`ORDERS`.`ORDERAMOUNT`) AS `TOTALAMTSPENT` from `ORDERS` group by `ORDERS`.`CNAME` */;
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

-- Dump completed on 2020-08-21 14:03:58
