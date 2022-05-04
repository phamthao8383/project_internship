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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('danh1','4297F44B13955235245B2497399D7A93'),('danh2','4297F44B13955235245B2497399D7A93'),('dung1','4297F44B13955235245B2497399D7A93'),('dung2','4297F44B13955235245B2497399D7A93'),('hieu1','4297F44B13955235245B2497399D7A93'),('hieu2','4297F44B13955235245B2497399D7A93'),('hongson1','E10ADC3949BA59ABBE56E057F20F883E'),('hongson2','4297F44B13955235245B2497399D7A93'),('nhac1','4297F44B13955235245B2497399D7A93'),('nhac2','4297F44B13955235245B2497399D7A93'),('nhung1','4297F44B13955235245B2497399D7A93'),('nhung2','4297F44B13955235245B2497399D7A93'),('thao1','4297F44B13955235245B2497399D7A93'),('thao2','4297F44B13955235245B2497399D7A93'),('trungdc','25D55AD283AA400AF464C76D713C07AD'),('van1','4297F44B13955235245B2497399D7A93'),('van2','4297F44B13955235245B2497399D7A93');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accumulated_point`
--

DROP TABLE IF EXISTS `accumulated_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accumulated_point` (
  `apoint_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `accumulated_point` double DEFAULT NULL,
  PRIMARY KEY (`apoint_id`),
  KEY `fk_apoint_user_idx` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accumulated_point`
--

LOCK TABLES `accumulated_point` WRITE;
/*!40000 ALTER TABLE `accumulated_point` DISABLE KEYS */;
INSERT INTO `accumulated_point` VALUES (87,1,430),(88,2,240),(89,3,430),(90,4,0),(91,5,0),(92,6,0),(93,7,190),(94,8,0),(95,9,0),(96,10,0),(97,11,0),(98,12,0),(99,13,0),(100,14,0),(101,15,0),(102,16,0),(103,24,0),(104,1,430),(105,2,240),(106,3,430),(107,4,0),(108,5,0),(109,6,0),(110,7,190),(111,8,0),(112,9,0),(113,10,0),(114,11,0),(115,12,0),(116,13,0),(117,14,0),(118,15,0),(119,16,0),(120,24,0);
/*!40000 ALTER TABLE `accumulated_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `starting_time` datetime NOT NULL,
  `completion_time` datetime NOT NULL,
  `point` double NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `fk_assignment_user_idx` (`user_id`),
  KEY `fk_assignment_exam_idx` (`exam_id`),
  CONSTRAINT `fk_assignment_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `fk_assignment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (72,1,1,'2022-05-01 12:18:13','2022-05-01 12:18:21',20),(73,1,1,'2022-05-01 12:18:31','2022-05-01 12:18:40',30),(74,1,1,'2022-05-01 12:18:55','2022-05-01 12:19:05',0),(75,1,1,'2022-05-01 12:19:13','2022-05-01 12:19:20',0),(76,1,5,'2022-05-01 12:19:25','2022-05-01 12:19:33',0),(77,1,5,'2022-05-01 12:19:57','2022-05-01 12:20:07',0),(78,1,5,'2022-05-01 12:20:11','2022-05-01 12:20:21',10),(79,1,5,'2022-05-01 12:20:27','2022-05-01 12:20:35',40),(80,1,13,'2022-05-01 12:20:56','2022-05-01 12:21:05',10),(81,1,13,'2022-05-01 12:21:14','2022-05-01 12:21:23',0),(82,1,13,'2022-05-01 12:21:28','2022-05-01 12:21:36',30),(83,1,13,'2022-05-01 12:21:46','2022-05-01 12:21:53',10),(84,2,2,'2022-05-01 12:22:17','2022-05-01 12:22:34',20),(85,2,2,'2022-05-01 12:22:50','2022-05-01 12:23:07',20),(86,2,2,'2022-05-01 12:23:16','2022-05-01 12:23:32',40),(87,2,2,'2022-05-01 12:23:46','2022-05-01 12:24:03',20),(88,2,6,'2022-05-01 12:24:15','2022-05-01 12:24:34',20),(89,3,6,'2022-05-01 12:25:24','2022-05-01 12:25:39',20),(90,3,6,'2022-05-01 12:25:44','2022-05-01 12:26:00',40),(91,3,6,'2022-05-01 12:26:11','2022-05-01 12:26:27',20),(92,3,3,'2022-05-01 12:27:29','2022-05-01 12:27:38',10),(93,3,3,'2022-05-01 12:27:41','2022-05-01 12:27:50',30),(94,3,3,'2022-05-01 12:27:55','2022-05-01 12:28:03',10),(95,3,7,'2022-05-01 12:28:08','2022-05-01 12:28:19',0),(96,3,7,'2022-05-01 12:29:42','2022-05-01 12:29:49',20),(97,3,7,'2022-05-01 12:29:56','2022-05-01 12:30:03',30),(98,3,7,'2022-05-01 12:30:08','2022-05-01 12:30:16',30),(99,3,7,'2022-05-01 12:30:31','2022-05-01 12:30:42',50),(100,1,13,'2022-05-01 12:35:44','2022-05-01 12:36:02',10),(101,1,13,'2022-05-01 12:43:08','2022-05-01 12:43:15',10),(102,1,16,'2022-05-03 12:54:45','2022-05-03 12:55:01',10),(103,7,16,'2022-05-03 12:55:32','2022-05-03 12:55:52',20),(104,2,16,'2022-05-03 12:56:34','2022-05-03 12:56:49',60),(105,2,16,'2022-05-03 12:56:34','2022-05-03 13:02:24',60),(106,3,16,'2022-05-03 17:35:53','2022-05-03 17:36:08',60),(107,3,16,'2022-05-03 17:36:21','2022-05-03 17:36:50',60),(108,3,1,'2022-05-03 17:37:04','2022-05-03 17:38:07',50),(109,1,1,'2022-05-03 17:54:16','2022-05-03 17:54:27',50),(110,1,1,'2022-05-03 17:54:39','2022-05-03 17:54:51',20),(111,1,1,'2022-05-03 17:55:08','2022-05-03 17:55:23',30),(112,7,1,'2022-05-03 18:20:32','2022-05-03 18:20:49',50),(113,7,1,'2022-05-03 18:26:05','2022-05-03 18:27:08',20),(114,7,1,'2022-05-03 18:33:18','2022-05-03 18:34:18',50),(115,7,1,'2022-05-03 18:33:18','2022-05-03 18:53:33',50),(116,1,1,'2022-05-03 18:53:54','2022-05-03 18:54:54',50),(117,1,1,'2022-05-03 18:58:14','2022-05-03 18:59:14',50),(118,1,1,'2022-05-03 19:00:25','2022-05-03 19:00:35',50);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `allowed_time` varchar(45) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `fk_exam_subject_idx` (`subject_id`),
  CONSTRAINT `fk_exam_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,1,'1','Đề thi HK2 môn Toán 12 năm 2021-2022'),(2,2,'15','Dao động điều hòa Vật Lý 12'),(3,3,'14','Đề thi HK2 môn Hóa12 năm 2021-2022'),(4,4,'2','Đề Thi Trắc Nghiệm Chứng Chỉ Ứng Dụng CNTT Cơ Bản (phần 2)'),(5,1,'20','Đề thi HK2 môn Toán 12 năm 2021-2022'),(6,2,'15','Đề thi HK2 môn Vật Lý12 năm 2021-2022'),(7,3,'14','Đề thi HK1 môn Hóa12 năm 2021-2022'),(13,1,'15','Đề thi thử thpt quốc gia môn Toán (Đề số 1)'),(14,5,'15','BỘ ĐỀ THI THỬ BẰNG LÁI XE MÁY A1'),(15,5,'15','ĐỀ THI LÝ THUYẾT B2'),(16,1,'15','Đề toán thi tốt nghiệp THPT 2021');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_exam` BEFORE DELETE ON `exam` FOR EACH ROW begin
	delete from exam_question where exam_id = OLD.exam_id;
    delete from assignment where exam_id = OLD.exam_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `exam_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`exam_id`,`question_id`),
  KEY `fk_question_idx` (`question_id`),
  CONSTRAINT `fk_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `fk_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (2,1),(6,1),(2,2),(6,2),(2,3),(6,3),(2,4),(6,4),(2,5),(6,5),(2,6),(6,6),(2,7),(6,7),(2,8),(6,8),(2,9),(6,9),(2,10),(6,10),(1,11),(1,12),(1,13),(1,14),(1,15),(5,16),(5,17),(5,18),(5,19),(5,20),(3,21),(3,22),(3,23),(3,24),(3,25),(7,25),(7,26),(7,27),(7,29),(7,30),(4,31),(4,32),(4,33),(4,34),(4,35),(16,43),(13,44),(16,44),(13,45),(16,45),(13,46),(16,46),(13,47),(16,47),(13,48),(16,48),(16,49),(16,50),(16,51),(16,125),(14,134),(14,135),(14,136),(14,137),(14,138),(14,139),(14,140),(14,141),(14,142),(14,143),(15,146),(15,147),(15,148),(15,149),(15,150),(15,151),(15,152),(15,153);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_question_subject_idx` (`subject_id`),
  CONSTRAINT `fk_question_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Lực tương tác giữa hai điện tích điểm đứng yên trong không khí thay đổi như thế nào nếu đặt một tấm nhựa xen vào khoảng giữa hai điện tích?','Phương, chiều, độ lớn không đổi','Phương, chiều không đổi, độ lớn giảm','Phương thay đổi tùy theo hướng đặt tấm nhựa, chiều, độ lớn không đổi','Phương, chiều không đổi, độ lớn tăng.','Phương, chiều không đổi, độ lớn giảm',2),(2,'Hai điện tích điểm giống nhau có độ lớn 2.10^-6C, đặt trong chân không cách nhau 20cm thì lực tương tác giữa chúng','là lực đẩy, có độ lớn 9.10-5N','là lực hút, có độ lớn 0,9N','là lực hút, có độ lớn 9.10-5N','là lực đẩy có độ lớn 0,9N','là lực đẩy có độ lớn 0,9N',2),(3,'Hai điện tích điểm q1=1,5.10^-7C và q2 đặt trong chân không cách nhau 50cm thì lực hút giữa chúng là 1,08.10-3N. Giá trị của điện tích q2 là:','2.10-7C','2.10-3C','-2.10-7C','-2.10-3C','-2.10-7C',2),(4,'Hai điện tích điểm q1=2,5.10-6C và q2=4.10-6C đặt gần nhau trong chân không thì lực đẩy giữa chúng là 1,44N. Khoảng cách giữ hai điện tích là:','25cm','20cm','12cm','40cm','25cm',2),(5,'Hai điện tích điểm đặt trong không khí cách nhau một khoảng 30cm có lực tương tác tĩnh giữa chúng là F. Nếu nhúng chúng trong dầu có hằng số điện môi là 2,25, để lực tương tác giữa chúng vẫn là F thì khoảng cách giữa các điện tích là:','20cm','10cm','25cm','15cm','20cm',2),(6,'Hai vật nhỏ mang điện tích cách nhau 40cm trong không khí thì đẩy nhau với lực là 0,675 N. Biết rằng tổng điện tích của hai vật là 8.10-6C. Điện tích của mỗi vật lần lượt là:','q1 = 7.10-6C; q2 = 10-6C','q1 = q2 = 4.10-6C','q1 = 2.10-6C ; q2 = 6.10-6C','q1 = 3.10-6C ; q2 = 5.10-6C','q1 = 2.10-6C ; q2 = 6.10-6C',2),(7,'Hai điện tích dương q1, q2 có cùng một độ lớn được đặt tại hai điểm A, B, điện tích q0 đặt tại trung điểm của AB thì ta thấy hệ ba điện tích này nằm cân bằng trong chân không. Bỏ qua trọng lượng của ba điện tích. Chọn kết luận đúng.','qo là điện tích dương','qo là điện tích âm','qo có thể là điên tích âm có thể là điện tích dương','qo phải bằng 0','qo là điện tích âm',2),(8,' Hai quả cầu nhẹ có cùng khối lượng được treo vào mỗi điểm bằng hai dây chỉ giống nhau. Truyền cho hai quả cầu điện tích cùng dấu q1 và q3 = 3q1, hai quả cầu đẩy nhau. Góc lệch của hai dây treo hai quả cầu so với phương thẳng đứng là α1 và α2. Chọn biểu thức đúng :','α1 = 3α2','3α1 = α2','α1 = α2','α1 = 1,5α2','α1 = α2',2),(9,' Quả cầu nhỏ có khối lượng 18g mang điện tích q1 = 4.10-6 C treo ở đầu một sợi dây mảnh dài 20cm. Nếu đặt điện tích q2 tại điểm treo sợi dây thì lực căng của dây giảm đi một nửa. Lấy g = 10m/s2. Điện tích q2 có giá trị bằng :','-2.10-6C','2.10-6C','10-7C','-10-7C','-10-7C',2),(10,'Hai điện tích điểm q1 và q2 được giữ cố định tại 2 điểm A và B cách nhau một khoảng a trong điện môi. Điện tich q3 đặt tại điểm C trên đoạn AB cách B một khoảng a/3. Để điện tích q3 cân bằng phải có điều kiện nào sau đây ?','q1 = 2q2','q1 = -4q2','q1 = 4q2','q1 = -2q2','q1 = 4q2',2),(11,'Khối lớp Một có 245 học sinh, khối lớp Hai có ít hơn khối lớp Một 22 học sinh. Hỏi khối lớp Hai có bao nhiêu học sinh?','223 học sinh','267 học sinh','233 học sinh','232 học sinh','223 học sinh',1),(12,'Tìm x, biết x + 123 = 666','789','543','798','534','543',1),(13,'Điền số thích hợp vào chỗ trống: 400 + 500 = …','900','800','90','133','900',1),(14,'Tìm x, biết x + 123 = 666','789','543','798','534','543',1),(15,'Trong các mệnh đề sau, mệnh đề nào đúng?',' Mọi hình hộp đứng đều có mặt cầu ngoại tiếp.','Mọi hình hộp chữ nhật đều có mặt cầu ngoại tiếp.','Mọi hình hộp có một mặt bên vuông góc với đáy đều có mặt cầu ngoại tiếp.','Mọi hình hộp đều có mặt cầu ngoại tiếp.','Mọi hình hộp chữ nhật đều có mặt cầu ngoại tiếp.',1),(16,'Cho hàm số y = x – ln(1 + ex). Khẳng định nào sau đây là đúng?','Hàm số đạt cực đại tại x = 0','Tập xác định của hàm số là D = (0; +∞)','Hàm số đồng biến trên R','Hàm số đạt cực tiểu tại x = 1','Hàm số đồng biến trên R',1),(17,'Cho ΔABC vuông tại A, AB = 6cm, AC = 8cm. Gọi V1 là thể tích khối nón tạo thành khi quay ΔABC quanh cạnh AB và V2 là thể tích khối nón tạo thành khi quay ΔABC  quanh cạnh AC. Tỉ số V1/ V2 bằng',' 4/3','3/4','16/9','64/27','64/27',1),(18,'Gọi x = a và x = b là các điểm cực trị của hàm số y = 2x3 – 3x2 – 18x - 1. Khi đó A = a + b – 2ab bằng:',' -7','5','7','-5','-5',1),(19,'Cho hình chóp S.ABC có đáy là tam giác đều cạnh bằng 6, cạnh bên SA ⊥ (ABC) và SA = 4√6. Diện tích mặt cầu ngoại tiếp hình chóp S.ABC bằng:','108π','48π','36π','144π','144π',1),(20,'Một cửa hàng có 325 kg gạo, buổi sáng cửa hàng nhập thêm về 214 kg gạo, buổi chiều họ xuất đi 420 kg. Cửa hàng còn lại số ki-lô-gam gạo là:','959 kg','119 kg','129 kg','539 kg','539 kg',1),(21,'Cho các chất sau: hoa đào, hoa mai, con người, cây cỏ, quần áo…Hãy cho biết vật nào là nhân tạo?','Hoa đào','Cây cỏ','Quần áo','Tất cả đáp án trên','Quần áo',3),(22,'Chọn đáp án đúng nhất','Nước cất là chất tinh khiết.','Chỉ có 1 cách để biết tính chất của chất','Vật thể tự nhiên là do con người tạo ra','Nước mưa là chất tinh khiết','Nước cất là chất tinh khiết.',3),(23,'Điền từ còn thiếu vào chỗ trống “Cao su là chất…., có tính chất đàn hồi, chịu được ăn mòi nên được dùng chế tạo lốp xe”','Thấm nước','Không thấm nước','Axit','Muối','Không thấm nước',3),(24,'Điền từ thích hợp vào chỗ trống “ Thủy ngân là kim loại nặng có ánh bạc, có dạng ... (1) ở nhiệt độ thường. Thủy ngân thường được sử dụng trong ... (2) ... (3) và các thiết bị khoa học khác.”','(1) rắn (2) nhiệt độ (3) áp kế','(1) lỏng (2) nhiệt kế (3) áp kế','(1) khí (2) nhiệt kế (3) áp suất','3 đáp án trên','(1) lỏng (2) nhiệt kế (3) áp kế',3),(25,'Trong các cụm từ được in đậm và đánh số có trong các câu sau, cụm từ nào dùng sai?\n“Thủy tinh, đôi khi trong dân gian còn được gọi là kính hay kiếng, là một chất lỏng (1) vô định hình đồng nhất, có gốc silicat, thường được pha trộn thêm các tạp chất để có vật chất (2) theo ý muốn.\nThân mía gồm các vật thể (3): đường (tên hóa học là saccarozơ (4)), nước, xenlulozơ…”','(1), (2), (4)','(1), (2), (3)','(2), (3), (4)','(1), (2), (3), (4)','(1), (2), (3)',3),(26,'Chất tinh khiết là chất','Chất lẫn ít tạp chất','Chất không lẫn tạp chất','Chất lẫn nhiều tạp chất','Có tính chất thay đổi','Chất không lẫn tạp chất',3),(27,'Chất nào sau đây được coi là tinh khiết','Nước cất','Nước mưa','Nước lọc','Đồ uống có gas','Nước cất',1),(28,'Tính chất nào sau đây có thể quan sát được mà không cần đo hay làm thí nghiệm để biết?','Tính tan trong nước','Khối lượng riêng','Màu sắc','Nhiệt độ nóng chảy','Màu sắc',3),(29,'Cách hợp lí để tách nước ra khỏi dầu hỏa là','Lọc.','Chiết.','Cô cạn.','Đông đặc.','Chiết.',3),(30,'Vật thể tự nhiên là','Con bò','Điện thoại','Ti vi','Bàn là','Con bò',3),(31,'Thông tin có thể giúp cho con người:','Nắm được quy luật của tự nhiên và do đó trở nên mạnh mẽ hơn.','Hiểu biết về cuộc sống và xã hội xung quanh.','Biết được các tin tức và sự kiện xảy ra trong xã hội.','Tất cả các khẳng định trên đều đúng.','Tất cả các khẳng định trên đều đúng.',4),(32,'Chúng ta gọi dữ liệu hoặc lệnh được nhập vào máy tính là:',' Dữ liệu được lưu trữ.','Thông tin vào.','Thông tin ra.','Thông tin máy tính.','Thông tin máy tính.',4),(33,'Em là sao đỏ của lớp. Theo em, thông tin nào dưới đây không phải là thông tin cần xử lí ( thông tin vào ) để xếp loại các tổ cuối tuần?',' Số lượng điểm 10.','Số các bạn bị ghi tên vì đi muộn.','Số bạn mặc áo xanh.','Số bạn bị cô giáo nhắc nhở.','Số lượng điểm 10.',4),(34,'Nghe bản tin dự báo thời tiết “Ngày mai trời có thể mưa”, em sẽ xử lý thông tin và quyết định như thế nào (thông tin ra) ?',' Mặc đồng phục.','Đi học mang theo áo mưa.','Ăn sáng trước khi đến trường.','Hẹn bạn Trang cùng đi học.','Đi học mang theo áo mưa.',4),(35,'Tai người bình thường có thể tiếp nhận thông tin nào dưới đây:',' Tiếng chim hót;','Đi học mang theo áo mưa;','Ăn sáng trước khi đến trường;','Hẹn bạn Hương cùng đi học.','Tiếng chim hót;',4),(36,'Mắt thường không thể tiếp nhận thông tin nào dưới đây?',' Đàn kiến đang “tấn công” lọ đường quên đậy nắp;','Những con vi trùng gây bệnh lị lẫn trong thức ăn bị ôi thiu;','Rác bẩn vứt ngoài hành lang lớp học;','Bạn Phương quên không đeo khăn quàng đỏ.','Bạn Phương quên không đeo khăn quàng đỏ.',4),(37,'Trước khi sang đường theo em, con người cần phải xử lý những thông tin gì?',' Quan sát xem có phương tiện giao thông đang đến gần không;','Nghĩ về bài toán hôm qua trên lớp chưa làm được;','Quan sát xem đèn tín hiệu giao thông đang bật màu gì;','Kiểm tra lại đồ dùng học tập đã có đủ trong cặp sách chưa;','Nghĩ về bài toán hôm qua trên lớp chưa làm được;',4),(38,'Em cần nấu một nồi cơm. Hãy xác định những thông tin nào cần xử lý?',' Kiểm tra gạo trong thùng còn không;','Nước cho vào nồi đã đủ chưa;','Bếp nấu đã chuẩn bị sẵn sàng chưa;','Tất cả các thông tin trên.','Tất cả các thông tin trên.',4),(39,'Một trong những nhiệm vụ chính của tin học là:',' Nghiên cứu giải các bài toán trên máy tính;','Nghiên cứu chế tạo các máy tính với nhiều tính năng ngày càng ưu việt hơn;','Nghiên cứu việc thực hiện các hoạt động thông tin một cách tự động nhờ sự trợ giúp của máy tính điện tử;','Biểu diễn các thông tin đa dạng trong máy tính.','Nghiên cứu việc thực hiện các hoạt động thông tin một cách tự động nhờ sự trợ giúp của máy tính điện tử;',4),(42,'Trong không gian \\(\\mathrm{Oxyz}\\), mặt cầu \\((S):(x+1)^2+(y-2)^2+z^2=9\\) có bán kính bằng','3.0','81.0','9.0','6.0','3.0',1),(43,'Điểm nào dưới đây thuộc đồ thị hàm số \\(y=x^4+x^2-2\\)?&nbsp;','Điểm P(-1;-1)','Điểm N(-1;-2)','Điểm M(-1; 0)','Điểm Q(-1; 1)','Điểm M(-1; 0)',1),(44,'Thể tích V của khối cầu bán kính r được tính theo công thức nào dưới đây?','\\(V=\\dfrac{1}{3} \\pi r^3\\)','\\(V=2 \\pi r^3\\)','\\(V=4 \\pi r^3\\)','\\(V=\\dfrac{4}{3} \\pi r^3\\)','\\(V=\\dfrac{4}{3} \\pi r^3\\)',1),(45,'Trên khoảng \\((0;+\\infty)\\), họ nguyên hàm của hàm số \\(f(x)=x^{\\frac{3}{2}}\\) là:&nbsp;','\\(\\displaystyle\\int f(x) {\\rm d} x=\\dfrac{3}{2} x^{\\frac{1}{2}}+C\\)','\\(\\displaystyle\\int f(x) {\\rm d} x=\\dfrac{5}{2} x^{\\frac{2}{5}}+C\\)','\\(\\displaystyle\\int f(x) {\\rm d} x=\\dfrac{2}{5} x^{\\frac{5}{2}}+C\\)','\\(\\displaystyle\\int f(x) {\\rm d} x=\\dfrac{2}{3} x^{\\frac{1}{2}}+C\\)','\\(\\displaystyle\\int f(x) {\\rm d} x=\\dfrac{2}{5} x^{\\frac{5}{2}}+C\\)',1),(46,'Tập nghiệm của bất phương trình \\(2^x>6\\) là','\\(\\left(\\log _2 6;+\\infty\\right)\\)','\\((-\\infty; 3)\\)','\\((3;+\\infty)\\)','\\(\\left(-\\infty; \\log _2 6\\right)\\)','\\(\\left(\\log _2 6;+\\infty\\right)\\)',1),(47,'Cho khối chóp có diện tích đáy B=7 và chiều cao h=6. Thể tích của khối chóp đã cho là&nbsp;','42.0','126.0','14.0','56.0','14.0',1),(48,'Tập xác định của hàm số \\(y=x^{\\sqrt{2}}\\) là ','\\(\\mathbb{R}\\)','\\(\\mathbb{R} \\setminus\\{0\\}\\)','\\((0;+\\infty)\\)','\\((2;+\\infty)\\)','\\((0;+\\infty)\\)',1),(49,'Nghiệm của phương trình \\(\\log _2(x+4)=3\\) là&nbsp;','x = 5','x = -5','x = 2','x = 12','x = -5',1),(50,'Nếu \\(\\displaystyle\\int_2^5 f(x) \\mathrm{d} x=3\\) và \\(\\displaystyle\\int_2^5 g(x) \\mathrm{d} x=-2\\) thì \\(\\displaystyle\\int_2^5\\left[f(x)+g(x) \\right]\\mathrm{\\,d}x\\) bằng','5.0','-5.0','1.0','3.0','1.0',1),(51,'Cho số phức z=3-2i, khi đó 2z bằng','6-2i','6-4i','3-4i','-6+4i','6-4i',1),(52,'Trong các mệnh đề sau, mệnh đề nào sai?','Hai đường thẳng không có điểm chung thì chéo nhau','Hai đường thẳng chéo nhau thì không có điểm chung','Hai đường thẳng phân biệt không cắt nhau và không song song thì chéo nhau','Hai đường thẳng phân biệt không chéo nhau thì hoặc cắt nhau hoặc song song','Hai đường thẳng không có điểm chung thì chéo nhau',1),(53,'Trong các mệnh đề sau, mệnh đề nào đúng?','Hai đường thằng có một điểm chung thì chúng có vô số điểm chung khác.','Hai đường thẳng song song khi và chỉ khi chúng không điểm chung','Hai đường thẳng song song khi và chỉ khi chúng không đồng phẳng','Hai đường thẳng chéo nhau khi và chỉ khi chúng không đồng phẳng','Hai đường thẳng chéo nhau khi và chỉ khi chúng không đồng phẳng',1),(54,'Trong các mệnh đề sau, mệnh đề nào đúng?','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì song song với nhau.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì trùng nhau.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì song song với nhau hoặc trùng nhau.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì chúng lần lượt nằm trên hai mặt phẳng song song.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì song song với nhau hoặc trùng nhau.',1),(55,'Trong các mệnh đề sau, mệnh đề nào sai?','Hai đường thẳng không có điểm chung thì chéo nhau','Hai đường thẳng chéo nhau thì không có điểm chung','Hai đường thẳng phân biệt không cắt nhau và không song song thì chéo nhau','Hai đường thẳng phân biệt không chéo nhau thì hoặc cắt nhau hoặc song song','Hai đường thẳng không có điểm chung thì chéo nhau',1),(56,'Trong các mệnh đề sau, mệnh đề nào đúng?','Hai đường thằng có một điểm chung thì chúng có vô số điểm chung khác.','Hai đường thẳng song song khi và chỉ khi chúng không điểm chung','Hai đường thẳng song song khi và chỉ khi chúng không đồng phẳng','Hai đường thẳng chéo nhau khi và chỉ khi chúng không đồng phẳng','Hai đường thẳng chéo nhau khi và chỉ khi chúng không đồng phẳng',1),(57,'Trong các mệnh đề sau, mệnh đề nào đúng?','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì song song với nhau.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì trùng nhau.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì song song với nhau hoặc trùng nhau.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì chúng lần lượt nằm trên hai mặt phẳng song song.','Hai đường thẳng cùng song song với một đường thẳng thứ ba thì song song với nhau hoặc trùng nhau.',1),(58,'Trong các khẳng định sau, khẳng định nào đúng?','Hai đường thẳng chéo nhau thì chúng có điểm chung.','Hai đường thẳng không có điểm chung là hai đường thẳng song song hoặc chéo nhau.','Hai đường thẳng song song với nhau thì có thể chéo nhau.','Khi hai đường thẳng ở trên hai mặt phẳng phân biệt thì hai đường thẳng đó chéo nhau.','Hai đường thẳng không có điểm chung là hai đường thẳng song song hoặc chéo nhau.',1),(59,'Cho hai đường thẳng chéo nhau và . Lấy thuộc và thuộc . Khẳng định nào sau đây đúng khi nói về hai đường thẳng và?','Có thể song song hoặc cắt nhau.','Cắt nhau.','Song song với nhau.','Chéo nhau.','Chéo nhau.',1),(60,'Cho hình chóp S.ABCD có đáy ABCD là hình bình hành. Gọi I, J, E, F lần lượt là trung điểm SA, SB, SC, SD. Trong các đường thẳng sau, đường thẳng nào không song song với IJ?','EF.','DC.','AD.','AB.','AD.',1),(61,'Kí hiệu nào sau đây là tên của mặt phẳng','a','mpQ','Amp(P)','AmpP','Amp(P)',1),(62,'Có bao nhiêu phép tịnh tiến biến một đường thẳng cho trước thành chính nó?','Không có','Chỉ có một','Chỉ có hai','Vô số','Vô số',1),(63,'Tìm mệnh đề sai trong các mệnh đề sau:\n','Phép tịnh tiến bảo toàn khoảng cách giữa hai điểm bất kì.','Phép tịnh tiến biến ba điểm thẳng hàng thành ba điểm thẳng hàng.','Phép tịnh tiến biến tam giác thành tam giác bằng tam giác đã cho','Phép tịnh tiến biến đường thẳng thành đường thẳng song song với đường thẳng đã cho.','Phép tịnh tiến biến đường thẳng thành đường thẳng song song với đường thẳng đã cho.',1),(64,'Hiện tượng siêu dẫn là hiện tượng','điện trở của vật giảm xuống bằng 0 khi nhiệt độ của vật nhỏ hơn một giá trị nhiệt độ nhất định.','&nbsp;luôn nhỏ hơn 1','bằng tỉ số giữa chiết suất tuyệt đối của môi trường khúc xạ và chiết suất tuyệt đối của môi trường tới.&nbsp;','bằng hiệu số giữa chiết suất tuyệt đối của môi trường khúc xạ và chiết suất tuyệt đối của môi trường tới','điện trở của vật giảm xuống bằng 0 khi nhiệt độ của vật nhỏ hơn một giá trị nhiệt độ nhất định.',2),(65,'Khối lượng chất giải phóng ở điện cực của bình điện phân tỉ lệ với','khối lượng chất điện phân.','khối lượng dung dịch trong bình','thể tích của dung dịch trong bình.','điện lượng chuyển qua bình.','điện lượng chuyển qua bình.',2),(66,'Phát biểu nào sau đây là không đúng?','Hạt tải điện trong kim loại là electron','Dòng điện trong kim loại tuân theo định luật Ôm nếu nhiệt độ trong kim loại được giữ không đổi','Hạt tải điện trong kim loại là ion dương và ion âm.','Dòng điện chạy qua dây dẫn kim loại gây ra tác dụng nhiệt','Hạt tải điện trong kim loại là ion dương và ion âm.',2),(67,'Bản chất của hiện tượng dương cực tan là','cực dương của bình điện phân bị bay hơi.','cực dương của bình điện phân bị tác dụng hóa học tạo thành chất điện phân và tan vào dung dịch.','cực dương của bình điện phân bị tăng nhiệt độ tới mức nóng chảy.','cực dương của bình điện phân bị mài mòn cơ học.','cực dương của bình điện phân bị tác dụng hóa học tạo thành chất điện phân và tan vào dung dịch.',2),(68,'Điện trở của kim loại không phụ thuộc trực tiếp vào','nhiệt độ của kim loại.','bản chất của kim loại.','hiệu điện thế hai đầu vật dẫn kim loại.','kích thước của vật dẫn kim loại.','hiệu điện thế hai đầu vật dẫn kim loại.',2),(69,'Nhận định nào sau đây không đúng về nam châm?','Mọi nam châm đều hút được sắt.','Mọi nam châm khi nằm cân bằng thì trục đều trùng theo phương Bắc Nam.','Các cực cùng tên của các nam châm thì đẩy nhau.','Mọi nam châm bao giờ cũng cũng có hai cực.','Mọi nam châm khi nằm cân bằng thì trục đều trùng theo phương Bắc Nam.',2),(70,'Từ trường đều có các đường sức từ:','khép kín.','luôn có dạng là những đường tròn đồng tâm,cách đều.','có dạng là những đường thẳng.','song song và cách đều.','song song và cách đều.',2),(71,'Đường sức từ không có tính chất nào sau đây?','Qua mỗi điểm trong không gian chỉ vẽ được một đường sức.','Các đường sức là các đường cong khép kín hoặc vô hạn ở hai đầu.','Chiều của các đường sức là chiều của từ trường.','Các đường sức của cùng một từ trường có thể cắt nhau.','',2),(72,'Nhận xét nào sau đây không đúng về cảm ứng từ?','Đặc trưng cho từ trường về phương diện tác dụng lực từ.','Phụ thuộc vào chiều dài đoạn dây dẫn mang dòng điện.','Trùng với hướng của từ trường.','Có đơn vị là Tesla (T).','Phụ thuộc vào chiều dài đoạn dây dẫn mang dòng điện.',2),(73,'Lực từ tác dụng lên dây dẫn không phụ thuộc trực tiếp vào:','Chiều dài của dây dẫn mang dòng điện.','Độ lớn cảm ứng từ.','Cường độ dòng điện chạy trong dây dẫn.','Điện trở của dây dẫn.','Điện trở của dây dẫn.',2),(74,'Dãy gồm các chất đều phản ứng với phenol là:','nước brom, anđehit axetic, dung dịch NaOH.','dung dịch NaCl, dung dịch NaOH, kim loại Na.','nước brom, axit axetic, dung dịch NaOH.','nước brom, anhiđrit axetic, dung dịch NaOH','nước brom, anhiđrit axetic, dung dịch NaOH',3),(75,'Chất X không được dùng làm nguyên liệu tổng hợp polime. X là','metan','etilen','propilen','buta-1,3-đien','propilen',3),(76,'Chọn phát biểu đúng nhất ','Chỉ có hợp chất ion khi hồ tan trong nước mới bị điện li.	','Độ điện li α chỉ phụ thuộc vào bản chất chất điện li ','Khi pha lỗng dung dịch, độ điện li α của các chất điện li yếu tăng. 	','Độ điện li α có thể > 1 ','Chỉ có hợp chất ion khi hồ tan trong nước mới bị điện li.	',3),(77,'Hãy chọn câu đúng nhất trong các định nghĩa sau về axit – bazơ theo quan điểm của lí thuyết Bronsted. Phản ứng axit – bazơ là : ','do axit tác dụng với bazơ    ','do axit tác dụng với oxit bazơ','do có sự nhường và nhận poton   ','do có sự chuyển dịch electron từ chất này sang chất khác','do axit tác dụng với bazơ    ',3),(78,'Dung dịch NaOH 0,01M có giá trị pH là:','2','1','13','12','1',3),(79,'Chất nào sau đây dẫn được điện?','Dung dịch muối ăn.','Dung dịch glucozơ.','KCl rắn, khan.','NaOH rắn khan.','KCl rắn, khan.',3),(80,'Phát biểu nào dưới đây là đúng?','Sự điện li là quá trình hòa tan một chất vào dung môi (thường là nước) tạo thành dung dịch','Sự điện li là sự phân li một chất dưới tác dụng của dòng điện một chiều.','Sự điện li là sự phân li một chất ra ion khi chất đó hòa tan trong nước hoặc khi nóng chảy','Sự điện li là quá trình oxi hóa - khử xảy ra trong dung dịch.','Sự điện li là quá trình oxi hóa - khử xảy ra trong dung dịch.',3),(81,'Dung dịch NaCl trong nước có môi trường:',' Axit','Trung tính','Bazơ','Muối',' Axit',3),(82,'Muối trung hòa là loại muối:','Tạo bởi axit mạnh và bazo yếu','Không còn khả năng phân li ra ion H+ trong gốc axit','Không có khả năng phản ứng với axit và bazo','Tạo bởi axit mạnh và bazơ mạnh','Tạo bởi axit mạnh và bazo yếu',3),(83,'Dung dịch điện li dẫn điện được là do sự di chuyển của:','Các cation','Các anion','Các phân tử hòa tan','Cation và anion','Cation và anion',3),(84,'Lập trình là','sử dụng cấu trúc dữ liệu và các lệnh của ngôn ngữ lập trình cụ thể để mô tả dữ liệu và diễn đạt các thao tác của thuật toán.',' sử dụng cấu trúc dữ liệu và các lệnh của ngôn ngữ lập trình cụ thể để mô tả dữ liệu.','sử dụng các lệnh của ngôn ngữ lập trình cụ thể để mô tả dữ liệu và diễn đạt các thao tác của thuật toán.','sử dụng cấu trúc dữ liệu để mô tả dữ liệu và diễn đạt các thao tác của thuật toán.','sử dụng các lệnh của ngôn ngữ lập trình cụ thể để mô tả dữ liệu và diễn đạt các thao tác của thuật toán.',6),(85,' Ngôn ngữ lập trình là','ngôn ngữ dùng để diễn tả bài toán.','ngôn ngữ dùng để viết chương trình.','ngôn ngữ dùng để xây dựng thuật toán.','ngôn ngữ dùng để nói.','ngôn ngữ dùng để xây dựng thuật toán.',6),(86,'Chức năng của chương trình dịch là',' Nối kết chương trình nguồn với chương trình đích cho máy thực hiện.','Chuyển đổi chương trình đích sang chương trình nguồn.','Chuyển đổi chương trình viết bằng ngôn ngữ khác sang ngôn ngữ máy.','Dịch chương trình đích sang ngôn ngữ máy cho máy hiểu và thực hiện.','Chuyển đổi chương trình viết bằng ngôn ngữ khác sang ngôn ngữ máy.',6),(87,'Biên dịch được thực hiện bằng cách','Duyệt, phát hiện lỗi. Dịch toàn bộ chương trình nguồn thành một chương trình khác.','Kiểm tra tính đúng đắn của lệnh trong chương trình nguồn. Dịch toàn bộ chương trình nguồn thành một chương trình đích có thể thực hiện trên máy và lưu trữ để sử dụng về sau.','Kiểm tra tính đúng đắn của câu lệnh tiếp theo trong chương trình nguồn. Thực hiện các lệnh vừa chuyển đổi được.','Duyệt, phát hiện lỗi, kiểm tra tính đúng đắn của lệnh trong chương trình nguồn. Dịch toàn bộ chương trình nguồn thành một chương trình đích có thể thực hiện trên máy và lưu trữ để sử dụng về sau.','Duyệt, phát hiện lỗi, kiểm tra tính đúng đắn của lệnh trong chương trình nguồn. Dịch toàn bộ chương trình nguồn thành một chương trình đích có thể thực hiện trên máy và lưu trữ để sử dụng về sau.',6),(88,'Các loại chương trình dịch là','Hợp dịch và biên dịch.','Thông dịch và biên dịch.','Biên dịch và diễn dịch.','Thông dịch và hợp dịch.','Thông dịch và biên dịch.',6),(89,'Các thành phần cơ bản của ngôn ngữ lập trình là','Cú pháp và ngữ nghĩa.','Cú pháp.','Bảng chữ cái, cú pháp và ngữ nghĩa.','Bảng chữ cái và ngữ nghĩa.','Cú pháp và ngữ nghĩa.',6),(90,' Hằng được định nghĩa','Là đại lượng có giá trị không đổi trong quá trình thực hiện chương trình.','Là đại lượng số thực có giá trị không đổi khi thực hiện chương trình.','Là đại lượng số nguyên có giá trị không đổi khi thực hiện chương trình.',' Là đại lượng có giá trị thay đổi trong quá trình thực hiện chương trình.',' Là đại lượng có giá trị thay đổi trong quá trình thực hiện chương trình.',6),(91,'Chọn phát biểu sai.','“TIN HOC” là hằng xâu.','15 -13 là các hằng nguyên.','4.0 0.523 là các hằng thực.','`TIN HOC` là hằng xâu.','“TIN HOC” là hằng xâu.',6),(92,'Có mấy loại hằng?','1','2','3','4','4',6),(93,'Cấu trúc một chương trình gồm mấy phần?','2','3','4','1','2',6),(94,'Công việc thường gặp khi xử lí thông tin của một tổ chức là gì?','Tạo lập hồ sơ','Cập nhật hồ sơ','Khai thác hồ sơ','Tạo lập, cập nhật, khai thác hồ sơ','Tạo lập, cập nhật, khai thác hồ sơ',6),(95,'Việc lưu trữ dữ liệu đầy đủ và hợp lí sẽ:','Hỗ trợ thống kê, báo cáo, tổng hợp số liệu.','Hỗ trợ ra quyết định','Cả A và B đều đúng','Cả A và B đều sai.','Cả A và B đều đúng',6),(96,'Cần tiến hành cập nhật hồ sơ học sinh của nhà trường trong các trường hợp nào sau đây?','Một học sinh mới chuyển từ trường khác đến; thông tin về ngày sinh của một học sinh bị sai.','Sắp xếp danh sách học sinh theo thứ tự tăng dần của tên','Tìm học sinh có điểm môn toán cao nhất khối.','Tính tỉ lệ học sinh trên trung bình môn Tin của từng lớp.','Một học sinh mới chuyển từ trường khác đến; thông tin về ngày sinh của một học sinh bị sai.',6),(97,'Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?','Cung cấp môi trường tạo lập CSDL','Cung cấp môi trường cập nhật và khai thác dữ liệu','Cung cấp công cụ quản lí bộ nhớ','Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL.','Cung cấp công cụ quản lí bộ nhớ',6),(98,'Ngôn ngữ định nghĩa dữ liệu thật chất là:','Ngôn ngữ lập trình Pascal','Ngôn ngữ C','Các kí hiệu toán học dùng để thực hiện các tính toán','Hệ thống các kí hiệu để mô tả CSDL','Hệ thống các kí hiệu để mô tả CSDL',6),(99,'Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép:','Đảm bảo tính độc lập dữ liệu','Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL','Mô tả các đối tượng được lưu trữ trong CSDL','Khai báo kiểu dữ liệu của CSDL','Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL',6),(100,'Access là gì?','Là phần mềm ứng dụng','Là hệ QTCSDL do hãng Microsoft sản xuất','Là phần cứng','Cả A và B','Cả A và B',6),(101,'Access là hệ QT CSDL dành cho:','Máy tính cá nhân','Các mạng máy tính trong mạng toàn cầu','Các máy tính chạy trong mạng cục bộ','Cả A và C','Cả A và C',6),(102,'Các chức năng chính của Access?','Lập bảng','Tính toán và khai thác dữ liệu','Lưu trữ dữ liệu','Ba câu trên đều đúng','Ba câu trên đều đúng',6),(103,'Thành phần cơ sở của Access là:','Table ','Field','Record','Field name','Table ',6),(104,'Chất nào sau đây là chất điện li yếu?','CH<sub>3</sub>COOH.&nbsp;','FeCl<sub>3</sub>.&nbsp; &nbsp;&nbsp;','HNO<sub>3</sub>.&nbsp; &nbsp; &nbsp;&nbsp;','NaCl','CH<sub>3</sub>COOH.&nbsp;',3),(105,'Trong phân tử chất nào sau đây có 1 nhóm amino (NH<sub>2</sub>) và 2 nhóm cacboxyl (COOH)?','Axit fomic.&nbsp; &nbsp;&nbsp;','Axit glutamic.&nbsp; &nbsp;','Alanin.&nbsp; &nbsp; &nbsp;&nbsp;','Lysin','Axit glutamic.&nbsp; &nbsp;',3),(106,'Kim loại nào sau đây thuộc nhóm IA trong bảng tuần hoàn?','Al.&nbsp; &nbsp; &nbsp;','Na.&nbsp;&nbsp;','Fe.&nbsp;','Ba.','Na.&nbsp;&nbsp;',3),(107,'Khi làm thí nghiệm với HNO<sub>3</sub> đặc thường sinh ra khí NO<sub>2</sub> có màu nâu đỏ, độc và gây ô nhiễm môi trường. Tên gọi của NO<sub>2</sub> là','đinitơ pentaoxit.&nbsp; &nbsp; &nbsp;','nitơ đioxit.&nbsp;&nbsp;','đinitơ oxit.&nbsp;','nitơ monooxit.','nitơ đioxit.&nbsp;&nbsp;',3),(108,'Polime nào sau đây có công thức(-CH<sub>2</sub>-CH(CN))<sub>n</sub>?','Poli(metyl metacrylat).&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;','Polietilen.','Poliacrilonitrin.&nbsp; &nbsp;','Poli(vinyl clorua).','Poliacrilonitrin.&nbsp; &nbsp;',3),(109,'Kim loại Mg tác dụng với HCl trong dung dịch tạo ra H<sub>2</sub> và chất nào sau đây?','MgCl<sub>2</sub>.','MgO.&nbsp; &nbsp; &nbsp; &nbsp;','Mg(HCO<sub>3</sub>)<sub>2</sub>.&nbsp; &nbsp;','Mg(OH)<sub>2</sub>.','MgCl<sub>2</sub>.',3),(110,'Axit panmitic là một axit béo có trong mỡ động vật và dầu cọ. Công thức của axit panmitic là','C<sub>3</sub>H<sub>5</sub>(OH)<sub>3</sub>.&nbsp; &nbsp;&nbsp;','CH<sub>3</sub>COOH.','C<sub>15</sub>H<sub>31</sub>COOH.&nbsp; &nbsp;&nbsp;','C<sub>17</sub>H<sub>35</sub>&nbsp;COOH.','C<sub>15</sub>H<sub>31</sub>COOH.&nbsp; &nbsp;&nbsp;',3),(111,'Kim loại nào sau đây điều chế được bằng phương pháp thủy luyện?','Au.&nbsp;&nbsp;','Ca.&nbsp;&nbsp;','Na.&nbsp;','Mg.','Au.&nbsp;&nbsp;',3),(112,'Số oxi hóa của sắt trong hợp chất Fe<sub>2</sub>(SO<sub>4</sub>)<sub>3</sub> là','+1.&nbsp; &nbsp; &nbsp;','+2.&nbsp;&nbsp;','+3.&nbsp;','+6.','+3.&nbsp;',3),(113,'Chất nào sau đây tác dụng với kim loại Na sinh ra khí H<sub>2</sub>?','C<sub>2</sub>H<sub>5</sub>OH.&nbsp; &nbsp;&nbsp;','CH<sub>3</sub>COOCH<sub>3</sub>.&nbsp; &nbsp;','HCHO.&nbsp; &nbsp;','CH<sub>4</sub>.','C<sub>2</sub>H<sub>5</sub>OH.&nbsp; &nbsp;&nbsp;',3),(114,'Khi một nhạc cụ phát ra một âm cơ bản có tần số','(4f_0)','(f_0)','(3f_0)','(2f_0)','(2f_0)',2),(115,'Trong hệ SI, đơn vị của cường độ dòng điện là','oát (W).','ampe (A).','culông (C).','vôn (V).','ampe (A).',2),(116,'Đặt điện áp xoay chiều vào hai đầu đoạn mạch có&nbsp; (R,L,C )&nbsp;mắc nối tiếp thì cảm kháng và dung kháng của đoạn mạch lần lượt là&nbsp; (Z_L) &nbsp;và&nbsp; Điện áp giữa hai đầu đoạn mạch sớm pha hơn cường độ dòng điện trong mạch khi','(Z_L=Z_C/3)','(Z_L.)','(Z_L=Z_C)','(Z_L&gt;Z_C)','(Z_L&gt;Z_C)',2),(117,'Trong y học, tia nào sau đây thường được sử dụng để tiệt trùng các dụng cụ phẫu thuật?','Tia&nbsp; (α)','Tia&nbsp; (γ)','Tia tử ngoại','Tia hồng ngoại','Tia tử ngoại',2),(118,'Trong sự truyền sóng cơ, tốc độ lan truyền dao động trong môi trường được gọi là','bước sóng','biên độ của sóng','năng lượng sóng','tốc độ truyền sóng','tốc độ truyền sóng',2),(119,'Tia laze được dùng','trong y học để chiếu điện, chụp điện','để kiểm tra hành lí của hành khách đi máy bay','để tìm khuyết tật bên trong các vật đúc bằng kim loại','trong các đầu đọc đĩa CD, đo khoảng cách','trong các đầu đọc đĩa CD, đo khoảng cách',2),(120,'Một máy biến áp lí tưởng có số vòng dây của cuộn sơ cấp nhỏ hơn số vòng dây của cuộn thứ cấp. Khi hoạt động ở chế độ có tải, máy biến áp này có tác dụng làm','giảm giá trị hiệu dụng của điện áp xoay chiều','giảm tần số của dòng điện xoay chiều','tăng giá trị hiệu dụng của điện áp xoay chiều','tăng tần số của dòng điện xoay chiều','tăng giá trị hiệu dụng của điện áp xoay chiều',2),(121,'Hiện tượng nào sau đây được ứng dụng để đúc điện?','Hiện tượng nhiệt điện','Hiện tượng điện phân','Hiện tượng siêu dẫn','Hiện tượng đoản mạch','Hiện tượng điện phân',2),(122,'Dao động cưỡng bức có biên độ','không đổi theo thời gian','giảm liên tục theo thời gian','biến thiên điều hòa theo thời gian','tăng liên tục theo thời gian','không đổi theo thời gian',2),(123,'Bộ phận nào sau đây có trong sơ đồ khối của một máy phát thanh vô tuyến đơn giản?','Ống trực chuẩn','Mạch biến điệu','Buồng tối','Mạch chọn sóng','Mạch biến điệu',2),(124,'Trong không gian (mathrm{Oxyz}), mặt cầu ((S):(x+1)^2+(y-2)^2+z^2=9) có bán kính bằng','3','81','9','6','3',1),(125,'Điểm nào dưới đây thuộc đồ thị hàm số (y=x^4+x^2-2)?&nbsp;','Điểm P(-1;-1)','Điểm N(-1;-2)','Điểm M(-1; 0)','Điểm Q(-1; 1)','Điểm M(-1; 0)',1),(126,'Thể tích V của khối cầu bán kính r được tính theo công thức nào dưới đây?','(V=dfrac{1}{3} pi r^3)','(V=2 pi r^3)','(V=4 pi r^3)','(V=dfrac{4}{3} pi r^3)','(V=dfrac{4}{3} pi r^3)',1),(127,'Trên khoảng ((0;+infty)), họ nguyên hàm của hàm số (f(x)=x^{frac{3}{2}}) là:&nbsp;','(displaystyleint f(x) {\rm d} x=dfrac{3}{2} x^{frac{1}{2}}+C)','(displaystyleint f(x) {\rm d} x=dfrac{5}{2} x^{frac{2}{5}}+C)','(displaystyleint f(x) {\rm d} x=dfrac{2}{5} x^{frac{5}{2}}+C)','(displaystyleint f(x) {\rm d} x=dfrac{2}{3} x^{frac{1}{2}}+C)','(displaystyleint f(x) {\rm d} x=dfrac{2}{5} x^{frac{5}{2}}+C)',1),(128,'Tập nghiệm của bất phương trình (2^x>6) là','(left(log _2 6;+inftyight))','((-infty; 3))','((3;+infty))','(left(-infty; log _2 6ight))','(left(log _2 6;+inftyight))',1),(129,'Cho khối chóp có diện tích đáy B=7 và chiều cao h=6. Thể tích của khối chóp đã cho là&nbsp;','42','126','14','56','14',1),(130,'Tập xác định của hàm số (y=x^{sqrt{2}}) là ','(mathbb{R})','(mathbb{R} setminus{0})','((0;+infty))','((2;+infty))','((0;+infty))',1),(131,'Nghiệm của phương trình (log _2(x+4)=3) là&nbsp;','x = 5','x = -5','x = 2','x = 12','x = -5',1),(132,'Nếu (displaystyleint_2^5 f(x) mathrm{d} x=3) và (displaystyleint_2^5 g(x) mathrm{d} x=-2) thì (displaystyleint_2^5left[f(x)+g(x) \right]mathrm{,d}x) bằng','5','-5','1','3','1',1),(133,'Cho số phức z=3-2i, khi đó 2z bằng','6-2i','6-4i','3-4i','-6+4i','6-4i',1),(134,'Cuộc đua xe chỉ được thực hiện khi nào ?','Diễn ra trên đường phố không có người qua lại.','Được người dân ủng hộ.','Được cơ quan có thẩm quyền cấp phép.','Bố, mẹ cho phép','Được cơ quan có thẩm quyền cấp phép.',5),(135,'Người điều khiển phương tiện giao thông đường bộ mà trong cơ thể có chất ma tuý có bị nghiêm cấm hay không ?','Bị nghiêm cấm.','Không bị nghiêm cấm.','Không bị nghiêm cấm, nếu có chất ma tuý ở mức nhẹ, có thể điều khiển phương tiện tham gia giao thông.','Không bị gì cả','Bị nghiêm cấm.',5),(136,'Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào ?','Chỉ bị nhắc nhở.',' Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.','Không bị xử lý hình sự.','Đi tù',' Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.',5),(137,'Theo Luật phòng chống tác hại của rượu, bia, đối tượng nào dưới đây bị cấm sử dụng rượu bia khi tham gia giao thông ?','Người điều khiển: Xe ô tô, xe mô tô, xe đạp, xe gắn máy','Người ngồi phía sau người điều khiển xe cơ giới.','Người đi bộ.','Cả ý 1 và ý 2','Người điều khiển: Xe ô tô, xe mô tô, xe đạp, xe gắn máy',5),(138,'Hành vi điều khiển xe cơ giới chạy quá tốc độ quy định, giành đường, vượt ẩu có bị nghiêm cấm hay không ?','Bị nghiêm cấm tuỳ từng trường hợp.','Không bị nghiêm cấm.','Bị nghiêm cấm..','B và C','Bị nghiêm cấm tuỳ từng trường hợp.',5),(139,'Người điều khiển xe mô tô hai bánh, ba bánh, xe gắn máy có được phép sử dụng xe để kéo hoặc đẩy các phương tiện khác khi tham gia giao thông không ?','Được phép.','Nếu phương tiện được kéo, đẩy có khối lượng nhỏ hơn phương tiện của mình','Tuỳ trường hợp.','Không được phép.','Được phép.',5),(140,'Khi điều khiển xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy, những hành vi buông cả hai tay; sử dụng xe để kéo, đẩy xe khác, vật khác; sử dụng chân chống của xe quệt xuống đường khi xe đang chạy có được phép hay không ?','Được phép.','Tuỳ trường hợp.','Không được phép.','A và B','Không được phép.',5),(141,'Khi điều khiển xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy, những hành vi nào không được phép ?','Buông cả hai tay; sử dụng xe để kéo, đẩy xe khác, vật khác; sử dụng chân chống của xe quệt xuống đường khi xe đang chạy.','Buông một tay; sử dụng xe để chở người hoặc hàng hoá; để chân chạm xuống đất khi khởi hành','Đội mũ bảo hiểm; chạy xe đúng tốc độ quy định và chấp hành đúng quy tắc giao thông đường bộ','Chở người ngồi sau dưới 16 tuổi','Buông cả hai tay; sử dụng xe để kéo, đẩy xe khác, vật khác; sử dụng chân chống của xe quệt xuống đường khi xe đang chạy.',5),(142,'Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang, vác vật cồng kềnh hay không ?','Được mang, vác tuỳ trường hợp cụ thể.','Không được mang, vác.','Được mang, vác nhưng phải đảm bảo an toàn.','Đoán xem','Không được mang, vác.',5),(143,'Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông có được bám, kéo hoặc đẩy các phương tiện khác không ?','Được phép.','Được bám trong trường hợp phương tiện của mình bị hỏng.','Được kéo, đẩy trong trường hợp phương tiện khác bị hỏng.','Không được phép.','Được bám trong trường hợp phương tiện của mình bị hỏng.',5),(144,'Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông có được sử dụng ô khi trời mưa hay không ?','Được sử dụng','Chỉ người ngồi sau được sử dụng.','Không được sử dụng.','Được sử dụng nếu không có áo mưa.','Được sử dụng nếu không có áo mưa.',5),(145,'Khi đang lên dốc người ngồi trên xe mô tô có được kéo theo người đang điều khiển xe đạp hay không ?','Chỉ được phép nếu cả hai đội mũ bảo hiểm.','Không được phép.','Chỉ được thực hiện trên đường thật vắng.','Chỉ được phép khi người đi xe đạp đã quá mệt.','Không được phép.',5),(146,'Hành vi sử dụng xe mô tô để kéo, đẩy xe mô tô khác bị hết xăng đến trạm mua xăng có được phép hay không ?','Chỉ được kéo nếu đã nhìn thấy trạm xăng.','Chỉ được thực hiện trên đường vắng phương tiện cùng tham gia giao thông.','Không được phép.','Đoán xem','Không được phép.',5),(147,'Hành vi vận chuyển đồ vật cồng kềnh bằng xe mô tô, xe gắn máy khi tham gia giao thông có được phép hay không ?',' Không được vận chuyển.','Chỉ được vận chuyển khi đã chằng buộc cẩn thận.','Chỉ được vận chuyển vật cồng kềnh trên xe máy nếu khoảng cách về nhà ngắn hơn 2 km.','Đoán xem','Chỉ được vận chuyển khi đã chằng buộc cẩn thận.',5),(148,'Người ngồi trên xe mô tô 2 bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào ?','Khi tham gia giao thông đường bộ.','Chỉ khi đi trên đường chuyên dùng','đường cao tốc.','Đường quốc lộ','Khi tham gia giao thông đường bộ.',5),(149,'Người điều khiển xe mô tô hai bánh, xe gắn máy có được đi xe dàn hàng ngang; đi xe vào phần đường dành cho người đi bộ và phương tiện khác; sử dụng ô, điện thoại di động, thiết bị âm thanh (trừ thiết bị trợ thính) hay không ?','Được phép nhưng phải đảm bảo an toàn.','Không được phép.','Được phép tùy từng hoàn cảnh, điều kiện cụ thể.','Đoán xem','Không được phép.',5),(150,'Người lái xe phải xử lý như thế nào khi quan sát phía trước thấy người đi bộ đang sang đường tại nơi có vạch đường dành cho người đi bộ để đảm bảo an toàn ?','Giảm tốc độ, đi từ từ để vượt qua trước người đi bộ.','Giảm tốc độ, có thể dừng lại nếu cần thiết trước vạch dừng xe để nhường đường cho người đi bộ qua đường.','Tăng tốc độ để vượt qua trước người đi bộ.','Đi thẳng vào tù','Giảm tốc độ, có thể dừng lại nếu cần thiết trước vạch dừng xe để nhường đường cho người đi bộ qua đường.',5),(151,'Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao, người lái xe cần thực hiện các thao tác nào dưới đây để đảm bảo an toàn ?','Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ.','Nhả hết tay ga, tắt động cơ, sử dụng phanh trước và phanh sau để giảm tốc độ','Sử dụng phanh trước để giảm tốc độ kết hợp với tắt chìa khóa điện của xe.','Max tốc','Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ.',5),(152,'Khi đang lái xe mô tô và ô tô, nếu có nhu cầu sử dụng điện thoại để nhắn tin hoặc gọi điện, người lái xe phải thực hiện như thế nào trong các tình huống nêu dưới đây ?','Giảm tốc độ để đảm bảo an toàn với xe phía trước và sử dụng điện thoại để liên lạc.','Giảm tốc độ để dừng xe ở nơi cho phép dừng xe sau đó sử dụng điện thoại để liên lạc.','Tăng tốc độ để cách xa xe phía sau và sử dụng điện thoại để liên lạc.','Dừng xe và nghe điện thoại','Giảm tốc độ để đảm bảo an toàn với xe phía trước và sử dụng điện thoại để liên lạc.',5),(153,'Trong các khái niệm dưới đây, “dải phân cách” được hiểu như thế nào là đúng?','Là bộ phận của đường để ngăn cách không cho các loại xe vào những nơi không được phép.','Là bộ phận của đường để phân tách phần đường xe chạy và hành lang an toàn giao thông.','Là bộ phận của đường để phân chia mặt đường thành hai chiều xe chạy riêng biệt hoặc để phân chia phần đường của xe cơ giới và xe thô sơ.','','Là bộ phận của đường để phân chia mặt đường thành hai chiều xe chạy riêng biệt hoặc để phân chia phần đường của xe cơ giới và xe thô sơ.',5);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_question` BEFORE DELETE ON `question` FOR EACH ROW begin
	delete from exam_question where question_id = OLD.question_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL,
  `subject_name` varchar(45) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Toán'),(2,'Lý'),(3,'Hóa'),(4,'IT'),(5,'Bằng Lái Xe'),(6,'Tin Học');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

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
  `image` varchar(255) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_account_idx` (`username`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Phạm Tấn Nhạc','nhacpham1@gmail.com','0816569931','Huế, Việt Nam','https://firebasestorage.googleapis.com/v0/b/quizgym-f6283.appspot.com/o/nhac1nhac.png?alt=media&token=32083eb8-1f5d-4a04-abda-8aab0001fd13','nhac1'),(2,'Phạm Tấn Nhạc','nhacpham2@gmail.com','0816569932','Huế, Việt Nam','https://firebasestorage.googleapis.com/v0/b/quizgym-f6283.appspot.com/o/nhac2nhac.png?alt=media&token=8a7dccb6-bbb3-48de-be81-7ad2e5628bf8','nhac2'),(3,'Hoàng Hiếu','hoanghieu1@gmail.com','0816569933','Đà Nẵng, Việt Nam','https://firebasestorage.googleapis.com/v0/b/quizgym-f6283.appspot.com/o/hieu1hieu.png?alt=media&token=bf61663e-1e15-4ff5-a29d-4498ac7c5f09','hieu1'),(4,'Hoàng Hiếu','hoanghieu2@gmail.com','0816569934','Đà Nẵng, Việt Nam','admin_profile.svg','hieu2'),(5,'Hồng Sơn','danghongson0807@gmail.com','0816569936','Quảng Nam, Việt Nam','https://firebasestorage.googleapis.com/v0/b/quizgym-f6283.appspot.com/o/hongson1narutossagemode-15944657133061535033027%20(1).jpg?alt=media&token=5a454a39-6bc8-4885-99cd-4744fbbe8c15','hongson1'),(6,'Đặng Hồng Sơn','hongson2@gmail.com','0816569935','Quảng Nam, Việt Nam','admin_profile.svg','hongson2'),(7,'Hồng Nhung','hongnhung1@gmail.com','0816569936','Quảng Nam, Việt Nam','admin_profile.svg','nhung1'),(8,'Hồng Nhung','hongnhung2@gmail.com','0816569936','Quảng Nam, Việt Nam','admin_profile.svg','nhung2'),(9,'Thành Danh','thanhdanh1@gmail.com','0816569936','Quảng Nam, Việt Nam','admin_profile.svg','danh1'),(10,'Thành Danh','thanhdanh2@gmail.com','0816569936','Quảng Nam, Việt Nam','admin_profile.svg','danh2'),(11,'Mỹ Vân','myvan1@gmail.com','081656999','Quảng Nam, Việt Nam','admin_profile.svg','van1'),(12,'Mỹ Vân','myvan2@gmail.com','0816569988','Quảng Nam, Việt Nam','admin_profile.svg','van2'),(13,'Thu Thảo','thuthao1@gmail.com','081656999','Quảng Nam, Việt Nam','admin_profile.svg','thao1'),(14,'Thu Thảo','thuthao2@gmail.com','0816569988','Quảng Nam, Việt Nam','admin_profile.svg','thao2'),(15,'Tấn Dũng','tandung1@gmail.com','081656999','Quảng Nam, Việt Nam','admin_profile.svg','dung1'),(16,'Tấn Dũng','tandung2@gmail.com','0816569988','Quảng Nam, Việt Nam','admin_profile.svg','dung2'),(24,'Dang Chi Trung','trung.dang@codegym.vn','012048848512','Da Nang','admin_profile.svg','trungdc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `username` varchar(45) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`username`,`role_id`),
  KEY `fk_user_role_idx` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_role_account` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('danh1',1),('dung1',1),('hieu1',1),('hongson1',1),('nhac1',1),('nhung1',1),('thao1',1),('van1',1),('danh2',2),('dung2',2),('hieu2',2),('hongson2',2),('nhac2',2),('nhung2',2),('thao2',2),('trungdc',2),('van2',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quiz_web'
--

--
-- Dumping routines for database 'quiz_web'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(in in_user_id int)
BEGIN
	Declare in_username varchar(45);
    SET SQL_SAFE_UPDATES = 0;
    SET in_username = (Select username from `user` where user_id = in_user_id);
    select in_username;
    Delete from assignment where user_id = in_user_id;
    Delete from accumulated_point where user_id = in_user_id;
	Delete from `user` where user_id = in_user_id ;
    Delete from user_role where username = in_username;
    Delete from `account` where username = in_username;
    SET SQL_SAFE_UPDATES = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMember`(
	IN in_user_id int,
	IN in_name varchar(45),
    IN in_email varchar(45),
    IN in_phone varchar(45),
    IN in_address varchar(45),
    IN in_username varchar(45),
    IN in_role_id int)
BEGIN

      Update user_role
      set role_id =  in_role_id
      where username = in_username;

      Update `user`
      set `name` = in_name, email = in_email, phone = in_phone, address = in_address
      where user_id = in_user_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-04  8:31:56
