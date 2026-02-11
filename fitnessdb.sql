-- MySQL dump 10.13  Distrib 9.3.0, for macos15 (arm64)
--
-- Host: localhost    Database: fitnessdb
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `role` enum('user','admin') DEFAULT 'user',
  `last_login_at` datetime DEFAULT NULL,
  `failed_login_attempts` int DEFAULT '0',
  `locked_until` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2b$10$bKjlEb6X7Kj81fP/nTi0D.NKCoxuI4kdvIN9tT4.CHzvrBoB8ous2','admin@fitness.com',NULL,1,'admin',NULL,0,NULL,'2026-02-11 02:59:53','2026-02-11 12:49:36'),(2,'0000','$2b$10$xkOizZFDNCQvIrW.50vKYuXkmHojMnQQoR5ODO6tJ1xee/cAuplJ6','',NULL,1,'user',NULL,0,NULL,'2026-02-11 11:06:49','2026-02-11 13:13:02'),(3,'000','$2b$10$hEjPchO46G9PVi5hAUJ1PushU/8KF54gWiaddLRDGb6q8r4bTU5j2','',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:02:29','2026-02-11 13:13:02'),(4,'111','$2b$10$3JROGF06Dt/yIVVfGEWHLO.Liyt7cuVwUMl6mLYzinE4qbytqcr9K','$2b$10$QtgjlFGWosgFqOd9p9i1JeJzMtfjbJoCKopfxsOQmMllLF3Y0G/tG',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:08:25','2026-02-11 13:27:12'),(5,'112','$2b$10$SEh7dat7M1J42KJ0bPYlwu89Az2G.SQlVQlrnVvoab0zaNo.0hx1O','$2b$10$7QwHOJmvzRTYm6E24mYZpudYG4IsWFZYjZRVIKRnH60TDsK4KRHBi',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:13:28','2026-02-11 13:27:12'),(6,'113','$2b$10$70QtvbPjM972Lfz2j/CD8Ohd0rj5lbOihdoeUeC0NC678yBqyeg4m','$2b$10$CL3uF8VNWe2GAKpFfXfOFeK69SWmZCTMVVT/Cljbl7ecHQqn7quP2',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:16:33','2026-02-11 13:27:12'),(7,'114','$2b$10$570Fsgtj8l3SZO1rSalHve95d7ISZoH8RURGHmjrpEYqz3I2wqL/K','yayae@gmail.com',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:17:24','2026-02-11 13:27:12'),(8,'115','$2b$10$GFqhI1LgxmTj0E/pz4vVf.9NiWSw/c77MlwRSEclJeav3k6KG21c.','thisisyaya@gmail.com',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:18:01','2026-02-11 13:27:12'),(9,'116','$2b$10$xS.HiPcvpRGH8SEsoge.GuSgMilFWdnrHq6zndK/CHf.W3sboXk4u','hidayahkai@gmail.com',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:21:13','2026-02-11 13:27:12'),(11,'bitsyaya','$2b$10$0TqqX43S5ykDyF380lIi6ewZoiSuRQ8WInNf/tkiKiNSxLhJK3n8K','bitsyaya@gmail.com',NULL,1,'user',NULL,0,NULL,'2026-02-11 13:28:16','2026-02-11 13:28:16'),(13,'yayao','$2b$10$Sk6Q/SW4gViVdYttlnVPGuHC/jy7paW3PGwMdB9Zc4r.Ri7oWFGMW','yayao@gmail.com','0194439311',1,'user',NULL,0,NULL,'2026-02-11 14:16:54','2026-02-11 14:30:09'),(14,'yayaei','$2b$10$jCzTRA0XCGQzVxue9sJWaOW5Ri5pYtSqqEzmBYuNBA192TuXbvIlm','yayaei@gmail.com','01944391111',1,'user',NULL,0,NULL,'2026-02-11 14:31:12','2026-02-11 14:31:12'),(15,'test123','$2b$10$tZtji.5Xap6DHdglvW4rWe8sL2Ri/Te18MDtJeGmMuRpi4TShZPHu','test123@gmail.com','0194411019',1,'user',NULL,0,NULL,'2026-02-11 14:32:49','2026-02-11 14:32:59');
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

-- Dump completed on 2026-02-11 14:49:28
