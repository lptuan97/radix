-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: phponline_radix_v2
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT 0,
  `content` text DEFAULT NULL,
  `view_count` int(11) DEFAULT 0,
  `thumbnail` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`),
  CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (3,'Hà Nội: Đông nghịt người quét QR Code tại &#34;ổ dịch&#34; Phú Đô','ha-noi-dong-nghit-nguoi-quet-qr-code-tai-o-dich-phu-do',3,4,'&#60;p&#62;&#60;em&#62;Th&#38;acirc;n &#38;aacute;i gửi c&#38;aacute;c thầy gi&#38;aacute;o, c&#38;ocirc; gi&#38;aacute;o, c&#38;aacute;n bộ quản l&#38;yacute;, người lao động c&#38;aacute;c trường đại học thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep.htm&#34;&#62;gi&#38;aacute;o dục&#60;/a&#62;&#38;nbsp;nghề nghiệp tr&#38;ecirc;n to&#38;agrave;n quốc.&#60;/em&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Nh&#38;acirc;n ng&#38;agrave;y Nh&#38;agrave; gi&#38;aacute;o Việt Nam 20/11, thay mặt L&#38;atilde;nh đạo Bộ, t&#38;ocirc;i th&#38;acirc;n &#38;aacute;i gửi tới c&#38;aacute;c thầy c&#38;ocirc; gi&#38;aacute;o c&#38;aacute;c trường đại học, cao đẳng thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở gi&#38;aacute;o dục nghề nghiệp to&#38;agrave;n quốc, lời thăm hỏi &#38;acirc;n cần, lời ch&#38;uacute;c mừng tốt đẹp nhất!&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Năm học vừa qua, trước những t&#38;aacute;c động của đại dịch Covid-19, c&#38;aacute;c thầy, c&#38;ocirc; gi&#38;aacute;o đ&#38;atilde; nỗ lực vượt qua nhiều kh&#38;oacute; khăn, th&#38;aacute;ch thức, chủ động, s&#38;aacute;ng tạo triển khai đổi mới m&#38;ocirc; h&#38;igrave;nh v&#38;agrave; phương ph&#38;aacute;p dạy v&#38;agrave; học, gắn kết nh&#38;agrave; trường với doanh nghiệp, gắn&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep/tuyen-sinh.htm&#34;&#62;tuyển sinh&#60;/a&#62;&#38;nbsp;với nhu cầu của thị trường lao động, tạo sự thay đổi s&#38;acirc;u sắc trong nhận thức x&#38;atilde; hội việc lựa chọn học nghề để lập th&#38;acirc;n, lập nghiệp.&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',0,'/radix/uploads/files/rung-sac-can-gio-ivv-204x153.jpg','UBND phường Phú Đô (Nam Từ Liêm, Hà Nội) thiết lập các chốt kiểm soát người ra vào địa bàn. Do lượng người tập trung quét mã QR sáng 18/11 đông, đã gây nên cảnh ùn ứ, tắc nghẽn giao thông 2',2,'2021-11-18 12:34:18','2025-05-10 19:56:01'),(5,'Hà Nội: Đông nghịt người quét QR Code tại &#34;ổ dịch&#34; Phú Đô (2)','ha-noi-dong-nghit-nguoi-quet-qr-code-tai-o-dich-phu-do',3,4,'&#60;p&#62;&#60;em&#62;Th&#38;acirc;n &#38;aacute;i gửi c&#38;aacute;c thầy gi&#38;aacute;o, c&#38;ocirc; gi&#38;aacute;o, c&#38;aacute;n bộ quản l&#38;yacute;, người lao động c&#38;aacute;c trường đại học thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep.htm&#34;&#62;gi&#38;aacute;o dục&#60;/a&#62;&#38;nbsp;nghề nghiệp tr&#38;ecirc;n to&#38;agrave;n quốc.&#60;/em&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Nh&#38;acirc;n ng&#38;agrave;y Nh&#38;agrave; gi&#38;aacute;o Việt Nam 20/11, thay mặt L&#38;atilde;nh đạo Bộ, t&#38;ocirc;i th&#38;acirc;n &#38;aacute;i gửi tới c&#38;aacute;c thầy c&#38;ocirc; gi&#38;aacute;o c&#38;aacute;c trường đại học, cao đẳng thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở gi&#38;aacute;o dục nghề nghiệp to&#38;agrave;n quốc, lời thăm hỏi &#38;acirc;n cần, lời ch&#38;uacute;c mừng tốt đẹp nhất!&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Năm học vừa qua, trước những t&#38;aacute;c động của đại dịch Covid-19, c&#38;aacute;c thầy, c&#38;ocirc; gi&#38;aacute;o đ&#38;atilde; nỗ lực vượt qua nhiều kh&#38;oacute; khăn, th&#38;aacute;ch thức, chủ động, s&#38;aacute;ng tạo triển khai đổi mới m&#38;ocirc; h&#38;igrave;nh v&#38;agrave; phương ph&#38;aacute;p dạy v&#38;agrave; học, gắn kết nh&#38;agrave; trường với doanh nghiệp, gắn&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep/tuyen-sinh.htm&#34;&#62;tuyển sinh&#60;/a&#62;&#38;nbsp;với nhu cầu của thị trường lao động, tạo sự thay đổi s&#38;acirc;u sắc trong nhận thức x&#38;atilde; hội việc lựa chọn học nghề để lập th&#38;acirc;n, lập nghiệp.&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',101,'/radix/uploads/files/26862-2-670x446.jpg','UBND phường Phú Đô (Nam Từ Liêm, Hà Nội) thiết lập các chốt kiểm soát người ra vào địa bàn. Do lượng người tập trung quét mã QR sáng 18/11 đông, đã gây nên cảnh ùn ứ, tắc nghẽn giao thông 2',2,'2021-11-18 13:01:31','2025-05-10 19:55:43'),(6,'Hà Nội: Đông nghịt người quét QR Code tại &#34;ổ dịch&#34; Phú Đô (2) (2)','ha-noi-dong-nghit-nguoi-quet-qr-code-tai-o-dich-phu-do',3,4,'&#60;p&#62;&#60;em&#62;Th&#38;acirc;n &#38;aacute;i gửi c&#38;aacute;c thầy gi&#38;aacute;o, c&#38;ocirc; gi&#38;aacute;o, c&#38;aacute;n bộ quản l&#38;yacute;, người lao động c&#38;aacute;c trường đại học thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep.htm&#34;&#62;gi&#38;aacute;o dục&#60;/a&#62;&#38;nbsp;nghề nghiệp tr&#38;ecirc;n to&#38;agrave;n quốc.&#60;/em&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Nh&#38;acirc;n ng&#38;agrave;y Nh&#38;agrave; gi&#38;aacute;o Việt Nam 20/11, thay mặt L&#38;atilde;nh đạo Bộ, t&#38;ocirc;i th&#38;acirc;n &#38;aacute;i gửi tới c&#38;aacute;c thầy c&#38;ocirc; gi&#38;aacute;o c&#38;aacute;c trường đại học, cao đẳng thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở gi&#38;aacute;o dục nghề nghiệp to&#38;agrave;n quốc, lời thăm hỏi &#38;acirc;n cần, lời ch&#38;uacute;c mừng tốt đẹp nhất!&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Năm học vừa qua, trước những t&#38;aacute;c động của đại dịch Covid-19, c&#38;aacute;c thầy, c&#38;ocirc; gi&#38;aacute;o đ&#38;atilde; nỗ lực vượt qua nhiều kh&#38;oacute; khăn, th&#38;aacute;ch thức, chủ động, s&#38;aacute;ng tạo triển khai đổi mới m&#38;ocirc; h&#38;igrave;nh v&#38;agrave; phương ph&#38;aacute;p dạy v&#38;agrave; học, gắn kết nh&#38;agrave; trường với doanh nghiệp, gắn&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep/tuyen-sinh.htm&#34;&#62;tuyển sinh&#60;/a&#62;&#38;nbsp;với nhu cầu của thị trường lao động, tạo sự thay đổi s&#38;acirc;u sắc trong nhận thức x&#38;atilde; hội việc lựa chọn học nghề để lập th&#38;acirc;n, lập nghiệp.&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',209,'/radix/uploads/files/26862-2-670x446.jpg','UBND phường Phú Đô (Nam Từ Liêm, Hà Nội) thiết lập các chốt kiểm soát người ra vào địa bàn. Do lượng người tập trung quét mã QR sáng 18/11 đông, đã gây nên cảnh ùn ứ, tắc nghẽn giao thông 2',2,'2025-05-10 19:56:10',NULL),(7,'Hà Nội: Đông nghịt người quét QR','ha-noi-dong-nghit-nguoi-quet-qr',3,4,'&#60;p&#62;&#60;em&#62;Th&#38;acirc;n &#38;aacute;i gửi c&#38;aacute;c thầy gi&#38;aacute;o, c&#38;ocirc; gi&#38;aacute;o, c&#38;aacute;n bộ quản l&#38;yacute;, người lao động c&#38;aacute;c trường đại học thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep.htm&#34;&#62;gi&#38;aacute;o dục&#60;/a&#62;&#38;nbsp;nghề nghiệp tr&#38;ecirc;n to&#38;agrave;n quốc.&#60;/em&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Nh&#38;acirc;n ng&#38;agrave;y Nh&#38;agrave; gi&#38;aacute;o Việt Nam 20/11, thay mặt L&#38;atilde;nh đạo Bộ, t&#38;ocirc;i th&#38;acirc;n &#38;aacute;i gửi tới c&#38;aacute;c thầy c&#38;ocirc; gi&#38;aacute;o c&#38;aacute;c trường đại học, cao đẳng thuộc Bộ LĐ-TB&#38;amp;XH v&#38;agrave; c&#38;aacute;c cơ sở gi&#38;aacute;o dục nghề nghiệp to&#38;agrave;n quốc, lời thăm hỏi &#38;acirc;n cần, lời ch&#38;uacute;c mừng tốt đẹp nhất!&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Năm học vừa qua, trước những t&#38;aacute;c động của đại dịch Covid-19, c&#38;aacute;c thầy, c&#38;ocirc; gi&#38;aacute;o đ&#38;atilde; nỗ lực vượt qua nhiều kh&#38;oacute; khăn, th&#38;aacute;ch thức, chủ động, s&#38;aacute;ng tạo triển khai đổi mới m&#38;ocirc; h&#38;igrave;nh v&#38;agrave; phương ph&#38;aacute;p dạy v&#38;agrave; học, gắn kết nh&#38;agrave; trường với doanh nghiệp, gắn&#38;nbsp;&#60;a href=&#34;https://dantri.com.vn/giao-duc-huong-nghiep/tuyen-sinh.htm&#34;&#62;tuyển sinh&#60;/a&#62;&#38;nbsp;với nhu cầu của thị trường lao động, tạo sự thay đổi s&#38;acirc;u sắc trong nhận thức x&#38;atilde; hội việc lựa chọn học nghề để lập th&#38;acirc;n, lập nghiệp.&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',94,'/radix/uploads/files/images.jpg','UBND phường Phú Đô (Nam Từ Liêm, Hà Nội) thiết lập các chốt kiểm soát người ra vào địa bàn. Do lượng người tập trung quét mã QR sáng 18/11 đông, đã gây nên cảnh ùn ứ, tắc nghẽn giao thông 2',1,'2025-05-10 19:56:13','2025-05-10 19:57:00');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blog_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (3,'Kiến thức',NULL,3,1,'2021-11-17 15:08:47',NULL),(4,'Tin thị trường',NULL,3,1,'2021-11-17 15:08:54','2021-11-17 15:10:48'),(8,'Chia sẻ kinh nghiệm','chia-se-kinh-nghiem-2',3,0,'2021-11-17 15:16:40','2021-11-17 15:18:20');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `blog_id` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 0 COMMENT '0: Chưa duyệt 1: Đã duyệt',
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,'Quốc NGuyễn','lephamtuan08@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','Đây là nội dung bình luận của quốc nguyễn',0,7,NULL,1,'2025-05-11 22:16:03',NULL),(3,'Dịch vụ 1','tuanle@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','INSERT INTO `comments`(name, email, website, content, parent_id, blog_id, user_id, status, create_at) VALUES(:name, :email, :website, :content, :parent_id, :blog_id, :user_id, :status, :create_at)INSERT INTO `comments`(name, email, website, content, parent_id, blog_id, user_id, status, create_at) VALUES(:name, :email, :website, :content, :parent_id, :blog_id, :user_id, :status, :create_at)',0,7,NULL,1,'2025-05-11 22:16:41',NULL),(4,'Dịch vụ 1','tuanle@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','INSERT INTO `comments`(name, email, website, content, parent_id, blog_id, user_id, status, create_at) VALUES(:name, :email, :website, :content, :parent_id, :blog_id, :user_id, :status, :create_at)INSERT INTO `comments`(name, email, website, content, parent_id, blog_id, user_id, status, create_at) VALUES(:name, :email, :website, :content, :parent_id, :blog_id, :user_id, :status, :create_at)',0,7,NULL,1,'2025-05-11 22:19:05',NULL),(5,'Tuân Phạm','lephamtuan08@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','Chúng ta là kẻ thảm hại',0,6,NULL,1,'2025-05-11 22:26:08',NULL),(6,'Tuân Phạm','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','dfasdfasdfa fasdf sad',0,5,NULL,1,'2025-05-11 22:28:06',NULL),(7,'Tuân Phạm','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','dfasdfasdfa fasdf sad',0,5,NULL,1,'2025-05-11 22:30:39',NULL),(8,'Tuân Phạm','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','dfasdfasdfa fasdf sad',0,5,NULL,1,'2025-05-11 22:31:16',NULL),(9,'Dự án 1sss','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','ccccc c c c  c c c c cc c c c c cccccccc',0,5,NULL,1,'2025-05-11 22:32:34',NULL),(10,'Dự án 1sss','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','ccccc c c c  c c c c cc c c c c cccccccc',0,5,NULL,1,'2025-05-11 22:34:39',NULL),(11,'Dự án 1sss','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','ádasdádasd',0,NULL,NULL,1,'2025-05-11 23:13:57',NULL),(12,'Dự án 1sss','lephamtuan97@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','ádasdádasd',0,7,NULL,1,'2025-05-11 23:14:37',NULL),(13,'Tuân Phạm','lephamutna@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','Chúng ta của tương lai',0,7,NULL,1,'2025-05-11 23:24:05',NULL),(14,'Tuân Nguyễn','lephamtuan08@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','Chúng ta của hiện tại',0,6,NULL,1,'2025-05-12 00:01:03',NULL),(15,'Tuân Nguyễn','lephamtuan08@gmail.com','https://drive.google.com/file/d/1MXLp0YjIhHypngd4CxZNiU19PGHR6Dm-/view','Chúng ta của hiện tại',0,6,NULL,1,'2025-05-12 00:01:10',NULL),(16,'WonBin','Wonbin@gmail.com','https://www.google.com.vn/','some form, by injected humour, or randomised words Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas',0,6,NULL,1,'2025-05-12 00:02:25',NULL),(17,'Ben 10','ben10@gmail.com','https://www.google.com.vn/','asdfasd asdfla;sdkf ;lasd ;asd;lasdkf',0,6,NULL,1,'2025-05-12 18:10:45',NULL),(19,'Tuân Phạm','lephamtuan97@gmail.com','https://www.google.com.vn/','some form, by injected humour, or randomised words Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formassome form, by injected humour, or randomised words Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas',16,6,NULL,1,'2025-05-12 18:56:02',NULL),(20,'Phạm trưởng','admin@gmail.com','https://www.google.com.vn/','Ở lại em nhé, ngày mai anh sẽ về&#13;&#10;Anh chỉ mang nỗi nhớ em thêm xa&#13;&#10;Mang đợi chờ, thêm dài ngắn&#13;&#10;Anh chỉ thêm kỉ niệm là những chuyến đi',15,6,NULL,1,'2025-05-12 18:57:59',NULL),(21,'No Name','lephamtuan97@gmail.com','https://www.google.com.vn/','sdasdfasdfasdfa sdfasdfsa',0,6,NULL,1,'2025-05-12 18:59:28',NULL),(22,'Gia Bảo','giabao@gmail.com','https://www.google.com.vn/','Gia bảo bình luận nè',0,6,NULL,1,'2025-05-12 19:30:43',NULL),(23,'Lee Phạm Tuân','lephamtuan97@gmail.com','','Comment test userId có tồn tại',0,6,6,1,'2025-05-12 20:21:21',NULL),(24,'Lee Phạm Tuân','lephamtuan97@gmail.com','','Trả lời userId có tồn tại',23,6,6,1,'2025-05-12 20:21:40',NULL),(25,'Gia Bảo','giabao@gmail.com','https://www.google.com.vn/','Trả lời user ID không tồn tại',24,6,NULL,0,'2025-05-12 20:22:47',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (1,'Kinh doanh',1,NULL,NULL),(3,'Kế toán - Tài chính',2,'2021-11-25 16:03:22','2021-11-25 16:06:31');
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `message` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0: Chưa xử lý 1: Đang xử lý 2: Đã xử lý',
  `note` text DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `contact_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Hoàng An','hoangan.web@gmail.com',1,'Tôi muón hỏi giá',0,'Khách hàng muốn mua sản phẩm giá rẻ','2021-11-25 02:00:00','2025-05-06 21:11:23'),(3,'Lê Phạm Tuân','lephamtuan97@gmail.com',3,'Đây là nội dung phải lớn hơn hoặc bằng mười ký tự',0,'','2025-05-13 00:34:24','2025-05-13 00:36:40');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `permission` text DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Super Admin',NULL,'2021-11-02 00:00:00',NULL),(2,'Admin',NULL,'2021-11-01 00:00:00',NULL),(3,'Manager',NULL,'2021-11-01 00:00:00',NULL),(4,'Staff',NULL,'2021-11-01 00:00:00',NULL),(5,'Sale',NULL,'2021-11-01 00:00:00',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_token`
--

DROP TABLE IF EXISTS `login_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0,
  `token` varchar(100) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_token`
--

LOCK TABLES `login_token` WRITE;
/*!40000 ALTER TABLE `login_token` DISABLE KEYS */;
INSERT INTO `login_token` VALUES (37,6,'81acb1b91278e3220646bdd906a37945522820d7','2025-05-12 21:33:19');
/*!40000 ALTER TABLE `login_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opt_key` varchar(100) DEFAULT NULL,
  `opt_value` text DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'general_hotline','0123456789','Hotline công ty'),(2,'general_email','contact@lee.vn','Email'),(3,'general_time','09:00 am - 05:00 pm','Thời gian làm việc'),(4,'header_logo','/radix/uploads/images/logo.png','Logo công ty'),(5,'general_sitename','Logo','Site name'),(6,'general_facebook','fb.com','Facebook'),(7,'general_twitter','tw.com','Twitter'),(8,'general_linkedin','link.com','Linkedin'),(9,'general_behance','behance.com','Behance'),(10,'general_youtube','youtube.com/lpt97','Youtube'),(11,'general_sitedesc','sitedesc','Sitedesc'),(12,'header_search_placeholder','Hãy nhập từ khóa tìm kiếm','Tìm kiếm'),(13,'header_favicon','favicon','Header favicon'),(14,'header_quote_text','Logo','Header_quote_text'),(15,'header_quote_link','radix/uploads/images/logo','Header quote link'),(16,'home_slide','[{\"slide_title\":\"Ti\\u00eau \\u0111\\u1ec1 slide 1\",\"slide_button_text\":\"Xem th\\u00eam\",\"slide_button_link\":\"http:\\/\\/xemthem.com\",\"slide_video\":\"http:\\/\\/www.youtube.com\\/lops\",\"slide_image_1\":\"\\/radix\\/uploads\\/images\\/c4b5a64b-31ec-4c15-b6e6-e61e83625fc7.jpg\",\"slide_image_2\":\"\\/radix\\/uploads\\/images\\/adcf41da-5669-4544-b19f-da11625bfb2e(1).jpg\",\"slide_desc\":\"mo ta\",\"slide_bg\":\"\\/radix\\/uploads\\/images\\/zpers.jpg\",\"slide_position\":\"left\"},{\"slide_title\":\"Ti\\u00eau \\u0111\\u1ec1 slide 2\",\"slide_button_text\":\"xem th\\u00eam 2\",\"slide_button_link\":\"http:\\/\\/xemthemabc.com\",\"slide_video\":\"http:\\/\\/www.youtube.com\\/lopsssss\",\"slide_image_1\":\"\\/radix\\/uploads\\/images\\/adcf41da-5669-4544-b19f-da11625bfb2e(1).jpg\",\"slide_image_2\":\"\\/radix\\/uploads\\/images\\/logo.png\",\"slide_desc\":\"ssssszzzz\",\"slide_bg\":\"\\/radix\\/uploads\\/images\\/c4b5a64b-31ec-4c15-b6e6-e61e83625fc7.jpg\",\"slide_position\":\"center\"}]','Home slide'),(17,'home_about','{\"infomation\":{\"title_bg\":\"Gi\\u1edbi thi\\u1ec7u c\\u00f4ng ty c\\u1ee7a ch\\u00fang t\\u00f4i\",\"desc\":\"&#60;h2&#62;We are professional website design &#38;amp; development company!&#60;\\/h2&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#38;nbsp;&#60;\\/p&#62;&#13;&#10;\",\"image\":\"\\/radix\\/uploads\\/images\\/zpers.jpg\",\"video\":\"yutaa\",\"content\":\"&#60;p&#62;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. You think water moves fast? You should see ice.&#60;\\/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a weeked do incididunt magna Lorem&#60;\\/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalancip isicing elit, sed do eiusmod tempor incididunt&#60;\\/p&#62;&#13;&#10;\"},\"skill\":[{\"name\":\"Ti\\u1ebfng anh\",\"value\":\"26\"},{\"name\":\"Ti\\u1ebfng ph\\u00e1p\",\"value\":\"67\"},{\"name\":\"T\\u00e2y ban nha\",\"value\":\"86\"}]}','Home about'),(18,'home_service_title_bg','Service','home_service_title_bg'),(19,'home_service_title','What we provide 1','home_service_title'),(20,'home_service_desc','Sed lorem enim, faucibus at erat eget, laoreet tincidunt tortor. Ut sed mi nec ligula bibendum aliquam. Sed scelerisque maximus magna, a vehicula turpis Proin','home_service_desc'),(21,'home_fact_title','With smooth animation numbering c','Tên thành tựu'),(22,'home_fact_sub_title','Our achievements c','Sub title'),(23,'home_fact_desc','Pellentesque vitae gravida nulla. Maecenas molestie ligula quis urna viverra venenatis. Donec at ex metus. Suspendisse ac est et magna viverra eleifend. Etiam varius auctor est eu eleifend.','home_fact_desc'),(24,'home_fact_button_text','Liên hệ với tao','home_fact_button_text'),(25,'home_fact_button_link','httt://tourfasdfasd.com','home_fact_button_link'),(26,'home_fact_year_number','35','home_fact_year_number'),(27,'home_fact_project_number','88','home_fact_project_number'),(28,'home_fact_earn_number','10000','home_fact_earn_number'),(29,'home_fact_award_number','32','home_fact_award_number'),(30,'home_portfolio_title','Our Portfolio C','home_portfolio_title'),(31,'home_portfolio_title_bg','Portfolio','home_portfolio_title_bg'),(32,'home_portfolio_desc','Sed lorem enim, faucibus at erat eget, laoreet tincidunt tortor. Ut sed mi nec ligula bibendum aliquam. Sed scelerisque maximus magna, a vehicula turpis Proin','home_portfolio_desc'),(33,'home_portfolio_more_link','home_portfolio_more_link','home_portfolio_more_link'),(34,'home_portfolio_more_text','home_portfolio_more_text','home_portfolio_more_text'),(35,'home_cta_content','&#60;h2&#62;We have 35+ Years of experiences for creating creative website project.&#60;/h2&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Maecenas sapien erat, porta non porttitor non, dignissim et enim. Aenean ac enim feugiat, facilisis arcu vehicula, consequat sem. Cras et vulputate nisi, ac dignissim mi. Etiam laoreet&#60;/p&#62;&#13;&#10;','home_cta_content'),(36,'home_cta_button_text','Mua đi','home_cta_button_text'),(37,'home_cta_button_link','#','home_cta_button_link'),(38,'home_blog_title','Latest Blogs','home_blog_title'),(39,'home_blog_title_bg','News','home_blog_title_bg'),(40,'home_blog_desc','Sed lorem enim, faucibus at erat eget, laoreet tincidunt tortor. Ut sed mi nec ligula bibendum aliquam. Sed scelerisque maximus magna, a vehicula turpis Proin','home_blog_desc'),(41,'home_partner_title','Our Partners','home_partner_title'),(42,'home_partner_title_bg','Client','home_partner_title_bg'),(43,'home_partner_desc','Sed lorem enim, faucibus at erat eget, laoreet tincidunt tortor. Ut sed mi nec ligula bibendum aliquam. Sed scelerisque maximus magna, a vehicula turpis Proin','home_partner_desc'),(44,'home_partner_content','[{\"logo\":\"\\/radix\\/uploads\\/images\\/partner-2.png\",\"link\":\"#\"},{\"logo\":\"\\/radix\\/uploads\\/images\\/partner-3.png\",\"link\":\"\"},{\"logo\":\"\\/radix\\/uploads\\/images\\/partner-4.png\",\"link\":\"\"},{\"logo\":\"\\/radix\\/uploads\\/images\\/partner-5.png\",\"link\":\"\"},{\"logo\":\"\\/radix\\/uploads\\/images\\/partner-6.png\",\"link\":\"\"},{\"logo\":\"\\/radix\\/uploads\\/images\\/partner-5.png\",\"link\":\"\"}]','home_partner_content'),(45,'footer_1_title','Office Location','footer_1_title'),(46,'footer_1_content','&#60;p&#62;Maecenas sapien erat, porta non porttitor non, dignissim et enim.&#60;/p&#62;&#13;&#10;','footer_1_content'),(47,'footer_2_title','Quick Links','footer_2_title'),(48,'footer_2_content','&#60;p&#62;&#60;a href=&#34;http://localhost/radix/about-us.html&#34;&#62;About Our Company&#60;/a&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#60;a href=&#34;http://localhost/radix/services.html&#34;&#62;Our Latest services&#60;/a&#62;&#60;/p&#62;&#13;&#10;','footer_2_content'),(49,'footer_3_title','Recent Tweets','footer_3_title'),(50,'footer_3_twitter','@RadixMauris sagittis nibh et nibh commodo vehicula. Praesent blandit nulla nec tristique egestas. Integer in volutpat turpis','footer_3_twitter'),(51,'footer_4_title','Newsletter','footer_4_title'),(52,'footer_4_content','&#60;p&#62;consectetur adipiscing elit. Vestibulum vel sapien et lacus tempus varius. In finibus lorem vel.&#60;/p&#62;&#13;&#10;','footer_4_content'),(53,'footer_copyright','&#60;p&#62;2020 All Right Reserved. Design &#38;amp; Development By&#38;nbsp;&#60;a href=&#34;http://themelamp.com/&#34; target=&#34;_blank&#34;&#62;ThemeLamp.com&#60;/a&#62;, Theme Provided By&#38;nbsp;&#60;a href=&#34;https://codeglim.com/&#34; target=&#34;_blank&#34;&#62;CodeGlim.com&#60;/a&#62;&#60;/p&#62;&#13;&#10;','footer_copyright'),(54,'about_title','Giới thiệu công ty','Tiêu đề giới thiệu'),(55,'team_title','Đội hình chúng tôi','team_title'),(56,'team_primary_title','The Avenger','team_primary_title'),(57,'team_title_bg','The avenger bg','team_title_bg'),(58,'team_desc','Sed lorem enim, faucibus at erat eget, laoreet tincidunt tortor. Ut sed mi nec ligula bibendum aliquam. Sed scelerisque maximus magna, a vehicula turpis Proin','team_desc'),(59,'team_content','[{\"name\":\"L\\u00ea Ph\\u1ea1m Tu\\u00e2n\",\"position\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"image\":\"\\/radix\\/uploads\\/images\\/logo.png\",\"facebook\":\"link2\",\"twitter\":\"link1\",\"linkedin\":\"link3\",\"behance\":\"behance.com\"}]','team_content'),(60,'service_title','Dịch vụ','service_title'),(61,'blog_title',NULL,'blog_title'),(62,'blog_per_page',NULL,'blog_per_page'),(63,'menu','[{&#34;text&#34;:&#34;Trang chủ&#34;,&#34;href&#34;:&#34;http://localhost/radix/&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;},{&#34;text&#34;:&#34;Giới thiệu&#34;,&#34;href&#34;:&#34;#&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;,&#34;children&#34;:[{&#34;text&#34;:&#34;Giới thiệu chung&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=page-template&#38;action=about&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;},{&#34;text&#34;:&#34;Đội ngủ&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=page-template&#38;action=team&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;}]},{&#34;text&#34;:&#34;Dịch vụ&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=services&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;},{&#34;text&#34;:&#34;Dự án&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=portfolios&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;portfolios&#34;},{&#34;text&#34;:&#34;Blog&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=blog&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;,&#34;children&#34;:[{&#34;text&#34;:&#34;Hà Nội: Đông nghịt người quét QR&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=blog&#38;action=detail&#38;id=7&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;}]},{&#34;text&#34;:&#34;Liên hệ&#34;,&#34;href&#34;:&#34;http://localhost/radix/?module=page-template&#38;action=contact&#34;,&#34;target&#34;:&#34;_self&#34;,&#34;title&#34;:&#34;&#34;}]','menu');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Hướng dẫn mua hàng','huong-dan-mua-hang','Đang cập nhật...',3,2,'2021-11-14 00:00:00',NULL),(2,'Phương thức thanh toán','phuong-thuc-thanh-toan','Đang cập nhật...',3,1,'2021-11-14 00:00:00',NULL),(4,'Hướng dẫn mua hàng (1)','huong-dan-mua-hang','Đang cập nhật...',3,0,'2021-11-14 23:41:06',NULL),(5,'Phương thức thanh toán (1)','phuong-thuc-thanh-toan','Đang cập nhật...',3,0,'2021-11-14 23:41:11',NULL),(6,'Hướng dẫn mua hàng (2)','huong-dan-mua-hang','Đang cập nhật...',3,1,'2021-11-14 23:41:14',NULL),(7,'Chính sách bảo mật','chinh-sach-bao-mat','&#60;p&#62;Nội dung l&#38;agrave; g&#38;igrave;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#60;strong&#62;sadfasfasdfs&#60;/strong&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#38;nbsp;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;div style=&#34;background:#eeeeee; border:1px solid #cccccc; padding:5px 10px&#34;&#62;&#60;strong&#62;&#60;span style=&#34;background-color:#e74c3c&#34;&#62;adfasdfasdf&#60;/span&#62;&#60;/strong&#62;&#60;/div&#62;&#13;&#10;&#13;&#10;&#60;div style=&#34;background:#eeeeee; border:1px solid #cccccc; padding:5px 10px&#34;&#62;&#60;strong&#62;&#60;span style=&#34;background-color:#e74c3c&#34;&#62;s&#60;/span&#62;&#60;/strong&#62;&#60;/div&#62;&#13;&#10;&#13;&#10;&#60;div style=&#34;background:#eeeeee; border:1px solid #cccccc; padding:5px 10px&#34;&#62;&#60;strong&#62;&#60;span style=&#34;background-color:#e74c3c&#34;&#62;adfasdfasdfasdfsadf&#60;/span&#62;&#60;/strong&#62;&#60;/div&#62;&#13;&#10;',3,0,'2021-11-19 19:18:35','2025-05-13 00:48:04');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_categories`
--

DROP TABLE IF EXISTS `portfolio_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `portfolio_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_categories`
--

LOCK TABLES `portfolio_categories` WRITE;
/*!40000 ALTER TABLE `portfolio_categories` DISABLE KEYS */;
INSERT INTO `portfolio_categories` VALUES (2,'Marketing',3,0,'2021-11-15 00:00:00',NULL),(5,'Tư vấn doanh nghiệp',3,0,'2021-11-15 11:53:37','2021-11-15 12:22:34'),(11,'Đào tạo lập trình',3,2,'2021-11-15 12:22:43','2021-11-24 16:14:45');
/*!40000 ALTER TABLE `portfolio_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_images`
--

DROP TABLE IF EXISTS `portfolio_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(11) DEFAULT 0,
  `image` varchar(100) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_id` (`portfolio_id`),
  CONSTRAINT `portfolio_images_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_images`
--

LOCK TABLES `portfolio_images` WRITE;
/*!40000 ALTER TABLE `portfolio_images` DISABLE KEYS */;
INSERT INTO `portfolio_images` VALUES (24,13,'/radix/uploads/files/26862-2-670x446.jpg','2025-05-06 21:20:42',NULL),(25,13,'/radix/uploads/files/artworks-jUjYuUMUJ2tIkcke-smvyuw-t500x500.jpg','2025-05-06 21:20:42',NULL);
/*!40000 ALTER TABLE `portfolio_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `portfolio_category_id` int(11) DEFAULT 0,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_category_id` (`portfolio_category_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `portfolios_ibfk_1` FOREIGN KEY (`portfolio_category_id`) REFERENCES `portfolio_categories` (`id`),
  CONSTRAINT `portfolios_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (13,'Project 01','project-01','/radix/uploads/files/artworks-jUjYuUMUJ2tIkcke-smvyuw-t500x500.jpg','Đây là mô tả project 01','https://www.youtube.com/watch?v=PEM0Vs8jf1w&#38;list=RDg7NTQcbmELI&#38;index=5','&#60;p&#62;Ch&#38;uacute;ng ta l&#38;agrave; project o1&#60;/p&#62;&#13;&#10;',6,11,0,'2025-05-06 21:20:42',NULL);
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `duplicate` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (12,'Consulting','consulting','&#60;i class=&#34;fa fa-magic&#34;&#62;&#60;/i&#62;','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt','&#60;p&#62;Cụ thể, theo c&#38;ocirc;ng văn số 19242/SYT-NVY của Sở Y tế H&#38;agrave; Nội, cơ quan n&#38;agrave;y đồng &#38;yacute; với đề xuất của Trung t&#38;acirc;m Kiểm so&#38;aacute;t Bệnh tật H&#38;agrave; Nội về việc r&#38;uacute;t ngắn khoảng c&#38;aacute;ch tối thiểu giữa mũi một v&#38;agrave; mũi 2 của vaccine AstraZeneca theo hướng dẫn của Viện Vệ sinh Dịch tễ Trung ương, Bộ Y tế&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#60;img alt=&#34;&#34; src=&#34;/online_php/module06/radix/uploads/images/vaccine-1636874617587.jpeg&#34; style=&#34;height:440px; width:660px&#34; /&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',6,1,'2025-05-06 21:11:45','2025-05-10 18:55:10'),(13,'Creative Idea c','creative-idea-c','&#60;i class=&#34;fa fa-lightbulb-o&#34;&#62;&#60;/i&#62;','Creative and erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin','Creative and erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical LatinCreative and erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical LatinCreative and erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin',6,0,'2025-05-10 18:55:50',NULL),(14,'Development c','development','&#60;i class=&#34;fa fa-wordpress&#34;&#62;&#60;/i&#62;','just fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin','just fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latinjust fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latinjust fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin',6,1,'2025-05-10 18:56:24',NULL),(15,'Marketing c','marketing-c','&#60;i class=&#34;fa fa-bullhorn &#34;&#62;&#60;/i&#62;','Possible of erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin','Possible of erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical LatinPossible of erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical LatinPossible of erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin',6,0,'2025-05-10 18:56:57',NULL),(16,'Consulting c','consulting-c','&#60;i class=&#34;fa fa-magic&#34;&#62;&#60;/i&#62;','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tinciduntwelcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tinciduntwelcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt',6,1,'2025-05-10 18:57:24',NULL),(17,'Consulting c (1)','consulting-c','&#60;i class=&#34;fa fa-magic&#34;&#62;&#60;/i&#62;','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tinciduntwelcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tinciduntwelcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt',6,0,'2025-05-10 18:57:42',NULL),(18,'Development c (1)','development','&#60;i class=&#34;fa fa-wordpress&#34;&#62;&#60;/i&#62;','just fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin','just fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latinjust fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latinjust fine erat, porta non porttitor non, dignissim et enim Aenean ac enim feugiat classical Latin',6,0,'2025-05-10 18:57:45',NULL),(19,'Consulting (1)','consulting','&#60;i class=&#34;fa fa-magic&#34;&#62;&#60;/i&#62;','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt','&#60;p&#62;Cụ thể, theo c&#38;ocirc;ng văn số 19242/SYT-NVY của Sở Y tế H&#38;agrave; Nội, cơ quan n&#38;agrave;y đồng &#38;yacute; với đề xuất của Trung t&#38;acirc;m Kiểm so&#38;aacute;t Bệnh tật H&#38;agrave; Nội về việc r&#38;uacute;t ngắn khoảng c&#38;aacute;ch tối thiểu giữa mũi một v&#38;agrave; mũi 2 của vaccine AstraZeneca theo hướng dẫn của Viện Vệ sinh Dịch tễ Trung ương, Bộ Y tế&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#60;img alt=&#34;&#34; src=&#34;/online_php/module06/radix/uploads/images/vaccine-1636874617587.jpeg&#34; style=&#34;height:440px; width:660px&#34; /&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',6,1,'2025-05-10 18:57:48',NULL),(20,'Consulting (1) (1)','consulting','&#60;i class=&#34;fa fa-magic&#34;&#62;&#60;/i&#62;','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt','&#60;p&#62;Cụ thể, theo c&#38;ocirc;ng văn số 19242/SYT-NVY của Sở Y tế H&#38;agrave; Nội, cơ quan n&#38;agrave;y đồng &#38;yacute; với đề xuất của Trung t&#38;acirc;m Kiểm so&#38;aacute;t Bệnh tật H&#38;agrave; Nội về việc r&#38;uacute;t ngắn khoảng c&#38;aacute;ch tối thiểu giữa mũi một v&#38;agrave; mũi 2 của vaccine AstraZeneca theo hướng dẫn của Viện Vệ sinh Dịch tễ Trung ương, Bộ Y tế&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#60;img alt=&#34;&#34; src=&#34;/online_php/module06/radix/uploads/images/vaccine-1636874617587.jpeg&#34; style=&#34;height:440px; width:660px&#34; /&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',6,1,'2025-05-10 18:57:54',NULL),(21,'Consulting (1) (1) (1)','consulting','&#60;i class=&#34;fa fa-magic&#34;&#62;&#60;/i&#62;','welcome to our consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt','&#60;p&#62;Cụ thể, theo c&#38;ocirc;ng văn số 19242/SYT-NVY của Sở Y tế H&#38;agrave; Nội, cơ quan n&#38;agrave;y đồng &#38;yacute; với đề xuất của Trung t&#38;acirc;m Kiểm so&#38;aacute;t Bệnh tật H&#38;agrave; Nội về việc r&#38;uacute;t ngắn khoảng c&#38;aacute;ch tối thiểu giữa mũi một v&#38;agrave; mũi 2 của vaccine AstraZeneca theo hướng dẫn của Viện Vệ sinh Dịch tễ Trung ương, Bộ Y tế&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;&#60;img alt=&#34;&#34; src=&#34;/online_php/module06/radix/uploads/images/vaccine-1636874617587.jpeg&#34; style=&#34;height:440px; width:660px&#34; /&#62;&#60;/p&#62;&#13;&#10;&#13;&#10;&#60;p&#62;Update...&#60;/p&#62;&#13;&#10;',6,0,'2025-05-10 18:57:57',NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0: Chưa xử lý 1: Đang xử lý 2: Đã xử lý',
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `about_content` text DEFAULT NULL,
  `contact_facebook` varchar(100) DEFAULT NULL,
  `contact_twitter` varchar(100) DEFAULT NULL,
  `contact_linkedin` varchar(100) DEFAULT NULL,
  `contact_pinterest` varchar(100) DEFAULT NULL,
  `forget_token` varchar(100) DEFAULT NULL,
  `group_id` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 0 COMMENT '0: Chưa kích hoạt - 1: Đã kích hoạt',
  `last_activity` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Hoàng An Unicode','hoanganxxx.web@gmail.com','$2y$10$o4fWGlMrIK1uYX9jayctxu25rmap53Ua2DmdWKY90OEP7oNhqgDgS','Tôi là Hoàng An','https://facebook.com','https://twitter.com','https://linkedin.com','https://pinterest.com',NULL,1,1,'2021-11-27 01:05:38','2021-11-10 12:00:00','2021-11-24 16:16:29'),(5,'Văn Quân','nguyenvanqmmuan@gmail.com','$2y$10$/cFFNZj1PcECoCzEX7J79uOSC1TsUxvuc59mv6Utt59ABiqvpqbd2',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,'2021-11-12 14:10:51','2025-05-06 19:26:30'),(6,'Lee Phạm Tuân','lephamtuan97@gmail.com','$2y$10$ReunV7Qt6ZrlCWY7vD7tyOlMOnImZUydfqiktt7Zzp1tpyaezMVF.','Tôi là ai?','http://www.facebook.com/lptuan990','http://www.twitter.com/lptuan97',NULL,NULL,NULL,1,1,'2025-05-14 19:16:24',NULL,'2025-05-06 19:26:12');
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

-- Dump completed on 2025-05-28 15:12:12
