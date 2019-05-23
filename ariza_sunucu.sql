-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 20 May 2019, 22:10:45
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ariza_sunucu`
--

DELIMITER $$
--
-- Yordamlar
--
DROP PROCEDURE IF EXISTS `aliaga_arizatur`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aliaga_arizatur` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
FROM ariza,musteri,ilce,ariza_tur
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ariza.t_id=ariza_tur.t_id AND ilce.ilce_adi='Aliağa' 
GROUP BY ariza_tur.t_id$$

DROP PROCEDURE IF EXISTS `aliaga_ariza_musteri`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aliaga_ariza_musteri` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,(SELECT COUNT(musteri.m_id) FROM musteri,ilce WHERE musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Aliağa' GROUP BY ilce.ilce_id) AS musteri_sayisi
FROM ariza,musteri,ilce
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ilce.ilce_adi='Aliağa'
GROUP BY ilce.ilce_adi$$

DROP PROCEDURE IF EXISTS `bornova_arizatur`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bornova_arizatur` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
FROM ariza,musteri,ilce,ariza_tur
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ariza.t_id=ariza_tur.t_id AND ilce.ilce_adi='Bornova' 
GROUP BY ariza_tur.t_id$$

DROP PROCEDURE IF EXISTS `bornova_ariza_musteri`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bornova_ariza_musteri` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,(SELECT COUNT(musteri.m_id) FROM musteri,ilce WHERE musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Bornova' GROUP BY ilce.ilce_id) AS musteri_sayisi
FROM ariza,musteri,ilce
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ilce.ilce_adi='Bornova'
GROUP BY ilce.ilce_adi$$

DROP PROCEDURE IF EXISTS `bornova_haftalik`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bornova_haftalik` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,week(ariza.tarih) AS tarihh
FROM ariza,ilce,musteri
WHERE musteri.m_id=ariza.m_id AND musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Bornova'
GROUP BY tarihh$$

