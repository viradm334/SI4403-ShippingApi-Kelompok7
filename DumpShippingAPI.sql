-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: shippingapiv2
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ctgId` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`ctgId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Baju'),(2,'Makanan'),(3,'Farmasi'),(4,'Dokumen'),(5,'Elektronik'),(6,'Kosmetik'),(7,'Otomotif');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kota`
--

DROP TABLE IF EXISTS `kota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kota` (
  `idKota` int NOT NULL AUTO_INCREMENT,
  `kota` varchar(255) DEFAULT NULL,
  `kodeProvinsi` int DEFAULT NULL,
  `lat` decimal(16,12) DEFAULT NULL,
  `lon` decimal(16,12) DEFAULT NULL,
  PRIMARY KEY (`idKota`),
  KEY `kodeProvinsi_idx` (`kodeProvinsi`),
  CONSTRAINT `kodeProvinsi` FOREIGN KEY (`kodeProvinsi`) REFERENCES `provinsi` (`kodeProvinsi`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kota`
--

LOCK TABLES `kota` WRITE;
/*!40000 ALTER TABLE `kota` DISABLE KEYS */;
INSERT INTO `kota` VALUES (1,'Banda Aceh',11,5.548290000000,95.323753000000),(2,'Langsa',11,4.472535000000,97.975634000000),(3,'Lhokseumawe',11,5.181164000000,97.141322000000),(4,'Sabang',11,5.880241000000,95.336574000000),(5,'Subulussalam',11,2.644993000000,98.016521000000),(6,'Denpasar',41,-8.650000000000,115.216667000000),(7,'Pangkal Pinang',10,-2.133333000000,106.116669000000),(8,'Cilegon',31,-6.016670000000,106.016670000000),(9,'Serang',31,-6.120000000000,106.150276000000),(10,'Tangerang Selatan',31,-6.239760000000,106.727410000000),(11,'Tangerang',31,-6.178306000000,106.631889000000),(12,'Bengkulu',15,-3.788892000000,102.266579000000),(13,'Yogyakarta',35,-7.797068000000,110.370529000000),(14,'Gorontalo',51,0.556174000000,123.058548000000),(15,'Jakarta Barat',32,-6.158497000000,106.747054000000),(16,'Jakarta Pusat',32,-6.186486000000,106.834091000000),(17,'Jakarta Selatan',32,-6.261493000000,106.810600000000),(18,'Jakarta Timur',32,-6.225014000000,106.900447000000),(19,'Jakarta Utara',32,-6.121435000000,106.774124000000),(20,'Sungai Penuh',18,-2.068454000000,101.402583000000),(21,'Jambi',18,-1.609972000000,103.607254000000),(22,'Bandung',33,-6.914744000000,107.609810000000),(23,'Bekasi',33,-6.241586000000,106.992416000000),(24,'Bogor',33,-6.595038000000,106.816635000000),(25,'Cimahi',33,-6.899541000000,107.533867000000),(26,'Cirebon',33,-6.737246000000,108.550659000000),(27,'Depok',33,-6.402905000000,106.778419000000),(28,'Sukabumi',33,-6.923700000000,106.928726000000),(29,'Tasikmalaya',33,-7.319563000000,108.202972000000),(30,'Banjar',33,-7.374585000000,108.558189000000),(31,'Magelang',34,-7.479734200000,110.217694100000),(32,'Pekalongan',34,-6.888701000000,109.668289000000),(33,'Salatiga',34,-7.330523400000,110.508436600000),(34,'Semarang',34,-6.966667000000,110.416664000000),(35,'Surakarta',34,-7.575489000000,110.824327000000),(36,'Tegal',34,-6.879704000000,109.125595000000),(37,'Batu',36,-7.867100000000,112.523903000000),(38,'Malang',36,-7.983908000000,112.621391000000),(39,'Blitar',36,-8.100000000000,112.150002000000),(40,'Kediri',36,-7.822840000000,112.011864000000),(41,'Madiun',36,-7.631058700000,111.530015900000),(42,'Mojokerto',36,-7.470475000000,112.440133000000),(43,'Pasuruan',36,-7.646919000000,112.899923000000),(44,'Probolinggo',36,-7.756928000000,113.211502000000),(45,'Surabaya',36,-7.250445000000,112.768845000000),(46,'Pontianak',21,-0.026330300000,109.342503900000),(47,'Singkawang',21,0.906020000000,108.987205000000),(48,'Banjar Baru',23,-3.457242000000,114.810318000000),(49,'Banjarmasin',23,-3.316694000000,114.590111000000),(50,'Palangkaraya',24,-2.216105000000,113.913977000000),(51,'Balikpapan',22,-1.237927000000,116.852853000000),(52,'Bontang',22,0.120863000000,117.480045000000),(53,'Samarinda',22,-0.502106000000,117.153709000000),(54,'Tarakan',25,3.327360000000,117.578505000000),(55,'Batam',17,1.054507000000,104.004120000000),(56,'Tanjungpinang',17,0.918550000000,104.466507000000),(57,'Bandar Lampung',19,-5.450000000000,105.266670000000),(58,'Metro',19,-5.117839000000,105.307265000000),(59,'Ternate',61,0.795800000000,127.361353000000),(60,'Tidore Kepulauan',61,0.525275152499,127.680587059461),(61,'Ambon',62,-3.654703000000,128.190643000000),(62,'Tual',62,-5.626563000000,132.752087000000),(63,'Bima',43,-8.464266000000,118.744903000000),(64,'Mataram',43,-8.576995000000,116.100489000000),(65,'Kupang',42,-10.178757000000,123.597603000000),(66,'Dumai',16,1.694394000000,101.445007000000),(67,'Pekanbaru',16,0.510440000000,101.438309000000),(68,'Merauke',75,-8.499112000000,140.404984000000),(69,'Nabire',73,-3.509546000000,135.752098000000),(70,'Jayawijaya',74,-4.000448000000,138.799512000000),(71,'Sorong',71,-0.876163000000,131.255828000000),(72,'Jayapura',72,-2.591602000000,140.669000000000),(73,'Makassar',56,-5.135399000000,119.423790000000),(74,'Palopo',56,-2.994494000000,120.195465000000),(75,'Parepare',56,-4.009622000000,119.629062000000),(76,'Palu',53,-4.009622000000,119.877999000000),(77,'Baubau',55,-5.470011000000,122.597684000000),(78,'Kendari',55,-3.972201000000,122.514900000000),(79,'Bitung',54,1.440374000000,125.121652000000),(80,'Kotamobagu',54,0.724373000000,124.319932000000),(81,'Manado',54,1.474830000000,124.842079000000),(82,'Tomohon',54,1.322934000000,124.840508000000),(83,'Bukittinggi',14,-0.303918000000,100.383479000000),(84,'Padang',14,-0.947083000000,100.417181000000),(85,'Padang Panjang',14,-0.465280000000,100.399229000000),(86,'Pariaman',14,-0.626439000000,100.117958000000),(87,'Payakumbuh',14,-0.229834000000,100.630917000000),(88,'Sawahlunto',14,-0.596649000000,100.735611000000),(89,'Solok',14,-0.788533000000,100.654982000000),(90,'Lubuklinggau',13,-3.281100000000,102.910988000000),(91,'Pagar Alam',13,-4.041962000000,103.227885000000),(92,'Palembang',13,-2.990934000000,104.756554000000),(93,'Prabumulih',13,-3.421371000000,104.243683000000),(94,'Sekayu',13,-2.886144000000,103.838298000000),(95,'Binjai',12,3.598401000000,98.489166000000),(96,'Gunungsitoli',12,1.280469000000,97.614676000000),(97,'Medan',12,3.597031000000,98.678513000000),(98,'Padangsidempuan',12,1.372180000000,99.273015000000),(99,'Pematangsiantar',12,2.970042000000,99.068169000000),(100,'Sibolga',12,1.749987000000,98.776703000000),(101,'Tanjung Balai',12,2.956972157688,99.797169069822),(102,'Tebing Tinggi',12,3.326288000000,99.156686000000),(103,'Pangandaran',33,-7.687554000000,108.638743000000);
/*!40000 ALTER TABLE `kota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurir`
--

DROP TABLE IF EXISTS `kurir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kurir` (
  `kurirId` int NOT NULL AUTO_INCREMENT,
  `kurirName` varchar(255) NOT NULL,
  `kurirPhoneNum` varchar(13) NOT NULL,
  PRIMARY KEY (`kurirId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurir`
--

LOCK TABLES `kurir` WRITE;
/*!40000 ALTER TABLE `kurir` DISABLE KEYS */;
INSERT INTO `kurir` VALUES (1,'Adi Setiawan','081231231231'),(2,'Budi Sucipto','081345674567'),(3,'Rizki Triputra','081398129812'),(4,'Asep Nugraha','081890764524'),(5,'Susanto','08967190428');
/*!40000 ALTER TABLE `kurir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinsi`
--

DROP TABLE IF EXISTS `provinsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinsi` (
  `kodeProvinsi` int NOT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kodeProvinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinsi`
--

LOCK TABLES `provinsi` WRITE;
/*!40000 ALTER TABLE `provinsi` DISABLE KEYS */;
INSERT INTO `provinsi` VALUES (10,'Bangka Belitung'),(11,'Nangroe Aceh Darussalam'),(12,'Sumatera Utara'),(13,'Sumatera Selatan'),(14,'Sumatera Barat'),(15,'Bengkulu'),(16,'Riau'),(17,'Kepulauan Riau'),(18,'Jambi'),(19,'Lampung'),(21,'Kalimantan Barat'),(22,'Kalimantan Timur'),(23,'Kalimantan Selatan'),(24,'Kalimantan Tengah'),(25,'Kalimantan Utara'),(31,'Banten'),(32,'DKI Jakarta'),(33,'Jawa Barat'),(34,'Jawa Tengah'),(35,'Daerah Istimewa Yogyakarta'),(36,'Jawa Timur'),(41,'Bali'),(42,'Nusa Tenggara Timur'),(43,'Nusa Tenggara Barat'),(51,'Gorontalo'),(52,'Sulawesi Barat'),(53,'Sulawesi Tengah'),(54,'Sulawesi Utara'),(55,'Sulawesi Tenggara'),(56,'Sulawesi Selatan'),(61,'Maluku Utara'),(62,'Maluku'),(71,'Papua Barat'),(72,'Papua'),(73,'Papua Tengah'),(74,'Papua Pegunungan'),(75,'Papua Selatan'),(76,'Papua Barat Daya');
/*!40000 ALTER TABLE `provinsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `estimated_days` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'CTC','1-2 Hari'),(2,'REG','3-4 Hari');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `no_resi` int NOT NULL,
  `serviceId` int unsigned NOT NULL,
  `created_at` date DEFAULT NULL,
  `ongkir` int NOT NULL,
  `kurirId` int NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `recPhoneNum` varchar(13) NOT NULL,
  `toAddress` varchar(255) NOT NULL,
  `toKota` int DEFAULT NULL,
  `sender` varchar(255) NOT NULL,
  `sendPhoneNum` varchar(13) NOT NULL,
  `fromKota` int DEFAULT NULL,
  `weight` decimal(10,0) NOT NULL,
  `ctgId` int unsigned DEFAULT NULL,
  `fragile` tinyint DEFAULT '0',
  `estimated_arrived` date DEFAULT NULL,
  `statusId` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`no_resi`),
  KEY `serviceId_idx` (`serviceId`),
  KEY `kurirId_idx` (`kurirId`),
  KEY `statusId_idx` (`statusId`),
  KEY `ctgId_idx` (`ctgId`),
  KEY `toKota_idx` (`toKota`),
  KEY `fromKota_idx` (`fromKota`),
  CONSTRAINT `ctgId` FOREIGN KEY (`ctgId`) REFERENCES `category` (`ctgId`),
  CONSTRAINT `fromKota` FOREIGN KEY (`fromKota`) REFERENCES `kota` (`idKota`),
  CONSTRAINT `kurirId` FOREIGN KEY (`kurirId`) REFERENCES `kurir` (`kurirId`),
  CONSTRAINT `serviceId` FOREIGN KEY (`serviceId`) REFERENCES `services` (`serviceId`),
  CONSTRAINT `statusId` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`),
  CONSTRAINT `toKota` FOREIGN KEY (`toKota`) REFERENCES `kota` (`idKota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1114,1,'2023-06-06',8000,1,'Rizki','08129871','Jl. ABC no.13',NULL,'Saepul','08129056',NULL,1,3,0,'2023-06-07',1),(1115,1,'2023-06-06',8000,1,'Rizki','08129871','Jl. ABC no.13',NULL,'Saepul','08129056',NULL,1,3,0,'2023-06-07',1),(1234,1,'2023-06-06',8000,1,'Budi','0813091','Jl. ABC no.13',NULL,'Raihan','0812789',NULL,1,3,0,'2023-06-07',3),(184815533,2,'2023-06-11',25000,5,'Dimas','086397012573','Jl. Pejuang No.12',45,'Rizal','089168901462',22,1,3,0,'2023-06-15',1),(343270458,2,'2023-06-11',12000,1,'Rustam','081320877623','Jl. Banda No.15',26,'Rika','089156820357',18,1,3,1,'2023-06-15',1),(661099089,2,'2023-06-11',12000,3,'Rahmat','081320875187','Jl. Permata No. 20',22,'Rudi','089156820357',18,1,3,1,'2023-06-15',1),(841863459,1,'2023-06-11',12000,3,'Beni','081320875159','Jl. Mandiri No.13',22,'Rudi','089156820346',18,1,3,0,'2023-06-15',2);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `statusId` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'MANIFEST','Paket sudah masuk ke database sistem pengiriman'),(2,'SHIPMENT RECEIVED BY COUNTER OFFICER','Paket sudah diterima oleh agen terdekat'),(3,'SHIPMENT PICKED UP BY JNE COURIER','Paket sudah dijemput oleh petugas atau kurir dan akan diantar ke agen selanjutnya'),(4,'RECEIVED AT SORTING CENTER','Paket telah tiba di tempat sortir'),(5,'PROCESSED AT SORTING CENTER','Paket masih diproses di sorting center'),(6,'RECEIVED AT ORIGIN GATEWAY','Paket yang dikirimkan sudah diterima oleh gudang ekspedisi untuk dikirimkan'),(7,'DEPARTED FROM TRANSIT','Paket yang dikirimkan masih ada di gudang di kota tertentu dan sudah masuk daftar dalam penjadwalan ke kota tujuan'),(8,'RECEIVED AT WAREHOUSE','Paket sudah sampai di gudang kota tujuan dan dikirimkan ke agen tingkat kabupaten'),(9,'SHIPMENT FORWARDED TO DESTINATION','Paket masih diproses untuk dikirim ke kantor kabupaten kemudian kantor agen kecamatan'),(10,'RECEIVED AT INBOUND STATION','Pengiriman barang berhasil sampai ke sub agen kecamatan'),(11,'WITH DELIVERY COURIER','Paket sedang diantar ke tujuan oleh kurir'),(12,'DELIVERED TO RECEIVER','Paket sudah diterima');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-12 10:46:34
