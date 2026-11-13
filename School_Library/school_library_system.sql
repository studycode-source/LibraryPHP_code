-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2025 at 08:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `ahli`
--

CREATE TABLE `ahli` (
  `user_id` int(20) NOT NULL,
  `Id_delima` varchar(20) NOT NULL,
  `nama_ahli` varchar(250) NOT NULL,
  `IC_ahli` varchar(20) NOT NULL,
  `jenis_ahli` enum('ADMIN','PENGAWAS PSS','GURU','PELAJAR','STAF SOKONGAN') NOT NULL,
  `Tingkatan` enum('1','2','3','4','5','6','Kelas Khas') NOT NULL,
  `Kelas` varchar(50) NOT NULL,
  `jenis_jantina` enum('Lelaki','Perempuan') NOT NULL,
  `no_telefon` varchar(20) NOT NULL,
  `Tahun_daftar` date DEFAULT current_timestamp(),
  `status` enum('Aktif','Tidak Aktif','Berhenti','Senarai Hitam','Tamat Perkhidmatan','Bertukar','Tamat Persekolahan') DEFAULT 'Aktif',
  `jumlah_hutang` decimal(10,2) DEFAULT 0.00,
  `tahun_tamat` date DEFAULT NULL,
  `gambar_ahli` varchar(300) NOT NULL,
  `jumlah_bacaan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahli`
--

INSERT INTO `ahli` (`user_id`, `Id_delima`, `nama_ahli`, `IC_ahli`, `jenis_ahli`, `Tingkatan`, `Kelas`, `jenis_jantina`, `no_telefon`, `Tahun_daftar`, `status`, `jumlah_hutang`, `tahun_tamat`, `gambar_ahli`, `jumlah_bacaan`) VALUES
(25, '047831', 'NUR UMAIRA BINTI ZAID', '', 'PELAJAR', '5', 'PA', 'Perempuan', '', '2025-03-07', 'Aktif', 1.00, '0000-00-00', '', 0);
INSERT INTO `ahli` (`user_id`, `Id_delima`, `nama_ahli`, `IC_ahli`, `jenis_ahli`, `Tingkatan`, `Kelas`, `jenis_jantina`, `no_telefon`, `Tahun_daftar`, `status`, `jumlah_hutang`, `tahun_tamat`, `gambar_ahli`, `jumlah_bacaan`) VALUES
(1186, '84323', 'MUHAMMAD NAQIU BIN AHMAD', '', 'PELAJAR', '5', '', '', '', '0000-00-00', '', 0.00, '0000-00-00', '', 0);


-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `book_id` int(11) NOT NULL,
  `no_perolehan` varchar(50) NOT NULL,
  `tajuk` varchar(255) NOT NULL,
  `kod_buku` varchar(50) NOT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `jenis_buku` varchar(255) NOT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `lokasi_rak` varchar(50) NOT NULL,
  `jenis_bahasa` enum('Bahasa Melayu','English','Mandarin','Tamil','Bahasa Arab') NOT NULL,
  `status_buku` enum('Ada','Tiada','Rosak','Hilang','Dipinjam') NOT NULL,
  `jumlah_hari_pinjaman` enum('2','3','Tidak Boleh Dipinjam') NOT NULL,
  `daftar_buku` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`book_id`, `no_perolehan`, `tajuk`, `kod_buku`, `penulis`, `jenis_buku`, `harga`, `lokasi_rak`, `jenis_bahasa`, `status_buku`, `jumlah_hari_pinjaman`, `daftar_buku`) VALUES
