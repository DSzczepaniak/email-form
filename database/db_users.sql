-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 01:20 PM
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_users`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assignments`
--

CREATE TABLE `assignments` (
  `ID` int(11) NOT NULL,
  `ID_recipient` int(11) DEFAULT NULL,
  `ID_group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`ID`, `ID_recipient`, `ID_group`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 4),
(4, 3, 1),
(5, 4, 3),
(6, 5, 4),
(7, 6, 2),
(8, 4, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups`
--

CREATE TABLE `groups` (
  `ID` int(11) NOT NULL,
  `groupName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`ID`, `groupName`) VALUES
(1, 'Group1'),
(2, 'Group2'),
(3, 'Group3'),
(4, 'Group4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipients`
--

CREATE TABLE `recipients` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`ID`, `name`, `lastName`, `email`) VALUES
(1, 'Jan', 'Kowalski', 'example@example.com'),
(2, 'Marek', 'Mostowiak', 'mail@example.com'),
(3, 'Anna', 'Nowak', 'mail@mail.com'),
(4, 'Piotr', 'Mickiewicz', 'example@mail.com'),
(5, 'Janina', 'Nowak', 'example@exmpl.com'),
(6, 'Oskar', 'Źdźbło', 'exmpl@exmpl.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sentemails`
--

CREATE TABLE `sentemails` (
  `ID` int(11) NOT NULL,
  `recipientName` varchar(50) DEFAULT NULL,
  `recipientLastName` varchar(50) DEFAULT NULL,
  `recipientEmail` varchar(50) NOT NULL,
  `message` varchar(350) DEFAULT NULL,
  `toGroup` varchar(50) DEFAULT NULL,
  `sendDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_recipient` (`ID_recipient`),
  ADD KEY `ID_group` (`ID_group`);

--
-- Indeksy dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `sentemails`
--
ALTER TABLE `sentemails`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipients`
--
ALTER TABLE `recipients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sentemails`
--
ALTER TABLE `sentemails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`ID_recipient`) REFERENCES `recipients` (`ID`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`ID_group`) REFERENCES `groups` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
