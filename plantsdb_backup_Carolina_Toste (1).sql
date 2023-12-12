CREATE DATABASE  IF NOT EXISTS `plants` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plants`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: plants
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Postcode` varchar(20) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,1,'39 Cross Road','Dewsbury','West Yorkshire','WF12 0ED','UK'),(2,2,'29 Thomas Street','St Pauls','Bristol','BS2 9LJ','UK'),(3,3,'3 Church Croft Cottage','Streatley','Berkshire','RG8 9HU','UK'),(4,4,'10 Willow Walk','Barnsley','South Yorkshire','S70 4NG','UK'),(5,5,'97 Pitman Place','Wotton-Under-Edge','Gloucestershire','GL12 7SG','UK'),(6,6,'1 Waypark Cottages','Morebath','Devon','EX16 9AP','UK'),(7,7,'5 Grafton Avenue','Stoke-On-Trent','Staffordshire','ST6 7DB','UK'),(8,8,'19 - 21 Schneider Close','Felixstowe','Suffolk','IP11 3BQ','UK'),(9,9,'2 Church Close','Anlaby','East Yorkshire','HU10 7DF','UK'),(10,10,'41 Hillside Avenue','Whitefield','Greater Manchester','M45 7SH','UK'),(11,11,'10 Jacobs Croft','Clayton','West Yorkshire','BD14 6SU','UK'),(12,12,'36 Town Street','Duffield','Derbyshire','DE56 4GD','UK'),(13,13,'1 Almond Close','Ruislip','London','HA4 6EB','UK'),(14,14,'54 Oldway','Bishopston','Swansea','SA3 3DJ','UK'),(15,15,'5 Oakcross Gardens','Woolton','Liverpool','L25 9GH','UK'),(16,16,'98 Graham Road','Birmingham','West Midlands','B25 8JX','UK'),(17,17,'The School House','Sandwich','Kent','CT13 9HS','UK'),(18,18,'5 Armstrong Close','Waterlooville','Hampshire','PO7 6AY','UK'),(19,19,'6 Woodlands Park','Shrewsbury','Shropshire','SY2 6JN','UK'),(20,20,'34 Rydal Crescent','Worsley','Greater Manchester','M28 7JD','UK'),(21,21,'Bracken Lodge','Terrington','North Yorkshire','YO60 6NX','UK'),(22,22,'1 Castille Gardens','Kings Langley','Hertfordshire','WD4 9PT','UK'),(23,23,'8 Heathervale','West Bridgford','Nottinghamshire','NG2 7ST','UK'),(24,24,'Derwen Fawr','Llanwrda','Carmarthenshire','SA19 8AA','UK'),(25,25,'3 Granfield Gardens','Langford','Somerset','BS40 5JP','UK'),(26,26,'42 St Andrews Drive','Stanmore','London','HA7 2NB','UK'),(27,27,'8 Viking Close','Manchester','Greater Manchester','M11 3JF','UK'),(28,28,'1 Dewstow Gardens','Caldicot','Monmouthshire','NP26 4HL','UK'),(29,29,'Lower Hook Cottage','North Cheriton','Somerset','BA8 0AL','UK'),(30,30,'Burcher House','Titley','Herefordshire','HR5 3RS','UK'),(31,31,'33 School Lane','Great Budworth','Cheshire','CW9 6HQ','UK'),(32,32,'4 Tristrams Croft','Bootle','Merseyside','L30 2NL','UK'),(33,33,'94 Edgecombe','Cambridge','Cambridgeshire','CB4 2LR','UK'),(34,34,'38 The Water Gardens','London','London','W2 2DB','UK'),(35,35,'58 Huntington Road','York','North Yorkshire','YO31 8RE','UK'),(36,36,'18 The Beeches','Yelverton','Devon','PL20 6FE','UK'),(37,37,'1 St Michaels Cottages','Ilsington','Devon','TQ13 9RJ','UK'),(38,38,'19 Westbury Lane','Buckhurst Hill','Essex','IG9 5NF','UK'),(39,39,'4 Windsor Avenue','Nantwich','Cheshire','CW5 7DN','UK'),(40,40,'Stone Grange','Grinshill','Shropshire','SY4 3BW','UK'),(41,41,'36 Oxted Green','Milford','Surrey','GU8 5DE','UK'),(42,42,'1 Pen Gelli','Talsarnau','Gwynedd','LL47 6UH','UK'),(43,43,'2 Earwigs, Furnace Lane','Cowden','Kent','TN8 7JP','UK'),(44,44,'12 Ashford Road','Sheldwich','Kent','ME13 0LL','UK'),(45,45,'31 Rectory Road','Tiptree','Essex','CO5 0SX','UK'),(46,46,'37 Endway','Surbiton','Surrey','KT5 9BT','UK'),(47,47,'1 Woodlands','Bexhill-On-Sea','East Sussex','TN39 4RJ','UK'),(48,48,'Rift Farm Cottage','Wylam','Northumberland','NE41 8BL','UK'),(49,49,'10 Penlan','Llandudno','Conwy','LL30 1PE','UK'),(50,50,'18 Tean','Porthkea','Cornwall','TR3 6AH','UK'),(51,51,'Hawthorn Cottage, 3 Kennels Lane','Albrighton','Shropshire','WV7 3BQ','UK'),(52,52,'23 Jessie Road','Havant','Hampshire','PO9 3TH','UK'),(53,53,'4 Cleugh Head','Greenhaugh','Northumberland','NE48 1PT','UK'),(54,54,'52 Wulfric Place','Sheffield','South Yorkshire','S2 1GZ','UK'),(55,55,'29 Dean Lane','Hazel Grove','Cheshire','SK7 6DH','UK'),(56,56,'23 Darwin Road','Mickleover','Derbyshire','DE3 9HU','UK'),(57,57,'The Lodge, 6 Baldon Lane','Marsh Baldon','Oxfordshire','OX44 9LT','UK'),(58,58,'2 Tudbury Way','Salford','Greater Manchester','M3 6TW','UK'),(59,59,'1 Weir End Road','Poundbury','Dorset','DT1 3RX','UK'),(60,60,'1 Glebe Close','Long Ashton','Somerset','BS41 9DB','UK');
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order_view`
--

DROP TABLE IF EXISTS `customer_order_view`;
/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_view` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `OrderID`,
 1 AS `OrderDate`,
 1 AS `TotalAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Wendye','Durrell','wdurrell0@ovh.net','108-950-2928'),(2,'Clerissa','Imesson','cimesson1@creativecommons.org','803-695-7931'),(3,'Lisha','Blazi','lblazi2@imageshack.us','251-175-9234'),(4,'Mikael','Peacop','mpeacop3@ft.com','384-790-6100'),(5,'Mayer','Seathwright','mseathwright4@bizjournals.com','281-456-4278'),(6,'Perle','Charrette','pcharrette5@google.com.au','521-794-2710'),(7,'Judy','Elman','jelman6@abc.net.au','673-890-1204'),(8,'Phaidra','Glennon','pglennon7@un.org','221-393-3190'),(9,'Rakel','Barrar','rbarrar8@fastcompany.com','477-952-1963'),(10,'Frances','Kestian','fkestian9@rediff.com','803-144-8216'),(11,'Silvester','Garritley','sgarritleya@naver.com','915-753-7357'),(12,'Seamus','Poulglais','spoulglaisb@rambler.ru','754-320-8488'),(13,'Karee','Courtman','kcourtmanc@unesco.org','134-793-7399'),(14,'Camella','Hugueville','chuguevilled@scribd.com','698-494-9485'),(15,'Gan','Sheppard','gshepparde@blogspot.com','321-672-4164'),(16,'Valerie','Litherborough','vlitherboroughf@nasa.gov','856-661-1865'),(17,'Marget','Gradley','mgradleyg@people.com.cn','168-503-3558'),(18,'Pammie','Rennick','prennickh@privacy.gov.au','830-135-5785'),(19,'Jacquelyn','Privett','jprivetti@behance.net','398-941-0272'),(20,'Raimundo','Ommanney','rommanneyj@blogtalkradio.com','603-732-3844'),(21,'Iona','Courvert','icourvertk@deviantart.com','149-643-1287'),(22,'George','Grasha','ggrashal@youtu.be','741-574-4647'),(23,'Herminia','Heeron','hheeronm@stanford.edu','335-583-8152'),(24,'Cassandre','Hawkeridge','chawkeridgen@paypal.com','799-442-8621'),(25,'Fabien','Garthland','fgarthlando@webmd.com','819-106-6612'),(26,'Siward','Cockill','scockillp@1688.com','916-592-9915'),(27,'Cheryl','Tamblingson','ctamblingsonq@tmall.com','238-751-6777'),(28,'Karmen','De Giovanni','kdegiovannir@digg.com','525-860-5890'),(29,'Rriocard','Sealove','rsealoves@live.com','478-152-5578'),(30,'Jeanette','Warlock','jwarlockt@mapquest.com','426-404-9341'),(31,'Cindie','Lovejoy','clovejoyu@icio.us','909-157-3360'),(32,'Orson','Siley','osileyv@techcrunch.com','779-934-6769'),(33,'Arlina','Torre','atorrew@fema.gov','718-449-8735'),(34,'Kesley','Cordle','kcordlex@gizmodo.com','753-154-9098'),(35,'Arlina','Gecks','agecksy@tamu.edu','656-346-2530'),(36,'Keelby','Wozencroft','kwozencroftz@mapquest.com','216-109-1909'),(37,'Bernarr','Hewes','bhewes10@timesonline.co.uk','365-489-9159'),(38,'Bondy','Kubiak','bkubiak11@printfriendly.com','890-795-1520'),(39,'Lynnea','Montrose','lmontrose12@google.es','630-384-1554'),(40,'Artus','Tunnow','atunnow13@slideshare.net','151-333-4963'),(41,'Gasper','De Coursey','gdecoursey14@usa.gov','126-723-0624'),(42,'Lola','Kohlert','lkohlert15@booking.com','457-822-2680'),(43,'Weidar','Zamora','wzamora16@sciencedirect.com','333-491-2964'),(44,'Kata','Ewbanke','kewbanke17@upenn.edu','368-634-9983'),(45,'Amanda','Iannazzi','aiannazzi18@smugmug.com','811-312-3338'),(46,'Jamesy','Camell','jcamell19@flavors.me','756-947-4148'),(47,'Sunshine','Hailey','shailey1a@desdev.cn','210-658-2421'),(48,'Flossi','Deaconson','fdeaconson1b@baidu.com','702-371-3929'),(49,'Noel','Pankhurst.','npankhurst1c@uiuc.edu','216-217-2442'),(50,'Biron','Conrath','bconrath1d@who.int','317-158-7969'),(51,'Sergio','Gerrit','sgerrit1e@webs.com','298-238-4197'),(52,'Adler','McCann','amccann1f@altervista.org','709-249-2845'),(53,'Isaiah','Cleve','icleve1g@berkeley.edu','945-886-5525'),(54,'Rafe','Dybald','rdybald1h@pagesperso-orange.fr','399-471-2075'),(55,'Devin','Coulsen','dcoulsen1i@people.com.cn','616-794-8046'),(56,'Augie','Cluderay','acluderay1j@is.gd','115-880-1816'),(57,'Kaleb','McFayden','kmcfayden1k@icio.us','741-721-4422'),(58,'Emelen','Bilton','ebilton1l@marketwatch.com','567-471-6244'),(59,'Wenda','Swatman','wswatman1m@bloglines.com','102-892-3142'),(60,'Janenna','Burker','jburker1n@cocolog-nifty.com','405-851-4902');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_order`
