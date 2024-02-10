-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para bd_arrendaki
DROP DATABASE IF EXISTS `bd_arrendaki`;
CREATE DATABASE IF NOT EXISTS `bd_arrendaki` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_arrendaki`;

-- A despejar estrutura para tabela bd_arrendaki.actividade_imoveis
DROP TABLE IF EXISTS `actividade_imoveis`;
CREATE TABLE IF NOT EXISTS `actividade_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cadastrado_por` int DEFAULT NULL,
  `imoveis_id` int DEFAULT NULL,
  `operacao_imoveis_id` int DEFAULT NULL,
  `quantidade_prestacoes` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tempo_arrendar` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_actividade_imoveis_imoveis` (`imoveis_id`),
  KEY `FK_actividade_imoveis_operacao_imoveis` (`operacao_imoveis_id`),
  KEY `FK_actividade_imoveis_clientes` (`cadastrado_por`) USING BTREE,
  CONSTRAINT `FK_actividade_imoveis_imoveis` FOREIGN KEY (`imoveis_id`) REFERENCES `imoveis` (`id`),
  CONSTRAINT `FK_actividade_imoveis_operacao_imoveis` FOREIGN KEY (`operacao_imoveis_id`) REFERENCES `operacao_imoveis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.actividade_imoveis: ~8 rows (aproximadamente)
DELETE FROM `actividade_imoveis`;
INSERT INTO `actividade_imoveis` (`id`, `cadastrado_por`, `imoveis_id`, `operacao_imoveis_id`, `quantidade_prestacoes`, `created_at`, `updated_at`, `deleted_at`, `tempo_arrendar`) VALUES
	(50, 418, 171, 2, 0, '2023-10-09 10:40:45', '2023-10-09 10:40:45', NULL, 1),
	(52, 418, 166, 2, 0, '2023-10-09 10:51:55', '2023-10-09 10:51:55', NULL, 4),
	(53, 418, 167, 1, 0, '2023-10-31 16:16:46', '2023-10-31 16:16:46', NULL, 0),
	(54, 418, 168, 1, 0, '2023-10-31 16:21:42', '2023-10-31 16:21:42', NULL, 0),
	(55, 418, 169, 1, 0, '2023-10-31 16:24:27', '2023-10-31 16:24:27', NULL, 0),
	(56, 418, 170, 1, 0, '2023-10-31 16:38:37', '2023-10-31 16:38:37', NULL, 0),
	(58, 443, 174, 2, 0, '2023-11-09 09:11:45', '2023-11-09 09:11:45', NULL, 2),
	(60, 473, 176, 1, 2, '2023-12-10 13:31:44', '2023-12-10 13:31:44', NULL, 0);

-- A despejar estrutura para tabela bd_arrendaki.categoria_imoveis
DROP TABLE IF EXISTS `categoria_imoveis`;
CREATE TABLE IF NOT EXISTS `categoria_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `criado_por` int DEFAULT NULL,
  `apagado_por` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  `tipo_imovel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.categoria_imoveis: ~4 rows (aproximadamente)