(12, '133452', 'Tom and Jerry', 'V123', '', 'Komik', 0.00, 'Rak 600', 'English', 'Ada', '3', '0000-00-00'),
(13, '5465676', 'Fish and Cat', '245', '', 'Karya Am dan Ensiklopedia', 0.00, 'Rak 800', '', 'Ada', '3', '0000-00-00'),
(14, '64232', 'Kekasih Hati', 'd332', '', 'Novel', 0.00, 'Rak 700', 'Bahasa Melayu', 'Ada', '3', '0000-00-00'),
(15, '45231', 'Kau yang Satu', 'G12', '', 'Majalah', 0.00, 'Rak 900', 'Bahasa Melayu', 'Ada', '3', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `senarai_jenis_buku`
--

CREATE TABLE `senarai_jenis_buku` (
  `jenis_buku_id` int(11) NOT NULL,
  `jenis_bahan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `senarai_jenis_buku`
--

INSERT INTO `senarai_jenis_buku` (`jenis_buku_id`, `jenis_bahan`) VALUES
(9, 'Buku Bukan Fiksyen'),
(10, 'Buku Fiksyen'),
(1, 'Kamus'),
(11, 'Karya Am dan Ensiklopedia'),
(7, 'Komik'),
(8, 'Majalah'),
(6, 'Novel'),
(5, 'Rujukan Agama'),
(4, 'Rujukan Pembelajaran (SPTM)'),
(2, 'Rujukan Pembelajaran (Tingkatan 1-3)'),
(3, 'Rujukan Pembelajaran (Tingkatan 4-5)');

-- --------------------------------------------------------

--
-- Table structure for table `senarai_kelas`
--

CREATE TABLE `senarai_kelas` (
  `kelas_id` int(11) NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `senarai_kelas`
--

INSERT INTO `senarai_kelas` (`kelas_id`, `value`) VALUES
(2, 'ABU BAKAR AS-SIDDIQ'),
(4, 'ALI BIN ABI THALIB');

-- --------------------------------------------------------

--
-- Table structure for table `senarai_rak`
--

CREATE TABLE `senarai_rak` (
  `rak_id` int(11) NOT NULL,
  `nama_rak` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `senarai_rak`
--

INSERT INTO `senarai_rak` (`rak_id`, `nama_rak`) VALUES
(1, 'Gempak Starz'),
(3, 'Rak 100'),
(4, 'Rak 200'),
(5, 'Rak 300'),
(6, 'Rak 400'),
(7, 'Rak 500'),
(8, 'Rak 600'),
(9, 'Rak 700'),
(10, 'Rak 800'),
(18, 'Rak 900');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `tarikh_pinjam` date NOT NULL DEFAULT current_timestamp(),
  `masa_meminjam` time NOT NULL DEFAULT current_timestamp(),
  `tarikh_perlu_pulang` date NOT NULL,
  `tarikh_pulang` date NOT NULL,
  `masa_pemulangan` time NOT NULL,
  `jumlah_hari_transaksi` int(11) NOT NULL,
  `jumlah_denda` decimal(10,2) NOT NULL,
  `status_transaksi` enum('Sedang Meminjam','Dikembalikan','Lewat','Belum Dikembalikan') NOT NULL,
  `user_id` int(20) NOT NULL,
  `book_id` int(20) NOT NULL,
  `bulan_pinjam` varchar(7) DEFAULT NULL,
  `bulan_pulang` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ahli`
--
ALTER TABLE `ahli`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `no_perolehan` (`no_perolehan`);

--
-- Indexes for table `senarai_jenis_buku`
--
ALTER TABLE `senarai_jenis_buku`
  ADD PRIMARY KEY (`jenis_buku_id`),
  ADD UNIQUE KEY `unique_jenis_bahan` (`jenis_bahan`);

--
-- Indexes for table `senarai_kelas`
--
ALTER TABLE `senarai_kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD UNIQUE KEY `unique_value` (`value`);

--
-- Indexes for table `senarai_rak`
--
ALTER TABLE `senarai_rak`
  ADD PRIMARY KEY (`rak_id`),
  ADD UNIQUE KEY `unique_nama_rak` (`nama_rak`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_book_id` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ahli`
--
ALTER TABLE `ahli`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1295;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `senarai_jenis_buku`
--
ALTER TABLE `senarai_jenis_buku`
  MODIFY `jenis_buku_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `senarai_kelas`
--
ALTER TABLE `senarai_kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `senarai_rak`
--
ALTER TABLE `senarai_rak`
  MODIFY `rak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `buku` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `ahli` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
