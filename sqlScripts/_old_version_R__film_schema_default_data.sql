-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: created_from_script_test
-- ------------------------------------------------------
-- Server version	8.0.19

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
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `role_id` int DEFAULT NULL,
  `banned` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `account_role` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Admin','Admin',1,_binary '\0'),(2,'Moder','Moder',3,_binary '\0'),(3,'User','User',2,_binary '\0'),(4,'User2','User2',2,_binary '\0');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,'admin'),(3,'moderator'),(2,'user');
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `banned` bit(1) NOT NULL DEFAULT b'0',
  `likeness` int DEFAULT '0',
  `message` varchar(45) DEFAULT NULL,
  `film_id` int NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `film_id_idx` (`film_id`),
  KEY `account_id_idx` (`account_id`),
  CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `film_id` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_liked_by`
--

DROP TABLE IF EXISTS `comment_liked_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_liked_by` (
  `comment_id` int NOT NULL,
  `account_id` int NOT NULL,
  KEY `account_id_fk_l_idx` (`account_id`),
  KEY `comment_id_fk_l_idx` (`comment_id`),
  CONSTRAINT `account_id_fk_l` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_id_fk_l` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_liked_by`
--

LOCK TABLES `comment_liked_by` WRITE;
/*!40000 ALTER TABLE `comment_liked_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_liked_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Lord of the rings'),(2,'Harry Potter'),(3,'The Great Dictator'),(4,'Modern Times'),(5,'Birds Of Pray'),(6,'Frozen'),(7,'Kill Bill'),(8,'Gladiator');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_actors`
--

