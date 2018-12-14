CREATE DATABASE  IF NOT EXISTS `campo_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `campo_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: campo_db
-- ------------------------------------------------------
-- Server version	5.6.38-log

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
-- Table structure for table `campo`
--

DROP TABLE IF EXISTS `campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campo` (
  `idCampo` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `idEstadoCampo` int(11) NOT NULL,
  PRIMARY KEY (`idCampo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_Campo_EstadoCampo1_idx` (`idEstadoCampo`),
  CONSTRAINT `fk_Campo_EstadoCampo1` FOREIGN KEY (`idEstadoCampo`) REFERENCES `estadocampo` (`idEstadoCampo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campo`
--

LOCK TABLES `campo` WRITE;
/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` VALUES (1,'Las Lomas',1),(2,'Las  Lomas II',1);
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocampo`
--

DROP TABLE IF EXISTS `estadocampo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocampo` (
  `idEstadoCampo` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadoCampo`),
  UNIQUE KEY `estado_UNIQUE` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocampo`
--

LOCK TABLES `estadocampo` WRITE;
/*!40000 ALTER TABLE `estadocampo` DISABLE KEYS */;
INSERT INTO `estadocampo` VALUES (3,'Completamente Trabajado'),(1,'Creado'),(4,'En Desuso'),(2,'Parcialmente Trabajado');
/*!40000 ALTER TABLE `estadocampo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `superficie` int(11) NOT NULL,
  `idCampo` int(11) DEFAULT NULL,
  `idTipoDeSuelo` int(11) NOT NULL,
  PRIMARY KEY (`idLote`),
  KEY `fk_Lote_Campo_idx` (`idCampo`),
  KEY `fk_Lote_TipoDeSuelo1_idx` (`idTipoDeSuelo`),
  CONSTRAINT `fk_Lote_Campo` FOREIGN KEY (`idCampo`) REFERENCES `campo` (`idCampo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Lote_TipoDeSuelo1` FOREIGN KEY (`idTipoDeSuelo`) REFERENCES `tipodesuelo` (`idTipoDeSuelo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,1,30,1,1),(2,1,70,2,4),(3,2,10,2,2);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodesuelo`
--

DROP TABLE IF EXISTS `tipodesuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodesuelo` (
  `idTipoDeSuelo` int(11) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  PRIMARY KEY (`idTipoDeSuelo`),
  UNIQUE KEY `tipo_UNIQUE` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodesuelo`
--

LOCK TABLES `tipodesuelo` WRITE;
/*!40000 ALTER TABLE `tipodesuelo` DISABLE KEYS */;
INSERT INTO `tipodesuelo` VALUES (1,'I'),(2,'II'),(3,'III'),(4,'IV'),(5,'V');
/*!40000 ALTER TABLE `tipodesuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE USER 'adminCampos'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON campo_db.* TO 'adminCampos'@'localhost';
FLUSH PRIVILEGES;
-- Dump completed on 2018-12-13 23:49:06
