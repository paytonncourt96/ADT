-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vendorinvoicemgmt
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `employeemaster`
--

DROP TABLE IF EXISTS `employeemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeemaster` (
  `employee_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `departmentName` varchar(45) DEFAULT NULL,
  `reportingManager` varchar(45) DEFAULT NULL,
  `approvalLimit_min` float DEFAULT NULL,
  `approvalLimit_max` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeemaster`
--

LOCK TABLES `employeemaster` WRITE;
/*!40000 ALTER TABLE `employeemaster` DISABLE KEYS */;
INSERT INTO `employeemaster` VALUES (1000000001,'Tom','Moffa','Account Manager','Accounts Payable',' ',250000,500000),(1000000002,'Eric','Crockett','A/P Processor','Accounts Payable','1000000001',200000,249999),(1000000003,'Jim','Morgan','A/P Processor','Accounts Payable','1000000001',150000,199999),(1000000004,'Courtney','Payton','A/P Processor','Accounts Payable','1000000001',100000,149999),(1000000005,'Yashada','Nikam','A/P Processor','Accounts Payable','1000000001',50000,99999),(1000000006,'Ramana','Chowdam','A/P Processor','Accounts Payable','1000000001',1,49999);
/*!40000 ALTER TABLE `employeemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialmaster`
--

DROP TABLE IF EXISTS `materialmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialmaster` (
  `material_num` bigint(20) DEFAULT NULL,
  `Material_desc` varchar(45) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialmaster`
--

LOCK TABLES `materialmaster` WRITE;
/*!40000 ALTER TABLE `materialmaster` DISABLE KEYS */;
INSERT INTO `materialmaster` VALUES (3000000001,'Bearings',2000000003),(3000000002,'M100-Machine1',2000000002),(3000000003,'M101-Machine1',2000000002),(3000000004,'M102-Machine1',2000000002),(3000000005,'M103-Machine1',2000000002),(3000000006,'Auto Part1',2000000001),(3000000007,'Auto Part2',2000000001),(3000000008,'Auto Part3',2000000001),(3000000009,'Auto Part4',2000000001),(3000000010,'Auto Part5',2000000001),(3000000011,'Security camera',2000000004),(3000000012,'Security software',2000000004),(3000000013,'Security remote',2000000004),(3000000014,'Construction tool kit',2000000005),(3000000015,'Dewalt toolkit',2000000005),(3000000016,'CDIY Grass tools',2000000005),(3000000017,'Construction equip',2000000005);
/*!40000 ALTER TABLE `materialmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorinvoicehdr`
--

DROP TABLE IF EXISTS `vendorinvoicehdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorinvoicehdr` (
  `invoice_num` bigint(20) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `companycode` bigint(20) DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `NetPrice` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `totalprice` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorinvoicehdr`
--

LOCK TABLES `vendorinvoicehdr` WRITE;
/*!40000 ALTER TABLE `vendorinvoicehdr` DISABLE KEYS */;
INSERT INTO `vendorinvoicehdr` VALUES (50000000001,2000000003,1010,1000000005,'2023-07-01',2000,140,2140,'USD');
/*!40000 ALTER TABLE `vendorinvoicehdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorinvoiceitm`
--

DROP TABLE IF EXISTS `vendorinvoiceitm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorinvoiceitm` (
  `invoice_num` bigint(20) DEFAULT NULL,
  `item_num` bigint(20) DEFAULT NULL,
  `material_num` bigint(20) DEFAULT NULL,
  `material_desc` varchar(45) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `UOM` varchar(3) DEFAULT NULL,
  `unitPrice` float DEFAULT NULL,
  `NetPrice` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `totalprice` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorinvoiceitm`
--

LOCK TABLES `vendorinvoiceitm` WRITE;
/*!40000 ALTER TABLE `vendorinvoiceitm` DISABLE KEYS */;
INSERT INTO `vendorinvoiceitm` VALUES (50000000001,1,3000000001,'Bearings',1000,'PK',2,2000,140,2140,'USD');
/*!40000 ALTER TABLE `vendorinvoiceitm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendormaster`
--

DROP TABLE IF EXISTS `vendormaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendormaster` (
  `vendor_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendormaster`
--

LOCK TABLES `vendormaster` WRITE;
/*!40000 ALTER TABLE `vendormaster` DISABLE KEYS */;
INSERT INTO `vendormaster` VALUES (2000000001,'Auto Parts','Limited','11966 Luxor Chase','Fishers','IN','US'),(2000000002,'Simple Machineries','Limited','1456 Trnaquility Ct','Indianapolis','IN','US'),(2000000003,'Bearing','INC','32678 Washing St','Indianapolis','IN','US'),(2000000004,'Security device','LLC','42958 New Indian St','Louisville','KY','US'),(2000000005,'Black and Decker','Inc','1356 Ridge Road','Towson','MD','US'),(2000000006,'Dyson Boiler','Limited','5678 Lincoln Ave','Baltimore','MD','US'),(2000000007,'Stanley systems','Inc','3448 Folkridge Dr','Indianapolis','IN','US'),(2000000008,'Staples','Inc','1345 96th Street','Indianapolis','IN','US'),(2000000009,'Billi John','Inc','6745 82nd Street','Indianapolis','IN','US'),(2000000010,'AMD ','Inc','4687 Main street','Frenchlick','IN','US');
/*!40000 ALTER TABLE `vendormaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 14:09:17
