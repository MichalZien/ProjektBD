CREATE DATABASE  IF NOT EXISTS `uniwersytet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uniwersytet`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: uniwersytet
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
-- Tworzenie tabeli `adres`
--

DROP TABLE IF EXISTS `adres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adres` (
  `adres_id` int NOT NULL,
  `miasto` varchar(30) NOT NULL,
  `kod_pocztowy` varchar(6) NOT NULL,
  `ulica` varchar(30) NOT NULL,
  `nr_budynku` int NOT NULL,
  `nr_mieszkania` int DEFAULT NULL,
  PRIMARY KEY (`adres_id`),
  UNIQUE KEY `adres_id_UNIQUE` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `egzamin`
--

DROP TABLE IF EXISTS `egzamin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egzamin` (
  `egzamin_id` int NOT NULL,
  `data` date NOT NULL,
  `typ_egz_id` int NOT NULL,
  PRIMARY KEY (`egzamin_id`),
  KEY `fk_egzamin_typ_egz1_idx` (`typ_egz_id`),
  CONSTRAINT `fk_egzamin_typ_egz1` FOREIGN KEY (`typ_egz_id`) REFERENCES `typ_egz` (`typ_egz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `klasa`
--

DROP TABLE IF EXISTS `klasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasa` (
  `klasa_id` int NOT NULL,
  `rok` year NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`klasa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `nauczyciel`
--

DROP TABLE IF EXISTS `nauczyciel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nauczyciel` (
  `nauczyciel_id` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `status` tinyint NOT NULL,
  `email` varchar(30) NOT NULL,
  `nr_telefonu` int NOT NULL,
  `adres_id` int NOT NULL,
  PRIMARY KEY (`nauczyciel_id`),
  UNIQUE KEY `nauczyciel_id_UNIQUE` (`nauczyciel_id`),
  UNIQUE KEY `nr_telefonu_UNIQUE` (`nr_telefonu`),
  KEY `fk_nauczyciel_adres1_idx` (`adres_id`),
  CONSTRAINT `fk_nauczyciel_adres1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `obecnosc`
--

DROP TABLE IF EXISTS `obecnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obecnosc` (
  `status` varchar(45) NOT NULL,
  `student_id` int NOT NULL,
  `data` date NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_obecnosc_student1_idx` (`student_id`),
  CONSTRAINT `fk_obecnosc_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` tinyint NOT NULL,
  `nr_telefonu` int NOT NULL,
  `adres_id` int NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nr_telefonu_UNIQUE` (`nr_telefonu`),
  KEY `adres_id_idx` (`adres_id`),
  CONSTRAINT `adres_id` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `typ_egz`
--

DROP TABLE IF EXISTS `typ_egz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typ_egz` (
  `typ_egz_id` int NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `opis` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typ_egz_id`),
  UNIQUE KEY `typ_egz_id_UNIQUE` (`typ_egz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `wyniki_egz`
--

DROP TABLE IF EXISTS `wyniki_egz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wyniki_egz` (
  `oceny` int NOT NULL,
  `student_id` int NOT NULL,
  `egzamin_id` int NOT NULL,
  `zajecia_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_wyniki_egz_student1_idx` (`student_id`),
  KEY `fk_wyniki_egz_egzamin1_idx` (`egzamin_id`),
  KEY `fk_wyniki_egz_zajecia1_idx` (`zajecia_id`),
  CONSTRAINT `fk_wyniki_egz_egzamin1` FOREIGN KEY (`egzamin_id`) REFERENCES `egzamin` (`egzamin_id`),
  CONSTRAINT `fk_wyniki_egz_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `fk_wyniki_egz_zajecia1` FOREIGN KEY (`zajecia_id`) REFERENCES `zajecia` (`zajecia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `zajecia`
--

DROP TABLE IF EXISTS `zajecia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zajecia` (
  `zajecia_id` int NOT NULL,
  `nazwa` varchar(30) NOT NULL,
  `opis` varchar(100) NOT NULL,
  `klasa_id` int DEFAULT NULL,
  `nauczyciel_id` int DEFAULT NULL,
  PRIMARY KEY (`zajecia_id`),
  KEY `fk_zajecia_nauczyciel1` (`klasa_id`),
  KEY `fk_zajecia_nauczyciel1_idx` (`nauczyciel_id`),
  CONSTRAINT `fk_zajecia_klasa1` FOREIGN KEY (`klasa_id`) REFERENCES `klasa` (`klasa_id`),
  CONSTRAINT `fk_zajecia_nauczyciel1` FOREIGN KEY (`nauczyciel_id`) REFERENCES `nauczyciel` (`nauczyciel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Tworzenie tabeli `zajecia_student`
--

DROP TABLE IF EXISTS `zajecia_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zajecia_student` (
  `klasa_id` int NOT NULL,
  `student_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_zajecia_student_klasa1_idx` (`klasa_id`),
  KEY `fk_zajecia_student_student1_idx` (`student_id`),
  CONSTRAINT `fk_zajecia_student_klasa1` FOREIGN KEY (`klasa_id`) REFERENCES `klasa` (`klasa_id`),
  CONSTRAINT `fk_zajecia_student_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Wpisywanie danych do tabeli `adres`
--


LOCK TABLES `adres` WRITE;
/*!40000 ALTER TABLE `adres` DISABLE KEYS */;
INSERT INTO `adres` VALUES (1,'Kakolewnica','21-302','Brzozowica Duza',42,NULL);
INSERT INTO `adres` VALUES (2,'Kakolewnica','21-302','Brzozowica Duza',4,NULL);
INSERT INTO `adres` VALUES (3,'Kakolewnica','21-302','Garbarksa',23,3);
INSERT INTO `adres` VALUES (4,'Miedzyrzec Podlaski','21-560','Lakowa',4,1);
INSERT INTO `adres` VALUES (5,'Miedzyrzec Podlaski','21-560','Spoldzielcza',24,4);
INSERT INTO `adres` VALUES (6,'Kakolewnica','21-302','Brzozowica Duza',76,NULL);
INSERT INTO `adres` VALUES (7,'Miedzyrzec Podlaski','21-560','Grabarska',32,12);
INSERT INTO `adres` VALUES (8,'Miedzyrzec Podlaski','21-560','Zarowie',23,3);
INSERT INTO `adres` VALUES (9,'Kakolewnica','21-302','Brzozowica Duza',42,NULL);
INSERT INTO `adres` VALUES (10,'Miedzyrzec Podlaski','21-560','Lakowa',52,9);
INSERT INTO `adres` VALUES (11,'Lublin','20-400','Letnia',32,2);
INSERT INTO `adres` VALUES (12,'Lublin','20-617','Poprzeczna',5,12);
INSERT INTO `adres` VALUES (13,'Lubartow','21-100','Szaniawskiego',63,12);
INSERT INTO `adres` VALUES (14,'Swidnik','21-047','Zuchow',15,NULL);
INSERT INTO `adres` VALUES (15,'Lublin','20-616','Gliniana',8,15);
INSERT INTO `adres` VALUES (16,'Lubartow','21-100','Waska',6,2);
INSERT INTO `adres` VALUES (17,'Lublin','20-853','Zelazowej woli',4,20);
INSERT INTO `adres` VALUES (18,'Lublin','20-136','Mirtowa',8,NULL);
INSERT INTO `adres` VALUES (19,'Lublin','20-135','Prosta',20,NULL);
INSERT INTO `adres` VALUES (20,'Lublin','20-620','Zachodnia',7,18);
/*!40000 ALTER TABLE `adres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `egzamin`
--

LOCK TABLES `egzamin` WRITE;
/*!40000 ALTER TABLE `egzamin` DISABLE KEYS */;
INSERT INTO `egzamin` VALUES (1,'2019-10-12',1);
INSERT INTO `egzamin` VALUES (2,'2019-11-15',1);
INSERT INTO `egzamin` VALUES (3,'2019-11-20',2);
INSERT INTO `egzamin` VALUES (4,'2019-10-20',1);
INSERT INTO `egzamin` VALUES (5,'2019-12-11',1);
INSERT INTO `egzamin` VALUES (6,'2019-11-30',1);
INSERT INTO `egzamin` VALUES (7,'2019-10-24',2);
INSERT INTO `egzamin` VALUES (8,'2019-12-02',2);
INSERT INTO `egzamin` VALUES (9,'2019-12-05',1);
INSERT INTO `egzamin` VALUES (10,'2019-12-07',2);
/*!40000 ALTER TABLE `egzamin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `klasa`
--

LOCK TABLES `klasa` WRITE;
/*!40000 ALTER TABLE `klasa` DISABLE KEYS */;
INSERT INTO `klasa` VALUES (1,2019,1);
INSERT INTO `klasa` VALUES (2,2019,1);
INSERT INTO `klasa` VALUES (3,2018,0);
INSERT INTO `klasa` VALUES (4,2017,0);
INSERT INTO `klasa` VALUES (5,2016,0);
INSERT INTO `klasa` VALUES (6,2015,0);
INSERT INTO `klasa` VALUES (7,2014,0);
INSERT INTO `klasa` VALUES (8,2013,0);
INSERT INTO `klasa` VALUES (9,2012,0);
INSERT INTO `klasa` VALUES (10,2011,0);
/*!40000 ALTER TABLE `klasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `nauczyciel`
--

LOCK TABLES `nauczyciel` WRITE;
/*!40000 ALTER TABLE `nauczyciel` DISABLE KEYS */;
INSERT INTO `nauczyciel` VALUES (1,'Adam','Mazowiecki',1,'amazowiecki@gmail.com',543234573,11);
INSERT INTO `nauczyciel` VALUES (2,'Katarzyna','Nowak',1,'knowak@gmail.com',445324554,15);
INSERT INTO `nauczyciel` VALUES (3,'Patrycja','Kowalska',1,'pkowalska@gmail.com',654245323,13);
INSERT INTO `nauczyciel` VALUES (4,'Helena','Wojcik',1,'hwojcik@gmail.com',535443111,16);
INSERT INTO `nauczyciel` VALUES (5,'Zbigniew','Kaminski',1,'zkaminski@gmail.com',534763356,12);
INSERT INTO `nauczyciel` VALUES (6,'Wladyslaw','Wisniewski',1,'wwisniewski@gmail.com',654345623,14);
INSERT INTO `nauczyciel` VALUES (7,'Zbigniew','Kowlaski',1,'zkowalski@gmail.com',555345278,17);
INSERT INTO `nauczyciel` VALUES (8,'Anna','Marciniak',1,'amarciniak@gmail.com',623549265,18);
INSERT INTO `nauczyciel` VALUES (9,'Magda','Sawczuk',1,'msawczuk@gmail.com',666452846,19);
INSERT INTO `nauczyciel` VALUES (10,'Marta','Jakimiak',1,'mjakimiak@gmail.com',435663548,20);
/*!40000 ALTER TABLE `nauczyciel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `obecnosc`
--

LOCK TABLES `obecnosc` WRITE;
/*!40000 ALTER TABLE `obecnosc` DISABLE KEYS */;
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-01',1);
INSERT INTO `obecnosc` VALUES ('1',2,'2019-10-01',2);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-01',3);
INSERT INTO `obecnosc` VALUES ('0',4,'2019-10-01',4);
INSERT INTO `obecnosc` VALUES ('0',5,'2019-10-01',5);
INSERT INTO `obecnosc` VALUES ('0',6,'2019-10-01',6);
INSERT INTO `obecnosc` VALUES ('0',7,'2019-10-01',7);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-01',8);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-01',9);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-01',10);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-02',11);
INSERT INTO `obecnosc` VALUES ('1',2,'2019-10-02',12);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-02',13);
INSERT INTO `obecnosc` VALUES ('1',4,'2019-10-02',14);
INSERT INTO `obecnosc` VALUES ('1',5,'2019-10-02',15);
INSERT INTO `obecnosc` VALUES ('1',6,'2019-10-02',16);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-02',17);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-02',18);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-02',19);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-02',20);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-03',21);
INSERT INTO `obecnosc` VALUES ('0',2,'2019-10-03',22);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-03',23);
INSERT INTO `obecnosc` VALUES ('1',4,'2019-10-03',24);
INSERT INTO `obecnosc` VALUES ('1',5,'2019-10-03',25);
INSERT INTO `obecnosc` VALUES ('0',6,'2019-10-03',26);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-03',27);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-03',28);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-03',29);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-03',30);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-04',31);
INSERT INTO `obecnosc` VALUES ('0',2,'2019-10-04',32);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-04',33);
INSERT INTO `obecnosc` VALUES ('1',4,'2019-10-04',34);
INSERT INTO `obecnosc` VALUES ('0',5,'2019-10-04',35);
INSERT INTO `obecnosc` VALUES ('1',6,'2019-10-04',36);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-04',37);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-04',38);
INSERT INTO `obecnosc` VALUES ('0',9,'2019-10-04',39);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-04',40);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-05',41);
INSERT INTO `obecnosc` VALUES ('1',2,'2019-10-05',42);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-05',43);
INSERT INTO `obecnosc` VALUES ('0',4,'2019-10-05',44);
INSERT INTO `obecnosc` VALUES ('1',5,'2019-10-05',45);
INSERT INTO `obecnosc` VALUES ('1',6,'2019-10-05',46);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-05',47);
INSERT INTO `obecnosc` VALUES ('0',8,'2019-10-05',48);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-05',49);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-05',50);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-01',51);
INSERT INTO `obecnosc` VALUES ('1',2,'2019-10-01',52);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-01',53);
INSERT INTO `obecnosc` VALUES ('0',4,'2019-10-01',54);
INSERT INTO `obecnosc` VALUES ('0',5,'2019-10-01',55);
INSERT INTO `obecnosc` VALUES ('0',6,'2019-10-01',56);
INSERT INTO `obecnosc` VALUES ('0',7,'2019-10-01',57);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-01',58);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-01',59);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-01',60);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-02',61);
INSERT INTO `obecnosc` VALUES ('1',2,'2019-10-02',62);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-02',63);
INSERT INTO `obecnosc` VALUES ('1',4,'2019-10-02',64);
INSERT INTO `obecnosc` VALUES ('1',5,'2019-10-02',65);
INSERT INTO `obecnosc` VALUES ('1',6,'2019-10-02',66);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-02',67);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-02',68);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-02',69);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-02',70);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-03',71);
INSERT INTO `obecnosc` VALUES ('0',2,'2019-10-03',72);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-03',73);
INSERT INTO `obecnosc` VALUES ('1',4,'2019-10-03',74);
INSERT INTO `obecnosc` VALUES ('1',5,'2019-10-03',75);
INSERT INTO `obecnosc` VALUES ('0',6,'2019-10-03',76);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-03',77);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-03',78);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-03',79);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-03',80);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-04',81);
INSERT INTO `obecnosc` VALUES ('0',2,'2019-10-04',82);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-04',83);
INSERT INTO `obecnosc` VALUES ('1',4,'2019-10-04',84);
INSERT INTO `obecnosc` VALUES ('0',5,'2019-10-04',85);
INSERT INTO `obecnosc` VALUES ('1',6,'2019-10-04',86);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-04',87);
INSERT INTO `obecnosc` VALUES ('1',8,'2019-10-04',88);
INSERT INTO `obecnosc` VALUES ('0',9,'2019-10-04',89);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-04',90);
INSERT INTO `obecnosc` VALUES ('1',1,'2019-10-05',91);
INSERT INTO `obecnosc` VALUES ('1',2,'2019-10-05',92);
INSERT INTO `obecnosc` VALUES ('1',3,'2019-10-05',93);
INSERT INTO `obecnosc` VALUES ('0',4,'2019-10-05',94);
INSERT INTO `obecnosc` VALUES ('1',5,'2019-10-05',95);
INSERT INTO `obecnosc` VALUES ('1',6,'2019-10-05',96);
INSERT INTO `obecnosc` VALUES ('1',7,'2019-10-05',97);
INSERT INTO `obecnosc` VALUES ('0',8,'2019-10-05',98);
INSERT INTO `obecnosc` VALUES ('1',9,'2019-10-05',99);
INSERT INTO `obecnosc` VALUES ('1',10,'2019-10-05',100);
/*!40000 ALTER TABLE `obecnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Michal','Zien','mzien@gmail.com',1,563573264,2);
INSERT INTO `student` VALUES (2,'Marcin','Zgorzalek','mzgorzalek@gmail.com',1,563275374,5);
INSERT INTO `student` VALUES (3,'Mateusz','Kubik','mkubik@gmail.com',1,583903771,3);
INSERT INTO `student` VALUES (4,'Weronika','Matejek','wmatejek@gmail.com',1,485620005,4);
INSERT INTO `student` VALUES (5,'Zuzanna','Brynczak','zbrynczak',1,385650127,1);
INSERT INTO `student` VALUES (6,'Paulina','Banka','pbanka@gmail.com',1,600034518,8);
INSERT INTO `student` VALUES (7,'Jakub','Sojka','jsojka@gmail.com',1,465966231,6);
INSERT INTO `student` VALUES (8,'Marcin','Jurek','mjurek@gmail.com',1,524352352,7);
INSERT INTO `student` VALUES (9,'Krzysztof','Zien','kzien@gmail.com',1,354234554,9);
INSERT INTO `student` VALUES (10,'Weronika','Oponowicz','woponowicz@gmail.com',1,325712345,10);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `typ_egz`
--

LOCK TABLES `typ_egz` WRITE;
/*!40000 ALTER TABLE `typ_egz` DISABLE KEYS */;
INSERT INTO `typ_egz` VALUES (1,'Kolokwium','Egzamin pisemny');
INSERT INTO `typ_egz` VALUES (2,'Zaliczenie ustne','Odpowiedz ustna');
/*!40000 ALTER TABLE `typ_egz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `wyniki_egz`
--

LOCK TABLES `wyniki_egz` WRITE;
/*!40000 ALTER TABLE `wyniki_egz` DISABLE KEYS */;
INSERT INTO `wyniki_egz` VALUES (3,2,1,2,1);
INSERT INTO `wyniki_egz` VALUES (3,4,1,2,2);
INSERT INTO `wyniki_egz` VALUES (4,6,1,2,3);
INSERT INTO `wyniki_egz` VALUES (2,8,1,2,4);
INSERT INTO `wyniki_egz` VALUES (5,10,1,2,5);
INSERT INTO `wyniki_egz` VALUES (3,2,2,4,6);
INSERT INTO `wyniki_egz` VALUES (4,4,2,4,7);
INSERT INTO `wyniki_egz` VALUES (4,6,2,4,8);
INSERT INTO `wyniki_egz` VALUES (2,8,2,4,9);
INSERT INTO `wyniki_egz` VALUES (3,10,2,4,10);
INSERT INTO `wyniki_egz` VALUES (5,1,3,1,11);
INSERT INTO `wyniki_egz` VALUES (4,3,3,1,12);
INSERT INTO `wyniki_egz` VALUES (3,5,3,1,13);
INSERT INTO `wyniki_egz` VALUES (5,7,3,1,14);
INSERT INTO `wyniki_egz` VALUES (2,9,3,1,15);
INSERT INTO `wyniki_egz` VALUES (3,1,4,5,16);
INSERT INTO `wyniki_egz` VALUES (4,3,4,5,17);
INSERT INTO `wyniki_egz` VALUES (2,5,4,5,18);
INSERT INTO `wyniki_egz` VALUES (5,7,4,5,19);
INSERT INTO `wyniki_egz` VALUES (4,9,4,5,20);
/*!40000 ALTER TABLE `wyniki_egz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `zajecia`
--

LOCK TABLES `zajecia` WRITE;
/*!40000 ALTER TABLE `zajecia` DISABLE KEYS */;
INSERT INTO `zajecia` VALUES (1,'Matematyka dyskretna','Matematyka dyskretna',1,1);
INSERT INTO `zajecia` VALUES (2,'Analiza matematyczna','Analiza matematyczna',2,2);
INSERT INTO `zajecia` VALUES (3,'Programowanie obiektowe','Programowanie obiektowe',1,3);
INSERT INTO `zajecia` VALUES (4,'Systemy operacyjne','Systemy operacyjne',2,4);
INSERT INTO `zajecia` VALUES (5,'Jezyk angielski','Jezyk angielski',1,5);
INSERT INTO `zajecia` VALUES (6,'Geometria analityczna','Geometria analityczna',2,6);
INSERT INTO `zajecia` VALUES (7,'Zarzadzanie bazami danych','Zarzadzanie bazami danych',1,7);
INSERT INTO `zajecia` VALUES (8,'Filozofia','Filozofia',2,8);
INSERT INTO `zajecia` VALUES (9,'ASK','Architektura systemow komputerowych',1,9);
INSERT INTO `zajecia` VALUES (10,'Sieci komputerowe','Sieci komputerowe',2,10);
/*!40000 ALTER TABLE `zajecia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Wpisywanie danych do tabeli `zajecia_student`
--

LOCK TABLES `zajecia_student` WRITE;
/*!40000 ALTER TABLE `zajecia_student` DISABLE KEYS */;
INSERT INTO `zajecia_student` VALUES (1,1,1);
INSERT INTO `zajecia_student` VALUES (1,3,2);
INSERT INTO `zajecia_student` VALUES (1,5,3);
INSERT INTO `zajecia_student` VALUES (1,7,4);
INSERT INTO `zajecia_student` VALUES (1,9,5);
INSERT INTO `zajecia_student` VALUES (2,2,6);
INSERT INTO `zajecia_student` VALUES (2,4,7);
INSERT INTO `zajecia_student` VALUES (2,6,8);
INSERT INTO `zajecia_student` VALUES (2,8,9);
INSERT INTO `zajecia_student` VALUES (2,10,10);
/*!40000 ALTER TABLE `zajecia_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
