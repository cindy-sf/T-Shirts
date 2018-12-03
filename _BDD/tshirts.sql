-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 03 déc. 2018 à 19:01
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tshirts`
--

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'vimeo'),
(2, 'hangry man'),
(3, 'nike'),
(4, 'one & grey'),
(5, 'obey'),
(6, 'pinky'),
(7, 'white lorem'),
(8, 'new balance'),
(9, 'sprit lorem');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `price` mediumint(8) UNSIGNED NOT NULL,
  `url_img` varchar(200) DEFAULT NULL,
  `id_brand` smallint(6) UNSIGNED NOT NULL,
  `color` varchar(30) NOT NULL,
  `checked` tinyint(1) DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brands` (`id_brand`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `reference`, `price`, `url_img`, `id_brand`, `color`, `checked`, `description`) VALUES
(6, 'pin-01-2018', 75, '6.png', 6, '#e4bec1', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.\nDolor sit ameyorit.'),
(5, 'obe-01-2018', 30, '5.png', 5, 'white', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(4, 'ogr-01-2018', 270, '4.png', 4, 'grey', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(2, 'hma-01-2018', 110, '2.png', 2, '#007da1', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(3, 'nik-01-2018', 20, '3.png', 3, 'white', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(1, 'vim-01-2018', 95, '1.png', 1, 'white', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(7, 'wlo-01-2018', 250, '7.png', 7, 'white', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(8, 'nba-01-2018', 115, '8.png', 8, '#d21733', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux.'),
(9, 'slo-01-2018', 220, '9.png', 9, 'white', 0, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 2000'),
(75, 'test-ref-007', 220, 'Exemple 3.png', 2, 'blue', 0, 'No description...'),
(76, 'test-ref-0078', 110, 'Exemple 4.png', 3, 'white', 0, 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de L., le rendant vieux de 2000 ans.'),
(83, 'adidas-ref-001', 225, 'beige_1.png', 1, 'white', 0, 'Si vous voulez utiliser un passage du Lorem Ipsum, vous devez être sûr qu\'il n\'y a rien d\'embarrassant caché dans le texte. Tous les générateurs de Lorem Ipsum sur Internet tendent à reproduire le même extrait sans fin.'),
(79, 'balenciaga-ref-001', 255, 'balenciaga-black-speed-sock-sneakers_12538830_13176781_800.png', 1, 'red', 0, 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
