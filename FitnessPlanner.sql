-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: FitnessPlanner
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day_order` bigint(20) NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,1,'Monday'),(2,2,'Tuesday'),(3,3,'Wednesday'),(4,4,'Thursday'),(5,5,'Friday'),(6,6,'Saturday'),(7,7,'Sunday');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercises` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `exercise_duration` bigint(20) DEFAULT NULL,
  `gear` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `updated` datetime DEFAULT NULL,
  `workout_desc` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkiftckymv693t6yxogsb50n4y` (`user_id`),
  CONSTRAINT `FKkiftckymv693t6yxogsb50n4y` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'2018-12-13 14:59:42','Who doesn\'t want to think they have super powers?  Great stretch as well when you picture trying to touch the opposing walls with your fingers and toes.',30,'None','Superman',NULL,'Starting Position: Lie prone (on your stomach) on a mat with your legs extended, ankles slightly plantarflexed (toes pointing away from your shins), arms extended overhead with palms facing each other.\r\n\r\n',2),(2,'2018-12-13 15:01:26','The Push-up is an oldie but goodie.  You can modify intensity by changing hand placement.',15,'None','Push-up',NULL,' Kneel on an exercise mat or floor and bring your feet together behind you. Slowly bend forward to place your palms flat on the mat, positioning your hands shoulder-width apart with your fingers facing forward or turned slightly inward.',2),(3,'2018-12-13 15:04:05','Great overall training',10,'Treadmill','Running',NULL,'Run as much as you can.',2),(4,'2018-12-13 15:06:01','Upward leg presses',20,'Leg press machine','Leg Press',NULL,'Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a medium foot stance. Pushing mainly with the heels of your feet and using the quadriceps go back to the starting position as you exhale.',2),(5,'2018-12-13 15:07:07','Great abs workout',20,'None','Air Bike',NULL,'Lie flat on the ground and initialize bicycle-like leg movements.',2),(6,'2018-12-13 15:08:18','One of the best abs workout',10,'None','Plank',NULL,'Lie down on your stomach. Pick up you stomach, while supporting yourself only on elbows and toes and try staying in this position as long as possible.',2);
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_exercise`
--

DROP TABLE IF EXISTS `plan_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_exercise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `exercise_order` bigint(20) NOT NULL,
  `day_id` bigint(20) DEFAULT NULL,
  `exercise_id` bigint(20) DEFAULT NULL,
  `plan_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgh7o6ik202fri5j2bxturvueu` (`day_id`),
  KEY `FKtpnxsduq6slcc8cbg2v63jsi1` (`exercise_id`),
  KEY `FKfdphx854m3wrbb919jmt4p5wt` (`plan_id`),
  CONSTRAINT `FKfdphx854m3wrbb919jmt4p5wt` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `FKgh7o6ik202fri5j2bxturvueu` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  CONSTRAINT `FKtpnxsduq6slcc8cbg2v63jsi1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_exercise`
--

LOCK TABLES `plan_exercise` WRITE;
/*!40000 ALTER TABLE `plan_exercise` DISABLE KEYS */;
INSERT INTO `plan_exercise` VALUES (1,'Warmup',1,1,3,1),(2,'Main Exercise',2,1,4,1),(3,'Last exercise of the day',3,1,2,1),(4,'Warmup',1,3,3,1),(5,'Warmup',1,5,3,1),(6,'Main Exercise',2,3,5,1),(7,'Last exercise of the day',3,3,6,1),(8,'Last exercise of the day',2,5,1,1),(9,'Warmup',1,1,3,2),(10,'Warmup',1,2,3,2),(11,'Warmup',1,3,3,2),(12,'Warmup',1,5,3,2),(13,'Warmup',1,4,3,2),(14,'Main Exercise',2,1,5,2),(15,'Main Exercise',2,2,4,2),(16,'Main Exercise',2,3,2,2),(17,'Main Exercise',2,5,1,2),(18,'Main Exercise',2,4,5,2),(19,'Last exercise of the day',3,1,3,2),(20,'Last exercise of the day',3,2,3,2),(21,'Main Exercise',3,3,3,2),(22,'Last exercise of the day',3,4,3,2),(23,'Last exercise of the day',3,5,3,2);
/*!40000 ALTER TABLE `plan_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbybv5po44ssyv6svnv062dwrf` (`user_id`),
  CONSTRAINT `FKbybv5po44ssyv6svnv062dwrf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'2018-12-13 15:08:52','If you\'re starting your journey with fit life, this plan might suit you nicely.','Beginner Plan',NULL,2),(2,'2018-12-13 15:12:24','If you have at least ~6 months of training behind you, this plan might be for you','Advanced training',NULL,2);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@admin.pl',_binary '','$2a$10$VypWaAZtAbcRKoF/G0Vy9eBfem0pX8kFc7/dzvamGKyyb0MsrTvDy','admin'),(2,'elvis@a.pl',_binary '','$2a$10$uvwkLBEJ7s6f6pPGqEKZpOd5xyFKjKlzbcYjy.9FixST1p3ZsiHgG','Elvis'),(3,'bodycoach@mail.pl',_binary '','$2a$10$GYcBiivW2anKAPt1DU7ec.CrdNEKeff5fOzO2cccJLHK8dBXDXOA2','BodyCoach'),(4,'n1trainer@mail.pl',_binary '\0','$2a$10$iNB2GhybbPdw0N3crLmquuN/6ILFmdJQnmVstchMiIDQ5y9Pn/VZu','NumberOneTrainer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`),
  KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKa62j07k5mhgifpp955h37ponj` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,2),(1,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 15:19:40
