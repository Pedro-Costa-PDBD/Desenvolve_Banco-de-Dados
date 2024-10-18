-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: faculdade
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `nome` varchar(255) NOT NULL,
  `DataNascimento` date DEFAULT NULL,
  `matricula` varchar(255) NOT NULL,
  `endereço` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('Ana Silva','1998-02-12','2023001','Rua das Flores, 123, São Paulo, SP'),('Lucas Oliveira','1999-07-08','2023002','Avenida Brasil, 456, Rio de Janeiro, RJ'),('Beatriz Costa','2000-09-04','2023003',NULL),('Rafael Almeida','2006-06-01','2023004','Rua das Palmeiras, 321, Curitiba, PR'),('Mariana Santos',NULL,'2023005','Avenida das Américas, 654, Salvador, BA');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `CPFprofessor` varchar(11) NOT NULL,
  `DataHora` datetime NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `nota` int DEFAULT NULL,
  PRIMARY KEY (`CPFprofessor`,`DataHora`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`CPFprofessor`) REFERENCES `professor` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contatoprofessor`
--

DROP TABLE IF EXISTS `contatoprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contatoprofessor` (
  `CPFprofessor` varchar(11) NOT NULL,
  `contato` varchar(11) NOT NULL,
  PRIMARY KEY (`CPFprofessor`,`contato`),
  CONSTRAINT `contatoprofessor_ibfk_1` FOREIGN KEY (`CPFprofessor`) REFERENCES `professor` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contatoprofessor`
--

LOCK TABLES `contatoprofessor` WRITE;
/*!40000 ALTER TABLE `contatoprofessor` DISABLE KEYS */;
/*!40000 ALTER TABLE `contatoprofessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Direito','São Paulo');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `nome` varchar(255) NOT NULL,
  `CargaHoraria` int NOT NULL,
  `ementa` text,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('Direito Civil',100,'Estudo das normas que regulam as relações jurídicas entre pessoas, abordando temas como capacidade, personalidades, direitos reais, obrigações, contratos e responsabilidade civil. Análise dos princípios gerais do Direito Civil e suas aplicações práticas.'),('Direito Constitucional',80,'Análise da Constituição como norma fundamental do Estado, suas características, princípios e hierarquia. Estudo dos direitos e garantias fundamentais, organização do Estado, separação dos poderes e controle de constitucionalidade. Discussão sobre a interpretação e aplicação das normas constitucionais.'),('Direito Penal',80,'Introdução ao Direito Penal, abordando os princípios gerais, tipos de crime e penas. Estudo das partes do Código Penal, incluindo crimes contra a pessoa, patrimônio, honra e a aplicação da lei penal. Discussão sobre a teoria da imputação, causas de exclusão da ilicitude e da culpabilidade.');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `InicioContrato` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `IdDepartamento` int DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  KEY `IdDepartamento` (`IdDepartamento`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('2024-01-01','Gabriel Pereira','15993247466',NULL),('2024-01-01','Felipe Souza','20150360788',NULL),('2024-01-01','Laura Martins','78926418355',NULL);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 12:39:12
