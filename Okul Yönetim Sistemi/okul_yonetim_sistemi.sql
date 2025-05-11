-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 May 2025, 16:00:22
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `okul_yonetim_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ders_notlari`
--

CREATE TABLE `ders_notlari` (
  `id` int(11) NOT NULL,
  `ogrenciAdi` varchar(50) NOT NULL,
  `ogrenciSoyadi` varchar(50) NOT NULL,
  `ogrenciNumarasi` varchar(20) NOT NULL,
  `sinif` varchar(10) NOT NULL,
  `sube` varchar(5) NOT NULL,
  `ders` varchar(50) NOT NULL,
  `sinavNotu` varchar(10) DEFAULT NULL,
  `odevNotu` varchar(10) DEFAULT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ders_notlari`
--

INSERT INTO `ders_notlari` (`id`, `ogrenciAdi`, `ogrenciSoyadi`, `ogrenciNumarasi`, `sinif`, `sube`, `ders`, `sinavNotu`, `odevNotu`, `kayit_tarihi`) VALUES
(1, 'Nazan', 'Ata', '123', '2', 'C', 'Biyoloji', '74', '25', '2025-05-11 13:59:46');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ders_programi`
--

CREATE TABLE `ders_programi` (
  `id` int(11) NOT NULL,
  `dersAdi` varchar(50) NOT NULL,
  `ogretmenAdi` varchar(100) NOT NULL,
  `sinif` varchar(10) NOT NULL,
  `sube` varchar(5) NOT NULL,
  `saat` varchar(20) NOT NULL,
  `gün` varchar(15) NOT NULL,
  `dersYeri` varchar(50) NOT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ders_programi`
--

INSERT INTO `ders_programi` (`id`, `dersAdi`, `ogretmenAdi`, `sinif`, `sube`, `saat`, `gün`, `dersYeri`, `kayit_tarihi`) VALUES
(1, 'Biyoloji', 'Efe Sever', '2', 'C', '13:00', 'Salı', 'Derslik 4', '2025-05-11 13:59:42');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenciler`
--

CREATE TABLE `ogrenciler` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `numara` varchar(20) NOT NULL,
  `sinif` varchar(10) NOT NULL,
  `sube` varchar(5) NOT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ogrenciler`
--

INSERT INTO `ogrenciler` (`id`, `ad`, `soyad`, `numara`, `sinif`, `sube`, `kayit_tarihi`) VALUES
(1, 'Nazan', 'Ata', '123', '2', 'C', '2025-05-11 13:58:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogretmenler`
--

CREATE TABLE `ogretmenler` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `brans` varchar(50) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ogretmenler`
--

INSERT INTO `ogretmenler` (`id`, `ad`, `soyad`, `brans`, `telefon`, `kayit_tarihi`) VALUES
(1, 'Efe', 'Sever', 'Biyoloji', '5055555555', '2025-05-11 13:58:58');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ders_notlari`
--
ALTER TABLE `ders_notlari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notlar_ogrenci` (`ogrenciAdi`,`ogrenciSoyadi`),
  ADD KEY `idx_notlar_numara` (`ogrenciNumarasi`),
  ADD KEY `idx_notlar_sinif_sube` (`sinif`,`sube`),
  ADD KEY `idx_notlar_ders` (`ders`);

--
-- Tablo için indeksler `ders_programi`
--
ALTER TABLE `ders_programi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ders_programi_ders` (`dersAdi`),
  ADD KEY `idx_ders_programi_ogretmen` (`ogretmenAdi`),
  ADD KEY `idx_ders_programi_sinif_sube` (`sinif`,`sube`),
  ADD KEY `idx_ders_programi_gun_saat` (`gün`,`saat`);

--
-- Tablo için indeksler `ogrenciler`
--
ALTER TABLE `ogrenciler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numara` (`numara`),
  ADD KEY `idx_ogrenci_no` (`numara`),
  ADD KEY `idx_ogrenci_ad_soyad` (`ad`,`soyad`),
  ADD KEY `idx_ogrenci_sinif_sube` (`sinif`,`sube`);

--
-- Tablo için indeksler `ogretmenler`
--
ALTER TABLE `ogretmenler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefon` (`telefon`),
  ADD KEY `idx_ogretmen_ad_soyad` (`ad`,`soyad`),
  ADD KEY `idx_ogretmen_brans` (`brans`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ders_notlari`
--
ALTER TABLE `ders_notlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `ders_programi`
--
ALTER TABLE `ders_programi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `ogrenciler`
--
ALTER TABLE `ogrenciler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `ogretmenler`
--
ALTER TABLE `ogretmenler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ders_notlari`
--
ALTER TABLE `ders_notlari`
  ADD CONSTRAINT `ders_notlari_ibfk_1` FOREIGN KEY (`ogrenciNumarasi`) REFERENCES `ogrenciler` (`numara`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
