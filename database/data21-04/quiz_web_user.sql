-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: quiz_web
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_account_idx` (`username`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Phạm Tấn Nhạc','nhacpham1@gmail.com','0816569931','Huế, Việt Nam','nhac1logoQuizgym.PNG','nhac1'),(2,'Phạm Tấn Nhạc','nhacpham2@gmail.com','0816569932','Huế, Việt Nam','nhac2logoQuizgym.PNG','nhac2'),(3,'Hoang Hieuuuuuu','hoanghieu1@gmail.com','0816569933','Đà Nẵng, Việt Nam','ảnh nè','hieu1'),(4,'Hoang Hieu','hoanghieu2@gmail.com','0816569934','Đà Nẵng, Việt Nam','ảnh nè','hieu2'),(5,'Hồng Sơn','hongson1@gmail.com','0816569936','Quảng Nam, Việt Nam','ảnh nè','hongson1'),(6,'Hồng Sơn','hongson2@gmail.com','0816569935','Quảng Nam, Việt Nam','ảnh nè','hongson2'),(7,'Hồng Nhung','hongnhung1@gmail.com','0816569936','Quảng Nam, Việt Nam','ảnh nè','nhung1'),(8,'Hồng Nhung','hongnhung2@gmail.com','0816569936','Quảng Nam, Việt Nam','ảnh nè','nhung2'),(9,'Thành Danh','thanhdanh1@gmail.com','0816569936','Quảng Nam, Việt Nam','ảnh nè','danh1'),(10,'Thành Danh','thanhdanh2@gmail.com','0816569936','Quảng Nam, Việt Nam','ảnh nè','danh2'),(11,'Mỹ Vân','myvan1@gmail.com','081656999','Quảng Nam, Việt Nam','ảnh nè','van1'),(12,'Mỹ Vân','myvan2@gmail.com','0816569988','Quảng Nam, Việt Nam','ảnh nè','van2'),(13,'Thu Thảo','thuthao1@gmail.com','081656999','Quảng Nam, Việt Nam','ảnh nè','thao1'),(14,'Thu Thảo','thuthao2@gmail.com','0816569988','Quảng Nam, Việt Nam','ảnh nè','thao2'),(15,'Tấn Dũng','tandung1@gmail.com','081656999','Quảng Nam, Việt Nam','ảnh nè','dung1'),(16,'Tấn Dũng','tandung2@gmail.com','0816569988','Quảng Nam, Việt Nam','ảnh nè','dung2'),(18,'Mã Hoá Mật Khẩu','hongson@gmail.com','0123456789','Quảng Nam','img','hongson4'),(20,'Pham Nhac','nhacpham34@gmail.com','0123456789','Huế, Việt Nam','admin_profile.svg','nhacpham34'),(21,'Đỗ Nhật Đông','itk40b2@gmail.com','0212254221','Huế, Việt Nam','admin_profile.svg','nhac1000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-21 22:37:08
