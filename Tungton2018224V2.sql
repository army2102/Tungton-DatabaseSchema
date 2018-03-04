CREATE DATABASE  IF NOT EXISTS `tungton` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tungton`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tungton
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attributes` (
  `product_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_brand` varchar(100) DEFAULT NULL,
  `product_manufacturer` varchar(100) DEFAULT NULL,
  `product_size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_attribute_id`,`product_id`),
  KEY `fk_Product_attributes_Products1_idx` (`product_id`),
  CONSTRAINT `fk_Product_attributes_Products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in_stores`
--

DROP TABLE IF EXISTS `product_in_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_in_stores` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_minimum_quantity` int(11) DEFAULT NULL,
  `product_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `fk_Products_has_Stores_Stores1_idx` (`store_id`),
  KEY `fk_Products_has_Stores_Products1_idx` (`product_id`),
  CONSTRAINT `fk_Products_has_Stores_Products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Stores_Stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_stores`
--

LOCK TABLES `product_in_stores` WRITE;
/*!40000 ALTER TABLE `product_in_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_in_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_logs`
--

DROP TABLE IF EXISTS `product_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_logs` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_log_date` datetime NOT NULL,
  `product_log_quantity` int(11) NOT NULL,
  `product_log_cost` int(11) NOT NULL,
  `product_log_price` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  CONSTRAINT `fk_Product_logs_Product_in_stores1` FOREIGN KEY (`product_id`, `store_id`) REFERENCES `product_in_stores` (`store_id`, `product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_logs`
--

LOCK TABLES `product_logs` WRITE;
/*!40000 ALTER TABLE `product_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_barcode` varchar(100) NOT NULL,
  `product_status` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_has_receipts`
--

DROP TABLE IF EXISTS `products_has_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_has_receipts` (
  `receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `receipt_product_sale_quantity` int(11) NOT NULL,
  `receipt_product_sale_price` decimal(10,0) NOT NULL,
  `receipt_product_total_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`receipt_id`,`product_id`),
  KEY `fk_Products_has_Receipts_Receipts1_idx` (`receipt_id`),
  KEY `fk_Products_has_Receipts_Products1_idx` (`product_id`),
  CONSTRAINT `fk_Products_has_Receipts_Products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Receipts_Receipts1` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_has_receipts`
--

LOCK TABLES `products_has_receipts` WRITE;
/*!40000 ALTER TABLE `products_has_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_has_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipts` (
  `receipt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `receipt_date` datetime NOT NULL,
  `receipt_total_price` decimal(10,0) NOT NULL,
  `customer_money_paid` decimal(10,0) NOT NULL,
  `receipt_money_change` decimal(10,0) NOT NULL,
  PRIMARY KEY (`receipt_id`,`store_id`,`user_id`),
  KEY `fk_Receipts_Stores1_idx` (`store_id`),
  KEY `fk_Receipts_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Receipts_Stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Receipts_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) NOT NULL,
  `store_address` varchar(100) DEFAULT NULL,
  `store_sub_district` varchar(100) DEFAULT NULL,
  `store_district` varchar(100) DEFAULT NULL,
  `store_province` varchar(100) DEFAULT NULL,
  `store_postalcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `store_name_UNIQUE` (`store_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_in_stores`
--

DROP TABLE IF EXISTS `user_in_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_in_stores` (
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`store_id`),
  KEY `fk_Users_has_Stores_Stores1_idx` (`store_id`),
  KEY `fk_Users_has_Stores_Users_idx` (`user_id`),
  CONSTRAINT `fk_Users_has_Stores_Stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Stores_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_in_stores`
--

LOCK TABLES `user_in_stores` WRITE;
/*!40000 ALTER TABLE `user_in_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_in_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,'test@gmail.com','12345678',NULL,NULL),(5,NULL,NULL,'test2@gmail.com','12345678',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-24 17:51:35
