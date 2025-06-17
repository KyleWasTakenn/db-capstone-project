-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `OrderCustomerID` int NOT NULL,
  `OrderBookingID` int DEFAULT NULL,
  `OrderStatusID` int DEFAULT NULL,
  `OrderStaffID` int DEFAULT NULL,
  `OrderTime` time NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID_idx` (`OrderCustomerID`),
  KEY `BookingID_idx` (`OrderBookingID`),
  KEY `StatusID_idx` (`OrderStatusID`),
  KEY `AssignedStaffID_idx` (`OrderStaffID`),
  CONSTRAINT `OrderBookingID` FOREIGN KEY (`OrderBookingID`) REFERENCES `bookings` (`BookingID`),
  CONSTRAINT `OrderCustomerID` FOREIGN KEY (`OrderCustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `OrderStaffID` FOREIGN KEY (`OrderStaffID`) REFERENCES `staff` (`StaffID`),
  CONSTRAINT `OrderStatusID` FOREIGN KEY (`OrderStatusID`) REFERENCES `deliverystatus` (`DeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (501,1,201,301,102,'18:30:00'),(502,2,202,302,103,'19:00:00'),(503,3,203,303,102,'20:00:00'),(504,4,NULL,NULL,103,'19:15:00'),(505,5,205,NULL,102,'20:30:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 15:05:19