DROP TABLE IF EXISTS `film_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_actors` (
  `film_id` int NOT NULL,
  `participant_id` int NOT NULL,
  KEY `film_id_idx` (`film_id`),
  KEY `participant_id_fk_idx` (`participant_id`),
  CONSTRAINT `film_id_fk` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_actors`
--

LOCK TABLES `film_actors` WRITE;
/*!40000 ALTER TABLE `film_actors` DISABLE KEYS */;
INSERT INTO `film_actors` VALUES (7,62),(7,63),(7,64),(3,32),(8,27),(8,21);
/*!40000 ALTER TABLE `film_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_directors`
--

DROP TABLE IF EXISTS `film_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_directors` (
  `film_id` int NOT NULL,
  `participant_id` int NOT NULL,
  KEY `film_id_fk_idx` (`film_id`),
  KEY `participant_id_fk_idx` (`participant_id`),
  CONSTRAINT `film_id_fk_d` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_d` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_directors`
--

LOCK TABLES `film_directors` WRITE;
/*!40000 ALTER TABLE `film_directors` DISABLE KEYS */;
INSERT INTO `film_directors` VALUES (7,37),(3,32),(8,38);
/*!40000 ALTER TABLE `film_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_genre`
--

DROP TABLE IF EXISTS `film_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_genre` (
  `film_id` int NOT NULL,
  `genre_id` int NOT NULL,
  KEY `film_id_fk_g_idx` (`film_id`),
  KEY `genre_id_fk_g_idx` (`genre_id`),
  CONSTRAINT `film_id_fk_g` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `genre_id_fk_g` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_genre`
--

LOCK TABLES `film_genre` WRITE;
/*!40000 ALTER TABLE `film_genre` DISABLE KEYS */;
INSERT INTO `film_genre` VALUES (3,3),(3,13),(3,30),(3,17),(3,29),(7,7),(7,46),(7,8),(7,37),(8,7),(8,9),(8,17),(8,18);
/*!40000 ALTER TABLE `film_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_idea_authors`
--

DROP TABLE IF EXISTS `film_idea_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_idea_authors` (
  `film_id` int NOT NULL,
  `participant_id` int NOT NULL,
  KEY `participant_id_fk_p_idx` (`participant_id`),
  KEY `film_id_fk_p_idx` (`film_id`),
  CONSTRAINT `film_id_fk_a` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_a` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_idea_authors`
--

LOCK TABLES `film_idea_authors` WRITE;
/*!40000 ALTER TABLE `film_idea_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_idea_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_producers`
--

DROP TABLE IF EXISTS `film_producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_producers` (
  `film_id` int NOT NULL,
  `participant_id` int NOT NULL,
  KEY `participant_id_fk_p_idx` (`participant_id`),
  KEY `film_id_fk_p_idx` (`film_id`),
  CONSTRAINT `film_id_fk_p` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_p` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_producers`
--

LOCK TABLES `film_producers` WRITE;
/*!40000 ALTER TABLE `film_producers` DISABLE KEYS */;
INSERT INTO `film_producers` VALUES (7,37),(3,32);
/*!40000 ALTER TABLE `film_producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_writers`
--

DROP TABLE IF EXISTS `film_writers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_writers` (
  `film_id` int NOT NULL,
  `participant_id` int NOT NULL,
  KEY `participant_id_fk_w_idx` (`participant_id`),
  KEY `film_id_fk_w_idx` (`film_id`),
  CONSTRAINT `film_id_fk_w` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_w` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_writers`
--

LOCK TABLES `film_writers` WRITE;
/*!40000 ALTER TABLE `film_writers` DISABLE KEYS */;
INSERT INTO `film_writers` VALUES (3,32);
/*!40000 ALTER TABLE `film_writers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre_UNIQUE` (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (7,'Action'),(9,'Adventure'),(6,'Animation'),(39,'Anime'),(44,'Art'),(20,'Biographical'),(3,'Comedy'),(46,'Crime'),(8,'Crime film'),(37,'Dark comedy'),(24,'Disaster'),(4,'Documental'),(17,'Drama'),(19,'Epic'),(25,'Experimental'),(21,'Fantasy'),(16,'Fiction'),(34,'Gangster'),(18,'Historical period drama'),(29,'History'),(1,'Horror'),(26,'Indie film'),(43,'Legal drama'),(42,'Martial arts'),(23,'Melodrama'),(35,'Mistery'),(36,'Mockumentary'),(14,'Music'),(22,'Musical'),(47,'Neo-noir'),(11,'Noir'),(30,'Parody film'),(10,'Romance'),(13,'Romantic comedy'),(33,'Science'),(2,'Science fiction'),(41,'Screwball comedy'),(48,'Short'),(38,'Silent'),(27,'Slasher'),(45,'Splatter'),(28,'Sports'),(49,'Stop motion'),(31,'Superhero'),(40,'Teen'),(32,'Television'),(12,'Thriller'),(15,'War'),(5,'Western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (1,'Leonardo','DiCaprio',NULL),(2,'Tom','Hanks',NULL),(3,'Denzel','Washington',NULL),(4,'Samuel','L.Jackson',NULL),(5,'Tom','Cruise',NULL),(6,'Robert','De Niro',NULL),(7,'Al','Pachino',NULL),(8,'Jack','Nicholson',NULL),(9,'Will','Smith',NULL),(10,'Morgan','Freeman',NULL),(11,'Harrison','Ford',NULL),(12,'Brad','Pitt',NULL),(13,'Michael','Caine',NULL),(14,'Matt','Damon',NULL),(15,'Christian','Bale',NULL),(16,'Anthony','Hopkins',NULL),(17,'Hugh','Jackman',NULL),(18,'George','Clooney',NULL),(19,'Clint','Eastwood',NULL),(20,'Gary','Oldman',NULL),(21,'Joaquin','Phoenix',NULL),(22,'Robin','Williams',NULL),(23,'Heath','Ledger',NULL),(24,'Edward','Norton',NULL),(25,'Bruce','Willis',NULL),(26,'Scarlett','Johansson',NULL),(27,'Russel','Crowe',NULL),(28,'Matthew','McConaughey',NULL),(29,'Sean','Connery',NULL),(30,'Sandra','Bullock',NULL),(31,'Keanu','Reeves',NULL),(32,'Charlie','Chaplin',NULL),(33,'Nicolas','Cage',NULL),(34,'Steven','Spielberg',NULL),(35,'George','Lucas',NULL),(36,'Martin','Scorsese',NULL),(37,'Quentin','Tarantino',NULL),(38,'Ridley','Scott',NULL),(39,'James','Cameron',NULL),(40,'Peter','Jackson',NULL),(41,'Woody','Allen',NULL),(42,'Stanley','Kubrick',NULL),(43,'Alfred','Hitchcock',NULL),(44,'Christopher','Nolan',NULL),(45,'David','Fincher',NULL),(46,'Sergio','Leone',NULL),(47,'Oliver','Stone',NULL),(48,'David','Lynch',NULL),(49,'Tim ','Burton',NULL),(50,'Mel','Gibson',NULL),(51,'Lars','von Trier',NULL),(52,'Walt','Disney',NULL),(53,'Hayao','Miyazaki',NULL),(54,'Chuck','Jones',NULL),(55,'Joseph','Barbera',NULL),(56,'William','Hanna',NULL),(57,'Friz','Freleng',NULL),(58,'Richard','Curtis',NULL),(59,'Stephen','King',NULL),(60,'William','Goldman',NULL),(61,'Charlie','Kaufman',NULL),(62,'Uma','Thurman',NULL),(63,'Lucy','Liu',NULL),(64,'Michael','Madsen',NULL);
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `atmosphere` int DEFAULT NULL,
  `plot` int DEFAULT NULL,
  `acting` int DEFAULT NULL,
  `ideas` int DEFAULT NULL,
  `artistic` int DEFAULT NULL,
  `fun` int DEFAULT NULL,
  `film_id` int NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `film_id_fk_r_idx` (`film_id`),
  KEY `account_id_fk_r_idx` (`account_id`),
  CONSTRAINT `account_id_fk_r` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `film_id_fk_r` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-01 22:18:10
