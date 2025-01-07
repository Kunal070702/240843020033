CREATE DATABASE  IF NOT EXISTS `p20_safar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `p20_safar`;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `Role_name_UNIQUE` (`role_name`)
);


--
-- Table structure for table `users`
--


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT 'Company',
  `lastname` varchar(255) NOT NULL DEFAULT 'Company',
  `contactno` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT 'Company',
  `account_status` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Username_UNIQUE` (`username`),
  UNIQUE KEY `Contact_NO_UNIQUE` (`contactno`),
  KEY `FRole_ID_idx` (`role_id`),
  CONSTRAINT `FRole_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
);


--
-- Table structure for table `company`
--


DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_reg_no` varchar(255) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `Company_Reg_No_UNIQUE` (`company_reg_no`),
  KEY `FUser_Id_idx` (`user_id`),
  CONSTRAINT `FUser_Id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);



--
-- Table structure for table package
--

DROP TABLE IF EXISTS package;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE package (
  packageid int NOT NULL AUTO_INCREMENT,
  company_id int NOT NULL,
  description text,
  source varchar(255) NOT NULL,
  destination varchar(255) NOT NULL,
  person_per_package float NOT NULL,
  image_desc text,
  package_name varchar(255) NOT NULL,
  PRIMARY KEY (packageid),
  KEY FCompany_ID_idx (company_id),
  CONSTRAINT FCompany_ID FOREIGN KEY (company_id) REFERENCES company (company_id)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table trips
--

DROP TABLE IF EXISTS trips;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE trips (
  trip_id int NOT NULL AUTO_INCREMENT,
  packageid int DEFAULT NULL,
  start_date date DEFAULT NULL,
  end_date date DEFAULT NULL,
  tourist_allowed int DEFAULT NULL,
  PRIMARY KEY (trip_id),
  KEY FPackage_ID_idx (packageid),
  CONSTRAINT FKqbpx34j378orw1sv98f0hfw7j FOREIGN KEY (packageid) REFERENCES package (packageid)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



