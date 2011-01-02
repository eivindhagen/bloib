-- MySQL dump 10.13  Distrib 5.1.52, for apple-darwin10.3.0 (i386)
--
-- Host: localhost    Database: rwb
-- ------------------------------------------------------
-- Server version	5.1.52

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
INSERT INTO `galleries` VALUES (1,1,'Norman Hagen','Norman Hagen has spent years exploring the beautiful flora and fauna of Telemark, Norway. Along the way, he has taken hundreds, perhaps thousands, of photographs of various flowers, birds and whatever else worth photographing. This gallery is dedicated to only the photographs that have been published on other websites, and in print media.','2010-12-31 11:32:33','2011-01-01 10:53:47');
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `webpage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,'Strandløk Allium vineale','Norsk Botanisk Forening TE Porsgrunn: Heistad. Foto: Norman Hagen 2002.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/allium_vineale_Norman_Hagen01.jpg','2010-12-31 11:33:29','2011-01-01 07:22:37',1),(2,1,'Bred dunkjevle, Bredt dunkjevle, Dunkjevle.','Typha latifolia L.\r\n\r\nSYNONYM(S) : Typha elongata Pauquy, Typha gracilis Rafin., Typha major Curt., Typha media DC., nom. illeg.\r\n','http://www.nhm.uio.no/botanisk/nbf/plantefoto/typha_latifolia_Norman_Hagen01.jpg','2010-12-31 11:52:11','2011-01-01 09:21:28',2),(3,1,'Spisslønn Acer platanoides','TE Kragerø: Stavnes. Foto: Norman Hagen 2001.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen01.jpg','2010-12-31 12:13:48','2011-01-01 09:29:58',3),(4,1,'Spisslønn Acer platanoides','TE Skien: Gulset. Foto: Norman Hagen 2002.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen02.jpg','2010-12-31 12:16:10','2011-01-01 09:31:58',3),(5,1,'Spisslønn Acer platanoides','TE Skien: Gulset. Foto; Norman Hagen 2003.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen03.jpg','2010-12-31 12:16:48','2011-01-01 09:36:22',3),(6,1,'Spisslønn Acer platanoides','TE Skien: Gulset. Foto; Norman Hagen 2003.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/acer_platanoides_Norman_Hagen04.jpg','2010-12-31 12:17:56','2011-01-01 09:36:40',3),(7,1,'Gjeldkarve','','http://www.kristvi.net/flora/G/gjeldkarve1_nh.jpg','2011-01-02 07:21:53','2011-01-02 07:24:06',7),(12,1,'','','http://www.kristvi.net/flora/B/buefrytle2_nh.JPG','2011-01-02 08:13:27','2011-01-02 08:13:27',9),(13,NULL,'','','http://www.kristvi.net/flora/B/buefrytle1_nh.JPG','2011-01-02 08:14:38','2011-01-02 08:14:38',9),(14,1,'Bergveronika','','http://www.kristvi.net/flora/B/bergveronika1_nh.JPG','2011-01-02 08:15:52','2011-01-02 08:31:20',10),(15,1,'Bergveronika','','http://www.kristvi.net/flora/B/bergveronika2_nh.JPG','2011-01-02 08:30:43','2011-01-02 08:32:43',10),(16,1,'Blokkebær/ Skinntryte','','http://www.kristvi.net/flora/B/blokkebar1_nh.JPG','2011-01-02 08:48:56','2011-01-02 08:48:56',11),(17,1,'','','http://www.kristvi.net/flora/T/tuearve1_nh.jpg','2011-01-02 08:53:00','2011-01-02 08:53:00',12),(18,1,'','','http://www.kristvi.net/flora/S/setermjelt1_nh.jpg','2011-01-02 08:55:01','2011-01-02 08:55:01',13),(19,1,'','','http://www.kristvi.net/flora/S/setermjelt2_nh.jpg','2011-01-02 08:55:32','2011-01-02 08:55:32',13),(20,1,'','','http://www.kristvi.net/flora/K/knopparve1_nh.jpg','2011-01-02 08:58:24','2011-01-02 08:58:24',14),(21,1,'','','http://www.kristvi.net/flora/B/blaarapp2_nh.JPG','2011-01-02 09:13:23','2011-01-02 09:13:23',15),(22,1,'Nymphaea Alba','','http://gentedelnovecento.ilcannocchiale.it/mediamanager/sys.user/26134/nymphaea_alba_Norman_Hagen01.jpg','2011-01-02 09:25:38','2011-01-02 09:26:46',16),(23,1,'','','http://www.kristvi.com/sf/pieris_brassicae_stor_kaalsommerfugl_larve_nh.jpg','2011-01-02 09:30:41','2011-01-02 09:30:41',17),(24,1,'','','http://www.kristvi.com/sf/boloria_selene_brunflekket_perlemorvinge_nh.jpg','2011-01-02 09:31:49','2011-01-02 09:31:49',18),(25,1,'Juncus castaneus','','http://www.arcticatlas.org/photos/pltspecies/photos/fullsize/juca6_4','2011-01-02 09:34:47','2011-01-02 09:34:47',19),(26,1,'Asian Brown Flycatcher','','http://www.vulkaner.no/n/birds/fluesnapp/pics/brunfluesnapper1_nh.jpg','2011-01-02 09:37:27','2011-01-02 09:37:27',20),(27,1,'Crested Tit, Parus cristatus','','http://www.vulkaner.no/n/birds/meiser/pics/topp-nh.jpg','2011-01-02 09:38:30','2011-01-02 09:38:30',21),(28,1,'Origanum vulgare','','http://api.ning.com/files/7SvvSNVY5*6zQQS0Llw8RLsrMJ0PAkrLUtxQ-X3PybdsTfjmieQHdcp6iwacz7HNov22-5QguQ5jleqUc-lBLmVAqjAZbgbO/origanum_vulgare_Norman_Hagen01.jpg?width=721','2011-01-02 09:41:21','2011-01-02 09:41:21',22),(29,1,'Tilia cordata','','http://www.vialattea.net/spaw/image/biologia/Agosto05/tilia_cordata_Norman_Hagen02.jpg','2011-01-02 09:44:02','2011-01-02 09:44:02',23),(30,1,'Pinus sylvestris','','http://stiklestad.g-skole.no/Sissel/traer/Pinus_sylvestris_Norman_Hagen01.jpg','2011-01-02 09:47:46','2011-01-02 09:47:46',24),(31,1,'Pinus sylvestris','','http://stiklestad.g-skole.no/Sissel/traer/Pinus_sylvestris_Norman_Hagen02.jpg','2011-01-02 09:48:11','2011-01-02 09:48:11',24),(32,1,'Pinus sylvestris','','http://stiklestad.g-skole.no/Sissel/traer/Pinus_sylvestris_Norman_Hagen03.jpg','2011-01-02 09:48:30','2011-01-02 09:48:30',24),(33,1,'Narrmarihand, Anacamptis morio','','http://botanikk.no/Narrmarihand/Narrmarihand_lokaliteter.gen/morio4s576x844.jpg','2011-01-02 09:52:16','2011-01-02 09:52:16',25),(34,1,'Prunus Padus','','http://www.rios-galegos.com/cireix11.jpg','2011-01-02 09:55:42','2011-01-02 09:56:16',26),(35,1,'Lonicera PERICLYMENUN','','http://www.rios-galegos.com/lonicera22.jpg','2011-01-02 09:58:21','2011-01-02 09:58:21',27),(36,1,'','','http://thm-a04.yimg.com/nimage/a03c1fbdeec8eef2','2011-01-02 10:00:40','2011-01-02 10:00:40',28),(37,1,'Eriophorum angustifolium','','http://www.arcticatlas.org/photos/pltspecies/photos/fullsize/eran6_1','2011-01-02 10:08:34','2011-01-02 10:08:34',29),(38,1,'Lønn','','http://www.tropefugloppdrett.com/images/acer_platanoides_Norman_Hagen01-tn.jpg','2011-01-02 10:12:09','2011-01-02 10:12:40',30),(39,1,'Lønn','','http://www.tropefugloppdrett.com/images/acer_platanoides_Norman_Hagen02-tn.jpg','2011-01-02 10:13:33','2011-01-02 10:13:33',30);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `url` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Norsk Botanisk Forening - Plantefotoarkiv','Norsk Botanisk forening er foreningen for planteinteresserte i Norge. Den samler både fagutdannete botanikere, sjøllærte barfotbotanikere og andre med interesse for norsk flora.','http://www.nhm.uio.no/botanisk/nbf/plantefoto/','2011-01-01 07:15:37','2011-01-01 07:15:37'),(2,'University of Melbourne, Australia - Plant Names','MULTILINGUAL MULTISCRIPT PLANT NAME DATABASE','http://www.plantnames.unimelb.edu.au','2011-01-01 09:20:10','2011-01-01 09:20:10'),(4,'Kristins flora','Norsk Nettflora \r\nsortert\r\nalfabetisk eller \r\netter farger med bilder ','http://www.kristvi.com/flora/','2011-01-02 07:13:41','2011-01-02 07:13:41'),(5,'Nome Kommune - Norway','Nome is a municipality in Telemark county, Norway. It is part of the traditional region of Midt-Telemark. ','http://www.nome.kommune.no/','2011-01-02 09:18:44','2011-01-02 09:18:44'),(6,'gentedelnovecento','gentedelnovecento\r\nStory of a family','http://gentedelnovecento.ilcannocchiale.it/','2011-01-02 09:25:11','2011-01-02 09:25:11'),(7,'The Toolik-Arctic Geobotanical Atlas','The Toolik-Arctic Geobotanical Atlas (TAGA) is a web-based multi-scale collection of geobotanical maps and related material. It includes maps at seven different scales, from 1-m2 plots to the entire Arctic. The TAGA focuses on research sites at the Toolik Field Station and Imnavait Creek, Alaska, but also covers the Kuparuk River Basin, northern Alaska, Arctic Alaska, and the Circumpolar Arctic. Diverse geobotanical themes include geology, topography landforms, surficial geomorphology, soils, and vegetation.','http://www.arcticatlas.org/','2011-01-02 09:33:51','2011-01-02 09:33:51'),(8,'Vulkaner.no','','http://www.vulkaner.no/','2011-01-02 09:36:55','2011-01-02 09:36:55'),(9,'Astrologos del Mundo','Astrologers World\r\nMeeting point for all the astrologers in the world','http://astrologosdelmundo.ning.com/','2011-01-02 09:40:35','2011-01-02 09:40:35'),(10,'Chiedi all\'esperto','Ask the expert\r\nA group of experts answers your questions and scientific curiosity. ','http://www.vialattea.net/esperti/','2011-01-02 09:43:36','2011-01-02 09:43:36'),(11,'STIKLESTAD SKOLE','','http://stiklestad.g-skole.no/','2011-01-02 09:46:47','2011-01-02 09:47:05'),(12,'Botanikk - nett','Botany home page. Find botanical information online. \r\nCovers especially Norway and Scandinavia.','http://botanikk.no/','2011-01-02 09:51:01','2011-01-02 09:51:01'),(13,'Life in the Galician rivers.','','http://www.rios-galegos.com/','2011-01-02 09:54:59','2011-01-02 09:54:59'),(14,'crucigrama 112','','http://crucigrama112.com/','2011-01-02 10:00:18','2011-01-02 10:00:18'),(15,'Cecilie`s Tropefugloppdrett','Jeg driver oppdrett av forskjellige tropefugler.\r\nOg har flere arter fra små søte undulater til flotte papegøyer.','http://www.tropefugloppdrett.com/','2011-01-02 10:11:37','2011-01-02 10:11:37');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20101208075144'),('20101208081545'),('20101231085114'),('20101231085249'),('20101231102002'),('20110101065256'),('20110101065459'),('20110101065751'),('20110101065914'),('20110102065038'),('20110102080819');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webpages`
--

