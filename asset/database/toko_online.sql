-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2025 at 05:03 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_barang` double NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar_barang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `stok`, `gambar_barang`) VALUES
(1, 'LAPTOP LENOVO LEGION I9', 76000000, 63, 'lenovo_legion_9_16irx9_gaming_intel_core_i9-14900hx_-_83g0001had.jpg'),
(2, 'LAPTOP ASUS TUF GAMING A15', 17000000, 44, 'download.jpg'),
(3, 'HEADPHONE JETE G1 GAMING ', 300000, 0, 'jete_headphone_gaming_jete-g1_with_led_light_full05_oga7dvxx.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `orderan`
--

CREATE TABLE `orderan` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_harga` double NOT NULL,
  `status` enum('PENDING','ORDERED','REJECTED') NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderan`
--

INSERT INTO `orderan` (`id_order`, `id_user`, `id_barang`, `qty`, `total_harga`, `status`, `tanggal`) VALUES
(1, 3, 1, 1, 76000000, 'ORDERED', '2025-02-10 21:45:32'),
(2, 3, 1, 10, 760000000, 'REJECTED', '2025-02-10 21:48:48'),
(4, 3, 2, 20, 340000000, 'ORDERED', '2025-02-10 22:02:59'),
(5, 3, 3, 63, 18900000, 'REJECTED', '2025-02-10 22:03:17'),
(6, 3, 3, 1, 300000, 'PENDING', '2025-02-10 22:03:43'),
(7, 3, 3, 64, 19200000, 'ORDERED', '2025-02-10 22:05:52'),
(8, 4, 1, 63, 4788000000, 'REJECTED', '2025-02-10 22:17:53'),
(10, 4, 2, 64, 1088000000, 'PENDING', '2025-02-10 22:19:08'),
(11, 4, 1, 3, 228000000, 'PENDING', '2025-02-10 22:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `role`) VALUES
(2, 'AKBAR', 'bikur', '$2y$10$yKY9667H2EOBzszTIFZ1XegOjHYqWOgTqDDcLkFvRUmHB4kaynD0i', 'admin'),
(3, 'abi', 'abi', '$2y$10$GzzSGSCVWtpd.C3rGm8H2ezVajP90fYSSG4zcFWVn2sRymLn6MUDm', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `orderan`
--
ALTER TABLE `orderan`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderan`
--
ALTER TABLE `orderan`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
