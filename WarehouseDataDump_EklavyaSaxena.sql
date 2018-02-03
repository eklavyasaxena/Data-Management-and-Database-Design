CREATE DATABASE  IF NOT EXISTS `warehousedatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `warehousedatabase`;
-- MySQL dump 10.13  Distrib 5.7.19, for Win32 (AMD64)
--
-- Host: localhost    Database: warehousedatabase
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_line` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `fk_city_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `fk_customer_id` smallint(5) unsigned DEFAULT NULL,
  `fk_supplier_id` smallint(5) unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_customer_id` (`fk_customer_id`),
  KEY `idx_fk_supplier_id` (`fk_supplier_id`),
  KEY `idx_fk_city_id` (`fk_city_id`),
  CONSTRAINT `fk_Address_City` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Address_Customer` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Address_Supplier` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1113 Karol Bagh','112421',1,'(213) 344-889',NULL,NULL,'2017-12-05 06:22:40'),(2,'3297 Karol Bagh','112421',1,'(111) 344-889',NULL,NULL,'2017-12-05 06:22:40'),(3,'9999 Pallika Bazar','992890',2,'(222) 776-097',NULL,NULL,'2017-12-05 06:22:40'),(4,'8888 Sarojini Nagar','882711',3,'(333) 887-091',NULL,NULL,'2017-12-05 06:22:41'),(5,'2424 Lala Bazar','992830',4,'(444) 998-011',NULL,NULL,'2017-12-05 06:22:41'),(6,'2231 Pallika Bazar','992890',2,'(123) 776-097',1,NULL,'2017-12-05 06:27:56'),(7,'1008 Sarojini Nagar','882711',3,'(429) 887-091',NULL,1,'2017-12-05 06:27:56'),(8,'9928 Lala Bazar','992830',4,'(214) 998-011',2,NULL,'2017-12-13 09:07:38'),(9,'6656 Biroj Nagar','121111',5,'(232) 876-999',NULL,2,'2017-12-13 06:58:02'),(10,'2292 Niru Nagar','222122',1,'(212) 989-009',NULL,NULL,'2017-12-13 06:47:35'),(11,'1192 Niru Nagar','112122',2,'(212) 929-229',NULL,NULL,'2017-12-13 06:47:35'),(12,'2400 Lala Bazar','992822',2,'(444) 998-000',3,NULL,'2017-12-05 06:22:41'),(13,'3300 Pallika Bazar','992822',4,'(123) 776-999',4,NULL,'2017-12-05 06:27:56'),(14,'1197 Karol Bagh','112433',2,'(111) 344-333',NULL,3,'2017-12-05 06:22:40'),(15,'1199 Pallika Bazar','992811',1,'(222) 776-333',NULL,4,'2017-12-05 06:22:40');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `fk_state_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `idx_fk_state_id` (`fk_state_id`),
  CONSTRAINT `fk_City_State` FOREIGN KEY (`fk_state_id`) REFERENCES `state` (`state_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Lucknow',1,'2017-12-09 07:00:38'),(2,'New Delhi',2,'2017-12-09 07:00:38'),(3,'Jaipur',3,'2017-12-09 07:00:38'),(4,'Haryana',4,'2017-12-09 07:00:38'),(5,'Karnataka',5,'2017-12-09 07:00:38');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India','2017-12-09 07:00:38');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `activity_status` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `create_date` date NOT NULL,
  `fk_retail_branding_office_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `idx_name` (`customer_name`),
  KEY `idx_fk_retail_branding_office_id` (`fk_retail_branding_office_id`),
  CONSTRAINT `fk_Customer_RetailBrandingOfficeHQ` FOREIGN KEY (`fk_retail_branding_office_id`) REFERENCES `retailbrandingofficehq` (`retail_branding_office_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Praz Garments','pray@gmail.com','Active','2017-02-03',1,'2017-12-05 01:44:00'),(2,'Janaki Garments','jank@gmail.com','Active','2017-02-07',1,'2017-12-05 01:50:00'),(3,'Adi Garments','adi@gmail.com','Active','2017-04-01',2,'2017-12-13 06:53:17'),(4,'Nadia Garments','nadia@gmail.com','Active','2017-04-02',3,'2017-12-13 06:53:17');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrequestform`
--

DROP TABLE IF EXISTS `customerrequestform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerrequestform` (
  `customer_request_form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `requested_ship_date` date DEFAULT NULL,
  `priority_mode_of_shipment` enum('Air','Sea','Ground') NOT NULL,
  `crf_status` enum('Open','Closed','Cancelled') NOT NULL DEFAULT 'Open',
  `fk_employee_id` smallint(5) unsigned NOT NULL,
  `fk_customer_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_request_form_id`),
  KEY `idx_fk_employee_id` (`fk_employee_id`),
  KEY `idx_fk_customer_id` (`fk_customer_id`),
  CONSTRAINT `fk_CustomerRequestForm_Customer` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CustomerRequestForm_Employee` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrequestform`
--

LOCK TABLES `customerrequestform` WRITE;
/*!40000 ALTER TABLE `customerrequestform` DISABLE KEYS */;
INSERT INTO `customerrequestform` VALUES (1,'2017-12-04 05:00:00','2017-12-14','Air','Closed',4,1,'2017-12-13 07:23:10'),(2,'2017-12-04 05:00:00','2017-12-31','Sea','Closed',4,2,'2017-12-13 07:28:47'),(3,'2017-12-04 05:00:00','2017-12-25','Ground','Open',4,1,'2017-12-13 07:23:10'),(4,'2017-12-04 05:00:00','2017-12-25','Sea','Open',4,3,'2017-12-13 07:23:10'),(5,'2017-12-04 05:00:00','2017-12-25','Ground','Open',4,4,'2017-12-13 07:23:10'),(6,'2017-12-04 05:00:00','2017-12-25','Sea','Open',4,4,'2017-12-13 07:23:10'),(7,'2017-12-04 05:00:00','2017-12-25','Ground','Open',4,3,'2017-12-13 07:23:10'),(8,'2017-12-04 05:00:00','2017-12-25','Sea','Closed',4,2,'2017-12-13 07:28:47');
/*!40000 ALTER TABLE `customerrequestform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custrequestform_has_finishedgoods`
--

DROP TABLE IF EXISTS `custrequestform_has_finishedgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custrequestform_has_finishedgoods` (
  `bridge_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `fk_customer_request_form_id` int(10) unsigned NOT NULL,
  `fk_finished_goods_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bridge_id`),
  KEY `idx_fk_customer_request_form_id` (`fk_customer_request_form_id`),
  KEY `idx_fk_finished_goods_id` (`fk_finished_goods_id`),
  CONSTRAINT `fk_CustRequestForm_Has_FinishedGoods_CustomerRequestForm` FOREIGN KEY (`fk_customer_request_form_id`) REFERENCES `customerrequestform` (`customer_request_form_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CustRequestForm_Has_FinishedGoods_FinishedGoods` FOREIGN KEY (`fk_finished_goods_id`) REFERENCES `finishedgoods` (`finished_goods_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custrequestform_has_finishedgoods`
--

LOCK TABLES `custrequestform_has_finishedgoods` WRITE;
/*!40000 ALTER TABLE `custrequestform_has_finishedgoods` DISABLE KEYS */;
INSERT INTO `custrequestform_has_finishedgoods` VALUES (1,12000,1,1,'2017-12-05 02:32:08'),(2,10000,2,1,'2017-12-09 20:25:38'),(3,5000,3,2,'2017-12-09 21:12:57'),(4,6000,4,3,'2017-12-13 07:24:20'),(5,5000,5,4,'2017-12-13 07:24:20'),(6,4000,6,5,'2017-12-13 07:24:20'),(7,5000,7,1,'2017-12-13 07:24:20'),(8,3000,8,2,'2017-12-13 07:24:20'),(9,6000,1,3,'2017-12-13 07:24:20'),(10,7000,2,4,'2017-12-13 07:24:20'),(11,9000,3,5,'2017-12-13 07:24:20'),(12,200,4,1,'2017-12-13 07:24:20'),(13,300,5,2,'2017-12-13 07:24:20'),(14,400,6,3,'2017-12-13 07:24:20'),(15,400,7,4,'2017-12-13 07:24:20'),(16,500,8,5,'2017-12-13 07:24:20');
/*!40000 ALTER TABLE `custrequestform_has_finishedgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Store'),(2,'Purchase'),(3,'Customer Service'),(4,'Finance');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `joining_date` date NOT NULL,
  `activity_status` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `fk_department_id` smallint(5) unsigned NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fk_address_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  KEY `idx_fk_address_id` (`fk_address_id`),
  KEY `idx_fk_department_id` (`fk_department_id`),
  CONSTRAINT `fk_Employee_Address` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_Department` FOREIGN KEY (`fk_department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Sud','Verma','sud@gmail.com','2017-01-01','Active',1,'sud_123','sud_123',2,'2017-12-05 02:18:14'),(2,'Pawan','Gupta','paw@gmail.com','2017-01-02','Active',2,'paw_123','paw_123',3,'2017-12-05 02:18:14'),(3,'Ram','Sharma','ram@gmail.com','2017-01-03','Active',3,'ram_123','ram_123',4,'2017-12-05 02:18:14'),(4,'Amit','Mehta','ami@gmail.com','2017-01-04','Active',4,'ami_123','ami_123',5,'2017-12-05 02:18:14');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fg_has_rm`
--

DROP TABLE IF EXISTS `fg_has_rm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fg_has_rm` (
  `bridge_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_raw_material_id` smallint(5) unsigned NOT NULL,
  `fk_finished_goods_id` int(10) unsigned NOT NULL,
  `rm_qty_required_per_FG_piece` decimal(4,2) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bridge_id`),
  KEY `idx_fk_raw_material_id` (`fk_raw_material_id`),
  KEY `idx_fk_finished_goods_id` (`fk_finished_goods_id`),
  CONSTRAINT `fk_FG_Has_RM_FinishedGoods` FOREIGN KEY (`fk_finished_goods_id`) REFERENCES `finishedgoods` (`finished_goods_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_FG_Has_RM_RawMaterial` FOREIGN KEY (`fk_raw_material_id`) REFERENCES `rawmaterial` (`raw_material_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fg_has_rm`
--

LOCK TABLES `fg_has_rm` WRITE;
/*!40000 ALTER TABLE `fg_has_rm` DISABLE KEYS */;
INSERT INTO `fg_has_rm` VALUES (1,1,1,0.45,'2017-12-05 02:08:34'),(2,1,2,1.10,'2017-12-05 02:08:35'),(3,2,1,3.00,'2017-12-13 07:11:00'),(4,3,1,1.20,'2017-12-05 02:08:35'),(5,2,2,2.00,'2017-12-13 07:11:22'),(6,4,3,1.20,'2017-12-13 07:11:00'),(7,5,3,1.00,'2017-12-13 07:11:22'),(8,6,3,3.00,'2017-12-13 07:11:22'),(9,7,4,2.00,'2017-12-13 07:11:01'),(10,8,4,4.00,'2017-12-13 07:11:01'),(11,9,5,5.00,'2017-12-13 07:11:01'),(12,10,5,5.00,'2017-12-13 07:11:01');
/*!40000 ALTER TABLE `fg_has_rm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finishedgoods`
--

DROP TABLE IF EXISTS `finishedgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finishedgoods` (
  `finished_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_price_in_USD/piece` decimal(4,2) NOT NULL,
  `production_capacity_piece/min` int(11) NOT NULL,
  `material_status` enum('Active','Discontinued') NOT NULL DEFAULT 'Active',
  `description` text,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`finished_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finishedgoods`
--

LOCK TABLES `finishedgoods` WRITE;
/*!40000 ALTER TABLE `finishedgoods` DISABLE KEYS */;
INSERT INTO `finishedgoods` VALUES (1,10.00,20,'Active','Side Label','2017-12-13 07:59:46'),(2,11.00,30,'Active','Main Label','2017-12-13 07:59:46'),(3,12.00,20,'Active','Main Label','2017-12-13 07:59:46'),(4,10.00,10,'Active','Main Label','2017-12-13 07:59:46'),(5,11.00,20,'Active','Side Label','2017-12-13 07:59:46');
/*!40000 ALTER TABLE `finishedgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorylocation`
--

DROP TABLE IF EXISTS `inventorylocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventorylocation` (
  `inventory_location_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shelf` char(2) NOT NULL,
  `floor_on_shelf` enum('Ground','First','Second','Third') NOT NULL,
  `location_number` smallint(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorylocation`
--

LOCK TABLES `inventorylocation` WRITE;
/*!40000 ALTER TABLE `inventorylocation` DISABLE KEYS */;
INSERT INTO `inventorylocation` VALUES (1,'A','Ground',221,'2017-12-05 06:49:41'),(2,'B','First',877,'2017-12-05 06:49:41'),(3,'C','Second',292,'2017-12-05 06:49:41'),(4,'D','Third',881,'2017-12-05 06:49:41'),(5,'A','First',213,'2017-12-05 06:49:41'),(6,'A','Third',881,'2017-12-13 07:03:49'),(7,'B','Third',213,'2017-12-13 07:03:50'),(8,'C','Ground',881,'2017-12-13 07:03:50'),(9,'D','Third',213,'2017-12-13 07:03:50'),(10,'E','Ground',213,'2017-12-13 07:03:50');
/*!40000 ALTER TABLE `inventorylocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorylocation_has_finishedgoods`
--

DROP TABLE IF EXISTS `inventorylocation_has_finishedgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventorylocation_has_finishedgoods` (
  `bridge_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fg_stock_on_hand` int(11) NOT NULL,
  `fk_finished_goods_id` int(10) unsigned NOT NULL,
  `fk_inventory_location_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bridge_id`),
  KEY `idx_fk_finished_goods_id` (`fk_finished_goods_id`),
  KEY `idx_fk_inventory_location_id` (`fk_inventory_location_id`),
  CONSTRAINT `fk_InventoryLocation_Has_FinishedGoods_FinishedGoods` FOREIGN KEY (`fk_finished_goods_id`) REFERENCES `finishedgoods` (`finished_goods_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_InventoryLocation_Has_FinishedGoods_InventoryLocation` FOREIGN KEY (`fk_inventory_location_id`) REFERENCES `inventorylocation` (`inventory_location_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorylocation_has_finishedgoods`
--

LOCK TABLES `inventorylocation_has_finishedgoods` WRITE;
/*!40000 ALTER TABLE `inventorylocation_has_finishedgoods` DISABLE KEYS */;
INSERT INTO `inventorylocation_has_finishedgoods` VALUES (1,90,1,1,'2017-12-13 07:13:28'),(2,910,2,2,'2017-12-13 07:13:28'),(3,100,1,2,'2017-12-10 22:44:50'),(4,10010,3,3,'2017-12-13 07:13:28'),(5,220,4,4,'2017-12-13 07:13:28'),(6,3500,5,6,'2017-12-13 07:13:28'),(7,2200,3,6,'2017-12-13 07:13:28'),(8,80,4,7,'2017-12-13 07:13:28'),(9,77000,5,4,'2017-12-13 07:13:28');
/*!40000 ALTER TABLE `inventorylocation_has_finishedgoods` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`inventorylocation_has_finishedgoods_AFTER_INSERT` AFTER INSERT ON `inventorylocation_has_finishedgoods` FOR EACH ROW
BEGIN
	INSERT INTO logofinventory_insert_delete
    (fg_id,
    inventory_location_id,
    quantity,
    activity_performed)
    VALUES 
    (NEW.fk_finished_goods_id,
    NEW.fk_inventory_location_id,
    NEW.fg_stock_on_hand,
    'Insert');
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`inventorylocation_has_finishedgoods_AFTER_UPDATE` AFTER UPDATE ON `inventorylocation_has_finishedgoods` FOR EACH ROW
BEGIN
	INSERT INTO logofinventory_update
    (old_fg_id,
    new_fg_id,
    old_inventory_location_id,
    new_inventory_location_id,
    old_quantity,
    new_quantity)
    VALUES 
    (OLD.fk_finished_goods_id,
    NEW.fk_finished_goods_id,
    OLD.fk_inventory_location_id,
    NEW.fk_inventory_location_id,
    OLD.fg_stock_on_hand,
    NEW.fg_stock_on_hand);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`inventorylocation_has_finishedgoods_BEFORE_DELETE` BEFORE DELETE ON `inventorylocation_has_finishedgoods` FOR EACH ROW
BEGIN
	INSERT INTO logofinventory_insert_delete
    (fg_id,
    inventory_location_id,
    quantity,
    activity_performed)
    VALUES 
    (OLD.fk_finished_goods_id,
    OLD.fk_inventory_location_id,
    OLD.fg_stock_on_hand,
    'Delete');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventorylocation_has_rawmaterial`
--

DROP TABLE IF EXISTS `inventorylocation_has_rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventorylocation_has_rawmaterial` (
  `bridge_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rm_stock_on_hand` decimal(12,2) unsigned NOT NULL,
  `fk_raw_material_id` smallint(5) unsigned NOT NULL,
  `fk_inventory_location_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bridge_id`),
  KEY `idx_fk_raw_material_id` (`fk_raw_material_id`),
  KEY `idx_fk_inventory_location_id` (`fk_inventory_location_id`),
  CONSTRAINT `fk_InventoryLocation_Has_RawMaterial_InventoryLocation` FOREIGN KEY (`fk_inventory_location_id`) REFERENCES `inventorylocation` (`inventory_location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_InventoryLocation_Has_RawMaterial_RawMaterial` FOREIGN KEY (`fk_raw_material_id`) REFERENCES `rawmaterial` (`raw_material_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorylocation_has_rawmaterial`
--

LOCK TABLES `inventorylocation_has_rawmaterial` WRITE;
/*!40000 ALTER TABLE `inventorylocation_has_rawmaterial` DISABLE KEYS */;
INSERT INTO `inventorylocation_has_rawmaterial` VALUES (1,33000.00,1,3,'2017-12-13 07:14:46'),(2,44000.00,2,4,'2017-12-13 07:14:46'),(3,5400.00,3,5,'2017-12-13 07:14:46'),(4,1000.00,2,1,'2017-12-13 07:14:46'),(5,10.00,1,5,'2017-12-13 07:14:46'),(6,1400.00,4,6,'2017-12-13 07:14:46'),(7,1200.00,5,7,'2017-12-13 07:14:46'),(8,2.00,6,8,'2017-12-13 07:14:46'),(9,200.00,7,9,'2017-12-13 07:14:46'),(10,8000.00,8,10,'2017-12-13 07:14:46'),(11,2600.00,9,9,'2017-12-13 07:14:46'),(12,1800.00,10,8,'2017-12-13 07:14:46');
/*!40000 ALTER TABLE `inventorylocation_has_rawmaterial` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`inventorylocation_has_rawmaterial_AFTER_INSERT` AFTER INSERT ON `inventorylocation_has_rawmaterial` FOR EACH ROW
BEGIN
	INSERT INTO logofinventory_insert_delete
    (rm_id,
    inventory_location_id,
    quantity,
    activity_performed)
    VALUES 
    (NEW.fk_raw_material_id,
    NEW.fk_inventory_location_id,
    NEW.rm_stock_on_hand,
    'Insert');
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`inventorylocation_has_rawmaterial_AFTER_UPDATE` AFTER UPDATE ON `inventorylocation_has_rawmaterial` FOR EACH ROW
BEGIN
	INSERT INTO logofinventory_update
    (old_rm_id,
    new_rm_id,
    old_inventory_location_id,
    new_inventory_location_id,
    old_quantity,
    new_quantity)
    VALUES 
    (OLD.fk_raw_material_id,
    NEW.fk_raw_material_id,
    OLD.fk_inventory_location_id,
    NEW.fk_inventory_location_id,
    OLD.rm_stock_on_hand,
    NEW.rm_stock_on_hand);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`inventorylocation_has_rawmaterial_BEFORE_DELETE` BEFORE DELETE ON `inventorylocation_has_rawmaterial` FOR EACH ROW
BEGIN
	INSERT INTO logofinventory_insert_delete
    (rm_id,
    inventory_location_id,
    quantity,
    activity_performed)
    VALUES 
    (OLD.fk_raw_material_id,
    OLD.fk_inventory_location_id,
    OLD.rm_stock_on_hand,
    'Delete');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logofinventory_insert_delete`
--

DROP TABLE IF EXISTS `logofinventory_insert_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logofinventory_insert_delete` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rm_id` int(11) DEFAULT NULL,
  `fg_id` int(11) DEFAULT NULL,
  `inventory_location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `action_performed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity_performed` enum('Insert','Update','Delete') NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logofinventory_insert_delete`
--

LOCK TABLES `logofinventory_insert_delete` WRITE;
/*!40000 ALTER TABLE `logofinventory_insert_delete` DISABLE KEYS */;
INSERT INTO `logofinventory_insert_delete` VALUES (1,2,NULL,5,10,'2017-12-09 22:54:50','Delete'),(2,2,NULL,5,10,'2017-12-09 22:55:17','Insert'),(3,NULL,2,1,10,'2017-12-09 23:00:45','Insert'),(4,NULL,2,1,11,'2017-12-09 23:01:24','Delete'),(5,NULL,3,3,10090,'2017-12-13 07:12:44','Insert'),(6,NULL,4,4,222,'2017-12-13 07:12:44','Insert'),(7,NULL,5,6,3532,'2017-12-13 07:12:44','Insert'),(8,NULL,3,6,2235,'2017-12-13 07:12:44','Insert'),(9,NULL,4,7,79,'2017-12-13 07:12:44','Insert'),(10,NULL,5,4,77653,'2017-12-13 07:12:44','Insert'),(11,4,NULL,6,1400,'2017-12-13 07:14:46','Insert'),(12,5,NULL,7,1200,'2017-12-13 07:14:46','Insert'),(13,6,NULL,8,2,'2017-12-13 07:14:46','Insert'),(14,7,NULL,9,200,'2017-12-13 07:14:46','Insert'),(15,8,NULL,10,8000,'2017-12-13 07:14:46','Insert'),(16,9,NULL,9,2600,'2017-12-13 07:14:46','Insert'),(17,10,NULL,8,1800,'2017-12-13 07:14:46','Insert');
/*!40000 ALTER TABLE `logofinventory_insert_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logofinventory_update`
--

DROP TABLE IF EXISTS `logofinventory_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logofinventory_update` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_rm_id` int(11) DEFAULT NULL,
  `new_rm_id` int(11) DEFAULT NULL,
  `old_fg_id` int(11) DEFAULT NULL,
  `new_fg_id` int(11) DEFAULT NULL,
  `old_inventory_location_id` int(11) NOT NULL,
  `new_inventory_location_id` int(11) NOT NULL,
  `old_quantity` int(11) NOT NULL,
  `new_quantity` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logofinventory_update`
--

LOCK TABLES `logofinventory_update` WRITE;
/*!40000 ALTER TABLE `logofinventory_update` DISABLE KEYS */;
INSERT INTO `logofinventory_update` VALUES (1,2,1,NULL,NULL,5,5,10,11,'2017-12-09 22:55:59'),(2,NULL,NULL,2,2,1,1,10,11,'2017-12-09 23:01:02'),(3,NULL,NULL,1,1,1,1,8987,87,'2017-12-10 22:44:49'),(4,NULL,NULL,2,2,2,2,9909,909,'2017-12-10 22:44:50'),(5,NULL,NULL,1,1,2,2,1000,100,'2017-12-10 22:44:50'),(6,NULL,NULL,1,1,1,1,87,90,'2017-12-13 07:13:28'),(7,NULL,NULL,2,2,2,2,909,910,'2017-12-13 07:13:28'),(8,NULL,NULL,3,3,3,3,10090,10010,'2017-12-13 07:13:28'),(9,NULL,NULL,4,4,4,4,222,220,'2017-12-13 07:13:28'),(10,NULL,NULL,5,5,6,6,3532,3500,'2017-12-13 07:13:28'),(11,NULL,NULL,3,3,6,6,2235,2200,'2017-12-13 07:13:28'),(12,NULL,NULL,4,4,7,7,79,80,'2017-12-13 07:13:28'),(13,NULL,NULL,5,5,4,4,77653,77000,'2017-12-13 07:13:28'),(14,1,1,NULL,NULL,3,3,33201,33000,'2017-12-13 07:14:46'),(15,2,2,NULL,NULL,4,4,44231,44000,'2017-12-13 07:14:46'),(16,3,3,NULL,NULL,5,5,88271,5400,'2017-12-13 07:14:46'),(17,2,2,NULL,NULL,1,1,10000,1000,'2017-12-13 07:14:46'),(18,1,1,NULL,NULL,5,5,11,10,'2017-12-13 07:14:46');
/*!40000 ALTER TABLE `logofinventory_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentfromcustomer`
--

DROP TABLE IF EXISTS `paymentfromcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentfromcustomer` (
  `payment_from_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recieved_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_employee_id` smallint(5) unsigned NOT NULL,
  `fk_shipment_dispatched_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_from_customer_id`),
  KEY `idx_fk_employee_id` (`fk_employee_id`),
  KEY `idx_fk_shipment_dispatched_id` (`fk_shipment_dispatched_id`),
  CONSTRAINT `fk_PaymentFromCustomer_Employee` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PaymentFromCustomer_ShipmentDispatched` FOREIGN KEY (`fk_shipment_dispatched_id`) REFERENCES `shipmentdispatched` (`shipment_dispatched_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentfromcustomer`
--

LOCK TABLES `paymentfromcustomer` WRITE;
/*!40000 ALTER TABLE `paymentfromcustomer` DISABLE KEYS */;
INSERT INTO `paymentfromcustomer` VALUES (1,'2017-12-10 00:52:49',4,1,'2017-12-10 00:52:49'),(2,'2017-12-13 07:28:47',4,2,'2017-12-13 07:28:47'),(3,'2017-12-13 07:28:47',4,5,'2017-12-13 07:28:47');
/*!40000 ALTER TABLE `paymentfromcustomer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`paymentfromcustomer_AFTER_INSERT` AFTER INSERT ON `paymentfromcustomer` FOR EACH ROW
BEGIN
	CALL `warehousedatabase`.`proc_close_customer_order`(NEW.fk_shipment_dispatched_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `paymenttosupplier`
--

DROP TABLE IF EXISTS `paymenttosupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenttosupplier` (
  `payment_to_supplier_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_employee_id` smallint(5) unsigned NOT NULL,
  `fk_shipment_recieved_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_to_supplier_id`),
  KEY `idx_fk_employee_id` (`fk_employee_id`),
  KEY `idx_fk_shipment_recieved_id` (`fk_shipment_recieved_id`),
  CONSTRAINT `fk_PaymentToSupplier_Employee` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PaymentToSupplier_ShipmentRecieved` FOREIGN KEY (`fk_shipment_recieved_id`) REFERENCES `shipmentrecieved` (`shipment_recieved_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttosupplier`
--

LOCK TABLES `paymenttosupplier` WRITE;
/*!40000 ALTER TABLE `paymenttosupplier` DISABLE KEYS */;
INSERT INTO `paymenttosupplier` VALUES (1,'2017-12-10 00:52:24',4,1,'2017-12-10 00:52:24'),(2,'2017-12-13 07:27:41',4,2,'2017-12-13 07:27:41');
/*!40000 ALTER TABLE `paymenttosupplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `warehousedatabase`.`paymenttosupplier_AFTER_INSERT` AFTER INSERT ON `paymenttosupplier` FOR EACH ROW
BEGIN
	CALL `warehousedatabase`.`proc_close_purchase_order`(NEW.fk_shipment_recieved_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `purchaseord_has_rawmaterial`
--

DROP TABLE IF EXISTS `purchaseord_has_rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseord_has_rawmaterial` (
  `bridge_id` smallint(5) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `fk_purchase_order_id` int(10) unsigned NOT NULL,
  `fk_raw_material_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bridge_id`),
  KEY `idx_fk_purchase_order_id` (`fk_purchase_order_id`),
  KEY `idx_fk_raw_material_id` (`fk_raw_material_id`),
  CONSTRAINT `fk_PurchaseOrd_Has_RawMaterial_PurchaseOrder` FOREIGN KEY (`fk_purchase_order_id`) REFERENCES `purchaseorder` (`purchase_order_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PurchaseOrd_Has_RawMaterial_RawMaterial` FOREIGN KEY (`fk_raw_material_id`) REFERENCES `rawmaterial` (`raw_material_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseord_has_rawmaterial`
--

LOCK TABLES `purchaseord_has_rawmaterial` WRITE;
/*!40000 ALTER TABLE `purchaseord_has_rawmaterial` DISABLE KEYS */;
INSERT INTO `purchaseord_has_rawmaterial` VALUES (1,4000,1,1,'2017-12-05 06:33:22'),(2,5000,1,2,'2017-12-05 06:33:22'),(3,6000,1,3,'2017-12-05 06:33:22'),(4,2000,2,4,'2017-12-13 07:21:11'),(5,3000,2,5,'2017-12-13 07:21:11'),(6,400,3,6,'2017-12-13 07:21:11'),(7,500,3,7,'2017-12-13 07:21:11'),(8,5000,4,8,'2017-12-13 07:21:11'),(9,6000,4,9,'2017-12-13 07:21:11'),(10,1000,5,10,'2017-12-13 07:21:11'),(11,2000,5,2,'2017-12-13 07:21:11');
/*!40000 ALTER TABLE `purchaseord_has_rawmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorder` (
  `purchase_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `requested_ship_date` date DEFAULT NULL,
  `priority_mode_of_shipment` enum('Air','Sea','Ground') NOT NULL,
  `po_status` enum('Open','Closed','Cancelled') NOT NULL DEFAULT 'Open',
  `fk_employee_id` smallint(5) unsigned NOT NULL,
  `fk_supplier_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_order_id`),
  KEY `idx_fk_employee_id` (`fk_employee_id`),
  KEY `idx_fk_supplier_id` (`fk_supplier_id`),
  CONSTRAINT `fk_PurchaseOrder_Employee` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PurchaseOrder_Supplier` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,'2017-12-05','2017-12-07','Ground','Closed',2,1,'2017-12-10 00:52:24'),(2,'2017-12-05','2017-12-12','Air','Closed',2,2,'2017-12-13 07:27:41'),(3,'2017-12-05','2017-12-12','Sea','Open',2,3,'2017-12-13 07:19:47'),(4,'2017-12-05','2017-12-12','Air','Open',2,4,'2017-12-13 07:19:47'),(5,'2017-12-05','2017-12-12','Sea','Open',2,1,'2017-12-13 07:19:47'),(6,'2017-12-05','2017-12-12','Ground','Open',2,2,'2017-12-13 07:19:47');
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterial`
--

DROP TABLE IF EXISTS `rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rawmaterial` (
  `raw_material_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `raw_material_type` enum('Fabric','Paper','RFID') NOT NULL,
  `units_of_measurement` enum('Each','Meter','Kilogram') NOT NULL,
  `unit_price_in_USD` decimal(4,2) NOT NULL,
  `color` varchar(10) NOT NULL,
  `material_status` enum('Active','Discontinued') NOT NULL DEFAULT 'Active',
  `description` text,
  `RetailBrandingCompany` varchar(45) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`raw_material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
INSERT INTO `rawmaterial` VALUES (1,'Fabric','Meter',1.00,'Black','Active','2 Side Satin','Zara','2017-12-13 07:01:31'),(2,'RFID','Each',2.00,'White','Active','Chip Enabled','Louis Vuitton','2017-12-13 07:01:30'),(3,'Paper','Kilogram',2.00,'Brown','Active','Thick Paper','Columbia','2017-12-13 07:01:30'),(4,'Fabric','Meter',3.00,'Black','Active','2 Side Satin','Louis Vuitton','2017-12-13 07:01:30'),(5,'RFID','Each',1.00,'Brown','Active','Chip Enabled','Louis Vuitton','2017-12-13 07:01:30'),(6,'RFID','Each',2.00,'Black','Active','Chip Enabled','Zara','2017-12-13 07:01:30'),(7,'Fabric','Meter',3.00,'Brown','Active','2 Side Satin','Columbia','2017-12-13 07:01:30'),(8,'Paper','Kilogram',2.00,'Brown','Active','Thick Paper','Zara','2017-12-13 07:01:30'),(9,'Fabric','Meter',1.00,'Brown','Active','2 Side Satin','Louis Vuitton','2017-12-13 07:01:30'),(10,'Fabric','Meter',3.00,'Black','Active','2 Side Satin','Columbia','2017-12-13 07:01:30');
/*!40000 ALTER TABLE `rawmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailbrandingofficehq`
--

DROP TABLE IF EXISTS `retailbrandingofficehq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailbrandingofficehq` (
  `retail_branding_office_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `create_date` date NOT NULL,
  `fk_address_id` int(10) unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`retail_branding_office_id`),
  KEY `idx_fk_address_id` (`fk_address_id`),
  CONSTRAINT `fk_RetailBrandingOfficeHQ_Address` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailbrandingofficehq`
--

LOCK TABLES `retailbrandingofficehq` WRITE;
/*!40000 ALTER TABLE `retailbrandingofficehq` DISABLE KEYS */;
INSERT INTO `retailbrandingofficehq` VALUES (1,'Zara','zara@gmail.com','2017-01-01',1,'2017-12-05 01:43:00'),(2,'Columbia','columbia@gmail.com','2017-02-01',10,'2017-12-13 06:47:44'),(3,'Louis Vuitton','lv@gmail.com','2017-03-01',11,'2017-12-13 06:52:09');
/*!40000 ALTER TABLE `retailbrandingofficehq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmentdispatched`
--

DROP TABLE IF EXISTS `shipmentdispatched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipmentdispatched` (
  `shipment_dispatched_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipment_dispatched_date` date NOT NULL,
  `fk_customer_request_form_id` int(10) unsigned NOT NULL COMMENT 'Set Customer Request Status as CLOSED upon shipment dispatched',
  `fk_employee_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shipment_dispatched_id`),
  KEY `idx_fk_customer_request_form_id` (`fk_customer_request_form_id`),
  KEY `idx_fk_employee_id` (`fk_employee_id`),
  CONSTRAINT `fk_ShipmentDispatched_CustomerRequestForm` FOREIGN KEY (`fk_customer_request_form_id`) REFERENCES `customerrequestform` (`customer_request_form_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ShipmentDispatched_Employee` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmentdispatched`
--

LOCK TABLES `shipmentdispatched` WRITE;
/*!40000 ALTER TABLE `shipmentdispatched` DISABLE KEYS */;
INSERT INTO `shipmentdispatched` VALUES (1,'2017-12-14',1,1,'2017-12-05 06:38:37'),(2,'2017-12-16',2,1,'2017-12-13 07:26:39'),(3,'2017-12-16',3,1,'2017-12-13 07:26:39'),(4,'2017-12-16',7,1,'2017-12-13 07:26:39'),(5,'2017-12-16',8,1,'2017-12-13 07:26:39');
/*!40000 ALTER TABLE `shipmentdispatched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmentrecieved`
--

DROP TABLE IF EXISTS `shipmentrecieved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipmentrecieved` (
  `shipment_recieved_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipment_recieved_date` date NOT NULL,
  `fk_employee_id` smallint(5) unsigned NOT NULL,
  `fk_purchase_order_id` int(10) unsigned NOT NULL COMMENT 'Set Purchase Order Status as CLOSED upon shipment recieved',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shipment_recieved_id`),
  KEY `idx_fk_employee_id` (`fk_employee_id`),
  KEY `idx_fk_purchase_order_id` (`fk_purchase_order_id`),
  CONSTRAINT `fk_ShipmentRecieved_Employee` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ShipmentRecieved_PurchaseOrder` FOREIGN KEY (`fk_purchase_order_id`) REFERENCES `purchaseorder` (`purchase_order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmentrecieved`
--

LOCK TABLES `shipmentrecieved` WRITE;
/*!40000 ALTER TABLE `shipmentrecieved` DISABLE KEYS */;
INSERT INTO `shipmentrecieved` VALUES (1,'2017-10-14',1,1,'2017-12-10 01:04:11'),(2,'2017-10-14',1,2,'2017-12-13 07:27:10'),(3,'2017-10-14',1,3,'2017-12-13 07:27:10');
/*!40000 ALTER TABLE `shipmentrecieved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state_name` varchar(45) NOT NULL,
  `fk_country_id` smallint(5) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`state_id`),
  KEY `idx_fk_country_id` (`fk_country_id`),
  CONSTRAINT `fk_State_Country` FOREIGN KEY (`fk_country_id`) REFERENCES `country` (`country_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Uttar Pradesh',1,'2017-12-09 07:00:38'),(2,'New Delhi',1,'2017-12-09 07:00:38'),(3,'Rajasthan',1,'2017-12-09 07:00:38'),(4,'Haryana',1,'2017-12-09 07:00:38'),(5,'Karnataka',1,'2017-12-09 07:00:38');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `activity_status` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `create_date` date NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'PnP Factory','pnp@gmail.com','Active','2017-03-04','2017-12-05 01:47:34'),(2,'JpJ Factory','jpj@gmail.com','Active','2017-04-09','2017-12-13 06:55:28'),(3,'IoI Factory','ioi@gmail.com','Active','2017-05-01','2017-12-13 06:56:29'),(4,'QwQ Factory','qwq@gmail.com','Active','2017-03-01','2017-12-13 06:56:29');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_cost_per_customer_order`
--

DROP TABLE IF EXISTS `vw_cost_per_customer_order`;
/*!50001 DROP VIEW IF EXISTS `vw_cost_per_customer_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_cost_per_customer_order` AS SELECT 
 1 AS `Customer Order ID`,
 1 AS `Total Cost (in $)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cost_per_purchase_order`
--

DROP TABLE IF EXISTS `vw_cost_per_purchase_order`;
/*!50001 DROP VIEW IF EXISTS `vw_cost_per_purchase_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_cost_per_purchase_order` AS SELECT 
 1 AS `Purchase Order ID`,
 1 AS `Total Cost (in $)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_customer_order_summary`
--

DROP TABLE IF EXISTS `vw_customer_order_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_customer_order_summary` AS SELECT 
 1 AS `Customer Order ID`,
 1 AS `Order Total (in $)`,
 1 AS `Order Date`,
 1 AS `Requested Ship Date`,
 1 AS `Mode of Shipment`,
 1 AS `Customer Order Status`,
 1 AS `Customer ID: Name`,
 1 AS `Employee ID: Name`,
 1 AS `CRF Last Update`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_finished_goods_in_stock`
--

DROP TABLE IF EXISTS `vw_finished_goods_in_stock`;
/*!50001 DROP VIEW IF EXISTS `vw_finished_goods_in_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_finished_goods_in_stock` AS SELECT 
 1 AS `FinishedGoods ID`,
 1 AS `Stock On Hand`,
 1 AS `Unit Price (in $)`,
 1 AS `Total Cost (in $)`,
 1 AS `Production Capacity (piece/min)`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_payable_summary`
--

DROP TABLE IF EXISTS `vw_payable_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_payable_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_payable_summary` AS SELECT 
 1 AS `Supplier Payment ID`,
 1 AS `Finance Employee ID: Name`,
 1 AS `Payment Date`,
 1 AS `Shimpment ID`,
 1 AS `Shipment Recieved On`,
 1 AS `Store Employee ID: Name`,
 1 AS `Purchase Order ID`,
 1 AS `Order Total (in $)`,
 1 AS `Supplier ID: Name`,
 1 AS `Purchase Employee ID: Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_production_lead_time`
--

DROP TABLE IF EXISTS `vw_production_lead_time`;
/*!50001 DROP VIEW IF EXISTS `vw_production_lead_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_production_lead_time` AS SELECT 
 1 AS `Finished Goods ID`,
 1 AS `Available Stock On Hand`,
 1 AS `Production Capacity (piece/min)`,
 1 AS `Finished Goods Required`,
 1 AS `Production Lead Time (in days)`,
 1 AS `Expected Ship Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_purchase_order_summary`
--

DROP TABLE IF EXISTS `vw_purchase_order_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_purchase_order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_purchase_order_summary` AS SELECT 
 1 AS `Purchase Order ID`,
 1 AS `Order Total (in $)`,
 1 AS `Order Date`,
 1 AS `Requested Ship Date`,
 1 AS `Mode of Shipment`,
 1 AS `Purchase Order Status`,
 1 AS `Supplier ID: Name`,
 1 AS `Employee ID: Name`,
 1 AS `PO Last Update`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_raw_material_in_stock`
--

DROP TABLE IF EXISTS `vw_raw_material_in_stock`;
/*!50001 DROP VIEW IF EXISTS `vw_raw_material_in_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_raw_material_in_stock` AS SELECT 
 1 AS `RawMaterial ID`,
 1 AS `Stock On Hand`,
 1 AS `Unit Price (in $)`,
 1 AS `Total Cost (in $)`,
 1 AS `Units of Measurement`,
 1 AS `RawMaterial Type`,
 1 AS `Color`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_recievable_summary`
--

DROP TABLE IF EXISTS `vw_recievable_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_recievable_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_recievable_summary` AS SELECT 
 1 AS `Customer Payment ID`,
 1 AS `Finance Employee ID: Name`,
 1 AS `Payment Date`,
 1 AS `Shimpment ID`,
 1 AS `Shipment Dispatched On`,
 1 AS `Store Employee ID: Name`,
 1 AS `Customer Order ID`,
 1 AS `Order Total (in $)`,
 1 AS `Customer ID: Name`,
 1 AS `CustomerService Employee ID: Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rm_required_to_manufacture_balance_requested_fg`
--

DROP TABLE IF EXISTS `vw_rm_required_to_manufacture_balance_requested_fg`;
/*!50001 DROP VIEW IF EXISTS `vw_rm_required_to_manufacture_balance_requested_fg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_rm_required_to_manufacture_balance_requested_fg` AS SELECT 
 1 AS `Finished Goods ID`,
 1 AS `Raw Material ID`,
 1 AS `RM Required (per FG)`,
 1 AS `Total RM Required`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_surplus_or_deficit_inventory`
--

DROP TABLE IF EXISTS `vw_surplus_or_deficit_inventory`;
/*!50001 DROP VIEW IF EXISTS `vw_surplus_or_deficit_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_surplus_or_deficit_inventory` AS SELECT 
 1 AS `Raw Material ID`,
 1 AS `RM Required for Orders on Hand`,
 1 AS `Available Stock On Hand`,
 1 AS `Surplus(+)/Deficit(-) Inventory`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'warehousedatabase'
--

--
-- Dumping routines for database 'warehousedatabase'
--
/*!50003 DROP FUNCTION IF EXISTS `get_qty_requested_for_finished_good` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_qty_requested_for_finished_good`(par_finished_goods_id INT) RETURNS int(11)
BEGIN

DECLARE var_finished_goods_requested_by_customers INT; #Total of Finished Goods in Customer Orders

SELECT IFNULL(SUM(custrequestform_has_finishedgoods.quantity),0) INTO var_finished_goods_requested_by_customers
FROM finishedgoods
JOIN
custrequestform_has_finishedgoods
ON
finishedgoods.finished_goods_id = custrequestform_has_finishedgoods.fk_finished_goods_id
WHERE finished_goods_id = par_finished_goods_id;


RETURN var_finished_goods_requested_by_customers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_close_customer_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_close_customer_order`(IN par_shipment_dispatched_id INT)
BEGIN
	DECLARE var_customer_request_form_id INT;

	SELECT shipmentdispatched.fk_customer_request_form_id INTO var_customer_request_form_id
		FROM shipmentdispatched
		WHERE shipmentdispatched.shipment_dispatched_id = par_shipment_dispatched_id;
        
	UPDATE `warehousedatabase`.`customerrequestform` 
    SET `crf_status`='Closed' WHERE `customer_request_form_id`=var_customer_request_form_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_close_purchase_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_close_purchase_order`(IN par_shipment_recieved_id INT)
BEGIN
	DECLARE var_purchase_order_id INT;

	SELECT shipmentrecieved.fk_purchase_order_id INTO var_purchase_order_id
		FROM shipmentrecieved
		WHERE shipmentrecieved.shipment_recieved_id = par_shipment_recieved_id;
        
	UPDATE `warehousedatabase`.`purchaseorder` 
    SET `po_status`='Closed' WHERE `purchase_order_id`=var_purchase_order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_entity_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_entity_address`(IN par_entitytype VARCHAR(45), IN par_entityID INT)
BEGIN
	    IF par_entitytype = 'Supplier' AND (par_entityID IN (SELECT supplier.supplier_id FROM supplier))
        THEN 
        (SELECT supplier.supplier_id AS `Supplier ID`,
        supplier.supplier_name AS `Supplier Name`,
        IFNULL(supplier.email,'Not Available') AS `Supplier Email`,
        supplier.activity_status AS `Activity Status`,
        DATE_FORMAT(supplier.create_date,'%b %e, %Y') AS `Created On`,
        
        address.address_id AS `Address ID`,
        address.address_line AS `Street`,
        address.phone_number AS `Phone No.`,
        address.postal_code AS `Postal Code`,
        city.city_name AS `City`,
        state.state_name AS `State`,
        country.country_name AS `Country`
        
        FROM supplier
        JOIN address ON supplier.supplier_id = address.fk_supplier_id
        
        JOIN city ON address.fk_city_id = city.city_id
        JOIN state ON city.fk_state_id = state.state_id
        JOIN country ON state.fk_country_id = country.country_id
        
        WHERE supplier.supplier_id = par_entityID   );
    
    ELSEIF par_entitytype = 'Customer' AND (par_entityID IN (SELECT customer.customer_id FROM customer))
        THEN
        (SELECT customer.customer_id AS `Customer ID`,
        customer.customer_name AS `Customer Name`,
        IFNULL(customer.email,'Not Available') AS `Customer Email`,
        customer.activity_status AS `Activity Status`,
        DATE_FORMAT(customer.create_date,'%b %e, %Y') AS `Created On`,
        
        address.address_id AS `Address ID`,
        address.address_line AS `Street`,
        address.phone_number AS `Phone No.`,
        address.postal_code AS `Postal Code`,
        city.city_name AS `City`,
        state.state_name AS `State`,
        country.country_name AS `Country`
        
        FROM customer
        JOIN address ON customer.customer_id = address.fk_customer_id
        
        JOIN city ON address.fk_city_id = city.city_id
        JOIN state ON city.fk_state_id = state.state_id
        JOIN country ON state.fk_country_id = country.country_id
        
        WHERE customer.customer_id = par_entityID);
    
    ELSEIF par_entitytype = 'Employee' AND (par_entityID IN (SELECT employee.employee_id FROM employee))
        THEN
        (SELECT employee.employee_id AS `Employee ID`,
        CONCAT(employee.first_name, ' ', employee.last_name) AS `Employee Name`,
        IFNULL(employee.email,'Not Available') AS `Employee Email`,
        employee.activity_status AS `Activity Status`,
        DATE_FORMAT(employee.joining_date,'%b %e, %Y') AS `Joined On`,
        employee.username AS `UserName`,
        
        department.department_name AS `Department`,
        
        address.address_id AS `Address ID`,
        address.address_line AS `Street`,
        address.phone_number AS `Phone No.`,
        address.postal_code AS `Postal Code`,
        city.city_name AS `City`,
        state.state_name AS `State`,
        country.country_name AS `Country`
        
        FROM employee
        JOIN address ON employee.fk_address_id = address.address_id
        
        JOIN city ON address.fk_city_id = city.city_id
        JOIN state ON city.fk_state_id = state.state_id
        JOIN country ON state.fk_country_id = country.country_id
        
        JOIN department ON employee.fk_department_id = department.department_id
        
        WHERE employee.employee_id = par_entityID);
    
    ELSEIF par_entitytype = 'RBO' AND (par_entityID IN (SELECT retailbrandingofficehq.retail_branding_office_id FROM retailbrandingofficehq))
        THEN
        (SELECT retailbrandingofficehq.retail_branding_office_id AS `RBO ID`,
        retailbrandingofficehq.brand_name AS `RBO Name`,
        IFNULL(retailbrandingofficehq.email,'Not Available') AS `RBO Email`,
        DATE_FORMAT(retailbrandingofficehq.create_date,'%b %e, %Y') AS `Created On`,
        
        address.address_id AS `Address ID`,
        address.address_line AS `Street`,
        address.phone_number AS `Phone No.`,
        address.postal_code AS `Postal Code`,
        city.city_name AS `City`,
        state.state_name AS `State`,
        country.country_name AS `Country`
        
        FROM retailbrandingofficehq
        JOIN address ON retailbrandingofficehq.fk_address_id = address.address_id
        
        JOIN city ON address.fk_city_id = city.city_id
        JOIN state ON city.fk_state_id = state.state_id
        JOIN country ON state.fk_country_id = country.country_id
        
        WHERE retailbrandingofficehq.retail_branding_office_id = par_entityID);
    
    ELSE 
        SIGNAL SQLSTATE '45000'   
        SET MESSAGE_TEXT = 'Entered Parameter does not EXIST!!';
        
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_total_inventory_carrying_cost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_total_inventory_carrying_cost`()
BEGIN
	
SELECT
        ((SELECT SUM(vw_raw_material_in_stock.`Total Cost (in $)`) 
                FROM warehousedatabase.vw_raw_material_in_stock)) AS `Total Cost of RM (in $)`,
        ((SELECT SUM(vw_finished_goods_in_stock.`Total Cost (in $)`) 
                FROM warehousedatabase.vw_finished_goods_in_stock)) AS `Total Cost of FG (in $)`,
        ((SELECT SUM(vw_finished_goods_in_stock.`Total Cost (in $)`) 
                FROM warehousedatabase.vw_finished_goods_in_stock) +
        (SELECT SUM(vw_raw_material_in_stock.`Total Cost (in $)`) 
                FROM warehousedatabase.vw_raw_material_in_stock)) AS `Total Inventory Carrying Cost (in $)`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_cost_per_customer_order`
--

/*!50001 DROP VIEW IF EXISTS `vw_cost_per_customer_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cost_per_customer_order` AS select `customerrequestform`.`customer_request_form_id` AS `Customer Order ID`,sum((`custrequestform_has_finishedgoods`.`quantity` * `finishedgoods`.`unit_price_in_USD/piece`)) AS `Total Cost (in $)` from ((`custrequestform_has_finishedgoods` join `customerrequestform` on((`custrequestform_has_finishedgoods`.`fk_customer_request_form_id` = `customerrequestform`.`customer_request_form_id`))) join `finishedgoods` on((`finishedgoods`.`finished_goods_id` = `custrequestform_has_finishedgoods`.`fk_finished_goods_id`))) group by `customerrequestform`.`customer_request_form_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cost_per_purchase_order`
--

/*!50001 DROP VIEW IF EXISTS `vw_cost_per_purchase_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cost_per_purchase_order` AS select `purchaseorder`.`purchase_order_id` AS `Purchase Order ID`,sum((`purchaseord_has_rawmaterial`.`quantity` * `rawmaterial`.`unit_price_in_USD`)) AS `Total Cost (in $)` from ((`purchaseorder` join `purchaseord_has_rawmaterial` on((`purchaseord_has_rawmaterial`.`fk_purchase_order_id` = `purchaseorder`.`purchase_order_id`))) join `rawmaterial` on((`rawmaterial`.`raw_material_id` = `purchaseord_has_rawmaterial`.`fk_raw_material_id`))) group by `purchaseorder`.`purchase_order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_order_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_order_summary` AS select `customerrequestform`.`customer_request_form_id` AS `Customer Order ID`,(select `vw_cost_per_customer_order`.`Total Cost (in $)` from `vw_cost_per_customer_order` where (`vw_cost_per_customer_order`.`Customer Order ID` = `customerrequestform`.`customer_request_form_id`)) AS `Order Total (in $)`,date_format(`customerrequestform`.`create_date`,'%b %e, %Y') AS `Order Date`,date_format(`customerrequestform`.`requested_ship_date`,'%b %e, %Y') AS `Requested Ship Date`,`customerrequestform`.`priority_mode_of_shipment` AS `Mode of Shipment`,`customerrequestform`.`crf_status` AS `Customer Order Status`,group_concat(`customerrequestform`.`fk_customer_id`,': ',(select `customer`.`customer_name` from `customer` where (`customer`.`customer_id` = `customerrequestform`.`fk_customer_id`)) separator ',') AS `Customer ID: Name`,group_concat(`customerrequestform`.`fk_employee_id`,': ',(select concat(`employee`.`first_name`,' ',`employee`.`last_name`) from `employee` where (`employee`.`employee_id` = `customerrequestform`.`fk_employee_id`)) separator ',') AS `Employee ID: Name`,date_format(`customerrequestform`.`last_update`,'%b %e, %Y  %T') AS `CRF Last Update` from `customerrequestform` group by `customerrequestform`.`customer_request_form_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_finished_goods_in_stock`
--

/*!50001 DROP VIEW IF EXISTS `vw_finished_goods_in_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_finished_goods_in_stock` AS select `finishedgoods`.`finished_goods_id` AS `FinishedGoods ID`,sum(`inventorylocation_has_finishedgoods`.`fg_stock_on_hand`) AS `Stock On Hand`,`finishedgoods`.`unit_price_in_USD/piece` AS `Unit Price (in $)`,round((sum(`inventorylocation_has_finishedgoods`.`fg_stock_on_hand`) * `finishedgoods`.`unit_price_in_USD/piece`),2) AS `Total Cost (in $)`,`finishedgoods`.`production_capacity_piece/min` AS `Production Capacity (piece/min)`,`finishedgoods`.`description` AS `Description` from (`finishedgoods` join `inventorylocation_has_finishedgoods`) where ((`finishedgoods`.`finished_goods_id` = `inventorylocation_has_finishedgoods`.`fk_finished_goods_id`) and (`finishedgoods`.`material_status` = 'Active')) group by `finishedgoods`.`finished_goods_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_payable_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_payable_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_payable_summary` AS select `paymenttosupplier`.`payment_to_supplier_id` AS `Supplier Payment ID`,group_concat(`paymenttosupplier`.`fk_employee_id`,': ',(select concat(`employee`.`first_name`,' ',`employee`.`last_name`) from `employee` where (`employee`.`employee_id` = `paymenttosupplier`.`fk_employee_id`)) separator ',') AS `Finance Employee ID: Name`,date_format(`paymenttosupplier`.`payment_datetime`,'%b %e, %Y') AS `Payment Date`,`paymenttosupplier`.`fk_shipment_recieved_id` AS `Shimpment ID`,date_format(`shipmentrecieved`.`shipment_recieved_date`,'%b %e, %Y') AS `Shipment Recieved On`,group_concat(`shipmentrecieved`.`fk_employee_id`,': ',(select concat(`employee`.`first_name`,' ',`employee`.`last_name`) from `employee` where (`employee`.`employee_id` = `shipmentrecieved`.`fk_employee_id`)) separator ',') AS `Store Employee ID: Name`,(select `vw_purchase_order_summary`.`Purchase Order ID` from `vw_purchase_order_summary` where (`shipmentrecieved`.`fk_purchase_order_id` = `vw_purchase_order_summary`.`Purchase Order ID`)) AS `Purchase Order ID`,(select `vw_purchase_order_summary`.`Order Total (in $)` from `vw_purchase_order_summary` where (`shipmentrecieved`.`fk_purchase_order_id` = `vw_purchase_order_summary`.`Purchase Order ID`)) AS `Order Total (in $)`,(select `vw_purchase_order_summary`.`Supplier ID: Name` from `vw_purchase_order_summary` where (`shipmentrecieved`.`fk_purchase_order_id` = `vw_purchase_order_summary`.`Purchase Order ID`)) AS `Supplier ID: Name`,(select `vw_purchase_order_summary`.`Employee ID: Name` from `vw_purchase_order_summary` where (`shipmentrecieved`.`fk_purchase_order_id` = `vw_purchase_order_summary`.`Purchase Order ID`)) AS `Purchase Employee ID: Name` from (`paymenttosupplier` join `shipmentrecieved` on((`paymenttosupplier`.`fk_shipment_recieved_id` = `shipmentrecieved`.`shipment_recieved_id`))) group by `paymenttosupplier`.`payment_to_supplier_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_production_lead_time`
--

/*!50001 DROP VIEW IF EXISTS `vw_production_lead_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_production_lead_time` AS select `vw_finished_goods_in_stock`.`FinishedGoods ID` AS `Finished Goods ID`,`vw_finished_goods_in_stock`.`Stock On Hand` AS `Available Stock On Hand`,`vw_finished_goods_in_stock`.`Production Capacity (piece/min)` AS `Production Capacity (piece/min)`,(select ifnull(sum(`custrequestform_has_finishedgoods`.`quantity`),0) from (`finishedgoods` join `custrequestform_has_finishedgoods` on((`finishedgoods`.`finished_goods_id` = `custrequestform_has_finishedgoods`.`fk_finished_goods_id`))) where (`finishedgoods`.`finished_goods_id` = `vw_finished_goods_in_stock`.`FinishedGoods ID`)) AS `Finished Goods Required`,round((select if(((`Finished Goods Required` - `vw_finished_goods_in_stock`.`Stock On Hand`) > 0),(((`Finished Goods Required` - `vw_finished_goods_in_stock`.`Stock On Hand`) / ((`vw_finished_goods_in_stock`.`Production Capacity (piece/min)` * 24) * 60)) + 2),2)),2) AS `Production Lead Time (in days)`,date_format((select (curdate() + interval cast(`Production Lead Time (in days)` as unsigned) day)),'%b %e, %Y') AS `Expected Ship Date` from `vw_finished_goods_in_stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_purchase_order_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_purchase_order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_purchase_order_summary` AS select `purchaseorder`.`purchase_order_id` AS `Purchase Order ID`,(select `vw_cost_per_purchase_order`.`Total Cost (in $)` from `vw_cost_per_purchase_order` where (`vw_cost_per_purchase_order`.`Purchase Order ID` = `purchaseorder`.`purchase_order_id`)) AS `Order Total (in $)`,`purchaseorder`.`create_date` AS `Order Date`,`purchaseorder`.`requested_ship_date` AS `Requested Ship Date`,`purchaseorder`.`priority_mode_of_shipment` AS `Mode of Shipment`,`purchaseorder`.`po_status` AS `Purchase Order Status`,group_concat(`purchaseorder`.`fk_supplier_id`,': ',(select `supplier`.`supplier_name` from `supplier` where (`supplier`.`supplier_id` = `purchaseorder`.`fk_supplier_id`)) separator ',') AS `Supplier ID: Name`,group_concat(`purchaseorder`.`fk_employee_id`,': ',(select concat(`employee`.`first_name`,' ',`employee`.`last_name`) from `employee` where (`employee`.`employee_id` = `purchaseorder`.`fk_employee_id`)) separator ',') AS `Employee ID: Name`,`purchaseorder`.`last_update` AS `PO Last Update` from `purchaseorder` group by `purchaseorder`.`purchase_order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_raw_material_in_stock`
--

/*!50001 DROP VIEW IF EXISTS `vw_raw_material_in_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_raw_material_in_stock` AS select `rawmaterial`.`raw_material_id` AS `RawMaterial ID`,round(sum(`inventorylocation_has_rawmaterial`.`rm_stock_on_hand`),0) AS `Stock On Hand`,`rawmaterial`.`unit_price_in_USD` AS `Unit Price (in $)`,round((sum(`inventorylocation_has_rawmaterial`.`rm_stock_on_hand`) * `rawmaterial`.`unit_price_in_USD`),2) AS `Total Cost (in $)`,`rawmaterial`.`units_of_measurement` AS `Units of Measurement`,`rawmaterial`.`raw_material_type` AS `RawMaterial Type`,`rawmaterial`.`color` AS `Color`,`rawmaterial`.`description` AS `Description` from (`rawmaterial` join `inventorylocation_has_rawmaterial`) where ((`rawmaterial`.`raw_material_id` = `inventorylocation_has_rawmaterial`.`fk_raw_material_id`) and (`rawmaterial`.`material_status` = 'Active')) group by `rawmaterial`.`raw_material_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_recievable_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_recievable_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_recievable_summary` AS select `paymentfromcustomer`.`payment_from_customer_id` AS `Customer Payment ID`,group_concat(`paymentfromcustomer`.`fk_employee_id`,': ',(select concat(`employee`.`first_name`,' ',`employee`.`last_name`) from `employee` where (`employee`.`employee_id` = `paymentfromcustomer`.`fk_employee_id`)) separator ',') AS `Finance Employee ID: Name`,date_format(`paymentfromcustomer`.`recieved_datetime`,'%b %e, %Y') AS `Payment Date`,`paymentfromcustomer`.`fk_shipment_dispatched_id` AS `Shimpment ID`,date_format(`shipmentdispatched`.`shipment_dispatched_date`,'%b %e, %Y') AS `Shipment Dispatched On`,group_concat(`shipmentdispatched`.`fk_employee_id`,': ',(select concat(`employee`.`first_name`,' ',`employee`.`last_name`) from `employee` where (`employee`.`employee_id` = `shipmentdispatched`.`fk_employee_id`)) separator ',') AS `Store Employee ID: Name`,(select `vw_customer_order_summary`.`Customer Order ID` from `vw_customer_order_summary` where (`shipmentdispatched`.`fk_customer_request_form_id` = `vw_customer_order_summary`.`Customer Order ID`)) AS `Customer Order ID`,(select `vw_customer_order_summary`.`Order Total (in $)` from `vw_customer_order_summary` where (`shipmentdispatched`.`fk_customer_request_form_id` = `vw_customer_order_summary`.`Customer Order ID`)) AS `Order Total (in $)`,(select `vw_customer_order_summary`.`Customer ID: Name` from `vw_customer_order_summary` where (`shipmentdispatched`.`fk_customer_request_form_id` = `vw_customer_order_summary`.`Customer Order ID`)) AS `Customer ID: Name`,(select `vw_customer_order_summary`.`Employee ID: Name` from `vw_customer_order_summary` where (`shipmentdispatched`.`fk_customer_request_form_id` = `vw_customer_order_summary`.`Customer Order ID`)) AS `CustomerService Employee ID: Name` from (`paymentfromcustomer` join `shipmentdispatched` on((`paymentfromcustomer`.`fk_shipment_dispatched_id` = `shipmentdispatched`.`shipment_dispatched_id`))) group by `paymentfromcustomer`.`payment_from_customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rm_required_to_manufacture_balance_requested_fg`
--

/*!50001 DROP VIEW IF EXISTS `vw_rm_required_to_manufacture_balance_requested_fg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rm_required_to_manufacture_balance_requested_fg` AS select `finishedgoods`.`finished_goods_id` AS `Finished Goods ID`,`fg_has_rm`.`fk_raw_material_id` AS `Raw Material ID`,`fg_has_rm`.`rm_qty_required_per_FG_piece` AS `RM Required (per FG)`,ceiling((`fg_has_rm`.`rm_qty_required_per_FG_piece` * (select if(((sum(`custrequestform_has_finishedgoods`.`quantity`) - (select sum(`inventorylocation_has_finishedgoods`.`fg_stock_on_hand`) from `inventorylocation_has_finishedgoods` where (`inventorylocation_has_finishedgoods`.`fk_finished_goods_id` = `fg_has_rm`.`fk_finished_goods_id`))) > 0),(sum(`custrequestform_has_finishedgoods`.`quantity`) - (select sum(`inventorylocation_has_finishedgoods`.`fg_stock_on_hand`) from `inventorylocation_has_finishedgoods` where (`inventorylocation_has_finishedgoods`.`fk_finished_goods_id` = `fg_has_rm`.`fk_finished_goods_id`))),0) from (`finishedgoods` join `custrequestform_has_finishedgoods` on((`finishedgoods`.`finished_goods_id` = `custrequestform_has_finishedgoods`.`fk_finished_goods_id`))) where (`finishedgoods`.`finished_goods_id` = `fg_has_rm`.`fk_finished_goods_id`) group by `finishedgoods`.`finished_goods_id`))) AS `Total RM Required` from (`finishedgoods` join `fg_has_rm` on((`finishedgoods`.`finished_goods_id` = `fg_has_rm`.`fk_finished_goods_id`))) order by `finishedgoods`.`finished_goods_id`,`fg_has_rm`.`fk_raw_material_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_surplus_or_deficit_inventory`
--

/*!50001 DROP VIEW IF EXISTS `vw_surplus_or_deficit_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_surplus_or_deficit_inventory` AS select `vw_rm_required_to_manufacture_balance_requested_fg`.`Raw Material ID` AS `Raw Material ID`,sum(`vw_rm_required_to_manufacture_balance_requested_fg`.`Total RM Required`) AS `RM Required for Orders on Hand`,round((select `vw_raw_material_in_stock`.`Stock On Hand` from `vw_raw_material_in_stock` where (`vw_raw_material_in_stock`.`RawMaterial ID` = `vw_rm_required_to_manufacture_balance_requested_fg`.`Raw Material ID`)),0) AS `Available Stock On Hand`,(select (`Available Stock On Hand` - sum(`vw_rm_required_to_manufacture_balance_requested_fg`.`Total RM Required`))) AS `Surplus(+)/Deficit(-) Inventory` from `vw_rm_required_to_manufacture_balance_requested_fg` group by `vw_rm_required_to_manufacture_balance_requested_fg`.`Raw Material ID` */;
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

-- Dump completed on 2017-12-13  4:23:49
