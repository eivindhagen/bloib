-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: rwb
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.7

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
-- Table structure for table `demo_host_settings`
--

DROP TABLE IF EXISTS `demo_host_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_host_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_host_settings`
--

LOCK TABLES `demo_host_settings` WRITE;
/*!40000 ALTER TABLE `demo_host_settings` DISABLE KEYS */;
INSERT INTO `demo_host_settings` VALUES (1,'cron_rwb_root','/root/rwb_bot','2010-12-08 08:43:15','2010-12-08 08:43:15');
/*!40000 ALTER TABLE `demo_host_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_site_urls`
--

DROP TABLE IF EXISTS `demo_site_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_site_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_site_urls`
--

LOCK TABLES `demo_site_urls` WRITE;
/*!40000 ALTER TABLE `demo_site_urls` DISABLE KEYS */;
INSERT INTO `demo_site_urls` VALUES (1,'https://bloib.com/','2010-12-08 08:57:14','2010-12-08 08:57:14');
/*!40000 ALTER TABLE `demo_site_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,1,'Norman Hagen','Norman Hagen has spent years exploring the beautiful flora and fauna of Telemark, Norway. Along the way, he has taken hundreds, perhaps thousands, of photographs of various flowers, birds and whatever else worth photographing. This gallery is dedicated to only the photographs that have been published on other website, and in print media.','2010-12-31 11:32:33','2010-12-31 11:32:33');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `photo_url` text COLLATE utf8_unicode_ci,
  `page_url` text COLLATE utf8_unicode_ci,
  `publish` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,'Strandløk Allium vineale','Norsk Botanisk Forening TE Porsgrunn: Heistad. Foto: Norman Hagen 2002.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/allium_vineale_Norman_Hagen01.jpg','http://www.nhm.uio.no/botanisk/nbf/plantefoto/Allium_vineale.htm',1,'2010-12-31 11:33:29','2010-12-31 13:18:50'),(2,1,'Bred dunkjevle, Bredt dunkjevle, Dunkjevle.','Typha latifolia L.\r\n\r\nSYNONYM(S) : Typha elongata Pauquy, Typha gracilis Rafin., Typha major Curt., Typha media DC., nom. illeg.\r\n','http://www.nhm.uio.no/botanisk/nbf/plantefoto/typha_latifolia_Norman_Hagen01.jpg','http://www.plantnames.unimelb.edu.au/Sorting/Typha.html',1,'2010-12-31 11:52:11','2010-12-31 12:12:02'),(3,1,'Spisslønn Acer platanoides','TE Kragerø: Stavnes. Foto: Norman Hagen 2001.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen01.jpg','http://www.nhm.uio.no/botanisk/nbf/plantefoto/Acer_platanoides.htm',1,'2010-12-31 12:13:48','2010-12-31 12:51:48'),(4,1,'Spisslønn Acer platanoides','TE Skien: Gulset. Foto: Norman Hagen 2002.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen02.jpg','http://www.nhm.uio.no/botanisk/nbf/plantefoto/Acer_platanoides.htm',1,'2010-12-31 12:16:10','2010-12-31 12:50:57'),(5,1,'Spisslønn Acer platanoides','TE Skien: Gulset. Foto; Norman Hagen 2003.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen03.jpg','http://www.nhm.uio.no/botanisk/nbf/plantefoto/Acer_platanoides.htm',0,'2010-12-31 12:16:48','2010-12-31 12:51:15'),(6,1,'Spisslønn Acer platanoides','TE Skien: Gulset. Foto; Norman Hagen 2003.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen04.jpg','http://www.nhm.uio.no/botanisk/nbf/plantefoto/Acer_platanoides.htm',1,'2010-12-31 12:17:56','2010-12-31 12:51:27');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20101208075144'),('20101208081545'),('20101231085114'),('20101231085249'),('20101231102002');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-01  9:13:30
