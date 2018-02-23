-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 18 Février 2018 à 12:20
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `demandecitoyen`
--
CREATE DATABASE IF NOT EXISTS `demandecitoyen` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `demandecitoyen`;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` smallint(6) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `proprietaire` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `document`
--

TRUNCATE TABLE `document`;
--
-- Contenu de la table `document`
--

INSERT IGNORE INTO `document` (`id`, `nom`, `proprietaire`) VALUES
(1, 'nolwenBretonne.jpg', 1),
(2, 'nowennChantdeMer.jpg', 1),
(3, 'MarinsIroise.jpg', 1),
(4, 'ChristopheOrdinaires.jpg', 1),
(5, 'ChristopheOrdinaires.jpg', 1),
(6, 'ChristopheOrdinaires.jpg', 1),
(7, 'GillesHermine.jpg', 1),
(8, 'MarinsIroise.jpg', 1),
(9, 'MarinsIroise.jpg', 1),
(10, 'attestationFUNMOOCPython3.pdf', 1),
(11, 'Smebacarteinscription.pdf', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fiche`
--

DROP TABLE IF EXISTS `fiche`;
CREATE TABLE `fiche` (
  `id` smallint(6) NOT NULL,
  `demandeur` smallint(6) DEFAULT NULL,
  `objet` varchar(100) NOT NULL,
  `datedemande` date DEFAULT NULL,
  `statut` varchar(10) NOT NULL DEFAULT 'Non traite'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `fiche`
--

TRUNCATE TABLE `fiche`;
--
-- Contenu de la table `fiche`
--

INSERT IGNORE INTO `fiche` (`id`, `demandeur`, `objet`, `datedemande`, `statut`) VALUES
(1, 1, 'demande1', '2018-01-24', 'traite'),
(2, 1, 'alala', '2018-01-24', 'traite'),
(3, 1, 'test1', '2018-01-24', 'traite'),
(4, 1, 'test2', '2018-01-28', 'Non traite'),
(5, 1, 'testimg', '2018-01-28', 'Non traite'),
(6, 1, 'autrephoto', '2018-01-28', 'Non traite'),
(7, 1, 'testDemand', '2018-01-28', 'Non traite'),
(8, 1, 'testDemand', '2018-01-28', 'Non traite'),
(9, 1, 'test avec bonnai', '2018-02-02', 'Non traite'),
(10, 1, 'test 2 bonnai', '2018-02-02', 'Non traite'),
(11, 1, 'test 7', '2018-02-02', 'Non traite'),
(12, 1, 'terssg 5', '2018-02-02', 'Non traite'),
(13, 1, 'testnd d', '2018-02-02', 'Non traite'),
(14, 1, 'cliche', '2018-02-02', 'Non traite'),
(15, 1, 'shoot', '2018-02-02', 'Non traite'),
(16, 1, 'alvihn 455', '2018-02-02', 'Non traite'),
(17, 1, 'remerci 5a', '2018-02-02', 'Non traite'),
(18, 1, 'user 2', '2018-02-02', 'Non traite'),
(19, 1, 'testree 8', '2018-02-02', 'Non traite'),
(20, 1, 'testree 8', '2018-02-02', 'Non traite'),
(21, 1, 'test jstl', '2018-02-03', 'Non traite'),
(22, 1, 'test jstl', '2018-02-03', 'Non traite'),
(23, 1, 'test jstl', '2018-02-03', 'Non traite'),
(24, 1, 'neo demande', '2018-02-05', 'Non traite'),
(25, 1, 'neo demande', '2018-02-05', 'Non traite'),
(26, 1, 'test avec pdf', '2018-02-05', 'Non traite'),
(27, 1, 'nouvelle demande', '2018-02-10', 'Non traite'),
(28, 1, 'mademande', '2018-02-10', 'Non traite'),
(29, 1, 'mademande', '2018-02-10', 'Non traite'),
(30, 1, 'mademande', '2018-02-10', 'Non traite'),
(31, 1, 'ma demande', '2018-02-10', 'Non traite'),
(32, 1, 'ma demande', '2018-02-10', 'Non traite'),
(33, 1, 'ma demande', '2018-02-10', 'Non traite'),
(34, 1, 'demandeAl', '2018-02-11', 'traite');

-- --------------------------------------------------------

--
-- Structure de la table `fichesansforum`
--

DROP TABLE IF EXISTS `fichesansforum`;
CREATE TABLE `fichesansforum` (
  `id` smallint(6) NOT NULL,
  `demandeur` smallint(6) DEFAULT NULL,
  `objet` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `datedemande` date DEFAULT NULL,
  `reponse` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `fichesansforum`
--

TRUNCATE TABLE `fichesansforum`;
--
-- Contenu de la table `fichesansforum`
--

INSERT IGNORE INTO `fichesansforum` (`id`, `demandeur`, `objet`, `description`, `datedemande`, `reponse`) VALUES
(1, 1, 'demande1', 'j''ai bdehjiabdheabdhebadhebedbje', '2018-01-24', ''),
(2, 1, 'alala', 'ouloulou', '2018-01-24', ''),
(3, 1, 'test1', 'test1 vkneojnejfnr', NULL, ''),
(4, 1, 'test2', 'dfjfnrjnff', '2018-01-28', ''),
(5, 1, 'testimg', 'test image', '2018-01-28', ''),
(6, 1, 'autrephoto', 'dd dn dn qdjzb kbzkfz', '2018-01-28', ''),
(7, 1, 'testDemand', 'pfffffffffffffffffffffffffffffffffffffffffffff ok ok ayayayayaya', '2018-01-28', ''),
(8, 1, 'testDemand', 'pfffffffffffffffffffffffffffffffffffffffffffff ok ok ayayayayaya', '2018-01-28', ''),
(9, 1, 'test avec bonnai', 'test avec bonnai le TWCS ELN', '2018-02-02', ''),
(10, 1, 'test 2 bonnai', 'bonnai Nouh', '2018-02-02', ''),
(11, 1, 'test 7', 'hvjcrxfcfchgcgvgh', '2018-02-02', ''),
(12, 1, 'terssg 5', 'fnejfnejdd', '2018-02-02', ''),
(13, 1, 'testnd d', ',jkbjhbh', '2018-02-02', ''),
(14, 1, 'cliche', 'clicherr', '2018-02-02', ''),
(15, 1, 'shoot', 'shootinnng clamm nom', '2018-02-02', 'test avec mail citoyen'),
(16, 1, 'alvihn 455', 'alvihn', '2018-02-02', 'Repoinse 1\r\n'),
(17, 1, 'remerci 5a', 'Dabalasava ah ouias mdr', '2018-02-02', 'Destinne'),
(18, 1, 'user 2', 'get each other', '2018-02-02', ''),
(19, 1, 'testree 8', 'knjnjbhsb alvihn et chimpmunks', '2018-02-02', ''),
(20, 1, 'testree 8', 'knjnjbhsb alvihn et chimpmunks', '2018-02-02', ''),
(21, 1, 'test jstl', 'Essai gestionBaseDemande avec des balises uniquement', '2018-02-03', ''),
(22, 1, 'test jstl', 'Essai gestionBaseDemande avec des balises uniquement', '2018-02-03', ''),
(23, 1, 'test jstl', 'Essai gestionBaseDemande avec des balises uniquement', '2018-02-03', 'Reponse 1'),
(24, 1, 'neo demande', 'jdhdgfgfhvgav', '2018-02-05', ''),
(25, 1, 'neo demande', 'jdhdgfgfhvgav', '2018-02-05', ''),
(26, 1, 'test avec pdf', 'test avec PDF\r\nPour mon porte document ', '2018-02-05', ''),
(27, 1, 'nouvelle demande', 'Alvihn et Djicko', '2018-02-10', 'Reponse Alvihn et Djicko'),
(28, 1, 'mademande', 'ma description\r\n', '2018-02-10', ''),
(29, 1, 'mademande', 'ma description\r\n', '2018-02-10', ''),
(30, 1, 'mademande', 'ma description\r\n', '2018-02-10', ''),
(31, 1, 'ma demande', 'ma description', '2018-02-10', ''),
(32, 1, 'ma demande', 'ma description', '2018-02-10', ''),
(33, 1, 'ma demande', 'ma description 2', '2018-02-10', '');

-- --------------------------------------------------------

--
-- Structure de la table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
CREATE TABLE `interaction` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `contenu` text NOT NULL,
  `dateinteraction` datetime NOT NULL,
  `ficheId` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `interaction`
--

TRUNCATE TABLE `interaction`;
--
-- Contenu de la table `interaction`
--

INSERT IGNORE INTO `interaction` (`id`, `type`, `contenu`, `dateinteraction`, `ficheId`) VALUES
(1, 'description', 'desc 1', '2018-02-11 16:02:37', 24),
(2, 'description', 'Description 289', '2018-02-11 17:10:57', 34),
(3, 'description', 'nouvelle description avec document', '2018-02-11 17:47:59', 34),
(4, 'reponse', 'dndnz', '2018-02-11 19:07:11', 3),
(5, 'reponse', 'tentative de reponse', '2018-02-11 19:27:01', 34),
(6, 'description', 'Continuit', '2018-02-11 21:53:22', 1),
(7, 'reponse', 'reponse fiche 2', '2018-02-11 22:00:10', 2),
(8, 'description', 'Nouvelle desc', '2018-02-18 12:11:36', 1),
(9, 'reponse', 'reponse 1', '2018-02-18 12:15:56', 1),
(10, 'reponse', 'reponse1', '2018-02-18 12:17:13', 1);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(20) DEFAULT '',
  `identifiant` varchar(30) NOT NULL,
  `motPasse` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `fixe` varchar(15) DEFAULT '',
  `mobile` varchar(15) DEFAULT '',
  `rue` varchar(40) DEFAULT '',
  `ville` varchar(30) NOT NULL DEFAULT '',
  `fonction` varchar(20) NOT NULL DEFAULT 'citoyen'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `personne`
--

TRUNCATE TABLE `personne`;
--
-- Contenu de la table `personne`
--

INSERT IGNORE INTO `personne` (`id`, `nom`, `prenom`, `identifiant`, `motPasse`, `mail`, `fixe`, `mobile`, `rue`, `ville`, `fonction`) VALUES
(1, 'alvihn', 'alvihn', 'alvihn', '$2a$10$93gUSgUlxg2Y9BMLXY8M9eK9tEbaMpwpkewaVAf.32tyWmcVzande', 'alvihnketremindie@gmail.com', '0605547324', '0605547324', '655 Avenue du technopole', '29280 Plouzane', 'citoyen'),
(6, 'junior', '', 'junior', '$2a$10$pkiE17HcIY7kX/1EGVagSOmHK8NXyNkP0spCeAG6.Hfph2CJ7N622', 'louis-junior-alvihn.ketremindie@imt-atlantique.net', '', '', '', '', 'adminsitration'),
(3, 'aaaa', '', 'aaaa', '$2a$10$jZ7zhJQf0WL8zTCV.Po4ue0Fr8ePn4BUmg60jWKsIYRO3g4unwJwG', 'aaaa@aaaa.aa', '', '', '', '', 'citoyen'),
(4, 'bbbb', '', 'bbbb', '$2a$10$Uz6ByTmhBYHu07KqBF2X3.oqjJj23jT50APsDcrhy7eYoblnIXE96', 'bbbb@bbbb.bb', '', '', '', '', 'citoyen'),
(5, 'cccc', '', 'cccc', '$2a$10$9ZIlSYSqeYFY32lpysFeoOdxEGxX1ba0dTLUQ6RzVF3yyXx2/mPOq', 'cccc@cccc.cc', '', '', '', '', 'citoyen'),
(7, 'admin', '', 'admin', '$2a$10$z3O8Xl2ae0OJYBkOEsOSXOWAbt4BtoZpzW.jI0.R.upC7EOtrncA.', 'louis-junior-alvihn.ketremindie@imt-atlantique.net', '', '', '', '', 'adminsitration'),
(8, 'sekou', '', 'sekou', '$2a$10$jHSl03JRqn9pfD2YNOSvQ./K7LuJd1yM7/L0AvNNjZF0MqSr8BuJW', 'sekou-bokary.traore@imt.fr', '', '', '', '', 'citoyen');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiche`
--
ALTER TABLE `fiche`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichesansforum`
--
ALTER TABLE `fichesansforum`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `interaction`
--
ALTER TABLE `interaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ficheId` (`ficheId`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `fiche`
--
ALTER TABLE `fiche`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `fichesansforum`
--
ALTER TABLE `fichesansforum`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `interaction`
--
ALTER TABLE `interaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `interaction`
--
ALTER TABLE `interaction`
  ADD CONSTRAINT `fk_fiche_interaction` FOREIGN KEY (`ficheId`) REFERENCES `fiche` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
