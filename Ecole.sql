-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 19 sep. 2024 à 18:26
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `student_id` int(11) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `numero_salle` int(11) DEFAULT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `annee_obtention` year(4) DEFAULT NULL,
  `numero_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`student_id`, `prenom`, `nom`, `numero_salle`, `telephone`, `email`, `annee_obtention`, `numero_classe`) VALUES
(1, 'Mark', 'Watney', NULL, '777-555-1234', NULL, '2035', 1),
(24, 'Bob', 'Durand', NULL, '777-555-1235', NULL, '2026', 2),
(25, 'Alice', 'Martin', NULL, '777-555-1234', NULL, '2025', 1),
(26, 'Charlie', 'Leroy', NULL, '777-555-1236', NULL, '2027', 1),
(27, 'David', 'Moreau', NULL, '777-555-1237', NULL, '2028', 2),
(28, 'Emma', 'Fournier', NULL, '777-555-1238', NULL, '2029', 1),
(29, 'Fiona', 'Dupuis', NULL, '777-555-1239', NULL, '2030', 2),
(30, 'George', 'Gauthier', NULL, '777-555-1240', NULL, '2025', 1),
(31, 'Hannah', 'Rousseau', NULL, '777-555-1241', NULL, '2026', 2),
(32, 'Ivy', 'Lambert', NULL, '777-555-1242', NULL, '2027', 1),
(33, 'Jack', 'Bonnet', NULL, '777-555-1243', NULL, '2028', 2),
(34, 'Kevin', 'Lemoine', NULL, '777-555-1244', NULL, '2029', 1),
(35, 'Liam', 'Dufresne', NULL, '777-555-1245', NULL, '2030', 2),
(36, 'Mia', 'Girard', NULL, '777-555-1246', NULL, '2025', 1),
(37, 'Nina', 'Dubois', NULL, '777-555-1247', NULL, '2026', 2),
(38, 'Oscar', 'Carpentier', NULL, '777-555-1248', NULL, '2027', 1),
(39, 'Paul', 'Mercier', NULL, '777-555-1249', NULL, '2028', 2),
(40, 'Quinn', 'Renaud', NULL, '777-555-1250', NULL, '2029', 1),
(41, 'Rachel', 'Leclerc', NULL, '777-555-1251', NULL, '2030', 2),
(42, 'Sam', 'Benoit', NULL, '777-555-1252', NULL, '2025', 1),
(43, 'Tina', 'Vidal', NULL, '777-555-1253', NULL, '2026', 2);

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `teacher_id` int(11) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `numero_salle` int(11) DEFAULT NULL,
  `departement` varchar(100) DEFAULT NULL,
  `annee_obtention` year(4) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) NOT NULL,
  `numero_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`teacher_id`, `prenom`, `nom`, `numero_salle`, `departement`, `annee_obtention`, `email`, `telephone`, `numero_classe`) VALUES
(1, 'Jonas', 'Salk', NULL, 'Biologie', NULL, 'jsalk@school.org', '777-555-4321', 1),
(7, 'Marie', 'Curie', NULL, 'Physique', '2006', 'marie.curie@school.org', '777-555-4322', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `numero_classe` (`numero_classe`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numero_classe` (`numero_classe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`numero_classe`) REFERENCES `enseignants` (`numero_classe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
