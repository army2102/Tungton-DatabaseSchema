-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: Tungton
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
  `product_price` decimal(13,4) NOT NULL,
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
INSERT INTO `product_in_stores` VALUES (14,1,100,10,15.0000),(17,1,100,10,7.0000),(18,1,220,10,20.0000),(19,1,30,5,80.0000),(20,1,100,10,40.0000),(21,1,100,10,40.0000),(22,1,100,10,40.0000),(23,1,100,10,40.0000);
/*!40000 ALTER TABLE `product_in_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_logs`
--

DROP TABLE IF EXISTS `product_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_logs` (
  `product_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_log_date` datetime NOT NULL,
  `product_log_quantity` int(11) NOT NULL,
  `product_log_cost` decimal(13,4) NOT NULL,
  `product_log_price` decimal(13,4) NOT NULL,
  PRIMARY KEY (`product_log_id`,`product_id`,`store_id`),
  KEY `fk_product_logs_stores1_idx` (`store_id`),
  KEY `fk_product_logs_products1_idx` (`product_id`),
  CONSTRAINT `fk_product_logs_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_logs_stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_logs`
--

LOCK TABLES `product_logs` WRITE;
/*!40000 ALTER TABLE `product_logs` DISABLE KEYS */;
INSERT INTO `product_logs` VALUES (1,18,1,'2018-03-26 20:30:11',100,10.0000,20.0000);
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
  `product_barcode` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_brand` varchar(100) NOT NULL,
  `product_manufacturer` varchar(100) DEFAULT NULL,
  `product_size` varchar(100) DEFAULT NULL,
  `product_status` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (14,'8851717020230','ดัชชี่โยเกิร์ดผสมสตอเบอรี่','ดัชชี่','บริษัท ดัชมิลล์จำกัด','80g.',1),(17,'8851959143711','น้ำทิพย์','น้ำทิพย์','the coca cola company','1.5 L.',1),(18,'8851952350161','คริสตัล','คริสตัล','โออิชิ เทรดดิ้ง จำกัด','600 มล.',1),(19,'8850886056125','Alum Milk','Maalox','OLIC Linited','240 ml',1),(20,'8857121172145','ถั่วลิสง กรอบแก้ว','เจ แอนด์เอ็น','หจก.เจแอนด์เอ็น 2012','140g',1),(21,'8850783000016','ถั่วลิสงอบกรอบ มารูโจ้','Marucho','หจก. เอ็ม.พี.เอส. เอนเตอร์ไฟรส์','17g',1),(22,'8852537011118','นํ้านมโค ยูเอชที รสจืด','ไทย-เดนมาร์ค','โรงงานผลิตภัณฑ์นมปราณบุรี','200 มล.',1),(23,'8850086130359','เครื่องดื่มมอลต์สกัดรสช็อคโกแลต','โอวัลติน','บริษัท เอบี ฟู้ด แอนด์ เบฟเวอร์เรจส์','31g',1),(24,'8851959158173','แฟนต้า สตรอเบอร์รี่','FANTA','the coca cola company','450ml.',1),(25,'123456789A','ลูกอมฮอลล์ผสมนํ้าผึ้ง','Puton','Puton Company','S',0),(26,'8851959158197','แฟนต้า น้ำองุ่น','FANTA','the coca cola company','450ml.',1),(27,'8851959158166','แฟนต้า น้ำส้ม','FANTA','the coca cola company','450ml.',1),(28,'8851959158180','แฟนต้า น้ำเขียว','FANTA','the coca cola company','450ml.',1),(29,'8851959158012','Coca-cola อัมพวา รสออริจินัล','Coca-Cola','Coca-Cola Company','450ml.',1),(30,'8851959158364','สไปรท์','Coca-Cola','Coca-Cola Company','450ml.',1),(31,'8850999220000','โซดาตราสิงห์','สิงห์','บริษัท สิงห์ คอร์เปอเรชั่น จำกัด','325ml',1),(32,'8850999321004','น้ำดื่มสิงห์','สิงห์','บริษัท วังน้อย เมอเรช จำกัด','600ml',1),(33,'8858998581016','pepsi','PepsiCola','บริษัท อิเตอร์ เนชั่นแนล รีเฟรชเม้นท์(ประเทศไทย) จำกัด','345ml.',1),(34,'8854698012713','โออิชิกรีนทีขาเขียวองุ่นเคียวโฮ','โออิชิกรีนที','บริษัท โออิชิ เทรดดิ้ง จำดัด','380ml.',1),(35,'8850999320007','น้ำดื่มสิงห์','สิงห์','บริษัท บุญรอดเอเชียเบเวอเรซ จำกัด','1.5 L.',1),(36,'8854698013628','จับใจ น้ำสมุนไพรจับเลี้ยง','จับใจ','โออิชิ เทรดดิ้ง','350ml.',1),(37,'8854698009737','โออิชิกรีนที ต้นตำรับ','โออิชิกรีนที','บริษัท โออิชิ เทรดดิ้ง','380ml.',1),(38,'8854698009669','โออิชิกรีนทีชาเขียวน้ำผึ้งมะนาว','โออิชิกรีนที','บริษัท โออิชิ เทรดดิ้ง จำดัด','380ml.',1),(39,'8854698009751','โออิชิกรีนทีชาเขียวข้าวญี่ปุ่น','โออิชิกรีนที','บริษัท โออิชิ เทรดดิ้ง จำดัด','380ml.',1),(40,'8850267900009','Soymilk นมถั่วเหลืองผสมงาดำ','Lactasoy','บริษัทแลคตาซอย จำกัด','125ml',1),(41,'8850267900009','Soymilk นมถั่วเหลืองผสมงาดำ','Lactasoy','บริษัทแลคตาซอย จำกัด','125ml',1),(42,'8850267112686','Soymilk นมถั่วเหลืองสตอเบอร์รี่','Lactasoy','บริษัทแลคตาซอย จำกัด','125ml',1),(43,'8852537011217','นมจืด THAI-DENMARK','THAI-DENMARK','โรงงานผลิตภัณฑ์นมปราณบุรี','250ml',1),(44,'8853002080066','ดีน่า นมถั่วเหลืองผสมงาดำ','ดีน่า','บริษัทแดรี่ พลัส จำกัด','180ml.',1),(45,'8853002301857','ดีน่า นมถั่วเหลืองผสมจมูกข้าวญี่ปุ่น','ดีน่า','บริษัทแดรี่ พลัส จำกัด','180ml.',1),(46,'8851717020148','ดัชชี่ โยเกิร์ตรสวุ้นมะพร้าว','ดัชชี่','บริษัทดัชมิลล์ จำกัด ','135g.',1),(47,'8851717600012','เคซีโอ นมเปรี้ยวรสส้ม','เคซีโอ','บริษัทดัชมิลล์ จำกัด ','160ml',1),(48,'8851717020667','ดัชชี่คิดส์โยเกิร์ตรสวุ้นมะพร้าว','ดัชชี่','บริษัทดัชมิลล์ จำกัด ','80g.',1),(49,'8851717904431','โยเกิร์ตรสบรูฮาวาย','ดัชชี่','บริษัทดัชมิลล์ จำกัด ','135g.',1),(50,'8851717030512','นมเปรี้ยวรสผลไม้รวม','ดัชมิลล์','บริษัทดัชมิลล์ จำกัด ','160ml',1),(51,'8851717901782','นมเปรียว ดีไลท์','ดัชมิลล์','บริษัทดัชมิลล์ จำกัด ','160ml',1),(52,'8851717906572','ดัชชี่ แมงโก้เชอร์เบต','ดัชชี่','บริษัท ดัชมิลล์ จำกัด','135g.',1),(53,'8852001100010','แบรนด์ ซุปไก่สกัด','แบรนด์','บริษัท แบรนด์ ซันโทรี่(ประเทศไทย)จำกัด','42ml.',1),(54,'8851717020230','ดัชชี่คิดส์ รสสตรอเบอร์รี่','ดัชชี่','บริษัท ดัชมิลล์ จำกัด','80g.',1),(55,'8851717901799','ดัชมิลล์ดีไลท์ นมเปรี้ยวสูตรน้ำตาลน้อย','ดัชมิลล์','บริษัท ดัชมิลล์ จำกัด','160ml.',1),(56,'8851717020155','ดัชชี่ โยเกริ์ตรสธัญญาหารถั่วและเม็ดบัว','ดัชชี่','บริษัท ดัชมิลล์ จำกัด','135g.',1),(57,'8851717020124','ดัชชี่ โยเกริ์ตรสผลไม้รวม','ดัชชี่','บริษัท ดัชมิลล์ จำกัด','135g.',1),(58,'8851952142278','100พลัส กลิ่นเบอร์รี่','100พลัส','บริษัท เสริมสุข จำกัด(มหาชน)','445ml.',1),(59,'8858786256270','ยาจุดกันยุง เรนเจอร์','เรนเจอร์','บริษัท จินเจียง จินธง มอสคิโต เร็พเพิลเลนท์ อินเซนส์ โปรดักส์ จำกัด','10ขด',1),(60,'8851727003254','คอนเน่ รสชีส','คอนเน่','บริษัท อาหารยอดคุณ จำกัด','56g.',1),(61,'8850002016804','น้ำยาปรับผ้านุ่ม Softener hiclass','Softener','บริษัท ไลอ้อน(ประเทศไทย)จำกัด','600ml.',1),(62,'8850999141008','Leo Lager beer','Leo','บริษัท ขอนแก่น บริวเวอรี่ จำกัด','620ซม.',1),(63,'8851993616011','Chang Classic Beer','Chang','Beer Thip Brewery','620ซม.',1),(64,'8850987101472','มาม่าคัพ รสหมูสับ','มาม่า','บริษัท ไทยเพรซิเดนท์ฟูดส์ จำกัด (มหาชน)','60g.',1),(65,'8850144207870','Knorr cupjok chicken','Knorr','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','35g.',1),(66,'8850100107060','ควิกแสบ รสต้มยำกุ้ง','ควิก','บริษัท โรงงานผลิตภัณฑ์อาหารไทย จำกัด','60g.',1),(67,'8850987101489','มาม่าคัพ รสต้มยำกุ้ง','มาม่า','บริษัท ไทยเพรซิเดนท์ฟูดส์ จำกัด (มหาชน)','60g.',1),(68,'8852388000613','Hongthong','Hongthong','โรงงานสุราบางยี่ขัน จังหวัดปทุมธานี','0.70 L.',1),(69,'8855155000700','ฺBlend285','285','Red Bull Distillery(1988)Co.,Ltd.','700ml.',1),(70,'8855155000212','สุรา40ดีกรี สุราขาว โรงงานสุรา รวงข้าว','รวงข้าว','บริษัท โรงงานสุรากระทิงแดง(1988)จำกัด','0.625L.',1),(71,'8852388000248','สุราผสม เสือดำ','เสือดำ','โรงงานสุรา','0.625L.',1),(72,'8852388000620','Hongthong สุราผสม','Hongthong','โรงงานสุราบางยี่ขัน จังหวัดปทุมธานี','0.350L.',1),(73,'8850128030111','Nescafe Redcup','Nescafe','บริษัท ควอลิตี้ คอฟฟี่ โปรดักส์ จำกัด','45g.',1),(74,'8850124075901','์Nestle CoffeeMate Original','Nestle','บริษัท เนสท์เล่ (ไทย) จำกัด','100g.',1),(75,'8850987101014','มาม่า รสหมูสับ','มาม่า','บริษัท ไทย เพรซิเดนท์ฟูดส์ จำกัด','60g.',1),(76,'8850987101021','มาม่า รสต้มยำกุ้ง','มาม่า','บริษัท ไทยเพรซิเดนท์ฟูดส์ จำกัด (มหาชน)','55g.',1),(77,'8852681010456','ข้าวโพดอบกรอบ ตรา นมแท่ง รสนม','นมแท่ง','บริษัท ไพบูลย์โปรดักส์ จำกัด','35g.',1),(78,'8852052110303','ฮานามิ รสดั้งเดิม','ฮานามิ','บริษัท สยามร่วมมิตร จำกัด','15g.',1),(79,'8850718801879','เลย์ รสโนริสาหร่าย','เลย์','บริษัท เป็ปซี่-โคล่า(ไทย)เทรดดิ้ง จำกัด','13g.',1),(80,'8850718801077','เลย์ รสเอ็กซ์ตร้าบาร์บีคิว','เลย์','บริษัท เป็ปซี่-โคล่า(ไทย)เทรดดิ้ง จำกัด','13g.',1),(81,'8850718811335','เลย์ กลิ่นชีสและเบคอน','เลย์','บริษัท เป็ปซี่-โคล่า(ไทย)เทรดดิ้ง จำกัด','13g.',1),(82,'8850820505306','ไดโนพาร์ค รสซีฟู้ด','ไดโนพาร์ค','บริษัท เอส.บี.ฟู้ด จำกัด','10g.',1),(83,'8850127044003','์Nestle Milo แบบซอง','Nestle','บริษัท เบญจพันธ์พงศ์ จำกัด','30g.',1),(84,'8850125077911','Nestle Bear Brand','Nestle','บริษัท โคแมค(ประเทศไทย) จำกัด','22.5 g.',1),(85,'8850124034519','Nescafe Blend&Brew ริช อโรม่า','Nescafe','บริษัท ควอลิตี้ คอฟฟี่ โปรดักส์ จำกัด','19.4 g.',1),(86,'8850124012869','Nescafe Blend&Brew เอสเปรสโซ โรสต์','Nescafe','บริษัท ควอลิตี้ คอฟฟี่ โปรดักส์ จำกัด','17.5 g.',1),(87,'95012223','camel hand rolling tobacco','camel','บริษัท เจที อินเตอร์เนชั่นแนล(ไทยแลนด์) จำกัด','12.5 g. of fine cut tobacco, 50cigarette papers, 30cigarrette fiters',1),(88,'95012186','compact winston ซองเขียว','winston','','',1),(89,'8850170000803','SMS ซองเขียว','SMS','โรงงานยาสูบ','18.4 g.',1),(90,'8850170000476','Wonder ซองแดง','Wonder','โรงงานยาสูบ','18.4 g.',1),(91,'8850170000797','SMS ซองแดง','SMS','โรงงานยาสูบ','18.4 g.',1),(92,'95509747','L&M ซองเขียว','L&M','','',1),(93,'8992772051026','ซอฟเฟล โลชั่นทากันยุง กลินฟลอร้า','ซอฟเฟล',' บริษัท พีพี เฮอลิน่า อินดาฮ์ จำกัด','8ml.',1),(94,'8850389300084','เพรียว คอฟฟี่','เพรียว','บริษัท เซปเป้ จำกัด(มหาชน)','12 g.',1),(95,'8851613106106','อร่อยดี หัวกะทิ ','อร่อยดี','บริษัท ไทย อกริ ฟู้ดส์ จำกัด','150ml.',1),(96,'8850367100019','ชาวเกาะ กะทิ','ชาวเกาะ','บริษัท อำพลฟู้ดส์ โพรเซสซิ่ง จำกัด','250ml.',1),(97,'8850035000214','นกพิราบ ผักกาดดองเค็ม','นกพิราบ','บริษัท สันติภาพ(ฮั้วเพ้ง 1958)จำกัด','140g.',1),(98,'8852021707084','Sealect tuna steak','Sealect','บริษัท ไทยรวมสินพัฒนาอุตสาหกรรม จำกัด','61g.',1),(99,'8850153563059','สามแม่ครัว ปลากระป๋อง','สามแม่ครัว','บริษัท รอแยลฟู้ดส์ เวียดนาม จำกัด','155g.',1),(100,'8858705601167','Teapot ','Teapot','บริษัท เอฟแอนด์เอ็น แครี่ส์(ประเทศไทย)จำกัด','380g.',1),(101,'8852021702218','ซีเล็ค ทูน่าแซนวิชในน้ำแร่','ซีเล็ค','บริษัท ไทยรวมสินพัฒนาอุตสาหกรรม จำกัด','185g.',1),(102,'8850525131831','ลำใยในน้ำเชื่อม TK','TK','บริษัท ไทย เอ.ดี.ฟู้ดส์ จำกัด','400g.',1),(103,'8850579008608','แห้วในน้ำเชื่อม สปอร์ตเวย์','สปอร์ตเวย์','บริษัท โรงงานสโนว์เฮาส์โปรดักส์ จำกัด','565g.',1),(104,'8853333000597','Malee ฟรุตคอกเทลสูตรผสมลูกตาลในน้ำเชื่อม','Malee','หจก.โรงงานอาหารกระป๋องไทยฟ้า','565g.',1),(105,'8850456100326','วังขนาย น้ำตาลทรายขาว','วังขนาย','บริษัท อุตสาหกรรมน้ำตาลที.เอ็น.จำกัด','1กิโลกรัม',1),(106,'8850456101507','วังขนาย น้ำตาลออร์แกนิค','วังขนาย','กลุ่มวังขนาย','1กิโลกรัม',1),(107,'8850250001720','รสดี หมู','รสดี','บริษัท อายิโนะโมะโต๊ะ(ประเทศไทย)จำกัด','75g.',1),(108,'8850144059097','คนอร์ ต้มยำก้อน','คนอร์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','2ก้อน',1),(109,'8850250001713','รสดี ไก่','รสดี','บริษัท อายิโนะโมะโต๊ะ(ประเทศไทย)จำกัด','75g.',1),(110,'8850372000090','ต้นสน วุ้นเส้น','ต้นสน','บริษัท สิทธินันท์ จำกัด','40g.',1),(111,'8853237000136','กุ้งไทย กะปิ','กุ้งไทย','บริษัท พี.เพาเวอร์ โพรดักท์ จำกัด','90g.',1),(112,'8858893904149','tesco แต่งรสอาหาร รสหมู','tesco','บริษัท จิมสกรุ๊ป จำกัด','75g.',1),(113,'8850144208310','คนอร์ แกงส้ม','คนอร์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','45g.',1),(114,'8850250009375','รสดี ต้มข่า','รสดี','บริษัท อายิโนะโมะโต๊ะ(ประเทศไทย)จำกัด','50g.',1),(115,'8850250001669','อายิโนะโมะโต๊ะ ถ้วยแดง','ถ้วยแดง','บริษัท อายิโนะโมะโต๊ะ(ประเทศไทย)จำกัด','85g.',1),(116,'8851685000816','ไร่ทิพย์ ธัญพืช','ไร่ทิพย์','บริษัท ไร่ธัญญะ จำกัด','100g.',1),(117,'8850144208334','คนอร์ แกงเขียวหวาน','คนอร์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','35g.',1),(118,'8850002852099','Essence ironing star กลิ่น floral','Essence','Lion','600ml.',1),(119,'8851989060385','D-nee pure Head&Body สบู่เหลว','Head&Body','บริษัท ไบโอ แมนูเฟคเจอริ่ง จำกัด','380ml.',1),(120,'8850002012172','Softener hiclass','Softener','บริษัท ไลอ้อน(ประเทศไทย)จำกัด','600ml.',1),(121,'8850002852136','Essence ironing star กลิ่น impression','Essence','บริษัท ไลอ้อน(ประเทศไทย)จำกัด','600ml.',1),(122,'8851932378031','บรีส เอกเซล คอมฟอร์ท','บรีส','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','30ml.',1),(123,'8851818860704','มาจิคลีน พื้น','มาจิคลีน','บริษัท คาโอ คอมเมอร์เชียล(ประเทศไทย)จำกัด','800ml.',1),(124,'8850092222512','Hygiene pink blossom','Hygiene','บริษัท ไอ.พี.แมนูเฟคเจอริ่ง จำกัด','550ml.',1),(125,'8851989030692','fineline choming violet','fineline','บริษัท นีโอ แฟคทอรี่ จำกัด','400ml.',1),(126,'8850002026971','look ทำความสะอาดห้องน้ำ','look','บริษัท นวศรี แมนูแฟคเจอริ่ง จำกัด','400ml.',1),(127,'8852524010940','น้ำยาล้างจาน Dish happy','dish happy','บริษัท ชาล์วอง(ประเทศไทย)จำกัด','550ml.',1),(128,'8850002026995','look ทำความสะอาดครัว','look','บริษัท นวศรี แมนูแฟคเจอริ่ง จำกัด','400ml.',1),(129,'8851111150014','Sofy airfit','Sofy','บริษัท ยูนิ-ชาร์ม(ประเทศไทย)จำกัด','10ชิ้น',1),(130,'8851818191778','Laurier Soft&Safe','Laurier','บริษัท คาโอ คอมเมอร์เชียล(ประเทศไทย)จำกัด','4ชิ้น',1),(131,'8851818613300','haiter','haiter','บริษัท คาโอ อินดัสเตรียล(ประเทศไทย)จำกัด','600ml.',1),(132,'8850092202095','ไฮยีน ซักผ้าขาว','ไฮยีน','บริษัท ไอ.พี.แมนูเฟคเจอริ่ง จำกัด','600ml.',1),(133,'8851932346447','โอโมพลัส parris perfume','โอโม','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','750ml.',1),(134,'8859262300333','Betadine natural','Betadine','บริษัท โบลอตต์ แลบบอราทอรีส์ จำกัด','200ml.',1),(135,'8851123347983','ฺBabi mild Natural\'N Mild','Babi Mild','บริษัท โอสถสภา จำกัด','600ml.',1),(136,'8850002025264','เปา ซิลเวอร์นาโน ซอฟท์','เปา','บริษัท ไอลิอ้อน (ประเทศไทย)จำกัด','80g.',1),(137,'8851932230322','บรีส เอกเซล สูตรเข้มข้น','บรีส','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','1200g.',1),(138,'8850002017436','เปา วินวอช','เปา','บริษัท ไลอ้อน(ประเทศไทย)จำกัด','1700g.',1),(139,'4903430655736','ดาวน์นี่สวนดอกไม้ผลิ','ดาวน์นี่','บริษัท พลอคเตอร์ แอนด์ แกนเบิล เทรดดิ้ง (ประเทศไทย)จำกัด','22ml.',1),(140,'8850006322512','คอลเกต เกลือ','คอลเกต','บริษัท คอลเกต-ปาล์มโอลีฟ(ประเทศไทย)จำกัด','35ครั้ง',1),(141,'8850228000106','กระทิงแดง','กระทิงแดง','บริษัท ที.ซี. ฟาร์มาซูติคอล จำกัด','150ml.',1),(142,'8858736 911198','เพ็ญภาค ยาบำรุงร่างกาย','พญานาค','บริษัท ขายยาเพ็ญภาค จำกัด','150gg.',1),(143,'8852314004999','GSD GINSENSENG Drink','โสมเกาหลี ตังกุยจับ','บริษัท เจริญสุขเภสัช จำกัด','100ml.',1),(144,'8851123211024','ลิโพวิตัน-ดี','lipovivtan-D','บริษัท โอสถสภา จำกัด','100ml.',1),(145,'8850228000403','Sponsor Original','Sponsor','บริษัท ที.ซี. ฟาร์มาซูติคอล จำกัด','250ml.',1),(146,'8851123212021','M-150','M-150','บริษัท โอสถสภา จำกัด','150ซม.^3',1),(147,'8855790000011','คาราบาว แดง','คาราบาว แดง','บริษัท คาราบาวตะวันแดง จำกัด','150ซม.^3',1),(148,'8850250000365','เบอร์ดี้ โรบัสต้า','เบอร์ดี้','บริษัท อายิโนะโมะโต๊ะ(ประเทศไทย)จำกัด','180cc.',1),(149,'8851012103706','Nescafe Espresso Roast','Nescafe','บริษัท ควอลิตี้ คอฟฟี่ โปรดักส์ จำกัด','180ml.',1),(150,'8850124025258','Nescafe Latte','Nescafe','บริษัท ควอลิตี้ คอฟฟี่ โปรดักส์ จำกัด','180ml.',1),(151,'8850952501245','Deedo น้ำส้ม','Deedo','บริษัท ฟู้ดสตาร์ จำกัด','450ml.',1),(152,'8858998585045','ลิปตัน เลมอน','ลิปตัน','บริษัท อินเตอร์เนชั่ลแนล รีเฟรชเม้นท์','300ml.',1),(153,'8850624719107','กาโตะ วุ้นเยลลี่เชค กลิ่นบลูเบอร์รี่','กาโตะ','บริษัท เบอร์รี่ ยุคเกอร์ จำกัด(มหาชน)','230g.',1),(154,'8859008200095','ชาดำเย็นโบราณ อัมพวา','j&j อัมพวา','บริษัท เจ แอนด์ เจ อิน ฮาร์ท ไฟว์ กรุ๊ป','',1),(155,'8851028140047','ไวตามิ้ลค์ ออริจินัล','ไวตามิ้ลค์','บริษัท กรีนสปอต จำกัด','300ซม^3.',1),(156,'8858998582341','มิรินด้า มิกซ์-อิท ลิ้นจี่สตรอเบอร์รี่','มิรินด้า','บริษัท อินเตอร์เนชั่ลแนล รีเฟรชเม้นท์','300ml.',1),(157,'8858998582389','มิรินด้า มิกซ์-อิท แอปเปิ้ล กีวี','มิรินด้า','บริษัท อินเตอร์เนชั่ลแนล รีเฟรชเม้นท์ ','300ml.',1),(158,'8851952350147','Crystal','Crystal','บริษัท เสริมสุข จำกัด(มหาชน)','1.5 L.',1),(159,'8851993623019','Chang lager beer','Chang','Beer thai','320ml.',1),(160,'8850999143002','Leo Lager beer','Leo','บริษัท สิงห์ เบเวอเรช จำกัด','320ml.',1),(161,'8850999172026','Singha light','Singha','บริษัท ปทุมธานีบริวเวอรี่ จำกัด','630ml.',1),(162,'8858998581313','Pepsi Cola','Pepsi Cola','บริษัท อินเตอร์เนชั่ลแนล รีเฟรชเม้นท์','1.5 L.',1),(163,'8851959144015','Coca Cola','Coca Cola','บริษัท ไทยน้ำทิพย์ แมนูแฟคเจอริ่ง จำกัด','125 L.',1),(164,'8851959144176','แฟนต้า สตรอเบอร์รี่','แฟนต้า','บริษัท ไทยน้ำทิพย์ แมนูแฟคเจอริ่ง จำกัด','125 L.',1),(165,'8851959144183','Fanta น้ำเขียว','Fanta','บริษัท ไทยน้ำทิพย์ แมนูแฟคเจอริ่ง จำกัด','125 L.',1),(166,'8851952141271','100พลัส กลิ่นเลม่อน','100พลัส','บริษัท เสริมสุข จำกัด(มหาชน)','445ml.',1),(167,'8851932364942','Cornetto โอวัลติน','Cornetto','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','',1),(168,'8851932350938','Cornetto choco berry','Cornetto','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','',1),(169,'8851932028103','Cornetto vanilla','Cornetto','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','',1),(170,'8851932065405','วอลล์ เอเชียน ดีไลท์ กะทิ ลอดช่อง','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','54g.',1),(171,'8851932268820','วอลล์ แพดเดิ้ลป็อบ แตงโม','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','58ml.',1),(172,'8851932143974','วอลล์ แพดเดิ้ลป็อบ ช็อก ลาวา','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','58g.',1),(173,'8999999507442','วอลล์ แพดเดิ้ลป็อบ ทวิสเตอร์','วอลล์','บริษัท พีที ยูนิลีเวอร์ อินโดนีเซีย ทีบีเค ประเทศอินโดนีเซีย','54g.',1),(174,'8851932316347','วอลล์ แพดเดิ้ลป็อบ big rocket jelly','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','54g.',1),(175,'8851932031752','วอลล์ แพดเดิ้ลป็อบ Rain bow','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','54g.',1),(176,'8851932367141','วอลล์ แพดเดิ้ลป็อบ octopus','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','54g.',1),(177,'8851932346245','โอวัลติน ไอศครีมหวานเย็น','โอวัลติน','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','45g.',1),(178,'8851932080149','วอลล์ ท๊อปเทน วานิลลา','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','',1),(179,'851932074025','วอลล์ วานิลลา','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','51g.',1),(180,'8851932200158','วอลล์ แพดเดิ้ลป็อบ Shot fruity power','วอลล์','บริษัท ยูนิลีเวอร์ ไทย โฮลดิ้งส์ จำกัด','',1),(181,'8850154000027','น้ำมัน มรกต','มรกต','บริษัท มรกต อินดัสตริ้ส์ จำกัด','250ml.',1),(182,'8850154000034','น้ำมัน มรกต','มรกต','บริษัท มรกต อินดัสตริ้ส์ จำกัด','500ml.',1),(183,'8850154000041','น้ำมัน มรกต','มรกต','บริษัท มรกต อินดัสตริ้ส์ จำกัด','1L.',1),(184,'8858893913608','Tesco น้ำมันปาล์ม','Tesco','บริษัท ล่ำสูง(ประเทศไทย)จำกัด(มหาชน)','1L.',1),(185,'8850206011025','ซีอิ๊วขาวสูตร1 เด็กสมบูรณ์','เด็กสมบูรณ์','บริษัท หยั่น หว่อ หยุ่น จำกัด','700ml.',1),(186,'8850124065421','แม็กกี้ ซอส ปรุงอาหาร','แม็กกี้','บริษัท คิวพี(ประเทศไทย)จำกัด','680ml.',1),(187,'8850206011124','ซีอิ๊วขาวสูตร1 เด็กสมบูรณ์','เด็กสมบูรณ์','บริษัท หยั่น หว่อ หยุ่น จำกัด','300ml.',1),(188,'8850124065407','แม็กกี้ ซอส ปรุงอาหาร','แม็กกี้','บริษัท คิวพี(ประเทศไทย)จำกัด','100ml.',1),(189,'8850124065414','แม็กกี้ ซอส ปรุงอาหาร','แม็กกี้','บริษัท คิวพี(ประเทศไทย)จำกัด','',1),(190,'8858843201366','ซอสเปรี้ยว อันดามัน','อันดามัน','บริษัท ไทยรสทิพย์ จำกัด','',1),(191,'8850206160129','เต้าเจี้ยวสูตร1 เด็กสมบูรณ์','เด็กสมบูรณ์','บริษัท หยั่น หว่อ หยุ่น จำกัด','350g.',1),(192,'8936017367473','หยดทอง น้ำปลาแท้','หยดทอง','บริษัท มาซานอินดัสทรีควีนแบมเบอร์ จำกัด','650ml.',1),(193,'8850545888661','น้ำปลาแท้ ทิพย์รส','ทิพย์รส','ไพโรจน์(ทั่งซังฮะ)จำกัด','',1),(194,'8851954103116','ซอสพริก ภูเขาทอง','ภูเขาทอง','บริษัท ไทยเทพรส จำกัด(มหาชน)','230g.',1),(195,'8853704000010','ซอสพริก ม้าบิน','ม้าบิน','บริษัท ซอสพริกไทยรุ่งเรือง จำกัด','640g.',1),(196,'8850511321284','ซอสพริกศรีราชา ไฮคิว','ไฮคิว','บริษัท ไฮคิวผลิตภัณฑ์อาหาร จำกัด','',1),(197,'8850343000166','ไฮนซ์ ซอสมะเขือเทศ','ไฮนซ์','บริษัท วินเซนซ์ ฟู้ดส์ จำกัด','300g.',1),(198,'8850343000012','็ไฮนซ์ ซอสพริก','ไฮนซ์ ','บริษัท วินเซนซ์ ฟู้ดส์ จำกัด','',1),(199,'8850522321147','โรซ่า ซอสมะเขือ','โรซ่า','บริษัท ไฮคิวผลิตภัณฑ์อาหาร จำกัด','',1),(200,'8850545777712','น้ำส้มสายชู ทิพรส','ทิพรส','บริษัท ไพโรจน์(ทั่งซังฮะ)จำกัด','700ml.',1),(201,'8850058003346','พันท้าย น้ำจิ้มสุกี้ สูตรกวางตุ้ง ','พันท้าย','บริษัท อุตสาหกรรมพันท้ายนรสิงห์สินค้าพื้นเมือง จำกัด','330g.',1),(202,'8850206113101','น้ำจิ้มซีฟู้ดส์ เด็กสมบูรณ์','เด็กสมบูรณ์','บริษัท หยั่น หว่อ หยุ่น จำกัด','',1),(203,'8851954196279','ภูเขาทอง ซอสปรุงรสอาหาร','ภูเขาทอง','บริษัท ไทยเทพรส จำกัด(มหาชน)','',1),(204,'8850114402007','น้ำปลาแท้ คนแบกกุ้ง','คนแบกกุ้ง','บริษัท อุตสาหกรรมน้ำปลาระยอง จำกัด','',1),(205,'8850357000107','ธัญพืช มาบุญครอง','มาบุญครอง','บริษัท ปทุมไรชมิล แอนด์ แกรนารี จำกัด','',1),(206,'8858868801107','ข้าวตราฉัตร','ฉัตร','บริษัท ข้าว ซี.พี. จำกัด','1gg.',1),(207,'8858192000016','ข้าวหอมมะลิ ส.เขมราฐ','ส.เขมราฐ','บริษัท เอสเค.กรีน อโกร โปรดักส์ จำกัด','',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_product_details`