DROP PROCEDURE IF EXISTS `buca_arizatur`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buca_arizatur` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
FROM ariza,musteri,ilce,ariza_tur
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ariza.t_id=ariza_tur.t_id AND ilce.ilce_adi='Buca' 
GROUP BY ariza_tur.t_id$$

DROP PROCEDURE IF EXISTS `buca_ariza_musteri`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buca_ariza_musteri` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,(SELECT COUNT(musteri.m_id) FROM musteri,ilce WHERE musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Buca' GROUP BY ilce.ilce_id) AS musteri_sayisi
FROM ariza,musteri,ilce
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ilce.ilce_adi='Buca'
GROUP BY ilce.ilce_adi$$

DROP PROCEDURE IF EXISTS `genel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `genel` ()  NO SQL
SELECT ariza_ortak.ariza_sayisi,mus_ortak.musteri_sayisi,mus_ortak.ilce_adi
FROM ariza_ortak
INNER JOIN mus_ortak ON mus_ortak.ilce_adi=ariza_ortak.ilce_adi$$

DROP PROCEDURE IF EXISTS `ilceyegore_arizasayisi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ilceyegore_arizasayisi` ()  NO SQL
SELECT count(ariza.a_id) AS ariza_sayisi,ilce.ilce_adi
FROM ariza,ilce,musteri
WHERE ariza.m_id=musteri.m_id AND musteri.ilce_id=ilce.ilce_id
GROUP BY ilce.ilce_id$$

DROP PROCEDURE IF EXISTS `ilceyegore_musterisayisi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ilceyegore_musterisayisi` ()  NO SQL
SELECT count(musteri.m_id)AS musteri_sayisi,ilce.ilce_adi
FROM musteri,ilce
WHERE musteri.ilce_id=ilce.ilce_id
GROUP BY ilce.ilce_id$$

DROP PROCEDURE IF EXISTS `karsiyaka_arizatur`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `karsiyaka_arizatur` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
FROM ariza,musteri,ilce,ariza_tur
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ariza.t_id=ariza_tur.t_id AND ilce.ilce_adi='Karşıyaka' 
GROUP BY ariza_tur.t_id$$

DROP PROCEDURE IF EXISTS `karsiyaka_ariza_musteri`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `karsiyaka_ariza_musteri` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,(SELECT COUNT(musteri.m_id) FROM musteri,ilce WHERE musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Karşıyaka' GROUP BY ilce.ilce_id) AS musteri_sayisi
FROM ariza,musteri,ilce
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ilce.ilce_adi='Karşıyaka'
GROUP BY ilce.ilce_adi$$

DROP PROCEDURE IF EXISTS `konak_arizatur`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `konak_arizatur` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
FROM ariza,musteri,ilce,ariza_tur
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ariza.t_id=ariza_tur.t_id AND ilce.ilce_adi='Konak' 
GROUP BY ariza_tur.t_id$$

DROP PROCEDURE IF EXISTS `konak_ariza_musteri`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `konak_ariza_musteri` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,(SELECT COUNT(musteri.m_id) FROM musteri,ilce WHERE musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Konak' GROUP BY ilce.ilce_id) AS musteri_sayisi
FROM ariza,musteri,ilce
WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ilce.ilce_adi='Konak'
GROUP BY ilce.ilce_adi$$

DROP PROCEDURE IF EXISTS `turegore_arizasayisi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `turegore_arizasayisi` ()  NO SQL
SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
FROM ariza,ariza_tur
WHERE ariza_tur.t_id=ariza.t_id
GROUP BY ariza_tur.t_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ariza`
--

DROP TABLE IF EXISTS `ariza`;
CREATE TABLE IF NOT EXISTS `ariza` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `m_id` int(11) NOT NULL,
  `t_id` int(2) NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `m_id` (`m_id`),
  KEY `t_id` (`t_id`),
  KEY `m_id_2` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ariza`
--

INSERT INTO `ariza` (`a_id`, `tarih`, `m_id`, `t_id`) VALUES
(17, '2019-05-20', 798, 1),
(18, '2019-05-21', 41, 1),
(19, '2019-05-20', 56, 2),
(20, '2019-05-22', 16, 1),
(21, '2019-05-24', 21, 2),
(22, '2019-05-23', 36, 2),
(23, '2019-05-21', 1234, 1),
(24, '2019-05-21', 35, 1),
(25, '2019-05-18', 1, 1),
(27, '2019-05-14', 2, 2),
(28, '2019-05-07', 14, 2),
(29, '2019-05-01', 101, 3),
(30, '2019-05-03', 103, 3),
(31, '2019-05-02', 109, 3),
(32, '2019-05-07', 110, 1),
(33, '2019-05-10', 113, 2),
(34, '2019-05-20', 118, 3),
(35, '2019-05-19', 120, 2),
(36, '2019-05-24', 111, 3),
(37, '2019-05-27', 114, 3),
(38, '2019-05-29', 112, 2),
(39, '2019-05-14', 115, 3),
(40, '2019-05-16', 117, 3),
(41, '2018-12-11', 129, 4),
(42, '2019-05-17', 134, 4),
(43, '2019-05-11', 137, 4),
(44, '2019-05-16', 140, 1),
(45, '2019-05-31', 146, 1),
(46, '2019-05-27', 139, 3);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `ariza_ortak`
-- (Asıl görünüm için aşağıya bakın)
--
DROP VIEW IF EXISTS `ariza_ortak`;
CREATE TABLE IF NOT EXISTS `ariza_ortak` (
`ariza_sayisi` bigint(21)
,`ilce_adi` varchar(255)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ariza_tur`
--

DROP TABLE IF EXISTS `ariza_tur`;
CREATE TABLE IF NOT EXISTS `ariza_tur` (
  `t_id` int(2) NOT NULL,
  `t_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `ariza_tur`
--

INSERT INTO `ariza_tur` (`t_id`, `t_ad`) VALUES
(1, 'Hız'),
(2, 'Kopma'),
(3, 'Dalgalanma'),
(4, 'Bağlantı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilce`
--

DROP TABLE IF EXISTS `ilce`;
CREATE TABLE IF NOT EXISTS `ilce` (
  `ilce_id` int(11) NOT NULL AUTO_INCREMENT,
  `ilce_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ilce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilce`
--

INSERT INTO `ilce` (`ilce_id`, `ilce_adi`) VALUES
(1, 'Aliağa'),
(2, 'Buca'),
(3, 'Bornova'),
(4, 'Konak'),
(5, 'Karşıyaka');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

DROP TABLE IF EXISTS `musteri`;
CREATE TABLE IF NOT EXISTS `musteri` (
  `m_id` int(11) NOT NULL,
  `m_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `m_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ilce_id` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `ilce_id` (`ilce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`m_id`, `m_ad`, `m_soyad`, `ilce_id`) VALUES
(1, 'İlker', 'Topal', 1),
(2, 'Serdar\r\n', 'Şahin', 2),
(3, 'Elif', 'Tarım', 2),
(4, 'Nisanur', 'Çuvalcı', 2),
(5, 'Barbaros ', 'Demirtaş', 1),
(6, 'Gözde', 'Kahraman', 1),
(7, 'Enes', 'Baran', 4),
(8, 'Yeşim', 'Kocaoğlu', 4),
(9, 'Erdem', 'Yıldırım', 1),
(10, 'Emre', 'Küçük', 4),
(11, 'Davud', 'Kanat', 1),
(12, 'Burcu', 'Bardakçı', 1),
(13, 'Burak', 'Kürklü', 1),
(14, 'Ahmet', 'Su', 3),
(15, 'Leyla', 'Yılmaz', 3),
(16, 'Emir', 'Efe', 3),
(17, 'Mecnun', 'Yılar', 4),
(21, 'Burak', 'Can', 1),
(35, 'Mehmet', 'Aydın', 5),
(36, 'Ozan', 'Özer', 4),
(41, 'Süheyl', 'Ak', 3),
(56, 'Sinan', 'Koşunda', 3),
(101, 'Ahmet', 'Sönmez', 3),
(102, 'Mehmet', 'Tatar', 3),
(103, 'Can', 'Mestanlı', 3),
(104, 'Bedirhan', 'Sert', 3),
(105, 'Gizem', 'Alaşahin', 3),
(106, 'Zeynep', 'Soydan', 3),
(107, 'Ömer', 'Soydan', 3),
(108, 'Bedirhan', 'Durucan', 3),
(109, 'Ali', 'Gültekin', 3),
(110, 'Ayşe', 'Cumhur', 3),
(111, 'Hilal', 'Akyıldız', 3),
(112, 'Pınar', 'Şişe', 3),
(113, 'Buğra', 'Tanta', 3),
(114, 'Furkan', 'Çömlek', 3),
(115, 'Melih', 'Çömlek', 3),
(116, 'Serdar', 'Şahin', 3),
(117, 'Ezgi', 'Aygın', 3),
(118, 'Burak', 'Evren', 3),
(119, 'İlayda', 'Torun', 3),
(120, 'Simge', 'Tekin', 3),
(121, 'Ahmet', 'Yılmaz', 1),
(122, 'Ahmet', 'Akar', 1),
(123, 'Hakan', 'Akar', 1),
(124, 'Batuhan', 'Akar', 1),
(125, 'Tezer', 'Dermiröz', 1),
(126, 'Kerim ', 'Durmaz', 1),
(127, 'Ozan', 'Ünlü', 1),
(128, 'Serhat', 'Fazlıoğlu', 1),
(129, 'Aslı', 'Arıbaş', 1),
(130, 'Emre', 'Tekin', 1),
(131, 'Ali', 'Kulak', 1),
(132, 'Gamze', 'Soydan', 1),
(133, 'Hande ', 'Durucan', 1),
(134, 'qweqwe', 'fsdfasd', 2),
(135, 'qwerwqer', 'asdfasdfa', 2),
(136, 'qwertqt', 'qwerqwer', 2),
(137, 'tewrtwe', 'qwerqwer', 2),
(138, 'adsfasdfa', 'qerqwer', 2),
(139, 'qwerqwer', 'asdfasdfa', 2),
(140, 'qwerqwer', 'asdfasdfwqe', 2),
(141, 'asdfwqerq', 'sadfasdfa', 2),
(142, 'qwerqwer', 'sadfasdfa', 2),
(143, 'werqwerq', 'fsdfasdf', 2),
(144, 'qwrqwerqw', 'sadfsadf', 2),
(145, 'qwerqwer', 'sadfasdfa', 2),
(146, 'wqerqwer', 'treyrt', 2),
(147, 'ıtyuıtyuı', 'tyıtyuıty', 2),
(148, 'qwerret', 'trtyertyertyer', 2),
(798, 'Ayhan', 'Önen', 3),
(1234, 'Büşra', 'Önen', 2),
(34677, 'Sinem', 'Fazlıpğlu', 5);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `mus_ortak`
-- (Asıl görünüm için aşağıya bakın)
--
DROP VIEW IF EXISTS `mus_ortak`;
CREATE TABLE IF NOT EXISTS `mus_ortak` (
`musteri_sayisi` bigint(21)
,`ilce_adi` varchar(255)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `ariza_ortak`
--
DROP TABLE IF EXISTS `ariza_ortak`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ariza_ortak`  AS  select count(`ariza`.`a_id`) AS `ariza_sayisi`,`ilce`.`ilce_adi` AS `ilce_adi` from ((`ariza` join `ilce`) join `musteri`) where ((`ariza`.`m_id` = `musteri`.`m_id`) and (`musteri`.`ilce_id` = `ilce`.`ilce_id`)) group by `ilce`.`ilce_id` ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `mus_ortak`
--
DROP TABLE IF EXISTS `mus_ortak`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mus_ortak`  AS  select count(`musteri`.`m_id`) AS `musteri_sayisi`,`ilce`.`ilce_adi` AS `ilce_adi` from (`musteri` join `ilce`) where (`musteri`.`ilce_id` = `ilce`.`ilce_id`) group by `ilce`.`ilce_id` ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ariza`
--
ALTER TABLE `ariza`
  ADD CONSTRAINT `ariza_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `musteri` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ariza_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `ariza_tur` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `musteri`
--
ALTER TABLE `musteri`
  ADD CONSTRAINT `musteri_ibfk_1` FOREIGN KEY (`ilce_id`) REFERENCES `ilce` (`ilce_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
