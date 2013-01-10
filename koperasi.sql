-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2013 at 09:12 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `idanggota` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `idtransaksi` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `nopinjam` varchar(30) NOT NULL,
  `nosimpan` varchar(30) NOT NULL,
  PRIMARY KEY (`idanggota`),
  UNIQUE KEY `idanggota` (`idanggota`,`idtransaksi`),
  KEY `idtransaksi` (`idtransaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`idanggota`, `nama`, `alamat`, `idtransaksi`, `nopinjam`, `nosimpan`) VALUES
('45010210018', 'Irvan abdurahman', 'Pancoran', '20', '30', '10'),
('4510210016', 'Denny Kurniawan', 'Jakarta', '45', '20', '120'),
('4510210017', 'Mas Agung', 'Jakarta', '50', '20', '40'),
('4510210018', 'Muhammad Rafii', 'Condet', '20', '20', '60');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE IF NOT EXISTS `peminjaman` (
  `idanggota` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `No Pinjam` varchar(30) NOT NULL,
  `Jumlah Pinjaman` varchar(30) NOT NULL,
  PRIMARY KEY (`No Pinjam`),
  KEY `ID Anggota` (`idanggota`),
  KEY `idanggota` (`idanggota`),
  KEY `idanggota_2` (`idanggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`idanggota`, `No Pinjam`, `Jumlah Pinjaman`) VALUES
('4510210016', '', ''),
('4510210017', '20', '40');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE IF NOT EXISTS `simpanan` (
  `ID Anggota` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `No Simpan` varchar(30) NOT NULL,
  `Jumlah Simpanan` varchar(30) NOT NULL,
  PRIMARY KEY (`No Simpan`),
  KEY `ID Anggota` (`ID Anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `Nama` varchar(30) NOT NULL,
  `ID  Transaksi` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`ID  Transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`Nama`, `ID  Transaksi`) VALUES
('Denny  Kurniawan', '45');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('Agung', 'pancasila2'),
('Denny', 'pancasila1'),
('kurniawan', 'pancasila3');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`idanggota`) REFERENCES `anggota` (`idanggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`ID Anggota`) REFERENCES `anggota` (`idanggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID  Transaksi`) REFERENCES `anggota` (`idtransaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
