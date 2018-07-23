-- --------------------------------------------------------
-- Host:                         ID-0851
-- Versión del servidor:         10.1.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla eta.forma2_alerts
CREATE TABLE IF NOT EXISTS `forma2_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `ticket` varchar(50) NOT NULL,
  `piloto` int(2) NOT NULL DEFAULT '0',
  `fecha_apertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_cierre` datetime NOT NULL,
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_alerts: ~0 rows (aproximadamente)
DELETE FROM `forma2_alerts`;
/*!40000 ALTER TABLE `forma2_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_alerts` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_calendary
CREATE TABLE IF NOT EXISTS `forma2_calendary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `lugar` varchar(250) NOT NULL,
  `encargado` varchar(250) NOT NULL,
  `trash` int(1) NOT NULL DEFAULT '1',
  `piloto` int(1) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_calendary: ~0 rows (aproximadamente)
DELETE FROM `forma2_calendary`;
/*!40000 ALTER TABLE `forma2_calendary` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_calendary` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_categories
CREATE TABLE IF NOT EXISTS `forma2_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `icon` varchar(75) NOT NULL DEFAULT 'none',
  `raiz` int(11) NOT NULL DEFAULT '-1',
  `piloto` int(2) NOT NULL DEFAULT '-1',
  `type` varchar(50) NOT NULL,
  `view` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_categories: ~0 rows (aproximadamente)
DELETE FROM `forma2_categories`;
/*!40000 ALTER TABLE `forma2_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_categories` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_comments
CREATE TABLE IF NOT EXISTS `forma2_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` text NOT NULL,
  `comment` text,
  `reply` int(1) NOT NULL DEFAULT '0',
  `trash` int(1) NOT NULL DEFAULT '1',
  `raiz` int(32) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'none',
  `f_query` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `f_comment` datetime DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT 'Anonimo',
  `piloto` int(32) NOT NULL DEFAULT '0',
  `comment_raiz` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_comments: ~0 rows (aproximadamente)
DELETE FROM `forma2_comments`;
/*!40000 ALTER TABLE `forma2_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_comments` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_devices_devices
CREATE TABLE IF NOT EXISTS `forma2_devices_devices` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_icon` mediumtext NOT NULL,
  `type` int(32) NOT NULL DEFAULT '0',
  `manufacturer` int(32) NOT NULL DEFAULT '0',
  `trash` int(1) NOT NULL DEFAULT '1',
  `size` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_devices_devices: ~0 rows (aproximadamente)
DELETE FROM `forma2_devices_devices`;
/*!40000 ALTER TABLE `forma2_devices_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_devices_devices` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_devices_manufacturer
CREATE TABLE IF NOT EXISTS `forma2_devices_manufacturer` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_icon` mediumtext NOT NULL,
  `type` int(32) NOT NULL DEFAULT '0',
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_devices_manufacturer: ~0 rows (aproximadamente)
DELETE FROM `forma2_devices_manufacturer`;
/*!40000 ALTER TABLE `forma2_devices_manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_devices_manufacturer` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_devices_plataformas
CREATE TABLE IF NOT EXISTS `forma2_devices_plataformas` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_icon` mediumtext NOT NULL,
  `icon` varchar(50) NOT NULL,
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.forma2_devices_plataformas: ~0 rows (aproximadamente)
DELETE FROM `forma2_devices_plataformas`;
/*!40000 ALTER TABLE `forma2_devices_plataformas` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_devices_plataformas` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_devices_topics
CREATE TABLE IF NOT EXISTS `forma2_devices_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `device` int(32) NOT NULL DEFAULT '-1',
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_devices_topics: ~0 rows (aproximadamente)
DELETE FROM `forma2_devices_topics`;
/*!40000 ALTER TABLE `forma2_devices_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_devices_topics` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_devices_virtualsteps
CREATE TABLE IF NOT EXISTS `forma2_devices_virtualsteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `device` int(32) NOT NULL DEFAULT '-1',
  `instructions` mediumtext NOT NULL,
  `topic` int(32) NOT NULL,
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_devices_virtualsteps: ~0 rows (aproximadamente)
DELETE FROM `forma2_devices_virtualsteps`;
/*!40000 ALTER TABLE `forma2_devices_virtualsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_devices_virtualsteps` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_f5_questions
CREATE TABLE IF NOT EXISTS `forma2_f5_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(250) DEFAULT NULL,
  `response` mediumtext,
  `topic` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla eta.forma2_f5_questions: ~0 rows (aproximadamente)
DELETE FROM `forma2_f5_questions`;
/*!40000 ALTER TABLE `forma2_f5_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_f5_questions` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_f5_response
CREATE TABLE IF NOT EXISTS `forma2_f5_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` int(11) NOT NULL,
  `user` int(32) unsigned zerofill NOT NULL,
  `result` mediumtext NOT NULL,
  `result_note` int(11) NOT NULL,
  `fecha_presenta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla eta.forma2_f5_response: ~0 rows (aproximadamente)
DELETE FROM `forma2_f5_response`;
/*!40000 ALTER TABLE `forma2_f5_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_f5_response` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_f5_topics
CREATE TABLE IF NOT EXISTS `forma2_f5_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT 'F5 - Actualizate!',
  `fecha_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `piloto` int(11) NOT NULL DEFAULT '0',
  `view` int(1) NOT NULL DEFAULT '0',
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla eta.forma2_f5_topics: ~0 rows (aproximadamente)
DELETE FROM `forma2_f5_topics`;
/*!40000 ALTER TABLE `forma2_f5_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_f5_topics` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_indicators
CREATE TABLE IF NOT EXISTS `forma2_indicators` (
  `user` varchar(32) NOT NULL,
  `aht` int(6) DEFAULT '0',
  `aht_meta` int(6) DEFAULT '0',
  `penc` int(3) DEFAULT '0',
  `pecu` int(3) DEFAULT '0',
  `pecn` int(3) DEFAULT '0',
  `rgu` int(3) DEFAULT '0',
  `ups` int(3) DEFAULT '0',
  `nps` int(3) DEFAULT '0',
  PRIMARY KEY (`user`),
  UNIQUE KEY `UNIQUE` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_indicators: ~0 rows (aproximadamente)
DELETE FROM `forma2_indicators`;
/*!40000 ALTER TABLE `forma2_indicators` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_indicators` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_messenger_chats
CREATE TABLE IF NOT EXISTS `forma2_messenger_chats` (
  `id` int(32) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `enviado_por` int(32) unsigned zerofill NOT NULL DEFAULT '00000000000000000000000000000000',
  `enviado_para` int(32) unsigned zerofill NOT NULL DEFAULT '00000000000000000000000000000000',
  `message` mediumtext NOT NULL,
  `ids_reads` mediumtext NOT NULL,
  `fcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.forma2_messenger_chats: ~0 rows (aproximadamente)
DELETE FROM `forma2_messenger_chats`;
/*!40000 ALTER TABLE `forma2_messenger_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_messenger_chats` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_messenger_talks
CREATE TABLE IF NOT EXISTS `forma2_messenger_talks` (
  `id` int(32) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `group_ids` mediumtext NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.forma2_messenger_talks: ~0 rows (aproximadamente)
DELETE FROM `forma2_messenger_talks`;
/*!40000 ALTER TABLE `forma2_messenger_talks` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_messenger_talks` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_people
CREATE TABLE IF NOT EXISTS `forma2_people` (
  `id` int(32) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `cedula` int(15) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `user` varchar(50) NOT NULL,
  `cargo` int(2) NOT NULL DEFAULT '0',
  `piloto` int(2) NOT NULL DEFAULT '0',
  `estado` int(2) NOT NULL,
  `supervisor` int(32) NOT NULL,
  `novedad` int(32) DEFAULT '0',
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `rol` int(2) NOT NULL DEFAULT '0',
  `ejecutivo_de_experiencia` int(32) NOT NULL DEFAULT '0',
  `genero` varchar(10) DEFAULT '0',
  `avatar` int(32) NOT NULL DEFAULT '0',
  `more` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.forma2_people: ~7 rows (aproximadamente)
DELETE FROM `forma2_people`;
/*!40000 ALTER TABLE `forma2_people` DISABLE KEYS */;
INSERT INTO `forma2_people` (`id`, `cedula`, `nombre`, `user`, `cargo`, `piloto`, `estado`, `supervisor`, `novedad`, `fecha_nacimiento`, `fecha_ingreso`, `rol`, `ejecutivo_de_experiencia`, `genero`, `avatar`, `more`) VALUES
	(00000000000000000000000000000001, 2147483647, 'Administrador de Forma2 MASTER', 'admin.master', 1, 0, 1, 0, 0, '0000-00-00', '2017-11-03', 0, 0, '', 407, '""'),
	(00000000000000000000000000000002, 11, 'USUARIO FORMA2 MASTER', 'forma2.master', 7019, 0, 1, 0, 0, '0000-00-00', '2017-11-03', 0, 0, 'MAS', 0, '""');
