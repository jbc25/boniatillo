-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: boniatillo
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Current Database: `boniatillo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `boniatillo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `boniatillo`;

--
-- Table structure for table `activities_activity`
--

DROP TABLE IF EXISTS `activities_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `type_activity` varchar(250) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_activity`
--

LOCK TABLES `activities_activity` WRITE;
/*!40000 ALTER TABLE `activities_activity` DISABLE KEYS */;
INSERT INTO `activities_activity` VALUES (1,'Biblioteca del Barrio','Asociación',''),(3,'Programas de radio OMG','Personas de la radio',''),(4,'Jornadas limpieza calles','ACPP',''),(5,'Talleres de lecto-escritura','Asociación',''),(6,'Clases español (para adultos)','Asociación',''),(7,'Centro de mayores','Personas del centro',''),(8,'Concurso de Grafitis','ACPP',''),(11,'Dinamización alumnado diálogo comerciantes','ACPP',''),(12,'Clases de apoyo escolar','Asociacion','Niñ@s de 6 a 12');
/*!40000 ALTER TABLE `activities_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities_personactivity`
--

DROP TABLE IF EXISTS `activities_personactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities_personactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `time_spent` time(6) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `person_id` char(32) DEFAULT NULL,
  `daytime` time(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_personact_activity_id_e20381c8_fk_activitie` (`activity_id`),
  KEY `activities_personact_person_id_5d5decfc_fk_currency_` (`person_id`),
  CONSTRAINT `activities_personact_activity_id_e20381c8_fk_activitie` FOREIGN KEY (`activity_id`) REFERENCES `activities_activity` (`id`),
  CONSTRAINT `activities_personact_person_id_5d5decfc_fk_currency_` FOREIGN KEY (`person_id`) REFERENCES `currency_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_personactivity`
--

LOCK TABLES `activities_personactivity` WRITE;
/*!40000 ALTER TABLE `activities_personactivity` DISABLE KEYS */;
INSERT INTO `activities_personactivity` VALUES (20,'2018-05-08','02:00:00.000000',1,'e080a6b439a546389628538492bd9e85','16:10:00.000000'),(21,'2018-05-08','03:33:00.000000',7,'e080a6b439a546389628538492bd9e85','16:13:00.000000'),(22,'2018-05-11','02:30:00.000000',7,'70b7e7600bd14780bb4930bd08d9ba58','17:00:00.000000'),(23,'2018-05-11','02:30:00.000000',7,'7d5c20700115476da415a04f4eae257b','17:00:00.000000'),(24,'2018-05-16','03:00:00.000000',7,'ebb2af3d80fd4700a96a6810e70f0058','17:30:00.000000'),(25,'2018-05-16','03:00:00.000000',7,'68a343389b9c441b90808816549a768b','17:30:00.000000'),(26,'2018-05-17','02:00:00.000000',12,'d405551d25e5496d8549df1b63fcd74f','17:00:00.000000'),(27,'2018-05-21','03:00:00.000000',7,'70b7e7600bd14780bb4930bd08d9ba58','16:00:00.000000'),(28,'2018-05-21','03:00:00.000000',7,'7d5c20700115476da415a04f4eae257b','16:00:00.000000'),(29,'2018-05-31','02:00:00.000000',12,'d405551d25e5496d8549df1b63fcd74f','17:00:00.000000'),(30,'2018-06-05','02:22:00.000000',1,'cb831e407cf44c8797a162312d3e0297','14:56:00.000000'),(31,'2018-06-05','03:33:00.000000',1,'cb831e407cf44c8797a162312d3e0297','14:57:00.000000'),(32,'2018-06-07','02:00:00.000000',12,'d405551d25e5496d8549df1b63fcd74f','17:00:00.000000'),(33,'2018-06-06','02:00:00.000000',7,'61ef939cd09f44209882097c88d0055f','11:45:00.000000'),(34,'2018-06-14','01:00:00.000000',12,'d405551d25e5496d8549df1b63fcd74f','17:00:00.000000'),(35,'2018-06-15','04:30:00.000000',7,'7d5c20700115476da415a04f4eae257b','09:00:00.000000'),(36,'2018-06-21','01:00:00.000000',12,'d405551d25e5496d8549df1b63fcd74f','17:00:00.000000'),(37,'2018-07-06','01:00:00.000000',7,'4b4bae7cb29941fd94ec6415999f0240','11:00:00.000000'),(38,'2018-07-13','01:00:00.000000',7,'4b4bae7cb29941fd94ec6415999f0240','11:00:00.000000'),(39,'2018-07-13','01:00:00.000000',7,'4b4bae7cb29941fd94ec6415999f0240','12:00:00.000000'),(40,'2018-07-20','01:00:00.000000',7,'4b4bae7cb29941fd94ec6415999f0240','11:00:00.000000');
/*!40000 ALTER TABLE `activities_personactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'entities'),(2,'persons');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,52),(2,2,53);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Noticia',1,'add_news'),(2,'Can change Noticia',1,'change_news'),(3,'Can delete Noticia',1,'delete_news'),(4,'Can add Categoría',2,'add_category'),(5,'Can change Categoría',2,'change_category'),(6,'Can delete Categoría',2,'delete_category'),(7,'Can add Galería',3,'add_gallery'),(8,'Can change Galería',3,'change_gallery'),(9,'Can delete Galería',3,'delete_gallery'),(10,'Can add Foto',4,'add_galleryphoto'),(11,'Can change Foto',4,'change_galleryphoto'),(12,'Can delete Foto',4,'delete_galleryphoto'),(13,'Can add Persona',5,'add_person'),(14,'Can change Persona',5,'change_person'),(15,'Can delete Persona',5,'delete_person'),(16,'Can add Entidad',6,'add_entity'),(17,'Can change Entidad',6,'change_entity'),(18,'Can delete Entidad',6,'delete_entity'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add permission',8,'add_permission'),(23,'Can change permission',8,'change_permission'),(24,'Can delete permission',8,'delete_permission'),(25,'Can add user',9,'add_user'),(26,'Can change user',9,'change_user'),(27,'Can delete user',9,'delete_user'),(28,'Can add group',10,'add_group'),(29,'Can change group',10,'change_group'),(30,'Can delete group',10,'delete_group'),(31,'Can add content type',11,'add_contenttype'),(32,'Can change content type',11,'change_contenttype'),(33,'Can delete content type',11,'delete_contenttype'),(34,'Can add Oferta',12,'add_offer'),(35,'Can change Oferta',12,'change_offer'),(36,'Can delete Oferta',12,'delete_offer'),(37,'Can add Tipo de cuenta',13,'add_wallettype'),(38,'Can change Tipo de cuenta',13,'change_wallettype'),(39,'Can delete Tipo de cuenta',13,'delete_wallettype'),(40,'Can add Pago',14,'add_payment'),(41,'Can change Pago',14,'change_payment'),(42,'Can delete Pago',14,'delete_payment'),(43,'Can add Transacción',15,'add_transaction'),(44,'Can change Transacción',15,'change_transaction'),(45,'Can delete Transacción',15,'delete_transaction'),(46,'Can add Movimiento',16,'add_transactionlog'),(47,'Can change Movimiento',16,'change_transactionlog'),(48,'Can delete Movimiento',16,'delete_transactionlog'),(49,'Can add Monedero',17,'add_wallet'),(50,'Can change Monedero',17,'change_wallet'),(51,'Can delete Monedero',17,'delete_wallet'),(52,'Can manage its entity',6,'can_manage_entity'),(53,'Can manage its person',5,'can_manage_person'),(54,'Can add api key',18,'add_apikey'),(55,'Can change api key',18,'change_apikey'),(56,'Can delete api key',18,'delete_apikey'),(57,'Can add api access',19,'add_apiaccess'),(58,'Can change api access',19,'change_apiaccess'),(59,'Can delete api access',19,'delete_apiaccess'),(60,'Can add FCM device',20,'add_fcmdevice'),(61,'Can change FCM device',20,'change_fcmdevice'),(62,'Can delete FCM device',20,'delete_fcmdevice'),(63,'Can add session',21,'add_session'),(64,'Can change session',21,'change_session'),(65,'Can delete session',21,'delete_session'),(66,'Can add site',22,'add_site'),(67,'Can change site',22,'change_site'),(68,'Can delete site',22,'delete_site'),(69,'Can add Actividad',23,'add_activity'),(70,'Can change Actividad',23,'change_activity'),(71,'Can delete Actividad',23,'delete_activity'),(72,'Can add Actividad',24,'add_personactivity'),(73,'Can change Actividad',24,'change_personactivity'),(74,'Can delete Actividad',24,'delete_personactivity');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$5OoFUbg26G8t$gN+N8Zs6rn8SULLjQgHioBMIAt/h4fHPOHdrBjEWRow=','2019-05-31 12:29:08.888601',1,'admin','','','',1,1,'2018-04-03 21:59:53.894631'),(7,'pbkdf2_sha256$36000$mMkmv1f0tHzJ$i9xxf3KxCb6IIRmadAkAvcVHbhYguvWqd2DMx5yF8XQ=','2019-05-31 11:16:22.820402',0,'PapeleriaCopiarte','MªÁngeles','Fernández','papeleriacopiarte@gmail.com',0,1,'2018-04-20 07:53:35.249916'),(8,'pbkdf2_sha256$36000$GXKYsZN3l5Iu$Ks27LUN52jcpPS6Dh/zQ9qGwhBO3z+Wy6a0HOzPD6ek=','2018-05-14 14:51:23.693188',0,'Latrueca','María','','latrueca.mail@gmail.com',0,1,'2018-04-20 08:02:35.134794'),(13,'pbkdf2_sha256$36000$DVk85dZ0t8u9$T0PCo6xiALTuKZl8C79+lOTmE3qM9Bhiqx5KCH7VKQs=','2018-05-11 11:20:10.334113',0,'jjoseba','','','jjoseba@gmail.com',0,1,'2018-04-20 15:55:21.966482'),(21,'pbkdf2_sha256$36000$WN8yvYTxcPXI$Ht5iWvT+ORgQVuEObaXO8XDduatC0fCbkKSGg3uyY5w=','2018-06-12 08:08:40.346749',0,'Bar/Cafetería Línea 123','','','linea123@icloud.com',0,1,'2018-04-24 16:29:51.718626'),(22,'pbkdf2_sha256$36000$gyhNMqkJs8XS$vR9ZwYrtJSsr3rA3PwGt0B1Mo9JnBuwGAkoKE3rWnfA=','2018-04-25 14:44:20.707550',0,'M.Morillo','','','madrid@acpp.com',0,1,'2018-04-25 14:41:33.885870'),(23,'pbkdf2_sha256$36000$dfKtHivmvN4G$+4ZLSUjfKJ3I9q51/+tOTvrQwpxrXDmh1k7hgbvNSeE=','2018-05-16 09:23:07.391094',0,'Mamutsvillaverde','','','sergiodme@yahoo.es',0,1,'2018-05-03 11:18:29.278259'),(24,'pbkdf2_sha256$36000$tdKzf9U423zt$8EleaflJb+625lMdOmb/8727ADc0L4Mu6NeEo+YXQSQ=','2018-05-16 09:25:52.073618',0,'Erika','','','erika.fernandez.cruz24@hotmail.com',0,1,'2018-05-03 11:24:44.220109'),(25,'pbkdf2_sha256$36000$EsSnMdhV2KaB$x4kGlvt2OJl8ai/Mmkd3K06LaezJtDRtrcV/NJ2WODU=','2018-06-13 12:31:23.115554',0,'Lissa','','','lissamumo@gmail.com',0,1,'2018-05-03 11:26:17.325406'),(26,'pbkdf2_sha256$36000$QhPWrohSLYmX$L+O5lIotjSWyg83dxYZ/Nn/K4Sia0UjcZfCPj0Kbksc=','2018-07-30 18:48:42.147555',0,'Zaida','','','zaidareychel@hotmail.es',0,1,'2018-05-03 11:27:33.076703'),(27,'pbkdf2_sha256$36000$lQBPtKd29gXt$9jGfFwp7NWKx0VWV48gdzUtB9wi7Lg/BlNnliIGsrOo=','2018-05-31 11:23:53.643262',0,'LauraBece','','','laurabecerra114@gmail.com',0,1,'2018-05-03 11:29:32.823379'),(28,'pbkdf2_sha256$36000$elilIOmcpMwB$zf5ENSvn+QKxnsH6R5+9Z4avdukwZG3BVbcUBvsld+U=','2018-05-11 12:14:56.471974',0,'MariaDuck','','','mariaduck00@gmail.com',0,1,'2018-05-03 11:31:13.005004'),(31,'pbkdf2_sha256$36000$rmTzWQF2IhWw$aKQumwcUoUfDrT05NavoS8goWdTIS6EMUam0+ZQFK/A=','2019-05-31 09:00:59.830818',0,'julio','','','jberzal86@gmail.com',0,1,'2018-05-07 10:12:12.127815'),(32,'pbkdf2_sha256$36000$tpodtqStLllL$uukvF5WtB3WVqE37XV/jdAhK+8kA1S2klwZki7/dMo4=','2018-05-10 14:34:23.519978',0,'Luciamoreno','','','luciamorenogarcia234@gmail.com',0,1,'2018-05-10 08:34:13.722876'),(33,'pbkdf2_sha256$36000$guKPkmgskihL$Kv9RuADZN5ScSxkzoT0Y+7dBq1+pIvKB83m3pzw43T0=','2018-07-28 19:26:22.260772',0,'Keyliita','','','keyliitaatigua@gmail.com',0,1,'2018-05-10 12:40:20.772036'),(35,'pbkdf2_sha256$36000$a2PWv89KdDbS$pnsVcb82+xR+V4HwPY0O7mENhbdKCzTYIvptQ22JQng=',NULL,0,'Alba','','','albasoledadcrespo@gmail.com',0,1,'2018-06-26 07:41:23.133105'),(36,'pbkdf2_sha256$36000$5UDjBwkUtgpx$/ctQlzd9LVtF7AjGjBxjFUIB0MS78OEuVNxrUNOK+cY=',NULL,0,'Sandratoranzo','','','sandritatoranzo@gmail.com',0,1,'2018-06-27 16:02:09.806792');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (6,7,1),(7,8,1),(11,13,2),(19,21,1),(20,22,2),(21,23,1),(22,24,2),(23,25,2),(24,26,2),(25,27,2),(26,28,2),(29,31,2),(30,32,2),(31,33,2),(33,35,2),(34,36,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_category`
--

DROP TABLE IF EXISTS `currency_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_category` (
  `id` char(32) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` longtext,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_category`
--

LOCK TABLES `currency_category` WRITE;
/*!40000 ALTER TABLE `currency_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_entity`
--

DROP TABLE IF EXISTS `currency_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_entity` (
  `id` char(32) NOT NULL,
  `cif` varchar(50) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` longtext,
  `short_description` longtext,
  `phone_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `logo` varchar(100) DEFAULT NULL,
  `registered` datetime(6) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `bonus_percent_general` double NOT NULL,
  `max_percent_payment` double NOT NULL,
  `num_workers` int(11) NOT NULL,
  `legal_form` longtext,
  `facebook_link` varchar(250) DEFAULT NULL,
  `webpage_link` varchar(250) DEFAULT NULL,
  `twitter_link` varchar(250) DEFAULT NULL,
  `telegram_link` varchar(250) DEFAULT NULL,
  `instagram_link` varchar(250) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `bonus_percent_entity` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_entity_user_id_af51db6e_uniq` (`user_id`),
  UNIQUE KEY `gallery_id` (`gallery_id`),
  CONSTRAINT `currency_entity_gallery_id_fe75efcf_fk_currency_gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `currency_gallery` (`id`),
  CONSTRAINT `currency_entity_user_id_af51db6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_entity`
--

LOCK TABLES `currency_entity` WRITE;
/*!40000 ALTER TABLE `currency_entity` DISABLE KEYS */;
INSERT INTO `currency_entity` VALUES ('581c58b2d29346a185ad898127daf446',NULL,'sergiodme@yahoo.es','Mamuts de Villaverde','<p>Clases de patinaje en las pistas de al lado del IES Espinillo.</p>\r\n\r\n<p>S&aacute;bados de ma&ntilde;ana.</p>','',NULL,'','entities/f1227e37-e6d3-4854-bb35-b4d7e06b30f5.jpg','2018-05-03 11:18:29.337233',40.3592877168,-3.69073276583,0,0,0,'',NULL,NULL,NULL,NULL,NULL,23,12,0),('cd513bef72fc423a895028d183b97eaa',NULL,'papeleriacopiarte@gmail.com','Papelería Copiarte','<p><strong>Papeler&iacute;a Copiarte,</strong> situada enfrente del IES Villaverde.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','',NULL,'C/de la Alianza, 37','entities/3915d022-e692-4f9c-9ffc-fa17f7e4090c.jpg','2018-04-20 07:53:35.317628',40.3576869805296,-3.68589119352168,0,0,0,'',NULL,NULL,NULL,NULL,NULL,7,6,0),('dfd07bc72d274972a7e4ab324500f608',NULL,'latrueca.mail@gmail.com','La Trueca','<p>ESPACIO SOCIOCULTURA. Cultura, Ocio y Ecolog&iacute;a.</p>\r\n\r\n<p>Productos de comercios justo, actuaciones po&eacute;ticas y musicales, etc.&nbsp;</p>','',NULL,'C/Manganeso, 5','entities/6206a1cb-dba3-4578-8a21-18fb008edde7.jpg','2018-04-20 08:02:35.222954',0,0,0,0,0,'','https://www.facebook.com/LaTruecaVillaverdeAsociacionCultural/',NULL,'https://twitter.com/La_Trueca?lang=fr',NULL,NULL,8,7,0),('f4ccc4a580984df2aadac152671727f7',NULL,'linea123@icloud.com','Bar/Cafetería Línea 123','<p>Bar/Cafeter&iacute;a cercana al IES El Espinillo, donde podr&aacute;s desayunar al mejor precio y calidad.</p>','',NULL,'Avenida Orovilla, 46','entities/6adaa138-01ad-46c3-98cf-ee2dd118565f.jpg','2018-04-24 16:29:51.808073',40.3615263140018,-3.6999750716675,0,0,0,'','https://www.facebook.com/barlinea123/',NULL,NULL,NULL,NULL,21,11,0);
/*!40000 ALTER TABLE `currency_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_entity_categories`
--

DROP TABLE IF EXISTS `currency_entity_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_entity_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` char(32) NOT NULL,
  `category_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_entity_categories_entity_id_category_id_1a053efb_uniq` (`entity_id`,`category_id`),
  KEY `currency_entity_cate_category_id_0e6cd1c7_fk_currency_` (`category_id`),
  CONSTRAINT `currency_entity_cate_category_id_0e6cd1c7_fk_currency_` FOREIGN KEY (`category_id`) REFERENCES `currency_category` (`id`),
  CONSTRAINT `currency_entity_cate_entity_id_b3c32d46_fk_currency_` FOREIGN KEY (`entity_id`) REFERENCES `currency_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_entity_categories`
--

LOCK TABLES `currency_entity_categories` WRITE;
/*!40000 ALTER TABLE `currency_entity_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_entity_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_gallery`
--

DROP TABLE IF EXISTS `currency_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_gallery`
--

LOCK TABLES `currency_gallery` WRITE;
/*!40000 ALTER TABLE `currency_gallery` DISABLE KEYS */;
INSERT INTO `currency_gallery` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL),(12,NULL),(13,NULL),(14,NULL);
/*!40000 ALTER TABLE `currency_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_galleryphoto`
--

DROP TABLE IF EXISTS `currency_galleryphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_galleryphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `uploaded` datetime(6) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_galleryphoto_gallery_id_fce477fc_fk_currency_gallery_id` (`gallery_id`),
  CONSTRAINT `currency_galleryphoto_gallery_id_fce477fc_fk_currency_gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `currency_gallery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_galleryphoto`
--

LOCK TABLES `currency_galleryphoto` WRITE;
/*!40000 ALTER TABLE `currency_galleryphoto` DISABLE KEYS */;
INSERT INTO `currency_galleryphoto` VALUES (1,0,NULL,'photos/1be1941d-b330-4a2b-a033-1bd3c8a4226d.jpg','2018-04-19 17:54:47.510185',4),(2,1,NULL,'photos/92d04ec4-f795-42bf-a311-30eab02116c6.jpg','2018-04-19 17:54:47.560565',4),(5,0,NULL,'photos/453a8f57-4af2-4469-8d21-1b4c65fdb10a.jpg','2018-05-04 08:26:52.656944',13),(6,1,NULL,'photos/07410f1a-d6c8-4f6e-877a-f4acd03c7198.jpeg','2018-05-04 08:26:52.692505',13),(12,0,NULL,'photos/ee460b50-b575-4fde-a32c-6c9bfa2c16f7.jpg','2018-05-11 10:51:27.716967',7);
/*!40000 ALTER TABLE `currency_galleryphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_person`
--

DROP TABLE IF EXISTS `currency_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_person` (
  `id` char(32) NOT NULL,
  `nif` varchar(50) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `registered` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `currency_person_user_id_fa53794c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_person`
--

LOCK TABLES `currency_person` WRITE;
/*!40000 ALTER TABLE `currency_person` DISABLE KEYS */;
INSERT INTO `currency_person` VALUES ('4b4bae7cb29941fd94ec6415999f0240',NULL,'keyliitaatigua@gmail.com','Keyla','Tigua Intriago','','2018-05-10 12:40:20.983258',33,''),('61ef939cd09f44209882097c88d0055f',NULL,'erika.fernandez.cruz24@hotmail.com','Erika','Fernadez Cruz','','2018-05-03 11:24:44.288709',24,''),('68a343389b9c441b90808816549a768b',NULL,'zaidareychel@hotmail.es','Zaida','Sanchez Bueno','','2018-05-03 11:27:33.150182',26,''),('70b7e7600bd14780bb4930bd08d9ba58',NULL,'laurabecerra114@gmail.com','Laura','Becerra Gordaliza','','2018-05-03 11:29:32.882315',27,''),('7162f2c487e74f319bbb03641d3e04ea',NULL,'albasoledadcrespo@gmail.com','Alba Soledad','Crespo Ramos','','2018-06-26 07:41:24.150483',35,''),('7d5c20700115476da415a04f4eae257b',NULL,'mariaduck00@gmail.com','María Elena','Pato Luengo','','2018-05-03 11:31:13.058622',28,''),('b6de723592ad4229804984374319ef70',NULL,'jjoseba@gmail.com','Joseba','S.','','2018-04-20 15:55:21.981910',13,'agsdagsdagd'),('cb831e407cf44c8797a162312d3e0297',NULL,'jberzal86@gmail.com','Julio','Prueba','profiles/4e9ee180-c620-4360-a86a-e3b8d1e42400.jpg','2018-05-07 10:12:13.767748',31,''),('d405551d25e5496d8549df1b63fcd74f',NULL,'luciamorenogarcia234@gmail.com','Lucía','Moreno García','','2018-05-10 08:34:14.363892',32,''),('e080a6b439a546389628538492bd9e85','48.810.771-X','madrid@acpp.com','Mercedes','Morillo Vicente','','2018-04-25 14:41:35.831607',22,'C/Príncipe, 12, 5º D'),('ebb2af3d80fd4700a96a6810e70f0058',NULL,'lissamumo@gmail.com','Melissa','Muñoz Molina','','2018-05-03 11:26:17.379698',25,''),('ee27f2a134904cfa8c4285a8fe0091d2',NULL,'sandritatoranzo@gmail.com','Sandra','Toranzo Díaz','','2018-06-27 16:02:11.115905',36,'');
/*!40000 ALTER TABLE `currency_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_person_fav_entities`
--

DROP TABLE IF EXISTS `currency_person_fav_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_person_fav_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` char(32) NOT NULL,
  `entity_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_person_fav_entities_person_id_entity_id_5e3bf0db_uniq` (`person_id`,`entity_id`),
  KEY `currency_person_fav__entity_id_101e3ec9_fk_currency_` (`entity_id`),
  CONSTRAINT `currency_person_fav__entity_id_101e3ec9_fk_currency_` FOREIGN KEY (`entity_id`) REFERENCES `currency_entity` (`id`),
  CONSTRAINT `currency_person_fav__person_id_53c02bbd_fk_currency_` FOREIGN KEY (`person_id`) REFERENCES `currency_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_person_fav_entities`
--

LOCK TABLES `currency_person_fav_entities` WRITE;
/*!40000 ALTER TABLE `currency_person_fav_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_person_fav_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-19 17:56:57.652597','5','comercioprueba',3,'',9,1),(2,'2018-04-19 17:56:57.661231','6','comercioprueba1',3,'',9,1),(3,'2018-04-20 08:46:29.600017','4','comicsvillaverde',3,'',9,1),(4,'2018-04-20 08:46:29.650749','3','frutasmanolo',3,'',9,1),(5,'2018-04-20 08:46:29.660651','2','panaderiajuana',3,'',9,1),(6,'2018-04-20 09:07:14.338359','1','Biblioteca del Barrio',1,'[{\"added\": {}}]',23,1),(7,'2018-04-20 09:07:37.979898','2','Biblioteca del Instituto',1,'[{\"added\": {}}]',23,1),(8,'2018-04-20 09:07:46.582496','3','Programas de radio OMG',1,'[{\"added\": {}}]',23,1),(9,'2018-04-20 09:07:58.523016','4','Jornadas limpieza calles',1,'[{\"added\": {}}]',23,1),(10,'2018-04-20 09:08:06.247955','5','Talleres de lecto-escritura',1,'[{\"added\": {}}]',23,1),(11,'2018-04-20 09:08:14.515208','6','Clases español (para adultos)',1,'[{\"added\": {}}]',23,1),(12,'2018-04-20 09:08:25.720738','7','Centro de mayores',1,'[{\"added\": {}}]',23,1),(13,'2018-04-20 09:08:33.393647','8','Concurso de Grafitis',1,'[{\"added\": {}}]',23,1),(14,'2018-04-20 09:08:45.443494','9','Huerta Escolar',1,'[{\"added\": {}}]',23,1),(15,'2018-04-20 09:08:57.805368','10','Agrocompostaje',1,'[{\"added\": {}}]',23,1),(16,'2018-04-20 09:09:05.338910','11','Dinamización alumnado diálogo comerciantes',1,'[{\"added\": {}}]',23,1),(17,'2018-04-20 15:56:42.156200','13','jjoseba',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',9,1),(18,'2018-04-20 16:18:34.348003','4699ec43-d4b6-4757-ac65-056a23463364','Payment object',1,'[{\"added\": {}}]',14,1),(19,'2018-04-20 16:26:50.181278','488184fd-ba5b-4455-942a-5084d4fb108e','Transaction object',1,'[{\"added\": {}}]',15,1),(20,'2018-04-20 16:35:51.362472','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 100.0',2,'[{\"changed\": {\"fields\": [\"balance\", \"last_transaction\", \"pin_code\"]}}]',17,1),(21,'2018-04-20 16:44:15.428586','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 100.0',2,'[{\"changed\": {\"fields\": [\"pin_code\"]}}]',17,1),(22,'2018-04-20 16:44:49.027110','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 100.0',2,'[{\"changed\": {\"fields\": [\"pin_code\"]}}]',17,1),(23,'2018-04-20 16:47:59.946606','388afdbb-b1d1-4a95-95b4-c72254511736','Transaction object',1,'[{\"added\": {}}]',15,1),(24,'2018-04-20 17:19:52.400478','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 100.0',2,'[{\"changed\": {\"fields\": [\"pin_code\"]}}]',17,1),(25,'2018-04-20 17:23:59.775241','7','PapeleriaCopiarte',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',9,1),(26,'2018-04-20 17:25:50.199755','8','Latrueca',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',9,1),(27,'2018-04-22 15:25:00.002984','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 100.0',2,'[{\"changed\": {\"fields\": [\"pin_code\"]}}]',17,1),(28,'2018-04-22 15:59:03.185129','1','http://vps530178.ovh.net',2,'[{\"changed\": {\"fields\": [\"domain\", \"name\"]}}]',22,1),(29,'2018-04-22 15:59:57.759925','1','vps530178.ovh.net',2,'[{\"changed\": {\"fields\": [\"domain\"]}}]',22,1),(30,'2018-04-23 09:33:28.853120','10','comercio1',3,'',9,1),(31,'2018-04-23 09:46:35.774613','738ad1f7-f851-449d-98ea-cde4d3472f30','Transaction object',1,'[{\"added\": {}}]',15,1),(32,'2018-04-23 09:47:11.019011','4f878551-67de-454f-9d5d-e0d48ebaa99f','Payment object',1,'[{\"added\": {}}]',14,1),(33,'2018-04-23 09:47:34.628579','3ba2c4a8-f1df-4c68-bbd9-f7b362919bf0','julio: 20.0',2,'[{\"changed\": {\"fields\": [\"balance\", \"last_transaction\"]}}]',17,1),(34,'2018-04-23 15:04:02.552235','2','Biblioteca del Instituto',3,'',23,1),(35,'2018-04-23 15:04:02.558030','9','Huerta Escolar',3,'',23,1),(36,'2018-04-23 15:05:48.641444','12','Clases de apoyo escolar',1,'[{\"added\": {}}]',23,1),(37,'2018-04-23 16:45:06.172073','e4b280f8-b197-439e-8937-182941e3aa27','pagadora: 1000.0',2,'[{\"changed\": {\"fields\": [\"balance\", \"last_transaction\"]}}]',17,1),(38,'2018-04-27 11:04:40.623899','11','prueba2',3,'',9,1),(39,'2018-04-27 11:04:46.426895','12','userallet',3,'',9,1),(40,'2018-04-27 11:04:52.253690','17','persona4',3,'',9,1),(41,'2018-04-27 11:07:17.328816','14','jjoseba2',3,'',9,1),(42,'2018-04-27 11:10:29.230220','9','persona1',3,'',9,1),(43,'2018-04-27 11:11:28.487288','2','julio - Agrocompostaje',3,'',24,1),(44,'2018-04-27 11:11:28.490970','4','M.Morillo - Agrocompostaje',3,'',24,1),(45,'2018-04-27 11:11:28.493596','10','persona3 - Agrocompostaje',3,'',24,1),(46,'2018-04-27 11:11:28.495517','9','jjoseba - Programas de radio OMG',3,'',24,1),(47,'2018-04-27 11:11:28.498092','8','jjoseba - Jornadas limpieza calles',3,'',24,1),(48,'2018-04-27 11:11:28.500430','7','persona3 - Concurso de Grafitis',3,'',24,1),(49,'2018-04-27 11:11:28.504131','6','persona3 - Biblioteca del Barrio',3,'',24,1),(50,'2018-04-27 11:11:28.506198','5','persona3 - Agrocompostaje',3,'',24,1),(51,'2018-04-27 11:11:41.820290','488184fd-ba5b-4455-942a-5084d4fb108e','Transaction object',3,'',15,1),(52,'2018-04-27 11:11:41.822762','42cc1585-f28a-4466-8484-140d6b36bedf','Transaction object',3,'',15,1),(53,'2018-04-27 11:11:41.825350','df251324-7816-41c8-82c9-6d33542d7b4d','Transaction object',3,'',15,1),(54,'2018-04-27 11:11:41.827080','db4827ef-1a57-4f61-a1d1-f78c0c421803','Transaction object',3,'',15,1),(55,'2018-04-27 11:11:41.829871','738ad1f7-f851-449d-98ea-cde4d3472f30','Transaction object',3,'',15,1),(56,'2018-04-27 11:11:41.834547','74feacfa-a67c-44a2-91f2-77edd62dffbe','Transaction object',3,'',15,1),(57,'2018-04-27 11:11:41.836682','51c7345d-39df-4bce-b136-64fceaed0d85','Transaction object',3,'',15,1),(58,'2018-04-27 11:11:41.838182','8574957c-bcf5-47d9-a80e-0ce584831e72','Transaction object',3,'',15,1),(59,'2018-04-27 11:11:41.840369','db3c246b-9148-4564-b24c-fbbe9b2a0c8c','Transaction object',3,'',15,1),(60,'2018-04-27 11:11:41.841899','5db70da0-ab76-42e2-958c-bb3c2bda2523','Transaction object',3,'',15,1),(61,'2018-04-27 11:11:41.843637','d9c5b34f-49cd-4545-8d7c-4259118f5488','Transaction object',3,'',15,1),(62,'2018-04-27 11:11:41.846229','790f3948-b192-49cb-8dfa-1522ac7739f2','Transaction object',3,'',15,1),(63,'2018-04-27 11:11:41.848508','f43075ea-5dd2-4140-b29b-32d65a74ae0f','Transaction object',3,'',15,1),(64,'2018-04-27 11:11:41.850340','afbdb22a-4efb-4cb8-931e-803140670163','Transaction object',3,'',15,1),(65,'2018-04-27 11:11:41.852616','e01253f5-2657-4d75-a27e-957aa7532e30','Transaction object',3,'',15,1),(66,'2018-04-27 11:11:41.854298','aaf70a34-1bba-43e7-839c-9cb0ce4a01e1','Transaction object',3,'',15,1),(67,'2018-04-27 11:11:41.856695','afd0815a-b8ae-48ec-b6dd-59434e860e9b','Transaction object',3,'',15,1),(68,'2018-04-27 11:11:41.858348','e79673ea-fd5d-4815-8e52-20bebdf606f8','Transaction object',3,'',15,1),(69,'2018-04-27 11:11:41.860681','615f0b4b-de18-4d35-a466-fbe56c2bdf64','Transaction object',3,'',15,1),(70,'2018-04-27 11:11:41.862305','e305a5dd-a31e-489a-b484-ca1e3705da24','Transaction object',3,'',15,1),(71,'2018-04-27 11:11:41.864653','cae6a26d-7a02-4c03-90c3-04555d42cc80','Transaction object',3,'',15,1),(72,'2018-04-27 11:11:41.866446','5f5795e3-5382-4ab2-af3d-22cb384cc69f','Transaction object',3,'',15,1),(73,'2018-04-27 11:11:41.868664','ef3c2338-fc7a-4979-a7dc-01da259bdc93','Transaction object',3,'',15,1),(74,'2018-04-27 11:11:41.870247','82e2576a-9bb7-4aa3-bd38-2488c441fa28','Transaction object',3,'',15,1),(75,'2018-04-27 11:11:41.872410','1ede7a34-0682-4ea4-92da-62155baf74b4','Transaction object',3,'',15,1),(76,'2018-04-27 11:11:41.873943','03c45181-00ad-45a7-bc90-0a5724d5fa0b','Transaction object',3,'',15,1),(77,'2018-04-27 11:11:41.875463','5948619f-3b97-48a5-8be7-963f6e92a574','Transaction object',3,'',15,1),(78,'2018-04-27 11:11:41.877649','b83cdd38-ad72-4206-851e-aa61388d161f','Transaction object',3,'',15,1),(79,'2018-04-27 11:11:41.879370','345fb7ce-8a7c-48b0-b211-aa57994a8803','Transaction object',3,'',15,1),(80,'2018-04-27 11:11:41.881606','eb96a969-6522-4573-a1a3-a0e8bda19323','Transaction object',3,'',15,1),(81,'2018-04-27 11:11:41.883511','6ca229e8-4390-4404-bfc4-19b94ae138de','Transaction object',3,'',15,1),(82,'2018-04-27 11:11:41.885856','deb57e7d-2628-4859-8a86-772e668e7bb4','Transaction object',3,'',15,1),(83,'2018-04-27 11:12:02.820938','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(84,'2018-04-27 11:12:08.590907','18c42a4b-d502-4701-a479-1a6ee1d95181','jjoseba: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(85,'2018-04-27 11:12:13.070163','260eb96a-37f8-4219-a179-06d5f31648b1','comercio2: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(86,'2018-04-27 11:12:16.256552','c52d8418-5c61-4ac9-ba67-2d09b78068a0','comercio3: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(87,'2018-04-27 11:12:21.134395','57e9cdab-27d6-4c09-93f3-52bcd43192af','Bar/Cafetería Línea 123: 0.0',2,'[]',17,1),(88,'2018-04-27 11:12:24.693804','e4b280f8-b197-439e-8937-182941e3aa27','pagadora: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(89,'2018-04-27 11:13:12.915884','d95c4d72-e7d9-4e8d-8a88-f76406419588','Payment object',3,'',14,1),(90,'2018-04-27 11:13:12.919422','d04dca29-d24f-4618-bbaa-a045b3ccdf49','Payment object',3,'',14,1),(91,'2018-04-27 11:13:12.921771','bafa175a-b86d-4394-ab4e-cc8615b80de4','Payment object',3,'',14,1),(92,'2018-04-27 11:13:12.923509','af3b593a-e6f5-48f1-9dd4-c0bc04a2b986','Payment object',3,'',14,1),(93,'2018-04-27 11:13:12.925213','ae536701-55c2-4cd4-9056-cbd7e1d8db4e','Payment object',3,'',14,1),(94,'2018-04-27 11:13:12.930199','a71d0000-7f43-4c01-8b36-f0c07c7fdca4','Payment object',3,'',14,1),(95,'2018-04-27 11:13:12.932638','9b63b3cd-e56e-440f-887c-ecffeae84259','Payment object',3,'',14,1),(96,'2018-04-27 11:13:12.934313','99c47c9f-73bd-4abb-bff0-4ac4c03e2330','Payment object',3,'',14,1),(97,'2018-04-27 11:13:12.936788','83719029-f56c-4e51-bc27-c3fada947633','Payment object',3,'',14,1),(98,'2018-04-27 11:13:12.938381','7b2c29d1-679b-4efa-9f2d-c39874c9c7e1','Payment object',3,'',14,1),(99,'2018-04-27 11:13:12.940607','6b55bc46-c29d-44f6-886f-fcf6f3fd4dc3','Payment object',3,'',14,1),(100,'2018-04-27 11:13:12.942217','5983de80-3f63-43c4-a4c0-13f2d0fdcb46','Payment object',3,'',14,1),(101,'2018-04-27 11:13:12.944491','4f878551-67de-454f-9d5d-e0d48ebaa99f','Payment object',3,'',14,1),(102,'2018-04-27 11:13:12.948386','4699ec43-d4b6-4757-ac65-056a23463364','Payment object',3,'',14,1),(103,'2018-04-27 11:13:12.968063','40dc6acf-2bfa-4760-874b-7e281065957a','Payment object',3,'',14,1),(104,'2018-04-27 11:13:12.970795','40d889b0-1f0a-4898-bdda-109a33cc91be','Payment object',3,'',14,1),(105,'2018-04-27 11:13:12.972669','4018e04c-a38c-48ed-9b98-6d479ed8f4ab','Payment object',3,'',14,1),(106,'2018-04-27 11:13:12.974486','36bacdd6-e691-4dd0-82d9-656586cc0111','Payment object',3,'',14,1),(107,'2018-04-27 11:13:12.976806','2327e095-edb5-4097-b950-d6efcfedb6a9','Payment object',3,'',14,1),(108,'2018-04-27 11:13:12.978511','1a826f3b-57a4-4a92-9ef0-55a4227bc51f','Payment object',3,'',14,1),(109,'2018-04-27 11:13:12.980773','1a7c2590-7300-4e39-9332-5e37bba365ca','Payment object',3,'',14,1),(110,'2018-04-27 11:13:12.982671','1055f9f1-e7ca-4141-bba2-917b81be75bb','Payment object',3,'',14,1),(111,'2018-04-27 11:13:12.985346','069fedb8-dea1-450b-ad7b-e49fd574f7bf','Payment object',3,'',14,1),(112,'2018-04-27 11:13:12.987125','e5bce063-b2ac-437e-b41a-0850c526ed75','Payment object',3,'',14,1),(113,'2018-04-27 11:13:12.989625','cf05b36c-2cda-4982-b17d-3d5594c4491e','Payment object',3,'',14,1),(114,'2018-04-27 11:13:12.991348','c20ffad8-1593-4cde-a6a8-2d65274769d5','Payment object',3,'',14,1),(115,'2018-04-27 11:13:12.993659','b4d1da48-1bc2-4964-86e7-3a7947c24e12','Payment object',3,'',14,1),(116,'2018-04-27 11:13:12.996815','ac8c6cb6-ef07-419c-ac7c-e2371ec0a226','Payment object',3,'',14,1),(117,'2018-04-27 11:13:12.998476','98a2a63f-2e0f-4edb-ba6e-438fcf56766c','Payment object',3,'',14,1),(118,'2018-04-27 11:13:13.006754','95c6047c-94f5-4a75-8af9-bfacb6cdeae7','Payment object',3,'',14,1),(119,'2018-04-27 11:13:13.009110','8e9fc2c2-9786-4dce-a302-e541cc615647','Payment object',3,'',14,1),(120,'2018-04-27 11:13:13.010648','35426f95-6158-44e2-be20-09d70748c8d1','Payment object',3,'',14,1),(121,'2018-04-27 11:13:13.013160','2795ae82-7445-4536-8b28-fd14807412f5','Payment object',3,'',14,1),(122,'2018-05-03 12:27:15.363085','da3de0e3-e442-44cb-aedb-250c8fe3d749','Payment object',3,'',14,1),(123,'2018-05-03 12:27:15.367064','3e2ccd65-3a48-4800-bce9-54536e585561','Payment object',3,'',14,1),(124,'2018-05-03 12:27:30.183098','f5d30e73-0830-4af6-a3ee-e1fb751a03eb','Transaction object',3,'',15,1),(125,'2018-05-03 12:27:30.186169','5e6389fd-6f9b-4a1c-831c-297c0464260d','Transaction object',3,'',15,1),(126,'2018-05-03 12:27:30.188612','33f6cd51-a26d-4dee-9c36-ac3d2655dfd6','Transaction object',3,'',15,1),(127,'2018-05-03 12:27:30.190387','6553addf-cb0f-4794-a992-b3b9a34cda6d','Transaction object',3,'',15,1),(128,'2018-05-03 12:27:30.192739','34faa752-e550-47e0-8fff-2ce3d20d2015','Transaction object',3,'',15,1),(129,'2018-05-03 12:27:30.194516','baa57ca0-60cc-4ae1-8b0c-1cb4cf945eed','Transaction object',3,'',15,1),(130,'2018-05-03 12:27:30.197588','202be4af-fe31-4f3c-84ac-cdde714ed9fe','Transaction object',3,'',15,1),(131,'2018-05-03 12:27:30.199420','8840d2b8-4b84-4210-bc21-04c61afc1a96','Transaction object',3,'',15,1),(132,'2018-05-03 12:27:30.201735','6daaaf58-f466-4911-a7c1-002585aaea36','Transaction object',3,'',15,1),(133,'2018-05-03 12:27:30.203353','ee07625b-746a-407b-991e-6ba5f373c8ff','Transaction object',3,'',15,1),(134,'2018-05-03 12:27:30.205757','347554fa-17b1-4d30-858f-5ac303d80b70','Transaction object',3,'',15,1),(135,'2018-05-03 12:27:30.207456','b4814b84-033a-4a57-8f2e-c7529514d75c','Transaction object',3,'',15,1),(136,'2018-05-03 12:27:30.209633','ef75d396-c734-4a52-a235-a9603cc0b4a6','Transaction object',3,'',15,1),(137,'2018-05-03 12:27:30.214396','490a1f82-e1b5-42c7-844b-2b7184533212','Transaction object',3,'',15,1),(138,'2018-05-03 12:27:58.044085','4d77683a-1c19-4e61-800f-79fd32847dc6','persona3: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(139,'2018-05-03 12:28:21.890092','2ea8fa55-f594-4746-b5bd-cb3aae1d11c0','Latrueca: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(140,'2018-05-03 12:28:31.089777','18c42a4b-d502-4701-a479-1a6ee1d95181','jjoseba: 0.0',2,'[{\"changed\": {\"fields\": [\"balance\"]}}]',17,1),(141,'2018-05-03 12:30:09.709341','bbc4b8b5-03ad-4bc9-9be4-34e4663df31d','ni caso otra vez',3,'',1,1),(142,'2018-05-03 12:30:09.715129','de5830f4-9462-4728-a4d3-326295ccc816','prueba ni caso',3,'',1,1),(143,'2018-05-03 12:30:09.717795','65ee5e27-4106-4444-8b33-d7310408c67a','Otra prueba',3,'',1,1),(144,'2018-05-03 12:30:09.719597','ac5a7bf0-0067-43be-a554-954df9042070','SDFASDFA',3,'',1,1),(145,'2018-05-03 12:30:09.722303','8d9de00b-fe14-4198-8263-c70aa240070f','prueba notificacion noticia',3,'',1,1),(146,'2018-05-03 12:30:09.724763','5cd197e8-d229-4595-9a2c-a21ae8c84661','Noticia de prueba. Probando',3,'',1,1),(147,'2018-05-03 12:35:21.404826','16','comercio2',3,'',9,1),(148,'2018-05-03 12:35:21.408144','18','comercio3',3,'',9,1),(149,'2018-05-03 13:10:03.028633','15','persona3',3,'',9,1),(150,'2018-05-03 13:10:19.674281','17','Joseba S. - Centro de mayores',3,'',24,1),(151,'2018-05-03 13:10:19.677889','16','Joseba S. - Clases de apoyo escolar',3,'',24,1),(152,'2018-05-03 13:10:19.679821','15','Joseba S. - Clases de apoyo escolar',3,'',24,1),(153,'2018-05-04 08:09:40.407670','19','julio',3,'',9,1),(154,'2018-05-04 08:21:26.308961','29','julio',3,'',9,1),(155,'2018-05-04 08:22:24.470327','20','pagadora',3,'',9,1),(156,'2018-05-07 07:55:19.220983','30','julio',3,'',9,1),(157,'2018-05-16 10:20:05.632807','10','Agrocompostaje',3,'',23,1),(158,'2018-05-16 14:51:31.041497','10077c6e-72f9-4ad5-a5d4-6543f8d1457d','admin: 0.0',3,'',17,1),(159,'2018-06-05 15:12:02.329555','34','comercioprueba',3,'',9,1),(160,'2019-05-29 15:49:32.274450','1','vps530178.ovh.net:8000',2,'[{\"changed\": {\"fields\": [\"domain\"]}}]',22,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (23,'activities','activity'),(24,'activities','personactivity'),(7,'admin','logentry'),(10,'auth','group'),(8,'auth','permission'),(9,'auth','user'),(11,'contenttypes','contenttype'),(2,'currency','category'),(6,'currency','entity'),(3,'currency','gallery'),(4,'currency','galleryphoto'),(5,'currency','person'),(20,'fcm_django','fcmdevice'),(1,'news','news'),(12,'offers','offer'),(21,'sessions','session'),(22,'sites','site'),(19,'tastypie','apiaccess'),(18,'tastypie','apikey'),(14,'wallets','payment'),(15,'wallets','transaction'),(16,'wallets','transactionlog'),(17,'wallets','wallet'),(13,'wallets','wallettype');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-03 21:51:29.431646'),(2,'auth','0001_initial','2018-04-03 21:51:29.876066'),(3,'admin','0001_initial','2018-04-03 21:51:29.996019'),(4,'admin','0002_logentry_remove_auto_add','2018-04-03 21:51:30.016597'),(5,'contenttypes','0002_remove_content_type_name','2018-04-03 21:51:30.079691'),(6,'auth','0002_alter_permission_name_max_length','2018-04-03 21:51:30.091835'),(7,'auth','0003_alter_user_email_max_length','2018-04-03 21:51:30.109778'),(8,'auth','0004_alter_user_username_opts','2018-04-03 21:51:30.124209'),(9,'auth','0005_alter_user_last_login_null','2018-04-03 21:51:30.158338'),(10,'auth','0006_require_contenttypes_0002','2018-04-03 21:51:30.161655'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-03 21:51:30.175337'),(12,'auth','0008_alter_user_username_max_length','2018-04-03 21:51:30.235127'),(13,'currency','0001_initial','2018-04-03 21:51:30.295682'),(14,'currency','0002_auto_20170926_1133','2018-04-03 21:51:30.332966'),(15,'currency','0003_auto_20170927_1313','2018-04-03 21:51:30.435080'),(16,'currency','0004_wallet','2018-04-03 21:51:30.494332'),(17,'currency','0005_transaction','2018-04-03 21:51:30.793912'),(18,'currency','0006_offer','2018-04-03 21:51:30.856803'),(19,'currency','0007_person','2018-04-03 21:51:30.925220'),(20,'currency','0008_auto_20171010_1609','2018-04-03 21:51:30.985559'),(21,'currency','0009_auto_20171010_1804','2018-04-03 21:51:31.037218'),(22,'currency','0010_person_fav_entities','2018-04-03 21:51:31.139043'),(23,'currency','0011_auto_20171011_1054','2018-04-03 21:51:31.245182'),(24,'currency','0012_auto_20180105_1316','2018-04-03 21:51:31.310817'),(25,'currency','0013_auto_20180105_1341','2018-04-03 21:51:31.522809'),(26,'currency','0014_auto_20180118_1324','2018-04-03 21:51:31.643462'),(27,'currency','0015_auto_20180118_1357','2018-04-03 21:51:31.696216'),(28,'currency','0016_auto_20180118_1757','2018-04-03 21:51:31.800430'),(29,'news','0001_initial','2018-04-03 21:53:33.157820'),(30,'offers','0001_initial','2018-04-03 21:53:37.832147'),(31,'offers','0002_auto_20180130_1331','2018-04-03 21:53:37.856856'),(32,'wallets','0001_initial','2018-04-03 21:53:47.668455'),(33,'wallets','0002_remove_transaction_status','2018-04-03 21:53:47.710600'),(34,'wallets','0003_payment','2018-04-03 21:53:47.828245'),(35,'wallets','0004_auto_20180201_1018','2018-04-03 21:53:48.172421'),(36,'wallets','0005_transactionlog','2018-04-03 21:53:48.244448'),(37,'wallets','0006_auto_20180202_1230','2018-04-03 21:53:48.364269'),(38,'wallets','0007_auto_20180202_1307','2018-04-03 21:53:48.389216'),(39,'wallets','0008_payment_status_length','2018-04-03 21:53:48.410547'),(40,'wallets','0009_wallet_pin_code','2018-04-03 21:53:48.448698'),(41,'wallets','0010_wallet_types','2018-04-03 21:53:48.532361'),(42,'wallets','0011_initial_wallet_types','2018-04-03 21:53:48.576239'),(43,'wallets','0012_entity_wallet_type','2018-04-03 21:53:48.622194'),(44,'wallets','0013_wallet_no_user','2018-04-03 21:53:48.700528'),(45,'wallets','0014_debit_wallet','2018-04-03 21:53:48.756409'),(46,'currency','0017_add_user_groups','2018-04-03 21:54:54.201022'),(47,'currency','0018_entity_user_foreignkey','2018-04-03 21:54:54.278093'),(48,'currency','0019_auto_20180227_1921','2018-04-03 21:54:54.358012'),(49,'currency','0020_profile_address','2018-04-03 21:54:54.453409'),(50,'currency','0021_bonus_percent_entity','2018-04-03 21:54:54.561609'),(51,'currency','0022_entity_percent_validators','2018-04-03 21:54:54.671753'),(52,'fcm_django','0001_initial','2018-04-03 21:54:54.747423'),(53,'fcm_django','0002_auto_20160808_1645','2018-04-03 21:54:54.802715'),(54,'fcm_django','0003_auto_20170313_1314','2018-04-03 21:54:54.834317'),(55,'sessions','0001_initial','2018-04-03 21:54:54.858380'),(56,'sites','0001_initial','2018-04-03 21:54:54.878056'),(57,'sites','0002_alter_domain_unique','2018-04-03 21:54:54.897842'),(58,'tastypie','0001_initial','2018-04-03 21:54:54.988375'),(59,'activities','0001_initial','2018-04-14 14:45:04.295206'),(60,'activities','0002_personactivity','2018-04-20 15:46:49.781221'),(61,'activities','0003_auto_20180420_1309','2018-04-20 15:46:49.980525'),(62,'activities','0004_auto_20180422_1720','2018-04-22 15:21:21.675917'),(63,'wallets','0015_auto_20180422_1720','2018-04-22 15:21:21.721595'),(64,'activities','0005_personactivity_daytime','2018-05-03 11:06:13.389375');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('09c3uwqd7emv5p4y0cccru4adif351fz','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-07-16 14:58:17.203526'),('104yabiou6l71i6v3s4kjm2suw98r77a','NDFhZTkyNTMyNGI2ODM5ZDZmZjdlOTBkYjhkMmQ2Mzc4MDQ2OTA5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNjUxN2I4YWQwODY3YTFjMTIxMTRiNWE1OTNkOTRhZWVlMGM4ZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMyJ9','2018-05-30 09:23:07.404870'),('12z8o3w9uvm43ajhjgz035gv0ibivn5m','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-11 08:21:29.933978'),('1mwfu3fxs86bc03uzj460nwqmsrdaumw','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-07-17 15:50:45.274462'),('1npzawztv9x66ohb4kuj6nddmpcu5xtq','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-07 09:34:55.050965'),('2fflll8aznn3c4zq1j6slup128v1j6en','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-04 16:06:49.127251'),('2hgq95pwzm1068r8dzefik6qejldjunu','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-04 16:03:50.468101'),('3cfbcqn9fz9dylfios3oo6q03ikttp0p','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-18 07:20:07.373834'),('3dlrpew8jwq5nl6ffutlt0ylbsm5bwpp','ZTVlNjE4NTEyYTAwMzEzOTFmNGIxMWU1NjM1ZGJkMmEzMDNhMGNjNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlMDc0MzIxZmZjOGZmNmFjMTljYzJiZmVlYWJkMDQxYzFjM2JmODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2018-05-28 13:57:35.687241'),('4i6nyrxfn9ogdbk1b85h871o8fljl52w','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-04 18:03:33.862172'),('4umqcl4yuikk7jgld2npsrv2omvaicn1','MzFkOTcyOWZlYzdmMGZjMmQzMzk0ZTQ2YzViZjk5MTU4YWRmMTQxNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3YzgzMjAzOWM0NjBkYWVjODFjZDU5ZmYxZTIyMzcwMDFiYWIzYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2018-05-22 10:45:39.232996'),('53y5z7qophtexfwk1vmmjoqj3yux5gun','Nzg3NjFkNGUyNjg0YmYyMzllMWEzNzZlODgzYzE4Mjc1ZTg5YTRhODp7Il9hdXRoX3VzZXJfaGFzaCI6ImJkYThlNGQxM2I1NjdjMjAwM2Y5Yjk4MjM1MGJiNDUyY2YzODEyODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2018-06-19 15:10:55.306863'),('5i8rjnkdpqulnv4a200o96i0ag77l7k7','MzFkOTcyOWZlYzdmMGZjMmQzMzk0ZTQ2YzViZjk5MTU4YWRmMTQxNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3YzgzMjAzOWM0NjBkYWVjODFjZDU5ZmYxZTIyMzcwMDFiYWIzYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2018-05-22 09:05:25.617514'),('5i9xxpdfa0ek8unzux5pul8vir4vn0ig','Y2MxZmRlMzcyZWNiMWFjMjk0ODExYTZhZjQ5MGYwMTU5YTk5MGQyMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyYjVmZGRkMjk2NTE0MjJlYzM2MmI3ODJmOTg0ZjY4NDg4Njg5OGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-05-10 15:13:44.631731'),('68gajq6y0y8i057ng2kterubdpsze2u1','NGY3YjE2MGU5OGFiZmM3MTA4ZGY1MGIxMDNiN2I3YmNlYmUxNDQ2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMDhlYTc0NmU1ZGI2ZDEwZjk4ZDM4NjllYzZiNWQ4OTkyMjM0OGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2018-05-22 10:13:22.418073'),('6khxdhyieespyh7y6wk1amynwotgra3u','YmU3YzFkNjE1ZGFlZTM0MGIwZmM3NzcyNGJhNmVmYzIyMGM5ZjE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZmNTNjYWNhMDkyYmFkMGQ1NzQ2NDQ1ZTYzZWQ1MjE3ZDhiYmVjZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2018-05-23 14:49:27.607364'),('6kl1mfa0cws5q80ky43d09ge0pxsxcxp','NGY3YjE2MGU5OGFiZmM3MTA4ZGY1MGIxMDNiN2I3YmNlYmUxNDQ2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMDhlYTc0NmU1ZGI2ZDEwZjk4ZDM4NjllYzZiNWQ4OTkyMjM0OGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2018-05-25 12:14:56.484935'),('787rg4f5tranqqs6aqtbjh7ai8beltig','MjE5OTBlNDZiMjBiNzYxMzUxNzMwOTk5YTc4ZGNlNTI2NTBkODJmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImViMzNlYTEwZmQ0MGU5YTEzM2U5NTk5MWVhNzRlZDZmYWY0YzdlNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9','2018-07-20 11:12:44.035213'),('7wh92awmi2zrarn5g6wstatdifw4c4oi','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-07 10:14:02.034886'),('88jhxdpt3ie16kcc8u8mqsmc718m3gux','ZTYwZDRkYmFiNjBiMGVlMTAzZjM1ZmMxOTU4MDg3MWJjZjY2MDI5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0N2IzMGQxODk4ZTJkMWIzNTcxZDMzNGExOTk1ZjhiZmJhMjEwMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2018-06-27 12:26:26.576297'),('8i5dd1jbmzzvc4ir5ncvctl9ynjdkac3','NGY3YjE2MGU5OGFiZmM3MTA4ZGY1MGIxMDNiN2I3YmNlYmUxNDQ2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMDhlYTc0NmU1ZGI2ZDEwZjk4ZDM4NjllYzZiNWQ4OTkyMjM0OGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2018-05-17 11:32:11.580032'),('8wpwj5yt3cqbcfgicm5kmkw7rm0a6tdp','MGExMDRjZDhhYTdiMTA5NzJhNTU2MzA1NzUwMDI2ZjRjNDgxODI2ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU3NDhiZDlhM2QxOTY0MzA5MTM3MzE5Mjc2N2Y0MWFhYWQ4OTVjNzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMCJ9','2018-05-18 08:23:29.855336'),('982v45mvzlgb2focbckr706atxs1qg87','ODYyMTFiODdjNjhjZjQyMjcxMDlmMjlmMTI5MjY4ZWU4NzY5MTljMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4NDgwYzU0ZGM4NWI4NGEyYmRkOWRhNjMzZjhmYmJlNmE4ZjA1ZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2018-05-22 10:11:38.906023'),('99c7to6qwxo1tz7rv986rnvvtjyswi20','ZTVlNjE4NTEyYTAwMzEzOTFmNGIxMWU1NjM1ZGJkMmEzMDNhMGNjNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlMDc0MzIxZmZjOGZmNmFjMTljYzJiZmVlYWJkMDQxYzFjM2JmODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2018-05-30 07:41:48.840816'),('9lmx3vq6lksdoa896pref2e6nj49689n','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-21 07:53:42.069035'),('9uywdup1og15bishg6dxzuzo7xuy72ys','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-11 08:43:17.044425'),('aefm1z0ww17gk8vye9ca3suykl9hrobu','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-11 09:34:47.913560'),('bdne94mqe444w4m5n2zc5jb0n04bj5h7','ZTYwZDRkYmFiNjBiMGVlMTAzZjM1ZmMxOTU4MDg3MWJjZjY2MDI5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0N2IzMGQxODk4ZTJkMWIzNTcxZDMzNGExOTk1ZjhiZmJhMjEwMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2018-06-04 10:36:51.899397'),('bsohq32rykza484sqxsx9pgknoireqcb','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-04 16:15:13.145410'),('c7m7ofvovf17yzctl0x4lmmsbvu8nrt1','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-06-25 12:21:16.638703'),('cdznyg11bjd6rjtdgoflldfff8gokkhw','OTAxM2MwNGM5Mjg1NzllY2QxYTUwYWI3MzQ4OGQzODQ2YTFlNTk4MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyZDE4NDQ2NzZjOTkxZDQ1NjY5ZmVmZjdiMjM4ZWFhZmE3NGY3MmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9','2018-05-07 09:34:12.613421'),('crlo8x67qlt3y5b0txkev9ex8inn2y7x','ZWM1MWRmMWY1ZTMwYjhmODdlYTEyNWY0OWE4MmY3MGExMzEwZjk0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3MTQ0ODdkYjNkMmEyMWVkYmQ4NDZlZjMyODFhMTkxOWU4ZDEwMGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMiJ9','2018-05-09 14:44:20.731839'),('dt7i4an5wbnyj9zxkkv812zhf7146cbo','YmU3YzFkNjE1ZGFlZTM0MGIwZmM3NzcyNGJhNmVmYzIyMGM5ZjE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZmNTNjYWNhMDkyYmFkMGQ1NzQ2NDQ1ZTYzZWQ1MjE3ZDhiYmVjZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2018-06-27 12:31:23.130929'),('dy5kl85d3eyatz5utm30pw8zl0rfapli','ZTYwZDRkYmFiNjBiMGVlMTAzZjM1ZmMxOTU4MDg3MWJjZjY2MDI5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0N2IzMGQxODk4ZTJkMWIzNTcxZDMzNGExOTk1ZjhiZmJhMjEwMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2018-06-27 12:29:29.270768'),('edw1cwhif82y0ut1erzwncirkacjl13e','NGI0ZmRjOTU0N2M2MmQ4NGNhMmNlMzBhNWRhNGRjOTIyYzQ1ZDVmZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFkYTNiNDI0YzQzZjQwZjY1YzNmZWY3MDcxNTU3NzgwODYzZmIwYjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2018-05-25 11:20:10.338242'),('ezrulnn4pm4qiu42eoymlxferiomnah3','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-10 15:06:10.177593'),('fe53asukkzzz1c566irl1tol2yzjccbn','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-06-12 14:16:05.412775'),('gdbf0nnhod6du2t6bvhd1fr5wkkm63wr','Y2MxZmRlMzcyZWNiMWFjMjk0ODExYTZhZjQ5MGYwMTU5YTk5MGQyMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyYjVmZGRkMjk2NTE0MjJlYzM2MmI3ODJmOTg0ZjY4NDg4Njg5OGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-05-10 14:32:52.824006'),('ghtdwscptju6yac6p60nqczv4k5xtmid','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-12 00:05:01.530148'),('gk18rk0lkk6l0u3ti4zbbnssf7hiukaj','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-21 07:54:28.060132'),('h1o0szesqzvpz4x6f0li6r9vy0wl21ik','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-25 09:32:49.481992'),('h5fc9lizgt8pr01i0m0hufyda6iy1ram','YjZhZjUxMjFmM2EzMGJkZjcwMzViN2RiZWFiNjdjMzE5MDNiZmUyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY5N2JiY2Y3M2UyZjc2ZjMwNWEwYmQ5OTY3NDRiZTMxOTA1YjU4ZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNyJ9','2018-06-14 11:23:53.657456'),('i17q7uvw2ds47k0bvp1ncbnvwuyojri9','ODI2MjNkYWQ5ZWQ2OTdkNWE3M2VjZTc0MWExM2Y4NDllNzAwZTQzYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1ODhhZjdiODRlMTIxZGMxYTUzNjRkYzAyNWE3MjVmNzg2N2QwYzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2018-05-28 12:09:33.731782'),('i7185i55dhsseuj5dby9j6lf1z744uqh','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-07 09:39:48.981213'),('imacrz5s10k3xggpv8yqsuk5p0p99a6k','MjE5OTBlNDZiMjBiNzYxMzUxNzMwOTk5YTc4ZGNlNTI2NTBkODJmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImViMzNlYTEwZmQ0MGU5YTEzM2U5NTk5MWVhNzRlZDZmYWY0YzdlNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9','2018-05-24 12:49:33.583087'),('izrbl4sfda4cy8giena8iuoyosyh4ajh','ZTYwZDRkYmFiNjBiMGVlMTAzZjM1ZmMxOTU4MDg3MWJjZjY2MDI5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0N2IzMGQxODk4ZTJkMWIzNTcxZDMzNGExOTk1ZjhiZmJhMjEwMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2018-06-27 18:37:39.829539'),('j243r9zhslz5x3zzyu4a9tgwdcjs1ha6','NGY3YjE2MGU5OGFiZmM3MTA4ZGY1MGIxMDNiN2I3YmNlYmUxNDQ2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMDhlYTc0NmU1ZGI2ZDEwZjk4ZDM4NjllYzZiNWQ4OTkyMjM0OGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2018-05-22 15:48:19.906051'),('j80e4074h3m6p4wb8qoncd1eule0cxkg','Y2MxZmRlMzcyZWNiMWFjMjk0ODExYTZhZjQ5MGYwMTU5YTk5MGQyMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyYjVmZGRkMjk2NTE0MjJlYzM2MmI3ODJmOTg0ZjY4NDg4Njg5OGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-05-09 09:12:35.924123'),('jb0e01taigb40h3pumyi3q9xk52i68g1','NjJlM2FlNGM5MDBkNTg0YTQ5MDdmZmRhZGZjODc0MTIyMzM1ODE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE5NmM3NzcxODk1NWRkZTA4N2Y5NTg5Yzk4Y2NiOWM3YWJkOTIwNzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2018-05-10 14:45:26.739787'),('jnf44jwqt7esv73bgzxd61ulewistx1u','NDVkZjM2OTRjOGRhODQ3MGM1NWQ4YzI5YTA4MGFmYmM0YWJkYzFhYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImVkODA3ODdjMzFiOGM4YTBiN2ZmYTdmNTBhM2M3MzJlYTBhYjg5YmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSJ9','2018-05-07 09:50:11.769566'),('kfqwi0y1fage5v0qrt6b432o8ptge25v','ZTYwZDRkYmFiNjBiMGVlMTAzZjM1ZmMxOTU4MDg3MWJjZjY2MDI5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0N2IzMGQxODk4ZTJkMWIzNTcxZDMzNGExOTk1ZjhiZmJhMjEwMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2018-08-13 18:48:42.167765'),('kp4zuh7ng1dfho5w3zjyoa88qgyx7hy7','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-07 09:05:03.092999'),('ks6h6975t0p565qqu3xgghr6l3si5d0s','MjY2MzYyM2IyOGU4ZjIzNDQ0N2FhOTI1ZWZhMWExZjE0ZjNiODJlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjY3NzlmNDUxZDBlNjExZTM2M2NiMmZmNWQzYTJjNDZmYWJhZWQ1ODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzNCJ9','2018-06-19 15:10:15.010088'),('lytoeeliwt4ir021w6b0i84lg1b2s5fc','Y2MxZmRlMzcyZWNiMWFjMjk0ODExYTZhZjQ5MGYwMTU5YTk5MGQyMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyYjVmZGRkMjk2NTE0MjJlYzM2MmI3ODJmOTg0ZjY4NDg4Njg5OGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-05-09 14:26:25.717659'),('n6xa92j08nv1489k82e6ddakvytboxtg','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-11 08:28:04.739352'),('n70q16qyno4415k5c5tgzmf7olxvdnrd','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-04 17:25:50.225301'),('nt5qjhhe5y5iux0kjv31s7300qr1rs8i','MjY2MzYyM2IyOGU4ZjIzNDQ0N2FhOTI1ZWZhMWExZjE0ZjNiODJlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjY3NzlmNDUxZDBlNjExZTM2M2NiMmZmNWQzYTJjNDZmYWJhZWQ1ODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzNCJ9','2018-06-19 15:10:13.133192'),('nusi0hoyurfes634fhar58is934n2nwa','ODYyMTFiODdjNjhjZjQyMjcxMDlmMjlmMTI5MjY4ZWU4NzY5MTljMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4NDgwYzU0ZGM4NWI4NGEyYmRkOWRhNjMzZjhmYmJlNmE4ZjA1ZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2018-06-26 08:08:40.359751'),('nyuyv85q6w96wwn73bwq52z6xbmzfj3x','OTAxM2MwNGM5Mjg1NzllY2QxYTUwYWI3MzQ4OGQzODQ2YTFlNTk4MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyZDE4NDQ2NzZjOTkxZDQ1NjY5ZmVmZjdiMjM4ZWFhZmE3NGY3MmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9','2018-05-10 15:03:41.089988'),('o71gjw471lk8c1km1qlvuvq3ied4rvbk','NGI0ZmRjOTU0N2M2MmQ4NGNhMmNlMzBhNWRhNGRjOTIyYzQ1ZDVmZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFkYTNiNDI0YzQzZjQwZjY1YzNmZWY3MDcxNTU3NzgwODYzZmIwYjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2018-05-11 08:37:53.119166'),('oswjb5efu5gzaw2hayoqg2a05yposfo9','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-12 00:37:16.843420'),('otr60i4ctu2ib2pd2vm91ftz66ljabi4','ZTVlNjE4NTEyYTAwMzEzOTFmNGIxMWU1NjM1ZGJkMmEzMDNhMGNjNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlMDc0MzIxZmZjOGZmNmFjMTljYzJiZmVlYWJkMDQxYzFjM2JmODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2018-05-28 14:42:49.147040'),('pdaf1c3otfojgh4nl9fijz65gt65a61a','NDEzZTA5MjM1ZDJmNzU3Nzc0ZmUyYTMzOGNmZTQ5NDk5NzM1ZDk2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5ZDc5M2Y1MjRhYWM4YTBlZjVkNDg5MmUyYzVlZDMxMzE3YjNjZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNCJ9','2018-05-04 16:02:55.425288'),('phhv0jouyxl8rnwxnlayh62312cgmc84','ODI2MjNkYWQ5ZWQ2OTdkNWE3M2VjZTc0MWExM2Y4NDllNzAwZTQzYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1ODhhZjdiODRlMTIxZGMxYTUzNjRkYzAyNWE3MjVmNzg2N2QwYzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2018-05-21 10:12:31.868057'),('piamnzohmtp4wkipc0sr3dwmo8941x63','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-07 16:22:44.081863'),('pxij6xnf8mz2nygto5z2qi8due1r13nb','Nzg3NjFkNGUyNjg0YmYyMzllMWEzNzZlODgzYzE4Mjc1ZTg5YTRhODp7Il9hdXRoX3VzZXJfaGFzaCI6ImJkYThlNGQxM2I1NjdjMjAwM2Y5Yjk4MjM1MGJiNDUyY2YzODEyODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2018-06-19 14:51:03.924584'),('q9ocrhet7eicyvaa4ornyp30ejc9c4av','MjE5OTBlNDZiMjBiNzYxMzUxNzMwOTk5YTc4ZGNlNTI2NTBkODJmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImViMzNlYTEwZmQ0MGU5YTEzM2U5NTk5MWVhNzRlZDZmYWY0YzdlNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9','2018-05-24 16:17:18.722471'),('qnle158k8b00xakydn04a7b2esl5rznc','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-04 16:15:43.701177'),('r1va12uwa6vzmlva0ac56fbbs50g3dbr','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-23 10:50:31.664045'),('rf2mbkp823ffcpxdtxqve49toeezb5hf','Njg2ZjdkODVmMzcxNDU1OTcwMDE3ZDg5ZTQzMjFjZTQxYzNiMmJhZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVjYWQxMjczNDJhOWYyNjk2MDI5YjliOGNjZmI3YTc5YjVmMzBkZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2019-06-14 09:00:59.850689'),('s4n0r0aozujuxxh5ch33fvs6rcxz8fs8','YmU3YzFkNjE1ZGFlZTM0MGIwZmM3NzcyNGJhNmVmYzIyMGM5ZjE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZmNTNjYWNhMDkyYmFkMGQ1NzQ2NDQ1ZTYzZWQ1MjE3ZDhiYmVjZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2018-06-27 12:24:46.877640'),('sg3ulaynt8yd5q3ecick2y09bdo5czd1','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-06-12 15:49:14.613953'),('si19409z741yyxihu7qjufaxto3i0oia','MzFkOTcyOWZlYzdmMGZjMmQzMzk0ZTQ2YzViZjk5MTU4YWRmMTQxNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3YzgzMjAzOWM0NjBkYWVjODFjZDU5ZmYxZTIyMzcwMDFiYWIzYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2019-06-14 11:16:22.831607'),('sw3kjefrdp4l7sfryhbs3iirfwf16jtx','NGY3YjE2MGU5OGFiZmM3MTA4ZGY1MGIxMDNiN2I3YmNlYmUxNDQ2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMDhlYTc0NmU1ZGI2ZDEwZjk4ZDM4NjllYzZiNWQ4OTkyMjM0OGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2018-05-22 10:47:08.682525'),('t56pvsiqejva2i0hi11e5rtqsv3rux2x','MGEyNDRjMmIxMjg1NTBjOGI5ZDExMWUwYzMzZDZkOWYxNGNjMjQ1Njp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5MDliOTgxOTlhM2RmOGQyZjRkMjg5YTAwOWRhMDc0ODViMDM1YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSJ9','2018-05-17 12:34:03.518247'),('t9rbzp0ukz2t5703v8cfleat92ha2lrt','YjZhZjUxMjFmM2EzMGJkZjcwMzViN2RiZWFiNjdjMzE5MDNiZmUyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY5N2JiY2Y3M2UyZjc2ZjMwNWEwYmQ5OTY3NDRiZTMxOTA1YjU4ZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNyJ9','2018-05-28 05:38:19.014935'),('ta8yxdpnnucausmfwaf0fb4lhwpocknu','NzY2ZDQ4ZGY2YmVlYmJkZTZjYWZiZmFjNzA4ODc1N2M3OGQ1NGNmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlNjQ5MGU0ZjA0OGRlZjVhMDcyYjIwMWQwNTNkODQ4MzE5YjhkYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-05-10 18:07:55.173118'),('tca6rakfihtawt8r9gl1122nima7k4zl','MzBjNTQzYzZhOTFjMmU5YzU4NDY3YThkODYyMzExN2UwMDZjMGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MWEwNGExYzNlNzVkMmNmNzJlZDk3NTkyZDAyN2EzOGZhM2ZlMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-05-12 13:32:08.228273'),('td3pzdbect92wfpxui231u2m6cclh8sy','NTEwZGQ4NTRjZWE4Y2Y4MzZlMjU0ZjhkNTJjMjI0OTk0ZjE3OWZlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyMzQ1NjEzY2NmZWU4NWNhNDM1OTk3MWQ2ZmYwZjRmZGY3YzdiYzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMiJ9','2018-05-24 13:18:46.500223'),('thvzzr97zcqxkh3a1ufwy6snruow7t7p','ZTVlNjE4NTEyYTAwMzEzOTFmNGIxMWU1NjM1ZGJkMmEzMDNhMGNjNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlMDc0MzIxZmZjOGZmNmFjMTljYzJiZmVlYWJkMDQxYzFjM2JmODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2018-05-30 09:25:52.088044'),('tw84gyuwvwpmd1mjqw7cbakc1nta0lsj','MjE5OTBlNDZiMjBiNzYxMzUxNzMwOTk5YTc4ZGNlNTI2NTBkODJmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImViMzNlYTEwZmQ0MGU5YTEzM2U5NTk5MWVhNzRlZDZmYWY0YzdlNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9','2018-08-11 19:26:22.275295'),('ue0vneglmxl1vobgio6si9fg06nc24lk','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-06-19 14:49:08.264602'),('uqb5yb71jffnjcw3w01lqo0fzhso8foc','OTAxM2MwNGM5Mjg1NzllY2QxYTUwYWI3MzQ4OGQzODQ2YTFlNTk4MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyZDE4NDQ2NzZjOTkxZDQ1NjY5ZmVmZjdiMjM4ZWFhZmE3NGY3MmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9','2018-05-10 14:48:27.762705'),('v568nw1kh5vvrwvro364rypz4z3d4ttl','Njg2ZjdkODVmMzcxNDU1OTcwMDE3ZDg5ZTQzMjFjZTQxYzNiMmJhZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVjYWQxMjczNDJhOWYyNjk2MDI5YjliOGNjZmI3YTc5YjVmMzBkZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2019-06-12 14:38:37.661405'),('wn1o8nrf51k8m17rrvalao5jmtao8yc8','Y2MxZmRlMzcyZWNiMWFjMjk0ODExYTZhZjQ5MGYwMTU5YTk5MGQyMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyYjVmZGRkMjk2NTE0MjJlYzM2MmI3ODJmOTg0ZjY4NDg4Njg5OGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-05-28 14:51:23.706652'),('xkewjxlvwrqgkacatmufuyectbuetqsq','NTEwZGQ4NTRjZWE4Y2Y4MzZlMjU0ZjhkNTJjMjI0OTk0ZjE3OWZlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyMzQ1NjEzY2NmZWU4NWNhNDM1OTk3MWQ2ZmYwZjRmZGY3YzdiYzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMiJ9','2018-05-24 14:34:23.537753'),('xpv4w11q4w8tokca5xjgk3jn082c8hs0','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-09 14:33:48.761634'),('xqofkvbej2fxdyjv03syx8909x8vgf17','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-17 22:00:14.026758'),('xu25vlpv9l2pmtc42y913wk0n1oh7ini','NzZhMWU0NmRiYzg3Nzg1NWEwMWZlNmQyOTJhNGNiZmMwZTQwYTk4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3MDVjOWQ5ZTI4YzA1MzYxNjBlZDY1YmVlMjcwNzA2MWY3ZjBhMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-25 12:03:54.597067'),('yf6x205x84jubhdeuppcj39njcx509yu','NDFhZTkyNTMyNGI2ODM5ZDZmZjdlOTBkYjhkMmQ2Mzc4MDQ2OTA5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzNjUxN2I4YWQwODY3YTFjMTIxMTRiNWE1OTNkOTRhZWVlMGM4ZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMyJ9','2018-05-30 07:41:32.970232'),('ypgnjueeg3icvcmv477mkhcreamss1b5','OWU3ZDU5NDI4MDFmZmEwNjIyOGZhNjgyYjIxOTA4ZmIzMTc1NDE1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5ZjcyMWY3NjNkOTMyNjg4ODRlNTk0ZmI3NzI1NjJkYTc1ZGUzNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSJ9','2018-05-07 09:44:24.984707'),('zworgkbcdio1t49er5iktxmo86p40v3w','MzFkOTcyOWZlYzdmMGZjMmQzMzk0ZTQ2YzViZjk5MTU4YWRmMTQxNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3YzgzMjAzOWM0NjBkYWVjODFjZDU5ZmYxZTIyMzcwMDFiYWIzYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2018-05-22 15:44:41.273282');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'vps530178.ovh.net:8000','Boniatillo');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fcm_django_fcmdevice`
--

DROP TABLE IF EXISTS `fcm_django_fcmdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fcm_django_fcmdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `device_id` varchar(150) DEFAULT NULL,
  `registration_id` longtext NOT NULL,
  `type` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fcm_django_fcmdevice_user_id_6cdfc0a2_fk_auth_user_id` (`user_id`),
  KEY `fcm_django_fcmdevice_device_id_a9406c36` (`device_id`),
  CONSTRAINT `fcm_django_fcmdevice_user_id_6cdfc0a2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fcm_django_fcmdevice`
--

LOCK TABLES `fcm_django_fcmdevice` WRITE;
/*!40000 ALTER TABLE `fcm_django_fcmdevice` DISABLE KEYS */;
INSERT INTO `fcm_django_fcmdevice` VALUES (5,'HUAWEI TRT-LX1',1,'2018-04-25 09:12:37.000046',NULL,'f4M1pv1C7ow:APA91bEGyQagYVedCq0QhZPdfkAY0yeIKJu3HJ8gnSLu9gDAExcJM0tVGd6rsv2q9n05N_8jYFx_XX93LHG1WF5jmwd6tnrr0g657k65S1TJh845i_UZzF7zTS1Qq0Cgnd8h3JRjuo3N','android',8),(6,'samsung SM-A300FU',0,'2018-04-25 14:44:21.078398',NULL,'feR9RIfXlbU:APA91bHvwqGniVEIX-YWenO0faokvpXfbgmoAqVuIYzwMybcRSpMaqoETTAuEihYJcaAAbY1jitedGRLgitNeoQZoUWdwZZR3-cydGluVXWLLlI3hDv42UQmjwMXmBetd9CyO2Gpcc8h','android',22),(8,'bq Aquaris_A4.5',1,'2018-04-27 08:37:53.788454',NULL,'cwW-8urthBI:APA91bGdYlMZ2ayYVoNgRFBvgALy4db-XAJvtSizhxV4ybU259YmmTgNm9tJQfBqXbEsVZvg8aJxDJ5EXjwbvPkrBP6Ol5p-RSZ7yusySMKX4jtu8xiOtQafY8vpE5UrSD--e5D7XVwP','android',13),(9,'samsung SM-J510FN',1,'2018-05-03 11:32:13.653519',NULL,'ctF6rWWQ0f8:APA91bHJAepeulez7LVgczXwwXsKCV5kQlESZG4i05GZddN9OJyTSfPmQolAIo3bok4tXj02JlnZn3efLr3AdbxlCDlSOW6h87doJed44BfP-vYmjCAgioRNSrgbIdAIGDX2LZeyOUjB','android',28),(10,'Sony G8441',1,'2018-05-07 10:12:32.033745',NULL,'cxRpNnKmS6k:APA91bEz33oLufflDtm3lZuezVmJqLLx_L7KK2_k_jYGjQ06t9mKlFeGewcbVhtduj3izXCs9JS8YsXA4qNFWiIaotMbUriAp_UA64KkET-XRhrIe2dG7clna6n3AdrklbcjfkEUNBNm','android',31),(11,'samsung SM-J415FN',0,'2018-05-08 09:05:26.985763',NULL,'dkls7Xrov5g:APA91bGyoROrzQyCAhr8s_j60ZhLBjygCKw2t6GLPxV6JR-b6cm6bK7Li10nudGTSlHD_W8n__N7foWr_ZEtV2COBY8XgkIuc1zSQDrH9y8bsce_7YHOfYpOFofPuJI47jTk50YedN9Z','android',7),(12,'samsung SM-G955F',1,'2018-05-08 10:11:40.343144',NULL,'fSv5CboX114:APA91bFMb3WMMVGAPse6bDrLTv91kyHzpogdvRh8fJ-JrHfd5e4lvCgoFnWFa0_-Ry2gPt5xo8b_1RAZdNvxLeN6vOdnOcw0dCQCgBv5ALQQ5h8GAEsXurnP98f3goqEVDxVmnVrBSVP','android',21),(13,'samsung SM-G935F',1,'2018-05-09 14:49:28.285507',NULL,'ewh6ARuJEtU:APA91bGvkaef2vS0soY0kfsryHB69yLvkRJ3tGz-VhxPsJdEEkml8orOUUpEMCtFlB8Dx07dercn6__qe0knpsKSXqmW5ZSQWF6R8nCHlZpSV6tI_cJ2DVyGKO1xcP6ZD16DGPX0B4NI','android',25),(14,'bq Aquaris U Plus',1,'2018-05-10 14:34:24.057082',NULL,'c5ABnLL6bLA:APA91bG_88TXoy_oYfBFNZBwp4eZzX8yrRUvnoWCQ8OETpIkol0svYymL4fhg319gTWk2ZRLS_cfpRPQBEQVs9mmFJUB3IEWWgWOjSnXPiOUgAFjxsOkTosSwTJ2xD_-RRXndZ58r3nT','android',32),(15,'Xiaomi Mi A1',1,'2018-05-10 16:17:19.240302',NULL,'efNiIVYIeEY:APA91bE-SnypWy5EIDf4vDDj9NdQ0c81KdW03_EZGNSxM6xMCZlGA9fOyQkN0OQ1_z2RRbY1jC3-sqfl0m2MAeu9imbH5hhJmogB-UdDoNRclPQXfeJEFxBeyYj9AKDGPRm3jZOnwDqoKrA4Cw1LgfYc2i1ck7VT7g','android',33),(16,'ZTE ZTE BLADE L7',1,'2018-05-14 05:38:22.150275',NULL,'dLLg8pojFNM:APA91bEPbhY2h9OXoYX1upvUoaU2ulNJ6WPcGQ7uyLuDFwk2VbV_UbldHWoHQD_RF5uFQm5we6ieJFt18ZmO-qM9jdbu9XcoF620OBCuH1j3KMHis9YfByy_DJtQ9_JXgM2gJW1pfSYo','android',27),(17,'HUAWEI G620S-L01',0,'2018-05-14 13:57:37.723960',NULL,'fL52O1xvCK8:APA91bEQBYgvYL9d0gUU1tH-6zgZeoJ0NAQb7YZkCsRAbBzyUbw9jvWYWkgDvlKUpCmtuhDUVAgl4QsamfVovXDMafY8a6VMJZlNYxY8cEHBWBpvmclFu464_zIgv4j3iFeldgvG9twr','android',24),(18,'HUAWEI G620S-L01',0,'2018-05-16 07:41:33.379083',NULL,'fL52O1xvCK8:APA91bEQBYgvYL9d0gUU1tH-6zgZeoJ0NAQb7YZkCsRAbBzyUbw9jvWYWkgDvlKUpCmtuhDUVAgl4QsamfVovXDMafY8a6VMJZlNYxY8cEHBWBpvmclFu464_zIgv4j3iFeldgvG9twr','android',23),(19,'HUAWEI TRT-LX1',1,'2018-05-21 10:36:52.424106',NULL,'eXfy0ShGvvE:APA91bERCEMxhj3NyjvA0ygwgkaAFKNPvCUbvUfvg9_KeYeb_9sJryCYl_wWchlHL8CxYBBX2xa6TXbl5qgovDdNbQsPiVkuKqw9V-fa1n6Vo1wfIrsqw2S-YeqbOCxdByaGhn_hKlqnagWKyZVK8WtyvGu3hLbgXg','android',26);
/*!40000 ALTER TABLE `fcm_django_fcmdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news`
--

DROP TABLE IF EXISTS `news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_news` (
  `id` char(32) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `short_description` longtext,
  `description` longtext,
  `banner_image` varchar(100) DEFAULT NULL,
  `published_date` datetime(6) NOT NULL,
  `more_info_text` varchar(250) DEFAULT NULL,
  `more_info_url` longtext,
  `published_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_news_published_by_id_ec0c18cb_fk_auth_user_id` (`published_by_id`),
  CONSTRAINT `news_news_published_by_id_ec0c18cb_fk_auth_user_id` FOREIGN KEY (`published_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news`
--

LOCK TABLES `news_news` WRITE;
/*!40000 ALTER TABLE `news_news` DISABLE KEYS */;
INSERT INTO `news_news` VALUES ('9c374483382140d8b74387623983a3c3','BONIATILLOS','<p><strong>Bienvenidas/os a la APP del Boniatillo</strong>, del Programa Tiempo Social por Moneda,</p>\r\n\r\n<p>Desde ACPP quer&iacute;amos daros las gracias por vuestro inter&eacute;s y participaci&oacute;n en el mismo, y os animamos a que sigais realizando&nbsp;todas las actividades que os sean de vuestro inter&eacute;s. As&iacute; como a que inviteis a vuestros amigos/as a participar.</p>\r\n\r\n<p>Adem&aacute;s, recordaros que ten&eacute;is diversos comercios y/o servicios&nbsp;para &quot;gastar&quot; el Boniatillo como Paler&iacute;a Copiarte, la Trueca, Mamuts Hockey de Villaverde...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Que tengais un buen d&iacute;a,</p>\r\n\r\n<p>Un saludo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','','','2018-06-05 14:26:44.922197',NULL,'',1),('ef4bedb3d5a14ef19c050263d612950d','Concurso de Grafitis-Arte Urbano','<p>Buenas tardes,</p>\r\n\r\n<p><strong>ACPP junto a la Asociaci&oacute;n Vecinal La Unidad de Villaverde Este ponen en marcha un CONCURSO DE GRAFITIS-ARTE URBANO.</strong></p>\r\n\r\n<p>Las personas interesadas podr&aacute;n inscribirse a trav&eacute;s del correo electr&oacute;nico madrid@acpp.com y tendr&aacute;n para ello como fecha tope hasta el 10 de junio de 2018.</p>','<p>ACPP junto a la Asociaci&oacute;n Vecinal La Unidad de Villaverde Este ponen en marcha un <strong>CONCURSO DE GRAFITIS-ARTE URBANO.</strong></p>\r\n\r\n<p>Las personas interesadas podr&aacute;n inscribirse a trav&eacute;s del correo electr&oacute;nico madrid@acpp.com y tendr&aacute;n para ello como fecha tope hasta el 10 de junio de 2018.</p>\r\n\r\n<p><u>FASE I&nbsp;</u>&nbsp;Inscripci&oacute;n del 1 al 10 de juio a trav&eacute;s de madrid@acpp.com</p>\r\n\r\n<p><u>FASE&nbsp;II</u> Entrega de bocetos del 15 al 26 de junio de 2018: una vez se haya comunicado a las personas que cumplen con los requisitos de participaci&oacute;n, se har&aacute; entrega de los bocetos en las fechas marcadas.</p>\r\n\r\n<p><u>FASE III</u>&nbsp;comunicaci&oacute;n a las personas de los bocetos seleccionados, 5 de julio.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>PARTICIPANTES</p>\r\n\r\n<p>Personas residentes de la Comunidad de Madrid, de edades comprendidas entre los 15 y 35 a&ntilde;os.</p>\r\n\r\n<p>Se priorizar&aacute;n aquellas personas vinculadas al Distrito de Villaverde.</p>','news/fa71ae74-d860-4f3c-baab-4c749da41805.jpg','2018-06-05 14:36:56.172733',NULL,'',1);
/*!40000 ALTER TABLE `news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_offer`
--

DROP TABLE IF EXISTS `offers_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_offer` (
  `id` char(32) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `banner_image` varchar(100) DEFAULT NULL,
  `published_date` datetime(6) NOT NULL,
  `discount_percent` double DEFAULT NULL,
  `discounted_price` double DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `entity_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offers_offer_entity_id_e5996424_fk_currency_entity_id` (`entity_id`),
  CONSTRAINT `offers_offer_entity_id_e5996424_fk_currency_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `currency_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_offer`
--

LOCK TABLES `offers_offer` WRITE;
/*!40000 ALTER TABLE `offers_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_key_17b411bb` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_8c8fa920_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
INSERT INTO `tastypie_apikey` VALUES (2,'7b83a4cb41b7059c260ac3770bb7994f44500952','2018-04-20 15:56:45.539361',13),(8,'a214d33237c26ef614886b735d9f1e017d95f27a','2018-04-25 09:12:35.913096',8),(9,'fd7a12886e90d18bae600f08f6fee63dfbab8330','2018-04-25 14:44:20.716919',22),(11,'5d685f27b0f1770fe9d13b7c02bb778858600c3a','2018-05-03 11:32:11.570459',28),(12,'9d876b7acfe7a64432dcd358dfeb07efffc1d99a','2018-05-07 10:12:31.859819',31),(13,'9b311b15cd58bfe4708cd88f1b9641936eb30ceb','2018-05-08 09:05:25.611142',7),(14,'282dd062f8f47f5fe9c0f0cfebc44cd45d74f3ef','2018-05-08 10:11:38.895792',21),(15,'ede3596dde02518a2110e3165730bc0f79c80ddf','2018-05-09 14:49:27.600643',25),(16,'f184be0493dc95e6f17237d7bc1ff4b04422300a','2018-05-10 14:34:23.528299',32),(17,'a0d0c62ad9f7d4ff9ea8bc9ee6fe79bc11927bc0','2018-05-10 16:17:18.716207',33),(18,'2a7588764f3015290303e3d41eb47bd7fd20eb65','2018-05-14 05:38:19.007211',27),(19,'35aea516379c4c8e794dc1d2eb634af87a69c4c8','2018-05-14 13:57:35.675359',24),(20,'49f93c24c50c487e59e04dee4be000a930406bcc','2018-05-16 07:41:32.962909',23),(21,'6f455bf2c7cb4c72dcc7d04fde162ab0ac0364e8','2018-05-21 10:36:51.891588',26);
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets_payment`
--

DROP TABLE IF EXISTS `wallets_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets_payment` (
  `id` char(32) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `processed` datetime(6) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `total_amount` double NOT NULL,
  `currency_amount` double NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_payment_receiver_id_e7a62ce0_fk_auth_user_id` (`receiver_id`),
  KEY `wallets_payment_sender_id_52096391_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `wallets_payment_receiver_id_e7a62ce0_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wallets_payment_sender_id_52096391_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets_payment`
--

LOCK TABLES `wallets_payment` WRITE;
/*!40000 ALTER TABLE `wallets_payment` DISABLE KEYS */;
INSERT INTO `wallets_payment` VALUES ('1dc66a4cfa554b87bc312d9fd11471af','2018-07-13 13:44:16.714025','2018-07-13 13:44:16.831831','accepted',17,17,21,28),('4e24e8baec3540a194f7af148779c2af','2018-07-30 18:58:32.781297','2018-07-30 18:58:32.903536','accepted',2,2,21,25),('6d5c8a753c094b44aa1a21547a0d1756','2018-06-13 12:30:26.013272','2018-06-13 12:30:26.032488','accepted',3,0,21,26),('71f575a80170475fb310d008a9900b56','2018-07-30 18:58:05.855624','2018-07-30 18:58:05.867811','accepted',2,0,21,26),('7211bd1c12da4f6a96c62b9d0297d6f8','2018-06-13 19:19:18.234114','2018-06-13 19:19:18.374118','accepted',4,4,21,26),('869d2b6538da43b29c6e5b16b0ae3cc5','2018-06-13 12:19:10.223649','2018-06-13 12:19:10.243178','accepted',7,0,21,25),('987d9c70ec444f0694cfe2ddb9729768','2018-06-08 09:01:58.707180','2018-06-08 09:01:58.741302','accepted',2.75,2.75,7,27),('a4611fea4c0a41908bf693ff1493d6c7','2018-07-04 10:14:13.105281','2018-07-04 10:14:13.150524','accepted',5,5,7,24),('b80cadf0ad174ae29bb7e3bbc4722270','2018-07-04 10:13:21.756491','2018-07-04 10:13:21.773183','accepted',5,0,7,24),('ba53fd58b5084193aef2147bd534b363','2018-06-08 09:02:14.630736','2018-06-08 09:02:14.666304','accepted',2.75,2.75,7,27),('c65226fc77aa461694d9963c5d5cb505','2018-06-04 08:25:00.985997','2018-06-04 08:25:01.024824','accepted',1.4,1.4,7,27),('cfeb478325cc428985fe378980d986dc','2018-09-12 08:57:29.995758','2018-09-12 08:57:30.055080','accepted',1,1,7,25),('d72fe016b1b54ca4a90b83f2785eaf09','2018-05-28 11:41:02.401534','2018-05-28 11:41:02.446888','accepted',4.95,4.95,7,27),('f3e08951c0da416ea53e59c154724cf4','2018-07-06 13:40:41.268386','2018-07-06 13:40:41.415859','accepted',17,17,21,28),('fa03fbaac3ab4cdb97459c46f1a3aa6d','2018-05-23 11:20:34.751366','2018-05-23 11:20:34.781118','accepted',1.65,1.65,7,27);
/*!40000 ALTER TABLE `wallets_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets_transaction`
--

DROP TABLE IF EXISTS `wallets_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets_transaction` (
  `id` char(32) NOT NULL,
  `amount` double NOT NULL,
  `concept` longtext,
  `timestamp` datetime(6) NOT NULL,
  `tax_processed` tinyint(1) NOT NULL,
  `made_byadmin` tinyint(1) NOT NULL,
  `is_bonification` tinyint(1) NOT NULL,
  `is_euro_purchase` tinyint(1) NOT NULL,
  `comments` longtext,
  `rel_transaction_id` char(32) DEFAULT NULL,
  `wallet_from_id` char(32) DEFAULT NULL,
  `wallet_to_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_transaction_rel_transaction_id_91a04140_fk_wallets_t` (`rel_transaction_id`),
  KEY `wallets_transaction_wallet_from_id_4513d58b_fk_wallets_wallet_id` (`wallet_from_id`),
  KEY `wallets_transaction_wallet_to_id_6e3a85c5_fk_wallets_wallet_id` (`wallet_to_id`),
  CONSTRAINT `wallets_transaction_rel_transaction_id_91a04140_fk_wallets_t` FOREIGN KEY (`rel_transaction_id`) REFERENCES `wallets_transaction` (`id`),
  CONSTRAINT `wallets_transaction_wallet_from_id_4513d58b_fk_wallets_wallet_id` FOREIGN KEY (`wallet_from_id`) REFERENCES `wallets_wallet` (`id`),
  CONSTRAINT `wallets_transaction_wallet_to_id_6e3a85c5_fk_wallets_wallet_id` FOREIGN KEY (`wallet_to_id`) REFERENCES `wallets_wallet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets_transaction`
--

LOCK TABLES `wallets_transaction` WRITE;
/*!40000 ALTER TABLE `wallets_transaction` DISABLE KEYS */;
INSERT INTO `wallets_transaction` VALUES ('0008aa3562d848898efbac820f7537eb',1.4,'Transferencia','2018-06-04 08:25:01.004750',0,0,0,0,NULL,NULL,'705757da56e847fd92022f9afe53baab','e85c419e5e384300b4647d19ea49c951'),('0d33844281e14f709cab81d3441d5834',1.65,'Transferencia','2018-05-23 11:20:34.763601',0,0,0,0,NULL,NULL,'705757da56e847fd92022f9afe53baab','e85c419e5e384300b4647d19ea49c951'),('0f0dcf40902a45b1a37dea8299784dfb',5,'Actividad: Centro de mayores','2018-07-25 08:47:42.349763',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','6b5a746e4fb048d087047a5d8618eec6'),('19e6cda7a4ea47169c71d25904da815c',5,'Actividad: Clases de apoyo escolar','2018-06-11 09:04:08.734574',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','e9b0871e75424d43b78b86bbf3b844f2'),('1a6b8ef6deaf4d51a626b470c677ae6e',5,'Actividad: Clases de apoyo escolar','2018-06-18 08:17:36.470926',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','e9b0871e75424d43b78b86bbf3b844f2'),('1aa216334fcd4527827c046eb28b888f',5,'Transferencia','2018-07-04 10:14:13.124655',0,0,0,0,NULL,NULL,'908af9faf10b4010b6acde03d28c4479','e85c419e5e384300b4647d19ea49c951'),('218590de76034a38948b396603028dee',5,'Actividad: Clases de apoyo escolar','2018-05-18 12:49:28.715754',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','e9b0871e75424d43b78b86bbf3b844f2'),('241f618106154800a06134c66fa38409',7,'Transferencia','2018-06-14 12:54:14.691105',0,1,0,0,NULL,NULL,'03b69afb253141c0af1c8432dc6d1ac0','57e9cdab27d64c0993f352bcd43192af'),('28526a5db63a4607ad2012e2a8099c4f',5,'Actividad: Clases de apoyo escolar','2018-06-05 14:08:24.432512',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','e9b0871e75424d43b78b86bbf3b844f2'),('28e40e5171ce4b39b964d25c81cf197a',3,'Transferencia','2018-06-14 12:53:05.538458',0,1,0,0,NULL,NULL,'ba744a7e63f5456fbfc30226745a737f','57e9cdab27d64c0993f352bcd43192af'),('2b53ce4953ee4562a532858016a6f44b',4.95,'Transferencia','2018-05-28 11:41:02.424076',0,0,0,0,NULL,NULL,'705757da56e847fd92022f9afe53baab','e85c419e5e384300b4647d19ea49c951'),('2f1afa8ab2684f34888fec50ea7a3a7a',50,'Transferencia','2019-05-31 12:31:16.881740',0,1,0,0,NULL,NULL,'57e9cdab27d64c0993f352bcd43192af','86ece3c334ad446cbeabda4bb0ccc0ed'),('3e6d6441a1954412bc4837a8519c8433',5,'Actividad: Biblioteca del Barrio','2018-05-08 16:10:22.013739',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','87559b3b384d44fa81d5468ef632cc57'),('3f136e6c8d7e4144a64b75b4fb74c253',5,'Actividad: Centro de mayores','2018-06-11 09:05:14.101226',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','908af9faf10b4010b6acde03d28c4479'),('40c24cee169c468097d8ec3f36d53dd0',22.5,'Actividad: Centro de mayores','2018-06-18 08:18:32.567977',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','4a9909ceaa5b4fba949729aaf8f3885e'),('4304d518b637495ea87ed14f2efde269',15,'patinaje','2018-05-08 16:17:46.316665',0,1,0,0,NULL,NULL,'87559b3b384d44fa81d5468ef632cc57','bb6e7b4324e2455190d2266863695a37'),('4fb34253bbb84963a01a4b97e3d6cd54',2,'Transferencia','2018-07-30 18:58:32.800252',0,0,0,0,NULL,NULL,'03b69afb253141c0af1c8432dc6d1ac0','57e9cdab27d64c0993f352bcd43192af'),('55741efc3b234b2f86d83325853ea72e',5,'Actividad: Centro de mayores','2018-07-13 18:15:37.880429',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','6b5a746e4fb048d087047a5d8618eec6'),('69314a9836734183a615844aa0d5e794',30,'Transferencia','2018-05-16 09:21:33.429124',0,1,0,0,NULL,NULL,'bb6e7b4324e2455190d2266863695a37','86ece3c334ad446cbeabda4bb0ccc0ed'),('6bde14c7fd93480185b566bbf66897a5',10,'Actividad: Centro de mayores','2018-05-18 12:13:55.944166',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','ba744a7e63f5456fbfc30226745a737f'),('71e2525ce8794c098152ce683c76a3ed',17,'Transferencia','2018-07-06 13:40:41.310425',0,0,0,0,NULL,NULL,'4a9909ceaa5b4fba949729aaf8f3885e','57e9cdab27d64c0993f352bcd43192af'),('817197061bed423a9511bfe2bbb38de4',1,'Transferencia','2018-09-12 08:57:30.012752',0,0,0,0,NULL,NULL,'03b69afb253141c0af1c8432dc6d1ac0','e85c419e5e384300b4647d19ea49c951'),('826f2ef0a1974d44aa597ce91db71315',7.5,'Actividad: Centro de mayores','2018-05-18 12:08:17.777555',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','4a9909ceaa5b4fba949729aaf8f3885e'),('85913e073317405893851d342c0068f6',2.75,'Transferencia','2018-06-08 09:01:58.721304',0,0,0,0,NULL,NULL,'705757da56e847fd92022f9afe53baab','e85c419e5e384300b4647d19ea49c951'),('898a110262f64a908e5875fa8988533e',15,'devolución euros','2018-05-08 16:18:51.004100',0,1,0,0,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','bb6e7b4324e2455190d2266863695a37'),('95104e488392491abb955a0df66abca1',5,'Actividad: Centro de mayores','2018-07-13 11:21:57.739089',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','6b5a746e4fb048d087047a5d8618eec6'),('9d737196f8604d02a1d3ab6aae9e8e24',17.75,'Actividad: Centro de mayores','2018-05-08 16:13:45.840972',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','87559b3b384d44fa81d5468ef632cc57'),('9e28014bd7034c82941ed140f5366158',17,'Transferencia','2018-07-13 13:44:16.725510',0,0,0,0,NULL,NULL,'4a9909ceaa5b4fba949729aaf8f3885e','57e9cdab27d64c0993f352bcd43192af'),('a6e70e8c53fe42579e28bfb30ac7c0ea',2.75,'Transferencia','2018-06-08 09:02:14.646973',0,0,0,0,NULL,NULL,'705757da56e847fd92022f9afe53baab','e85c419e5e384300b4647d19ea49c951'),('aff0fab5e324427a911f2797e798938d',7.75,'Transferencia','2018-05-16 09:36:40.652836',0,1,0,0,NULL,NULL,'87559b3b384d44fa81d5468ef632cc57','86ece3c334ad446cbeabda4bb0ccc0ed'),('b11afe22c5504ba7b66121155ff23e95',22.58,'Transferencia','2019-05-31 12:32:15.504868',0,1,0,0,NULL,NULL,'d3b7ad41f7b04eb3a9a4ff7de12f5c71','86ece3c334ad446cbeabda4bb0ccc0ed'),('b3be708f9de84d87a4abddab6d3e62be',7.5,'Actividad: Centro de mayores','2018-05-18 12:06:40.174556',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','705757da56e847fd92022f9afe53baab'),('bc71fcb881604d77ba2a1782ea163a5f',10,'Actividad: Centro de mayores','2018-05-31 09:49:43.215866',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','4a9909ceaa5b4fba949729aaf8f3885e'),('bf6f80efb7eb44b2a6fccfb9e8010c9b',4,'Transferencia','2018-06-13 19:19:18.254589',0,0,0,0,NULL,NULL,'ba744a7e63f5456fbfc30226745a737f','57e9cdab27d64c0993f352bcd43192af'),('c6718010a68e462a8fe56adac7962c8b',5,'Actividad: Clases de apoyo escolar','2018-06-22 14:05:46.828903',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','e9b0871e75424d43b78b86bbf3b844f2'),('c76afc5a34ea41638f71d0d22b50221b',6.83,'Actividad: Biblioteca del Barrio','2018-06-05 14:56:55.098888',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','d3b7ad41f7b04eb3a9a4ff7de12f5c71'),('d4b14b3df4df4f0dab587b21d2e120f7',10,'Actividad: Centro de mayores','2018-05-18 12:12:56.565960',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','03b69afb253141c0af1c8432dc6d1ac0'),('d92e9e38645549229d362c14fb508cb0',19.5,'Transferencia','2019-05-31 12:30:46.422645',0,1,0,0,NULL,NULL,'e85c419e5e384300b4647d19ea49c951','86ece3c334ad446cbeabda4bb0ccc0ed'),('e1b2666a662c4ba7a42993fa95797bd5',17.75,'Actividad: Biblioteca del Barrio','2018-06-05 14:57:23.223907',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','d3b7ad41f7b04eb3a9a4ff7de12f5c71'),('f28e20c3d8854f94be78c321539372d4',5,'Actividad: Centro de mayores','2018-07-09 07:22:37.819224',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','6b5a746e4fb048d087047a5d8618eec6'),('fc4fb8862ae44ae2a45640ca73495085',10,'Actividad: Centro de mayores','2018-05-31 09:48:56.826741',0,0,0,1,NULL,NULL,'86ece3c334ad446cbeabda4bb0ccc0ed','705757da56e847fd92022f9afe53baab');
/*!40000 ALTER TABLE `wallets_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets_transactionlog`
--

DROP TABLE IF EXISTS `wallets_transactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets_transactionlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `amount` double NOT NULL,
  `concept` longtext,
  `made_byadmin` tinyint(1) NOT NULL,
  `is_bonification` tinyint(1) NOT NULL,
  `is_euro_purchase` tinyint(1) NOT NULL,
  `current_balance` double NOT NULL,
  `wallet_id` char(32) DEFAULT NULL,
  `related` longtext,
  `transaction_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_transactionlog_wallet_id_5cda1c94_fk_wallets_wallet_id` (`wallet_id`),
  KEY `wallets_transactionl_transaction_id_f711c9c0_fk_wallets_t` (`transaction_id`),
  CONSTRAINT `wallets_transactionl_transaction_id_f711c9c0_fk_wallets_t` FOREIGN KEY (`transaction_id`) REFERENCES `wallets_transaction` (`id`),
  CONSTRAINT `wallets_transactionlog_wallet_id_5cda1c94_fk_wallets_wallet_id` FOREIGN KEY (`wallet_id`) REFERENCES `wallets_wallet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets_transactionlog`
--

LOCK TABLES `wallets_transactionlog` WRITE;
/*!40000 ALTER TABLE `wallets_transactionlog` DISABLE KEYS */;
INSERT INTO `wallets_transactionlog` VALUES (89,'2018-05-08 16:10:22.013739',-5,'Actividad: Biblioteca del Barrio',0,0,1,-5,'86ece3c334ad446cbeabda4bb0ccc0ed','Mercedes','3e6d6441a1954412bc4837a8519c8433'),(90,'2018-05-08 16:10:22.013739',5,'Actividad: Biblioteca del Barrio',0,0,1,5,'87559b3b384d44fa81d5468ef632cc57','','3e6d6441a1954412bc4837a8519c8433'),(91,'2018-05-08 16:13:45.840972',-17.75,'Actividad: Centro de mayores',0,0,1,-22.75,'86ece3c334ad446cbeabda4bb0ccc0ed','Mercedes','9d737196f8604d02a1d3ab6aae9e8e24'),(92,'2018-05-08 16:13:45.840972',17.75,'Actividad: Centro de mayores',0,0,1,22.75,'87559b3b384d44fa81d5468ef632cc57','','9d737196f8604d02a1d3ab6aae9e8e24'),(93,'2018-05-08 16:17:46.316665',-15,'patinaje',1,0,0,7.75,'87559b3b384d44fa81d5468ef632cc57','Mamuts de Villaverde','4304d518b637495ea87ed14f2efde269'),(94,'2018-05-08 16:17:46.316665',15,'patinaje',1,0,0,15,'bb6e7b4324e2455190d2266863695a37','Mercedes','4304d518b637495ea87ed14f2efde269'),(95,'2018-05-08 16:18:51.004100',-15,'devolución euros',1,0,0,-37.75,'86ece3c334ad446cbeabda4bb0ccc0ed','Mamuts de Villaverde','898a110262f64a908e5875fa8988533e'),(96,'2018-05-08 16:18:51.004100',15,'devolución euros',1,0,0,30,'bb6e7b4324e2455190d2266863695a37','','898a110262f64a908e5875fa8988533e'),(97,'2018-05-16 09:21:33.429124',-30,'Transferencia',1,0,0,0,'bb6e7b4324e2455190d2266863695a37','','69314a9836734183a615844aa0d5e794'),(98,'2018-05-16 09:21:33.429124',30,'Transferencia',1,0,0,-7.75,'86ece3c334ad446cbeabda4bb0ccc0ed','Mamuts de Villaverde','69314a9836734183a615844aa0d5e794'),(99,'2018-05-16 09:36:40.652836',-7.75,'Transferencia',1,0,0,0,'87559b3b384d44fa81d5468ef632cc57','','aff0fab5e324427a911f2797e798938d'),(100,'2018-05-16 09:36:40.652836',7.75,'Transferencia',1,0,0,0,'86ece3c334ad446cbeabda4bb0ccc0ed','Mercedes','aff0fab5e324427a911f2797e798938d'),(101,'2018-05-18 12:06:40.174556',-7.5,'Actividad: Centro de mayores',0,0,1,-7.5,'86ece3c334ad446cbeabda4bb0ccc0ed','Laura','b3be708f9de84d87a4abddab6d3e62be'),(102,'2018-05-18 12:06:40.174556',7.5,'Actividad: Centro de mayores',0,0,1,7.5,'705757da56e847fd92022f9afe53baab','','b3be708f9de84d87a4abddab6d3e62be'),(103,'2018-05-18 12:08:17.777555',-7.5,'Actividad: Centro de mayores',0,0,1,-15,'86ece3c334ad446cbeabda4bb0ccc0ed','María Elena','826f2ef0a1974d44aa597ce91db71315'),(104,'2018-05-18 12:08:17.777555',7.5,'Actividad: Centro de mayores',0,0,1,7.5,'4a9909ceaa5b4fba949729aaf8f3885e','','826f2ef0a1974d44aa597ce91db71315'),(105,'2018-05-18 12:12:56.565960',-10,'Actividad: Centro de mayores',0,0,1,-25,'86ece3c334ad446cbeabda4bb0ccc0ed','Melissa','d4b14b3df4df4f0dab587b21d2e120f7'),(106,'2018-05-18 12:12:56.565960',10,'Actividad: Centro de mayores',0,0,1,10,'03b69afb253141c0af1c8432dc6d1ac0','','d4b14b3df4df4f0dab587b21d2e120f7'),(107,'2018-05-18 12:13:55.944166',-10,'Actividad: Centro de mayores',0,0,1,-35,'86ece3c334ad446cbeabda4bb0ccc0ed','Zaida','6bde14c7fd93480185b566bbf66897a5'),(108,'2018-05-18 12:13:55.944166',10,'Actividad: Centro de mayores',0,0,1,10,'ba744a7e63f5456fbfc30226745a737f','','6bde14c7fd93480185b566bbf66897a5'),(109,'2018-05-18 12:49:28.715754',-5,'Actividad: Clases de apoyo escolar',0,0,1,-40,'86ece3c334ad446cbeabda4bb0ccc0ed','Lucía','218590de76034a38948b396603028dee'),(110,'2018-05-18 12:49:28.715754',5,'Actividad: Clases de apoyo escolar',0,0,1,5,'e9b0871e75424d43b78b86bbf3b844f2','','218590de76034a38948b396603028dee'),(111,'2018-05-23 11:20:34.763601',-1.65,'Transferencia',0,0,0,5.85,'705757da56e847fd92022f9afe53baab','Papelería Copiarte','0d33844281e14f709cab81d3441d5834'),(112,'2018-05-23 11:20:34.763601',1.65,'Transferencia',0,0,0,1.65,'e85c419e5e384300b4647d19ea49c951','Laura','0d33844281e14f709cab81d3441d5834'),(113,'2018-05-28 11:41:02.424076',-4.95,'Transferencia',0,0,0,0.899999999999999,'705757da56e847fd92022f9afe53baab','Papelería Copiarte','2b53ce4953ee4562a532858016a6f44b'),(114,'2018-05-28 11:41:02.424076',4.95,'Transferencia',0,0,0,6.6,'e85c419e5e384300b4647d19ea49c951','Laura','2b53ce4953ee4562a532858016a6f44b'),(115,'2018-05-31 09:48:56.826741',-10,'Actividad: Centro de mayores',0,0,1,-50,'86ece3c334ad446cbeabda4bb0ccc0ed','Laura','fc4fb8862ae44ae2a45640ca73495085'),(116,'2018-05-31 09:48:56.826741',10,'Actividad: Centro de mayores',0,0,1,10.9,'705757da56e847fd92022f9afe53baab','','fc4fb8862ae44ae2a45640ca73495085'),(117,'2018-05-31 09:49:43.215866',-10,'Actividad: Centro de mayores',0,0,1,-60,'86ece3c334ad446cbeabda4bb0ccc0ed','María Elena','bc71fcb881604d77ba2a1782ea163a5f'),(118,'2018-05-31 09:49:43.215866',10,'Actividad: Centro de mayores',0,0,1,17.5,'4a9909ceaa5b4fba949729aaf8f3885e','','bc71fcb881604d77ba2a1782ea163a5f'),(119,'2018-06-04 08:25:01.004750',-1.4,'Transferencia',0,0,0,9.5,'705757da56e847fd92022f9afe53baab','Papelería Copiarte','0008aa3562d848898efbac820f7537eb'),(120,'2018-06-04 08:25:01.004750',1.4,'Transferencia',0,0,0,8,'e85c419e5e384300b4647d19ea49c951','Laura','0008aa3562d848898efbac820f7537eb'),(121,'2018-06-05 14:08:24.432512',-5,'Actividad: Clases de apoyo escolar',0,0,1,-65,'86ece3c334ad446cbeabda4bb0ccc0ed','Lucía','28526a5db63a4607ad2012e2a8099c4f'),(122,'2018-06-05 14:08:24.432512',5,'Actividad: Clases de apoyo escolar',0,0,1,10,'e9b0871e75424d43b78b86bbf3b844f2','','28526a5db63a4607ad2012e2a8099c4f'),(123,'2018-06-05 14:56:55.098888',-6.83,'Actividad: Biblioteca del Barrio',0,0,1,-71.83,'86ece3c334ad446cbeabda4bb0ccc0ed','Julio','c76afc5a34ea41638f71d0d22b50221b'),(124,'2018-06-05 14:56:55.098888',6.83,'Actividad: Biblioteca del Barrio',0,0,1,6.83,'d3b7ad41f7b04eb3a9a4ff7de12f5c71','','c76afc5a34ea41638f71d0d22b50221b'),(125,'2018-06-05 14:57:23.223907',-17.75,'Actividad: Biblioteca del Barrio',0,0,1,-89.58,'86ece3c334ad446cbeabda4bb0ccc0ed','Julio','e1b2666a662c4ba7a42993fa95797bd5'),(126,'2018-06-05 14:57:23.223907',17.75,'Actividad: Biblioteca del Barrio',0,0,1,24.58,'d3b7ad41f7b04eb3a9a4ff7de12f5c71','','e1b2666a662c4ba7a42993fa95797bd5'),(129,'2018-06-08 09:01:58.721304',-2.75,'Transferencia',0,0,0,6.75,'705757da56e847fd92022f9afe53baab','Papelería Copiarte','85913e073317405893851d342c0068f6'),(130,'2018-06-08 09:01:58.721304',2.75,'Transferencia',0,0,0,10.75,'e85c419e5e384300b4647d19ea49c951','Laura','85913e073317405893851d342c0068f6'),(131,'2018-06-08 09:02:14.646973',-2.75,'Transferencia',0,0,0,4,'705757da56e847fd92022f9afe53baab','Papelería Copiarte','a6e70e8c53fe42579e28bfb30ac7c0ea'),(132,'2018-06-08 09:02:14.646973',2.75,'Transferencia',0,0,0,13.5,'e85c419e5e384300b4647d19ea49c951','Laura','a6e70e8c53fe42579e28bfb30ac7c0ea'),(133,'2018-06-11 09:04:08.734574',-5,'Actividad: Clases de apoyo escolar',0,0,1,-94.58,'86ece3c334ad446cbeabda4bb0ccc0ed','Lucía','19e6cda7a4ea47169c71d25904da815c'),(134,'2018-06-11 09:04:08.734574',5,'Actividad: Clases de apoyo escolar',0,0,1,15,'e9b0871e75424d43b78b86bbf3b844f2','','19e6cda7a4ea47169c71d25904da815c'),(135,'2018-06-11 09:05:14.101226',-5,'Actividad: Centro de mayores',0,0,1,-99.58,'86ece3c334ad446cbeabda4bb0ccc0ed','Erika','3f136e6c8d7e4144a64b75b4fb74c253'),(136,'2018-06-11 09:05:14.101226',5,'Actividad: Centro de mayores',0,0,1,5,'908af9faf10b4010b6acde03d28c4479','','3f136e6c8d7e4144a64b75b4fb74c253'),(137,'2018-06-13 19:19:18.254589',-4,'Transferencia',0,0,0,6,'ba744a7e63f5456fbfc30226745a737f','Bar/Cafetería Línea 123','bf6f80efb7eb44b2a6fccfb9e8010c9b'),(138,'2018-06-13 19:19:18.254589',4,'Transferencia',0,0,0,4,'57e9cdab27d64c0993f352bcd43192af','Zaida','bf6f80efb7eb44b2a6fccfb9e8010c9b'),(139,'2018-06-14 12:53:05.538458',-3,'Transferencia',1,0,0,3,'ba744a7e63f5456fbfc30226745a737f','Bar/Cafetería Línea 123','28e40e5171ce4b39b964d25c81cf197a'),(140,'2018-06-14 12:53:05.538458',3,'Transferencia',1,0,0,7,'57e9cdab27d64c0993f352bcd43192af','Zaida','28e40e5171ce4b39b964d25c81cf197a'),(141,'2018-06-14 12:54:14.691105',-7,'Transferencia',1,0,0,3,'03b69afb253141c0af1c8432dc6d1ac0','Bar/Cafetería Línea 123','241f618106154800a06134c66fa38409'),(142,'2018-06-14 12:54:14.691105',7,'Transferencia',1,0,0,14,'57e9cdab27d64c0993f352bcd43192af','Melissa','241f618106154800a06134c66fa38409'),(143,'2018-06-18 08:17:36.470926',-5,'Actividad: Clases de apoyo escolar',0,0,1,-104.58,'86ece3c334ad446cbeabda4bb0ccc0ed','Lucía','1a6b8ef6deaf4d51a626b470c677ae6e'),(144,'2018-06-18 08:17:36.470926',5,'Actividad: Clases de apoyo escolar',0,0,1,20,'e9b0871e75424d43b78b86bbf3b844f2','','1a6b8ef6deaf4d51a626b470c677ae6e'),(145,'2018-06-18 08:18:32.567977',-22.5,'Actividad: Centro de mayores',0,0,1,-127.08,'86ece3c334ad446cbeabda4bb0ccc0ed','María Elena','40c24cee169c468097d8ec3f36d53dd0'),(146,'2018-06-18 08:18:32.567977',22.5,'Actividad: Centro de mayores',0,0,1,40,'4a9909ceaa5b4fba949729aaf8f3885e','','40c24cee169c468097d8ec3f36d53dd0'),(147,'2018-06-22 14:05:46.828903',-5,'Actividad: Clases de apoyo escolar',0,0,1,-132.08,'86ece3c334ad446cbeabda4bb0ccc0ed','Lucía','c6718010a68e462a8fe56adac7962c8b'),(148,'2018-06-22 14:05:46.828903',5,'Actividad: Clases de apoyo escolar',0,0,1,25,'e9b0871e75424d43b78b86bbf3b844f2','','c6718010a68e462a8fe56adac7962c8b'),(149,'2018-07-04 10:14:13.124655',-5,'Transferencia',0,0,0,0,'908af9faf10b4010b6acde03d28c4479','Papelería Copiarte','1aa216334fcd4527827c046eb28b888f'),(150,'2018-07-04 10:14:13.124655',5,'Transferencia',0,0,0,18.5,'e85c419e5e384300b4647d19ea49c951','Erika','1aa216334fcd4527827c046eb28b888f'),(151,'2018-07-06 13:40:41.310425',-17,'Transferencia',0,0,0,23,'4a9909ceaa5b4fba949729aaf8f3885e','Bar/Cafetería Línea 123','71e2525ce8794c098152ce683c76a3ed'),(152,'2018-07-06 13:40:41.310425',17,'Transferencia',0,0,0,31,'57e9cdab27d64c0993f352bcd43192af','María Elena','71e2525ce8794c098152ce683c76a3ed'),(153,'2018-07-09 07:22:37.819224',-5,'Actividad: Centro de mayores',0,0,1,-137.08,'86ece3c334ad446cbeabda4bb0ccc0ed','Keyla','f28e20c3d8854f94be78c321539372d4'),(154,'2018-07-09 07:22:37.819224',5,'Actividad: Centro de mayores',0,0,1,5,'6b5a746e4fb048d087047a5d8618eec6','','f28e20c3d8854f94be78c321539372d4'),(155,'2018-07-13 11:21:57.739089',-5,'Actividad: Centro de mayores',0,0,1,-142.08,'86ece3c334ad446cbeabda4bb0ccc0ed','Keyla','95104e488392491abb955a0df66abca1'),(156,'2018-07-13 11:21:57.739089',5,'Actividad: Centro de mayores',0,0,1,10,'6b5a746e4fb048d087047a5d8618eec6','','95104e488392491abb955a0df66abca1'),(157,'2018-07-13 13:44:16.725510',-17,'Transferencia',0,0,0,6,'4a9909ceaa5b4fba949729aaf8f3885e','Bar/Cafetería Línea 123','9e28014bd7034c82941ed140f5366158'),(158,'2018-07-13 13:44:16.725510',17,'Transferencia',0,0,0,48,'57e9cdab27d64c0993f352bcd43192af','María Elena','9e28014bd7034c82941ed140f5366158'),(159,'2018-07-13 18:15:37.880429',-5,'Actividad: Centro de mayores',0,0,1,-147.08,'86ece3c334ad446cbeabda4bb0ccc0ed','Keyla','55741efc3b234b2f86d83325853ea72e'),(160,'2018-07-13 18:15:37.880429',5,'Actividad: Centro de mayores',0,0,1,15,'6b5a746e4fb048d087047a5d8618eec6','','55741efc3b234b2f86d83325853ea72e'),(161,'2018-07-25 08:47:42.349763',-5,'Actividad: Centro de mayores',0,0,1,-152.08,'86ece3c334ad446cbeabda4bb0ccc0ed','Keyla','0f0dcf40902a45b1a37dea8299784dfb'),(162,'2018-07-25 08:47:42.349763',5,'Actividad: Centro de mayores',0,0,1,20,'6b5a746e4fb048d087047a5d8618eec6','','0f0dcf40902a45b1a37dea8299784dfb'),(163,'2018-07-30 18:58:32.800252',-2,'Transferencia',0,0,0,1,'03b69afb253141c0af1c8432dc6d1ac0','Bar/Cafetería Línea 123','4fb34253bbb84963a01a4b97e3d6cd54'),(164,'2018-07-30 18:58:32.800252',2,'Transferencia',0,0,0,50,'57e9cdab27d64c0993f352bcd43192af','Melissa','4fb34253bbb84963a01a4b97e3d6cd54'),(165,'2018-09-12 08:57:30.012752',-1,'Transferencia',0,0,0,0,'03b69afb253141c0af1c8432dc6d1ac0','Papelería Copiarte','817197061bed423a9511bfe2bbb38de4'),(166,'2018-09-12 08:57:30.012752',1,'Transferencia',0,0,0,19.5,'e85c419e5e384300b4647d19ea49c951','Melissa','817197061bed423a9511bfe2bbb38de4'),(167,'2019-05-31 12:30:46.422645',-19.5,'Transferencia',1,0,0,0,'e85c419e5e384300b4647d19ea49c951','','d92e9e38645549229d362c14fb508cb0'),(168,'2019-05-31 12:30:46.422645',19.5,'Transferencia',1,0,0,-132.58,'86ece3c334ad446cbeabda4bb0ccc0ed','Papelería Copiarte','d92e9e38645549229d362c14fb508cb0'),(169,'2019-05-31 12:31:16.881740',-50,'Transferencia',1,0,0,0,'57e9cdab27d64c0993f352bcd43192af','','2f1afa8ab2684f34888fec50ea7a3a7a'),(170,'2019-05-31 12:31:16.881740',50,'Transferencia',1,0,0,-82.58,'86ece3c334ad446cbeabda4bb0ccc0ed','Bar/Cafetería Línea 123','2f1afa8ab2684f34888fec50ea7a3a7a'),(171,'2019-05-31 12:32:15.504868',-22.58,'Transferencia',1,0,0,0,'d3b7ad41f7b04eb3a9a4ff7de12f5c71','','b11afe22c5504ba7b66121155ff23e95'),(172,'2019-05-31 12:32:15.504868',22.58,'Transferencia',1,0,0,-60,'86ece3c334ad446cbeabda4bb0ccc0ed','Julio','b11afe22c5504ba7b66121155ff23e95');
/*!40000 ALTER TABLE `wallets_transactionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets_wallet`
--

DROP TABLE IF EXISTS `wallets_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets_wallet` (
  `id` char(32) NOT NULL,
  `balance` double NOT NULL,
  `last_transaction` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pin_code` varchar(100) DEFAULT NULL,
  `type_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `wallets_wallet_type_id_fb55617b_fk_wallets_wallettype_id` (`type_id`),
  CONSTRAINT `wallets_wallet_type_id_fb55617b_fk_wallets_wallettype_id` FOREIGN KEY (`type_id`) REFERENCES `wallets_wallettype` (`id`),
  CONSTRAINT `wallets_wallet_user_id_6cb307a0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets_wallet`
--

LOCK TABLES `wallets_wallet` WRITE;
/*!40000 ALTER TABLE `wallets_wallet` DISABLE KEYS */;
INSERT INTO `wallets_wallet` VALUES ('03b69afb253141c0af1c8432dc6d1ac0',0,'2018-09-12 08:57:30.012752',25,NULL,'default'),('18c42a4bd5024701a4791a6ee1d95181',0,'2018-05-03 10:35:20.000000',13,NULL,'default'),('2ea8fa55f5944746b5bdcb3aae1d11c0',0,'2018-05-03 10:28:47.000000',8,NULL,'default'),('31f8c00dca5d4b9eb8a825a1efed3d28',0,NULL,35,NULL,'default'),('4a9909ceaa5b4fba949729aaf8f3885e',6,'2018-07-13 13:44:16.725510',28,NULL,'default'),('57e9cdab27d64c0993f352bcd43192af',0,'2019-05-31 12:31:16.881740',21,NULL,'default'),('629f2f2ef9864884a19e57d0067c7a4a',0,NULL,36,NULL,'default'),('6b5a746e4fb048d087047a5d8618eec6',20,'2018-07-25 08:47:42.349763',33,NULL,'default'),('705757da56e847fd92022f9afe53baab',4,'2018-06-08 09:02:14.646973',27,NULL,'default'),('86ece3c334ad446cbeabda4bb0ccc0ed',-60,'2019-05-31 12:32:15.504868',NULL,NULL,'debit'),('87559b3b384d44fa81d5468ef632cc57',0,'2018-05-16 09:36:40.652836',22,NULL,'default'),('908af9faf10b4010b6acde03d28c4479',0,'2018-07-04 10:14:13.124655',24,NULL,'default'),('ba744a7e63f5456fbfc30226745a737f',3,'2018-06-14 12:53:05.538458',26,NULL,'default'),('bb6e7b4324e2455190d2266863695a37',0,'2018-05-16 09:21:33.429124',23,NULL,'default'),('d3b7ad41f7b04eb3a9a4ff7de12f5c71',0,'2019-05-31 12:32:15.504868',31,NULL,'default'),('e85c419e5e384300b4647d19ea49c951',0,'2019-05-31 12:30:46.422645',7,NULL,'default'),('e9b0871e75424d43b78b86bbf3b844f2',25,'2018-06-22 14:05:46.828903',32,NULL,'default');
/*!40000 ALTER TABLE `wallets_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets_wallettype`
--

DROP TABLE IF EXISTS `wallets_wallettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets_wallettype` (
  `id` varchar(25) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext,
  `credit_limit` double NOT NULL,
  `unlimited` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets_wallettype`
--

LOCK TABLES `wallets_wallettype` WRITE;
/*!40000 ALTER TABLE `wallets_wallettype` DISABLE KEYS */;
INSERT INTO `wallets_wallettype` VALUES ('debit','Débito',NULL,0,1),('default','Normal',NULL,0,0),('entity','Entidad',NULL,500,0);
/*!40000 ALTER TABLE `wallets_wallettype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-03 13:50:12