DELETE FROM `categoria_imoveis`;
INSERT INTO `categoria_imoveis` (`id`, `designacao`, `descricao`, `criado_por`, `apagado_por`, `created_at`, `updated_at`, `deleted_at`, `tipo_imovel_id`) VALUES
	(1, 'Vivenda', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Apartamento', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Quartos', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Quintal Comum', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.condicao_imoveis
DROP TABLE IF EXISTS `condicao_imoveis`;
CREATE TABLE IF NOT EXISTS `condicao_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designacao` (`designacao`) USING BTREE,
  KEY `FK_condicao_imoveis_users` (`created_by`),
  CONSTRAINT `FK_condicao_imoveis_users` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.condicao_imoveis: ~5 rows (aproximadamente)
DELETE FROM `condicao_imoveis`;
INSERT INTO `condicao_imoveis` (`id`, `designacao`, `descricao`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Novo', NULL, NULL, NULL, NULL, '2023-01-03 17:55:21', '2023-01-03 17:55:20', NULL),
	(2, 'Em construção', NULL, NULL, NULL, NULL, '2023-01-03 17:55:27', '2023-01-03 17:55:27', NULL),
	(3, 'Renovado', NULL, NULL, NULL, NULL, '2023-01-03 17:55:35', '2023-01-03 17:55:35', NULL),
	(4, 'Para repararUsado', NULL, NULL, NULL, NULL, '2023-01-03 17:55:58', '2023-01-03 16:55:58', '2023-09-21 21:36:24'),
	(5, 'Em construção1', NULL, NULL, NULL, NULL, '2023-01-03 17:56:17', '2023-01-03 17:56:18', '2023-09-21 21:35:49');

-- A despejar estrutura para tabela bd_arrendaki.documentacoes
DROP TABLE IF EXISTS `documentacoes`;
CREATE TABLE IF NOT EXISTS `documentacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imoveis_id` int DEFAULT NULL,
  `tipo_domumentacoes` int DEFAULT NULL,
  `nome_arquivo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_domumentacoes` (`tipo_domumentacoes`),
  KEY `imovel_id` (`imoveis_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- A despejar dados para tabela bd_arrendaki.documentacoes: ~29 rows (aproximadamente)
DELETE FROM `documentacoes`;
INSERT INTO `documentacoes` (`id`, `imoveis_id`, `tipo_domumentacoes`, `nome_arquivo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4, 28, 1, NULL, '2023-09-04 14:43:04', '2023-09-04 14:43:04', NULL),
	(5, 28, 2, 'Croquis/UPh1gT6PNnKJVln6yxQK0ENXLuaT4JM3NbMiMr6o.png', '2023-09-04 14:43:04', '2023-09-04 14:43:04', NULL),
	(6, 29, 1, NULL, '2023-09-04 14:45:42', '2023-09-04 14:45:42', NULL),
	(7, 29, 2, 'Croquis/q2wfYTTgmf2kRnNwSbmHTvK2CH0HuTob2wzc1L43.png', '2023-09-04 14:45:42', '2023-09-04 14:45:42', NULL),
	(8, 30, 1, NULL, '2023-09-05 13:46:26', '2023-09-05 13:46:26', NULL),
	(9, 30, 2, 'Croquis/4xKL6rDdEdRswbVjEUGcAAKaXiV2LwoDmmOHI86D.jpg', '2023-09-05 13:46:26', '2023-09-05 13:46:26', NULL),
	(10, 31, 1, NULL, '2023-09-05 13:52:18', '2023-09-05 13:52:18', NULL),
	(11, 31, 2, 'Croquis/my7psfumzH9eYj0VUOkLpiSEcHIYnSVtZB6FGC4P.jpg', '2023-09-05 13:52:18', '2023-09-05 13:52:18', NULL),
	(12, 32, 1, NULL, '2023-09-05 13:53:54', '2023-09-05 13:53:54', NULL),
	(13, 32, 2, 'Croquis/edgQJgCEDccl7MLz7UDCr8QYoN9FyN3gCyDaHdH3.jpg', '2023-09-05 13:53:54', '2023-09-05 13:53:54', NULL),
	(14, 33, 1, NULL, '2023-09-05 14:01:08', '2023-09-05 14:01:08', NULL),
	(15, 33, 2, 'Croquis/4nT1YO2UesTELQFTjZhiv91CnDnQedE5iHgTuEbU.jpg', '2023-09-05 14:01:08', '2023-09-05 14:01:08', NULL),
	(16, 34, 1, NULL, '2023-09-05 14:04:54', '2023-09-05 14:04:54', NULL),
	(17, 34, 2, 'Croquis/K84sBW02RxftZRvtCruXGbj7FnybfmwKqx67aoBw.jpg', '2023-09-05 14:04:54', '2023-09-05 14:04:54', NULL),
	(18, 46, 2, 'Croquis/XGmImAltIDjVa154Z0HhacU0s2guR7HUy07WlktE.jpg', '2023-09-05 14:10:43', '2023-09-05 14:10:43', NULL),
	(19, 59, 1, NULL, '2023-09-05 15:05:32', '2023-09-05 15:05:32', NULL),
	(20, 59, 2, 'Croquis/xOrUm0iasvOt9WJiF3bJAbLS1hLhD4rd6zgE1Uc5.jpg', '2023-09-05 15:05:32', '2023-09-05 15:05:32', NULL),
	(21, 62, 1, NULL, '2023-09-06 06:52:25', '2023-09-06 06:52:25', NULL),
	(22, 62, 2, 'Croquis/T5R9BsBrHt65fvDZDc7qfFAWk6xv2dFqqU9pakkX.jpg', '2023-09-06 06:52:25', '2023-09-06 06:52:25', NULL),
	(23, 64, 1, NULL, '2023-09-06 06:53:07', '2023-09-06 06:53:07', NULL),
	(24, 64, 2, 'Croquis/c3ifvws4ISDeC4UJPiPgtAS77dyPL2LahHdNToiL.jpg', '2023-09-06 06:53:07', '2023-09-06 06:53:07', NULL),
	(25, 66, 1, NULL, '2023-09-06 06:54:37', '2023-09-06 06:54:37', NULL),
	(26, 66, 2, 'Croquis/pSvWmksv9gAvk1V4wGpObnJK0SwER9NU2YllDaFk.jpg', '2023-09-06 06:54:37', '2023-09-06 06:54:37', NULL),
	(27, 67, 1, NULL, '2023-09-06 06:56:27', '2023-09-06 06:56:27', NULL),
	(28, 67, 2, 'Croquis/ZNRPHT8Zff83lYnZpY5w8SIcMC8jhnUvRd88hqX6.jpg', '2023-09-06 06:56:27', '2023-09-06 06:56:27', NULL),
	(29, 69, 1, NULL, '2023-09-07 13:18:49', '2023-09-07 13:18:49', NULL),
	(30, 69, 2, 'Croquis/RtabecTjFtDnO4Jk8Jmdc8TiSaHYk3Gic0hzF76x.jpg', '2023-09-07 13:18:49', '2023-09-07 13:18:49', NULL),
	(31, 70, 1, NULL, '2023-09-07 13:24:53', '2023-09-07 13:24:53', NULL),
	(32, 70, 2, 'Croquis/49rB1TNmg7YWceJ8aL1aNfmNJH8Fx6ZW3q8FFrCk.jpg', '2023-09-07 13:24:53', '2023-09-07 13:24:53', NULL);

-- A despejar estrutura para tabela bd_arrendaki.estado_civis
DROP TABLE IF EXISTS `estado_civis`;
CREATE TABLE IF NOT EXISTS `estado_civis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- A despejar dados para tabela bd_arrendaki.estado_civis: ~0 rows (aproximadamente)
DELETE FROM `estado_civis`;
INSERT INTO `estado_civis` (`id`, `designacao`, `descricao`, `created_at`, `updated_at`) VALUES
	(1, 'Solteiro', 'Solteiro', '2023-06-09 10:46:53', NULL);

-- A despejar estrutura para tabela bd_arrendaki.estado_imoveis
DROP TABLE IF EXISTS `estado_imoveis`;
CREATE TABLE IF NOT EXISTS `estado_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.estado_imoveis: ~8 rows (aproximadamente)
DELETE FROM `estado_imoveis`;
INSERT INTO `estado_imoveis` (`id`, `designacao`, `descricao`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Disponível', 'Disponível', '2023-06-09 10:46:34', NULL, NULL),
	(2, 'Não Aprovado', 'Não Aprovado', '2023-09-07 08:35:41', NULL, NULL),
	(3, 'Pendente', 'Pendente', '2023-09-07 08:36:33', NULL, NULL),
	(4, 'Visita pendente', 'Visita pendente', '2023-09-07 08:37:17', NULL, NULL),
	(5, 'Visita confirmada', 'Visita confirmada', '2023-09-07 08:37:43', NULL, NULL),
	(6, 'Vendido', 'Vendido', '2023-09-07 08:38:29', NULL, NULL),
	(7, 'Arrendado', 'Arrendado', '2023-09-07 08:38:43', NULL, NULL),
	(8, 'Em negociação', 'Em negociação', '2023-09-10 20:37:12', NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.fotos_imoveis
DROP TABLE IF EXISTS `fotos_imoveis`;
CREATE TABLE IF NOT EXISTS `fotos_imoveis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `foto` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imoveis_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_imavel_id` (`imoveis_id`) USING BTREE,
  KEY `FK_fotos_imoveis_users` (`created_by`),
  CONSTRAINT `FK_fotos_imoveis_imoveis` FOREIGN KEY (`imoveis_id`) REFERENCES `imoveis` (`id`),
  CONSTRAINT `FK_fotos_imoveis_users` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.fotos_imoveis: ~44 rows (aproximadamente)
DELETE FROM `fotos_imoveis`;
INSERT INTO `fotos_imoveis` (`id`, `foto`, `imoveis_id`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(289, 'Foto_Multipla/ZEd5kALpiKpXpE1Uoq1KltPMGIIoxO73B6z9jdDo.jpg', 165, NULL, NULL, NULL, '2023-10-09 10:51:55', '2023-11-01 06:56:41', '2023-11-01 06:56:41'),
	(290, 'Foto_Multipla/ulXVdCg4a2m1q16COcoGDoEW54Ql6RbqbXUWyfyg.jpg', 165, NULL, NULL, NULL, '2023-10-09 10:51:55', '2023-11-01 06:56:41', '2023-11-01 06:56:41'),
	(291, 'Foto_Multipla/CdmPP6bwyyKbVbfDFEt38LL0fl52Ae9JVE2RTgm2.jpg', 165, NULL, NULL, NULL, '2023-10-09 10:51:55', '2023-11-01 06:56:41', '2023-11-01 06:56:41'),
	(324, 'Foto_Multipla/kt4dPNyE0ZLOxNKSMewFO4TVwIpQBthmozP86nGd.jpg', 166, NULL, NULL, NULL, '2023-10-31 15:54:37', '2023-10-31 15:54:37', NULL),
	(325, 'Foto_Multipla/I0zR64yk5CCOL0t3f99lxiEuvhQxX2u7LkFsN4Rn.jpg', 166, NULL, NULL, NULL, '2023-10-31 15:54:37', '2023-10-31 15:54:37', NULL),
	(326, 'Foto_Multipla/rgf3Hmkap9nyqk2iuKPzNiOITd7Rohjfu1qD7ull.jpg', 166, NULL, NULL, NULL, '2023-10-31 15:54:37', '2023-10-31 15:54:37', NULL),
	(327, 'Foto_Multipla/MeS7iHwD9XI2l5qOhQVsFmS8CXxxatpLmQzM8fEt.jpg', 166, NULL, NULL, NULL, '2023-10-31 15:54:37', '2023-10-31 15:54:37', NULL),
	(328, 'Foto_Multipla/ztsE0nKxD6uvHW0UDnOWtkRfwgRX5HeXQUFg7NjP.jpg', 167, NULL, NULL, NULL, '2023-10-31 16:16:46', '2023-10-31 16:16:46', NULL),
	(329, 'Foto_Multipla/llevkIwmBGigZch8MbVXvsMlQbGPHOHFgjiGi8ua.jpg', 167, NULL, NULL, NULL, '2023-10-31 16:16:46', '2023-10-31 16:16:46', NULL),
	(330, 'Foto_Multipla/61WuEcgNjfx6o6up4MC3Mi1vYCFzOOUDrLRsUslL.jpg', 167, NULL, NULL, NULL, '2023-10-31 16:16:46', '2023-10-31 16:16:46', NULL),
	(331, 'Foto_Multipla/LBuJXQ4IkT7r9Qf0GJhgVjU675bf8jqKFFzF0Rr3.jpg', 167, NULL, NULL, NULL, '2023-10-31 16:16:46', '2023-10-31 16:16:46', NULL),
	(332, 'Foto_Multipla/iFVLJlCpOzXRtAXR5HLcwcPrrqunYlUj2fFPseKY.jpg', 168, NULL, NULL, NULL, '2023-10-31 16:21:42', '2023-10-31 16:21:42', NULL),
	(333, 'Foto_Multipla/7nX2RCuaQR3SKl5Jre6WQz4PDeMQ7PuC8rJ6Do75.jpg', 168, NULL, NULL, NULL, '2023-10-31 16:21:42', '2023-10-31 16:21:42', NULL),
	(334, 'Foto_Multipla/af6PGUUhXB0i5pwf3skk5nX3aqCliBToIjLv9bZh.jpg', 168, NULL, NULL, NULL, '2023-10-31 16:21:42', '2023-10-31 16:21:42', NULL),
	(335, 'Foto_Multipla/xAzmDqWN669OQla08zonRyzRXm2IMinTfve7d7WZ.jpg', 168, NULL, NULL, NULL, '2023-10-31 16:21:42', '2023-10-31 16:21:42', NULL),
	(336, 'Foto_Multipla/UVVCssFTEVN2UiIJ8d7julhPLTnu3OjBx0Sm8RIn.jpg', 169, NULL, NULL, NULL, '2023-10-31 16:24:27', '2023-10-31 16:24:27', NULL),
	(337, 'Foto_Multipla/d5VbUsiujesxwjauHqdNrcqkdcDSDEsh4qHohXcP.jpg', 169, NULL, NULL, NULL, '2023-10-31 16:24:27', '2023-10-31 16:24:27', NULL),
	(338, 'Foto_Multipla/souMPfpclnOeO8bvQvScK2RIHIxhDaFjJyltF1HZ.jpg', 169, NULL, NULL, NULL, '2023-10-31 16:24:27', '2023-10-31 16:24:27', NULL),
	(339, 'Foto_Multipla/mwhiMGFlHQaFOIYjOAZUVMJkSHugChS3RXJ0AZy9.jpg', 170, NULL, NULL, NULL, '2023-10-31 16:38:37', '2023-10-31 16:38:37', NULL),
	(340, 'Foto_Multipla/a2pcL3v2elDrDHq7LCSigAIsMzKdwdZyj1T30J1Z.jpg', 170, NULL, NULL, NULL, '2023-10-31 16:38:37', '2023-10-31 16:38:37', NULL),
	(341, 'Foto_Multipla/YjFOuaoyewu214xhTH4jnZVPGyM4nESAttpWd5oK.jpg', 170, NULL, NULL, NULL, '2023-10-31 16:38:37', '2023-10-31 16:38:37', NULL),
	(342, 'Foto_Multipla/MZJE1rOB0LsWz1gtLRdCODUyB4MG17n7vYTFjcqy.jpg', 173, NULL, NULL, NULL, '2023-11-08 15:57:02', '2023-11-08 15:57:02', NULL),
	(343, 'Foto_Multipla/LS8ylhnpJY4B9ntL2mmPozUEAnsyEbVSbDp2y7ii.jpg', 173, NULL, NULL, NULL, '2023-11-08 15:57:02', '2023-11-08 15:57:02', NULL),
	(344, 'Foto_Multipla/Bkji3VuPcMDDBnJykWd4EVKffCUDSl2lsV2gMfS0.jpg', 173, NULL, NULL, NULL, '2023-11-08 15:57:02', '2023-11-08 15:57:02', NULL),
	(345, 'Foto_Multipla/X4I9x9d6ms2ox752BG6l3ZLG4xVmL3yhDMKJeN1C.jpg', 173, NULL, NULL, NULL, '2023-11-08 15:57:02', '2023-11-08 15:57:02', NULL),
	(346, 'Foto_Multipla/KVXu3UFtQPxOCFwekz9JNkslVmwXL845J7m2k0RU.jpg', 174, NULL, NULL, NULL, '2023-11-09 09:11:45', '2023-11-09 09:11:45', NULL),
	(347, 'Foto_Multipla/Yn8OiCKlaKVjhJCKieWesZmJ4KjzsCkJu33tnm1l.jpg', 174, NULL, NULL, NULL, '2023-11-09 09:11:45', '2023-11-09 09:11:45', NULL),
	(348, 'Foto_Multipla/PAAR6shSIOBhRWbouuxfddspUhHtQWtmYKVjbjwb.jpg', 174, NULL, NULL, NULL, '2023-11-09 09:11:45', '2023-11-09 09:11:45', NULL),
	(349, 'Foto_Multipla/VjPjcwMYJZLVobtY4Qn8sjhL9eojyTo5ppGjt2Ov.jpg', 174, NULL, NULL, NULL, '2023-11-09 09:11:45', '2023-11-09 09:11:45', NULL),
	(350, 'Foto_Multipla/RfIkBwjXFAb8408j6ft9vqEHuk4WpnW60yWnRzZP.jpg', 174, NULL, NULL, NULL, '2023-11-09 09:11:45', '2023-11-09 09:11:45', NULL),
	(351, 'Foto_Multipla/6NX8boZyQDMGUQG39nqc4iBySifOtri7SviQhiSY.jpg', 175, NULL, NULL, NULL, '2023-11-09 13:54:59', '2023-11-09 13:54:59', NULL),
	(352, 'Foto_Multipla/Hto5T5XTplh6vhv2JEgoEOEn1UdN8GzrtKm9qF1z.jpg', 175, NULL, NULL, NULL, '2023-11-09 13:54:59', '2023-11-09 13:54:59', NULL),
	(353, 'Foto_Multipla/FaO171sjVikFARfVY9hYNDys9sTJcJs3rHtu7WRj.jpg', 175, NULL, NULL, NULL, '2023-11-09 13:54:59', '2023-11-09 13:54:59', NULL),
	(354, 'Foto_Multipla/PRVxLEZa4Rvt52xJhO6KNz4zzkrRdSDqAhViFZwE.jpg', 175, NULL, NULL, NULL, '2023-11-09 13:54:59', '2023-11-09 13:54:59', NULL),
	(355, 'Foto_Multipla/ttUzdAOFZMSjvNdJuNG3pym8PxmtIcLRA85pcRKy.jpg', 176, NULL, NULL, NULL, '2023-12-10 13:31:44', '2023-12-10 13:31:44', NULL),
	(356, 'Foto_Multipla/aXBxOKG4YzUT9jbcudj0TYiLeXFMDFz7j7C952S3.jpg', 176, NULL, NULL, NULL, '2023-12-10 13:31:44', '2023-12-10 13:31:44', NULL),
	(357, 'Foto_Multipla/C2BxUXT0e5EHdIJsWtjOowGUGoLFxEgyGbkBy0xs.jpg', 176, NULL, NULL, NULL, '2023-12-10 13:31:44', '2023-12-10 13:31:44', NULL),
	(358, 'Foto_Multipla/98jsmFs258gH58iGPCdqnZhezCfAtiJTt96YEnDE.jpg', 176, NULL, NULL, NULL, '2023-12-10 13:31:44', '2023-12-10 13:31:44', NULL),
	(359, 'Foto_Multipla/X5XuZN7XeTq9rrRaOYh0jtH5AL5GJRGDsKxl9Se8.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(360, 'Foto_Multipla/bsjpYZpKg2awdllK0kyqEVYojgf9wwmHNakPnpBv.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(361, 'Foto_Multipla/NJXEkpUNEivGb0m7Xnqe2V8LYWd5FgtZGNfdwgBr.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(362, 'Foto_Multipla/sYgA2QMb5YGtN447j3fcPvfCZ1EktSSqAcp9o0j5.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(363, 'Foto_Multipla/75Z8zTBp3T09IRekLim6mIMkvRapa6ratS78gZLh.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(364, 'Foto_Multipla/UCvQJKjvMMcuuxcSoXFgvbs5dQ5dzEkPw1gh6sAF.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(365, 'Foto_Multipla/GLfRg33UKj76dO8GjIGsGFWSgRGM1gDWbK5LthJz.jpg', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(366, 'Foto_Multipla/NYICAN04jThmybCwUxNcL6bjnKeFh4z7EqzXeci7.gif', 177, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:10:21', NULL),
	(367, 'Foto_Multipla/AFsXeOjMqCWHI3uLwL0HxWirvX7trvIreFlCJrfr.jpg', 178, NULL, NULL, NULL, '2024-02-01 14:44:38', '2024-02-01 14:44:38', NULL),
	(368, 'Foto_Multipla/q756yowT3Ff6xRlfM9crPnLS2vS9tFPJaa47YnOR.jpg', 178, NULL, NULL, NULL, '2024-02-01 14:44:38', '2024-02-01 14:44:38', NULL),
	(369, 'Foto_Multipla/Nm96kKyEPsSbKa9B5zxWJjBMqSxr9I3zOkQiRCSx.jpg', 178, NULL, NULL, NULL, '2024-02-01 14:44:38', '2024-02-01 14:44:38', NULL);

-- A despejar estrutura para tabela bd_arrendaki.imobiliaria
DROP TABLE IF EXISTS `imobiliaria`;
CREATE TABLE IF NOT EXISTS `imobiliaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nif` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `criado_por` int DEFAULT NULL,
  `apagado_por` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_imobiliaria_imobiliaria` (`criado_por`),
  CONSTRAINT `FK_imobiliaria_imobiliaria` FOREIGN KEY (`criado_por`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.imobiliaria: ~4 rows (aproximadamente)
DELETE FROM `imobiliaria`;
INSERT INTO `imobiliaria` (`id`, `descricao`, `designacao`, `nif`, `criado_por`, `apagado_por`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, NULL, 'AAA', '333333333333', NULL, NULL, '2023-11-07 17:48:13', '2023-11-07 17:48:13', NULL),
	(2, NULL, 'Imooliveira', '0000000000', NULL, NULL, '2023-12-10 20:40:38', '2023-12-10 20:40:38', NULL),
	(3, NULL, 'KindaHome', '50000000', NULL, NULL, '2023-12-10 20:41:33', '2023-12-10 20:41:33', NULL),
	(4, NULL, 'ImoBeto', '55888888', NULL, NULL, '2023-12-10 20:43:06', '2023-12-10 20:43:06', NULL);

-- A despejar estrutura para tabela bd_arrendaki.imoveis
DROP TABLE IF EXISTS `imoveis`;
CREATE TABLE IF NOT EXISTS `imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codigo_imovel` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `descricao` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `preco` int DEFAULT NULL,
  `tempo_arrendar` int DEFAULT NULL,
  `lote` int DEFAULT NULL,
  `estado_imoveis_id` int DEFAULT '3',
  `data_contrato` date DEFAULT NULL,
  `tipologia_imoveis_id` int DEFAULT NULL,
  `categoria_imoveis_id` int DEFAULT NULL,
  `publicado_por` int DEFAULT NULL,
  `tipo_documentacoes_id` int DEFAULT NULL,
  `condicao_imoveis_id` int DEFAULT NULL,
  `mobiliado_id` int DEFAULT NULL,
  `tanqueagua` int DEFAULT NULL,
  `regeitado_por` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rua_bairro` varchar(250) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `provincia_id` int DEFAULT NULL,
  `foto_principal` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `municipio_id` int DEFAULT NULL,
  `quantidade_prestacoes` int DEFAULT NULL,
  `data_contrato_fim` date DEFAULT NULL,
  `mobiliado` enum('SIM','NAO') COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_imoveis_categoria_imoveis` (`categoria_imoveis_id`),
  KEY `FK_imoveis_tipologia_imoveis` (`tipologia_imoveis_id`),
  KEY `FK_imoveis_funcionarios` (`publicado_por`),
  KEY `FK_imoveis_condicao_imoveis` (`condicao_imoveis_id`),
  KEY `FK_imoveis_estado_imoveis` (`estado_imoveis_id`),
  KEY `FK_imoveis_municipios` (`municipio_id`),
  CONSTRAINT `FK_imoveis_categoria_imoveis` FOREIGN KEY (`categoria_imoveis_id`) REFERENCES `categoria_imoveis` (`id`),
  CONSTRAINT `FK_imoveis_condicao_imoveis` FOREIGN KEY (`condicao_imoveis_id`) REFERENCES `condicao_imoveis` (`id`),
  CONSTRAINT `FK_imoveis_estado_imoveis` FOREIGN KEY (`estado_imoveis_id`) REFERENCES `estado_imoveis` (`id`),
  CONSTRAINT `FK_imoveis_municipios` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  CONSTRAINT `FK_imoveis_tipologia_imoveis` FOREIGN KEY (`tipologia_imoveis_id`) REFERENCES `tipologia_imoveis` (`id`),
  CONSTRAINT `FK_imoveis_users` FOREIGN KEY (`publicado_por`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- A despejar dados para tabela bd_arrendaki.imoveis: ~13 rows (aproximadamente)
DELETE FROM `imoveis`;
INSERT INTO `imoveis` (`id`, `designacao`, `codigo_imovel`, `descricao`, `preco`, `tempo_arrendar`, `lote`, `estado_imoveis_id`, `data_contrato`, `tipologia_imoveis_id`, `categoria_imoveis_id`, `publicado_por`, `tipo_documentacoes_id`, `condicao_imoveis_id`, `mobiliado_id`, `tanqueagua`, `regeitado_por`, `created_at`, `updated_at`, `deleted_at`, `rua_bairro`, `provincia_id`, `foto_principal`, `municipio_id`, `quantidade_prestacoes`, `data_contrato_fim`, `mobiliado`) VALUES
	(165, 'Casa nova', 'KBC-165', 'Casa nova', 896523, NULL, NULL, 1, NULL, NULL, 2, 482, NULL, 1, NULL, NULL, NULL, '2023-10-09 10:51:55', '2023-11-06 20:06:02', '2023-11-09 09:59:54', NULL, 7, 'Foto_principal/x7CUPnNqQMCGItOKLr22LxDLhCrvIyXJVvIOY2w8.jpg', 7, NULL, NULL, NULL),
	(166, 'casa 2', 'KBC-166', 'eeeeeeeeeeeeeeeeee', 10000, NULL, NULL, 3, NULL, 7, 2, 482, NULL, 1, NULL, 1, NULL, '2023-10-31 15:54:37', '2023-10-31 16:44:51', NULL, NULL, 1, 'Foto_principal/NMMvITGA1R7sAAoKCOfXIYT8aNAuKmcFby0v7Slw.png', 10, NULL, NULL, 'SIM'),
	(167, 'casa 3', 'KBC-167', 'eeeeeeeeeeeeeeeeee', 100000000, NULL, NULL, 1, NULL, 6, 1, 482, NULL, 3, NULL, 1, NULL, '2023-10-31 16:16:46', '2023-11-01 16:06:47', NULL, NULL, 1, 'Foto_principal/hBHjPuM4DHiHAvMypiiicmVP93eATYn3RPzauU4p.jpg', 5, NULL, NULL, 'SIM'),
	(168, 'casa 4', 'KBC-168', 'eeeeeeeeee', 2300000, NULL, NULL, 7, '2024-02-10', 2, 2, 482, NULL, 1, NULL, 1, NULL, '2023-10-31 16:21:42', '2024-02-03 09:20:18', NULL, NULL, 1, 'Foto_principal/PXPva76jdgvKvYzjmdRXvbO0LRmxU3VcipzSIT3C.jpg', 7, NULL, NULL, 'NAO'),
	(169, 'casa 5', 'KBC-169', 'wwwwwwww', 2300000, NULL, NULL, 7, '2024-02-23', 3, 2, 482, NULL, 2, NULL, NULL, NULL, '2023-10-31 16:24:27', '2024-02-02 14:45:04', NULL, NULL, 1, 'Foto_principal/TGsLDvnc4Y4kxhRfcckyAPIhX8PC4TiXcU5K6mpw.jpg', 8, NULL, NULL, 'SIM'),
	(170, 'edddddddd', 'KBC-170', 'edddddddddddddddd', 300000, NULL, NULL, 1, NULL, 3, NULL, 482, NULL, 1, NULL, NULL, NULL, '2023-10-31 16:38:37', '2023-11-06 20:16:46', NULL, NULL, 1, 'Foto_principal/hBHjPuM4DHiHAvMypiiicmVP93eATYn3RPzauU4p.jpg', 8, NULL, NULL, 'NAO'),
	(171, 'Casa nova1', 'KBC-171', 'Casa nova1', 2300000, NULL, NULL, 8, NULL, 7, NULL, 482, NULL, 3, NULL, NULL, NULL, '2023-10-31 16:42:43', '2023-11-01 14:56:07', NULL, NULL, 3, 'Foto_principal/hBHjPuM4DHiHAvMypiiicmVP93eATYn3RPzauU4p.jpg', 9, NULL, NULL, 'SIM'),
	(173, 'arrendar', 'KBC-173', 'arrendar', 1000000, NULL, NULL, 1, NULL, 6, 1, 482, NULL, 2, NULL, 1, NULL, '2023-11-08 15:57:01', '2023-12-10 08:46:09', '2023-12-10 08:46:09', 'nova', 1, 'Foto_principal/4Wi112GTlXtPRio0iNeakwQEEUzYGAerAimjdWIN.jpg', 6, NULL, NULL, NULL),
	(174, '2 quartos 1 cozinha duas salas', 'KBC-174', '2 quartos 1 cozinha duas salas', 350000, NULL, NULL, 1, NULL, 2, 2, 482, NULL, 1, NULL, NULL, NULL, '2023-11-09 09:11:44', '2023-11-09 10:35:50', '2024-01-26 10:30:46', NULL, 1, 'Foto_principal/mhMRFV71TyhG8BWyB1e8bjU5wh9SrgdZ8Tn84giQ.jpg', 9, NULL, NULL, NULL),
	(175, 'Uma casa com dois quartos', 'KBC-175', 'Uma casa com dois quartos', 400000, NULL, NULL, 3, NULL, 6, 1, 482, NULL, 1, NULL, 1, NULL, '2023-11-09 13:54:59', '2023-12-10 07:13:18', '2023-12-10 07:13:18', NULL, 1, 'Foto_principal/k5FdpRZKr0c4xaYs1Dny9j8CXrqxaF9zQdhk8uG0.jpg', 3, NULL, NULL, NULL),
	(176, 'venda', 'KBC-176', 'venda', 20000, NULL, NULL, 7, NULL, 7, 1, 482, NULL, 1, NULL, NULL, NULL, '2023-12-10 13:31:44', '2023-12-10 13:31:44', '2024-01-26 15:34:16', '12 de julho', 1, 'Foto_principal/AEl8o1swch9SWi2VO0cxMrrQ2kVXtWWn7iLmqZ8k.jpg', 3, NULL, NULL, NULL),
	(177, '1 quarto\r\n2 sala\r\n3 cozinhas', 'KBC-177', '1 quarto\r\n2 sala\r\n3 cozinhas', 89500000, NULL, NULL, 1, NULL, 2, 2, 482, NULL, NULL, NULL, NULL, NULL, '2024-02-01 14:10:21', '2024-02-01 14:53:19', NULL, 'Luanda benguela bie', 1, 'Foto_principal/sEQDf7qQyFZl5gWsrjliWmNKYZO1hzDi09SQZvLN.jpg', 3, NULL, NULL, 'SIM'),
	(178, '1 quarto só mesmo', 'KBC-178', '1 quarto só mesmo', 78450000, NULL, NULL, 2, NULL, 12, 3, 482, NULL, NULL, NULL, NULL, NULL, '2024-02-01 14:44:38', '2024-02-01 14:53:24', NULL, 'Ingombotas', 1, 'Foto_principal/LuDmkqQm7iWNC5EN4iFPvvj9E04kkKHG3CsL0aXw.jpg', 4, NULL, NULL, 'SIM');

-- A despejar estrutura para tabela bd_arrendaki.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.migrations: ~2 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2023_09_28_134219_create_permission_tables', 1);

-- A despejar estrutura para tabela bd_arrendaki.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.model_has_permissions: ~0 rows (aproximadamente)
DELETE FROM `model_has_permissions`;

-- A despejar estrutura para tabela bd_arrendaki.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.model_has_roles: ~34 rows (aproximadamente)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(3, 'App\\Models\\User', 406),
	(3, 'App\\Models\\User', 418),
	(1, 'App\\Models\\User', 419),
	(2, 'App\\Models\\User', 438),
	(2, 'App\\Models\\User', 440),
	(2, 'App\\Models\\User', 441),
	(3, 'App\\Models\\User', 442),
	(4, 'App\\Models\\User', 443),
	(2, 'App\\Models\\User', 444),
	(3, 'App\\Models\\User', 445),
	(2, 'App\\Models\\User', 446),
	(6, 'App\\Models\\User', 456),
	(6, 'App\\Models\\User', 457),
	(6, 'App\\Models\\User', 458),
	(6, 'App\\Models\\User', 459),
	(6, 'App\\Models\\User', 460),
	(6, 'App\\Models\\User', 461),
	(6, 'App\\Models\\User', 462),
	(1, 'App\\Models\\User', 464),
	(1, 'App\\Models\\User', 465),
	(2, 'App\\Models\\User', 466),
	(1, 'App\\Models\\User', 467),
	(1, 'App\\Models\\User', 468),
	(3, 'App\\Models\\User', 469),
	(3, 'App\\Models\\User', 470),
	(3, 'App\\Models\\User', 471),
	(4, 'App\\Models\\User', 472),
	(2, 'App\\Models\\User', 473),
	(4, 'App\\Models\\User', 474),
	(5, 'App\\Models\\User', 475),
	(2, 'App\\Models\\User', 476),
	(1, 'App\\Models\\User', 480),
	(1, 'App\\Models\\User', 481),
	(3, 'App\\Models\\User', 482),
	(2, 'App\\Models\\User', 483);

-- A despejar estrutura para tabela bd_arrendaki.municipios
DROP TABLE IF EXISTS `municipios`;
CREATE TABLE IF NOT EXISTS `municipios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `provincia_id` int DEFAULT NULL,
  `valor_entrega` double NOT NULL DEFAULT '5000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_municipios_provincia_id` (`provincia_id`) USING BTREE,
  CONSTRAINT `FK_municipios_provincias` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.municipios: ~17 rows (aproximadamente)
DELETE FROM `municipios`;
INSERT INTO `municipios` (`id`, `designacao`, `provincia_id`, `valor_entrega`, `created_at`, `updated_at`, `deleted_at`, `status_id`) VALUES
	(1, 'Icolo-e-Bengo', 1, 5000, '2023-09-01 15:23:51', '2023-12-10 20:00:04', NULL, 1),
	(2, 'Luanda', 1, 4000, '2023-09-01 15:24:42', '2023-12-10 20:00:14', NULL, 1),
	(3, 'Quiçama', 1, 3000, '2023-09-01 15:24:49', '2023-12-10 20:00:18', NULL, 1),
	(4, 'Cacuaco', 1, 2000, '2023-09-01 15:24:56', '2023-12-10 20:00:21', NULL, 1),
	(5, 'Cazenga', 1, 1000, '2023-09-01 15:25:04', '2023-12-10 20:00:25', NULL, 1),
	(6, 'Viana', 1, 6000, '2023-09-01 15:25:11', '2023-12-10 20:00:28', NULL, 1),
	(7, 'Belas', 1, 0, '2023-09-01 15:25:18', '2023-12-10 20:00:31', NULL, 1),
	(8, 'Kilamba Kiaxi', 1, 0, '2023-09-01 15:25:27', '2023-12-10 20:00:35', NULL, 1),
	(9, 'Talatona', 1, 7000, '2023-09-01 15:25:34', '2023-12-10 20:00:38', NULL, 1),
	(10, 'Caxito', 5, 5000, '2023-12-10 19:56:23', '2023-12-10 20:00:42', NULL, 1),
	(11, 'Muçamedes', 17, 5000, '2023-12-10 20:01:01', NULL, NULL, 1),
	(12, 'Uíge', 3, 5000, '2023-12-10 20:01:17', NULL, NULL, 1),
	(13, 'Soyo', 2, 5000, '2023-12-10 20:01:25', '2023-12-10 20:01:30', NULL, 1),
	(14, 'Sumbe', 14, 5000, '2023-12-10 20:01:44', '2023-12-10 20:01:53', NULL, 1),
	(15, 'Lubango', 16, 5000, '2023-12-10 20:02:10', '2023-12-10 20:02:14', NULL, 1),
	(16, 'Huambo', 12, 5000, '2023-12-10 20:02:27', NULL, NULL, 1),
	(17, 'Ondjiva', 18, 5000, '2023-12-10 20:02:40', '2023-12-10 20:02:45', NULL, 1);

-- A despejar estrutura para tabela bd_arrendaki.operacao_imoveis
DROP TABLE IF EXISTS `operacao_imoveis`;
CREATE TABLE IF NOT EXISTS `operacao_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- A despejar dados para tabela bd_arrendaki.operacao_imoveis: ~4 rows (aproximadamente)
DELETE FROM `operacao_imoveis`;
INSERT INTO `operacao_imoveis` (`id`, `designacao`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Venda', '2023-09-05 15:07:56', NULL, NULL),
	(2, 'Arrendamento', '2023-09-05 15:08:05', NULL, NULL),
	(3, 'Compra', '2023-09-05 15:08:14', NULL, NULL),
	(4, 'Meio-perio', '2023-10-04 14:51:41', NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.permissions: ~10 rows (aproximadamente)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Gerir Permissões', 'web', '2023-09-28 16:10:51', NULL, NULL),
	(2, 'Gerir Anúncios', 'web', '2023-09-28 16:11:48', NULL, NULL),
	(3, 'Gerir Pedidos', 'web', '2023-09-28 16:11:49', NULL, NULL),
	(4, 'Gerir Relatórios', 'web', '2023-09-29 08:24:31', NULL, NULL),
	(5, 'Gerir Utilizador', 'web', '2023-11-06 19:41:15', NULL, NULL),
	(6, 'Gerir Pagamento', 'web', NULL, '2024-01-26 14:58:11', NULL),
	(7, 'Gerir Clientes', 'web', NULL, '2024-01-26 14:58:18', NULL),
	(8, 'Gerir Proprietarios e  Colaboradores', 'web', NULL, '2024-01-26 14:58:20', NULL),
	(9, 'Cadastrar Casa', 'web', NULL, NULL, NULL),
	(10, 'Quem Somos', 'web', NULL, NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;

-- A despejar estrutura para tabela bd_arrendaki.pessoas
DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sobre_nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_nascimento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `numero_telefone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `numero_identificacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `municipio_id` int DEFAULT NULL,
  `estado_civis_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `tipo_documentacoes_id` int DEFAULT NULL,
  `foto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `bairro` varchar(250) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pessoas_users` (`user_id`),
  KEY `FK_pessoas_estado_civis` (`estado_civis_id`),
  KEY `FK_pessoas_tipo_documentacoes` (`tipo_documentacoes_id`),
  KEY `FK_pessoas_municipios` (`municipio_id`),
  CONSTRAINT `FK_pessoas_estado_civis` FOREIGN KEY (`estado_civis_id`) REFERENCES `estado_civis` (`id`),
  CONSTRAINT `FK_pessoas_municipios` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  CONSTRAINT `FK_pessoas_tipo_documentacoes` FOREIGN KEY (`tipo_documentacoes_id`) REFERENCES `tipo_documentacoes` (`id`),
  CONSTRAINT `FK_pessoas_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- A despejar dados para tabela bd_arrendaki.pessoas: ~14 rows (aproximadamente)
DELETE FROM `pessoas`;
INSERT INTO `pessoas` (`id`, `nome`, `sobre_nome`, `data_nascimento`, `numero_telefone`, `numero_identificacao`, `email`, `municipio_id`, `estado_civis_id`, `user_id`, `tipo_documentacoes_id`, `foto`, `created_at`, `updated_at`, `deleted_at`, `bairro`) VALUES
	(2, 'Pambaleiro A', 'Pambaleiro A', NULL, NULL, NULL, 'pambaleiroA@gmail.com', 13, NULL, 410, NULL, NULL, '2023-09-18 19:27:27', '2023-09-18 19:27:27', NULL, 'BO'),
	(5, 'Zhacarias Zhacarias milonga', 'Zhacarias Zhacarias milonga', NULL, '244926315250', '244926315250', 'ga@gmail.com', 1, NULL, 419, NULL, NULL, '2023-09-27 17:27:01', '2023-12-10 20:19:56', NULL, 'BO'),
	(33, 'Administrador', 'Administrador', NULL, '983874823', '000000000LA000', 'angelfiremilonga@gmail.com', 2, NULL, 462, NULL, NULL, '2023-11-09 07:51:46', '2023-12-10 19:08:31', NULL, NULL),
	(34, 'Nataline de Carvalho', 'Nataline de Carvalho', NULL, '928812986', '006853283LA042', 'natalinebranco@gmail.com', 1, NULL, 463, NULL, NULL, '2023-11-09 07:57:57', '2023-12-09 12:33:33', NULL, NULL),
	(37, 'Dayana', 'Dayana', NULL, '922222333', NULL, NULL, NULL, NULL, 466, NULL, NULL, '2023-11-09 10:24:29', '2023-11-09 10:24:29', NULL, NULL),
	(43, 'Amiguel', 'Amiguel', NULL, '999999999', '000009987NA098', 'amiguel@gmail.com', 2, NULL, 472, NULL, NULL, '2023-12-10 04:25:53', '2023-12-10 04:56:58', NULL, NULL),
	(44, 'Esperança', 'Esperança', NULL, '944127071', '000000000LA234', 'esperança@gmail.com', 1, NULL, 473, NULL, NULL, '2023-12-10 13:16:50', '2023-12-10 13:18:52', NULL, NULL),
	(45, 'Dilson Carvalho', 'Dilson Carvalho', NULL, NULL, NULL, 'dilson@gmail.com', NULL, NULL, 474, NULL, NULL, '2023-12-10 19:55:14', '2023-12-10 19:55:14', NULL, 'BO'),
	(46, 'Matuidi Bengues', 'Matuidi Bengues', NULL, NULL, NULL, 'Matuidi@gmail.com', NULL, NULL, 475, NULL, NULL, '2023-12-10 19:56:48', '2023-12-10 19:56:48', NULL, 'KindaHome'),
	(47, 'Pedro Paxi', 'Pedro Paxi', NULL, NULL, NULL, 'paxi@gmail.com', NULL, NULL, 476, NULL, NULL, '2023-12-10 19:58:24', '2023-12-10 19:58:24', NULL, NULL),
	(48, 'Funcionario do sistema', 'Funcionario do sistema', NULL, '999999999', '0000000000LA', 'f@gmail.com', 1, NULL, 480, NULL, NULL, '2023-12-10 20:35:51', '2023-12-10 20:46:32', NULL, NULL),
	(49, 'Ngunguvele Abel', 'Ngunguvele Abel', NULL, NULL, NULL, 'ngungu@gmail.com', NULL, NULL, 481, NULL, NULL, '2023-12-10 20:39:22', '2023-12-10 20:39:22', NULL, NULL),
	(50, 'Mateus Abel', 'Ngunguvele Abel', NULL, NULL, NULL, 'ngungu@gmail.com', NULL, NULL, 418, NULL, NULL, '2023-12-10 20:39:22', '2023-12-10 20:39:22', NULL, NULL),
	(51, 'Zage Milonga', 'Zage Milonga', NULL, NULL, NULL, 'z@gmail.com', NULL, NULL, 482, NULL, NULL, '2024-01-25 23:59:39', '2024-01-25 23:59:39', NULL, NULL),
	(52, 'w', 'w', NULL, NULL, NULL, 'angelfiremilonga@gmail.com', NULL, NULL, 483, NULL, NULL, '2024-02-02 14:40:34', '2024-02-02 14:40:34', NULL, 'aangel@gmail.com');

-- A despejar estrutura para tabela bd_arrendaki.provincias
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.provincias: ~18 rows (aproximadamente)
DELETE FROM `provincias`;
INSERT INTO `provincias` (`id`, `designacao`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Luanda', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(2, 'Zaire', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(3, 'Uige', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(4, 'Cabinda', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(5, 'Bengo', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(6, 'Malanje', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(7, 'Kwanza Norte', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(8, 'Lunda Norte', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(9, 'Lunda Sul', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(10, 'Moxico', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(11, 'Bie', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(12, 'Huambo', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(13, 'Benguela', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(14, 'Kwanza Sul', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(15, 'Cuango Cubango', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(16, 'Huila', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(17, 'Namibe', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(18, 'Cunene', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL);

-- A despejar estrutura para tabela bd_arrendaki.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.roles: ~6 rows (aproximadamente)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Funcionarios', 'web', '2023-09-28 16:02:52', '2024-02-01 11:58:08', NULL),
	(2, 'Locatario', 'web', '2023-09-28 16:04:58', NULL, NULL),
	(3, 'Proprietários', 'web', '2023-09-28 16:04:59', NULL, NULL),
	(4, 'Colaborador', 'web', '2023-09-28 16:05:00', '2024-02-01 11:58:03', '2024-02-01 11:59:12'),
	(5, 'Corretor', 'web', '2023-09-28 16:05:00', '2024-02-01 11:58:04', '2024-02-01 11:59:11'),
	(6, 'Administrador', 'web', '2023-11-09 07:52:49', NULL, '2024-02-02 14:47:12');

-- A despejar estrutura para tabela bd_arrendaki.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela bd_arrendaki.role_has_permissions: ~21 rows (aproximadamente)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(5, 1),
	(9, 1),
	(10, 1),
	(3, 2),
	(2, 3),
	(9, 3),
	(2, 4),
	(3, 4),
	(4, 4),
	(2, 5),
	(3, 5),
	(1, 6),
	(2, 6),
	(3, 6),
	(4, 6),
	(5, 6),
	(6, 6),
	(7, 6),
	(8, 6);

-- A despejar estrutura para tabela bd_arrendaki.solicitar_visitas
DROP TABLE IF EXISTS `solicitar_visitas`;
CREATE TABLE IF NOT EXISTS `solicitar_visitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `actividade_imoveis_id` int DEFAULT NULL,
  `imoveis_id` int DEFAULT NULL,
  `funcionario_id` int DEFAULT NULL,
  `user_marca_visita` int DEFAULT NULL,
  `data_visita` date DEFAULT NULL,
  `hora_visita` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `estado_imoveis_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_solicitar_visitas_actividade_imoveis` (`actividade_imoveis_id`),
  KEY `FK_solicitar_visitas_imoveis` (`imoveis_id`),
  KEY `FK_solicitar_visitas_users` (`user_marca_visita`) USING BTREE,
  KEY `FK_solicitar_visitas_funcionarios` (`funcionario_id`) USING BTREE,
  CONSTRAINT `FK_solicitar_visitas_actividade_imoveis` FOREIGN KEY (`actividade_imoveis_id`) REFERENCES `actividade_imoveis` (`id`),
  CONSTRAINT `FK_solicitar_visitas_funcionarios` FOREIGN KEY (`funcionario_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_solicitar_visitas_imoveis` FOREIGN KEY (`imoveis_id`) REFERENCES `imoveis` (`id`),
  CONSTRAINT `FK_solicitar_visitas_users` FOREIGN KEY (`user_marca_visita`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.solicitar_visitas: ~2 rows (aproximadamente)
DELETE FROM `solicitar_visitas`;
INSERT INTO `solicitar_visitas` (`id`, `designacao`, `actividade_imoveis_id`, `imoveis_id`, `funcionario_id`, `user_marca_visita`, `data_visita`, `hora_visita`, `created_at`, `updated_at`, `deleted_at`, `estado_imoveis_id`) VALUES
	(48, NULL, 53, 167, NULL, 466, '2023-12-12', '11:20:00', '2023-12-10 19:59:12', '2023-12-10 19:59:12', NULL, 4),
	(49, NULL, 56, 170, NULL, 476, '2023-12-20', '13:30:00', '2023-12-10 19:59:52', '2023-12-10 19:59:52', NULL, 4);

-- A despejar estrutura para tabela bd_arrendaki.tipologia_imoveis
DROP TABLE IF EXISTS `tipologia_imoveis`;
CREATE TABLE IF NOT EXISTS `tipologia_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo_imoveis_id` int DEFAULT NULL,
  `criado_por` int DEFAULT NULL,
  `apagado_por` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tipologia_imoveis_tipo_imoveis` (`tipo_imoveis_id`),
  CONSTRAINT `FK_tipologia_imoveis_tipo_imoveis` FOREIGN KEY (`tipo_imoveis_id`) REFERENCES `tipo_imoveis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- A despejar dados para tabela bd_arrendaki.tipologia_imoveis: ~12 rows (aproximadamente)
DELETE FROM `tipologia_imoveis`;
INSERT INTO `tipologia_imoveis` (`id`, `descricao`, `designacao`, `tipo_imoveis_id`, `criado_por`, `apagado_por`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'T1', 'T1', 2, NULL, NULL, NULL, NULL, NULL),
	(2, 'T1', 'T2', 2, NULL, NULL, NULL, NULL, NULL),
	(3, 'T1', 'T3', 2, NULL, NULL, NULL, NULL, NULL),
	(4, 'T1', 'T4', 2, NULL, NULL, NULL, NULL, NULL),
	(5, 'T1', 'T5', 2, NULL, NULL, NULL, NULL, NULL),
	(6, 'V1', 'V1', 1, NULL, NULL, NULL, NULL, NULL),
	(7, 'T1', 'V2', 1, NULL, NULL, NULL, NULL, NULL),
	(8, 'T1', 'V3', 1, NULL, NULL, NULL, NULL, NULL),
	(9, 'T1', 'V4', 1, NULL, NULL, NULL, NULL, NULL),
	(10, 'T1', 'V5', 1, NULL, NULL, NULL, NULL, NULL),
	(11, 'Moradia', 'Moradia', NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'Um quarto e sala', 'T0', 3, NULL, NULL, NULL, NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.tipo_documentacoes
DROP TABLE IF EXISTS `tipo_documentacoes`;
CREATE TABLE IF NOT EXISTS `tipo_documentacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `criado_por` bigint DEFAULT NULL,
  `apagado_por` bigint DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  `deleted_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.tipo_documentacoes: ~2 rows (aproximadamente)
DELETE FROM `tipo_documentacoes`;
INSERT INTO `tipo_documentacoes` (`id`, `descricao`, `designacao`, `criado_por`, `apagado_por`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Titulo de propriedade', 'propriedade', NULL, NULL, NULL, NULL, NULL),
	(2, 'Crockis', NULL, NULL, NULL, NULL, NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.tipo_imoveis
DROP TABLE IF EXISTS `tipo_imoveis`;
CREATE TABLE IF NOT EXISTS `tipo_imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `criado_por` int DEFAULT NULL,
  `apagado_por` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  `tipo_imovel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.tipo_imoveis: ~7 rows (aproximadamente)
DELETE FROM `tipo_imoveis`;
INSERT INTO `tipo_imoveis` (`id`, `designacao`, `descricao`, `criado_por`, `apagado_por`, `created_at`, `updated_at`, `deleted_at`, `tipo_imovel_id`) VALUES
	(1, 'Vivenda', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Apartamento', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Quartos', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Quintal Comum', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Casa Geminada', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Sobrado', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'bangalô ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- A despejar estrutura para tabela bd_arrendaki.tipo_users
DROP TABLE IF EXISTS `tipo_users`;
CREATE TABLE IF NOT EXISTS `tipo_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designacao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.tipo_users: ~6 rows (aproximadamente)
DELETE FROM `tipo_users`;
INSERT INTO `tipo_users` (`id`, `designacao`, `descricao`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Funcionarios', 'Funcionarios', '2023-05-07 19:57:41', NULL, NULL),
	(2, 'Locatario', 'Locatario', '2023-05-07 19:57:56', NULL, NULL),
	(3, 'Proprietários', 'Proprietários', '2023-05-07 19:58:16', NULL, NULL),
	(4, 'Colaborador', 'Colaborador', '2023-09-16 04:08:08', NULL, '2024-02-01 14:58:40'),
	(5, 'Corretor', 'Corretor', '2023-09-16 04:08:21', '2024-01-30 15:45:43', '2024-01-30 15:45:45'),
	(6, 'Administrador', 'Administrador', '2023-11-09 07:50:17', NULL, '2024-02-02 14:50:42');

-- A despejar estrutura para tabela bd_arrendaki.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `telefone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo_user_id` int DEFAULT NULL,
  `username` varchar(450) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_tipo_users` (`tipo_user_id`) USING BTREE,
  CONSTRAINT `FK_users_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela bd_arrendaki.users: ~19 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `lastName`, `telefone`, `email`, `tipo_user_id`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `avatar`) VALUES
	(410, 'Pambaleiro A', NULL, NULL, 'pambaleiroA@gmail.com', 4, NULL, '2023-09-18 21:27:27', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-09-18 19:27:27', '2023-09-18 19:27:27', NULL, NULL),
	(418, 'Mateus Abel', NULL, '998443965', NULL, 3, NULL, '2023-09-19 22:57:15', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-09-19 20:57:15', '2023-09-19 20:57:15', NULL, NULL),
	(419, 'Zhacarias Zhacarias milonga', NULL, '244926315250', 'ga@gmail.com', 1, NULL, '2023-09-27 19:27:01', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-09-27 17:27:01', '2023-12-10 20:19:56', NULL, NULL),
	(442, 'proprieta', NULL, '966666666', 'proprietario@gmail.com', 3, NULL, '2023-11-01 10:11:00', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-01 09:11:00', '2023-11-06 17:38:08', NULL, NULL),
	(443, 'Nataline Branco', NULL, '999999999', 'natali@gmail.com', 4, NULL, '2023-11-06 19:48:14', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-06 18:48:14', '2023-11-08 20:50:41', NULL, NULL),
	(445, 'margarida', NULL, '937632031', 'margaridaandre034@gmail.com', 3, NULL, '2023-11-08 16:41:45', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-08 15:41:45', '2023-12-10 08:46:09', '2023-12-10 08:46:09', NULL),
	(462, 'Administrador', NULL, '983874823', 'angelfiremilonga@gmail.com', 6, NULL, '2023-11-09 08:51:46', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-09 07:51:46', '2023-12-10 19:08:31', NULL, NULL),
	(463, 'Nataline de Carvalho', NULL, '928812986', 'natalinebranco@gmail.com', 6, NULL, '2023-11-09 08:57:57', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-09 07:57:57', '2023-12-09 12:44:47', NULL, NULL),
	(466, 'Dayana', NULL, '922222333', NULL, 2, NULL, '2023-11-09 11:24:29', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-09 10:24:29', '2023-11-09 10:24:29', NULL, NULL),
	(469, 'Bilson', NULL, '926548765', 'bilsonjoao87@gmail.com', 2, NULL, '2023-11-09 14:50:59', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-11-09 13:50:59', '2023-12-10 07:16:23', '2023-12-10 07:16:23', NULL),
	(472, 'Amiguel', NULL, '999999999', 'amiguel@gmail.com', 4, NULL, '2023-12-10 05:25:53', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 04:25:53', '2023-12-10 05:43:52', NULL, NULL),
	(473, 'Esperança', NULL, '944127071', 'esperança@gmail.com', 2, NULL, '2023-12-10 14:16:50', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 13:16:50', '2023-12-10 19:44:30', NULL, NULL),
	(474, 'Dilson Carvalho', NULL, NULL, 'dilson@gmail.com', 4, NULL, '2023-12-10 20:55:14', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 19:55:14', '2023-12-10 19:55:14', NULL, NULL),
	(475, 'Matuidi Bengues', NULL, NULL, 'Matuidi@gmail.com', 5, NULL, '2023-12-10 20:56:48', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 19:56:48', '2023-12-10 19:56:48', NULL, NULL),
	(476, 'Pedro Paxi', NULL, NULL, 'paxi@gmail.com', 2, NULL, '2023-12-10 20:58:24', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 19:58:24', '2023-12-10 19:58:24', NULL, NULL),
	(480, 'Funcionario do sistema', NULL, '999999999', 'f@gmail.com', 1, NULL, '2023-12-10 21:35:51', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 20:35:51', '2023-12-10 20:46:32', NULL, NULL),
	(481, 'Ngunguvele Abel', NULL, '980000000', 'ngungu@gmail.com', 1, NULL, '2023-12-10 21:39:22', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2023-12-10 20:39:22', '2023-12-10 20:39:22', NULL, NULL),
	(482, 'Zage Milonga', NULL, NULL, 'z@gmail.com', 3, NULL, '2024-01-26 00:59:38', '$2y$10$cdvTClq/XPDnkC9ZabeKhuUgPIOrtyHBL3YLZPEvKoiTWXMuS./1.', NULL, '2024-01-25 23:59:38', '2024-01-25 23:59:38', NULL, NULL),
	(483, 'w', NULL, NULL, 'angelfiremilonga@gmail.com', 2, 'w', '2024-02-02 15:40:34', '$2y$10$79v6HqIm/hPCcLMi8TYAJebB6H5FVsRfU4A5rD.ZWExoJkRoXlYUy', NULL, '2024-02-02 14:40:34', '2024-02-02 14:40:34', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
