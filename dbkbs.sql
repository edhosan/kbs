CREATE DATABASE  IF NOT EXISTS `opensid` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `opensid`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: opensid
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `analisis_indikator`
--

DROP TABLE IF EXISTS `analisis_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_indikator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nomor` int(3) NOT NULL,
  `pertanyaan` varchar(400) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL DEFAULT '1',
  `bobot` tinyint(4) NOT NULL DEFAULT '0',
  `act_analisis` tinyint(1) NOT NULL DEFAULT '2',
  `id_kategori` tinyint(4) NOT NULL,
  `is_publik` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`,`id_tipe`),
  KEY `id_tipe` (`id_tipe`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_indikator`
--

LOCK TABLES `analisis_indikator` WRITE;
/*!40000 ALTER TABLE `analisis_indikator` DISABLE KEYS */;
INSERT INTO `analisis_indikator` VALUES (1,2,1,'kepemilikan rumah',1,1,1,1,1),(2,2,2,'penghasilan perbulan',1,4,1,2,0),(3,3,1,'Status penguasaan bangunan tempat tinggal',1,1,1,3,0),(4,3,2,'Jenis Atap Terluas',1,1,1,3,0),(5,3,3,'Kualitas Atap',1,1,1,3,0),(6,3,4,'Jenis Dinding Terluas',1,1,1,3,0),(7,3,5,'Kualitas Dinding',1,1,1,3,0),(8,3,6,'Jenis Lantai',1,1,1,3,0),(9,3,7,'Sumber air minum',1,1,1,3,0),(10,3,8,'Sumber penerangan utama',1,1,1,3,0),(11,3,9,'Bahan bakar utama untuk memasak',1,1,1,3,0),(12,3,10,'Fasilitas tempat buang air besar',1,1,1,3,0),(13,3,11,'Tempat pembuangan akhir tinja',1,1,1,3,0),(14,3,12,'Jumlah Keluarga',3,0,0,4,0),(15,3,13,'Jumlah Individu',3,0,0,5,0);
/*!40000 ALTER TABLE `analisis_indikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_kategori_indikator`
--

DROP TABLE IF EXISTS `analisis_kategori_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_kategori_indikator` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_master` tinyint(4) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `kategori_kode` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_kategori_indikator`
--

LOCK TABLES `analisis_kategori_indikator` WRITE;
/*!40000 ALTER TABLE `analisis_kategori_indikator` DISABLE KEYS */;
INSERT INTO `analisis_kategori_indikator` VALUES (1,2,'Aset',''),(2,2,'Penghasilan',''),(3,3,'Umum',''),(4,3,'Hitungan',''),(5,3,'Orangan','');
/*!40000 ALTER TABLE `analisis_kategori_indikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_klasifikasi`
--

DROP TABLE IF EXISTS `analisis_klasifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_klasifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `minval` double(5,2) NOT NULL,
  `maxval` double(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_klasifikasi`
--

LOCK TABLES `analisis_klasifikasi` WRITE;
/*!40000 ALTER TABLE `analisis_klasifikasi` DISABLE KEYS */;
INSERT INTO `analisis_klasifikasi` VALUES (1,2,'Miskin',5.00,10.00),(2,2,'Sedang',11.00,20.00),(3,2,'Kaya',21.00,25.00),(4,3,'Normal',0.00,1.00),(5,3,'Joss',1.00,10.00),(6,3,'Mantab',10.00,100.00);
/*!40000 ALTER TABLE `analisis_klasifikasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_master`
--

DROP TABLE IF EXISTS `analisis_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `subjek_tipe` tinyint(4) NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '1',
  `deskripsi` text NOT NULL,
  `kode_analisis` varchar(5) NOT NULL DEFAULT '00000',
  `id_kelompok` int(11) NOT NULL,
  `pembagi` varchar(10) NOT NULL DEFAULT '100',
  `id_child` smallint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_master`
--

LOCK TABLES `analisis_master` WRITE;
/*!40000 ALTER TABLE `analisis_master` DISABLE KEYS */;
INSERT INTO `analisis_master` VALUES (1,'Analisis Keahlian Individu',1,1,'<p>survey</p>','00000',0,'1',1),(2,'AKP Lombok Tengah',2,1,'<p>keterangan</p>','00000',0,'1',0),(3,'ppls 2011',3,1,'tes','00000',0,'1',0);
/*!40000 ALTER TABLE `analisis_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_parameter`
--

DROP TABLE IF EXISTS `analisis_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indikator` int(11) NOT NULL,
  `jawaban` varchar(200) NOT NULL,
  `nilai` tinyint(4) NOT NULL DEFAULT '0',
  `kode_jawaban` int(3) NOT NULL,
  `asign` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_parameter`
--

LOCK TABLES `analisis_parameter` WRITE;
/*!40000 ALTER TABLE `analisis_parameter` DISABLE KEYS */;
INSERT INTO `analisis_parameter` VALUES (1,1,'milik sendiri',5,0,0),(2,1,'milik orang tua',4,0,0),(3,1,'kontrak',1,0,0),(4,2,'< Rp.500.000,-',1,0,0),(5,2,'Rp 500.000,- sampa Rp 1.000.000,-',3,0,0),(6,2,'diatas Rp 2.000.000,-',5,0,0),(7,3,'1. Milik sendiri',1,0,1),(8,3,'2. Kontrak/Sewa',1,0,1),(9,3,'3. Lainnya',1,0,1),(10,4,'1. Beton',1,0,1),(11,4,'2. Genteng',1,0,1),(12,4,'3. Sirap',1,0,1),(13,4,'4. Seng',1,0,1),(14,4,'5. Asbes',1,0,1),(15,4,'6. Ijuk/Rumbia',1,0,1),(16,4,'7. Lainnya',1,0,1),(17,5,'1. Bagus/kualitas tinggi',1,0,1),(18,5,'2. Buruk/kualitas rendah',1,0,1),(19,6,'1.  Tembok',1,0,1),(20,6,'2. Kayu',1,0,1),(21,6,'3. Bambu',1,0,1),(22,6,'4. Lainnya',1,0,1),(23,7,'1. Bagus/kualitas tinggi',1,0,1),(24,7,'2. Buruk/kualitas rendah',1,0,1),(25,8,'1. Bukan tanah/bambu',1,0,1),(26,8,'2. Tanah',1,0,1),(27,8,'3. Bambu',1,0,1),(28,9,'1. Air Kemasan',1,0,1),(29,9,'2. Air Ledeng',1,0,1),(30,9,'3. Air Terlindung',1,0,1),(31,9,'4. Air Tidak Terlindung',1,0,1),(32,10,'1. Listrik PLN',1,0,1),(33,10,'2. Listrik non-PLN',1,0,1),(34,10,'3. Tidak ada listrik',1,0,1),(35,11,'1. Listrik/Gas/Elpiji',1,0,1),(36,11,'2. Lainnya',1,0,1),(37,12,'1. Sendiri',1,0,1),(38,12,'2. Bersama/Umum',1,0,1),(39,12,'3. Tidak ada',1,0,1),(40,13,'1. Tangki/SPAL',1,0,1),(41,13,'2. Lainnya',1,0,1);
/*!40000 ALTER TABLE `analisis_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_partisipasi`
--

DROP TABLE IF EXISTS `analisis_partisipasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_partisipasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subjek` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `id_klassifikasi` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_subjek` (`id_subjek`,`id_master`,`id_periode`,`id_klassifikasi`),
  KEY `id_master` (`id_master`),
  KEY `id_periode` (`id_periode`),
  KEY `id_klassifikasi` (`id_klassifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_partisipasi`
--

LOCK TABLES `analisis_partisipasi` WRITE;
/*!40000 ALTER TABLE `analisis_partisipasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `analisis_partisipasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_periode`
--

DROP TABLE IF EXISTS `analisis_periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_state` tinyint(4) NOT NULL DEFAULT '1',
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  `tahun_pelaksanaan` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_periode`
--

LOCK TABLES `analisis_periode` WRITE;
/*!40000 ALTER TABLE `analisis_periode` DISABLE KEYS */;
INSERT INTO `analisis_periode` VALUES (1,2,'Pendataan 2014',2,2,'ket',2014),(2,2,'Pendataan 2015',1,1,'nnn',2015),(3,3,'PENDATAAN BPS',1,1,'tes',2011);
/*!40000 ALTER TABLE `analisis_periode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_ref_state`
--

DROP TABLE IF EXISTS `analisis_ref_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_ref_state` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_ref_state`
--

LOCK TABLES `analisis_ref_state` WRITE;
/*!40000 ALTER TABLE `analisis_ref_state` DISABLE KEYS */;
INSERT INTO `analisis_ref_state` VALUES (1,'Belum Entri / Pendataan'),(2,'Sedang Dalam Pendataan'),(3,'Selesai Entri / Pendataan');
/*!40000 ALTER TABLE `analisis_ref_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_ref_subjek`
--

DROP TABLE IF EXISTS `analisis_ref_subjek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_ref_subjek` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `subjek` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_ref_subjek`
--

LOCK TABLES `analisis_ref_subjek` WRITE;
/*!40000 ALTER TABLE `analisis_ref_subjek` DISABLE KEYS */;
INSERT INTO `analisis_ref_subjek` VALUES (1,'Penduduk'),(2,'Keluarga / KK'),(3,'Rumah Tangga'),(4,'Kelompok');
/*!40000 ALTER TABLE `analisis_ref_subjek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_respon`
--

DROP TABLE IF EXISTS `analisis_respon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_respon` (
  `id_indikator` int(11) NOT NULL,
  `id_parameter` int(11) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  KEY `id_parameter` (`id_parameter`,`id_subjek`),
  KEY `id_periode` (`id_periode`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_respon`
--

LOCK TABLES `analisis_respon` WRITE;
/*!40000 ALTER TABLE `analisis_respon` DISABLE KEYS */;
INSERT INTO `analisis_respon` VALUES (1,1,129,1),(2,6,129,1),(1,3,254,1),(2,4,254,1),(1,1,298,1),(2,5,298,1),(1,1,304,1),(2,5,304,1),(1,3,308,1),(2,6,308,1),(1,1,309,1),(2,4,309,1),(1,3,129,2),(2,4,129,2),(1,1,254,2),(2,6,254,2),(1,2,298,2),(2,6,298,2),(1,3,304,2),(2,6,304,2),(1,2,308,2),(2,6,308,2),(1,3,309,2),(2,6,309,2);
/*!40000 ALTER TABLE `analisis_respon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_respon_bukti`
--

DROP TABLE IF EXISTS `analisis_respon_bukti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_respon_bukti` (
  `id_master` tinyint(4) NOT NULL,
  `id_periode` tinyint(4) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `pengesahan` varchar(100) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_respon_bukti`
--

LOCK TABLES `analisis_respon_bukti` WRITE;
/*!40000 ALTER TABLE `analisis_respon_bukti` DISABLE KEYS */;
/*!40000 ALTER TABLE `analisis_respon_bukti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_respon_hasil`
--

DROP TABLE IF EXISTS `analisis_respon_hasil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_respon_hasil` (
  `id_master` tinyint(4) NOT NULL,
  `id_periode` tinyint(4) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `akumulasi` double(8,3) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_master` (`id_master`,`id_periode`,`id_subjek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_respon_hasil`
--

LOCK TABLES `analisis_respon_hasil` WRITE;
/*!40000 ALTER TABLE `analisis_respon_hasil` DISABLE KEYS */;
INSERT INTO `analisis_respon_hasil` VALUES (2,1,129,25.000,'0000-00-00 00:00:00'),(2,1,254,5.000,'0000-00-00 00:00:00'),(2,1,298,17.000,'0000-00-00 00:00:00'),(2,1,304,17.000,'0000-00-00 00:00:00'),(2,1,308,21.000,'0000-00-00 00:00:00'),(2,1,309,9.000,'0000-00-00 00:00:00'),(2,2,129,5.000,'2017-12-11 18:34:51'),(2,2,254,25.000,'2017-12-11 18:34:51'),(2,2,298,24.000,'2017-12-11 18:34:51'),(2,2,304,21.000,'2017-12-11 18:34:51'),(2,2,308,24.000,'2017-12-11 18:34:51'),(2,2,309,21.000,'2017-12-11 18:34:51');
/*!40000 ALTER TABLE `analisis_respon_hasil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_tipe_indikator`
--

DROP TABLE IF EXISTS `analisis_tipe_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_tipe_indikator` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_tipe_indikator`
--

LOCK TABLES `analisis_tipe_indikator` WRITE;
/*!40000 ALTER TABLE `analisis_tipe_indikator` DISABLE KEYS */;
INSERT INTO `analisis_tipe_indikator` VALUES (1,'Pilihan (Tunggal)'),(2,'Pilihan (Multivalue)'),(3,'Isian Angka'),(4,'Isian Tulisan');
/*!40000 ALTER TABLE `analisis_tipe_indikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_polygon` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `desk` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_kategori` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `headline` int(1) NOT NULL DEFAULT '0',
  `gambar1` varchar(200) NOT NULL,
  `gambar2` varchar(200) NOT NULL,
  `gambar3` varchar(200) NOT NULL,
  `dokumen` varchar(400) NOT NULL,
  `link_dokumen` varchar(200) NOT NULL,
  `urut` int(5) DEFAULT NULL,
  `jenis_widget` tinyint(2) NOT NULL DEFAULT '3',
  `boleh_komentar` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel`
--

LOCK TABLES `artikel` WRITE;
/*!40000 ALTER TABLE `artikel` DISABLE KEYS */;
INSERT INTO `artikel` VALUES (7,'','<p><strong>Awal mula SID</strong><br /> \"Awalnya ada keinginan dari pemerintah Desa Balerante yang berharap pelayanan pemerintah desa bisa seperti pengunjung rumah sakit yang ingin mencari data pasien rawat inap, tinggal ketik nama di komputer, maka data tersebut akan keluar\"<br /> (Mart Widarto, pengelola Program Lumbung Komunitas)<br /> Program ini mulai dibuat dari awal 2006: <br /> 1. (2006) komunitas melakukan komunikasi dan diskusi lepas tentang sebuah sistem yang bisa digunakan untuk menyimpan data.<br /> 2. (2008) Rangkaian FDG dengan pemerintah desa membahas tentang tata kelola pendokumentasian di desa<br /> 3. (2009) Ujicoba SID yang sudah dikembangkan di balerante<br /> 4. (2009-2010) Membangun SID (aplikasi) dibeberapa desa yang lain: terong (bantul), Nglegi (Gunungkidul) <br /> 5. (2011) Kandangan (Temanggung) Gilangharjo (bantul) Girikarto (gunungkidul) Talun (klaten) Pager Gunung (magelang) <br /> 6. hingga saat ini 2013 sudah banyak desa pengguna SID.<br /> <br /> <strong>SID sebagai tanggapan atas kebutuhan:</strong><br /> Kalau dulu untuk mencari data penduduk menurut kelompok umur saja kesulitan karena tidak mempunyai databasenya. Dengan adanya SID menjadi lebih mudah.<br /> (Nuryanto, Kabag Pelayanan Pemdes Terong)<br /> <br /> Membangun sebuah sistem bukan hanya membuatkan software dan meninggalkan begitu saja, namun ada upaya untuk memadukan sistem dengan kebutuhan yang ada pada desa. sehingga software dapat memenuhi kebutuhan yang telah ada bukan memaksakan desa untuk mengikuti dan berpindah sistem. inilah yang melatari combine melaksanakan alur pengaplikasian software.<br /> 1. Bentuk tim kerja bersama pemerintah desa<br /> 2. Diskusikan basis data apa saja yang diperlukan untuk warga<br /> 3. Himpun data kependudukan warga dari Kartu Keluarga (KK)<br /> 4. Daftarkan proyek SID dan dapatkan aplikasi softwarenya di http://abcd.lumbungkomunitas.net<br /> 5. Install aplikasi software SID di komputer desa<br /> 6. Entry data penduduk ke SID<br /> 7. Basis data kependudukan sudah bisa dimanfaatkan<br /> 8. Diskusikan rencana pengembangan SID sesuai kebutuhan desa<br /> 9. Sebarluaskan informasi desa melalui beragam media untuk warga<br /> <br /> Pemberdayaan data desa yang dibangun diharapkan dapat menjunjung kesejahteraan masyarakat desa, data-data tersebut dapat diperuntukkan untuk riset lebih lanjut tentang kemiskinan, tanggap bencana, sumberdaya desa yang bisa diekspose keluar dan dengan menghubungkan dari desa ke desa dapat mencontohkan banyak hal dalam keberhasilan pemberdayaannya.<br /> (sumber: Buku Sistem Informasi Desa) <br /> <strong><br /></strong></p>',1,'2013-03-31 12:31:04',999,1,'Awal mula SID',0,'','','','','',NULL,3,1),(32,'','<div class=\"contentText\">\r\n<div align=\"justify\">Bagian ini berisi informasi dasar mengenai desa kami. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\r\n<div align=\"justify\">&nbsp;</div>\r\n<div align=\"justify\"><ol>\r\n<li>Sejarah Desa</li>\r\n<li>Profil Wilayah Desa</li>\r\n<li>Profil Masyarakat Desa</li>\r\n<li>Profil Potensi Desa</li>\r\n</ol></div>\r\n</div>',1,'2013-07-29 09:46:44',999,1,'Profil Desa',0,'','','','','',NULL,3,1),(34,'','<p style=\"text-align: justify;\"><span style=\"color: #ff0000;\"><strong>Contoh (Sila edit halaman ini sesuai dengan deskripsi desa ini)!</strong></span></p>\r\n<p style=\"text-align: justify;\">Berdasarkan data desa pada bulan Februari 2010, jumlah penduduk Desa Terong sebanyak 6484 orang. Jumlah Kepala Keluarga (KK) sebanyak 1605 KK.</p>\r\n<p style=\"text-align: justify;\">Jumlah penduduk Desa Terong usia produktif pada tahun 2009 adalah 4746 orang. Jumlah angkatan kerja tersebut jika dilihat berdasarkan tingkat pendidikannya adalah sebagai berikut:</p>\r\n<table style=\"width: 100%;\" border=\"1\" cellspacing=\"0\" cellpadding=\"4\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\"><strong>No.</strong></p>\r\n</td>\r\n<td style=\"width: 42%;\">\r\n<p style=\"text-align: center;\"><strong>Angkatan Kerja</strong></p>\r\n</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\"><strong>L</strong></p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\"><strong>P</strong></p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\"><strong>Jumlah</strong></p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\">1</p>\r\n</td>\r\n<td style=\"width: 42%;\">Tidak Tamat SD</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">59</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">56</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">115</p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\">2</p>\r\n</td>\r\n<td style=\"width: 42%;\">SD</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">880</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">792</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">1672</p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\">3</p>\r\n</td>\r\n<td style=\"width: 42%;\">SLTP</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">813</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">683</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">1496</p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\">4</p>\r\n</td>\r\n<td style=\"width: 42%;\">SLTA</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">725</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">673</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">1398</p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\">5</p>\r\n</td>\r\n<td style=\"width: 42%;\">Akademi</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">13</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">11</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">24</p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 8%;\">\r\n<p style=\"text-align: center;\">6</p>\r\n</td>\r\n<td style=\"width: 42%;\">Perguruan Tinggi</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">23</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">18</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">41</p>\r\n</td>\r\n</tr>\r\n<tr valign=\"top\">\r\n<td style=\"width: 50%;\" colspan=\"2\">\r\n<p style=\"text-align: center;\">Jumlah Total</p>\r\n</td>\r\n<td style=\"width: 17%;\">\r\n<p style=\"text-align: center;\">2513</p>\r\n</td>\r\n<td style=\"width: 18%;\">\r\n<p style=\"text-align: center;\">2233</p>\r\n</td>\r\n<td style=\"width: 15%;\">\r\n<p style=\"text-align: center;\">4746</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>Profil sosial masyarakat</strong></p>\r\n<p style=\"text-align: justify;\">Dalam aktivitas keseharian, masyarakat Desa Terong sangat taat dalam menjalankan ibadah keagamaan. Setiap Rukung Tetangga (RT) dan pedukuhan memiliki kelompok-kelompok pengajian. Pada peringatan hari besar Islam, penduduk Desa Terong kerap menggelar acara peringatan dan karnaval budaya dengan tema yang disesuaikan dengan hari besar keagamaan. Sebagian besar warga Desa Terong terafiliasi pada organisasi kemasyarakat Islam Muhammadiyah.</p>\r\n<p style=\"text-align: justify;\">Gelaran perayaan lain selalu dilakukan dalam rangka memperingati Hari Kemerdekaan Republik Indonesia. Setiap pedukuhan akan turut serta dan semangat menampilkan ciri khasnya dalam acara peringatan dan karnaval budaya.</p>\r\n<p style=\"text-align: justify;\">Kelompok pemuda di Desa Terong yang tergabung dalam kelompok pegiat Karang Taruna menjadi aktor utama dalam banyak kegiatan desa. Kelompok ini aktif menggelar program kegiatan untuk isu demokrasi kepada warga, penguatan ekonomi produktif, pelatihan penanggulangan bencana, dan kampanye Gerakan Remaja Sayang Ibu (GEMAS).</p>\r\n<p style=\"text-align: justify;\">Sejumlah penduduk Desa Terong bekerja merantau di daerah di luar Yogyakarta. Namun, ikatan sosial mereka terhadap tanah kelahiran tetap tinggi. Penduduk asli Desa Terong yang tinggal di Jakarta dan sekitarnya misalnya, mereka membentuk paguyuban untuk memelihara silaturahmi antar sesama warga perantauan. Setiap bulan diadakan kegiatan arisan keliling secara bergilir di setiap tempat anggotanya. Setiap dua tahun sekali diadakan pula kegiatan mudik bersama ke kampung halaman di Desa Terong</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>Profil politik masyarakat</strong></p>\r\n<p style=\"text-align: justify;\">Warga Desa Terong dikenal sebagai kelompok masyarakat yang paling aktif dan memiliki potensi tertinggi untuk berpartisipasi dalam pemberian suara untuk Pemilihan Umum dan Pemilihan Kepala Daerah Langsung. Tingkat partisipasi warga di desa ini terbanyak jika dibandingkan dengan desa lain di Kecamatan Dlingo, Bantul.</p>\r\n<p style=\"text-align: justify;\">Warga Desa Terong sangat aktif dalam mengawal proses penyusunan Rancangan Undang-Undang (RUU) Keistimewaan Yogyakarta. Banyak warga Desa Terong yang tergabung dalam Gerakan Rakyat Yogyakarta (GRY) dan aktif dalam beragam kegiatan serta demontrasi mendukung penetapan keistimewaan Yogyakarta. Kepala Desa Terong Sudirman Alfian merupakan Ketua Paguyuban Lurah dan Pamong Desa Ing Sedya Memetri Asrining Yogyakarta (ISMAYA) se Daerah Istimewa Yogyakarta (DIY). Beliau ditunjuk pula sebagai anggota tim perumus RUU Keistimewaan Yogyakarta bersi masyarakat Yogyakarta. Salah satu hal yang diperjuangkan dalam RUU tersebut adalah tidak adanya pelaksanaan pemilihan kepala daerah langsung dalam pemilihan Gubernur DIY; dengan mempertahankan konsep dwi tunggal Sri Sultan Hamengku Buwono dan Paku Alam sebagai Gubernur dan Wakil Bubernur DIY.</p>\r\n<p style=\"text-align: justify;\">Permasalahan mendasar yang ada di Desa Terong adalah tidak imbangnya jumlah pencari kerja dengan jumlah lapangan kerja yang tersedia. Sekalipun jumlah pengangguran di Desa Terong pada Tahun 2009 hanya orang tetapi kebanyakan mereka bekerja di luar Desa. Jadi, perlu gerakan kembali ke Desa serta menarik sumber-sumber ekonomi ke desa agar pencari kerja tidak banyak tersedot ke luar Desa.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Sumber:<br />Laporan Pertanggung Jawaban Lurah Desa Terong, Kecamatan Dlingo, Kabupaten Bantul tahun 2009.</p>',1,'2013-07-29 10:13:36',999,1,'Profil Masyarakat Desa',0,'','','','','',NULL,3,1),(36,'','<p>Kontak kami berisi cara menghubungi desa, seperti contoh berikut :</p>\r\n<p>Alamat : Jl desa no 01</p>\r\n<p>No Telepon : 081xxxxxxxxx</p>\r\n<p>Email : xx@desa.com</p>',1,'2013-07-29 10:28:31',999,1,'Kontak Kami',0,'','','','','',NULL,3,1),(37,'','<p><span style=\"color: #ff0000;\"><strong>Contoh (Sila edit halaman ini dan sesuaikan dengan deskripsi untuk desa ini)!</strong></span><br /><br />Susunan Organisasi Badan Permusyawaratan Desa:</p>\r\n<p>Ketua</p>\r\n<p>Sekretaris</p>\r\n<p>Anggota</p>',1,'2013-07-29 10:33:33',999,1,'Badan Permusyawaratan Desa',0,'','','','','',NULL,3,1),(38,'','<p>Berisi data lembaga yang ada di desa beserta deskripsi dan susunan pengurusnya</p>',1,'2013-07-29 10:38:33',999,1,'Lembaga Kemasyarakatan',0,'','','','','',NULL,3,1),(41,'','<p>Agenda Bulan Agustus :</p>\r\n<p>01/08/2013 : Rapat rutin</p>\r\n<p>04/08/2013 : Pertemuan Pengurus</p>\r\n<p>05/08/2013 : Seminar</p>\r\n<p>&nbsp;</p>',1,'2013-07-30 06:08:52',1000,1,'Agenda',0,'','','','','',NULL,3,1),(42,'','<p>Daftar Undang Undang Desa</p>\n<p><a href=\"../../../../../../assets/front/dokumen/Profil_SSN_SMP1Kepil.pdf\">1. UU No desa</a></p>\n<p>berisi asf basdaf.</p>\n<p>&nbsp;</p>\n<p><a href=\"kebumenkab.go.id/uu.pdf\">2.UU Perdangangan</a></p>',1,'2014-04-20 10:21:56',999,1,'Undang Undang',0,'','','','','',NULL,3,1),(43,'','<p>Isi Peraturan Pemerintah</p>',1,'2014-04-20 10:24:01',999,1,'Peraturan Pemerintah',0,'','','','','',NULL,3,1),(44,'','<p>Isi Peraturan Desa</p>',1,'2014-04-20 10:24:35',999,1,'Peraturan Desa',0,'','','','','',NULL,3,1),(45,'','<p>Isi Peraturan Kepala Desa</p>',1,'2014-04-20 10:25:04',999,1,'Peraturan Kepala Desa',0,'','','','','',NULL,3,1),(46,'','<p>Isi Keputusan kepala desa</p>',1,'2014-04-20 10:25:36',999,1,'Keputusan Kepala Desa',0,'','','','','',NULL,3,1),(47,'','<p>Isi Panduan</p>',1,'2014-04-20 10:38:10',999,1,'Panduan',0,'','','','','',NULL,3,1),(51,'','<p>Wahai masyarakat yang ber,,,,,,,,,,,,,,,,,,,,</p>\n<p>no hp : 097867575</p>\n<p>email: jkgkgkg</p>\n<p>ato komentar di bawah ini :</p>',1,'2014-04-22 02:11:20',999,1,'Pengaduan',0,'','','','','',NULL,3,1),(59,'','<ol>\r\n<li><strong>a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Jumlah Penduduk</strong></li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<table style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Jumlah jiwa</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Jumlah laki-laki</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Jumlah perempuan</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Jumlah Kepala Keluarga</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">KK</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><strong>b.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Tingkat Pendidikan</strong></li>\r\n</ol>\r\n<table style=\"width: 373px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Belum sekolah</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Usia 7-45 tahun tidak pernah sekolah</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pernah sekolah SD tetapi tidak tamat</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pendidikan terakhir</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Tamat SD/sederajat</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">SLTP/sederajat</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">SLTA/sederajat</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">D-1</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">D-2</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">D-3</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">S-1</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">S-2</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">S-3</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><strong>c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Mata Pencaharian</strong></li>\r\n</ol>\r\n<p><strong>&nbsp;</strong></p>\r\n<table style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Petani</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">246</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Buruh tani</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">125</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Buruh/swasta</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">136</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pegawai Negeri</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">35</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pengrajin</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">&nbsp;</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pedagang</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">9</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Peternak</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">-</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Nelayan</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">-</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Montir</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">8</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Dokter</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">-</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">POLRI/ABRI</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">1</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pensiunan</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">36</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Perangkat Desa</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">15</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Pembuat Bata</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">3</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>&nbsp;</strong></p>\r\n<ol>\r\n<li><strong>d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>AGAMA</strong></li>\r\n</ol>\r\n<table style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Islam</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">2215</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Kristen</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">5</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Katholik</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">&nbsp;</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Hindu</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">&nbsp;</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\r\n<p align=\"right\">Budha</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\r\n<p align=\"right\">1</p>\r\n</td>\r\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\r\n<p align=\"right\">orang</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>',1,'2014-04-30 10:23:24',999,1,'Profil Potensi Desa',0,'','','','','',NULL,3,1),(62,'','<p>Lembaga Kemasyarakatan Desa (LKMD) adalah salah satu lembaga kemasyaratan yang berada di desa.</p>\n<p>TUGAS LKMD</p>\n<ol>\n<li>menyusun rencana pembangunan secara partisipatif,</li>\n<li>menggerakkan swadaya gotong royong masyarakat,</li>\n<li>melaksanakan dan</li>\n<li>mengendalikan pembangunan.</li>\n</ol>\n<p align=\"left\">FUNGSI LKMD</p>\n<ol>\n<li>penampungan dan penyaluran aspirasi masyarakat dalam pembangunan;</li>\n<li>penanaman dan pemupukan rasa persatuan dan kesatuan masyarakat dalam kerangka memperkokoh Negara Kesatuan Republik Indonesia;</li>\n<li>peningkatan kualitas dan percepatan pelayanan pemerintah kepada masyarakat;</li>\n<li>penyusunan rencana, pelaksanaan, pelestarian dan pengembangan hasil-hasil pembangunan secara partisipatif;</li>\n<li>penumbuhkembangan dan penggerak prakarsa, partisipasi, serta swadaya gotong royong masyarakat; dan</li>\n<li>penggali, pendayagunaan dan pengembangan potensi sumber daya alam serta keserasian lingkungan hidup.</li>\n</ol>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan Desa &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>',1,'2014-04-30 10:39:07',999,1,'LKMD',0,'','','','','',NULL,3,1),(63,'','<p>TUGAS PKK</p>\n<ol>\n<li>menyusun rencana kerja PKK Desa/Kelurahan, sesuai dengan basil Rakerda Kabupaten/Kota;</li>\n<li>melaksanakan kegiatan sesuai jadwal yang disepakati;</li>\n<li>menyuluh dan menggerakkan kelompok-kelompok PKK Dusun/Lingkungan, RW, RT dan dasa wisma agar dapat mewujudkan kegiatan-kegiatan yang telah disusun dan disepakati;</li>\n<li>menggali, menggerakan dan mengembangkan potensi masyarakat, khususnya keluarga untuk meningkatkan kesejahteraan keluarga sesuai dengan kebijaksanaan yang telah ditetapkan;</li>\n<li>melaksanakan kegiatan penyuluhan kepada keluarga-keluarga yang mencakup kegiatan bimbingan dan motivasi dalam upaya mencapai keluarga sejahtera;.</li>\n<li>mengadakan pembinaan dan bimbingan mengenai pelaksanaan program kerja;</li>\n<li>berpartisipasi dalam pelaksanaan program instansi yang berkaitan dengan kesejahteraan keluarga di desa/kelurahan;</li>\n<li>membuat laporan basil kegiatan kepada Tim Penggerak PKK Kecamatan dengan tembusan kepada Ketua Dewan Penyantun Tim Penggerak PKK setempat;</li>\n<li>melaksanakan tertib administrasi; dan</li>\n<li>mengadakan konsultasi dengan Ketua Dewan Penyantun Tim Penggerak PKK setempat.</li>\n</ol>\n<p>&nbsp;</p>\n<p>FUNGSI PKK</p>\n<ol>\n<li>penyuluh, motivator dan penggerak masyarakat agar mau dan mampu melaksanakan program PKK; dan</li>\n<li>fasilitator, perencana, pelaksana, pengendali, pembina dan pembimbing Gerakan PKK.</li>\n</ol>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan Desa &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"center\"><strong>Alamatn</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"center\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>',2,'2014-04-30 10:41:13',999,1,'PKK',0,'','','','','',NULL,3,1),(64,'','<p align=\"left\">TUGAS &nbsp;KARANGTARUNA</p>\n<p align=\"left\">menanggulangi berbagai masalah kesejahteraan sosial terutama yang dihadapi generasi muda, baik yang bersifat preventif, rehabilitatif, maupun pengembangan potensi generasi muda di lingkungannya</p>\n<p align=\"left\">FUNGSI KARANGTAURNA</p>\n<ol>\n<li>penyelenggara usaha kesejahteraan sosial;</li>\n<li>penyelenggara pendidikan dan pelatihan bagi masyarakat;</li>\n<li>penyelenggara pemberdayaan masyarakat terutama generasi muda di lingkungannya secara komprehensif, terpadu dan terarah serta berkesinambungan;</li>\n<li>penyelenggara kegiatan pengembangan jiwa kewirausahaan bagi generasi muda di lingkungannya;</li>\n<li>penanaman pengertian, memupuk dan meningkatkan kesadaran tanggung jawab sosial generasi muda;</li>\n<li>penumbuhan dan pengembangan semangat kebersamaan, jiwa kekeluargaan, kesetiakawanan sosial dan memperkuat nilai-nilai kearifan dalam bingkai Negara Kesatuan Republik Indonesia;</li>\n</ol>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan Desa &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>',1,'2014-04-30 10:44:28',999,1,'Karang Taruna',0,'','','','','',NULL,3,1),(65,'','<p align=\"left\">TUGAS RT/RW</p>\n<p align=\"left\">membantu Pemerintah Desa dan Lurah dalam penyelenggaraan urusan pemerintahan</p>\n<p align=\"left\">FUNGSI PKK</p>\n<ol>\n<li>pendataan kependudukan dan pelayanan administrasi pemerintahan lainnya;</li>\n<li>pemeliharaan keamanan, ketertiban dan kerukunan hidup antar warga;</li>\n<li>pembuatan gagasan dalam pelaksanaan pembangunan dengan mengembangkan aspirasi dan swadaya murni masyarakat; dan</li>\n<li>penggerak swadaya gotong royong dan partisipasi masyarakat di wilayahnya.</li>\n</ol>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan Desa &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\"><strong>Nama Pejabat</strong></p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">Ketua RW 1</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">Ketua RW 1 Rt 01</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">Ketua RW 1 Rt 02</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>',1,'2014-04-30 10:45:19',999,1,'RT RW',0,'','','','','',NULL,3,1),(66,'','<p class=\"Default\">&nbsp;</p>\n<p class=\"Default\">Tim Koordinasi Percepatan Penanggulangan Kemiskinan Desa yang selanjutnya disingkat TKP2KDes adalah wadah koordinasi lintas sektor dan lintas pemangku kepentingan untuk percepatan penanggulangan kemiskinan di desa.</p>\n<p class=\"Default\">TKP2KDes bertugas mengkoordinasikan perencanaan, pengorganisasian, pelaksanaan dan pengendalian program penanggulangan kemiskinan di tingkat Desa.</p>\n<p>( Perda Kabupaten Kebumen Nomor 20 Tahun 2012 Tentang Percepatan Penanggulangan Kemiskinan )</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip; Nomor : &hellip;&hellip;tanggal &hellip;&hellip;.. bulan&hellip;.. tentang &hellip;..</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>',2,'2014-04-30 10:46:01',999,1,'TKP2KDes',0,'','','','','',NULL,3,1),(67,'','<p class=\"Default\">&nbsp;</p>\n<p class=\"Default\">Kelompok Perlindungan Anak Desa atau Kelurahan yang selanjutnya disingkat KPAD atau KPAK adalah lembaga perlindungan anak berbasis masyarakat yang berkedudukan dan melakukan kerja&ndash;kerja perlindungan anak di wilayah desa atau kelurahan tempat anak bertempat tinggal&nbsp;&nbsp;&nbsp;&nbsp; ( Perda Kaupaten Kebumen No 3 Tahun 2013 Tentang Penyelenggaraan Perlindungan Anak&nbsp; )</p>\n<p>TUGAS-TUGAS KPAD</p>\n<p>1.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sosialisasi</p>\n<ol>\n<li>Mensosialisasikan kepada masyarakat tentang hak-hak anak</li>\n<li>Mempromosikan CHILD RIGHTS dan CHILD PROTECTION</li>\n<li>Melakukan upaya pencegahan, respon dan penanganan kasus kasus kekerasan terhadap anak dan masalah anak.</li>\n</ol>\n<p>1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mediasi</p>\n<ol>\n<li>Mengedepankan upaya musyawarah dan mufakat (Rembug Desa)&nbsp; dalam menyelesaikan masalah &ndash; (Restorative Justive)</li>\n<li>Melakukan koordinasi dengan pihak terkait di level desa, kecamatan dan kabupaten dalam upaya perlindungan anak.</li>\n<li>Melakukan pendampingan kasus (dari pelaporan &ndash; medis &ndash; psikologi - reintegrasi)</li>\n</ol>\n<p>1.3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fasilitasi</p>\n<ol>\n<li>Memfasilitasi terbentuknya kelompok anak di desa sebagai media partisipasi anak</li>\n<li>Memfasilitasi partisipasi anak untuk terlibat dalam penyusunan perencanaan pembangunan yang berbasis hak anak (penyusunan RPJMDesa)</li>\n</ol>\n<p>1.4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dokumentasi</p>\n<ol>\n<li>Mendokumentasikan semua proses yang dilakukan (Kegiatan Promosi; Penanganan Kasus dan mencatat kasus yang dilaporkan; Perkembangan Kasus, Pertemuan,dll)</li>\n</ol>\n<p>1.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advokasi</p>\n<ol>\n<li>Mendorong adanya kebijakan dan penganggaran untuk perlindungan anak di level desa</li>\n<li>Menerima pengaduan kasus dan konsultasi tentang perlindungan anak</li>\n<li>Berhubungan dengan P2TP2A dan LPA untuk pendampingan hukum kasus anak (korban dan atau pelaku)</li>\n</ol>\n<p class=\"Default\">&nbsp;</p>\n<p class=\"Default\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan Desa &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>',2,'2014-04-30 10:47:21',999,1,'KPAD',0,'','','','','',NULL,3,1),(68,'','<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK TERNAK &hellip;..</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang</p>\n<p align=\"center\">&hellip;&hellip;&hellip;&hellip;&hellip;.. &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK WANITA TANI TERNAK&nbsp; &hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. bulan&hellip;..</p>\n<p align=\"center\">tentang &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p>&nbsp;</p>',2,'2014-04-30 10:47:58',999,1,'Kelompok Ternak',0,'','','','','',NULL,3,1),(69,'','<p align=\"center\"><strong>DAFTAR NAMA PENGURUS GAPOKTAN</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang</p>\n<p align=\"center\">&hellip;&hellip;&hellip;&hellip;&hellip;.. &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK TANI &hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. bulan&hellip;..</p>\n<p align=\"center\">tentang &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK TANI &hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>DESA &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala Desa &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. bulan&hellip;..</p>\n<p align=\"center\">tentang &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>',1,'2014-04-30 10:48:39',999,1,'Kelompok Tani',0,'','','','','',NULL,3,1),(70,'','<p>Linmas</p>',1,'2014-04-30 10:53:18',999,1,'LinMas',0,'','','','','',NULL,3,1),(71,'','<p>Kelompok Ekonomi Lainya</p>',2,'2014-04-30 10:54:20',999,1,'Kelompok Ekonomi Lainya',0,'','','','','',NULL,3,1),(83,'','<p>Tiap hari rapat sampai kumat</p>',1,'2014-11-06 10:17:52',1000,1,'Rapat Lagi',0,'','','','','',NULL,3,1),(85,'1471927406download (1).jpg','<div class=\"contentText\">\r\n<div align=\"justify\">Bagian ini berisi informasi mengenai PemerintahanDesa. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\r\n<div align=\"justify\">&nbsp;</div>\r\n<ol>\r\n<li>Visi dan Misi</li>\r\n<li>Pemerintah Desa</li>\r\n<li>Badan Permusyawaratan Desa</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>VISI dan MISI</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>VISI</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>\"Senggigi Berseri\"</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>(Bersih, Relegius, Sejahtera, Rapi, dan Indah)</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>\"Terwujudnya masyarakat Desa Senggigi yang Bersih, Relegius, Sejahtra, Rapi dan Indah melalui Akselerasi Pembangunan yang berbasis Keagamaan, Budaya Hukum dan Berwawasan Lingkungan dengan berorentasi pada peningkatan Kinerja Aparatur dan Pemberdayaan Masyarakat\"</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>MISI</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>Misi dan Program Desa Senggigi</strong></p>\r\n<p style=\"text-align: justify;\">Dan untuk melaksanakan visi Desa Senggigi dilaksanakan misi dan program sebagai berikut:</p>\r\n<p style=\"text-align: justify;\">1. Pembangunan Jangka Panjang</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">Melanjutkan Pembangunan Desa yang belum terlaksana</li>\r\n<li style=\"text-align: justify;\">Meningkatkan Kerjasama antara pemerintah Desa dengan Lembaga desa yang ada</li>\r\n<li style=\"text-align: justify;\">Meningkatkan Kesejahtraan Masyarakat desa dengan meningkatkan sarana dan prasarana ekonomi warga.&nbsp;</li>\r\n</ul>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">2. Pembangunan Jangka Pendek &nbsp;</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">Mengembangkan dan Menjaga serta melestarikan ada istiadat desa terutama yang telah mengakar di desa senggigi.&nbsp;</li>\r\n<li style=\"text-align: justify;\">Meningkatkan pelayanan dalam bidang pemerintahan kepada warga masyarakat&nbsp;</li>\r\n<li style=\"text-align: justify;\">Meningkatkan sarana dan prasarana ekonomi warga desa dengan perbaikan prasarana dan sarana ekonomi.</li>\r\n<li style=\"text-align: justify;\">Meningkatkan sarana dan prasarana pendidikan guna peningkatan sumber daya manusia desa senggigi.&nbsp;</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Kepala Desa Senggigi</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Muhammad Ilham</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>',1,'2014-11-07 02:53:54',999,1,'Pemerintahan Desa',0,'','','','','',NULL,3,1),(87,'','<p>bla bla bla</p>',1,'2014-12-10 08:59:20',16,1,'Sejumlah Tukang Becak Merampok Indoapril',0,'','','','ddd.xls','hahaha',NULL,3,1),(90,'1471968200IMG-20160823-WA0007.jpg','',1,'2016-08-23 16:03:21',5,1,'PERDES PHBS ',3,'1471968200IMG-20160823-WA0012.jpg','1471968200','1471968200','PERDES PHBS.docx','PERDES PHBS ',NULL,3,1),(92,'1472006396','<p><strong>Susunan Organisasi Pemerintah Desa Senggigi</strong><br /><br />Kepala Desa: MUHAMMAD ILHAM<br />Sekretaris Desa:&nbsp;<span>MUSTAHIQ, S.Adm</span><br />Kepala Urusan Pemerintahan: SYAFRUDIN<br />Kepala Urusan&nbsp;Pembangunan: SYAFI\'I, SE<br />Kepala Urusan&nbsp;Kesra: HAMIDIAH<br />Kepala Urusan&nbsp;Keuangan: MARDIANA<br />Kepala Urusan&nbsp;Trantib: SUPARDI RUSTAM<br />Kepala Urusan&nbsp;Umum: MAHRUP<br /><br /></p>',1,'2016-08-24 02:39:56',999,1,'Pemerintah Desa',0,'1472006396','1472006396','1472006396','','',NULL,3,1),(93,'1472006908','<p style=\"text-align: center;\"><strong>VISI dan MISI</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>VISI</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>\"Senggigi Berseri\"</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>(Bersih, Relegius, Sejahtera, Rapi, dan Indah)</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>\"Terwujudnya masyarakat Desa Senggigi yang Bersih, Relegius, Sejahtera, Rapi dan Indah melalui Akselerasi Pembangunan yang berbasis Keagamaan, Budaya Hukum dan Berwawasan Lingkungan dengan berorentasi pada peningkatan Kinerja Aparatur dan Pemberdayaan Masyarakat\"</strong></p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>MISI</strong></p>\r\n<p><strong>Misi dan Program Desa Senggigi</strong></p>\r\n<p>Dan untuk melaksanakan visi Desa Senggigi dilaksanakan misi dan program sebagai berikut:</p>\r\n<p>1. Pembangunan Jangka Panjang</p>\r\n<p>&nbsp; &nbsp; - Melanjutkan pembangunan desa yang belum terlaksana.</p>\r\n<p>&nbsp; &nbsp; - Meningkatkan kerjasama antara pemerintah desa dengan lembaga desa yang ada.</p>\r\n<p>&nbsp; &nbsp; - Meningkatkan kesejahtraan masyarakat desa dengan meningkatkan sarana dan prasarana ekonomi warga.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>2. Pembangunan Jangka Pendek &nbsp;</p>\r\n<p>&nbsp; &nbsp; - Mengembangkan dan Menjaga serta melestarikan ada istiadat desa terutama yang telah mengakar di desa senggigi.&nbsp;</p>\r\n<p>&nbsp; &nbsp; - Meningkatkan pelayanan dalam bidang pemerintahan kepada warga masyarakat&nbsp;</p>\r\n<p>&nbsp; &nbsp; - Meningkatkan sarana dan prasarana ekonomi warga desa dengan perbaikan prasarana dan sarana ekonomi.</p>\r\n<p>&nbsp; &nbsp; - Meningkatkan sarana dan prasarana pendidikan guna peningkatan sumber daya manusia Desa Senggigi.&nbsp;</p>',1,'2016-08-24 02:48:28',999,1,'Visi dan Misi',0,'1472006908','1472006908','1472006908','','',NULL,3,1),(94,'1472782825artikel-2-1.jpg','<p style=\"text-align: justify;\">Gotong royong yang dulu digagas pertama kali oleh pendiri bangsa, Ir. Soekarno kian hari semakin terkikis dengan budaya individual ditengah persaingan yang begitu ketat dalam mencapai tujuan tertentu, kenyataan inilah yang membuat nilai-nilai sosial ditatanan masyarakat yang sejak dulu sudah ditanamkan oleh nenek moyang kita luntur seiring dengan perkembangan jaman. padahal untuk mencapai suatu tujuan dan cita-cita bersama seharusnya dikerjakan secara bersama-sama.&nbsp;</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">Maka dengan kenyataan inilah, pemerintah desa senggigi kembali melakukan sebuah inovasi baru dalam merangkul masyarakat agar terus menanamkan kebudayaan \"Gotong Raoyong\". kegitan gotong royong dalam pembangunan jalan desa sedikitnya melibatkan hampir 95% masyarakat senggigi, kebersamaan dan ikatan persaudaraan atas kepentingan bersama menjadi satu ketika semua masyarakat desa terlibat aktif, tanpa harus melihat tatanan dan golongan yang ada. masyarakat saling bahu membahu seiring kegitan gotong royong.&nbsp;</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">&nbsp;</p>',1,'2016-08-24 03:02:44',1,1,'Membangun Desa Lewat Gotong Royong',3,'1472782825artikel-2-2.jpeg','1472007764','1472007764','','',NULL,3,1),(95,'1472782634galeri-1-1.jpg','<p>Desa Senggigi ikut memeriahkan perayaan 17 Agustus 2016 sebagai hari jadi Indonesia yang ke 71 melalui kegiatan Karnaval yang diselenggarakan oleh Camat Batulayar Kabupaten Lombok Barat NTB. Acara karnaval dilaksanakan pada hari Rabu, 17 Agustus 2016 dimulai pukul 15.30 s/d 17.00 wita. Masing-masing desa berkumpul disekitaran kantor Camat Batulayar, dan berjalan menuju Taman Bale Pelangi Desa Sandik sebagai pusat titik kumpul seluruh peserta karnaval.&nbsp;</p>\n<p>&nbsp;</p>\n<p>Dalam karnaval ini, Desa Senggigi melibatkan berbagai unsur masyarakat seperti tokoh masyarakat, perempuan, pemuda dan anak-anak dengan menggunakan baju adat dan berbagai macam asesoris hari kemerdekaan, kegitan tersebut adalah salah satu cara bagaimana memupuk semangat bagi setiap warga negara, khususnya kaum muda sebagai harapan bangsa, yang kian hari semakin terkikis dengan pengaruh global saat ini.</p>\n<p>&nbsp;</p>\n<p>Lewat karang taruna desa senggigi, pemupukan pemberian semangat dalam berpacu memajukan desa dan bangsa terus dilakukan, berbagai macam kegiatan tahapan dalam pelaksanaan hari kemerdekaan terus di lakukan.&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>',1,'2016-08-24 05:05:21',1,1,'Perayaan Hari Kemerdekaan 2016',3,'1472782634galeri-1-2.jpeg','1472015120','1472015120','','',NULL,3,1),(96,'1472782915artikel-3-1.jpeg','<p>Dalam rapat pembahasan komitmen perekrutan karyawan hotel pada tanggal 24 Agustus 2016 di kantor desa sengigi telah menyepakati beberapa komitmen bersama diantaranya sebagai berikut:</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>1. Dalam perekrutan karyawan, pihak hotel harus memprioritaskan masyarakat senggigi minimal 35%</p>\n<p>2. Pihak Hotel harus mengikuti program perencanaan tenaga kerja desa senggigi sesua dengan VISI dan MISI desa</p>\n<p>3. Pihak hotel harus melakukan kordinasi dengan pemerintah desa ketika perekrutan karyawan&nbsp;</p>\n<p>4. Pihak Hotel harus melakukan pelatihan bagi calon karyawan, khususnya karyawan yang berasal dari desa sengggigi</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Bagi rekan-rekan pemuda dan masyarakat harap melakukan kordinasi dengan pemerintah desa terkait dengan beberapa hasil pertemuan dalam membangun komitme dengan pihak hotel, jika ada hal mendesak terkait beberapa syarat ketentuan perekrutan, rekan-rekan pemuda dan masyarakat bisa menghubungi kami di kantor desa..</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>',1,'2016-08-24 05:55:10',4,1,'Rapat membangun Komitmen antara Karang Taruna Desa Senggigi dengan Taruna Hotel',3,'1472018109IMG-20160824-WA0000.jpg','1472018109','1472018109','','',NULL,3,1),(97,'1472019299','<p>Halaman ini berisi tautan menuju informasi mengenai Basis Data Desa. Ada dua jenis data yang dimuat dalam sistem ini, yakni basis data kependudukan dan basis data sumber daya desa. Sila klik pada tautan berikut untuk mendapatkan tampilan data statistik per kategori.</p>\r\n<ol>\r\n<li>Data Wilayah Administratif&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Pendidikan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Pekerjaan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Golongan Darah&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Agama&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Jenis Kelamin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Kelompok Umur&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Penerima Raskin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li>Data Penerima BPJS &nbsp; &nbsp; &nbsp; &nbsp;</li>\r\n<li>Data Warga Negara &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;</li>\r\n</ol>\r\n<p>Data yang tampil adalah statistik yang didapatkan dari proses olah data dasar yang dilakukan secara&nbsp;<em>offline</em>&nbsp;di kantor desa secara rutin/harian. Data dasar di kantor desa diunggah ke dalam sistem&nbsp;<em>online</em>&nbsp;di website ini secara berkala. Sila hubungi kontak pemerintah desa untuk mendapatkan data dan informasi desa termutakhir.</p>',1,'2016-08-24 06:14:59',999,1,'Data Desa',0,'1472019299','1472019299','1472019299','','',NULL,3,1),(98,'1472192894','<p>Wilayah desa berisi tentang penjelasan dan deskripsi letak wilayah desa. contohnya sebagai berikut :<br />Batas-batas :<br />Utara&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Kelurahan a<br />Timur &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: Desa b<br />Selatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Desa c<br />Barat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Kelurahan d dan Desa e<br />Luas Wilayah Desa Penglatan&nbsp;&nbsp; : 186,193 Ha<br />Letak Dan Batas Desa x<br />Desa Penglatan terletak pada posisi 115. 7.20 LS 8. 7.10 BT, dengan ketinggian kurang lebih 250 M diatas permukaan laut.</p>\r\n<p>Peta Desa:</p>\r\n<p><iframe src=\"https://www.google.co.id/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Logandu,+Karanggayam&amp;aq=0&amp;oq=logandu&amp;sll=-2.550221,118.015568&amp;sspn=52.267573,80.332031&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Logandu,+Karanggayam,+Kebumen,+Central+Java&amp;z=14&amp;ll=-7.55854,109.634173&amp;output=embed\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" width=\"600\" height=\"450\"></iframe></p>',1,'2016-08-26 06:28:14',999,1,'Wilayah Desa',0,'1472192894','1472192894','1472192894','','',NULL,3,1),(99,'1472228892Raja Lombok 1902.jpg','<p style=\"text-align: justify;\" align=\"center\">Sejarah telah mencatat bahwa Pulau Lombok pernah menjadi wilayah kekuasaan Kerajaan Karang Asem Bali yang berkedudukan di Cakranegara dengan seorang raja bernama Anak Agung Gde Jelantik. Berakhirnya <strong>kekuasaan</strong> Kerajaan Karang Asem Bali di Pulau Lombok setelah datangnya Belanda pada Tahun 1891, dimana Belanda pada waktu itu ingin menguasai Pulau Lombok dengan dalih pura-pura membantu rakyat Lombok yang dianggap tertindas oleh Pemerintahan Raja Lombok yaitu Anak Agung Gede Jelantik.</p>\r\n<p style=\"text-align: justify;\">Pada masa kekuasaan Raja Lombok yaitu Anak Agung Gde Jelantik, wilayah Desa Senggigi ( Dusun Mangsit, Kerandangan, Senggigi dan Dusun Loco) masih bergabung dengan Desa Senteluk yang sekarang menjadi Desa Meninting . Sedangkan pada tahun 1962 Desa Senteluk pecah menjadi 2 (Dua) desa yaitu Desa Meninting dan Desa Batulayar dan Dusun Mangsit,Kerandangan,Senggigi dan Dusun Loco bergabung ke Desa Batulayar.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Pemberian nama Desa Batulayar pada waktu itu yang lazim disebut dengan Pemusungan/Kepala Dea Batulayar berdasarkan hasil musyawarah nama Batulayar diambil dari nama tempat yang amat terkenal yaitu Makam Batulayar yang sampai saat ini banyak dikunjungi oleh masyarakat Pulau Lombok pada khususnya dan Masyarakat Nusa Tenggara Barat pada umumnya.</p>\r\n<p style=\"text-align: justify;\">Pada tahun 2001 Desa Batulayar dimekarkan menjadi 2 (dua) yaitu Desa Batulayar (sebagai Desa Induk) dan Desa Senggigi (sebagai Desa Persiapan) dengan SK.Bupati No : 30 Tahun 2001 tanggal 17 Mei 2001, yang pada waktu itu yang menjadi pejabat Kepala Desa Senggigi ialah <strong>H. ARIF RAHMAN, S.IP</strong>., dengan jumlah dusun sebanyak 3 dusun, yaitu :</p>\r\n<p>1. Dusun Senggigi</p>\r\n<p>2. Dusun Kerandangan</p>\r\n<p>3. Dusun Mangsit</p>\r\n<p>Selanjutnya pada tanggal 30 Juli 2003 Pejabat Kepala Desa Senggigi dari <strong>H. ARIF RAHMAN, S.IP</strong> diganti oleh Saudara<strong> ARIFIN</strong> dengan SK. Bupati Lombok Barat No : 409/66/pem/2003. Berhubung Desa Senggigi masih bersifat Desa Persiapan, maka berdasarkan hasil musyawarah desa, tertanggal 15 Desember 2003 , maka pada tanggal 22 Desember 2003 Desa Senggigi mengadakan Pemilihan Kepala Desa devinitif yang pertama kali dipimpin oleh&nbsp;<strong>HAJI JUNAIDI</strong>&nbsp;terpilih&nbsp;dengan SK. Bupati Lombok Barat No :01/01/Pem/2004 tertanggal 2 Januari 2004&nbsp;sampai pada tahun 2008.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Selanjutnya pada tahun 2008, Desa Senggigi mengadakan pemilihan Kepala Desa Senggigi yang kedua dan dimenangkan oleh Bapak <strong>H. MUTAKIR AHMAD</strong>&nbsp;dengan&nbsp;SK. Bupati Lombok Barat No :1320/48/Pem./2008 tertanggal 23 Desember 2008, Periode 2008-2014. &nbsp;Kemudian Kepala desa terpilih Periode 2015 s/d 2021&nbsp;adalah <strong>MUHAMMAD ILHAM</strong>&nbsp;dengan SK. Bupati Lombok Barat No : 160/04/BPMPD/15 tanggal 27 Januari 2015 kini baru menjabat 2 (dua) bulan.</p>\r\n<p style=\"text-align: justify;\">Demikian selanyang pandang atau sejarah singkat Desa Senggigi yang dapat kami sampaikan kepada para pegiat Medsos, semoga dapat bermanfaat untuk kita semua, terima kasih.</p>\r\n<p style=\"text-align: justify;\" align=\"center\">&nbsp;</p>\r\n<p style=\"text-align: justify;\" align=\"center\">&nbsp;</p>',1,'2016-08-26 07:38:09',999,1,'Sejarah Desa',3,'1472229325490125_20121123041539.jpg','1472197089','1472197089','','',NULL,3,1),(100,'1473071921','<p>Ini contoh teks berjalan. Isi dengan tulisan yang menampilkan suatu ciri atau kegiatan penting di desa anda.</p>',1,'2016-09-05 02:38:41',22,1,'Contoh teks berjalan',0,'1473071921','1473071921','1473071921','','',NULL,3,1);
/*!40000 ALTER TABLE `artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama_desa` varchar(100) NOT NULL,
  `kode_desa` varchar(100) NOT NULL,
  `nama_kepala_desa` varchar(100) NOT NULL,
  `nip_kepala_desa` varchar(100) NOT NULL,
  `kode_pos` varchar(6) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_kepala_camat` varchar(100) NOT NULL,
  `nip_kepala_camat` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_propinsi` varchar(100) NOT NULL,
  `kode_propinsi` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `zoom` tinyint(4) NOT NULL,
  `map_tipe` varchar(20) NOT NULL,
  `path` text NOT NULL,
  `alamat_kantor` varchar(200) DEFAULT NULL,
  `g_analytic` varchar(200) NOT NULL,
  `email_desa` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'Senggig1 ','05','Muhammad Ilham ','--','83355','','14','Bambang Budi Sanyoto, S. H','-','Kabupaten Berau','01','Kalimantan Timur','64','362016-022205-porto_kabupaten_berau.png','-8.488005310891758','116.0406072534065',19,'hybrid','(-7.8312189550359586, 110.2565517439507);(-7.8676102927000695, 110.25380516191944);(-7.843803235881495, 110.29843711992726);(-7.831899196157655, 110.36504173418507);(-7.8169336350355465, 110.32933616777882);(-7.8169336350355465, 110.29775047441944);','Jl. Raya Senggigi Km 10 Kerandangan ','gsgsdgsdgsg','','','');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_persil`
--

DROP TABLE IF EXISTS `data_persil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_persil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(64) NOT NULL,
  `nama` varchar(128) NOT NULL COMMENT 'nomer persil',
  `persil_jenis_id` tinyint(2) NOT NULL,
  `id_clusterdesa` int(11) NOT NULL,
  `luas` decimal(7,2) NOT NULL,
  `no_sppt_pbb` varchar(128) NOT NULL,
  `kelas` varchar(128) DEFAULT NULL,
  `persil_peruntukan_id` tinyint(2) NOT NULL,
  `alamat_ext` varchar(100) DEFAULT NULL,
  `userID` mediumint(9) DEFAULT NULL,
  `peta` text,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_persil`
--

LOCK TABLES `data_persil` WRITE;
/*!40000 ALTER TABLE `data_persil` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_persil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_persil_jenis`
--

DROP TABLE IF EXISTS `data_persil_jenis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_persil_jenis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) NOT NULL,
  `ndesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_persil_jenis`
--

LOCK TABLES `data_persil_jenis` WRITE;
/*!40000 ALTER TABLE `data_persil_jenis` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_persil_jenis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_persil_peruntukan`
--

DROP TABLE IF EXISTS `data_persil_peruntukan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_persil_peruntukan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) NOT NULL,
  `ndesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_persil_peruntukan`
--

LOCK TABLES `data_persil_peruntukan` WRITE;
/*!40000 ALTER TABLE `data_persil_peruntukan` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_persil_peruntukan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_log_penduduk`
--

DROP TABLE IF EXISTS `detail_log_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_log_penduduk` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_log_penduduk`
--

LOCK TABLES `detail_log_penduduk` WRITE;
/*!40000 ALTER TABLE `detail_log_penduduk` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_log_penduduk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokumen`
--

DROP TABLE IF EXISTS `dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pend` int(11) NOT NULL DEFAULT '0',
  `kategori` tinyint(3) NOT NULL DEFAULT '1',
  `attr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokumen`
--

LOCK TABLES `dokumen` WRITE;
/*!40000 ALTER TABLE `dokumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `dokumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambar_gallery`
--

DROP TABLE IF EXISTS `gambar_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambar_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parrent` int(4) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe` int(4) NOT NULL,
  `slider` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambar_gallery`
--

LOCK TABLES `gambar_gallery` WRITE;
/*!40000 ALTER TABLE `gambar_gallery` DISABLE KEYS */;
INSERT INTO `gambar_gallery` VALUES (28,0,'galeri-1-1.jpg','Karnaval Hari Kemerdekaan ',1,'2016-08-26 06:53:51',0,NULL),(29,0,'','Panorama Wisata ',1,'2016-08-26 06:55:31',0,NULL),(30,28,'IMG-20160823-WA0116.jpg','Karnaval baju adat',1,'2016-08-26 06:57:10',2,NULL),(31,28,'galeri-1-2.jpeg','Kemeriahan Karnaval',2,'2016-08-26 06:58:16',2,NULL),(32,29,'galeri-2-2.jpeg','Pantai indah',1,'2016-09-01 18:14:06',2,NULL),(33,29,'galeri-2-3.jpeg','Kolam renang impian',1,'2016-09-01 18:14:28',2,NULL),(34,0,'','Kegiatan Kantor Desa',2,'2016-09-01 22:24:59',0,NULL),(35,28,'','Tarian adat',1,'2016-09-01 23:32:55',2,NULL);
/*!40000 ALTER TABLE `gambar_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garis`
--

DROP TABLE IF EXISTS `garis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garis` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_line` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `desk` text NOT NULL,
  `id_cluster` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garis`
--

LOCK TABLES `garis` WRITE;
/*!40000 ALTER TABLE `garis` DISABLE KEYS */;
/*!40000 ALTER TABLE `garis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gis_simbol`
--

DROP TABLE IF EXISTS `gis_simbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gis_simbol` (
  `simbol` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gis_simbol`
--

LOCK TABLES `gis_simbol` WRITE;
/*!40000 ALTER TABLE `gis_simbol` DISABLE KEYS */;
INSERT INTO `gis_simbol` VALUES ('accident.png'),('accident_2.png'),('administration.png'),('administration_2.png'),('aestheticscenter.png'),('agriculture.png'),('agriculture2.png'),('agriculture3.png'),('agriculture4.png'),('aircraft-small.png'),('airplane-sport.png'),('airplane-tourism.png'),('airport-apron.png'),('airport-runway.png'),('airport-terminal.png'),('airport.png'),('airport_2.png'),('amphitheater-tourism.png'),('amphitheater.png'),('ancientmonument.png'),('ancienttemple.png'),('ancienttempleruin.png'),('animals.png'),('animals_2.png'),('anniversary.png'),('apartment.png'),('apartment_2.png'),('aquarium.png'),('arch.png'),('archery.png'),('artgallery.png'),('atm.png'),('atv.png'),('audio.png'),('australianfootball.png'),('bags.png'),('bank.png'),('bank_2.png'),('bankeuro.png'),('bankpound.png'),('bar.png'),('bar_2.png'),('baseball.png'),('basketball.png'),('baskteball2.png'),('beach.png'),('beach_2.png'),('beautiful.png'),('beautiful_2.png'),('bench.png'),('biblio.png'),('bicycleparking.png'),('bigcity.png'),('billiard.png'),('bobsleigh.png'),('bomb.png'),('bookstore.png'),('bowling.png'),('bowling_2.png'),('boxing.png'),('bread.png'),('bread_2.png'),('bridge.png'),('bridgemodern.png'),('bullfight.png'),('bungalow.png'),('bus.png'),('bus_2.png'),('butcher.png'),('cabin.png'),('cablecar.png'),('camping.png'),('camping_2.png'),('campingsite.png'),('canoe.png'),('car.png'),('car_2.png'),('carrental.png'),('carrepair.png'),('carrepair_2.png'),('carwash.png'),('casino.png'),('casino_2.png'),('castle.png'),('cathedral.png'),('cathedral2.png'),('cave.png'),('cemetary.png'),('chapel.png'),('church.png'),('church2.png'),('church_2.png'),('cinema.png'),('cinema_2.png'),('circus.png'),('citysquare.png'),('climbing.png'),('clothes-female.png'),('clothes-male.png'),('clothes.png'),('clothes_2.png'),('clouds.png'),('clouds_2.png'),('cloudsun.png'),('cloudsun_2.png'),('club.png'),('club_2.png'),('cluster.png'),('cluster2.png'),('cluster3.png'),('cluster4.png'),('cluster5.png'),('cocktail.png'),('coffee.png'),('coffee_2.png'),('communitycentre.png'),('company.png'),('company_2.png'),('computer.png'),('computer_2.png'),('concessionaire.png'),('conference.png'),('construction.png'),('convenience.png'),('convent.png'),('corral.png'),('country.png'),('court.png'),('cricket.png'),('cross.png'),('crossingguard.png'),('cruise.png'),('currencyexchange.png'),('customs.png'),('cycling.png'),('cycling_2.png'),('cyclingfeedarea.png'),('cyclingmountain1.png'),('cyclingmountain2.png'),('cyclingmountain3.png'),('cyclingmountain4.png'),('cyclingmountainnotrated.png'),('cyclingsport.png'),('cyclingsprint.png'),('cyclinguncategorized.png'),('dam.png'),('dancinghall.png'),('dates.png'),('dates_2.png'),('daycare.png'),('days-dim.png'),('days-dom.png'),('days-jeu.png'),('days-jue.png'),('days-lun.png'),('days-mar.png'),('days-mer.png'),('days-mie.png'),('days-qua.png'),('days-qui.png'),('days-sab.png'),('days-sam.png'),('days-seg.png'),('days-sex.png'),('days-ter.png'),('days-ven.png'),('days-vie.png'),('default.png'),('dentist.png'),('deptstore.png'),('disability.png'),('disability_2.png'),('disabledparking.png'),('diving.png'),('doctor.png'),('doctor_2.png'),('dog-leash.png'),('dog-offleash.png'),('door.png'),('down.png'),('downleft.png'),('downright.png'),('downthenleft.png'),('downthenright.png'),('drinkingfountain.png'),('drinkingwater.png'),('drugs.png'),('drugs_2.png'),('elevator.png'),('embassy.png'),('emblem-art.png'),('emblem-photos.png'),('entrance.png'),('escalator-down.png'),('escalator-up.png'),('exit.png'),('expert.png'),('explosion.png'),('face-devilish.png'),('face-embarrassed.png'),('factory.png'),('factory_2.png'),('fallingrocks.png'),('family.png'),('farm.png'),('farm_2.png'),('fastfood.png'),('fastfood_2.png'),('festival-itinerant.png'),('festival.png'),('findajob.png'),('findjob.png'),('findjob_2.png'),('fire-extinguisher.png'),('fire.png'),('firemen.png'),('firemen_2.png'),('fireworks.png'),('firstaid.png'),('fishing.png'),('fishing_2.png'),('fishingshop.png'),('fitnesscenter.png'),('fjord.png'),('flood.png'),('flowers.png'),('flowers_2.png'),('followpath.png'),('foodtruck.png'),('forest.png'),('fortress.png'),('fossils.png'),('fountain.png'),('friday.png'),('friday_2.png'),('friends.png'),('friends_2.png'),('garden.png'),('gateswalls.png'),('gazstation.png'),('gazstation_2.png'),('geyser.png'),('gifts.png'),('girlfriend.png'),('girlfriend_2.png'),('glacier.png'),('golf.png'),('golf_2.png'),('gondola.png'),('gourmet.png'),('grocery.png'),('gun.png'),('gym.png'),('hairsalon.png'),('handball.png'),('hanggliding.png'),('hats.png'),('headstone.png'),('headstonejewish.png'),('helicopter.png'),('highway.png'),('highway_2.png'),('hiking-tourism.png'),('hiking.png'),('hiking_2.png'),('historicalquarter.png'),('home.png'),('home_2.png'),('horseriding.png'),('horseriding_2.png'),('hospital.png'),('hospital_2.png'),('hostel.png'),('hotairballoon.png'),('hotel.png'),('hotel1star.png'),('hotel2stars.png'),('hotel3stars.png'),('hotel4stars.png'),('hotel5stars.png'),('hotel_2.png'),('house.png'),('hunting.png'),('icecream.png'),('icehockey.png'),('iceskating.png'),('im-user.png'),('index.html'),('info.png'),('info_2.png'),('jewelry.png'),('jewishquarter.png'),('jogging.png'),('judo.png'),('justice.png'),('justice_2.png'),('karate.png'),('karting.png'),('kayak.png'),('laboratory.png'),('lake.png'),('laundromat.png'),('left.png'),('leftthendown.png'),('leftthenup.png'),('library.png'),('library_2.png'),('lighthouse.png'),('liquor.png'),('lock.png'),('lockerrental.png'),('magicshow.png'),('mainroad.png'),('massage.png'),('military.png'),('military_2.png'),('mine.png'),('mobilephonetower.png'),('modernmonument.png'),('moderntower.png'),('monastery.png'),('monday.png'),('monday_2.png'),('monument.png'),('mosque.png'),('motorbike.png'),('motorcycle.png'),('movierental.png'),('museum-archeological.png'),('museum-art.png'),('museum-crafts.png'),('museum-historical.png'),('museum-naval.png'),('museum-science.png'),('museum-war.png'),('museum.png'),('museum_2.png'),('music-classical.png'),('music-hiphop.png'),('music-live.png'),('music-rock.png'),('music.png'),('music_2.png'),('nanny.png'),('newsagent.png'),('nordicski.png'),('nursery.png'),('observatory.png'),('oilpumpjack.png'),('olympicsite.png'),('ophthalmologist.png'),('pagoda.png'),('paint.png'),('palace.png'),('panoramic.png'),('panoramic180.png'),('park-urban.png'),('park.png'),('park_2.png'),('parkandride.png'),('parking.png'),('parking_2.png'),('party.png'),('patisserie.png'),('pedestriancrossing.png'),('pend.png'),('pens.png'),('perfumery.png'),('personal.png'),('personalwatercraft.png'),('petroglyphs.png'),('pets.png'),('phones.png'),('photo.png'),('photodown.png'),('photodownleft.png'),('photodownright.png'),('photography.png'),('photoleft.png'),('photoright.png'),('photoup.png'),('photoupleft.png'),('photoupright.png'),('picnic.png'),('pizza.png'),('pizza_2.png'),('places-unvisited.png'),('places-visited.png'),('planecrash.png'),('playground.png'),('playground_2.png'),('poker.png'),('poker_2.png'),('police.png'),('police2.png'),('police_2.png'),('pool-indoor.png'),('pool.png'),('pool_2.png'),('port.png'),('port_2.png'),('postal.png'),('postal_2.png'),('powerlinepole.png'),('powerplant.png'),('powersubstation.png'),('prison.png'),('publicart.png'),('racing.png'),('radiation.png'),('rain_2.png'),('rain_3.png'),('rattlesnake.png'),('realestate.png'),('realestate_2.png'),('recycle.png'),('recycle_2.png'),('recycle_3.png'),('regroup.png'),('regulier.png'),('resort.png'),('restaurant-barbecue.png'),('restaurant-buffet.png'),('restaurant-fish.png'),('restaurant-romantic.png'),('restaurant.png'),('restaurant_2.png'),('restaurantafrican.png'),('restaurantchinese.png'),('restaurantchinese_2.png'),('restaurantfishchips.png'),('restaurantgourmet.png'),('restaurantgreek.png'),('restaurantindian.png'),('restaurantitalian.png'),('restaurantjapanese.png'),('restaurantjapanese_2.png'),('restaurantkebab.png'),('restaurantkorean.png'),('restaurantmediterranean.png'),('restaurantmexican.png'),('restaurantthai.png'),('restaurantturkish.png'),('revolution.png'),('right.png'),('rightthendown.png'),('rightthenup.png'),('riparian.png'),('ropescourse.png'),('rowboat.png'),('rugby.png'),('ruins.png'),('sailboat-sport.png'),('sailboat-tourism.png'),('sailboat.png'),('salle-fete.png'),('satursday.png'),('satursday_2.png'),('sauna.png'),('school.png'),('school_2.png'),('schrink.png'),('schrink_2.png'),('sciencecenter.png'),('seals.png'),('seniorsite.png'),('shadow.png'),('shelter-picnic.png'),('shelter-sleeping.png'),('shoes.png'),('shoes_2.png'),('shoppingmall.png'),('shore.png'),('shower.png'),('sight.png'),('skateboarding.png'),('skiing.png'),('skiing_2.png'),('skijump.png'),('skilift.png'),('smallcity.png'),('smokingarea.png'),('sneakers.png'),('snow.png'),('snowboarding.png'),('snowmobiling.png'),('snowshoeing.png'),('soccer.png'),('soccer2.png'),('soccer_2.png'),('spaceport.png'),('spectacle.png'),('speed100.png'),('speed110.png'),('speed120.png'),('speed130.png'),('speed20.png'),('speed30.png'),('speed40.png'),('speed50.png'),('speed60.png'),('speed70.png'),('speed80.png'),('speed90.png'),('speedhump.png'),('spelunking.png'),('stadium.png'),('statue.png'),('steamtrain.png'),('stop.png'),('stoplight.png'),('stoplight_2.png'),('strike.png'),('strike1.png'),('subway.png'),('sun.png'),('sun_2.png'),('sunday.png'),('sunday_2.png'),('supermarket.png'),('supermarket_2.png'),('surfing.png'),('suv.png'),('synagogue.png'),('tailor.png'),('tapas.png'),('taxi.png'),('taxi_2.png'),('taxiway.png'),('teahouse.png'),('telephone.png'),('templehindu.png'),('tennis.png'),('tennis2.png'),('tennis_2.png'),('tent.png'),('terrace.png'),('text.png'),('textiles.png'),('theater.png'),('theater_2.png'),('themepark.png'),('thunder.png'),('thunder_2.png'),('thursday.png'),('thursday_2.png'),('toilets.png'),('toilets_2.png'),('tollstation.png'),('tools.png'),('tower.png'),('toys.png'),('toys_2.png'),('trafficenforcementcamera.png'),('train.png'),('train_2.png'),('tram.png'),('trash.png'),('truck.png'),('truck_2.png'),('tuesday.png'),('tuesday_2.png'),('tunnel.png'),('turnleft.png'),('turnright.png'),('university.png'),('university_2.png'),('unnamed.png'),('up.png'),('upleft.png'),('upright.png'),('upthenleft.png'),('upthenright.png'),('usfootball.png'),('vespa.png'),('vet.png'),('video.png'),('videogames.png'),('videogames_2.png'),('villa.png'),('waitingroom.png'),('water.png'),('waterfall.png'),('watermill.png'),('waterpark.png'),('waterskiing.png'),('watertower.png'),('waterwell.png'),('waterwellpump.png'),('wedding.png'),('wednesday.png'),('wednesday_2.png'),('wetland.png'),('white1.png'),('white20.png'),('wifi.png'),('wifi_2.png'),('windmill.png'),('windsurfing.png'),('windturbine.png'),('winery.png'),('wineyard.png'),('workoffice.png'),('world.png'),('worldheritagesite.png'),('yoga.png'),('youthhostel.png'),('zipline.png'),('zoo.png'),('zoo_2.png');
/*!40000 ALTER TABLE `gis_simbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `tipe` int(4) NOT NULL DEFAULT '1',
  `urut` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `parrent` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Berita Desa',1,1,1,0),(2,'Produk Desa',1,3,2,0),(4,'Agenda Desa',2,2,1,0),(5,'Peraturan Desa',2,5,1,0),(6,'Laporan Desa',2,6,2,0),(8,'Panduan Layanan Desa',2,3,2,0),(17,'Peraturan Kebersihan Desa',1,0,2,5),(20,'Berita Lokal',1,0,2,1),(21,'Berita Kriminal',1,0,2,1),(22,'teks_berjalan',1,0,1,0);
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompok`
--

DROP TABLE IF EXISTS `kelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `id_ketua` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kode` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ketua` (`id_ketua`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompok`
--

LOCK TABLES `kelompok` WRITE;
/*!40000 ALTER TABLE `kelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompok_anggota`
--

DROP TABLE IF EXISTS `kelompok_anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompok_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` int(11) NOT NULL,
  `id_penduduk` int(11) NOT NULL,
  `no_anggota` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kelompok` (`id_kelompok`,`id_penduduk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompok_anggota`
--

LOCK TABLES `kelompok_anggota` WRITE;
/*!40000 ALTER TABLE `kelompok_anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompok_anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompok_master`
--

DROP TABLE IF EXISTS `kelompok_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompok_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `deskripsi` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompok_master`
--

LOCK TABLES `kelompok_master` WRITE;
/*!40000 ALTER TABLE `kelompok_master` DISABLE KEYS */;
INSERT INTO `kelompok_master` VALUES (1,'Kelompok Ternak','<p>Kelompok yang memelihara ternak</p>');
/*!40000 ALTER TABLE `kelompok_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasifikasi_analisis_keluarga`
--

DROP TABLE IF EXISTS `klasifikasi_analisis_keluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasifikasi_analisis_keluarga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasifikasi_analisis_keluarga`
--

LOCK TABLES `klasifikasi_analisis_keluarga` WRITE;
/*!40000 ALTER TABLE `klasifikasi_analisis_keluarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `klasifikasi_analisis_keluarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_artikel` int(7) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` VALUES (8,95,'Penduduk Biasa','penduduk@desaku.desa.id','Selamat atas keberhasilan Senggigi merayakan Hari Kemerdeakaan 2016!','2016-09-13 22:09:16',1),(9,775,'AHMAD ALLIF RIZKI','5201140706966997','Harap alamat keluarga kami diperbaik menjadi RT 002 Dusun Mangsit. \n\nTerima kasih.','2016-09-13 23:44:59',1),(10,775,'DENATUL SUARTINI','3275014601977005','Saya ke kantor desa kemarin jam 12:30 siang, tetapi tidak ada orang. Anak kami akan pergi ke Yogyakarta untuk kuliah selama 4 tahun. Apakah perlu kami laporkan?','2016-09-14 02:49:34',2),(11,775,'DENATUL SUARTINI','3275014601977005','Laporan ini tidak relevan. Hanya berisi komentar saja.','2016-09-14 03:05:02',2);
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontak`
--

DROP TABLE IF EXISTS `kontak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontak`
--

LOCK TABLES `kontak` WRITE;
/*!40000 ALTER TABLE `kontak` DISABLE KEYS */;
/*!40000 ALTER TABLE `kontak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontak_grup`
--

DROP TABLE IF EXISTS `kontak_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontak_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_grup` varchar(30) NOT NULL,
  `id_kontak` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontak_grup`
--

LOCK TABLES `kontak_grup` WRITE;
/*!40000 ALTER TABLE `kontak_grup` DISABLE KEYS */;
/*!40000 ALTER TABLE `kontak_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(4) NOT NULL,
  `parrent` int(4) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,'Jalan','','FFCD42',0,1,1),(2,'Jalan Raya','','FFCD42',2,66,1),(3,'Jalan Kampung','','',2,66,1),(4,'Ring Road','','',2,66,1),(5,'Sungai','','FFFFFF',0,1,1),(6,'Selokan','','',2,70,1);
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_bulanan`
--

DROP TABLE IF EXISTS `log_bulanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_bulanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pend` int(11) NOT NULL,
  `lk` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `kk` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kk_lk` int(11) DEFAULT NULL,
  `kk_pr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_bulanan`
--

LOCK TABLES `log_bulanan` WRITE;
/*!40000 ALTER TABLE `log_bulanan` DISABLE KEYS */;
INSERT INTO `log_bulanan` VALUES (1,97,46,51,37,'2017-04-10 18:01:54',28,9),(2,97,46,51,37,'2017-05-10 13:03:26',28,9),(3,97,46,51,37,'2017-06-05 02:08:30',28,9),(4,97,46,51,37,'2017-07-03 04:19:17',28,9),(5,97,46,51,37,'2017-07-31 17:37:30',28,9),(6,97,46,51,37,'2017-09-04 22:13:41',28,9),(7,97,46,51,37,'2017-10-29 01:37:57',28,9),(8,97,46,51,37,'2017-11-27 17:51:11',28,9),(9,98,47,51,37,'2017-12-11 16:54:16',28,9);
/*!40000 ALTER TABLE `log_bulanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_keluarga`
--

DROP TABLE IF EXISTS `log_keluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_keluarga` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_kk` int(11) NOT NULL,
  `kk_sex` tinyint(2) DEFAULT NULL,
  `id_peristiwa` int(4) NOT NULL,
  `tgl_peristiwa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kk` (`id_kk`,`id_peristiwa`,`tgl_peristiwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_keluarga`
--

LOCK TABLES `log_keluarga` WRITE;
/*!40000 ALTER TABLE `log_keluarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_keluarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_penduduk`
--

DROP TABLE IF EXISTS `log_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_penduduk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) NOT NULL,
  `id_detail` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl_peristiwa` date NOT NULL,
  `catatan` text,
  `no_kk` decimal(16,0) DEFAULT NULL,
  `nama_kk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pend` (`id_pend`,`id_detail`,`tgl_peristiwa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_penduduk`
--

LOCK TABLES `log_penduduk` WRITE;
/*!40000 ALTER TABLE `log_penduduk` DISABLE KEYS */;
INSERT INTO `log_penduduk` VALUES (1,98,5,'2017-12-11 16:54:16','12','2017','0000-00-00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `log_penduduk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_perubahan_penduduk`
--

DROP TABLE IF EXISTS `log_perubahan_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_perubahan_penduduk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) NOT NULL,
  `id_cluster` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_perubahan_penduduk`
--

LOCK TABLES `log_perubahan_penduduk` WRITE;
/*!40000 ALTER TABLE `log_perubahan_penduduk` DISABLE KEYS */;
INSERT INTO `log_perubahan_penduduk` VALUES (1,98,'1','2012-12-16 16:00:00');
/*!40000 ALTER TABLE `log_perubahan_penduduk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_surat`
--

DROP TABLE IF EXISTS `log_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_format_surat` int(3) NOT NULL,
  `id_pend` int(11) DEFAULT NULL,
  `id_pamong` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nama_surat` varchar(100) DEFAULT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `nik_non_warga` decimal(16,0) DEFAULT NULL,
  `nama_non_warga` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_surat`
--

LOCK TABLES `log_surat` WRITE;
/*!40000 ALTER TABLE `log_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokasi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `desk` text NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `lat` varchar(30) NOT NULL,
  `lng` varchar(30) NOT NULL,
  `ref_point` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_point` (`ref_point`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokasi`
--

LOCK TABLES `lokasi` WRITE;
/*!40000 ALTER TABLE `lokasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_sosial`
--

DROP TABLE IF EXISTS `media_sosial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_sosial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` text NOT NULL,
  `link` text NOT NULL,
  `nama` varchar(100) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_sosial`
--

LOCK TABLES `media_sosial` WRITE;
/*!40000 ALTER TABLE `media_sosial` DISABLE KEYS */;
INSERT INTO `media_sosial` VALUES (1,'fb.png','https://www.facebook.com/groups/OpenSID/','Facebook',1),(2,'twt.png','','Twitter',1),(3,'goo.png','','Google Plus',1),(4,'yb.png','','YouTube',1),(5,'ins.png','','Instagram',1);
/*!40000 ALTER TABLE `media_sosial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `tipe` int(4) NOT NULL,
  `parrent` int(4) NOT NULL DEFAULT '1',
  `link_tipe` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '1',
  `urut` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (16,'Profil Desa','artikel/32',1,1,1,1,NULL),(17,'Pemerintahan Desa','artikel/85',1,1,1,1,NULL),(19,'Lembaga Masyarakat','artikel/38',1,1,1,2,NULL),(23,'Teras Desa','',2,1,1,1,NULL),(24,'Data Desa','artikel/97',1,1,0,1,NULL),(31,'Data Wilayah Administratif','wilayah',3,24,1,1,NULL),(32,'Data Pendidikan dalam KK','statistik/0',3,24,1,1,NULL),(33,'Data Pendidikan Ditempuh','statistik/14',3,24,0,1,NULL),(34,'Data Pekerjaan','statistik/1',3,24,1,1,NULL),(35,'Data Agama','statistik/3',3,24,1,1,NULL),(36,'Data Jenis Kelamin','statistik/4',3,24,1,1,NULL),(40,'Data Golongan Darah','statistik/7',3,24,1,2,NULL),(51,'Data Kelompok Umur','statistik/12',3,24,1,2,NULL),(52,'Data Penerima Raskin','statistik_k/2',3,24,1,2,NULL),(53,'Data Penerima Jamkesmas','statistik_k/3',3,24,1,2,NULL),(55,'Profil Wilayah Desa','artikel/33',3,16,1,1,NULL),(56,'Profil Masyarakat Desa','artikel/34',3,16,1,2,NULL),(57,'Visi dan Misi','artikel/93',3,17,0,1,NULL),(58,'Pemerintah Desa','artikel/92',3,17,0,1,NULL),(59,'Badan Permusyawaratan Desa','artikel/37',3,17,0,2,NULL),(62,'Berita Desa','',2,1,1,1,NULL),(63,'Agenda Desa','artikel/41',2,1,1,2,NULL),(64,'Peraturan Desa','peraturan',2,1,1,2,NULL),(65,'Panduan Layanan Desa','#',2,1,1,1,NULL),(66,'Produk Desa','produk',2,1,1,1,NULL),(68,'Undang undang','artikel/42',3,64,1,2,NULL),(69,'Peraturan Pemerintah','artikel/43',3,64,1,2,NULL),(70,'Peraturan Daerah','',3,64,1,2,NULL),(71,'Peraturan Bupati','',3,64,1,2,NULL),(72,'Peraturan Bersama KaDes','',3,64,1,2,NULL),(73,'Informasi Publik','#',2,1,1,1,NULL),(75,'Rencana Kerja Anggaran','',3,73,1,1,NULL),(76,'RAPB Desa','',3,73,1,1,NULL),(77,'APB Desa','',3,73,1,1,NULL),(78,'DPA','',3,73,1,1,NULL),(80,'Profil Potensi Desa','artikel/59',3,16,1,2,NULL),(84,'LKMD','artikel/62',3,18,1,1,NULL),(85,'PKK','artikel/63',3,18,1,1,NULL),(86,'Karang Taruna','artikel/64',3,18,1,1,NULL),(87,'RT RW','artikel/65',3,18,1,1,NULL),(88,'Linmas','artikel/70',3,18,1,1,NULL),(89,'TKP2KDes','artikel/66',3,18,1,1,NULL),(90,'KPAD','artikel/67',3,18,1,1,NULL),(91,'Kelompok Ternak','artikel/68',3,18,1,1,NULL),(92,'Kelompok Tani','artikel/69',3,18,1,1,NULL),(93,'Kelompok Ekonomi Lainya','artikel/71',3,18,1,1,NULL),(98,'LKPJ','',3,73,1,1,NULL),(99,'LPPD','',3,73,1,1,NULL),(100,'ILPPD','',3,73,1,1,NULL),(101,'Peraturan Desa','artikel/44',3,64,1,2,NULL),(102,'Peraturan Kepala Desa','artikel/45',3,64,1,2,NULL),(103,'Keputusan Kepala Desa','artikel/46',3,64,1,2,NULL),(104,'PBB','',3,73,1,1,NULL),(106,'Data Warga Negara','statistik/13',3,24,1,1,NULL),(108,'Data Kelas Sosial','statistik_k/1',3,24,1,2,NULL),(109,'Kontak','artikel/36',1,1,1,2,NULL),(110,'Peraturan Desa','peraturan',3,66,1,1,NULL),(112,'Coba','coba',2,1,1,1,NULL),(113,'','',3,109,0,1,NULL),(114,'Sejarah Desa','artikel/99',3,16,0,1,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox`
--

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
INSERT INTO `outbox` VALUES ('2017-12-11 18:20:27','0000-00-00 00:00:00','0000-00-00 00:00:00','23:59:59','00:00:00',NULL,'082157989119','Default_No_Compression',NULL,-1,'asdasdasd',1,'false',-1,NULL,'0000-00-00 00:00:00','default','');
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertanyaan` (
  `1` int(2) DEFAULT NULL,
  `Pendapatan perkapita perbulan` varchar(87) DEFAULT NULL,
  `36` int(2) DEFAULT NULL,
  `15` int(2) DEFAULT NULL,
  `24` int(2) DEFAULT NULL,
  `23` int(2) DEFAULT NULL,
  `26` int(2) DEFAULT NULL,
  `28` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertanyaan`
--

LOCK TABLES `pertanyaan` WRITE;
/*!40000 ALTER TABLE `pertanyaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertanyaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `tipe` int(4) NOT NULL,
  `parrent` int(4) NOT NULL DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (1,'Sarana Pendidikan','face-embarrassed.png',0,1,1),(2,'Sarana Transportasi','face-devilish.png',0,1,1),(3,'Sarana Kesehatan','emblem-photos.png',0,1,1),(4,'SMA','gateswalls.png',2,38,1),(5,'SMP (Sekolah Menengah Pertama)','arch.png',2,38,1),(6,'Masjid','mosque.png',2,54,1),(7,'Tempat Ibadah','emblem-art.png',0,1,1),(8,'Kuil','moderntower.png',2,54,1),(9,'RS','accerciser.png',2,40,1),(10,'Sarana Pendidikan','cabin.png',2,38,1);
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polygon`
--

DROP TABLE IF EXISTS `polygon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polygon` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(4) NOT NULL,
  `parrent` int(4) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polygon`
--

LOCK TABLES `polygon` WRITE;
/*!40000 ALTER TABLE `polygon` DISABLE KEYS */;
INSERT INTO `polygon` VALUES (1,'rawan topan','','7C78FF',0,1,1),(2,'jalur selokan','','F4FF59',0,1,1);
/*!40000 ALTER TABLE `polygon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  `ndesc` varchar(200) DEFAULT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'Raskin',2,'','2015-12-13','2017-12-13',0,NULL),(2,'BLSM',2,'','2015-12-13','2017-12-13',0,NULL),(3,'PKH',2,'','2015-12-13','2017-12-13',0,NULL),(4,'Bedah Rumah',2,'','2015-12-13','2017-12-13',0,NULL),(5,'JAMKESMAS',1,'','2015-12-13','2017-12-13',0,NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_peserta`
--

DROP TABLE IF EXISTS `program_peserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peserta` decimal(16,0) NOT NULL,
  `program_id` int(11) NOT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  `no_id_kartu` varchar(30) DEFAULT NULL,
  `kartu_nik` decimal(16,0) DEFAULT NULL,
  `kartu_nama` varchar(100) DEFAULT NULL,
  `kartu_tempat_lahir` varchar(100) DEFAULT NULL,
  `kartu_tanggal_lahir` date DEFAULT NULL,
  `kartu_alamat` varchar(200) DEFAULT NULL,
  `kartu_peserta` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_peserta`
--

LOCK TABLES `program_peserta` WRITE;
/*!40000 ALTER TABLE `program_peserta` DISABLE KEYS */;
INSERT INTO `program_peserta` VALUES (2,5201140104126994,1,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(3,5201140105136997,1,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(4,5201140104126995,2,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(5,5201140105136997,2,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(6,5201140104126995,3,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(7,5201140105136997,3,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(8,5201140104166999,4,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(9,5201140105136997,4,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(10,5201142005716996,5,2,NULL,NULL,NULL,NULL,NULL,NULL,''),(11,5201140706966997,5,2,NULL,NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `program_peserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinsi`
--

DROP TABLE IF EXISTS `provinsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinsi` (
  `kode` tinyint(2) NOT NULL DEFAULT '0',
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinsi`
--

LOCK TABLES `provinsi` WRITE;
/*!40000 ALTER TABLE `provinsi` DISABLE KEYS */;
INSERT INTO `provinsi` VALUES (11,'Aceh'),(12,'Sumatera Utara'),(13,'Sumatera Barat'),(14,'Riau'),(15,'Jambi'),(16,'Sumatera Selatan'),(17,'Bengkulu'),(18,'Lampung'),(19,'Kepulauan Bangka Belitung'),(21,'Kepulauan Riau'),(31,'DKI Jakarta'),(32,'Jawa Barat'),(33,'Jawa Tengah'),(34,'DI Yogyakarta'),(35,'Jawa Timur'),(36,'Banten'),(51,'Bali'),(52,'Nusa Tenggara Barat'),(53,'Nusa Tenggara Timur'),(61,'Kalimantan Barat'),(62,'Kalimantan Tengah'),(63,'Kalimantan Selatan'),(64,'Kalimantan Timur'),(65,'Kalimantan Utara'),(71,'Sulawesi Utara'),(72,'Sulawesi Tengah'),(73,'Sulawesi Selatan'),(74,'Sulawesi Tenggara'),(75,'Gorontalo'),(76,'Sulawesi Barat'),(81,'Maluku'),(82,'Maluku Utara'),(91,'Papua'),(92,'Papua Barat');
/*!40000 ALTER TABLE `provinsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentitems`
--

DROP TABLE IF EXISTS `sentitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentitems`
--

LOCK TABLES `sentitems` WRITE;
/*!40000 ALTER TABLE `sentitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `sentitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_aplikasi`
--

DROP TABLE IF EXISTS `setting_aplikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_aplikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `jenis` varchar(30) DEFAULT NULL,
  `kategori` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_aplikasi`
--

LOCK TABLES `setting_aplikasi` WRITE;
/*!40000 ALTER TABLE `setting_aplikasi` DISABLE KEYS */;
INSERT INTO `setting_aplikasi` VALUES (1,'sebutan_kabupaten','kabupaten','Pengganti sebutan wilayah kabupaten','',''),(2,'sebutan_kabupaten_singkat','kab.','Pengganti sebutan singkatan wilayah kabupaten','',''),(3,'sebutan_kecamatan','kecamatan','Pengganti sebutan wilayah kecamatan','',''),(4,'sebutan_kecamatan_singkat','kec.','Pengganti sebutan singkatan wilayah kecamatan','',''),(5,'sebutan_desa','Kampung','Pengganti sebutan wilayah desa','',''),(6,'sebutan_dusun','Kampung','Pengganti sebutan wilayah dusun','',''),(7,'sebutan_camat','camat','Pengganti sebutan jabatan camat','',''),(8,'website_title','Website Resmi','Judul tab browser modul web','','web'),(9,'login_title','SIMKBS','Judul tab browser halaman login modul administrasi','',''),(10,'admin_title','Sistem Informasi Manajemen Keluarga Berau Sejahtera','Judul tab browser modul administrasi','',''),(11,'web_theme','hadakewa','Tema penampilan modul web','','web'),(12,'offline_mode','0','Apakah modul web akan ditampilkan atau tidak','',''),(13,'enable_track','0','Apakah akan mengirimkan data statistik ke tracker','boolean',''),(14,'dev_tracker','','Host untuk tracker pada development','','development'),(15,'nomor_terakhir_semua_surat','0','Gunakan nomor surat terakhir untuk seluruh surat tidak per jenis surat','boolean',''),(16,'google_key','','Google API Key untuk Google Maps','','web'),(17,'libreoffice_path','','Path tempat instal libreoffice di server SID','',''),(18,'sumber_gambar_slider','1','Sumber gambar slider besar',NULL,NULL),(19,'sebutan_singkatan_kadus','kawil','Sebutan singkatan jabatan kepala dusun',NULL,NULL),(20,'current_version','2.6','Versi sekarang untuk migrasi',NULL,NULL);
/*!40000 ALTER TABLE `setting_aplikasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_modul`
--

DROP TABLE IF EXISTS `setting_modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_modul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modul` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `ikon` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '2',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `ikon_kecil` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_modul`
--

LOCK TABLES `setting_modul` WRITE;
/*!40000 ALTER TABLE `setting_modul` DISABLE KEYS */;
INSERT INTO `setting_modul` VALUES (1,'SID Home','hom_desa',1,'go-home-5.png',1,2,1,'fa fa-home fa-lg'),(2,'Penduduk','penduduk/clear',1,'preferences-contact-list.png',2,2,0,'fa fa-group fa-lg'),(3,'Statistik','statistik',1,'statistik.png',3,2,0,'fa fa-bar-chart fa-lg'),(4,'Cetak Surat','surat',1,'applications-office-5.png',4,2,0,'fa fa-print fa-lg'),(5,'Analisis','analisis_master/clear',1,'analysis.png',6,2,0,'fa fa-dashboard fa-lg'),(6,'Bantuan','program_bantuan',1,'program.png',7,2,0,'fa fa-folder-open fa-lg'),(7,'Persil','data_persil/clear',1,'persil.png',8,2,0,'fa fa-road fa-lg'),(8,'Plan','plan',1,'plan.png',9,2,0,'fa fa-sitemap fa-lg'),(9,'Peta','gis',1,'gis.png',10,2,0,'fa fa-map fa-lg'),(10,'SMS','sms',1,'mail-send-receive.png',11,2,0,'fa fa-envelope-o fa-lg'),(11,'Pengguna','man_user/clear',1,'system-users.png',12,1,1,'fa fa-user-plus fa-lg'),(12,'Database','database',1,'database.png',13,1,0,'fa fa-database fa-lg'),(13,'Admin Web','web',1,'message-news.png',14,4,0,'fa fa-cloud fa-lg'),(14,'Laporan','lapor',1,'mail-reply-all.png',15,2,0,'fa fa-comments fa-lg'),(15,'Sekretariat','sekretariat',1,'applications-office-5.png',5,2,0,'fa fa-print fa-lg');
/*!40000 ALTER TABLE `setting_modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_sms`
--

DROP TABLE IF EXISTS `setting_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_sms` (
  `autoreply_text` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_sms`
--

LOCK TABLES `setting_sms` WRITE;
/*!40000 ALTER TABLE `setting_sms` DISABLE KEYS */;
INSERT INTO `setting_sms` VALUES ('Terima kasih pesan Anda telah kami terima.');
/*!40000 ALTER TABLE `setting_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surat_masuk`
--

DROP TABLE IF EXISTS `surat_masuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_urut` smallint(5) DEFAULT NULL,
  `tanggal_penerimaan` date NOT NULL,
  `nomor_surat` varchar(20) DEFAULT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `tanggal_surat` date NOT NULL,
  `pengirim` varchar(100) DEFAULT NULL,
  `isi_singkat` varchar(200) DEFAULT NULL,
  `disposisi_kepada` varchar(50) DEFAULT NULL,
  `isi_disposisi` varchar(200) DEFAULT NULL,
  `berkas_scan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surat_masuk`
--

LOCK TABLES `surat_masuk` WRITE;
/*!40000 ALTER TABLE `surat_masuk` DISABLE KEYS */;
/*!40000 ALTER TABLE `surat_masuk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_traffic`
--

DROP TABLE IF EXISTS `sys_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_traffic` (
  `Tanggal` date NOT NULL,
  `ipAddress` text NOT NULL,
  `Jumlah` int(10) NOT NULL,
  PRIMARY KEY (`Tanggal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_traffic`
--

LOCK TABLES `sys_traffic` WRITE;
/*!40000 ALTER TABLE `sys_traffic` DISABLE KEYS */;
INSERT INTO `sys_traffic` VALUES ('2014-11-15','::1{}',1),('2014-11-16','::1{}',1),('2014-11-18','',3),('2014-11-21','',3),('2014-11-26','::1{}',1),('2014-12-03','127.0.0.1{}',1),('2014-12-04','',3),('2014-12-05','',5),('2014-12-06','127.0.0.1{}',1),('2014-12-08','127.0.0.1{}',1),('2014-12-09','127.0.0.1{}',1),('2014-12-10','',3),('2016-05-25','',2),('2016-05-26','',4),('2016-05-27','',2),('2016-05-28','10.0.2.2{}',1),('2016-05-29','',2),('2016-05-30','10.0.2.2{}',1),('2016-05-31','',3),('2016-06-01','10.0.2.2{}',1),('2016-08-23','',6),('2016-08-24','',7),('2016-08-26','',8),('2016-08-27','192.168.1.66{}',1),('2016-08-28','',3),('2016-08-29','',2),('2016-08-30','',3),('2016-08-31','127.0.0.1{}',1),('2016-09-02','',4),('2016-09-03','',2),('2016-09-04','10.0.2.2{}',1),('2016-09-05','',2),('2016-09-07','',2),('2016-09-08','10.0.2.2{}',1),('2016-09-09','',4),('2016-09-10','',4),('2016-09-11','',2),('2016-09-14','',4),('2017-07-16','10.0.2.2{}',1),('2017-12-10','',2);
/*!40000 ALTER TABLE `sys_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_cacat`
--

DROP TABLE IF EXISTS `tweb_cacat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_cacat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_cacat`
--

LOCK TABLES `tweb_cacat` WRITE;
/*!40000 ALTER TABLE `tweb_cacat` DISABLE KEYS */;
INSERT INTO `tweb_cacat` VALUES (1,'CACAT FISIK'),(2,'CACAT NETRA/BUTA'),(3,'CACAT RUNGU/WICARA'),(4,'CACAT MENTAL/JIWA'),(5,'CACAT FISIK DAN MENTAL'),(6,'CACAT LAINNYA'),(7,'TIDAK CACAT');
/*!40000 ALTER TABLE `tweb_cacat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_cara_kb`
--

DROP TABLE IF EXISTS `tweb_cara_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_cara_kb` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_cara_kb`
--

LOCK TABLES `tweb_cara_kb` WRITE;
/*!40000 ALTER TABLE `tweb_cara_kb` DISABLE KEYS */;
INSERT INTO `tweb_cara_kb` VALUES (1,'Pil',2),(2,'IUD',2),(3,'Suntik',2),(4,'Kondom',1),(5,'Susuk KB',2),(6,'Sterilisasi Wanita',2),(7,'Sterilisasi Pria',1),(99,'Lainnya',3);
/*!40000 ALTER TABLE `tweb_cara_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_desa_pamong`
--

DROP TABLE IF EXISTS `tweb_desa_pamong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_desa_pamong` (
  `pamong_id` int(5) NOT NULL AUTO_INCREMENT,
  `pamong_nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nik` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jabatan` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `pamong_status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tgl_terdaftar` date DEFAULT NULL,
  `pamong_ttd` tinyint(1) DEFAULT NULL,
  `foto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pamong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_desa_pamong`
--

LOCK TABLES `tweb_desa_pamong` WRITE;
/*!40000 ALTER TABLE `tweb_desa_pamong` DISABLE KEYS */;
INSERT INTO `tweb_desa_pamong` VALUES (14,'Muhammad Ilham ','','','Kepala Desa','1','2014-04-20',1,''),(20,'Mustahiq S.Adm','197905062010011007','5201140506790001','Sekretaris Desa','1','2016-08-23',NULL,''),(21,'Syafruddin ','-','5201140911720004','Kaur Pemerintahan ','1','2016-08-23',NULL,''),(22,'Supardi Rustam ','-','5201140101710003','Kaur Umum ','1','2016-08-23',NULL,''),(23,'Mardiana ','-','5201145203810001','Kaur Keuangan','1','2016-08-23',NULL,''),(24,'Syafi-i. SE ','-','5201140506730002','Kaur Pembangunan ','1','2016-08-23',NULL,''),(25,'Mahrup ','','','Kaur Keamanan dan Ketertiban','1','2016-08-23',NULL,'');
/*!40000 ALTER TABLE `tweb_desa_pamong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_golongan_darah`
--

DROP TABLE IF EXISTS `tweb_golongan_darah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_golongan_darah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_golongan_darah`
--

LOCK TABLES `tweb_golongan_darah` WRITE;
/*!40000 ALTER TABLE `tweb_golongan_darah` DISABLE KEYS */;
INSERT INTO `tweb_golongan_darah` VALUES (1,'A'),(2,'B'),(3,'AB'),(4,'O'),(5,'A+'),(6,'A-'),(7,'B+'),(8,'B-'),(9,'AB+'),(10,'AB-'),(11,'O+'),(12,'O-'),(13,'TIDAK TAHU');
/*!40000 ALTER TABLE `tweb_golongan_darah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_keluarga`
--

DROP TABLE IF EXISTS `tweb_keluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_keluarga` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_kk` varchar(160) DEFAULT NULL,
  `nik_kepala` varchar(200) DEFAULT NULL,
  `tgl_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_sosial` int(4) DEFAULT NULL,
  `tgl_cetak_kk` datetime DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `id_cluster` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nik_kepala` (`nik_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_keluarga`
--

LOCK TABLES `tweb_keluarga` WRITE;
/*!40000 ALTER TABLE `tweb_keluarga` DISABLE KEYS */;
INSERT INTO `tweb_keluarga` VALUES (1,'5201140104126994','1','2016-09-14 05:28:03',NULL,NULL,NULL,4),(2,'5201140104126995','5','2016-09-14 05:28:03',NULL,NULL,NULL,8),(3,'5201140104166999','9','2016-09-14 05:28:03',NULL,NULL,NULL,12),(4,'5201140105136997','12','2016-09-14 05:28:03',NULL,NULL,NULL,16),(5,'5201140106166996','16','2016-09-14 05:28:03',NULL,NULL,NULL,8),(6,'5201140106167002','17','2016-09-14 05:28:03',NULL,NULL,NULL,17),(7,'5201140106167003','19','2016-09-14 05:28:03',NULL,NULL,NULL,16),(8,'5201140107126996','21','2016-09-14 05:28:03',NULL,NULL,NULL,18),(9,'5201140108146995','25','2016-09-14 05:28:03',NULL,NULL,NULL,18),(10,'5201140109126996','26','2016-09-14 05:28:03',NULL,NULL,NULL,19),(11,'5201140109156994','30','2016-09-14 05:28:03',NULL,NULL,NULL,19),(12,'5201140110137011','32','2016-09-14 05:28:03',NULL,NULL,NULL,20),(13,'5201140110137038','35','2016-09-14 05:28:03',NULL,NULL,NULL,18),(14,'5201140110156997','37','2016-09-14 05:28:03',NULL,NULL,NULL,18),(15,'5201140111126997','38','2016-09-14 05:28:03',NULL,NULL,NULL,17),(16,'5201140111126999','39','2016-09-14 05:28:03',NULL,NULL,NULL,21),(17,'5201140112107003','42','2016-09-14 05:28:03',NULL,NULL,NULL,12),(18,'5201140112126998','45','2016-09-14 05:28:03',NULL,NULL,NULL,22),(19,'5201140202167000','51','2016-09-14 05:28:03',NULL,NULL,NULL,23),(20,'5201140202167002','52','2016-09-14 05:28:03',NULL,NULL,NULL,24),(21,'5201140203136994','55','2016-09-14 05:28:03',NULL,NULL,NULL,8),(22,'5201140203136995','56','2016-09-14 05:28:03',NULL,NULL,NULL,16),(23,'5201140203167003','59','2016-09-14 05:28:03',NULL,NULL,NULL,23),(24,'5201140204166994','61','2016-09-14 05:28:03',NULL,NULL,NULL,25),(25,'5201140205156994','62','2016-09-14 05:28:03',NULL,NULL,NULL,26),(26,'5201140205156995','65','2016-09-14 05:28:03',NULL,NULL,NULL,26),(27,'5201140205156996','68','2016-09-14 05:28:03',NULL,NULL,NULL,25),(28,'5201140205156997','71','2016-09-14 05:28:03',NULL,NULL,NULL,25),(29,'5201140206157000','74','2016-09-14 05:28:03',NULL,NULL,NULL,17),(30,'5201140206157004','76','2016-09-14 05:28:03',NULL,NULL,NULL,27),(31,'5201140207156998','77','2016-09-14 05:28:03',NULL,NULL,NULL,28),(32,'5201140207157000','80','2016-09-14 05:28:03',NULL,NULL,NULL,29),(33,'5201140209156996','83','2016-09-14 05:28:03',NULL,NULL,NULL,30),(34,'5201140210137022','84','2016-09-14 05:28:03',NULL,NULL,NULL,29),(35,'5201140211117001','88','2016-09-14 05:28:03',NULL,NULL,NULL,31),(36,'5201140211117002','91','2016-09-14 05:28:03',NULL,NULL,NULL,31),(37,'5201140211117003','95','2016-09-14 05:28:03',NULL,NULL,NULL,31);
/*!40000 ALTER TABLE `tweb_keluarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_keluarga_sejahtera`
--

DROP TABLE IF EXISTS `tweb_keluarga_sejahtera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_keluarga_sejahtera` (
  `id` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_keluarga_sejahtera`
--

LOCK TABLES `tweb_keluarga_sejahtera` WRITE;
/*!40000 ALTER TABLE `tweb_keluarga_sejahtera` DISABLE KEYS */;
INSERT INTO `tweb_keluarga_sejahtera` VALUES (1,'Keluarga Pra Sejahtera'),(2,'Keluarga Sejahtera I'),(3,'Keluarga Sejahtera II'),(4,'Keluarga Sejahtera III'),(5,'Keluarga Sejahtera III Plus');
/*!40000 ALTER TABLE `tweb_keluarga_sejahtera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk`
--

DROP TABLE IF EXISTS `tweb_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nik` decimal(16,0) NOT NULL,
  `id_kk` int(11) DEFAULT '0',
  `kk_level` tinyint(2) NOT NULL DEFAULT '0',
  `id_rtm` int(11) NOT NULL,
  `rtm_level` int(11) NOT NULL,
  `sex` tinyint(4) unsigned DEFAULT NULL,
  `tempatlahir` varchar(100) NOT NULL,
  `tanggallahir` date DEFAULT NULL,
  `agama_id` int(10) unsigned NOT NULL,
  `pendidikan_kk_id` int(10) unsigned NOT NULL,
  `pendidikan_id` int(10) unsigned NOT NULL,
  `pendidikan_sedang_id` int(10) unsigned NOT NULL,
  `pekerjaan_id` int(10) unsigned NOT NULL,
  `status_kawin` tinyint(4) unsigned NOT NULL,
  `warganegara_id` int(10) unsigned NOT NULL,
  `dokumen_pasport` varchar(45) DEFAULT NULL,
  `dokumen_kitas` int(10) DEFAULT NULL,
  `ayah_nik` varchar(16) NOT NULL,
  `ibu_nik` varchar(16) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `golongan_darah_id` int(11) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `alamat_sebelumnya` varchar(200) NOT NULL,
  `alamat_sekarang` varchar(200) NOT NULL,
  `status_dasar` tinyint(4) NOT NULL DEFAULT '1',
  `hamil` int(1) DEFAULT NULL,
  `cacat_id` int(11) DEFAULT NULL,
  `sakit_menahun_id` int(11) NOT NULL,
  `akta_lahir` varchar(40) NOT NULL,
  `akta_perkawinan` varchar(40) NOT NULL,
  `tanggalperkawinan` date DEFAULT NULL,
  `akta_perceraian` varchar(40) NOT NULL,
  `tanggalperceraian` date DEFAULT NULL,
  `cara_kb_id` tinyint(2) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `tanggal_akhir_paspor` date DEFAULT NULL,
  `no_kk_sebelumnya` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tweb_penduduk_ibfk_1` (`id_cluster`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk`
--

LOCK TABLES `tweb_penduduk` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk` DISABLE KEYS */;
INSERT INTO `tweb_penduduk` VALUES (1,'AHLUL',5201142005716996,1,1,0,0,1,'MANGSIT','1970-05-20',1,3,0,18,26,2,1,'',0,'','','ARFAH','RAISAH','',13,4,1,'','',1,0,0,0,'','',NULL,'',NULL,0,NULL,NULL,NULL),(2,'AHMAD ALLIF RIZKI',5201140706966997,1,4,0,0,1,'MANGSIT','1995-06-07',1,1,0,18,1,1,1,'',0,'','','AHLUL','RUSDAH','',13,4,1,'','',1,0,0,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(3,'AHMAD HABIB',5201140301916995,1,4,0,0,1,'MANGSIT','1990-01-03',1,3,0,18,1,1,1,NULL,NULL,'','','AHLUL','RUSDAH','',13,4,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(4,'ADINI SEPTIA LISTA',5201145003976995,1,4,0,0,2,'MANGSIT','1996-03-10',1,4,0,18,2,2,1,NULL,NULL,'','','AHLUL','RUSDAH','',13,4,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(5,'AHYAR',5201141003666996,2,1,0,0,1,'JAKARTA','1965-03-10',1,5,0,18,88,2,1,NULL,NULL,'','','PAIMUN','SUPINAH','',13,8,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(6,'APTA MADA RIZKY ALAMSYAH',5201141412121724,2,4,0,0,1,'DEPOK','2002-12-14',1,2,0,18,3,1,1,NULL,NULL,'','','AHYAR','ALIYAH','',13,8,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(7,'ALIYAH',5201144609786995,2,3,0,0,2,'BEKASI','1977-09-06',1,5,0,18,2,2,1,NULL,NULL,'','','TAGOR SIPAHUTAR','AMAHWATI','',13,8,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(8,'ALPIANI',5201144301171725,2,4,0,0,2,'BOGOR','2007-01-03',1,1,0,18,1,1,1,NULL,NULL,'','','AHYAR','ALIYAH','',13,8,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(9,'ASHARI',5201140107867064,3,1,0,0,1,'KERANDANGAN','1985-12-30',1,5,0,18,88,2,1,NULL,NULL,'','','H. ABDUL KARIM','RADIAH','',13,12,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(10,'BACHTIAR HADI',5201142210181724,3,4,0,0,1,'MATARAM','2008-10-22',1,1,0,18,1,1,1,NULL,NULL,'','','ASHARI','ANGGUN LESTARI PRATAMA','',13,12,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(11,'ANGGUN LESTARI PRATAMA',5201146510916995,3,3,0,0,2,'SENGGIGI','1990-10-25',1,4,0,18,88,2,1,NULL,NULL,'','','SADIRAH','HJ. ROHANI','',13,12,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(12,'DAHRI',5201143112797117,4,1,0,0,1,'MASBAGIK','1978-12-31',1,3,0,18,88,2,1,NULL,NULL,'','','AMAQ SAHMINI','INAQ SAHMINI','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(13,'ERLANGGA DWIKO SAPUTRO',5201140705156994,4,4,0,0,1,'MENINTING','2014-05-07',1,1,0,18,1,1,1,NULL,NULL,'','','DAHRI','ASMIATUN','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(14,'FARIDAH',5201141107101724,4,4,0,0,1,'MASBAGIK','2000-07-11',1,3,0,18,3,1,1,NULL,NULL,'','','DAHRI','ASMIATUN','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(15,'ASMIATUN',5201147112817188,4,3,0,0,2,'MASBAGIK','1980-12-31',1,4,0,18,2,2,1,NULL,NULL,'','','AMAQ MUJAENI','INAQ SAHMINI','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(16,'BAIQ OLIVIA APRILLIANI',5201145211486994,5,1,0,0,2,'SENGGIGI','1947-11-12',1,1,0,18,1,4,1,NULL,NULL,'','','AMAQ SINAREP','INAQ SINAREP','',13,8,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(17,'FAUZI',5201141210906998,6,1,0,0,1,'KERANDANGAN','1989-10-12',1,5,0,18,3,1,1,NULL,NULL,'','','SABLI','RAOHUN','',13,17,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(18,'DELLA MAHARANI NINGSIH',5201147112947048,6,9,0,0,2,'KERANDANGAN','1993-12-31',1,4,0,18,1,1,1,NULL,NULL,'','','SABLI','RAOHUN','',13,17,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(19,'HAERUL FATONI',5201142911936995,7,1,0,0,1,'SENGGIGI','1992-11-29',1,5,0,18,15,2,1,NULL,NULL,'','','ANGKASAH','MARJANAH','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(20,'DENATUL SUARTINI',3275014601977005,7,3,0,0,2,'JAKARTA','1996-01-06',1,5,0,18,2,2,1,NULL,NULL,'','','G. AMIN. P','NGATI','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(21,'HERI IRAWAN',5201140607636994,8,1,0,0,1,'TELOKE','1962-07-06',1,3,0,18,9,2,1,NULL,NULL,'','','AMAK MAJUMI','INAK MIDAH','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(22,'HERMAN',5201140305936994,8,4,0,0,1,'SENGGIGI','1992-05-03',1,4,0,18,1,1,1,NULL,NULL,'','','HERI IRAWAN','DEWI SAULINA','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(23,'DEWI SAULINA',5201144808686994,8,3,0,0,2,'KEKERAN','1967-08-08',1,1,0,18,2,2,1,NULL,NULL,'','','H. ZAENUDIN','INAK NAH','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(24,'ELOK KHALISA SABRINA',5201144408886994,8,4,0,0,2,'SENGGIGI','1987-08-04',1,4,0,18,88,1,1,NULL,NULL,'','','SERIMAN','DEWI SAULINA','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(25,'I KETUT PAHING',5201142210806997,9,1,0,0,1,'MATARAM','1979-10-22',1,5,0,18,88,2,1,NULL,NULL,'','','-','-','',2,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(26,'IDA BAGUS MAS BUJANA',5201143112707040,10,1,0,0,1,'APIT AIK','1969-12-31',1,5,0,18,88,2,1,NULL,NULL,'','','SAHMIN','MAOSIN','',13,19,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(27,'JOKO PATMOTO',5201141009146994,10,4,0,0,1,'MANGSIT','2013-09-10',1,1,0,18,1,1,1,NULL,NULL,'','','IDA BAGUS MAS BUJANA','FITRIANI','',13,19,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(28,'KOMANG SALUN',5201143105121724,10,4,0,0,1,'KAYANGAN','2002-05-31',1,2,0,18,3,1,1,NULL,NULL,'','','AMILUDIN','FITRIANI','',13,19,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(29,'FITRIANI',5201145107836994,10,3,0,0,2,'KAYANGAN','1982-07-11',1,4,0,18,2,2,1,NULL,NULL,'','','REMBUK','SITIAH','',13,19,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(30,'LALU WAWAN DININGRAT',5201141206886994,11,1,0,0,1,'MANGSIT','1987-06-12',1,5,0,18,88,2,1,NULL,NULL,'','','MAHSUN SUBUH','SARDIAH','',13,19,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(31,'FITRIANI',5271016801926995,11,3,0,0,2,'MATARAM','1991-01-28',1,5,0,18,15,2,1,NULL,NULL,'','','UMAR','RUMINSIH','',13,19,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(32,'M. FA\'IZ AZAMI',5201143112897123,12,1,0,0,1,'GEGELANG','1988-12-31',1,5,0,18,88,2,1,NULL,NULL,'','','SAREH','SUTIMAH','',13,20,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(33,'HILMIATI',5201146402906994,12,3,0,0,2,'LOCO','1989-02-24',1,4,0,18,88,2,1,NULL,NULL,'','','H. MANSYUR','HJ. SA\'ADAH','',13,20,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(34,'HJ. PARIDAH',5201144912146994,12,4,0,0,2,'MENINTING','2013-12-09',1,1,0,18,1,1,1,NULL,NULL,'','','M. FA\'IZ AZAMI','HILMIATI','',13,20,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(35,'HJ. SAMIRAH',5201147112767266,13,1,0,0,2,'SENGGIGI','1975-12-31',1,3,0,18,15,3,1,NULL,NULL,'','','DAMSYAH','MARWIYAH','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(36,'HUR MINAH',5201144504131726,13,4,0,0,2,'SENGGIGI','2003-04-05',1,3,0,18,3,1,1,NULL,NULL,'','','MARSINI','KHODIJAH','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(37,'HUSNAH',5201145905936994,14,1,0,0,2,'LOTIM','1992-05-19',1,4,0,18,88,1,1,NULL,NULL,'','','-','-','',13,18,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(38,'IDA AYU OKA SUKERTI',5201147112587053,15,1,0,0,2,'KERANDANGAN','1957-12-31',1,3,0,18,88,4,1,NULL,NULL,'','','ANGGRAH','HABIBAH','',13,17,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(39,'M. JAYADI',5201143112837098,16,1,0,0,1,'SENGGIGI','1982-12-31',1,5,0,18,88,2,1,NULL,NULL,'','','IKHSAN','SAIDAH','',13,21,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(40,'JARIYAH',5201145406916994,16,3,0,0,2,'SENGGIGI','1990-06-14',1,4,0,18,2,2,1,NULL,NULL,'','','SEGEP','HURNIWATI','',13,21,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(41,'LIHAM SATUN',5201147112116995,16,4,0,0,2,'MATARAM','2010-12-31',1,1,0,18,1,1,1,NULL,NULL,'','','M. JAYADI','JARIYAH','',13,21,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(42,'M. NUR SAHID',5201140507916996,17,1,0,0,1,'KERANDANGAN','1990-07-05',1,4,0,18,88,2,1,NULL,NULL,'','','-','-','',13,12,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(43,'MADE ASTAWE',5201142503181724,17,4,0,0,1,'KERANDANGAN','2008-03-25',1,1,0,18,1,1,1,NULL,NULL,'','','M. NUR SAHID','MAISAH','',13,12,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(44,'MAISAH',5201144605936994,17,3,0,0,2,'KERANDANGAN','1992-05-06',4,1,0,18,88,2,1,NULL,NULL,'','','-','-','',13,12,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(45,'MARSUNIN YOGA PRATAMA',5201143112677056,18,1,0,0,1,'PEJARAKAN','1966-12-31',1,3,0,18,9,2,1,NULL,NULL,'','','MISRAH','INAQ MISDAH','',13,22,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(46,'MARZUKI',5201141003966996,18,4,0,0,1,'LOCO','1995-03-10',1,5,0,18,3,1,1,NULL,NULL,'','','MARSUNIN YOGA PRATAMA','MARLIA SAJIDA','',13,22,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(47,'MUHAMAD HAMDI',5201141706986996,18,4,0,0,1,'LOCO','1997-06-17',1,4,0,18,3,1,1,NULL,NULL,'','','MARSUNIN YOGA PRATAMA','MARLIA SAJIDA','',13,22,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(48,'MARLIA SAJIDA',5201147112707088,18,3,0,0,2,'PEJARAKAN','1969-12-31',1,3,0,18,2,2,1,NULL,NULL,'','','H. ZAINUDIN','INAQ NAH','',13,22,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(49,'MIRA FANDA',5201146704906995,18,4,0,0,2,'LOCO','1989-04-27',1,5,0,18,88,4,1,NULL,NULL,'','','MARSUNIN YOGA PRATAMA','MARLIA SAJIDA','',13,22,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(50,'MUNAAH',5201146304171724,18,4,0,0,2,'LOCO','2007-04-23',1,1,0,18,1,1,1,NULL,NULL,'','','MARSUNIN YOGA PRATAMA','MARLIA SAJIDA','',13,22,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(51,'MUHAMAD KABIR',5201140107917031,19,1,0,0,1,'SENGGIGI','1985-12-31',1,3,0,18,88,2,1,NULL,NULL,'','','MUNIAH','SALIKIN','',13,23,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(52,'MUHAMAD SUHAD',5201141704876995,20,1,0,0,1,'SENGGIGI','1982-12-10',1,5,0,18,15,2,1,NULL,NULL,'','','MUNIAH','HAJRIAH','',13,24,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(53,'MUHAMMAD HAIKAL FIRMANSYAH',5201140308151724,20,4,0,0,1,'LOCO','2005-08-03',1,2,0,18,1,1,1,NULL,NULL,'','','MUHAMAD SUHAD','KHADIJAH','',13,24,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(54,'MURNIAH',5201145904846994,20,3,0,0,2,'SETANGI','1991-03-04',1,4,0,18,2,2,1,NULL,NULL,'','','SAHABUDIN','SAKMAH','',13,24,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(55,'MURNIATI SAGITA',5201144112726996,21,1,0,0,2,'YOGYAKARTA','1971-12-01',1,5,0,18,88,2,1,NULL,NULL,'','','UMAR SANTOSA','MIRANTI','',1,8,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(56,'MUHAMMAD RIFAI',5201143105926995,22,1,0,0,1,'LOCO','1991-05-31',4,4,0,18,88,2,1,NULL,NULL,'','','I WAYAN MERTI','NI NYOMAN RENI','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(57,'NADIA ROSDIANA',5201144305936996,22,3,0,0,2,'MATARAM','1992-05-03',4,4,0,18,2,2,1,NULL,NULL,'','','I WAYAN PARTA','NI NENGAH SUDINI','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(58,'NI KOMANG PONIASIH',5201146206126994,22,4,0,0,2,'MATARAM','2011-06-22',4,1,0,18,1,1,1,NULL,NULL,'','','MURNIATI SAGITA','NADIA ROSDIANA','',13,16,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(59,'MUHAMMAD WIRDA MAULANA IBRAHIM',5201143112417056,23,1,0,0,1,'SENGGIGI','1940-12-31',1,1,0,18,9,2,1,NULL,NULL,'','','AMAQ SUN -ALM-','INAQ SUN -ALM-','',13,23,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(60,'NI LUH NITA SARI',5201147112466997,23,3,0,0,2,'SENTELUK','1945-12-31',1,1,0,18,2,2,1,NULL,NULL,'','','AMAQ IRAH','INAQ IRAH','',13,23,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(61,'NI NENGAH AYU KARSINI',5201145505946996,24,1,0,0,2,'SENGGIGI','1993-05-15',1,2,0,18,15,1,1,NULL,NULL,'','','H HAMDANI','SANERIAH','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(62,'MUKSAN',5201143112957094,25,1,0,0,1,'MANGSIT','1994-12-31',1,4,0,18,88,2,1,NULL,NULL,'','','MISDAH','RABIAH','',13,26,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(63,'NURHAYATI',5201145509146994,25,4,0,0,2,'MENINTING','2013-09-15',1,1,0,18,1,1,1,NULL,NULL,'','','MUKSAN','NUR\'AINI','',13,26,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(64,'MURSIDIN',5201142204966994,26,4,0,0,1,'MANGSIT','1995-04-22',1,3,0,18,11,1,1,NULL,NULL,'','','RUSNAH (ALM)','NURHIDAYAH','',13,26,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(65,'NURHIDAYAH',5201144209766995,26,1,0,0,2,'MANGSIT','1975-09-02',1,3,0,18,2,4,1,NULL,NULL,'','','ISMAIL','JUMINAH','',13,26,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(66,'NURJANAH',5201145005101724,26,4,0,0,2,'MONTONG','2000-05-10',1,4,0,18,3,1,1,NULL,NULL,'','','RUSNAH (ALM)','NURHIDAYAH','',13,26,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(67,'NURUL AINUN',5201144108121724,26,4,0,0,2,'MANGSIT','2002-08-01',1,2,0,18,3,1,1,NULL,NULL,'','','RUSNAH','NURHIDAYAH','',13,26,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(68,'MUSAHAB',5201141607936996,27,1,0,0,1,'LOTENG','1992-07-16',1,6,0,18,88,2,1,NULL,NULL,'','','LALU ROSIDI','BQ. ALISA','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(69,'NURUL FAIZAH',5201145003936994,27,3,0,0,2,'SENGGIGI','1992-03-10',1,5,0,18,88,2,1,NULL,NULL,'','','SAHUR','SARE\'AH','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(70,'NURUL HIDAYATI',5201147004136996,27,4,0,0,2,'MATARAM','2012-04-30',1,1,0,18,1,1,1,NULL,NULL,'','','MUSAHAB','NURUL FAIZAH','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(71,'NAPIAH',5201141303906995,28,1,0,0,1,'SENGGIGI','1989-03-13',1,4,0,18,11,2,1,NULL,NULL,'','','MUNIAH','HAJARIAH','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(72,'RACHEL YULIANTI',5201146507966995,28,3,0,0,2,'MELASE','1995-07-25',1,4,0,18,2,2,1,NULL,NULL,'','','LUKMAN','MUSNAH','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(73,'RAISHA MAULIDYA',5201144701156995,28,4,0,0,2,'MENINTING','2014-01-07',1,1,0,18,1,1,1,NULL,NULL,'','','NAPIAH','RACHEL YULIANTI','',13,25,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(74,'PATANUL HUSNUL',5201143112667000,29,1,0,0,1,'JAWA TIMUR','1965-12-31',1,5,0,18,88,2,1,NULL,NULL,'','','AHMAD','ASIH','',13,17,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(75,'RATNAWATY',5201145512796995,29,3,0,0,2,'KERANDANGAN','1978-12-15',1,5,0,18,84,2,1,NULL,NULL,'','','JUM','REMAH','',13,17,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(76,'RABITAH',5201140312896994,30,1,0,0,1,'KERANDANGAN','1988-12-03',4,4,0,18,88,1,1,NULL,NULL,'','','-','-','',13,27,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(77,'ROMI FAISAL',5201141506856997,31,1,0,0,1,'MANGSIT','1984-06-15',1,3,0,18,15,2,1,NULL,NULL,'','','MUNTAHAR','MAKNAH','',13,28,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(78,'RAUDATUL ILMI',5201145808816994,31,3,0,0,2,'IRENG DAYE','1980-08-18',1,4,0,18,2,2,1,NULL,NULL,'','','MUDAHIR','RUMISAH','',13,28,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(79,'ROHANI',5201144306116994,31,4,0,0,2,'MANGSIT','2010-06-03',1,1,0,18,1,1,1,NULL,NULL,'','','ROMI FAISAL','RAUDATUL ILMI','',13,28,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(80,'RUKIAH',5201145909946994,32,1,0,0,2,'SERANG','1993-09-19',1,4,0,18,88,3,1,NULL,NULL,'','','-','-','',13,29,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(81,'RUMALI',5201144507886994,32,9,0,0,2,'JAKARTA','1987-07-05',1,4,0,18,88,1,1,NULL,NULL,'','','-','-','',13,29,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(82,'RONI',5201140301836997,33,4,0,0,1,'DENPASAR','1982-01-03',4,5,0,18,15,1,1,NULL,NULL,'','','IDA BAGUS PUTU WIADNYA','RUSMAYANTI','',13,30,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(83,'RUSMAYANTI',5201145003546994,33,1,0,0,2,'DENPASAR','1953-03-10',4,5,0,18,88,2,1,NULL,NULL,'','','IDA BAGUS MAS','IDA AYU RAKA','',13,30,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(84,'RUSNI',5201143112707180,34,1,0,0,1,'KEKERAN','1969-12-31',1,3,0,18,9,2,1,NULL,NULL,'','','-','-','',13,29,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(85,'SAPIAH',5201147011726994,34,3,0,0,2,'KEKERAN','1971-11-30',1,3,0,18,2,2,1,NULL,NULL,'','','-','-','',13,29,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(86,'SAPINAH',5201145701966994,34,4,0,0,2,'SENGGIGI','1995-01-17',1,5,0,18,3,1,1,NULL,NULL,'','','RUSNI','SAPIAH','',13,29,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(87,'SARRA LANGELAND',5201145111946996,34,4,0,0,2,'SENGGIGI','1993-11-11',1,5,0,18,3,1,1,NULL,NULL,'','','RUSNI','SAPIAH','',13,29,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(88,'SAHRONI',5201143112617096,35,1,0,0,1,'MEDAS','1960-12-31',1,4,0,18,88,2,1,NULL,NULL,'','','SADIYAH','INAQ SADIAH','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(89,'SERIMAN',5201141012846995,35,4,0,0,1,'SENGGIGI','1983-12-10',1,5,0,18,15,1,1,NULL,NULL,'','','SAHRONI','NURLAELA','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(90,'SUNYOTOH',5201143112817139,35,4,0,0,1,'MEDAS','1980-12-31',1,5,0,18,15,1,1,NULL,NULL,'','','SAHRONI','NURLAELA','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(91,'SYARIFUL KALAM',5201141707776994,36,1,0,0,1,'SENGGIGI','1976-07-17',1,5,0,18,88,2,1,NULL,NULL,'','','H. ABDURAHMAN','NAFISAH','',1,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(92,'SITI AISYAH',5201146210776994,36,3,0,0,2,'SUKARAJA','1976-10-22',1,4,0,18,2,2,1,NULL,NULL,'','','AMINALLOH','RAEHAN','',2,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(93,'SITI PAOZIAH',5201146312161724,36,4,0,0,2,'SENGGIGI','2006-12-23',1,1,0,18,1,1,1,NULL,NULL,'','','SYARIFUL KALAM','SITI AISYAH','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(94,'SUKMA UTAMI',5201144607996998,36,4,0,0,2,'SENGGIGI','1998-07-06',1,4,0,18,3,1,1,NULL,NULL,'','','SYARIFUL KALAM','SITI AISYAH','',5,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(95,'WAHID ALIAS H. MAHSUN',5201141212816996,37,1,0,0,1,'SENGGIGI','1980-12-12',1,5,0,18,88,2,1,NULL,NULL,'','','H. ABDURRAHMAN','NAFISAH','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(96,'WAYAN EKA PRAWATA',5201142003136994,37,4,0,0,1,'GUNUNG SARI','2012-03-20',1,1,0,18,1,1,1,NULL,NULL,'','','WAHID ALIAS H. MAHSUN','ULFA WIDIAWATI','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(97,'ULFA WIDIAWATI',5201145203896994,37,3,0,0,2,'JOHAR PELITA','1988-03-12',1,5,0,18,88,2,1,NULL,NULL,'','','ZAMHARIN','SITIYAH','',13,31,1,'','',1,NULL,NULL,0,'','',NULL,'',NULL,NULL,NULL,NULL,NULL),(98,'TEST',0,0,0,0,0,1,'',NULL,1,0,0,0,0,0,0,'',0,'','','','','',1,36,1,'','',1,0,0,0,'','',NULL,'',NULL,NULL,'',NULL,'');
/*!40000 ALTER TABLE `tweb_penduduk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_agama`
--

DROP TABLE IF EXISTS `tweb_penduduk_agama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_agama` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_agama`
--

LOCK TABLES `tweb_penduduk_agama` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_agama` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_agama` VALUES (1,'ISLAM'),(2,'KRISTEN'),(3,'KATHOLIK'),(4,'HINDU'),(5,'BUDHA'),(6,'KHONGHUCU'),(7,'Kepercayaan Terhadap Tuhan YME / Lainnya');
/*!40000 ALTER TABLE `tweb_penduduk_agama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_hubungan`
--

DROP TABLE IF EXISTS `tweb_penduduk_hubungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_hubungan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_hubungan`
--

LOCK TABLES `tweb_penduduk_hubungan` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_hubungan` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_hubungan` VALUES (1,'KEPALA KELUARGA'),(2,'SUAMI'),(3,'ISTRI'),(4,'ANAK'),(5,'MENANTU'),(6,'CUCU'),(7,'ORANGTUA'),(8,'MERTUA'),(9,'FAMILI LAIN'),(10,'PEMBANTU'),(11,'LAINNYA');
/*!40000 ALTER TABLE `tweb_penduduk_hubungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_kawin`
--

DROP TABLE IF EXISTS `tweb_penduduk_kawin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_kawin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_kawin`
--

LOCK TABLES `tweb_penduduk_kawin` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_kawin` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_kawin` VALUES (1,'BELUM KAWIN'),(2,'KAWIN'),(3,'CERAI HIDUP'),(4,'CERAI MATI');
/*!40000 ALTER TABLE `tweb_penduduk_kawin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_mandiri`
--

DROP TABLE IF EXISTS `tweb_penduduk_mandiri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_mandiri` (
  `nik` decimal(16,0) NOT NULL,
  `pin` char(32) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `tanggal_buat` datetime DEFAULT NULL,
  `id_pend` int(9) NOT NULL,
  PRIMARY KEY (`id_pend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_mandiri`
--

LOCK TABLES `tweb_penduduk_mandiri` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_mandiri` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_mandiri` VALUES (5201140706966997,'3645e735f033e8482be0c7993fcba946','2016-09-14 12:53:47','2016-09-14 06:06:32',2),(3275014601977005,'3645e735f033e8482be0c7993fcba946','2016-09-14 12:51:53','2016-09-14 10:10:47',20);
/*!40000 ALTER TABLE `tweb_penduduk_mandiri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_map`
--

DROP TABLE IF EXISTS `tweb_penduduk_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_map` (
  `id` int(11) NOT NULL,
  `lat` varchar(24) NOT NULL,
  `lng` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_map`
--

LOCK TABLES `tweb_penduduk_map` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_map` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_map` VALUES (7,'-7.980601700336039','110.22508726486967'),(3,'-7.931639102143979','110.21375761399077');
/*!40000 ALTER TABLE `tweb_penduduk_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_pekerjaan`
--

DROP TABLE IF EXISTS `tweb_penduduk_pekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_pekerjaan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_pekerjaan`
--

LOCK TABLES `tweb_penduduk_pekerjaan` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_pekerjaan` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_pekerjaan` VALUES (1,'BELUM/TIDAK BEKERJA'),(2,'MENGURUS RUMAH TANGGA'),(3,'PELAJAR/MAHASISWA'),(4,'PENSIUNAN'),(5,'PEGAWAI NEGERI SIPIL (PNS)'),(6,'TENTARA NASIONAL INDONESIA (TNI)'),(7,'KEPOLISIAN RI (POLRI)'),(8,'PERDAGANGAN'),(9,'PETANI/PERKEBUNAN'),(10,'PETERNAK'),(11,'NELAYAN/PERIKANAN'),(12,'INDUSTRI'),(13,'KONSTRUKSI'),(14,'TRANSPORTASI'),(15,'KARYAWAN SWASTA'),(16,'KARYAWAN BUMN'),(17,'KARYAWAN BUMD'),(18,'KARYAWAN HONORER'),(19,'BURUH HARIAN LEPAS'),(20,'BURUH TANI/PERKEBUNAN'),(21,'BURUH NELAYAN/PERIKANAN'),(22,'BURUH PETERNAKAN'),(23,'PEMBANTU RUMAH TANGGA'),(24,'TUKANG CUKUR'),(25,'TUKANG LISTRIK'),(26,'TUKANG BATU'),(27,'TUKANG KAYU'),(28,'TUKANG SOL SEPATU'),(29,'TUKANG LAS/PANDAI BESI'),(30,'TUKANG JAHIT'),(31,'TUKANG GIGI'),(32,'PENATA RIAS'),(33,'PENATA BUSANA'),(34,'PENATA RAMBUT'),(35,'MEKANIK'),(36,'SENIMAN'),(37,'TABIB'),(38,'PARAJI'),(39,'PERANCANG BUSANA'),(40,'PENTERJEMAH'),(41,'IMAM MASJID'),(42,'PENDETA'),(43,'PASTOR'),(44,'WARTAWAN'),(45,'USTADZ/MUBALIGH'),(46,'JURU MASAK'),(47,'PROMOTOR ACARA'),(48,'ANGGOTA DPR-RI'),(49,'ANGGOTA DPD'),(50,'ANGGOTA BPK'),(51,'PRESIDEN'),(52,'WAKIL PRESIDEN'),(53,'ANGGOTA MAHKAMAH KONSTITUSI'),(54,'ANGGOTA KABINET KEMENTERIAN'),(55,'DUTA BESAR'),(56,'GUBERNUR'),(57,'WAKIL GUBERNUR'),(58,'BUPATI'),(59,'WAKIL BUPATI'),(60,'WALIKOTA'),(61,'WAKIL WALIKOTA'),(62,'ANGGOTA DPRD PROVINSI'),(63,'ANGGOTA DPRD KABUPATEN/KOTA'),(64,'DOSEN'),(65,'GURU'),(66,'PILOT'),(67,'PENGACARA'),(68,'NOTARIS'),(69,'ARSITEK'),(70,'AKUNTAN'),(71,'KONSULTAN'),(72,'DOKTER'),(73,'BIDAN'),(74,'PERAWAT'),(75,'APOTEKER'),(76,'PSIKIATER/PSIKOLOG'),(77,'PENYIAR TELEVISI'),(78,'PENYIAR RADIO'),(79,'PELAUT'),(80,'PENELITI'),(81,'SOPIR'),(82,'PIALANG'),(83,'PARANORMAL'),(84,'PEDAGANG'),(85,'PERANGKAT DESA'),(86,'KEPALA DESA'),(87,'BIARAWATI'),(88,'WIRASWASTA'),(89,'LAINNYA');
/*!40000 ALTER TABLE `tweb_penduduk_pekerjaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_pendidikan`
--

DROP TABLE IF EXISTS `tweb_penduduk_pendidikan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_pendidikan` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_pendidikan`
--

LOCK TABLES `tweb_penduduk_pendidikan` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_pendidikan` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_pendidikan` VALUES (1,'BELUM MASUK TK/KELOMPOK BERMAIN'),(2,'SEDANG TK/KELOMPOK BERMAIN'),(3,'TIDAK PERNAH SEKOLAH'),(4,'SEDANG SD/SEDERAJAT'),(5,'TIDAK TAMAT SD/SEDERAJAT'),(6,'SEDANG SLTP/SEDERAJAT'),(7,'SEDANG SLTA/SEDERAJAT'),(8,'SEDANG  D-1/SEDERAJAT'),(9,'SEDANG D-2/SEDERAJAT'),(10,'SEDANG D-3/SEDERAJAT'),(11,'SEDANG  S-1/SEDERAJAT'),(12,'SEDANG S-2/SEDERAJAT'),(13,'SEDANG S-3/SEDERAJAT'),(14,'SEDANG SLB A/SEDERAJAT'),(15,'SEDANG SLB B/SEDERAJAT'),(16,'SEDANG SLB C/SEDERAJAT'),(17,'TIDAK DAPAT MEMBACA DAN MENULIS HURUF LATIN/ARAB'),(18,'TIDAK SEDANG SEKOLAH');
/*!40000 ALTER TABLE `tweb_penduduk_pendidikan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_pendidikan_kk`
--

DROP TABLE IF EXISTS `tweb_penduduk_pendidikan_kk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_pendidikan_kk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_pendidikan_kk`
--

LOCK TABLES `tweb_penduduk_pendidikan_kk` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_pendidikan_kk` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_pendidikan_kk` VALUES (1,'TIDAK / BELUM SEKOLAH'),(2,'BELUM TAMAT SD/SEDERAJAT'),(3,'TAMAT SD / SEDERAJAT'),(4,'SLTP/SEDERAJAT'),(5,'SLTA / SEDERAJAT'),(6,'DIPLOMA I / II'),(7,'AKADEMI/ DIPLOMA III/S. MUDA'),(8,'DIPLOMA IV/ STRATA I'),(9,'STRATA II'),(10,'STRATA III');
/*!40000 ALTER TABLE `tweb_penduduk_pendidikan_kk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_sex`
--

DROP TABLE IF EXISTS `tweb_penduduk_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_sex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_sex`
--

LOCK TABLES `tweb_penduduk_sex` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_sex` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_sex` VALUES (1,'LAKI-LAKI'),(2,'PEREMPUAN');
/*!40000 ALTER TABLE `tweb_penduduk_sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_status`
--

DROP TABLE IF EXISTS `tweb_penduduk_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_status`
--

LOCK TABLES `tweb_penduduk_status` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_status` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_status` VALUES (1,'TETAP'),(2,'TIDAK AKTIF'),(3,'PENDATANG');
/*!40000 ALTER TABLE `tweb_penduduk_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_umur`
--

DROP TABLE IF EXISTS `tweb_penduduk_umur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_umur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  `dari` int(11) DEFAULT NULL,
  `sampai` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_umur`
--

LOCK TABLES `tweb_penduduk_umur` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_umur` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_umur` VALUES (1,'BALITA',0,5,0),(2,'ANAK-ANAK',6,17,0),(3,'DEWASA',18,30,0),(4,'TUA',31,120,0),(6,'Di bawah 1 Tahun',0,1,1),(9,'2 s/d 4 Tahun',2,4,1),(12,'5 s/d 9 Tahun',5,9,1),(13,'10 s/d 14 Tahun',10,14,1),(14,'15 s/d 19 Tahun',15,19,1),(15,'20 s/d 24 Tahun',20,24,1),(16,'25 s/d 29 Tahun',25,29,1),(17,'30 s/d 34 Tahun',30,34,1),(18,'35 s/d 39 Tahun ',35,39,1),(19,'40 s/d 44 Tahun',40,44,1),(20,'45 s/d 49 Tahun',45,49,1),(21,'50 s/d 54 Tahun',50,54,1),(22,'55 s/d 59 Tahun',55,59,1),(23,'60 s/d 64 Tahun',60,64,1),(24,'65 s/d 69 Tahun',65,69,1),(25,'70 s/d 74 Tahun',70,74,1),(26,'Di atas 75 Tahun',75,99999,1);
/*!40000 ALTER TABLE `tweb_penduduk_umur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_penduduk_warganegara`
--

DROP TABLE IF EXISTS `tweb_penduduk_warganegara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_penduduk_warganegara` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_penduduk_warganegara`
--

LOCK TABLES `tweb_penduduk_warganegara` WRITE;
/*!40000 ALTER TABLE `tweb_penduduk_warganegara` DISABLE KEYS */;
INSERT INTO `tweb_penduduk_warganegara` VALUES (1,'WNI'),(2,'WNA'),(3,'DUA KEWARGANEGARAAN');
/*!40000 ALTER TABLE `tweb_penduduk_warganegara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_rtm`
--

DROP TABLE IF EXISTS `tweb_rtm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_rtm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik_kepala` int(11) NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kelas_sosial` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_rtm`
--

LOCK TABLES `tweb_rtm` WRITE;
/*!40000 ALTER TABLE `tweb_rtm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweb_rtm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_rtm_hubungan`
--

DROP TABLE IF EXISTS `tweb_rtm_hubungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_rtm_hubungan` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_rtm_hubungan`
--

LOCK TABLES `tweb_rtm_hubungan` WRITE;
/*!40000 ALTER TABLE `tweb_rtm_hubungan` DISABLE KEYS */;
INSERT INTO `tweb_rtm_hubungan` VALUES (1,'Kepala Rumah Tangga'),(2,'Anggota');
/*!40000 ALTER TABLE `tweb_rtm_hubungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_sakit_menahun`
--

DROP TABLE IF EXISTS `tweb_sakit_menahun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_sakit_menahun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_sakit_menahun`
--

LOCK TABLES `tweb_sakit_menahun` WRITE;
/*!40000 ALTER TABLE `tweb_sakit_menahun` DISABLE KEYS */;
INSERT INTO `tweb_sakit_menahun` VALUES (1,'JANTUNG'),(2,'LEVER'),(3,'PARU-PARU'),(4,'KANKER'),(5,'STROKE'),(6,'DIABETES MELITUS'),(7,'GINJAL'),(8,'MALARIA'),(9,'LEPRA/KUSTA'),(10,'HIV/AIDS'),(11,'GILA/STRESS'),(12,'TBC'),(13,'ASTHMA'),(14,'TIDAK ADA/TIDAK SAKIT');
/*!40000 ALTER TABLE `tweb_sakit_menahun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_status_dasar`
--

DROP TABLE IF EXISTS `tweb_status_dasar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_status_dasar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_status_dasar`
--

LOCK TABLES `tweb_status_dasar` WRITE;
/*!40000 ALTER TABLE `tweb_status_dasar` DISABLE KEYS */;
INSERT INTO `tweb_status_dasar` VALUES (1,'HIDUP'),(2,'MATI'),(3,'PINDAH'),(4,'HILANG');
/*!40000 ALTER TABLE `tweb_status_dasar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_surat_atribut`
--

DROP TABLE IF EXISTS `tweb_surat_atribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_surat_atribut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_surat` int(11) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `long` tinyint(4) NOT NULL,
  `kode` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_surat_atribut`
--

LOCK TABLES `tweb_surat_atribut` WRITE;
/*!40000 ALTER TABLE `tweb_surat_atribut` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweb_surat_atribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_surat_format`
--

DROP TABLE IF EXISTS `tweb_surat_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_surat_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `url_surat` varchar(100) NOT NULL,
  `kode_surat` varchar(10) NOT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `kunci` tinyint(1) NOT NULL DEFAULT '0',
  `favorit` tinyint(1) NOT NULL DEFAULT '0',
  `jenis` tinyint(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_surat` (`url_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_surat_format`
--

LOCK TABLES `tweb_surat_format` WRITE;
/*!40000 ALTER TABLE `tweb_surat_format` DISABLE KEYS */;
INSERT INTO `tweb_surat_format` VALUES (1,'Keterangan Pengantar','surat_ket_pengantar','S-01',NULL,0,0,1),(2,'Keterangan Penduduk','surat_ket_penduduk','S-02',NULL,0,0,1),(3,'Biodata Penduduk','surat_bio_penduduk','S-03','f-1.01.php',0,0,1),(5,'Keterangan Pindah Penduduk','surat_ket_pindah_penduduk','S-04','f-1.08.php,f-1.25.php',0,0,1),(6,'Keterangan Jual Beli','surat_ket_jual_beli','S-05',NULL,0,0,1),(8,'Pengantar Surat Keterangan Catatan Kepolisian','surat_ket_catatan_kriminal','S-07',NULL,0,0,1),(9,'Keterangan KTP dalam Proses','surat_ket_ktp_dalam_proses','S-08',NULL,0,0,1),(10,'Keterangan Beda Identitas','surat_ket_beda_nama','S-09',NULL,0,0,1),(11,'Keterangan Bepergian / Jalan','surat_jalan','S-10',NULL,0,0,1),(12,'Keterangan Kurang Mampu','surat_ket_kurang_mampu','S-11',NULL,0,0,1),(13,'Pengantar Izin Keramaian','surat_izin_keramaian','S-12',NULL,0,0,1),(14,'Pengantar Laporan Kehilangan','surat_ket_kehilangan','S-13',NULL,0,0,1),(15,'Keterangan Usaha','surat_ket_usaha','S-14',NULL,0,0,1),(16,'Keterangan JAMKESOS','surat_ket_jamkesos','S-15',NULL,0,0,1),(17,'Keterangan Domisili Usaha','surat_ket_domisili_usaha','S-16',NULL,0,0,1),(18,'Keterangan Kelahiran','surat_ket_kelahiran','S-17','f-2.01.php',0,0,1),(20,'Permohonan Akta Lahir','surat_permohonan_akta','S-18',NULL,0,0,1),(21,'Pernyataan Belum Memiliki Akta Lahir','surat_pernyataan_akta','S-19',NULL,0,0,1),(22,'Permohonan Duplikat Kelahiran','surat_permohonan_duplikat_kelahiran','S-20',NULL,0,0,1),(24,'Keterangan Kematian','surat_ket_kematian','S-21','f-2.29.php',0,0,1),(25,'Keterangan Lahir Mati','surat_ket_lahir_mati','S-22',NULL,0,0,1),(26,'Keterangan Untuk Nikah (N-1 s/d N-7)','surat_ket_nikah','S-23',NULL,0,0,1),(33,'Keterangan Pergi Kawin','surat_ket_pergi_kawin','S-30',NULL,0,0,1),(35,'Keterangan Wali Hakim','surat_ket_wali_hakim','S-32',NULL,0,0,1),(36,'Permohonan Duplikat Surat Nikah','surat_permohonan_duplikat_surat_nikah','S-33',NULL,0,0,1),(37,'Permohonan Cerai','surat_permohonan_cerai','S-34',NULL,0,0,1),(38,'Keterangan Pengantar Rujuk/Cerai','surat_ket_rujuk_cerai','S-35',NULL,0,0,1),(45,'Permohonan Kartu Keluarga','surat_permohonan_kartu_keluarga','S-36','f-1.15.php,f-1.01.php',0,0,1),(51,'Domisili Usaha Non-Warga','surat_domisili_usaha_non_warga','S-37',NULL,0,0,1),(76,'Keterangan Beda Identitas KIS','surat_ket_beda_identitas_kis','S-38',NULL,0,0,1),(85,'Keterangan Izin Orang Tua/Suami/Istri','surat_izin_orangtua_suami_istri','S-39',NULL,0,0,1),(86,'Pernyataan Penguasaan Fisik Bidang Tanah (SPORADIK)','surat_sporadik','S-40',NULL,0,0,1);
/*!40000 ALTER TABLE `tweb_surat_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweb_wil_clusterdesa`
--

DROP TABLE IF EXISTS `tweb_wil_clusterdesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweb_wil_clusterdesa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rt` varchar(10) NOT NULL DEFAULT '0',
  `rw` varchar(10) NOT NULL DEFAULT '0',
  `dusun` varchar(50) NOT NULL DEFAULT '0',
  `kecamatan` varchar(50) NOT NULL DEFAULT '0',
  `id_kepala` int(11) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `zoom` int(5) NOT NULL,
  `path` text NOT NULL,
  `map_tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rt` (`rt`,`rw`,`dusun`,`kecamatan`),
  KEY `id_kepala` (`id_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweb_wil_clusterdesa`
--

LOCK TABLES `tweb_wil_clusterdesa` WRITE;
/*!40000 ALTER TABLE `tweb_wil_clusterdesa` DISABLE KEYS */;
INSERT INTO `tweb_wil_clusterdesa` VALUES (53,'0','0','0','Teluk_Bayur',0,'','',0,'',''),(54,'0','0','','Teluk_Bayur',0,'','',0,'',''),(55,'0','-','','Teluk_Bayur',0,'','',0,'',''),(56,'-','-','','Teluk_Bayur',0,'','',0,'',''),(57,'0','0','0','Kelay',1,'','',0,'',''),(58,'0','0','','Kelay',1,'','',0,'',''),(59,'0','-','','Kelay',1,'','',0,'',''),(60,'-','-','','Kelay',1,'','',0,'','');
/*!40000 ALTER TABLE `tweb_wil_clusterdesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `id_grup` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `session` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','edc64352387aa108dac115ec1493d5d4',1,'admin@combine.or.id','2017-12-12 01:07:48',1,'Administrator','ADMIN','321','favicon.png','a8d4080245664ed2049c1b2ded7cac30');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_grup`
--

DROP TABLE IF EXISTS `user_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_grup` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_grup`
--

LOCK TABLES `user_grup` WRITE;
/*!40000 ALTER TABLE `user_grup` DISABLE KEYS */;
INSERT INTO `user_grup` VALUES (0,'Fasilitator'),(1,'Administrator'),(2,'Operator'),(3,'Redaksi'),(4,'Kontributor');
/*!40000 ALTER TABLE `user_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isi` text,
  `enabled` int(2) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `jenis_widget` tinyint(2) NOT NULL DEFAULT '3',
  `urut` int(5) DEFAULT NULL,
  `form_admin` varchar(100) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (1,'<p><iframe src=\"https://www.google.co.id/maps?f=q&source=s_q&hl=en&geocode=&q=Logandu,+Karanggayam&aq=0&oq=logan&sll=-2.550221,118.015568&sspn=52.267573,80.332031&t=h&ie=UTF8&hq=&hnear=Logandu,+Karanggayam,+Kebumen,+Central+Java&ll=-7.55854,109.634173&spn=0.052497,0.078449&z=14&output=embed\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" width=\"100%\"></iframe></p> ',1,'Peta Desa',3,1,'',''),(2,'layanan_mandiri.php',1,'Layanan Mandiri',1,5,'mandiri',''),(3,'agenda.php',1,'Agenda',1,6,'web/index/1000',''),(4,'galeri.php',1,'Galeri',1,7,'gallery',''),(5,'statistik.php',1,'Statistik',1,8,'',''),(6,'komentar.php',1,'Komentar',1,9,'komentar',''),(7,'media_sosial.php',1,'Media Sosial',1,10,'sosmed',''),(8,'peta_lokasi_kantor.php',1,'Peta Lokasi Kantor',1,11,'hom_desa',''),(9,'statistik_pengunjung.php',1,'Statistik Pengunjung',1,12,'',''),(10,'arsip_artikel.php',1,'Arsip Artikel',1,13,'',''),(11,'aparatur_desa.php',1,'Aparatur Desa',1,3,'pengurus',''),(12,'sinergi_program.php',1,'Sinergi Program',1,2,'web_widget/admin/sinergi_program','[]'),(13,'menu_kategori.php',1,'Menu Kategori',1,4,'','');
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'opensid'
--

--
-- Dumping routines for database 'opensid'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-12  7:23:19