/*!40000 ALTER TABLE `forma2_people` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_people_boss
CREATE TABLE IF NOT EXISTS `forma2_people_boss` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_people_boss: ~0 rows (aproximadamente)
DELETE FROM `forma2_people_boss`;
/*!40000 ALTER TABLE `forma2_people_boss` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_people_boss` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_people_cargos
CREATE TABLE IF NOT EXISTS `forma2_people_cargos` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `permisos` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7026 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_people_cargos: ~5 rows (aproximadamente)
DELETE FROM `forma2_people_cargos`;
/*!40000 ALTER TABLE `forma2_people_cargos` DISABLE KEYS */;
INSERT INTO `forma2_people_cargos` (`id`, `name`, `permisos`) VALUES
	(1, 'Admin Forma2', '{"export":{"quiz":true},"import":{"people":true,"indicators":true},"quiz":{"view":true,"create":true,"edit":true,"delete":true,"history":true},"calendary":{"view":true,"edit":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"chat":{"view":true,"edit":true,"delete":true,"group":{"2":true}},"forum":{"view":true,"response":true,"edit":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"comments":{"view":true,"response":true,"edit":true,"delete":true},"articles":{"view":true,"response":true,"create":true,"edit":true,"history":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"ecards":{"view":true,"response":true,"edit":true,"history":true,"create":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"alerts":{"view":true,"history":true,"create":true,"edit":true,"delete":true},"indicators":{"view":true},"stopwatch":{"view":true},"devices":{"view":true,"categories":{"create":true,"edit":true,"delete":true}},"mundial":{"view":true,"link":"../../mundial/"}}'),
	(7011, 'SUPERVISOR', '{"export":{"quiz":true},"import":{"people":true,"indicators":true},"quiz":{"view":true,"create":true,"edit":true,"delete":true,"history":true},"calendary":{"view":true,"edit":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"chat":{"view":true,"edit":true,"delete":true,"group":{"2":true}},"forum":{"view":true,"response":true,"edit":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"comments":{"view":true,"response":true,"edit":true,"delete":true},"articles":{"view":true,"response":true,"create":true,"edit":true,"history":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"ecards":{"view":true,"response":true,"edit":true,"history":true,"create":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"alerts":{"view":true,"history":true,"create":true,"edit":true,"delete":true},"indicators":{"view":true},"stopwatch":{"view":true},"devices":{"view":true,"categories":{"create":true,"edit":true,"delete":true}},"mundial":{"view":true,"link":"../../mundial/"}}'),
	(7019, 'ASESOR', '{"export":{"quiz":false},"import":{"people":false,"indicators":false},"quiz":{"view":true,"create":false,"edit":false,"delete":false,"history":false},"calendary":{"view":true,"edit":false,"delete":false,"categories":{"create":false,"edit":false,"delete":false}},"chat":{"view":true,"edit":false,"delete":false,"group":{"7023":true}},"forum":{"view":true,"response":false,"edit":false,"delete":false,"categories":{"create":false,"edit":false,"delete":false}},"comments":{"view":true,"response":false,"edit":false,"delete":false},"articles":{"view":true,"response":false,"create":false,"edit":false,"history":false,"delete":false,"categories":{"create":false,"edit":false,"delete":false}},"ecards":{"view":true,"response":false,"edit":false,"history":false,"create":false,"delete":false,"categories":{"create":false,"edit":false,"delete":false}},"alerts":{"view":true,"history":false,"create":false,"edit":false,"delete":false},"indicators":{"view":true},"stopwatch":{"view":true},"devices":{"view":true,"categories":{"create":false,"edit":false,"delete":false}},"mundial":{"view":true,"link":"../../mundial/"}}'),
	(7023, 'FORMADOR', '{"export":{"quiz":true},"import":{"people":true,"indicators":true},"quiz":{"view":true,"create":true,"edit":true,"delete":true,"history":true},"calendary":{"view":true,"edit":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"chat":{"view":true,"edit":true,"delete":true,"group":{"2":true}},"forum":{"view":true,"response":true,"edit":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"comments":{"view":true,"response":true,"edit":true,"delete":true},"articles":{"view":true,"response":true,"create":true,"edit":true,"history":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"ecards":{"view":true,"response":true,"edit":true,"history":true,"create":true,"delete":true,"categories":{"create":true,"edit":true,"delete":true}},"alerts":{"view":true,"history":true,"create":true,"edit":true,"delete":true},"indicators":{"view":true},"stopwatch":{"view":true},"devices":{"view":true,"categories":{"create":true,"edit":true,"delete":true}},"mundial":{"view":true,"link":"../../mundial/"}}'),
	(7025, '', NULL);
