-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 24. Mai 2022 um 14:19
-- Server-Version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP-Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mydb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ags`
--

CREATE TABLE `ags` (
  `agnr` int(11) NOT NULL,
  `agbezeichnung` varchar(45) DEFAULT NULL,
  `raumnr` int(11) DEFAULT NULL,
  `wochentag` varchar(45) DEFAULT NULL,
  `startzeit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ags`
--

INSERT INTO `ags` (`agnr`, `agbezeichnung`, `raumnr`, `wochentag`, `startzeit`) VALUES
(1, 'Test', 200, 'Montag', '15:00'),
(2, 'Test', 200, 'Montag', '15:00'),
(3, 'Test', 200, 'Montag', '15:00'),
(4, 'Test', 200, 'Montag', '15:00'),
(5, 'Test', 200, 'Montag', '15:00'),
(6, 'Test', 200, 'Montag', '15:00'),
(7, 'Test', 200, 'Montag', '15:00'),
(8, 'Test', 156, 'Donnerstag', '15:00'),
(9, 'Test', 156, 'Donnerstag', '14:00'),
(10, 'Test', 157, 'Donnerstag', '14:00'),
(11, 'Test', 157, 'Montag', '14:00'),
(12, 'Test', 157, 'Freitag', '14:00'),
(13, 'Test', 200, 'Montag', '14:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Lieferanten`
--

CREATE TABLE `Lieferanten` (
  `Handelsregisternummer` int(11) NOT NULL,
  `Firmenname` varchar(45) DEFAULT NULL,
  `Telefonnummer` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Lieferanten`
--

INSERT INTO `Lieferanten` (`Handelsregisternummer`, `Firmenname`, `Telefonnummer`) VALUES
(123456789, 'WVSS Mannheim', '0123456789'),
(987654321, 'Mannheim WVSS', '9876543210');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schueler`
--

CREATE TABLE `schueler` (
  `schuelernr` int(11) NOT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  `teilnahme` varchar(45) DEFAULT NULL,
  `Tablets_Inventarnummer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `schueler`
--

INSERT INTO `schueler` (`schuelernr`, `vorname`, `nachname`, `teilnahme`, `Tablets_Inventarnummer`) VALUES
(2, 'Byron', 'Fröhlich', NULL, 1),
(3, 'Steffen', 'Körner', NULL, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Tablets`
--

CREATE TABLE `Tablets` (
  `Inventarnummer` int(11) NOT NULL,
  `Modellbezeichnung` varchar(45) DEFAULT NULL,
  `Kaufdatum` date DEFAULT NULL,
  `Lieferanten_Handelsregisternummer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Tablets`
--

INSERT INTO `Tablets` (`Inventarnummer`, `Modellbezeichnung`, `Kaufdatum`, `Lieferanten_Handelsregisternummer`) VALUES
(1, 'iPad Pro', '2022-05-10', 123456789),
(2, 'Samsung Galaxy Tab', '2022-05-19', 987654321);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teilnahme`
--

CREATE TABLE `teilnahme` (
  `teilnahmenr` int(11) NOT NULL,
  `ags_agnr` int(11) NOT NULL,
  `schueler_schuelernr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teilnahme`
--

INSERT INTO `teilnahme` (`teilnahmenr`, `ags_agnr`, `schueler_schuelernr`) VALUES
(1, 6, 3),
(2, 10, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ags`
--
ALTER TABLE `ags`
  ADD PRIMARY KEY (`agnr`);

--
-- Indizes für die Tabelle `Lieferanten`
--
ALTER TABLE `Lieferanten`
  ADD PRIMARY KEY (`Handelsregisternummer`);

--
-- Indizes für die Tabelle `schueler`
--
ALTER TABLE `schueler`
  ADD PRIMARY KEY (`schuelernr`,`Tablets_Inventarnummer`),
  ADD KEY `fk_schueler_Tablets1_idx` (`Tablets_Inventarnummer`);

--
-- Indizes für die Tabelle `Tablets`
--
ALTER TABLE `Tablets`
  ADD PRIMARY KEY (`Inventarnummer`,`Lieferanten_Handelsregisternummer`),
  ADD KEY `fk_Tablets_Lieferanten1_idx` (`Lieferanten_Handelsregisternummer`);

--
-- Indizes für die Tabelle `teilnahme`
--
ALTER TABLE `teilnahme`
  ADD PRIMARY KEY (`teilnahmenr`,`ags_agnr`,`schueler_schuelernr`),
  ADD KEY `fk_teilnahme_ags1_idx` (`ags_agnr`),
  ADD KEY `fk_teilnahme_schueler1_idx` (`schueler_schuelernr`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ags`
--
ALTER TABLE `ags`
  MODIFY `agnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT für Tabelle `Lieferanten`
--
ALTER TABLE `Lieferanten`
  MODIFY `Handelsregisternummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=987654322;
--
-- AUTO_INCREMENT für Tabelle `schueler`
--
ALTER TABLE `schueler`
  MODIFY `schuelernr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `Tablets`
--
ALTER TABLE `Tablets`
  MODIFY `Inventarnummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `teilnahme`
--
ALTER TABLE `teilnahme`
  MODIFY `teilnahmenr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `schueler`
--
ALTER TABLE `schueler`
  ADD CONSTRAINT `fk_schueler_Tablets1` FOREIGN KEY (`Tablets_Inventarnummer`) REFERENCES `Tablets` (`Inventarnummer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `Tablets`
--
ALTER TABLE `Tablets`
  ADD CONSTRAINT `fk_Tablets_Lieferanten1` FOREIGN KEY (`Lieferanten_Handelsregisternummer`) REFERENCES `Lieferanten` (`Handelsregisternummer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `teilnahme`
--
ALTER TABLE `teilnahme`
  ADD CONSTRAINT `fk_teilnahme_ags1` FOREIGN KEY (`ags_agnr`) REFERENCES `ags` (`agnr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_teilnahme_schueler1` FOREIGN KEY (`schueler_schuelernr`) REFERENCES `schueler` (`schuelernr`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