DROP TABLE IF EXISTS `webpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) DEFAULT NULL,
  `url` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webpages`
--

LOCK TABLES `webpages` WRITE;
/*!40000 ALTER TABLE `webpages` DISABLE KEYS */;
INSERT INTO `webpages` VALUES (1,1,'http://www.nhm.uio.no/botanisk/nbf/plantefoto/Allium_vineale.htm','2011-01-01 07:18:48','2011-01-01 07:18:48',NULL),(2,2,'http://www.plantnames.unimelb.edu.au/Sorting/Typha.html','2011-01-01 09:20:55','2011-01-02 10:25:47','M.M.P.N.D. - Sorting Typha names'),(3,1,'http://www.nhm.uio.no/botanisk/nbf/plantefoto/Acer_platanoides.htm','2011-01-01 09:25:29','2011-01-01 09:25:29',NULL),(7,4,'http://www.kristvi.net/flora/G/gjeldkarve.htm','2011-01-02 07:13:56','2011-01-02 07:13:56','Gjeldkarve'),(9,4,'http://www.kristvi.net/flora/B/buefrytle.htm','2011-01-02 08:13:27','2011-01-02 09:21:14','Buefrytle'),(10,4,'http://www.kristvi.net/flora/B/bergveronika.htm','2011-01-02 08:15:52','2011-01-02 08:15:52',NULL),(11,4,'http://www.kristvi.net/flora/B/blokkebaer.htm','2011-01-02 08:48:55','2011-01-02 08:48:55',NULL),(12,4,'http://www.kristvi.net/flora/T/tuearve.htm','2011-01-02 08:53:00','2011-01-02 09:21:24','Tuearve'),(13,4,'http://www.kristvi.net/flora/S/setermjelt.htm','2011-01-02 08:54:41','2011-01-02 08:54:41','Setermjelt'),(14,4,'http://www.kristvi.net/flora/K/knopparve.htm','2011-01-02 08:58:11','2011-01-02 08:58:11','Knoppsmåarve'),(15,4,'http://www.kristvi.net/flora/B/blaarapp.htm','2011-01-02 09:13:12','2011-01-02 09:13:12','Blårapp'),(16,6,'http://gentedelnovecento.ilcannocchiale.it/','2011-01-02 09:25:38','2011-01-02 09:25:47','\r\n	\r\n		\r\n	\r\n	\r\n	gentedelnovecento\r\n	 \r\n		| lo zio Bruno tentÃ² di contrastare le Leggi Razziali del1938\r\n	 \r\n	| Il Cannocchiale blog\r\n'),(17,4,'http://www.kristvi.com/sf/pieris_brassicae_stor_kaalsommerfugl.htm','2011-01-02 09:30:41','2011-01-02 09:30:45','Stor kålsommerfugl'),(18,4,'http://www.kristvi.com/sf/boloria_selene_brunflekkperlemorvinge.htm','2011-01-02 09:31:49','2011-01-02 09:31:53','Brunflekket perlemorvinge'),(19,7,'http://www.arcticatlas.org/photos/pltspecies/spp_enlargement.php?queryID=juca6&fileName=juca6_4','2011-01-02 09:34:47','2011-01-02 09:34:47',NULL),(20,8,'http://www.vulkaner.no/n/birds/fluesnapp/brown.html','2011-01-02 09:37:27','2011-01-02 09:37:27',NULL),(21,8,'http://www.vulkaner.no/n/birds/meiser/topp.html','2011-01-02 09:38:30','2011-01-02 09:38:30',NULL),(22,9,'http://astrologosdelmundo.ning.com/profiles/blog/list?user=plh8f7lbh27d','2011-01-02 09:41:21','2011-01-02 09:41:21',NULL),(23,10,'http://www.vialattea.net/esperti/php/risposta.php?num=9159','2011-01-02 09:44:02','2011-01-02 10:06:38','Home Chiedi all\'esperto'),(24,11,'http://stiklestad.g-skole.no/Sissel/traer/','2011-01-02 09:47:16','2011-01-02 09:47:16','Index of /Sissel/traer'),(25,12,'http://botanikk.no/Narrmarihand/Narrmarihand_lokaliteter.htm','2011-01-02 09:52:16','2011-01-02 09:52:23','Anacamptis morio'),(26,13,'http://www.rios-galegos.com/arb2121.htm','2011-01-02 09:55:42','2011-01-02 09:56:20','Prunus padus. Cireixón. (Cerezo de racimo). A vida nos ríos de Galicia.'),(27,13,'http://www.rios-galegos.com/plan25.htm','2011-01-02 09:58:21','2011-01-02 09:58:21',NULL),(28,14,'http://crucigrama112.com/%C3%A1lgida.html','2011-01-02 10:00:40','2011-01-02 10:00:40',NULL),(29,7,'http://www.arcticatlas.org/photos/pltspecies/spp_enlargement.php?queryID=eran6&fileName=eran6_1','2011-01-02 10:08:34','2011-01-02 10:08:34',NULL),(30,15,'http://www.tropefugloppdrett.com/Mathagen.html','2011-01-02 10:12:09','2011-01-02 10:13:15','Cecilie`s Tropefugloppdrett');
/*!40000 ALTER TABLE `webpages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-02  2:32:20