--

DROP TABLE IF EXISTS `extra_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_order` (
  `OrderID` int DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `fk_extra_order_orders` (`OrderID`),
  KEY `fk_extra_order_extras` (`ItemID`),
  CONSTRAINT `fk_extra_order_extras` FOREIGN KEY (`ItemID`) REFERENCES `extras` (`ItemID`),
  CONSTRAINT `fk_extra_order_orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_order`
--

LOCK TABLES `extra_order` WRITE;
/*!40000 ALTER TABLE `extra_order` DISABLE KEYS */;
INSERT INTO `extra_order` VALUES (4,12,3),(9,18,2),(9,22,1),(14,16,4),(15,10,2),(16,6,1),(17,14,3),(22,20,2),(25,8,1),(29,4,10),(33,12,3),(34,6,2),(35,8,3),(37,1,2);
/*!40000 ALTER TABLE `extra_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) NOT NULL,
  `ItemType` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockQuantity` int NOT NULL,
  `VendorID` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `fk_extras_vendor` (`VendorID`),
  CONSTRAINT `fk_extras_vendor` FOREIGN KEY (`VendorID`) REFERENCES `vendors` (`VendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES (1,'Plant Soil - Premium','Soil','High-quality potting soil for optimal plant growth',9.99,48,5),(2,'Plant Soil - Basic','Soil','Standard potting soil for general plant care',6.99,75,5),(3,'Ceramic Pot - Small','Pot','Small ceramic pot for tabletop plants',12.50,30,7),(4,'Ceramic Pot - Medium','Pot','Medium-sized ceramic pot for medium plants',15.99,25,7),(5,'Ceramic Pot - Large','Pot','Large ceramic pot for floor plants',19.99,20,7),(6,'Terracotta Pot - Small','Pot','Small terracotta pot for succulents',8.99,40,7),(7,'Terracotta Pot - Medium','Pot','Medium-sized terracotta pot for various plants',11.75,35,7),(8,'Terracotta Pot - Large','Pot','Large terracotta pot for outdoor plants',14.99,25,7),(9,'Moss Pole','Accessory','Support pole covered with moss for climbing plants',16.50,30,5),(10,'Glass Terrarium','Accessory','Glass container for creating a mini ecosystem',24.99,15,5),(11,'Decorative Stones','Accessory','Colorful stones for decorating plant containers',8.25,50,7),(12,'Plant Fertilizer - Liquid','Fertilizer','Liquid fertilizer for indoor and outdoor plants',12.99,20,5),(13,'Plant Fertilizer - Granules','Fertilizer','Granular fertilizer for slow-release nutrients',14.75,8,5),(14,'Plant Labels','Accessory','Set of labels for identifying different plants',5.50,60,7),(15,'Watering Can','Tool','Metal watering can for precise plant watering',18.25,22,5),(16,'Pruning Shears','Tool','Sharp shears for trimming and pruning plants',15.99,5,5),(17,'Humidity Tray','Accessory','Tray for increasing humidity around plants',11.50,30,7),(18,'Plant Mister','Tool','Handheld mister for misting water on plants',9.75,35,5),(19,'Plant Stand','Accessory','Decorative stand for elevating plants',22.99,15,7),(20,'Gardening Gloves','Tool','Protective gloves for handling plants and soil',7.99,45,5),(21,'LED Grow Light','Lighting','Artificial light source for promoting plant growth',29.50,8,7),(22,'Plant Hangers','Accessory','Macrame hangers for hanging plants',13.99,28,7),(23,'Insecticidal Soap','Pest Control','Natural soap solution for insect control',10.50,40,5),(24,'Neem Oil','Pest Control','Organic oil for pest prevention on plants',14.99,25,5),(25,'Plant Stand - Wooden','Accessory','Wooden stand for displaying multiple plants',19.75,7,7);
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `high_value_orders_view`
--

DROP TABLE IF EXISTS `high_value_orders_view`;
/*!50001 DROP VIEW IF EXISTS `high_value_orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_value_orders_view` AS SELECT 
 1 AS `OrderID`,
 1 AS `TotalAmount`,
 1 AS `FirstName`,
 1 AS `LastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `low_stock_view`
--

DROP TABLE IF EXISTS `low_stock_view`;
/*!50001 DROP VIEW IF EXISTS `low_stock_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `low_stock_view` AS SELECT 
 1 AS `ItemType`,
 1 AS `ItemID`,
 1 AS `ItemName`,
 1 AS `StockQuantity`,
 1 AS `VendorID`,
 1 AS `VendorName`,
 1 AS `VendorEmail`,
 1 AS `VendorPhone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_details_view`
--

DROP TABLE IF EXISTS `order_details_view`;
/*!50001 DROP VIEW IF EXISTS `order_details_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_details_view` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderDate`,
 1 AS `TotalAmount`,
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `ExtraName`,
 1 AS `ExtraPrice`,
 1 AS `ExtraQuantity`,
 1 AS `PlantName`,
 1 AS `PlantType`,
 1 AS `PlantPrice`,
 1 AS `PlantQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` date NOT NULL,
  `ShipDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,46,'2023-11-01','2023-11-05',50.50),(2,12,'2023-11-02','2023-11-07',75.25),(3,28,'2023-11-03','2023-11-09',25.00),(4,3,'2023-11-03','2023-11-09',60.75),(5,9,'2023-11-04','2023-11-09',30.00),(6,35,'2023-11-05','2023-11-10',120.90),(7,18,'2023-11-06','2023-11-10',95.60),(8,24,'2023-11-07','2023-11-10',60.75),(9,17,'2023-11-08','2023-11-12',150.25),(10,50,'2023-11-09','2023-11-12',75.00),(11,2,'2023-11-10','2023-11-15',20.50),(12,41,'2023-11-11','2023-11-15',80.25),(13,14,'2023-11-12','2023-11-15',20.00),(14,7,'2023-11-13','2023-11-15',35.75),(15,30,'2023-11-14','2023-11-17',70.20),(16,23,'2023-11-15','2023-11-17',75.50),(17,19,'2023-11-16','2023-11-25',30.00),(18,8,'2023-11-17','2023-11-23',80.75),(19,33,'2023-11-18','2023-11-23',90.90),(20,16,'2023-11-19','2023-11-25',95.60),(21,38,'2023-11-20','2023-11-25',120.75),(22,25,'2023-11-21','2023-11-28',50.25),(23,48,'2023-11-22','2023-11-28',175.00),(24,5,'2023-11-23','2023-12-02',120.50),(25,42,'2023-11-24','2023-12-02',40.25),(26,27,'2023-11-25','2023-12-02',200.00),(27,13,'2023-11-26','2023-12-05',85.75),(28,22,'2023-11-27','2023-12-05',30.20),(29,36,'2023-11-28','2023-12-05',75.50),(30,31,'2023-11-29','2023-12-05',20.00),(31,56,'2023-12-05',NULL,20.00),(32,7,'2023-12-05',NULL,130.00),(33,23,'2023-12-06',NULL,50.50),(34,3,'2023-12-06',NULL,30.00),(35,46,'2023-12-06',NULL,80.00),(36,60,'2023-12-07',NULL,90.00),(37,25,'2023-12-07',NULL,38.73);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pending_orders_view`
--

DROP TABLE IF EXISTS `pending_orders_view`;
/*!50001 DROP VIEW IF EXISTS `pending_orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pending_orders_view` AS SELECT 
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `FullAddress`,
 1 AS `OrderID`,
 1 AS `OrderDate`,
 1 AS `TotalAmount`,
 1 AS `PlantName`,
 1 AS `PlantQuantity`,
 1 AS `ExtraName`,
 1 AS `ExtraQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `plant_order`
--

DROP TABLE IF EXISTS `plant_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_order` (
  `OrderID` int DEFAULT NULL,
  `PlantID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `fk_plant_order_orders` (`OrderID`),
  KEY `fk_plant_order_plant_stock` (`PlantID`),
  CONSTRAINT `fk_plant_order_orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `fk_plant_order_plant_stock` FOREIGN KEY (`PlantID`) REFERENCES `plant_stock` (`PlantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_order`
--

LOCK TABLES `plant_order` WRITE;
/*!40000 ALTER TABLE `plant_order` DISABLE KEYS */;
INSERT INTO `plant_order` VALUES (1,25,2),(2,38,1),(3,12,3),(4,6,2),(5,18,4),(6,31,1),(7,2,2),(8,42,3),(9,12,2),(10,22,1),(11,16,4),(12,10,2),(13,36,1),(13,17,2),(14,74,1),(14,100,2),(15,67,3),(16,12,1),(17,86,2),(18,65,2),(19,23,4),(20,1,5),(21,6,2),(22,17,1),(22,57,1),(22,32,1),(23,55,2),(24,89,3),(25,65,2),(26,36,3),(27,10,1),(27,19,2),(28,96,2),(30,41,2),(30,3,1),(31,6,3),(31,78,1),(32,23,2),(33,48,1),(33,15,1),(34,18,2),(35,64,4),(36,9,1),(36,50,2),(37,88,1);
/*!40000 ALTER TABLE `plant_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_stock`
--

DROP TABLE IF EXISTS `plant_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_stock` (
  `PlantID` int NOT NULL AUTO_INCREMENT,
  `PlantName` varchar(100) NOT NULL,
  `PlantType` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockQuantity` int NOT NULL,
  `VendorID` int DEFAULT NULL,
  PRIMARY KEY (`PlantID`),
  KEY `fk_plant_stock_vendor` (`VendorID`),
  CONSTRAINT `fk_plant_stock_vendor` FOREIGN KEY (`VendorID`) REFERENCES `vendors` (`VendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_stock`
--

LOCK TABLES `plant_stock` WRITE;
/*!40000 ALTER TABLE `plant_stock` DISABLE KEYS */;
INSERT INTO `plant_stock` VALUES (1,'African Violet','Flowering Plant',12.99,5,8),(2,'Aloe Tiger Plant','Succulent',9.99,6,2),(3,'Angel\'s Wing','Foliage Plant',15.99,40,4),(4,'Ant Plant','Exotic Plant',18.50,25,5),(5,'Aralia Ming','Foliage Plant',14.75,35,4),(6,'Asparagus Fern','Fern',8.99,6,7),(7,'Australian Chestnut','Tree',22.50,20,3),(8,'Autograph Tree','Tree',19.99,15,3),(9,'Avocado Plant','Fruit Plant',25.99,10,6),(10,'Baby’s Tears','Ground Cover',6.99,75,7),(11,'Bamboo','Grass',17.50,50,7),(12,'Banana Plant','Fruit Plant',23.75,12,6),(13,'Begonia','Flowering Plant',11.25,9,8),(14,'Angel Wing Begonia','Flowering Plant',14.99,30,8),(15,'Begonia \'Exotica\'','Flowering Plant',13.50,35,8),(16,'Butterfly Begonia','Flowering Plant',16.25,25,8),(17,'Escargot Begonia','Flowering Plant',19.99,20,8),(18,'Eyelash Begonia','Flowering Plant',18.50,3,8),(19,'Lucerna\' Begonia','Flowering Plant',15.75,28,8),(20,'Polka Dot Begonia','Flowering Plant',17.99,26,8),(21,'Red Ruby Begonia','Flowering Plant',20.50,18,8),(22,'Bloodleaf','Foliage Plant',14.25,40,4),(23,'Blue Star Fern','Fern',9.50,55,7),(24,'Bonsai','Tree',25.99,15,3),(25,'Boston Fern','Fern',12.99,8,7),(26,'Brake Fern','Fern',11.50,35,7),(27,'Bright Star','Foliage Plant',16.75,25,4),(28,'Bromeliad','Flowering Plant',18.99,5,8),(29,'Buddha Belly Plant','Succulent',21.50,18,2),(30,'Burro’s Tail','Succulent',14.75,40,2),(31,'Bush Lily','Flowering Plant',19.99,20,8),(32,'Bush Senecio','Succulent',13.25,32,2),(33,'Calla Lily','Flowering Plant',15.50,28,8),(34,'Caricature Plant','Exotic Plant',22.75,15,5),(35,'Cast Iron','Foliage Plant',17.25,30,4),(36,'China Doll Plant','Foliage Plant',14.99,35,4),(37,'Chilli Plant','Vegetable Plant',8.50,65,6),(38,'Chinese Evergreen','Foliage Plant',16.99,25,4),(39,'Christmas Cactus','Cactus',12.50,45,5),(40,'Corkscrew Grass','Grass',9.99,50,7),(41,'Corpse Flower','Exotic Plant',25.50,10,5),(42,'Cranesbills','Flowering Plant',15.99,30,8),(43,'Creeping Fig','Foliage Plant',11.75,38,4),(44,'Crocodile fern','Fern',10.50,6,7),(45,'Crotons','Foliage Plant',18.25,22,4),(46,'Dragon Tree','Tree',21.99,18,3),(47,'Dumb Cane','Foliage Plant',14.50,35,4),(48,'Earth Star','Succulent',12.75,40,2),(49,'Easter Cactus','Cactus',16.99,26,5),(50,'Elephant Bush Plant','Succulent',13.25,32,2),(51,'Elephant\'s Foot Plant','Succulent',15.50,28,2),(52,'Elephant Ears','Foliage Plant',17.75,24,4),(53,'Fiddle Leaf Fig','Foliage Plant',25.99,15,4),(54,'Fire Flash','Succulent',19.50,20,2),(55,'Fishbone Cactus','Cactus',14.75,8,5),(56,'Flapjack Plant','Succulent',11.99,36,2),(57,'Forrest Cactus','Cactus',10.50,42,5),(58,'Jade Plant','Succulent',16.25,28,2),(59,'Jasmine','Flowering Plant',18.99,22,8),(60,'Jewel Orchids','Orchid',21.50,18,1),(61,'Money Tree','Foliage Plant',23.75,15,6),(62,'Monkey Mask','Foliage Plant',20.99,18,4),(63,'Monkey Tail Cactus','Cactus',17.25,24,5),(64,'Monstera Albo','Foliage Plant',25.99,2,4),(65,'Mother of Thousands','Succulent',12.50,35,2),(66,'Nerve Plant / Polka Dot Plant','Flowering Plant',15.99,30,8),(67,'Orchids','Orchid',18.50,9,1),(68,'Orchid Cacti','Cactus',16.75,26,5),(69,'Palms','Tree',20.50,20,3),(70,'Areca Palm','Tree',15.99,8,3),(71,'Cascade Palm','Tree',18.75,24,3),(72,'Chinese Fan Palm','Tree',22.99,8,3),(73,'Coconut Palm Tree','Tree',24.50,15,3),(74,'Hawaiian Palm','Tree',21.25,22,3),(75,'Kentia Palm','Tree',19.50,26,3),(76,'Majesty Palm','Tree',20.99,24,3),(77,'Parlor Palm','Tree',17.99,30,3),(78,'Ponytail Palm','Tree',16.75,35,3),(79,'Sago Palm','Tree',23.99,20,3),(80,'Parakeet Flower','Flowering Plant',18.25,22,8),(81,'Parrot Plant','Flowering Plant',20.50,18,8),(82,'Party Time Plant','Flowering Plant',21.99,15,8),(83,'Paperplant','Foliage Plant',17.50,28,4),(84,'Peace Lily','Flowering Plant',19.75,24,8),(85,'Peperomia','Foliage Plant',14.99,35,4),(86,'Baby Rubberplant','Foliage Plant',16.25,30,4),(87,'Beetle Peperomia','Foliage Plant',15.50,3,4),(88,'Rocca Verde','Foliage Plant',18.75,5,4),(89,'Rosso Peperomia','Foliage Plant',20.99,22,4),(90,'String of Turtles','Succulent',11.75,6,2),(91,'Watermelon Peperomia','Foliage Plant',13.99,36,4),(92,'Persian Shield','Foliage Plant',15.50,32,4),(93,'Persian Violet','Flowering Plant',17.25,28,6),(94,'String of Hearts','Succulent',12.99,5,1),(95,'String of Nickels','Succulent',14.50,30,1),(96,'String of Pearls','Succulent',16.75,25,1),(97,'Swedish Ivy','Foliage Plant',13.25,38,7),(98,'Swiss Cheese / Cheese Plant','Foliage Plant',18.99,22,7),(99,'Tea Plant','Foliage Plant',20.50,18,7),(100,'Tender Herbs','Herb Plant',10.99,50,4),(101,'Thai Constellation','Foliage Plant',23.75,2,7),(102,'Thanksgiving Cactus','Cactus',16.50,28,3),(103,'Yucca','Tree',22.99,18,2),(104,'Zebra Basket Vine','Foliage Plant',17.75,24,7),(105,'Zebra Plant','Succulent',15.99,30,1),(106,'ZZ Plant','Foliage Plant',21.50,20,7);
/*!40000 ALTER TABLE `plant_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `low_stock_alert_plant` AFTER UPDATE ON `plant_stock` FOR EACH ROW BEGIN
    IF NEW.StockQuantity < 10 THEN
        -- Log the alert to a separate table
        INSERT INTO low_stock_alerts_plant (PlantName, CurrentStock, AlertTimestamp)
        VALUES (NEW.PlantName, NEW.StockQuantity, CURRENT_TIMESTAMP);
        
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `revenue_extra_type_view`
--

DROP TABLE IF EXISTS `revenue_extra_type_view`;
/*!50001 DROP VIEW IF EXISTS `revenue_extra_type_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `revenue_extra_type_view` AS SELECT 
 1 AS `ItemType`,
 1 AS `TotalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `revenue_plant_type_view`
--

DROP TABLE IF EXISTS `revenue_plant_type_view`;
/*!50001 DROP VIEW IF EXISTS `revenue_plant_type_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `revenue_plant_type_view` AS SELECT 
 1 AS `PlantType`,
 1 AS `TotalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `VendorID` int NOT NULL AUTO_INCREMENT,
  `VendorName` varchar(100) NOT NULL,
  `ContactPersonFirstName` varchar(50) NOT NULL,
  `ContactPersonLastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Succulent Emporium','John','Young','john.young@succulentemporium.com','555-1234'),(2,'Tropigaz','Alice','Smithers','alice.smithers@tropigaz.com','555-5678'),(3,'Spiky Cacti','Robert','Johnson','robert.johnson@spikycacti.com','555-9876'),(4,'Beechwood Nursery','Emily','Williams','emily.williams@beechwoodnursery.com','555-4321'),(5,'Green Thumb Gardens','Michael','Anderson','michael.anderson@greenthumbgardens.com','555-1111'),(6,'Blooming Blossoms','Sophia','Martin','sophia.martin@bloomingblossoms.com','555-2222'),(7,'Natures Haven','William','Jones','william.jones@natureshaven.com','555-3333'),(8,'Sunshine Plants','Olivia','Davis','olivia.davis@sunshineplants.com','555-4444'),(9,'Leafy Dreams','James','Miller','james.miller@leafydreams.com','555-5555');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water_schedule`
--

DROP TABLE IF EXISTS `water_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `water_schedule` (
  `water_scheduleID` int NOT NULL AUTO_INCREMENT,
  `PlantID` int DEFAULT NULL,
  `WateringFrequency` varchar(50) NOT NULL,
  `LastWateredDate` date DEFAULT NULL,
  `NextWateringDate` date DEFAULT NULL,
  PRIMARY KEY (`water_scheduleID`),
  KEY `PlantID` (`PlantID`),
  CONSTRAINT `water_schedule_ibfk_1` FOREIGN KEY (`PlantID`) REFERENCES `plant_stock` (`PlantID`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water_schedule`
--

LOCK TABLES `water_schedule` WRITE;
/*!40000 ALTER TABLE `water_schedule` DISABLE KEYS */;
INSERT INTO `water_schedule` VALUES (1,28,'Every 8 weeks','2023-11-01','2023-12-27'),(2,35,'Every 8 weeks','2023-11-01','2023-12-27'),(3,38,'Every 8 weeks','2023-11-01','2023-12-27'),(4,44,'Every 8 weeks','2023-11-01','2023-12-27'),(5,48,'Every 8 weeks','2023-11-01','2023-12-27'),(6,63,'Every 8 weeks','2023-11-01','2023-12-27'),(7,2,'Every 4 weeks','2023-11-01','2023-11-29'),(8,8,'Every 4 weeks','2023-11-01','2023-11-29'),(9,18,'Every 4 weeks','2023-11-01','2023-11-29'),(10,20,'Every 4 weeks','2023-11-01','2023-11-29'),(11,26,'Every 4 weeks','2023-11-01','2023-11-29'),(12,29,'Every 4 weeks','2023-11-01','2023-11-29'),(13,30,'Every 4 weeks','2023-11-01','2023-11-29'),(14,32,'Every 4 weeks','2023-11-01','2023-11-29'),(15,33,'Every 4 weeks','2023-11-01','2023-11-29'),(16,39,'Every 4 weeks','2023-11-01','2023-11-29'),(17,40,'Every 4 weeks','2023-11-01','2023-11-29'),(18,41,'Every 4 weeks','2023-11-01','2023-11-29'),(19,47,'Every 4 weeks','2023-11-01','2023-11-29'),(20,49,'Every 4 weeks','2023-11-01','2023-11-29'),(21,50,'Every 4 weeks','2023-11-01','2023-11-29'),(22,55,'Every 4 weeks','2023-11-01','2023-11-29'),(23,56,'Every 4 weeks','2023-11-01','2023-11-29'),(24,57,'Every 4 weeks','2023-11-01','2023-11-29'),(25,58,'Every 4 weeks','2023-11-01','2023-11-29'),(26,61,'Every 4 weeks','2023-11-01','2023-11-29'),(27,68,'Every 4 weeks','2023-11-01','2023-11-29'),(28,90,'Every 4 weeks','2023-11-01','2023-11-29'),(29,94,'Every 4 weeks','2023-11-01','2023-11-29'),(30,96,'Every 4 weeks','2023-11-01','2023-11-29'),(31,102,'Every 4 weeks','2023-11-01','2023-11-29'),(32,6,'Every 3 weeks','2023-11-01','2023-11-22'),(33,7,'Every 3 weeks','2023-11-01','2023-11-22'),(34,12,'Every 3 weeks','2023-11-01','2023-11-22'),(35,13,'Every 3 weeks','2023-11-01','2023-11-22'),(36,19,'Every 3 weeks','2023-11-01','2023-11-22'),(37,23,'Every 3 weeks','2023-11-01','2023-11-22'),(38,25,'Every 3 weeks','2023-11-01','2023-11-22'),(39,37,'Every 3 weeks','2023-11-01','2023-11-22'),(40,42,'Every 3 weeks','2023-11-01','2023-11-22'),(41,43,'Every 3 weeks','2023-11-01','2023-11-22'),(42,46,'Every 3 weeks','2023-11-01','2023-11-22'),(43,51,'Every 3 weeks','2023-11-01','2023-11-22'),(44,53,'Every 3 weeks','2023-11-01','2023-11-22'),(45,59,'Every 3 weeks','2023-11-01','2023-11-22'),(46,69,'Every 3 weeks','2023-11-01','2023-11-22'),(47,70,'Every 3 weeks','2023-11-01','2023-11-22'),(48,71,'Every 3 weeks','2023-11-01','2023-11-22'),(49,72,'Every 3 weeks','2023-11-01','2023-11-22'),(50,73,'Every 3 weeks','2023-11-01','2023-11-22'),(51,74,'Every 3 weeks','2023-11-01','2023-11-22'),(52,75,'Every 3 weeks','2023-11-01','2023-11-22'),(53,76,'Every 3 weeks','2023-11-01','2023-11-22'),(54,77,'Every 3 weeks','2023-11-01','2023-11-22'),(55,78,'Every 3 weeks','2023-11-01','2023-11-22'),(56,79,'Every 3 weeks','2023-11-01','2023-11-22'),(57,95,'Every 3 weeks','2023-11-01','2023-11-22'),(58,103,'Every 3 weeks','2023-11-01','2023-11-22'),(59,1,'Every 2 weeks','2023-11-01','2023-11-15'),(60,3,'Every 2 weeks','2023-11-01','2023-11-15'),(61,4,'Every 2 weeks','2023-11-01','2023-11-15'),(62,5,'Every 2 weeks','2023-11-01','2023-11-15'),(63,9,'Every 2 weeks','2023-11-01','2023-11-15'),(64,10,'Every 2 weeks','2023-11-01','2023-11-15'),(65,11,'Every 2 weeks','2023-11-01','2023-11-15'),(66,14,'Every 2 weeks','2023-11-01','2023-11-15'),(67,15,'Every 2 weeks','2023-11-01','2023-11-15'),(68,16,'Every 2 weeks','2023-11-01','2023-11-15'),(69,17,'Every 2 weeks','2023-11-01','2023-11-15'),(70,21,'Every 2 weeks','2023-11-01','2023-11-15'),(71,22,'Every 2 weeks','2023-11-01','2023-11-15'),(72,24,'Every 2 weeks','2023-11-01','2023-11-15'),(73,27,'Every 2 weeks','2023-11-01','2023-11-15'),(74,31,'Every 2 weeks','2023-11-01','2023-11-15'),(75,34,'Every 2 weeks','2023-11-01','2023-11-15'),(76,36,'Every 2 weeks','2023-11-01','2023-11-15'),(77,45,'Every 2 weeks','2023-11-01','2023-11-15'),(78,52,'Every 2 weeks','2023-11-01','2023-11-15'),(79,54,'Every 2 weeks','2023-11-01','2023-11-15'),(80,60,'Every 2 weeks','2023-11-01','2023-11-15'),(81,62,'Every 2 weeks','2023-11-01','2023-11-15'),(82,64,'Every 2 weeks','2023-11-01','2023-11-15'),(83,65,'Every 2 weeks','2023-11-01','2023-11-15'),(84,66,'Every 2 weeks','2023-11-01','2023-11-15'),(85,67,'Every 2 weeks','2023-11-01','2023-11-15'),(86,80,'Every 2 weeks','2023-11-01','2023-11-15'),(87,81,'Every 2 weeks','2023-11-01','2023-11-15'),(88,82,'Every 2 weeks','2023-11-01','2023-11-15'),(89,83,'Every 2 weeks','2023-11-01','2023-11-15'),(90,84,'Every 2 weeks','2023-11-01','2023-11-15'),(91,85,'Every 2 weeks','2023-11-01','2023-11-15'),(92,86,'Every 2 weeks','2023-11-01','2023-11-15'),(93,87,'Every 2 weeks','2023-11-01','2023-11-15'),(94,88,'Every 2 weeks','2023-11-01','2023-11-15'),(95,89,'Every 2 weeks','2023-11-01','2023-11-15'),(96,91,'Every 2 weeks','2023-11-01','2023-11-15'),(97,92,'Every 2 weeks','2023-11-01','2023-11-15'),(98,93,'Every 2 weeks','2023-11-01','2023-11-15'),(99,97,'Every 2 weeks','2023-11-01','2023-11-15'),(100,98,'Every 2 weeks','2023-11-01','2023-11-15'),(101,99,'Every 2 weeks','2023-11-01','2023-11-15'),(102,100,'Every 2 weeks','2023-11-01','2023-11-15'),(103,101,'Every 2 weeks','2023-11-01','2023-11-15'),(104,104,'Every 2 weeks','2023-11-01','2023-11-15'),(105,105,'Every 2 weeks','2023-11-01','2023-11-15'),(106,106,'Every 2 weeks','2023-11-01','2023-11-15');
/*!40000 ALTER TABLE `water_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `watering_schedule_view`
--

DROP TABLE IF EXISTS `watering_schedule_view`;
/*!50001 DROP VIEW IF EXISTS `watering_schedule_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `watering_schedule_view` AS SELECT 
 1 AS `PlantID`,
 1 AS `PlantName`,
 1 AS `WateringFrequency`,
 1 AS `LastWateredDate`,
 1 AS `NextWateringDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'plants'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `update_watering_schedule_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_watering_schedule_event` ON SCHEDULE EVERY 1 DAY STARTS '2023-12-08 20:44:05' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE plantID, intervalWeeks INT;
    DECLARE cur CURSOR FOR
        SELECT PlantID, WateringFrequency
        FROM water_schedule
        WHERE NextWateringDate <= CURRENT_DATE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO plantID, intervalWeeks;

        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE water_schedule
        SET LastWateredDate = CURRENT_DATE,
            NextWateringDate = DATE_ADD(CURRENT_DATE, INTERVAL intervalWeeks WEEK)
        WHERE PlantID = plantID;
    END LOOP;

    CLOSE cur;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'plants'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_discounted_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_discounted_price`(order_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_amount DECIMAL(10, 2);

    -- Get the total amount for the order
    SELECT TotalAmount
    INTO total_amount
    FROM orders
    WHERE OrderID = order_id;

    -- Check if the order is eligible for a discount
    IF total_amount > 30 THEN
        -- Apply a 10% discount
        SET total_amount = total_amount * 0.9;
    END IF;

    -- Return the final discounted price
    RETURN total_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculate_order_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_order_total`(order_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE plant_total DECIMAL(10, 2);
    DECLARE item_total DECIMAL(10, 2);

    -- Calculate total for plants
    SELECT SUM(ps.Price * po.Quantity)
    INTO plant_total
    FROM plant_order po
    JOIN plant_stock ps ON po.PlantID = ps.PlantID
    WHERE po.OrderID = order_id;

    -- Calculate total for items
    SELECT SUM(e.Price * eo.Quantity)
    INTO item_total
    FROM extra_order eo
    JOIN extras e ON eo.ItemID = e.ItemID
    WHERE eo.OrderID = order_id;

    -- Return the total amount
    RETURN COALESCE(plant_total, 0) + COALESCE(item_total, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStockAfterOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStockAfterOrder`(IN orderID INT)
BEGIN
    -- Update plant_stock
    UPDATE plant_stock ps
    INNER JOIN plant_order po ON ps.PlantID = po.PlantID
    SET ps.StockQuantity = ps.StockQuantity - po.Quantity
    WHERE po.OrderID = orderID;

    -- Update extras
    UPDATE extras e
    INNER JOIN extra_order eo ON e.ItemID = eo.ItemID
    SET e.StockQuantity = e.StockQuantity - eo.Quantity
    WHERE eo.OrderID = orderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_view` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`o`.`OrderID` AS `OrderID`,`o`.`OrderDate` AS `OrderDate`,`o`.`TotalAmount` AS `TotalAmount` from (`customers` `c` join `orders` `o` on((`c`.`CustomerID` = `o`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `high_value_orders_view`
--

/*!50001 DROP VIEW IF EXISTS `high_value_orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_value_orders_view` AS select `o`.`OrderID` AS `OrderID`,`o`.`TotalAmount` AS `TotalAmount`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName` from (`orders` `o` join `customers` `c` on((`o`.`CustomerID` = `c`.`CustomerID`))) where (`o`.`TotalAmount` > 100) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `low_stock_view`
--

/*!50001 DROP VIEW IF EXISTS `low_stock_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low_stock_view` AS select 'Plant' AS `ItemType`,`ps`.`PlantID` AS `ItemID`,`ps`.`PlantName` AS `ItemName`,`ps`.`StockQuantity` AS `StockQuantity`,`v`.`VendorID` AS `VendorID`,`v`.`VendorName` AS `VendorName`,`v`.`Email` AS `VendorEmail`,`v`.`Phone` AS `VendorPhone` from (`plant_stock` `ps` join `vendors` `v` on((`ps`.`VendorID` = `v`.`VendorID`))) where (`ps`.`StockQuantity` < 10) union select 'Extra' AS `ItemType`,`e`.`ItemID` AS `ItemID`,`e`.`ItemName` AS `ItemName`,`e`.`StockQuantity` AS `StockQuantity`,`v`.`VendorID` AS `VendorID`,`v`.`VendorName` AS `VendorName`,`v`.`Email` AS `VendorEmail`,`v`.`Phone` AS `VendorPhone` from (`extras` `e` join `vendors` `v` on((`e`.`VendorID` = `v`.`VendorID`))) where (`e`.`StockQuantity` < 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_details_view`
--

/*!50001 DROP VIEW IF EXISTS `order_details_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_details_view` AS select `o`.`OrderID` AS `OrderID`,`o`.`OrderDate` AS `OrderDate`,`o`.`TotalAmount` AS `TotalAmount`,`c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`e`.`ItemName` AS `ExtraName`,`e`.`Price` AS `ExtraPrice`,`eo`.`Quantity` AS `ExtraQuantity`,`p`.`PlantName` AS `PlantName`,`p`.`PlantType` AS `PlantType`,`p`.`Price` AS `PlantPrice`,`po`.`Quantity` AS `PlantQuantity` from (((((`orders` `o` join `customers` `c` on((`o`.`CustomerID` = `c`.`CustomerID`))) left join `extra_order` `eo` on((`o`.`OrderID` = `eo`.`OrderID`))) left join `extras` `e` on((`eo`.`ItemID` = `e`.`ItemID`))) left join `plant_order` `po` on((`o`.`OrderID` = `po`.`OrderID`))) left join `plant_stock` `p` on((`po`.`PlantID` = `p`.`PlantID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pending_orders_view`
--

/*!50001 DROP VIEW IF EXISTS `pending_orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pending_orders_view` AS select `c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,concat(`ca`.`Street`,', ',`ca`.`City`,', ',`ca`.`Region`,', ',`ca`.`Postcode`,', ',`ca`.`Country`) AS `FullAddress`,`o`.`OrderID` AS `OrderID`,`o`.`OrderDate` AS `OrderDate`,`o`.`TotalAmount` AS `TotalAmount`,`ps`.`PlantName` AS `PlantName`,`po`.`Quantity` AS `PlantQuantity`,`e`.`ItemName` AS `ExtraName`,`eo`.`Quantity` AS `ExtraQuantity` from ((((((`customers` `c` join `customer_addresses` `ca` on((`c`.`CustomerID` = `ca`.`CustomerID`))) join `orders` `o` on((`c`.`CustomerID` = `o`.`CustomerID`))) left join `plant_order` `po` on((`o`.`OrderID` = `po`.`OrderID`))) left join `plant_stock` `ps` on((`po`.`PlantID` = `ps`.`PlantID`))) left join `extra_order` `eo` on((`o`.`OrderID` = `eo`.`OrderID`))) left join `extras` `e` on((`eo`.`ItemID` = `e`.`ItemID`))) where (`o`.`ShipDate` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `revenue_extra_type_view`
--

/*!50001 DROP VIEW IF EXISTS `revenue_extra_type_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `revenue_extra_type_view` AS select `e`.`ItemType` AS `ItemType`,sum((`e`.`Price` * `eo`.`Quantity`)) AS `TotalRevenue` from (`extras` `e` join `extra_order` `eo` on((`e`.`ItemID` = `eo`.`ItemID`))) group by `e`.`ItemType` order by `TotalRevenue` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `revenue_plant_type_view`
--

/*!50001 DROP VIEW IF EXISTS `revenue_plant_type_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `revenue_plant_type_view` AS select `p`.`PlantType` AS `PlantType`,sum((`p`.`Price` * `po`.`Quantity`)) AS `TotalRevenue` from (`plant_stock` `p` join `plant_order` `po` on((`p`.`PlantID` = `po`.`PlantID`))) group by `p`.`PlantType` order by `TotalRevenue` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `watering_schedule_view`
--

/*!50001 DROP VIEW IF EXISTS `watering_schedule_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `watering_schedule_view` AS select `ps`.`PlantID` AS `PlantID`,`ps`.`PlantName` AS `PlantName`,`ws`.`WateringFrequency` AS `WateringFrequency`,`ws`.`LastWateredDate` AS `LastWateredDate`,`ws`.`NextWateringDate` AS `NextWateringDate` from (`plant_stock` `ps` left join `water_schedule` `ws` on((`ps`.`PlantID` = `ws`.`PlantID`))) */;
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

-- Dump completed on 2023-12-09 19:52:27