--

DROP TABLE IF EXISTS `receipt_product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_product_details` (
  `receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `receipt_product_sale_quantity` int(11) NOT NULL,
  `receipt_product_sale_price` decimal(13,4) NOT NULL,
  `receipt_product_total_price` decimal(13,4) NOT NULL,
  PRIMARY KEY (`receipt_id`,`product_id`),
  KEY `fk_Products_has_Receipts_Receipts1_idx` (`receipt_id`),
  KEY `fk_Products_has_Receipts_Products1_idx` (`product_id`),
  CONSTRAINT `fk_Products_has_Receipts_Products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Receipts_Receipts1` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_product_details`
--

LOCK TABLES `receipt_product_details` WRITE;
/*!40000 ALTER TABLE `receipt_product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_product_details` ENABLE KEYS */;
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
  `receipt_total_price` decimal(13,4) NOT NULL,
  `customer_money_paid` decimal(13,4) NOT NULL,
  `receipt_money_change` decimal(13,4) NOT NULL,
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
  `store_postal_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Adminshop','31/505 ซอย 41 หมู่บ้านสินธานีแกรนด์วิลล์','รังสิต','ธัญบุรี','ปทุมธานี','12110');
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
INSERT INTO `user_in_stores` VALUES (1,1,1);
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
  `name` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `phonenumber` varchar(10) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'เนติรัฐ ส่งสมบูรณ์','1995-10-01',1,'0883033924','test1@gmail.com','test');
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

-- Dump completed on 2018-04-09 21:34:18