/*!40000 ALTER TABLE `forma2_people_cargos` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_people_pilotos
CREATE TABLE IF NOT EXISTS `forma2_people_pilotos` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_people_pilotos: ~0 rows (aproximadamente)
DELETE FROM `forma2_people_pilotos`;
/*!40000 ALTER TABLE `forma2_people_pilotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_people_pilotos` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_people_rols
CREATE TABLE IF NOT EXISTS `forma2_people_rols` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_people_rols: ~0 rows (aproximadamente)
DELETE FROM `forma2_people_rols`;
/*!40000 ALTER TABLE `forma2_people_rols` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_people_rols` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_people_status
CREATE TABLE IF NOT EXISTS `forma2_people_status` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_people_status: ~0 rows (aproximadamente)
DELETE FROM `forma2_people_status`;
/*!40000 ALTER TABLE `forma2_people_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_people_status` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_pictures
CREATE TABLE IF NOT EXISTS `forma2_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_pictures: ~0 rows (aproximadamente)
DELETE FROM `forma2_pictures`;
/*!40000 ALTER TABLE `forma2_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_pictures` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_publishs
CREATE TABLE IF NOT EXISTS `forma2_publishs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT 'Sin Titulo',
  `data` mediumtext NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'hidden',
  `thumbnail` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(250) NOT NULL DEFAULT 'sin etiquetas',
  `category` int(11) NOT NULL DEFAULT '0',
  `piloto` int(2) NOT NULL DEFAULT '0',
  `author` varchar(32) NOT NULL,
  `fcreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `fchange` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trash` int(1) NOT NULL DEFAULT '1',
  `public` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf16 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla eta.forma2_publishs: ~0 rows (aproximadamente)
DELETE FROM `forma2_publishs`;
/*!40000 ALTER TABLE `forma2_publishs` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_publishs` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_statistics_publishs
CREATE TABLE IF NOT EXISTS `forma2_statistics_publishs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT 'hidden',
  `id_ref` int(32) NOT NULL DEFAULT '0',
  `views` int(32) NOT NULL DEFAULT '0',
  `likes` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla eta.forma2_statistics_publishs: ~0 rows (aproximadamente)
DELETE FROM `forma2_statistics_publishs`;
/*!40000 ALTER TABLE `forma2_statistics_publishs` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_statistics_publishs` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_temp_uploads
CREATE TABLE IF NOT EXISTS `forma2_temp_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `columnas` mediumtext NOT NULL,
  `datos` longtext NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.forma2_temp_uploads: ~0 rows (aproximadamente)
DELETE FROM `forma2_temp_uploads`;
/*!40000 ALTER TABLE `forma2_temp_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_temp_uploads` ENABLE KEYS */;

