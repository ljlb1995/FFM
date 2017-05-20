-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Apr 24, 2017 at 07:27 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `dev_dbkm`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `acceso`
-- 

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador del acceso',
  `usuario_id` int(11) NOT NULL COMMENT 'Identificador del usuario que accede',
  `tipo_acceso` int(1) NOT NULL default '1' COMMENT 'Tipo de acceso (entrata o salida)',
  `ip` varchar(45) default NULL COMMENT 'Dirección IP del usuario que ingresa',
  `registrado_at` datetime default NULL COMMENT 'Fecha de registro del acceso',
  PRIMARY KEY  (`id`),
  KEY `fk_acceso_usuario_idx` (`usuario_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que registra los accesos de los usuarios al sistema' AUTO_INCREMENT=84 ;

-- 
-- Dumping data for table `acceso`
-- 

INSERT INTO `acceso` VALUES (1, 2, 1, '127.0.0.1', '2016-11-04 10:42:05');
INSERT INTO `acceso` VALUES (2, 2, 1, '127.0.0.1', '2016-11-04 10:51:21');
INSERT INTO `acceso` VALUES (3, 2, 1, '127.0.0.1', '2016-11-04 11:31:50');
INSERT INTO `acceso` VALUES (4, 2, 2, '127.0.0.1', '2016-11-04 11:32:24');
INSERT INTO `acceso` VALUES (5, 2, 1, '127.0.0.1', '2016-11-04 11:33:05');
INSERT INTO `acceso` VALUES (6, 2, 1, '127.0.0.1', '2016-11-07 14:14:00');
INSERT INTO `acceso` VALUES (7, 2, 1, '127.0.0.1', '2016-11-15 10:01:25');
INSERT INTO `acceso` VALUES (8, 2, 2, '127.0.0.1', '2016-11-15 10:05:00');
INSERT INTO `acceso` VALUES (9, 2, 1, '127.0.0.1', '2016-11-15 10:07:24');
INSERT INTO `acceso` VALUES (10, 2, 2, '127.0.0.1', '2016-11-15 10:08:26');
INSERT INTO `acceso` VALUES (11, 2, 1, '127.0.0.1', '2016-11-15 10:13:56');
INSERT INTO `acceso` VALUES (12, 2, 2, '127.0.0.1', '2016-11-15 10:15:30');
INSERT INTO `acceso` VALUES (13, 2, 1, '127.0.0.1', '2016-11-15 10:16:57');
INSERT INTO `acceso` VALUES (14, 2, 2, '127.0.0.1', '2016-11-15 10:23:05');
INSERT INTO `acceso` VALUES (15, 2, 1, '127.0.0.1', '2016-11-15 10:27:08');
INSERT INTO `acceso` VALUES (16, 2, 2, '127.0.0.1', '2016-11-15 10:32:12');
INSERT INTO `acceso` VALUES (17, 2, 1, '127.0.0.1', '2016-11-15 10:32:17');
INSERT INTO `acceso` VALUES (18, 2, 2, '127.0.0.1', '2016-11-15 10:32:51');
INSERT INTO `acceso` VALUES (19, 2, 1, '127.0.0.1', '2016-11-15 10:33:29');
INSERT INTO `acceso` VALUES (20, 2, 2, '127.0.0.1', '2016-11-15 10:34:19');
INSERT INTO `acceso` VALUES (21, 2, 1, '127.0.0.1', '2016-11-15 10:34:57');
INSERT INTO `acceso` VALUES (22, 2, 2, '127.0.0.1', '2016-11-15 10:43:45');
INSERT INTO `acceso` VALUES (23, 2, 1, '127.0.0.1', '2016-11-15 10:43:51');
INSERT INTO `acceso` VALUES (24, 2, 2, '127.0.0.1', '2016-11-15 11:03:34');
INSERT INTO `acceso` VALUES (25, 2, 1, '127.0.0.1', '2016-11-15 11:03:39');
INSERT INTO `acceso` VALUES (26, 2, 2, '127.0.0.1', '2016-11-15 11:17:28');
INSERT INTO `acceso` VALUES (27, 2, 1, '127.0.0.1', '2016-11-15 11:17:37');
INSERT INTO `acceso` VALUES (28, 2, 2, '127.0.0.1', '2016-11-15 11:23:18');
INSERT INTO `acceso` VALUES (29, 2, 1, '127.0.0.1', '2016-11-15 11:23:23');
INSERT INTO `acceso` VALUES (30, 2, 1, '127.0.0.1', '2016-11-15 11:28:31');
INSERT INTO `acceso` VALUES (31, 2, 2, '127.0.0.1', '2016-11-15 11:29:10');
INSERT INTO `acceso` VALUES (32, 2, 1, '127.0.0.1', '2016-11-15 11:39:24');
INSERT INTO `acceso` VALUES (33, 2, 1, '127.0.0.1', '2016-11-15 12:04:51');
INSERT INTO `acceso` VALUES (34, 2, 2, '127.0.0.1', '2016-11-15 12:22:09');
INSERT INTO `acceso` VALUES (35, 2, 1, '127.0.0.1', '2016-11-15 12:22:19');
INSERT INTO `acceso` VALUES (36, 2, 2, '127.0.0.1', '2016-11-15 12:23:32');
INSERT INTO `acceso` VALUES (37, 2, 1, '127.0.0.1', '2016-11-15 12:23:41');
INSERT INTO `acceso` VALUES (38, 2, 1, '127.0.0.1', '2016-11-15 12:35:10');
INSERT INTO `acceso` VALUES (39, 2, 2, '127.0.0.1', '2016-11-15 12:50:13');
INSERT INTO `acceso` VALUES (40, 3, 1, '127.0.0.1', '2016-11-15 12:50:18');
INSERT INTO `acceso` VALUES (41, 3, 2, '127.0.0.1', '2016-11-15 12:50:24');
INSERT INTO `acceso` VALUES (42, 2, 1, '127.0.0.1', '2016-11-15 12:50:30');
INSERT INTO `acceso` VALUES (43, 2, 1, '127.0.0.1', '2016-11-17 10:46:05');
INSERT INTO `acceso` VALUES (44, 2, 2, '127.0.0.1', '2016-11-17 10:49:02');
INSERT INTO `acceso` VALUES (45, 2, 1, '127.0.0.1', '2016-11-21 15:36:49');
INSERT INTO `acceso` VALUES (46, 2, 1, '127.0.0.1', '2016-11-29 06:38:33');
INSERT INTO `acceso` VALUES (47, 2, 1, '127.0.0.1', '2016-12-05 10:38:34');
INSERT INTO `acceso` VALUES (48, 2, 2, '127.0.0.1', '2016-12-05 10:44:47');
INSERT INTO `acceso` VALUES (49, 2, 1, '127.0.0.1', '2016-12-05 10:44:57');
INSERT INTO `acceso` VALUES (50, 2, 1, '127.0.0.1', '2016-12-16 13:22:13');
INSERT INTO `acceso` VALUES (51, 2, 1, '127.0.0.1', '2016-12-16 19:21:40');
INSERT INTO `acceso` VALUES (52, 2, 1, '127.0.0.1', '2017-01-12 13:19:32');
INSERT INTO `acceso` VALUES (53, 2, 1, '127.0.0.1', '2017-01-12 15:11:17');
INSERT INTO `acceso` VALUES (54, 2, 1, '127.0.0.1', '2017-01-13 13:31:03');
INSERT INTO `acceso` VALUES (55, 2, 1, '127.0.0.1', '2017-01-13 14:24:57');
INSERT INTO `acceso` VALUES (56, 2, 1, '127.0.0.1', '2017-01-23 14:13:05');
INSERT INTO `acceso` VALUES (57, 2, 2, '127.0.0.1', '2017-01-23 15:24:24');
INSERT INTO `acceso` VALUES (58, 2, 1, '127.0.0.1', '2017-01-23 15:24:29');
INSERT INTO `acceso` VALUES (59, 2, 2, '127.0.0.1', '2017-01-23 15:30:39');
INSERT INTO `acceso` VALUES (60, 2, 1, '127.0.0.1', '2017-01-23 15:34:17');
INSERT INTO `acceso` VALUES (61, 2, 1, '127.0.0.1', '2017-01-24 09:02:48');
INSERT INTO `acceso` VALUES (62, 2, 2, '127.0.0.1', '2017-01-24 09:06:10');
INSERT INTO `acceso` VALUES (63, 2, 1, '127.0.0.1', '2017-01-24 09:06:19');
INSERT INTO `acceso` VALUES (64, 2, 1, '127.0.0.1', '2017-02-03 20:01:47');
INSERT INTO `acceso` VALUES (65, 2, 1, '127.0.0.1', '2017-02-06 21:51:57');
INSERT INTO `acceso` VALUES (66, 2, 1, '127.0.0.1', '2017-02-10 11:59:54');
INSERT INTO `acceso` VALUES (67, 2, 2, '127.0.0.1', '2017-02-13 21:16:50');
INSERT INTO `acceso` VALUES (68, 2, 1, '127.0.0.1', '2017-02-14 18:46:25');
INSERT INTO `acceso` VALUES (69, 2, 1, '127.0.0.1', '2017-02-15 21:31:47');
INSERT INTO `acceso` VALUES (70, 2, 1, '127.0.0.1', '2017-02-17 12:26:54');
INSERT INTO `acceso` VALUES (71, 2, 1, '127.0.0.1', '2017-02-18 09:41:14');
INSERT INTO `acceso` VALUES (72, 2, 1, '127.0.0.1', '2017-02-20 19:33:25');
INSERT INTO `acceso` VALUES (73, 2, 1, '127.0.0.1', '2017-02-22 15:57:58');
INSERT INTO `acceso` VALUES (74, 2, 1, '127.0.0.1', '2017-02-22 16:00:24');
INSERT INTO `acceso` VALUES (75, 2, 1, '127.0.0.1', '2017-02-22 19:38:25');
INSERT INTO `acceso` VALUES (76, 2, 1, '127.0.0.1', '2017-03-03 17:58:41');
INSERT INTO `acceso` VALUES (77, 2, 1, '127.0.0.1', '2017-03-05 19:02:30');
INSERT INTO `acceso` VALUES (78, 2, 1, '127.0.0.1', '2017-03-08 15:51:04');
INSERT INTO `acceso` VALUES (79, 2, 1, '127.0.0.1', '2017-03-27 18:11:36');
INSERT INTO `acceso` VALUES (80, 2, 1, '127.0.0.1', '2017-03-27 18:24:07');
INSERT INTO `acceso` VALUES (81, 2, 1, '127.0.0.1', '2017-04-01 17:57:34');
INSERT INTO `acceso` VALUES (82, 2, 1, '127.0.0.1', '2017-04-03 19:44:36');
INSERT INTO `acceso` VALUES (83, 2, 1, '127.0.0.1', '2017-04-13 15:34:50');

-- --------------------------------------------------------

-- 
-- Table structure for table `avance`
-- 

CREATE TABLE `avance` (
  `idavance` int(11) NOT NULL auto_increment,
  `idproyecto` int(11) NOT NULL,
  `sanitaria` int(4) NOT NULL,
  `electrica` int(4) NOT NULL,
  `losa` int(4) NOT NULL,
  `paredesCemento` int(4) NOT NULL,
  `paredesArcilla` int(4) NOT NULL,
  `paredesOtros` int(4) NOT NULL,
  `colunnas` int(4) NOT NULL,
  `vigas` int(4) NOT NULL,
  `dinteles` int(4) NOT NULL,
  `marcoPuerta` int(4) NOT NULL,
  `marcoVentana` int(4) NOT NULL,
  `techoLiviano` int(4) NOT NULL,
  `techoMachiembrado` int(4) NOT NULL,
  `techoPlatabanda` int(4) NOT NULL,
  `techoOtros` int(4) NOT NULL,
  `resaneo` int(4) NOT NULL,
  `friso` int(4) NOT NULL,
  `cementoPulido` int(4) NOT NULL,
  `ceramicaLavado` int(4) NOT NULL,
  `ceramicaCocina` int(4) NOT NULL,
  `ceramicaBano` int(4) NOT NULL,
  `pinternas` int(2) NOT NULL,
  `pexternas` int(2) NOT NULL,
  `ventanas` int(2) NOT NULL,
  `corriente` int(4) NOT NULL,
  `piezaSanitaria` int(4) NOT NULL,
  `pintura` int(4) NOT NULL,
  `servicioPublico` int(4) NOT NULL,
  `afeccionProducto` int(4) NOT NULL,
  `afeccionBrigada` int(4) NOT NULL,
  `afeccionEconomica` int(4) NOT NULL,
  `afeccionTecnica` int(4) NOT NULL,
  `afeccionEquipo` int(4) NOT NULL,
  `afeccionTransporte` int(4) NOT NULL,
  `afeccionMaquinaria` int(4) NOT NULL,
  `sinAfeccion` int(4) NOT NULL,
  `casas` int(11) NOT NULL,
  `responsable` varchar(11) NOT NULL,
  `estado` int(1) NOT NULL default '1',
  PRIMARY KEY  (`idavance`),
  KEY `idproyecto` (`idproyecto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `avance`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `backup`
-- 

CREATE TABLE `backup` (
  `id` int(11) NOT NULL auto_increment,
  `usuario_id` int(11) NOT NULL,
  `denominacion` varchar(200) NOT NULL,
  `tamano` varchar(45) default NULL,
  `archivo` varchar(45) NOT NULL,
  `registrado_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_backup_usuario_idx` (`usuario_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las copias de seguridad del sistema' AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `backup`
-- 

INSERT INTO `backup` VALUES (1, 2, 'Sistema inicial', '4,09 KB', 'backup-1.sql.gz', '2013-01-01 00:00:01');

-- --------------------------------------------------------

-- 
-- Table structure for table `ciudad`
-- 

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL auto_increment,
  `idparroquia` int(11) NOT NULL,
  `ciudad` varchar(200) NOT NULL,
  `capital` tinyint(1) NOT NULL default '0',
  `estatus` tinyint(1) NOT NULL default '1',
  `registrado_at` date default NULL,
  `modificado_in` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `id_estado` (`idparroquia`),
  KEY `nombreciudad` (`ciudad`),
  KEY `idparroquia` (`idparroquia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=523 ;

-- 
-- Dumping data for table `ciudad`
-- 

INSERT INTO `ciudad` VALUES (1, 1, 'Maroa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (2, 1, 'Puerto Ayacucho', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (3, 1, 'San Fernando de Atabapo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (4, 2, 'Anaco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (5, 2, 'Aragua de Barcelona', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (6, 2, 'Barcelona', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (7, 2, 'Boca de Uchire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (8, 2, 'Cantaura', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (9, 2, 'Clarines', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (10, 2, 'El Chaparro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (11, 2, 'El Pao Anzoátegui', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (12, 2, 'El Tigre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (13, 2, 'El Tigrito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (14, 2, 'Guanape', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (15, 2, 'Guanta', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (16, 2, 'Lechería', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (17, 2, 'Onoto', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (18, 2, 'Pariaguán', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (19, 2, 'Píritu', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (20, 2, 'Puerto La Cruz', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (21, 2, 'Puerto Píritu', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (22, 2, 'Sabana de Uchire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (23, 2, 'San Mateo Anzoátegui', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (24, 2, 'San Pablo Anzoátegui', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (25, 2, 'San Tomé', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (26, 2, 'Santa Ana de Anzoátegui', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (27, 2, 'Santa Fe Anzoátegui', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (28, 2, 'Santa Rosa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (29, 2, 'Soledad', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (30, 2, 'Urica', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (31, 2, 'Valle de Guanape', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (43, 3, 'Achaguas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (44, 3, 'Biruaca', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (45, 3, 'Bruzual', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (46, 3, 'El Amparo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (47, 3, 'El Nula', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (48, 3, 'Elorza', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (49, 3, 'Guasdualito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (50, 3, 'Mantecal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (51, 3, 'Puerto Páez', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (52, 3, 'San Fernando de Apure', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (53, 3, 'San Juan de Payara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (54, 4, 'Barbacoas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (55, 4, 'Cagua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (56, 4, 'Camatagua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (58, 4, 'Choroní', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (59, 4, 'Colonia Tovar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (60, 4, 'El Consejo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (61, 4, 'La Victoria', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (62, 4, 'Las Tejerías', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (63, 4, 'Magdaleno', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (64, 4, 'Maracay', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (65, 4, 'Ocumare de La Costa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (66, 4, 'Palo Negro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (67, 4, 'San Casimiro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (68, 4, 'San Mateo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (69, 4, 'San Sebastián', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (70, 4, 'Santa Cruz de Aragua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (71, 4, 'Tocorón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (72, 4, 'Turmero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (73, 4, 'Villa de Cura', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (74, 4, 'Zuata', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (75, 5, 'Barinas', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (76, 5, 'Barinitas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (77, 5, 'Barrancas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (78, 5, 'Calderas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (79, 5, 'Capitanejo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (80, 5, 'Ciudad Bolivia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (81, 5, 'El Cantón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (82, 5, 'Las Veguitas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (83, 5, 'Libertad de Barinas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (84, 5, 'Sabaneta', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (85, 5, 'Santa Bárbara de Barinas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (86, 5, 'Socopó', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (87, 6, 'Caicara del Orinoco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (88, 6, 'Canaima', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (89, 6, 'Ciudad Bolívar', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (90, 6, 'Ciudad Piar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (91, 6, 'El Callao', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (92, 6, 'El Dorado', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (93, 6, 'El Manteco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (94, 6, 'El Palmar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (95, 6, 'El Pao', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (96, 6, 'Guasipati', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (97, 6, 'Guri', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (98, 6, 'La Paragua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (99, 6, 'Matanzas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (100, 6, 'Puerto Ordaz', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (101, 6, 'San Félix', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (102, 6, 'Santa Elena de Uairén', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (103, 6, 'Tumeremo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (104, 6, 'Unare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (105, 6, 'Upata', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (106, 7, 'Bejuma', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (107, 7, 'Belén', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (108, 7, 'Campo de Carabobo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (109, 7, 'Canoabo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (110, 7, 'Central Tacarigua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (111, 7, 'Chirgua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (112, 7, 'Ciudad Alianza', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (113, 7, 'El Palito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (114, 7, 'Guacara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (115, 7, 'Guigue', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (116, 7, 'Las Trincheras', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (117, 7, 'Los Guayos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (118, 7, 'Mariara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (119, 7, 'Miranda', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (120, 7, 'Montalbán', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (121, 7, 'Morón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (122, 7, 'Naguanagua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (123, 7, 'Puerto Cabello', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (124, 7, 'San Joaquín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (125, 7, 'Tocuyito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (126, 7, 'Urama', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (127, 7, 'Valencia', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (128, 7, 'Vigirimita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (129, 8, 'Aguirre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (130, 8, 'Apartaderos Cojedes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (131, 8, 'Arismendi', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (132, 8, 'Camuriquito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (133, 8, 'El Baúl', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (134, 8, 'El Limón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (135, 8, 'El Pao Cojedes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (136, 8, 'El Socorro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (137, 8, 'La Aguadita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (138, 8, 'Las Vegas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (139, 8, 'Libertad de Cojedes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (140, 8, 'Mapuey', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (141, 8, 'Piñedo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (142, 8, 'Samancito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (143, 8, 'San Carlos', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (144, 8, 'Sucre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (145, 8, 'Tinaco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (146, 8, 'Tinaquillo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (147, 8, 'Vallecito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (148, 9, 'Tucupita', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (149, 24, 'Caracas', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (150, 24, 'El Junquito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (151, 10, 'Adícora', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (152, 10, 'Boca de Aroa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (153, 10, 'Cabure', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (154, 10, 'Capadare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (155, 10, 'Capatárida', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (156, 10, 'Chichiriviche', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (157, 10, 'Churuguara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (158, 10, 'Coro', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (159, 10, 'Cumarebo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (160, 10, 'Dabajuro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (161, 10, 'Judibana', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (162, 10, 'La Cruz de Taratara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (163, 10, 'La Vela de Coro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (164, 10, 'Los Taques', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (165, 10, 'Maparari', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (166, 10, 'Mene de Mauroa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (167, 10, 'Mirimire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (168, 10, 'Pedregal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (169, 10, 'Píritu Falcón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (170, 10, 'Pueblo Nuevo Falcón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (171, 10, 'Puerto Cumarebo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (172, 10, 'Punta Cardón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (173, 10, 'Punto Fijo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (174, 10, 'San Juan de Los Cayos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (175, 10, 'San Luis', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (176, 10, 'Santa Ana Falcón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (177, 10, 'Santa Cruz De Bucaral', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (178, 10, 'Tocopero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (179, 10, 'Tocuyo de La Costa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (180, 10, 'Tucacas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (181, 10, 'Yaracal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (182, 11, 'Altagracia de Orituco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (183, 11, 'Cabruta', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (184, 11, 'Calabozo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (185, 11, 'Camaguán', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (196, 11, 'Chaguaramas Guárico', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (197, 11, 'El Socorro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (198, 11, 'El Sombrero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (199, 11, 'Las Mercedes de Los Llanos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (200, 11, 'Lezama', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (201, 11, 'Onoto', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (202, 11, 'Ortíz', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (203, 11, 'San José de Guaribe', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (204, 11, 'San Juan de Los Morros', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (205, 11, 'San Rafael de Laya', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (206, 11, 'Santa María de Ipire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (207, 11, 'Tucupido', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (208, 11, 'Valle de La Pascua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (209, 11, 'Zaraza', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (210, 12, 'Aguada Grande', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (211, 12, 'Atarigua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (212, 12, 'Barquisimeto', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (213, 12, 'Bobare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (214, 12, 'Cabudare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (215, 12, 'Carora', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (216, 12, 'Cubiro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (217, 12, 'Cují', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (218, 12, 'Duaca', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (219, 12, 'El Manzano', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (220, 12, 'El Tocuyo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (221, 12, 'Guaríco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (222, 12, 'Humocaro Alto', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (223, 12, 'Humocaro Bajo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (224, 12, 'La Miel', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (225, 12, 'Moroturo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (226, 12, 'Quíbor', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (227, 12, 'Río Claro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (228, 12, 'Sanare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (229, 12, 'Santa Inés', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (230, 12, 'Sarare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (231, 12, 'Siquisique', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (232, 12, 'Tintorero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (233, 13, 'Apartaderos Mérida', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (234, 13, 'Arapuey', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (235, 13, 'Bailadores', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (236, 13, 'Caja Seca', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (237, 13, 'Canaguá', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (238, 13, 'Chachopo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (239, 13, 'Chiguara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (240, 13, 'Ejido', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (241, 13, 'El Vigía', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (242, 13, 'La Azulita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (243, 13, 'La Playa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (244, 13, 'Lagunillas Mérida', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (245, 13, 'Mérida', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (246, 13, 'Mesa de Bolívar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (247, 13, 'Mucuchíes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (248, 13, 'Mucujepe', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (249, 13, 'Mucuruba', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (250, 13, 'Nueva Bolivia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (251, 13, 'Palmarito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (252, 13, 'Pueblo Llano', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (253, 13, 'Santa Cruz de Mora', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (254, 13, 'Santa Elena de Arenales', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (255, 13, 'Santo Domingo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (256, 13, 'Tabáy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (257, 13, 'Timotes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (258, 13, 'Torondoy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (259, 13, 'Tovar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (260, 13, 'Tucani', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (261, 13, 'Zea', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (262, 14, 'Araguita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (263, 14, 'Carrizal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (264, 14, 'Caucagua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (265, 14, 'Chaguaramas Miranda', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (266, 14, 'Charallave', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (267, 14, 'Chirimena', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (268, 14, 'Chuspa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (269, 14, 'Cúa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (270, 14, 'Cupira', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (271, 14, 'Curiepe', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (272, 14, 'El Guapo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (273, 14, 'El Jarillo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (274, 14, 'Filas de Mariche', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (275, 14, 'Guarenas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (276, 14, 'Guatire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (277, 14, 'Higuerote', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (278, 14, 'Los Anaucos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (279, 14, 'Los Teques', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (280, 14, 'Ocumare del Tuy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (281, 14, 'Panaquire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (282, 14, 'Paracotos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (283, 14, 'Río Chico', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (284, 14, 'San Antonio de Los Altos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (285, 14, 'San Diego de Los Altos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (286, 14, 'San Fernando del Guapo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (287, 14, 'San Francisco de Yare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (288, 14, 'San José de Los Altos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (289, 14, 'San José de Río Chico', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (290, 14, 'San Pedro de Los Altos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (291, 14, 'Santa Lucía', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (292, 14, 'Santa Teresa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (293, 14, 'Tacarigua de La Laguna', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (294, 14, 'Tacarigua de Mamporal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (295, 14, 'Tácata', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (296, 14, 'Turumo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (297, 15, 'Aguasay', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (298, 15, 'Aragua de Maturín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (299, 15, 'Barrancas del Orinoco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (300, 15, 'Caicara de Maturín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (301, 15, 'Caripe', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (302, 15, 'Caripito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (303, 15, 'Chaguaramal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (305, 15, 'Chaguaramas Monagas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (307, 15, 'El Furrial', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (308, 15, 'El Tejero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (309, 15, 'Jusepín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (310, 15, 'La Toscana', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (311, 15, 'Maturín', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (312, 15, 'Miraflores', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (313, 15, 'Punta de Mata', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (314, 15, 'Quiriquire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (315, 15, 'San Antonio de Maturín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (316, 15, 'San Vicente Monagas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (317, 15, 'Santa Bárbara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (318, 15, 'Temblador', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (319, 15, 'Teresen', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (320, 15, 'Uracoa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (321, 16, 'Altagracia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (322, 16, 'Boca de Pozo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (323, 16, 'Boca de Río', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (324, 16, 'El Espinal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (325, 16, 'El Valle del Espíritu Santo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (326, 16, 'El Yaque', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (327, 16, 'Juangriego', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (328, 16, 'La Asunción', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (329, 16, 'La Guardia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (330, 16, 'Pampatar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (331, 16, 'Porlamar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (332, 16, 'Puerto Fermín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (333, 16, 'Punta de Piedras', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (334, 16, 'San Francisco de Macanao', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (335, 16, 'San Juan Bautista', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (336, 16, 'San Pedro de Coche', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (337, 16, 'Santa Ana de Nueva Esparta', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (338, 16, 'Villa Rosa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (339, 17, 'Acarigua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (340, 17, 'Agua Blanca', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (341, 17, 'Araure', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (342, 17, 'Biscucuy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (343, 17, 'Boconoito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (344, 17, 'Campo Elías', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (345, 17, 'Chabasquén', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (346, 17, 'Guanare', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (347, 17, 'Guanarito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (348, 17, 'La Aparición', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (349, 17, 'La Misión', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (350, 17, 'Mesa de Cavacas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (351, 17, 'Ospino', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (352, 17, 'Papelón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (353, 17, 'Payara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (354, 17, 'Pimpinela', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (355, 17, 'Píritu de Portuguesa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (356, 17, 'San Rafael de Onoto', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (357, 17, 'Santa Rosalía', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (358, 17, 'Turén', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (359, 18, 'Altos de Sucre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (360, 18, 'Araya', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (361, 18, 'Cariaco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (362, 18, 'Carúpano', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (363, 18, 'Casanay', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (364, 18, 'Cumaná', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (365, 18, 'Cumanacoa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (366, 18, 'El Morro Puerto Santo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (367, 18, 'El Pilar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (368, 18, 'El Poblado', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (369, 18, 'Guaca', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (370, 18, 'Guiria', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (371, 18, 'Irapa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (372, 18, 'Manicuare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (373, 18, 'Mariguitar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (374, 18, 'Río Caribe', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (375, 18, 'San Antonio del Golfo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (376, 18, 'San José de Aerocuar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (377, 18, 'San Vicente de Sucre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (378, 18, 'Santa Fe de Sucre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (379, 18, 'Tunapuy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (380, 18, 'Yaguaraparo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (381, 18, 'Yoco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (382, 19, 'Abejales', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (383, 19, 'Borota', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (384, 19, 'Bramon', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (385, 19, 'Capacho', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (386, 19, 'Colón', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (387, 19, 'Coloncito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (388, 19, 'Cordero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (389, 19, 'El Cobre', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (390, 19, 'El Pinal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (391, 19, 'Independencia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (392, 19, 'La Fría', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (393, 19, 'La Grita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (394, 19, 'La Pedrera', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (395, 19, 'La Tendida', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (396, 19, 'Las Delicias', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (397, 19, 'Las Hernández', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (398, 19, 'Lobatera', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (399, 19, 'Michelena', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (400, 19, 'Palmira', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (401, 19, 'Pregonero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (402, 19, 'Queniquea', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (403, 19, 'Rubio', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (404, 19, 'San Antonio del Tachira', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (405, 19, 'San Cristobal', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (406, 19, 'San José de Bolívar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (407, 19, 'San Josecito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (408, 19, 'San Pedro del Río', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (409, 19, 'Santa Ana Táchira', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (410, 19, 'Seboruco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (411, 19, 'Táriba', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (412, 19, 'Umuquena', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (413, 19, 'Ureña', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (414, 20, 'Batatal', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (415, 20, 'Betijoque', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (416, 20, 'Boconó', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (417, 20, 'Carache', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (418, 20, 'Chejende', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (419, 20, 'Cuicas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (420, 20, 'El Dividive', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (421, 20, 'El Jaguito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (422, 20, 'Escuque', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (423, 20, 'Isnotú', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (424, 20, 'Jajó', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (425, 20, 'La Ceiba', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (426, 20, 'La Concepción de Trujllo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (427, 20, 'La Mesa de Esnujaque', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (428, 20, 'La Puerta', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (429, 20, 'La Quebrada', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (430, 20, 'Mendoza Fría', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (431, 20, 'Meseta de Chimpire', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (432, 20, 'Monay', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (433, 20, 'Motatán', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (434, 20, 'Pampán', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (435, 20, 'Pampanito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (436, 20, 'Sabana de Mendoza', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (437, 20, 'San Lázaro', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (438, 20, 'Santa Ana de Trujillo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (439, 20, 'Tostós', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (440, 20, 'Trujillo', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (441, 20, 'Valera', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (442, 21, 'Carayaca', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (443, 21, 'Litoral', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (444, 25, 'Archipiélago Los Roques', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (445, 22, 'Aroa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (446, 22, 'Boraure', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (447, 22, 'Campo Elías de Yaracuy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (448, 22, 'Chivacoa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (449, 22, 'Cocorote', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (450, 22, 'Farriar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (451, 22, 'Guama', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (452, 22, 'Marín', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (453, 22, 'Nirgua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (454, 22, 'Sabana de Parra', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (455, 22, 'Salom', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (456, 22, 'San Felipe', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (457, 22, 'San Pablo de Yaracuy', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (458, 22, 'Urachiche', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (459, 22, 'Yaritagua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (460, 22, 'Yumare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (461, 23, 'Bachaquero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (462, 23, 'Bobures', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (463, 23, 'Cabimas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (464, 23, 'Campo Concepción', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (465, 23, 'Campo Mara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (466, 23, 'Campo Rojo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (467, 23, 'Carrasquero', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (468, 23, 'Casigua', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (469, 23, 'Chiquinquirá', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (470, 23, 'Ciudad Ojeda', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (471, 23, 'El Batey', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (472, 23, 'El Carmelo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (473, 23, 'El Chivo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (474, 23, 'El Guayabo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (475, 23, 'El Mene', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (476, 23, 'El Venado', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (477, 23, 'Encontrados', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (478, 23, 'Gibraltar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (479, 23, 'Isla de Toas', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (480, 23, 'La Concepción del Zulia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (481, 23, 'La Paz', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (482, 23, 'La Sierrita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (483, 23, 'Lagunillas del Zulia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (484, 23, 'Las Piedras de Perijá', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (485, 23, 'Los Cortijos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (486, 23, 'Machiques', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (487, 23, 'Maracaibo', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (488, 23, 'Mene Grande', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (489, 23, 'Palmarejo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (490, 23, 'Paraguaipoa', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (491, 23, 'Potrerito', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (492, 23, 'Pueblo Nuevo del Zulia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (493, 23, 'Puertos de Altagracia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (494, 23, 'Punta Gorda', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (495, 23, 'Sabaneta de Palma', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (496, 23, 'San Francisco', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (497, 23, 'San José de Perijá', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (498, 23, 'San Rafael del Moján', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (499, 23, 'San Timoteo', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (500, 23, 'Santa Bárbara Del Zulia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (501, 23, 'Santa Cruz de Mara', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (502, 23, 'Santa Cruz del Zulia', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (503, 23, 'Santa Rita', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (504, 23, 'Sinamaica', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (505, 23, 'Tamare', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (506, 23, 'Tía Juana', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (507, 23, 'Villa del Rosario', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (508, 21, 'La Guaira', 1, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (509, 21, 'Catia La Mar', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (510, 21, 'Macuto', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (511, 21, 'Naiguatá', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (512, 25, 'Archipiélago Los Monjes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (513, 25, 'Isla La Tortuga y Cayos adyacentes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (514, 25, 'Isla La Sola', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (515, 25, 'Islas Los Testigos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (516, 25, 'Islas Los Frailes', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (517, 25, 'Isla La Orchila', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (518, 25, 'Archipiélago Las Aves', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (519, 25, 'Isla de Aves', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (520, 25, 'Isla La Blanquilla', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (521, 25, 'Isla de Patos', 0, 1, NULL, NULL);
INSERT INTO `ciudad` VALUES (522, 25, 'Islas Los Hermanos', 0, 1, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `despacho`
-- 

CREATE TABLE `despacho` (
  `iddespacho` int(11) NOT NULL,
  `idproyecto` int(11) NOT NULL,
  `numeroplanilla` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `cedulachofer` int(11) NOT NULL,
  `nombrechofer` varchar(60) NOT NULL,
  `tipovehiculo` varchar(60) NOT NULL,
  `placavehiculo` varchar(60) NOT NULL,
  PRIMARY KEY  (`iddespacho`),
  KEY `idproyecto` (`idproyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `despacho`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `empresa`
-- 

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de la empresa',
  `razon_social` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `siglas` varchar(45) default NULL COMMENT 'Siglas del nombre de la empresa',
  `nit` varchar(15) NOT NULL COMMENT 'Número de identificación tributaria de la empresa',
  `dv` int(2) default NULL COMMENT 'Digito de verificación del NIT',
  `representante_legal` varchar(100) NOT NULL COMMENT 'Nombre del representante legal de la empresa',
  `nuip` bigint(20) NOT NULL COMMENT 'Número de identificación personal',
  `tipo_nuip_id` int(1) NOT NULL COMMENT 'Tipo de identificación',
  `pagina_web` varchar(45) default NULL,
  `logo` varchar(45) default NULL,
  `registrado_at` varchar(45) default NULL,
  `modificado_in` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_empresa_tipo_nuip_idx` (`tipo_nuip_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información básica de la empresa' AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `empresa`
-- 

INSERT INTO `empresa` VALUES (1, 'Frente de Constructores Francisco de Miranda', 'FCFM', '1091652165', 6, 'pedro perez', 1091652165, 1, NULL, '3618f4cfd36b7461bb1bad9ee189f340.jpg', '2013-01-01 00:00:01', '2016-11-15 12:35:50');

-- --------------------------------------------------------

-- 
-- Table structure for table `entrada`
-- 

CREATE TABLE `entrada` (
  `id` int(11) NOT NULL auto_increment,
  `numerocontrol` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `cedulachofer` int(11) NOT NULL,
  `nombrechofer` varchar(120) NOT NULL,
  `placavehiculo` varchar(18) NOT NULL,
  `tipovehiculo` varchar(60) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidadproducto` int(4) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idproducto` (`idproducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `entrada`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `estado`
-- 

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL auto_increment,
  `nombreEstado` varchar(250) character set utf8 NOT NULL,
  `estatus` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`idestado`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=26 ;

-- 
-- Dumping data for table `estado`
-- 

INSERT INTO `estado` VALUES (1, 'Amazonas', 1);
INSERT INTO `estado` VALUES (2, 'Anzoátegui', 1);
INSERT INTO `estado` VALUES (3, 'Apure', 1);
INSERT INTO `estado` VALUES (4, 'Aragua', 1);
INSERT INTO `estado` VALUES (5, 'Barinas', 1);
INSERT INTO `estado` VALUES (6, 'Bolívar', 1);
INSERT INTO `estado` VALUES (7, 'Carabobo', 1);
INSERT INTO `estado` VALUES (8, 'Cojedes', 1);
INSERT INTO `estado` VALUES (9, 'Delta Amacuro', 1);
INSERT INTO `estado` VALUES (10, 'Falcón', 1);
INSERT INTO `estado` VALUES (11, 'Guárico', 1);
INSERT INTO `estado` VALUES (12, 'Lara', 1);
INSERT INTO `estado` VALUES (13, 'Mérida', 1);
INSERT INTO `estado` VALUES (14, 'Miranda', 1);
INSERT INTO `estado` VALUES (15, 'Monagas', 1);
INSERT INTO `estado` VALUES (16, 'Nueva Esparta', 1);
INSERT INTO `estado` VALUES (17, 'Portuguesa', 1);
INSERT INTO `estado` VALUES (18, 'Sucre', 1);
INSERT INTO `estado` VALUES (19, 'Táchira', 1);
INSERT INTO `estado` VALUES (20, 'Trujillo', 1);
INSERT INTO `estado` VALUES (21, 'Vargas', 1);
INSERT INTO `estado` VALUES (22, 'Yaracuy', 1);
INSERT INTO `estado` VALUES (23, 'Zulia', 1);
INSERT INTO `estado` VALUES (24, 'Distrito Capital', 1);
INSERT INTO `estado` VALUES (25, 'Dependencias Federales', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `estado_usuario`
-- 

CREATE TABLE `estado_usuario` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador del estado del usuario',
  `usuario_id` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `estado_usuario` int(11) NOT NULL COMMENT 'Código del estado del usuario',
  `descripcion` varchar(100) NOT NULL COMMENT 'Motivo del cambio de estado',
  `fecha_estado_at` datetime default NULL COMMENT 'Fecha del cambio de estado',
  PRIMARY KEY  (`id`),
  KEY `fk_estado_usuario_usuario_idx` (`usuario_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los estados de los usuarios' AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `estado_usuario`
-- 

INSERT INTO `estado_usuario` VALUES (1, 1, 2, 'Bloqueado por ser un usuario sin privilegios', '2013-01-01 00:00:01');
INSERT INTO `estado_usuario` VALUES (2, 2, 1, 'Activo por ser el Super Usuario del sistema', '2013-01-01 00:00:01');
INSERT INTO `estado_usuario` VALUES (3, 3, 1, 'Activado por registro inicial', '2016-11-15 12:40:13');

-- --------------------------------------------------------

-- 
-- Table structure for table `grupo`
-- 

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(45) default NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` char(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `grupo`
-- 

INSERT INTO `grupo` VALUES (1, 'Bautismo', 'En construccion.', '1');
INSERT INTO `grupo` VALUES (2, 'Comun', 'En construccion.jjjjjjjjjjjjjjjjjjjjjjjj', '1');
INSERT INTO `grupo` VALUES (3, 'Confirmacion', 'En construccion. En construccion  En construccion  En construccion  En construccion', '1');
INSERT INTO `grupo` VALUES (4, 'Matrimonio', 'En construccion. En construccion  En construccion  En construccion  En construccion', '1');
INSERT INTO `grupo` VALUES (5, 'Orden sacerdotal', 'En construccion  En construccion En construccion En construccion', '1');
INSERT INTO `grupo` VALUES (6, 'futbol', 'jajajajaajjajajajjajajajjajajajajajajajajajajajaja', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `menu`
-- 

CREATE TABLE `menu` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador del menú',
  `menu_id` int(11) default NULL COMMENT 'Identificador del menú padre',
  `recurso_id` int(11) default NULL COMMENT 'Identificador del recurso',
  `menu` varchar(45) NOT NULL COMMENT 'Texto a mostrar del menú',
  `url` varchar(60) default NULL COMMENT 'Url del menú',
  `posicion` int(11) default '0' COMMENT 'Posisión dentro de otros items',
  `icono` varchar(45) default NULL COMMENT 'Icono a mostrar ',
  `activo` int(1) NOT NULL default '1' COMMENT 'Menú activo o inactivo',
  `visibilidad` int(1) NOT NULL default '1' COMMENT 'Indica si el menú se muestra en el backend o en el frontend',
  PRIMARY KEY  (`id`),
  KEY `fk_menu_recurso_idx` (`recurso_id`),
  KEY `fk_menu_menu_idx` (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los menú para los usuarios' AUTO_INCREMENT=35 ;

-- 
-- Dumping data for table `menu`
-- 

INSERT INTO `menu` VALUES (1, NULL, NULL, 'Inicio', '#', 10, 'icon-home', 1, 1);
INSERT INTO `menu` VALUES (2, 1, 2, 'Inicio', 'inicio/', 11, 'icon-home', 1, 1);
INSERT INTO `menu` VALUES (3, NULL, NULL, 'Sistema', '#', 900, 'icon-cogs', 1, 1);
INSERT INTO `menu` VALUES (4, 3, 4, 'Accesos', 'sistema/acceso/listar/', 901, 'icon-exchange', 1, 1);
INSERT INTO `menu` VALUES (5, 3, 5, 'AuditorÃ­as', 'sistema/auditoria/', 902, 'icon-eye-open', 1, 1);
INSERT INTO `menu` VALUES (6, 3, 6, 'Backups', 'sistema/backup/listar/', 903, 'icon-hdd', 1, 1);
INSERT INTO `menu` VALUES (7, 3, 7, 'Mantenimiento', 'sistema/mantenimiento/', 904, 'icon-bolt', 1, 1);
INSERT INTO `menu` VALUES (8, 3, 8, 'MenÃºs', 'sistema/menu/listar/', 905, 'icon-list', 1, 1);
INSERT INTO `menu` VALUES (9, 3, 9, 'Perfiles', 'sistema/perfil/listar/', 906, 'icon-group', 1, 1);
INSERT INTO `menu` VALUES (10, 3, 10, 'Permisos', 'sistema/privilegio/listar/', 907, 'icon-magic', 1, 1);
INSERT INTO `menu` VALUES (11, 3, 11, 'Recursos', 'sistema/recurso/listar/', 908, 'icon-lock', 1, 1);
INSERT INTO `menu` VALUES (12, 3, 12, 'Usuarios', 'sistema/usuario/listar/', 909, 'icon-user', 1, 1);
INSERT INTO `menu` VALUES (13, 3, 13, 'Visor de sucesos', 'sistema/sucesos/', 910, 'icon-filter', 1, 1);
INSERT INTO `menu` VALUES (14, 3, 14, 'Sistema', 'sistema/configuracion/', 911, 'icon-wrench', 1, 1);
INSERT INTO `menu` VALUES (15, NULL, NULL, 'Configuraciones', '#', 800, 'icon-wrench', 1, 1);
INSERT INTO `menu` VALUES (16, 15, 15, 'Empresa', 'config/empresa/', 801, 'icon-briefcase', 1, 1);
INSERT INTO `menu` VALUES (17, 15, 16, 'Sucursales', 'config/sucursal/listar/', 802, 'icon-sitemap', 1, 1);
INSERT INTO `menu` VALUES (19, NULL, NULL, 'Inventario', '#', 200, 'icon-wrench', 1, 1);
INSERT INTO `menu` VALUES (21, 15, 20, 'Unidad', 'config/unidad/', 803, 'icon-user', 1, 1);
INSERT INTO `menu` VALUES (22, 15, 18, 'Grupo', 'config/grupo/', 804, 'icon-eye-open', 1, 1);
INSERT INTO `menu` VALUES (23, 15, 21, 'Sub-grupo', 'config/subgrupo/', 805, 'icon-eye-open', 1, 1);
INSERT INTO `menu` VALUES (24, 19, 22, 'Proveedor', 'inventario/proveedor/', 201, 'icon-eye-open', 1, 1);
INSERT INTO `menu` VALUES (25, NULL, NULL, 'Proyectos', '#', 300, 'icon-user', 1, 1);
INSERT INTO `menu` VALUES (26, 25, 24, 'Responsable de proyecto', 'proyecto/responsable/', 301, 'icon-eye-open', 1, 1);
INSERT INTO `menu` VALUES (33, 19, 19, 'Producto', 'inventario/producto', 1, 'icon-sitemap', 1, 1);
INSERT INTO `menu` VALUES (31, 25, 23, 'Proyectos', 'proyecto/proyecto/', 0, 'icon-eye-open', 1, 1);
INSERT INTO `menu` VALUES (32, 25, 23, 'Avance de proyecto', 'proyecto/avance/', 303, 'icon-list', 1, 1);
INSERT INTO `menu` VALUES (34, 19, 19, 'Entrada de productos', 'inventario/entrada', 303, 'icon-sitemap', 1, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `municipio`
-- 

CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL auto_increment,
  `idestado` int(11) NOT NULL,
  `nombremunicipio` varchar(100) character set utf8 NOT NULL,
  `estatus` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`idmunicipio`),
  KEY `id_estado` (`idestado`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=463 ;

-- 
-- Dumping data for table `municipio`
-- 

INSERT INTO `municipio` VALUES (1, 1, 'Alto Orinoco', 1);
INSERT INTO `municipio` VALUES (2, 1, 'Atabapo', 1);
INSERT INTO `municipio` VALUES (3, 1, 'Atures', 1);
INSERT INTO `municipio` VALUES (4, 1, 'Autana', 1);
INSERT INTO `municipio` VALUES (5, 1, 'Manapiare', 1);
INSERT INTO `municipio` VALUES (6, 1, 'Maroa', 1);
INSERT INTO `municipio` VALUES (7, 1, 'Río Negro', 1);
INSERT INTO `municipio` VALUES (8, 2, 'Anaco', 1);
INSERT INTO `municipio` VALUES (9, 2, 'Aragua', 1);
INSERT INTO `municipio` VALUES (10, 2, 'Manuel Ezequiel Bruzual', 1);
INSERT INTO `municipio` VALUES (11, 2, 'Diego Bautista Urbaneja', 1);
INSERT INTO `municipio` VALUES (12, 2, 'Fernando Peñalver', 1);
INSERT INTO `municipio` VALUES (13, 2, 'Francisco Del Carmen Carvajal', 1);
INSERT INTO `municipio` VALUES (14, 2, 'General Sir Arthur McGregor', 1);
INSERT INTO `municipio` VALUES (15, 2, 'Guanta', 1);
INSERT INTO `municipio` VALUES (16, 2, 'Independencia', 1);
INSERT INTO `municipio` VALUES (17, 2, 'José Gregorio Monagas', 1);
INSERT INTO `municipio` VALUES (18, 2, 'Juan Antonio Sotillo', 1);
INSERT INTO `municipio` VALUES (19, 2, 'Juan Manuel Cajigal', 1);
INSERT INTO `municipio` VALUES (20, 2, 'Libertad', 1);
INSERT INTO `municipio` VALUES (21, 2, 'Francisco de Miranda', 1);
INSERT INTO `municipio` VALUES (22, 2, 'Pedro María Freites', 1);
INSERT INTO `municipio` VALUES (23, 2, 'Píritu', 1);
INSERT INTO `municipio` VALUES (24, 2, 'San José de Guanipa', 1);
INSERT INTO `municipio` VALUES (25, 2, 'San Juan de Capistrano', 1);
INSERT INTO `municipio` VALUES (26, 2, 'Santa Ana', 1);
INSERT INTO `municipio` VALUES (27, 2, 'Simón Bolívar', 1);
INSERT INTO `municipio` VALUES (28, 2, 'Simón Rodríguez', 1);
INSERT INTO `municipio` VALUES (29, 3, 'Achaguas', 1);
INSERT INTO `municipio` VALUES (30, 3, 'Biruaca', 1);
INSERT INTO `municipio` VALUES (31, 3, 'Muñóz', 1);
INSERT INTO `municipio` VALUES (32, 3, 'Páez', 1);
INSERT INTO `municipio` VALUES (33, 3, 'Pedro Camejo', 1);
INSERT INTO `municipio` VALUES (34, 3, 'Rómulo Gallegos', 1);
INSERT INTO `municipio` VALUES (35, 3, 'San Fernando', 1);
INSERT INTO `municipio` VALUES (36, 4, 'Atanasio Girardot', 1);
INSERT INTO `municipio` VALUES (37, 4, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (38, 4, 'Camatagua', 1);
INSERT INTO `municipio` VALUES (39, 4, 'Francisco Linares Alcántara', 1);
INSERT INTO `municipio` VALUES (40, 4, 'José Ángel Lamas', 1);
INSERT INTO `municipio` VALUES (41, 4, 'José Félix Ribas', 1);
INSERT INTO `municipio` VALUES (42, 4, 'José Rafael Revenga', 1);
INSERT INTO `municipio` VALUES (43, 4, 'Libertador', 1);
INSERT INTO `municipio` VALUES (44, 4, 'Mario Briceño Iragorry', 1);
INSERT INTO `municipio` VALUES (45, 4, 'Ocumare de la Costa de Oro', 1);
INSERT INTO `municipio` VALUES (46, 4, 'San Casimiro', 1);
INSERT INTO `municipio` VALUES (47, 4, 'San Sebastián', 1);
INSERT INTO `municipio` VALUES (48, 4, 'Santiago Mariño', 1);
INSERT INTO `municipio` VALUES (49, 4, 'Santos Michelena', 1);
INSERT INTO `municipio` VALUES (50, 4, 'Sucre', 1);
INSERT INTO `municipio` VALUES (51, 4, 'Tovar', 1);
INSERT INTO `municipio` VALUES (52, 4, 'Urdaneta', 1);
INSERT INTO `municipio` VALUES (53, 4, 'Zamora', 1);
INSERT INTO `municipio` VALUES (54, 5, 'Alberto Arvelo Torrealba', 1);
INSERT INTO `municipio` VALUES (55, 5, 'Andrés Eloy Blanco', 1);
INSERT INTO `municipio` VALUES (56, 5, 'Antonio José de Sucre', 1);
INSERT INTO `municipio` VALUES (57, 5, 'Arismendi', 1);
INSERT INTO `municipio` VALUES (58, 5, 'Barinas', 1);
INSERT INTO `municipio` VALUES (59, 5, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (60, 5, 'Cruz Paredes', 1);
INSERT INTO `municipio` VALUES (61, 5, 'Ezequiel Zamora', 1);
INSERT INTO `municipio` VALUES (62, 5, 'Obispos', 1);
INSERT INTO `municipio` VALUES (63, 5, 'Pedraza', 1);
INSERT INTO `municipio` VALUES (64, 5, 'Rojas', 1);
INSERT INTO `municipio` VALUES (65, 5, 'Sosa', 1);
INSERT INTO `municipio` VALUES (66, 6, 'Caroní', 1);
INSERT INTO `municipio` VALUES (67, 6, 'Cedeño', 1);
INSERT INTO `municipio` VALUES (68, 6, 'El Callao', 1);
INSERT INTO `municipio` VALUES (69, 6, 'Gran Sabana', 1);
INSERT INTO `municipio` VALUES (70, 6, 'Heres', 1);
INSERT INTO `municipio` VALUES (71, 6, 'Piar', 1);
INSERT INTO `municipio` VALUES (72, 6, 'Angostura (Raúl Leoni)', 1);
INSERT INTO `municipio` VALUES (73, 6, 'Roscio', 1);
INSERT INTO `municipio` VALUES (74, 6, 'Sifontes', 1);
INSERT INTO `municipio` VALUES (75, 6, 'Sucre', 1);
INSERT INTO `municipio` VALUES (76, 6, 'Padre Pedro Chien', 1);
INSERT INTO `municipio` VALUES (77, 7, 'Bejuma', 1);
INSERT INTO `municipio` VALUES (78, 7, 'Carlos Arvelo', 1);
INSERT INTO `municipio` VALUES (79, 7, 'Diego Ibarra', 1);
INSERT INTO `municipio` VALUES (80, 7, 'Guacara', 1);
INSERT INTO `municipio` VALUES (81, 7, 'Juan José Mora', 1);
INSERT INTO `municipio` VALUES (82, 7, 'Libertador', 1);
INSERT INTO `municipio` VALUES (83, 7, 'Los Guayos', 1);
INSERT INTO `municipio` VALUES (84, 7, 'Miranda', 1);
INSERT INTO `municipio` VALUES (85, 7, 'Montalbán', 1);
INSERT INTO `municipio` VALUES (86, 7, 'Naguanagua', 1);
INSERT INTO `municipio` VALUES (87, 7, 'Puerto Cabello', 1);
INSERT INTO `municipio` VALUES (88, 7, 'San Diego', 1);
INSERT INTO `municipio` VALUES (89, 7, 'San Joaquín', 1);
INSERT INTO `municipio` VALUES (90, 7, 'Valencia', 1);
INSERT INTO `municipio` VALUES (91, 8, 'Anzoátegui', 1);
INSERT INTO `municipio` VALUES (92, 8, 'Tinaquillo', 1);
INSERT INTO `municipio` VALUES (93, 8, 'Girardot', 1);
INSERT INTO `municipio` VALUES (94, 8, 'Lima Blanco', 1);
INSERT INTO `municipio` VALUES (95, 8, 'Pao de San Juan Bautista', 1);
INSERT INTO `municipio` VALUES (96, 8, 'Ricaurte', 1);
INSERT INTO `municipio` VALUES (97, 8, 'Rómulo Gallegos', 1);
INSERT INTO `municipio` VALUES (98, 8, 'San Carlos', 1);
INSERT INTO `municipio` VALUES (99, 8, 'Tinaco', 1);
INSERT INTO `municipio` VALUES (100, 9, 'Antonio Díaz', 1);
INSERT INTO `municipio` VALUES (101, 9, 'Casacoima', 1);
INSERT INTO `municipio` VALUES (102, 9, 'Pedernales', 1);
INSERT INTO `municipio` VALUES (103, 9, 'Tucupita', 1);
INSERT INTO `municipio` VALUES (104, 10, 'Acosta', 1);
INSERT INTO `municipio` VALUES (105, 10, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (106, 10, 'Buchivacoa', 1);
INSERT INTO `municipio` VALUES (107, 10, 'Cacique Manaure', 1);
INSERT INTO `municipio` VALUES (108, 10, 'Carirubana', 1);
INSERT INTO `municipio` VALUES (109, 10, 'Colina', 1);
INSERT INTO `municipio` VALUES (110, 10, 'Dabajuro', 1);
INSERT INTO `municipio` VALUES (111, 10, 'Democracia', 1);
INSERT INTO `municipio` VALUES (112, 10, 'Falcón', 1);
INSERT INTO `municipio` VALUES (113, 10, 'Federación', 1);
INSERT INTO `municipio` VALUES (114, 10, 'Jacura', 1);
INSERT INTO `municipio` VALUES (115, 10, 'José Laurencio Silva', 1);
INSERT INTO `municipio` VALUES (116, 10, 'Los Taques', 1);
INSERT INTO `municipio` VALUES (117, 10, 'Mauroa', 1);
INSERT INTO `municipio` VALUES (118, 10, 'Miranda', 1);
INSERT INTO `municipio` VALUES (119, 10, 'Monseñor Iturriza', 1);
INSERT INTO `municipio` VALUES (120, 10, 'Palmasola', 1);
INSERT INTO `municipio` VALUES (121, 10, 'Petit', 1);
INSERT INTO `municipio` VALUES (122, 10, 'Píritu', 1);
INSERT INTO `municipio` VALUES (123, 10, 'San Francisco', 1);
INSERT INTO `municipio` VALUES (124, 10, 'Sucre', 1);
INSERT INTO `municipio` VALUES (125, 10, 'Tocópero', 1);
INSERT INTO `municipio` VALUES (126, 10, 'Unión', 1);
INSERT INTO `municipio` VALUES (127, 10, 'Urumaco', 1);
INSERT INTO `municipio` VALUES (128, 10, 'Zamora', 1);
INSERT INTO `municipio` VALUES (129, 11, 'Camaguán', 1);
INSERT INTO `municipio` VALUES (130, 11, 'Chaguaramas', 1);
INSERT INTO `municipio` VALUES (131, 11, 'El Socorro', 1);
INSERT INTO `municipio` VALUES (132, 11, 'José Félix Ribas', 1);
INSERT INTO `municipio` VALUES (133, 11, 'José Tadeo Monagas', 1);
INSERT INTO `municipio` VALUES (134, 11, 'Juan Germán Roscio', 1);
INSERT INTO `municipio` VALUES (135, 11, 'Julián Mellado', 1);
INSERT INTO `municipio` VALUES (136, 11, 'Las Mercedes', 1);
INSERT INTO `municipio` VALUES (137, 11, 'Leonardo Infante', 1);
INSERT INTO `municipio` VALUES (138, 11, 'Pedro Zaraza', 1);
INSERT INTO `municipio` VALUES (139, 11, 'Ortíz', 1);
INSERT INTO `municipio` VALUES (140, 11, 'San Gerónimo de Guayabal', 1);
INSERT INTO `municipio` VALUES (141, 11, 'San José de Guaribe', 1);
INSERT INTO `municipio` VALUES (142, 11, 'Santa María de Ipire', 1);
INSERT INTO `municipio` VALUES (143, 11, 'Sebastián Francisco de Miranda', 1);
INSERT INTO `municipio` VALUES (144, 12, 'Andrés Eloy Blanco', 1);
INSERT INTO `municipio` VALUES (145, 12, 'Crespo', 1);
INSERT INTO `municipio` VALUES (146, 12, 'Iribarren', 1);
INSERT INTO `municipio` VALUES (147, 12, 'Jiménez', 1);
INSERT INTO `municipio` VALUES (148, 12, 'Morán', 1);
INSERT INTO `municipio` VALUES (149, 12, 'Palavecino', 1);
INSERT INTO `municipio` VALUES (150, 12, 'Simón Planas', 1);
INSERT INTO `municipio` VALUES (151, 12, 'Torres', 1);
INSERT INTO `municipio` VALUES (152, 12, 'Urdaneta', 1);
INSERT INTO `municipio` VALUES (179, 13, 'Alberto Adriani', 1);
INSERT INTO `municipio` VALUES (180, 13, 'Andrés Bello', 1);
INSERT INTO `municipio` VALUES (181, 13, 'Antonio Pinto Salinas', 1);
INSERT INTO `municipio` VALUES (182, 13, 'Aricagua', 1);
INSERT INTO `municipio` VALUES (183, 13, 'Arzobispo Chacón', 1);
INSERT INTO `municipio` VALUES (184, 13, 'Campo Elías', 1);
INSERT INTO `municipio` VALUES (185, 13, 'Caracciolo Parra Olmedo', 1);
INSERT INTO `municipio` VALUES (186, 13, 'Cardenal Quintero', 1);
INSERT INTO `municipio` VALUES (187, 13, 'Guaraque', 1);
INSERT INTO `municipio` VALUES (188, 13, 'Julio César Salas', 1);
INSERT INTO `municipio` VALUES (189, 13, 'Justo Briceño', 1);
INSERT INTO `municipio` VALUES (190, 13, 'Libertador', 1);
INSERT INTO `municipio` VALUES (191, 13, 'Miranda', 1);
INSERT INTO `municipio` VALUES (192, 13, 'Obispo Ramos de Lora', 1);
INSERT INTO `municipio` VALUES (193, 13, 'Padre Noguera', 1);
INSERT INTO `municipio` VALUES (194, 13, 'Pueblo Llano', 1);
INSERT INTO `municipio` VALUES (195, 13, 'Rangel', 1);
INSERT INTO `municipio` VALUES (196, 13, 'Rivas Dávila', 1);
INSERT INTO `municipio` VALUES (197, 13, 'Santos Marquina', 1);
INSERT INTO `municipio` VALUES (198, 13, 'Sucre', 1);
INSERT INTO `municipio` VALUES (199, 13, 'Tovar', 1);
INSERT INTO `municipio` VALUES (200, 13, 'Tulio Febres Cordero', 1);
INSERT INTO `municipio` VALUES (201, 13, 'Zea', 1);
INSERT INTO `municipio` VALUES (223, 14, 'Acevedo', 1);
INSERT INTO `municipio` VALUES (224, 14, 'Andrés Bello', 1);
INSERT INTO `municipio` VALUES (225, 14, 'Baruta', 1);
INSERT INTO `municipio` VALUES (226, 14, 'Brión', 1);
INSERT INTO `municipio` VALUES (227, 14, 'Buroz', 1);
INSERT INTO `municipio` VALUES (228, 14, 'Carrizal', 1);
INSERT INTO `municipio` VALUES (229, 14, 'Chacao', 1);
INSERT INTO `municipio` VALUES (230, 14, 'Cristóbal Rojas', 1);
INSERT INTO `municipio` VALUES (231, 14, 'El Hatillo', 1);
INSERT INTO `municipio` VALUES (232, 14, 'Guaicaipuro', 1);
INSERT INTO `municipio` VALUES (233, 14, 'Independencia', 1);
INSERT INTO `municipio` VALUES (234, 14, 'Lander', 1);
INSERT INTO `municipio` VALUES (235, 14, 'Los Salias', 1);
INSERT INTO `municipio` VALUES (236, 14, 'Páez', 1);
INSERT INTO `municipio` VALUES (237, 14, 'Paz Castillo', 1);
INSERT INTO `municipio` VALUES (238, 14, 'Pedro Gual', 1);
INSERT INTO `municipio` VALUES (239, 14, 'Plaza', 1);
INSERT INTO `municipio` VALUES (240, 14, 'Simón Bolívar', 1);
INSERT INTO `municipio` VALUES (241, 14, 'Sucre', 1);
INSERT INTO `municipio` VALUES (242, 14, 'Urdaneta', 1);
INSERT INTO `municipio` VALUES (243, 14, 'Zamora', 1);
INSERT INTO `municipio` VALUES (258, 15, 'Acosta', 1);
INSERT INTO `municipio` VALUES (259, 15, 'Aguasay', 1);
INSERT INTO `municipio` VALUES (260, 15, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (261, 15, 'Caripe', 1);
INSERT INTO `municipio` VALUES (262, 15, 'Cedeño', 1);
INSERT INTO `municipio` VALUES (263, 15, 'Ezequiel Zamora', 1);
INSERT INTO `municipio` VALUES (264, 15, 'Libertador', 1);
INSERT INTO `municipio` VALUES (265, 15, 'Maturín', 1);
INSERT INTO `municipio` VALUES (266, 15, 'Piar', 1);
INSERT INTO `municipio` VALUES (267, 15, 'Punceres', 1);
INSERT INTO `municipio` VALUES (268, 15, 'Santa Bárbara', 1);
INSERT INTO `municipio` VALUES (269, 15, 'Sotillo', 1);
INSERT INTO `municipio` VALUES (270, 15, 'Uracoa', 1);
INSERT INTO `municipio` VALUES (271, 16, 'Antolín del Campo', 1);
INSERT INTO `municipio` VALUES (272, 16, 'Arismendi', 1);
INSERT INTO `municipio` VALUES (273, 16, 'García', 1);
INSERT INTO `municipio` VALUES (274, 16, 'Gómez', 1);
INSERT INTO `municipio` VALUES (275, 16, 'Maneiro', 1);
INSERT INTO `municipio` VALUES (276, 16, 'Marcano', 1);
INSERT INTO `municipio` VALUES (277, 16, 'Mariño', 1);
INSERT INTO `municipio` VALUES (278, 16, 'Península de Macanao', 1);
INSERT INTO `municipio` VALUES (279, 16, 'Tubores', 1);
INSERT INTO `municipio` VALUES (280, 16, 'Villalba', 1);
INSERT INTO `municipio` VALUES (281, 16, 'Díaz', 1);
INSERT INTO `municipio` VALUES (282, 17, 'Agua Blanca', 1);
INSERT INTO `municipio` VALUES (283, 17, 'Araure', 1);
INSERT INTO `municipio` VALUES (284, 17, 'Esteller', 1);
INSERT INTO `municipio` VALUES (285, 17, 'Guanare', 1);
INSERT INTO `municipio` VALUES (286, 17, 'Guanarito', 1);
INSERT INTO `municipio` VALUES (287, 17, 'Monseñor José Vicente de Unda', 1);
INSERT INTO `municipio` VALUES (288, 17, 'Ospino', 1);
INSERT INTO `municipio` VALUES (289, 17, 'Páez', 1);
INSERT INTO `municipio` VALUES (290, 17, 'Papelón', 1);
INSERT INTO `municipio` VALUES (291, 17, 'San Genaro de Boconoíto', 1);
INSERT INTO `municipio` VALUES (292, 17, 'San Rafael de Onoto', 1);
INSERT INTO `municipio` VALUES (293, 17, 'Santa Rosalía', 1);
INSERT INTO `municipio` VALUES (294, 17, 'Sucre', 1);
INSERT INTO `municipio` VALUES (295, 17, 'Turén', 1);
INSERT INTO `municipio` VALUES (296, 18, 'Andrés Eloy Blanco', 1);
INSERT INTO `municipio` VALUES (297, 18, 'Andrés Mata', 1);
INSERT INTO `municipio` VALUES (298, 18, 'Arismendi', 1);
INSERT INTO `municipio` VALUES (299, 18, 'Benítez', 1);
INSERT INTO `municipio` VALUES (300, 18, 'Bermúdez', 1);
INSERT INTO `municipio` VALUES (301, 18, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (302, 18, 'Cajigal', 1);
INSERT INTO `municipio` VALUES (303, 18, 'Cruz Salmerón Acosta', 1);
INSERT INTO `municipio` VALUES (304, 18, 'Libertador', 1);
INSERT INTO `municipio` VALUES (305, 18, 'Mariño', 1);
INSERT INTO `municipio` VALUES (306, 18, 'Mejía', 1);
INSERT INTO `municipio` VALUES (307, 18, 'Montes', 1);
INSERT INTO `municipio` VALUES (308, 18, 'Ribero', 1);
INSERT INTO `municipio` VALUES (309, 18, 'Sucre', 1);
INSERT INTO `municipio` VALUES (310, 18, 'Valdéz', 1);
INSERT INTO `municipio` VALUES (341, 19, 'Andrés Bello', 1);
INSERT INTO `municipio` VALUES (342, 19, 'Antonio Rómulo Costa', 1);
INSERT INTO `municipio` VALUES (343, 19, 'Ayacucho', 1);
INSERT INTO `municipio` VALUES (344, 19, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (345, 19, 'Cárdenas', 1);
INSERT INTO `municipio` VALUES (346, 19, 'Córdoba', 1);
INSERT INTO `municipio` VALUES (347, 19, 'Fernández Feo', 1);
INSERT INTO `municipio` VALUES (348, 19, 'Francisco de Miranda', 1);
INSERT INTO `municipio` VALUES (349, 19, 'García de Hevia', 1);
INSERT INTO `municipio` VALUES (350, 19, 'Guásimos', 1);
INSERT INTO `municipio` VALUES (351, 19, 'Independencia', 1);
INSERT INTO `municipio` VALUES (352, 19, 'Jáuregui', 1);
INSERT INTO `municipio` VALUES (353, 19, 'José María Vargas', 1);
INSERT INTO `municipio` VALUES (354, 19, 'Junín', 1);
INSERT INTO `municipio` VALUES (355, 19, 'Libertad', 1);
INSERT INTO `municipio` VALUES (356, 19, 'Libertador', 1);
INSERT INTO `municipio` VALUES (357, 19, 'Lobatera', 1);
INSERT INTO `municipio` VALUES (358, 19, 'Michelena', 1);
INSERT INTO `municipio` VALUES (359, 19, 'Panamericano', 1);
INSERT INTO `municipio` VALUES (360, 19, 'Pedro María Ureña', 1);
INSERT INTO `municipio` VALUES (361, 19, 'Rafael Urdaneta', 1);
INSERT INTO `municipio` VALUES (362, 19, 'Samuel Darío Maldonado', 1);
INSERT INTO `municipio` VALUES (363, 19, 'San Cristóbal', 1);
INSERT INTO `municipio` VALUES (364, 19, 'Seboruco', 1);
INSERT INTO `municipio` VALUES (365, 19, 'Simón Rodríguez', 1);
INSERT INTO `municipio` VALUES (366, 19, 'Sucre', 1);
INSERT INTO `municipio` VALUES (367, 19, 'Torbes', 1);
INSERT INTO `municipio` VALUES (368, 19, 'Uribante', 1);
INSERT INTO `municipio` VALUES (369, 19, 'San Judas Tadeo', 1);
INSERT INTO `municipio` VALUES (370, 20, 'Andrés Bello', 1);
INSERT INTO `municipio` VALUES (371, 20, 'Boconó', 1);
INSERT INTO `municipio` VALUES (372, 20, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (373, 20, 'Candelaria', 1);
INSERT INTO `municipio` VALUES (374, 20, 'Carache', 1);
INSERT INTO `municipio` VALUES (375, 20, 'Escuque', 1);
INSERT INTO `municipio` VALUES (376, 20, 'José Felipe Márquez Cañizalez', 1);
INSERT INTO `municipio` VALUES (377, 20, 'Juan Vicente Campos Elías', 1);
INSERT INTO `municipio` VALUES (378, 20, 'La Ceiba', 1);
INSERT INTO `municipio` VALUES (379, 20, 'Miranda', 1);
INSERT INTO `municipio` VALUES (380, 20, 'Monte Carmelo', 1);
INSERT INTO `municipio` VALUES (381, 20, 'Motatán', 1);
INSERT INTO `municipio` VALUES (382, 20, 'Pampán', 1);
INSERT INTO `municipio` VALUES (383, 20, 'Pampanito', 1);
INSERT INTO `municipio` VALUES (384, 20, 'Rafael Rangel', 1);
INSERT INTO `municipio` VALUES (385, 20, 'San Rafael de Carvajal', 1);
INSERT INTO `municipio` VALUES (386, 20, 'Sucre', 1);
INSERT INTO `municipio` VALUES (387, 20, 'Trujillo', 1);
INSERT INTO `municipio` VALUES (388, 20, 'Urdaneta', 1);
INSERT INTO `municipio` VALUES (389, 20, 'Valera', 1);
INSERT INTO `municipio` VALUES (390, 21, 'Vargas', 1);
INSERT INTO `municipio` VALUES (391, 22, 'Arístides Bastidas', 1);
INSERT INTO `municipio` VALUES (392, 22, 'Bolívar', 1);
INSERT INTO `municipio` VALUES (407, 22, 'Bruzual', 1);
INSERT INTO `municipio` VALUES (408, 22, 'Cocorote', 1);
INSERT INTO `municipio` VALUES (409, 22, 'Independencia', 1);
INSERT INTO `municipio` VALUES (410, 22, 'José Antonio Páez', 1);
INSERT INTO `municipio` VALUES (411, 22, 'La Trinidad', 1);
INSERT INTO `municipio` VALUES (412, 22, 'Manuel Monge', 1);
INSERT INTO `municipio` VALUES (413, 22, 'Nirgua', 1);
INSERT INTO `municipio` VALUES (414, 22, 'Peña', 1);
INSERT INTO `municipio` VALUES (415, 22, 'San Felipe', 1);
INSERT INTO `municipio` VALUES (416, 22, 'Sucre', 1);
INSERT INTO `municipio` VALUES (417, 22, 'Urachiche', 1);
INSERT INTO `municipio` VALUES (418, 22, 'José Joaquín Veroes', 1);
INSERT INTO `municipio` VALUES (441, 23, 'Almirante Padilla', 1);
INSERT INTO `municipio` VALUES (442, 23, 'Baralt', 1);
INSERT INTO `municipio` VALUES (443, 23, 'Cabimas', 1);
INSERT INTO `municipio` VALUES (444, 23, 'Catatumbo', 1);
INSERT INTO `municipio` VALUES (445, 23, 'Colón', 1);
INSERT INTO `municipio` VALUES (446, 23, 'Francisco Javier Pulgar', 1);
INSERT INTO `municipio` VALUES (447, 23, 'Páez', 1);
INSERT INTO `municipio` VALUES (448, 23, 'Jesús Enrique Losada', 1);
INSERT INTO `municipio` VALUES (449, 23, 'Jesús María Semprún', 1);
INSERT INTO `municipio` VALUES (450, 23, 'La Cañada de Urdaneta', 1);
INSERT INTO `municipio` VALUES (451, 23, 'Lagunillas', 1);
INSERT INTO `municipio` VALUES (452, 23, 'Machiques de Perijá', 1);
INSERT INTO `municipio` VALUES (453, 23, 'Mara', 1);
INSERT INTO `municipio` VALUES (454, 23, 'Maracaibo', 1);
INSERT INTO `municipio` VALUES (455, 23, 'Miranda', 1);
INSERT INTO `municipio` VALUES (456, 23, 'Rosario de Perijá', 1);
INSERT INTO `municipio` VALUES (457, 23, 'San Francisco', 1);
INSERT INTO `municipio` VALUES (458, 23, 'Santa Rita', 1);
INSERT INTO `municipio` VALUES (459, 23, 'Simón Bolívar', 1);
INSERT INTO `municipio` VALUES (460, 23, 'Sucre', 1);
INSERT INTO `municipio` VALUES (461, 23, 'Valmore Rodríguez', 1);
INSERT INTO `municipio` VALUES (462, 24, 'Libertador', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `perfil`
-- 

CREATE TABLE `perfil` (
  `id` int(2) NOT NULL auto_increment COMMENT 'Identificador del perfil',
  `perfil` varchar(45) NOT NULL COMMENT 'Nombre del perfil',
  `estado` int(1) NOT NULL default '1' COMMENT 'Indica si el perfil esta activo o inactivo',
  `plantilla` varchar(45) default 'default' COMMENT 'Plantilla para usar en el sitema',
  `registrado_at` datetime default NULL COMMENT 'Fecha de registro del perfil',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los grupos de los usuarios' AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `perfil`
-- 

INSERT INTO `perfil` VALUES (1, 'Super Usuario', 1, 'default', '2013-01-01 00:00:01');
INSERT INTO `perfil` VALUES (2, 'coordinador', 1, 'default', '2016-11-15 12:38:48');

-- --------------------------------------------------------

-- 
-- Table structure for table `persona`
-- 

CREATE TABLE `persona` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(100) default NULL,
  `nuip` bigint(20) NOT NULL COMMENT 'Número de identificación personal',
  `tipo_nuip_id` int(11) NOT NULL COMMENT 'Tipo de identificación',
  `telefono` varchar(45) default NULL,
  `fotografia` varchar(45) default 'default.png' COMMENT 'Fotografía',
  `registrado_at` datetime default NULL,
  `modificado_in` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_persona_tipo_nuip_idx` (`tipo_nuip_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las personas que interactúan con el siste' AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `persona`
-- 

INSERT INTO `persona` VALUES (1, 'Error', 'Error', 1010101010, 1, NULL, 'default.png', '2013-01-01 00:00:01', NULL);
INSERT INTO `persona` VALUES (2, 'Iv', 'Mel', 1091652165, 1, NULL, 'default.png', '2013-01-01 00:00:01', NULL);
INSERT INTO `persona` VALUES (3, 'lewis', 'leon', 24145391, 1, NULL, 'default.png', '2016-11-15 12:40:13', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `producto`
-- 

CREATE TABLE `producto` (
  `id` int(11) NOT NULL auto_increment,
  `idproducto` int(11) NOT NULL,
  `nombreproducto` varchar(120) NOT NULL,
  `grupo` int(11) NOT NULL,
  `subgrupo` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `producto`
-- 

INSERT INTO `producto` VALUES (1, 1, 'cemento', 1, 2);
INSERT INTO `producto` VALUES (2, 43, 'otro cemento', 3, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `proveedor`
-- 

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL auto_increment,
  `rif` varchar(20) character set utf8 NOT NULL,
  `nombre` varchar(100) character set utf8 NOT NULL,
  `razon` varchar(200) character set utf8 NOT NULL,
  `telefono` varchar(45) character set utf8 default NULL,
  `email` varchar(50) character set utf8 default NULL,
  `direccion` varchar(500) character set utf8 default NULL,
  `observacion` varchar(500) character set utf8 default NULL,
  `estado` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `proveedor`
-- 

INSERT INTO `proveedor` VALUES (1, 'v-9844690', 'La casa C.A', 'come dos', '04122627363', 'barbarita4129@gmail.com', 'bellas artes', 'hola vale', 1);
INSERT INTO `proveedor` VALUES (2, 'v-24507491', 'LC C.A', 'empresa de kelvis', '04125187133', 'kelvismartinez94@ospino.com', 'ospino', 'todo ospinero, todo marico', 1);
INSERT INTO `proveedor` VALUES (3, 'V-5954780', 'La casa de lewis C.A', 'casa de lewis', '04245229570', 'ljlb@gmail.com', 'bellas artes acarigua', 'alla nos reunimos hoy y el lunes', 1);
INSERT INTO `proveedor` VALUES (4, 'V-7895462-0', 'Barcelona F.C.', 'Futbol Club Barcelona', '04215987654', 'barcelona@gmail.com', 'Barcelona - Espa', 'El mejor equipo del mundo', 1);
INSERT INTO `proveedor` VALUES (5, 'J-8974567-0', 'Rafita C.A', 'Donde trabaja rafis', '02452135421', 'rafis@gmail.com', 'villas del pilar', 'comer', 1);
INSERT INTO `proveedor` VALUES (6, '56854184848', 'gvkgvkgvgv', 'vgvgvgvgv', '02458795624', 'cfcfgvg@nubj.com', 'nbblihbhbhbh', 'hbhbhbhbh', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `proyecto`
-- 

CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL auto_increment,
  `idproyecto` int(11) NOT NULL,
  `nombreproyecto` varchar(120) NOT NULL,
  `cantfamiliar` int(11) default NULL,
  `cantbifamiliar` int(11) default NULL,
  `canttetra` int(11) default NULL,
  `canttotal` int(11) NOT NULL,
  `fechai` date NOT NULL,
  `idciudad` varchar(60) NOT NULL,
  `direccion` varchar(180) NOT NULL,
  `responsableuno` int(60) NOT NULL,
  `responsabledos` varchar(60) NOT NULL,
  `responsabletres` varchar(60) NOT NULL,
  `estado` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `idparroquia` (`idciudad`),
  KEY `responsableuno` (`responsableuno`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `proyecto`
-- 

INSERT INTO `proyecto` VALUES (6, 123, 'un nmbre', 85, 54, 5, 88, '2017-02-22', '43', 'los tujanos', 11, '11', '11', 1);
INSERT INTO `proyecto` VALUES (7, 45, 'gran proyecto simon bolivar', 34, 26, 0, 60, '2017-04-19', '14', 'en la casita de al lado', 12, '13', '11', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `recurso`
-- 

CREATE TABLE `recurso` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador del recurso',
  `modulo` varchar(45) default NULL COMMENT 'Nombre del módulo',
  `controlador` varchar(45) default NULL COMMENT 'Nombre del controlador',
  `accion` varchar(45) default NULL COMMENT 'Nombre de la acción',
  `recurso` varchar(100) default NULL COMMENT 'Nombre del recurso',
  `descripcion` text NOT NULL COMMENT 'Descripción del recurso',
  `activo` int(1) NOT NULL default '1' COMMENT 'Estado del recurso',
  `registrado_at` datetime default NULL COMMENT 'Fecha de registro',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los recursos a los que acceden los usuari' AUTO_INCREMENT=31 ;

-- 
-- Dumping data for table `recurso`
-- 

INSERT INTO `recurso` VALUES (1, '*', NULL, NULL, '*', 'Comod', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (2, 'dashboard', '*', '*', 'dashboard/*/*', 'P', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (3, 'sistema', 'mi_cuenta', '*', 'sistema/mi_cuenta/*', 'Gesti', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (4, 'sistema', 'acceso', '*', 'sistema/acceso/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (5, 'sistema', 'auditoria', '*', 'sistema/auditoria/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (6, 'sistema', 'backup', '*', 'sistema/backup/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (7, 'sistema', 'mantenimiento', '*', 'sistema/mantenimiento/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (8, 'sistema', 'menu', '*', 'sistema/menu/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (9, 'sistema', 'perfil', '*', 'sistema/perfil/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (10, 'sistema', 'privilegio', '*', 'sistema/privilegio/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (11, 'sistema', 'recurso', '*', 'sistema/recurso/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (12, 'sistema', 'usuario', '*', 'sistema/usuario/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (13, 'sistema', 'sucesos', '*', 'sistema/suceso/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (14, 'sistema', 'configuracion', '*', 'sistema/configuracion/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (15, 'config', 'empresa', '*', 'config/empresa/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (16, 'config', 'sucursal', '*', 'config/sucursal/*', 'Subm', 1, '2013-01-01 00:00:01');
INSERT INTO `recurso` VALUES (18, 'config', 'grupo', '*', 'config/grupo/*', 'Modulo de grupos', 1, '2016-11-15 13:03:28');
INSERT INTO `recurso` VALUES (19, 'inventario', '*', '*', 'inventario/*/*', 'modulo de inventario', 1, '2016-12-16 13:49:16');
INSERT INTO `recurso` VALUES (20, 'config', 'unidad', '*', 'config/unidad/*', 'Gestionar unidad', 1, '2017-01-12 15:12:21');
INSERT INTO `recurso` VALUES (21, 'config', 'subgrupo', '*', 'config/subgrupo/*', 'modulo de subgrupos', 1, '2017-01-13 13:40:14');
INSERT INTO `recurso` VALUES (22, 'inventario', 'proveedor', '*', 'inventario/proveedor/*', 'modulo de proveedor', 1, '2017-01-23 14:29:52');
INSERT INTO `recurso` VALUES (23, 'proyecto', '*', '*', 'proyecto/*/*', 'modulo de proyectos', 1, '2017-01-23 14:56:21');
INSERT INTO `recurso` VALUES (24, 'proyecto', 'responsable', '*', 'proyecto/responsable/*', 'modulo del responsable del proyecto', 1, '2017-01-23 14:58:43');
INSERT INTO `recurso` VALUES (26, 'despacho', 'despacho', '*', 'inventario/despacho/*', 'modulo de despachos', 1, '2017-01-23 15:08:42');
INSERT INTO `recurso` VALUES (28, 'mojon', '*', '*', 'mojon/*/*', 'mojon', 1, '2017-01-23 15:21:13');
INSERT INTO `recurso` VALUES (29, 'afeccion', '*', '*', 'afeccion/*/*', 'modulo de afeccion', 1, '2017-01-23 15:24:56');
INSERT INTO `recurso` VALUES (30, 'afeccion', 'afeccion', '*', 'afeccion/afeccion/*', 'Sub-modulo de afecciones', 1, '2017-01-23 15:26:08');

-- --------------------------------------------------------

-- 
-- Table structure for table `recurso_perfil`
-- 

CREATE TABLE `recurso_perfil` (
  `id` int(11) NOT NULL auto_increment,
  `recurso_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `registrado_at` datetime default NULL,
  `modificado_in` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_recurso_perfil_recurso_idx` (`recurso_id`),
  KEY `fk_recurso_perfil_perfil_idx` (`perfil_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los recursos del usuario en el sistema se' AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `recurso_perfil`
-- 

INSERT INTO `recurso_perfil` VALUES (1, 1, 1, '2013-01-01 00:00:01', NULL);
INSERT INTO `recurso_perfil` VALUES (2, 2, 2, '2016-11-15 12:38:48', NULL);
INSERT INTO `recurso_perfil` VALUES (3, 19, 2, '2016-12-16 13:53:09', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `responsable`
-- 

CREATE TABLE `responsable` (
  `id` int(11) NOT NULL auto_increment,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) character set utf8 NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `telefono` varchar(45) character set utf8 default NULL,
  `direccion` varchar(500) character set utf8 default NULL,
  `estado` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `responsable`
-- 

INSERT INTO `responsable` VALUES (10, 133456456, 'Arianni', 'BriceÃ±o', '04245874169', NULL, 1);
INSERT INTO `responsable` VALUES (11, 9876345, 'Jesus', 'Perez', '01417895241', NULL, 1);
INSERT INTO `responsable` VALUES (12, 2345876, 'Gregori', 'Hernandez', '04165894716', NULL, 1);
INSERT INTO `responsable` VALUES (13, 6123852, 'Mariam', 'Roldan', '04145602387', NULL, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `subgrupo`
-- 

CREATE TABLE `subgrupo` (
  `id` int(11) NOT NULL auto_increment,
  `grupo_id` int(11) default NULL COMMENT 'Identificador del grupo',
  `nombre` varchar(45) default NULL,
  `estado` char(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `subgrupo`
-- 

INSERT INTO `subgrupo` VALUES (1, NULL, 'Bautismo', '1');
INSERT INTO `subgrupo` VALUES (2, NULL, 'Comunion', '1');
INSERT INTO `subgrupo` VALUES (3, NULL, 'Confirmacion', '1');
INSERT INTO `subgrupo` VALUES (4, NULL, 'Matrimonio', '1');
INSERT INTO `subgrupo` VALUES (5, NULL, 'Orden sacerdotal', '1');
INSERT INTO `subgrupo` VALUES (6, 3, 'lew', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `sucursal`
-- 

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificación de la sucursal',
  `empresa_id` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `sucursal` varchar(45) NOT NULL COMMENT 'Nombre de la sucursal',
  `sucursal_slug` varchar(45) default NULL COMMENT 'Slug de la sucursal',
  `direccion` varchar(45) default NULL COMMENT 'Dirección de la sucursal',
  `telefono` varchar(45) default NULL COMMENT 'Número del teléfono',
  `fax` varchar(45) default NULL COMMENT 'Número del fax',
  `celular` varchar(45) default NULL COMMENT 'Número de celular',
  `ciudad_id` int(11) NOT NULL COMMENT 'Identificador de la ciudad',
  `registrado_at` datetime default NULL COMMENT 'Fecha de registro',
  `modificado_in` datetime default NULL COMMENT 'Fecha de la última modificación',
  PRIMARY KEY  (`id`),
  KEY `fk_sucursal_empresa_idx` (`empresa_id`),
  KEY `fk_sucursal_ciudad_idx` (`ciudad_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las sucursales de la empresa' AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `sucursal`
-- 

INSERT INTO `sucursal` VALUES (1, 1, 'Oficina Principal', 'oficina-principal', 'Direcci', '3162404183', '3162404183', '3162404183', 1, '2013-01-01 00:00:01', NULL);
INSERT INTO `sucursal` VALUES (2, 1, 'Barinas', NULL, 'barinas', '01234785698', '044613213', '04156984569', 2, '2017-01-13 13:32:03', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `tipo_nuip`
-- 

CREATE TABLE `tipo_nuip` (
  `id` int(11) NOT NULL auto_increment,
  `tipo_nuip` varchar(45) NOT NULL COMMENT 'Nombre del tipo de identificación',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los tipos de identificación de las person' AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `tipo_nuip`
-- 

INSERT INTO `tipo_nuip` VALUES (1, 'C.C.');
INSERT INTO `tipo_nuip` VALUES (2, 'C.E.');
INSERT INTO `tipo_nuip` VALUES (3, 'PAS.');
INSERT INTO `tipo_nuip` VALUES (4, 'T.I.');
INSERT INTO `tipo_nuip` VALUES (5, 'N.D.');

-- --------------------------------------------------------

-- 
-- Table structure for table `unidad`
-- 

CREATE TABLE `unidad` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(45) default NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` char(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `unidad`
-- 

INSERT INTO `unidad` VALUES (1, 'Bautismo', 'En construccion.', '1');
INSERT INTO `unidad` VALUES (2, 'Comunion', 'En construccion.', '1');
INSERT INTO `unidad` VALUES (3, 'Confirmacion', 'En construccion. En construccion  En construccion  En construccion  En construccion', '1');
INSERT INTO `unidad` VALUES (4, 'Matrimonio', 'En construccion. En construccion  En construccion  En construccion  En construccion', '1');
INSERT INTO `unidad` VALUES (5, 'Orden sacerdotal', 'En construccion  En construccion En construccion En construccion', '1');
INSERT INTO `unidad` VALUES (6, 'mongolicos', 'atatastatstastasayudasjbajhafgajdfadjfgadfgajdfgadjfghadfgajfgjadgg', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `usuario`
-- 

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador del usuario',
  `sucursal_id` int(11) default NULL COMMENT 'Identificador a la sucursal a la cual pertenece',
  `persona_id` int(11) NOT NULL COMMENT 'Identificador de la persona',
  `login` varchar(45) NOT NULL COMMENT 'Nombre de usuario',
  `password` varchar(45) NOT NULL COMMENT 'Contraseña de acceso al sistea',
  `perfil_id` int(2) NOT NULL COMMENT 'Identificador del perfil',
  `email` varchar(45) default NULL COMMENT 'Dirección del correo electónico',
  `tema` varchar(45) default 'default' COMMENT 'Tema aplicable para la interfaz',
  `app_ajax` int(1) default '1' COMMENT 'Indica si la app se trabaja con ajax o peticiones normales',
  `datagrid` int(11) default '30' COMMENT 'Datos por página en los datagrid',
  `registrado_at` datetime default NULL COMMENT 'Fecha de registro',
  `modificado_in` datetime default NULL COMMENT 'Fecha de la última modificación',
  PRIMARY KEY  (`id`),
  KEY `fk_usuario_perfil_idx` (`perfil_id`),
  KEY `fk_usuario_persona_idx` (`persona_id`),
  KEY `fk_usuario_sucursal_idx` (`sucursal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los usuarios' AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `usuario`
-- 

INSERT INTO `usuario` VALUES (1, NULL, 1, 'error', '963db57a0088931e0e3627b1e73e6eb5', 1, NULL, 'default', 1, 30, '2013-01-01 00:00:01', NULL);
INSERT INTO `usuario` VALUES (2, NULL, 2, 'admin', 'd93a5def7511da3d0f2d171d9c344e91', 1, NULL, 'default', 1, 30, '2013-01-01 00:00:01', NULL);
INSERT INTO `usuario` VALUES (3, 1, 3, 'lewis', '35ea362217df828a73ff28ea533bc91c', 2, 'ljlb_1995@gmail.com', 'default', 1, 30, '2016-11-15 12:40:13', NULL);