-- Volcando estructura para tabla eta.forma2_users_actives
CREATE TABLE IF NOT EXISTS `forma2_users_actives` (
  `id` int(32) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userid` int(32) unsigned zerofill NOT NULL,
  `user` varchar(32) NOT NULL,
  `last_connection` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13456 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.forma2_users_actives: ~0 rows (aproximadamente)
DELETE FROM `forma2_users_actives`;
/*!40000 ALTER TABLE `forma2_users_actives` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma2_users_actives` ENABLE KEYS */;

-- Volcando estructura para tabla eta.options
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Índice 2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.options: ~0 rows (aproximadamente)
DELETE FROM `options`;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;

-- Volcando estructura para tabla eta.status_cursos
CREATE TABLE IF NOT EXISTS `status_cursos` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.status_cursos: ~0 rows (aproximadamente)
DELETE FROM `status_cursos`;
/*!40000 ALTER TABLE `status_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_cursos` ENABLE KEYS */;

-- Volcando estructura para tabla eta.status_listados
CREATE TABLE IF NOT EXISTS `status_listados` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `curso` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `data` mediumtext NOT NULL,
  `fecha` date NOT NULL,
  `filtros` mediumtext NOT NULL,
  `novedades` mediumtext NOT NULL,
  `presencial` int(1) NOT NULL,
  `calificar` int(1) NOT NULL,
  `trash` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.status_listados: ~0 rows (aproximadamente)
DELETE FROM `status_listados`;
/*!40000 ALTER TABLE `status_listados` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_listados` ENABLE KEYS */;

-- Volcando estructura para tabla eta.status_novedades
CREATE TABLE IF NOT EXISTS `status_novedades` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user` varchar(32) NOT NULL,
  `curso` int(32) DEFAULT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Índice 2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.status_novedades: ~0 rows (aproximadamente)
DELETE FROM `status_novedades`;
/*!40000 ALTER TABLE `status_novedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_novedades` ENABLE KEYS */;

-- Volcando estructura para tabla eta.status_reportes
CREATE TABLE IF NOT EXISTS `status_reportes` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `curso` int(32) NOT NULL,
  `presenta` int(1) NOT NULL DEFAULT '0',
  `nota` int(3) NOT NULL DEFAULT '0',
  `novedad` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.status_reportes: ~0 rows (aproximadamente)
DELETE FROM `status_reportes`;
/*!40000 ALTER TABLE `status_reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_reportes` ENABLE KEYS */;

-- Volcando estructura para tabla eta.status_uploads
CREATE TABLE IF NOT EXISTS `status_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `columnas` mediumtext NOT NULL,
  `datos` longtext NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `KEY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16;

-- Volcando datos para la tabla eta.status_uploads: ~0 rows (aproximadamente)
DELETE FROM `status_uploads`;
/*!40000 ALTER TABLE `status_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_uploads` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
