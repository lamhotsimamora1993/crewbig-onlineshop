-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.2 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_crewbig
CREATE DATABASE IF NOT EXISTS `db_crewbig` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_crewbig`;

-- Dumping structure for table db_crewbig.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.auth_group_permissions: ~0 rows (approximately)

-- Dumping structure for table db_crewbig.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.auth_permission: ~36 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add customers', 7, 'add_customers'),
	(26, 'Can change customers', 7, 'change_customers'),
	(27, 'Can delete customers', 7, 'delete_customers'),
	(28, 'Can view customers', 7, 'view_customers'),
	(29, 'Can add employee', 8, 'add_employee'),
	(30, 'Can change employee', 8, 'change_employee'),
	(31, 'Can delete employee', 8, 'delete_employee'),
	(32, 'Can view employee', 8, 'view_employee'),
	(33, 'Can add products', 9, 'add_products'),
	(34, 'Can change products', 9, 'change_products'),
	(35, 'Can delete products', 9, 'delete_products'),
	(36, 'Can view products', 9, 'view_products');

-- Dumping structure for table db_crewbig.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.auth_user: ~0 rows (approximately)

-- Dumping structure for table db_crewbig.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.auth_user_groups: ~0 rows (approximately)

-- Dumping structure for table db_crewbig.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.auth_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table db_crewbig.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.cart: ~0 rows (approximately)

-- Dumping structure for table db_crewbig.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `hp` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.customer: ~2 rows (approximately)
INSERT INTO `customer` (`id`, `username`, `password`, `tgl_lahir`, `name`, `address`, `hp`) VALUES
	(5, 'lamhotsimamora', 'Qwezxc12345', '1993-12-28', 'Lamhot Simamora', 'Perumahan Lazio E12 Buluran Kenali Jambi', 6281399453242),
	(6, 'elfridasimamora', '12345', '1996-11-25', 'Elfrida Simamora', 'Perumahan Lazio E12 Buluran Kenali Jambi', 681212341234);

-- Dumping structure for table db_crewbig.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.django_admin_log: ~0 rows (approximately)

-- Dumping structure for table db_crewbig.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.django_content_type: ~9 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'customer', 'customers'),
	(8, 'employee', 'employee'),
	(9, 'products', 'products'),
	(6, 'sessions', 'session');

-- Dumping structure for table db_crewbig.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.django_migrations: ~23 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-08-17 02:41:09.313774'),
	(2, 'auth', '0001_initial', '2024-08-17 02:41:14.240758'),
	(3, 'admin', '0001_initial', '2024-08-17 02:41:15.300689'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-17 02:41:15.300689'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-17 02:41:15.347111'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-17 02:41:15.880030'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-17 02:41:16.419374'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-08-17 02:41:16.477567'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-08-17 02:41:16.506245'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-08-17 02:41:16.736550'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-08-17 02:41:16.752737'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-17 02:41:16.795803'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-08-17 02:41:17.334301'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-17 02:41:17.722967'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-08-17 02:41:17.766887'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-08-17 02:41:17.795095'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-17 02:41:18.222857'),
	(18, 'sessions', '0001_initial', '2024-08-17 02:41:18.485380'),
	(19, 'customer', '0001_initial', '2024-08-17 05:43:08.926784'),
	(20, 'employee', '0001_initial', '2024-08-17 05:43:08.949999'),
	(21, 'products', '0001_initial', '2024-08-17 05:43:08.976339'),
	(22, 'customer', '0002_alter_customers_hp', '2024-08-17 09:46:20.551588'),
	(23, 'customer', '0003_alter_customers_hp', '2024-08-17 09:46:20.603769');

-- Dumping structure for table db_crewbig.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.django_session: ~11 rows (approximately)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('10zdmvdjn2o8bun65q1n33zjj17dp08v', 'e30:1sfLS9:ASeTABFRt1dpTypEb28U8Wv5e1FryO-8e2rl80enxfU', '2024-08-31 15:34:53.371468'),
	('7v36gkxrh1l3rccjnojyoe3sgb4nsgwt', 'e30:1sfLSx:vbNFeMOdU7uU11hw8B6PihsW6aRv5pXa57yNPsMdb8c', '2024-08-31 15:35:43.881091'),
	('cku61e1w8be6fm6fur79u0n8op3yrck8', 'e30:1sfLWU:mottcaEh11HjWuAAeB62buvECNNifoL1P7xze3miWHE', '2024-08-31 15:39:22.977896'),
	('gk4xq5s6yokg0rhk5wbbglneesxw0ct8', 'e30:1sfLSc:xhGzcUUuQKCAYlGgSjMMaUeyjLk7zOLfI9ozvygHVo0', '2024-08-31 15:35:22.805985'),
	('gog9ec5bq86pavehoak3tldpjsosvkbn', 'e30:1sfLVu:iU5nEnKbQ4Z1qUlT9H9oNqO2fRZhcC7q3qEoLPUzQUc', '2024-08-31 15:38:46.987759'),
	('ib2yr1i6z4kie1p2ix6eo6zocood0qxn', 'e30:1sfLUt:I5pdrQNBMBYa9jibdZbxyQpghGDxMZPc0xLIkmg8cxM', '2024-08-31 15:37:43.922702'),
	('j1tptkjlkj6h74yhuotwofyx75fmblfx', 'eyJkYXRhX2N1c3RvbWVyIjpbNV19:1sgxY2:NWFiWqolUzHTPuKlZ6TRrhYsBsYprgFhgVjSCbXnMH8', '2024-09-05 02:27:38.110407'),
	('ouoy13ld2hyxvfdi2j7zaicc4s3266x1', 'e30:1sfLSa:CJ190Ax20gUyzxeAf-ucb6LQ-MQzm0QwsIdoyfPeuOM', '2024-08-31 15:35:20.417944'),
	('qp0wliocrbevu861nn9x576p5ypddh30', 'e30:1sfLX8:rDCmCJKqRjnVU8Um75PIeyEJybaezFOsnEm2DgiKL_g', '2024-08-31 15:40:02.404830'),
	('ux3jfna02uf434ejtnhhrq4hjtwgd8af', 'e30:1sfLTh:Z1VYVMvqtW1cQsFc04OlUIfEZbgOE7BbgnBZtTthdns', '2024-08-31 15:36:29.687017'),
	('vb2xy7imw69v3bqgeu26ufqtnlj48qe8', 'e30:1sfLWj:lfOIcIy37mnoPu85xmFdZm-1g41aPaTuP_jqdA6Q41c', '2024-08-31 15:39:37.128744');

-- Dumping structure for table db_crewbig.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.employee: ~3 rows (approximately)
INSERT INTO `employee` (`id`, `username`, `password`) VALUES
	(1, 'admin', 'admin'),
	(3, 'lamhot', 'lamhot'),
	(4, 'lamhot', 'lamhot');

-- Dumping structure for table db_crewbig.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `image` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.products: ~6 rows (approximately)
INSERT INTO `products` (`id`, `name`, `price`, `stock`, `image`) VALUES
	(15, 'Smartwatch Amazfit', 1500000, 98, 'f8c89c73-6168-406c-9751-ff3b7afc517d.jpg'),
	(16, 'Laptop Asus i7', 15000000, 99, '60a22c7d9e063.jpg'),
	(17, 'Xiaomi Note 12', 2500000, 99, 'gsmarena_005.jpg'),
	(18, 'Thomas Grounding', 5000000, 100, '4c265a47-c024-4305-b0ac-7d31aa3e85cf.jpg'),
	(20, 'Starlink Standard Internet Kit', 7800000, 98, 'e64d4a67-758b-4b9f-a70c-fbe92bd0021e.jpg'),
	(21, 'VGA RX 6600XT 8GB', 2300000, 98, '35a7aebc-d83d-497b-9455-40c0cb597a4c.jpg');

-- Dumping structure for table db_crewbig.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.transaction: ~6 rows (approximately)
INSERT INTO `transaction` (`id`, `customer_id`, `date`) VALUES
	(59, 5, '2024-08-22'),
	(60, 5, '2024-08-22'),
	(61, 5, '2024-08-22'),
	(62, 5, '2024-08-22'),
	(63, 6, '2024-08-22'),
	(64, 5, '2024-08-22');

-- Dumping structure for table db_crewbig.transaction_details
CREATE TABLE IF NOT EXISTS `transaction_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_crewbig.transaction_details: ~13 rows (approximately)
INSERT INTO `transaction_details` (`id`, `product_id`, `transaction_id`, `qty`, `price`, `sub_total`) VALUES
	(62, 15, 59, 1, 1500000, 1500000),
	(63, 15, 60, 1, 1500000, 1500000),
	(64, 16, 60, 1, 15000000, 15000000),
	(65, 17, 60, 1, 2500000, 2500000),
	(66, 18, 60, 1, 5000000, 5000000),
	(67, 15, 61, 1, 1500000, 1500000),
	(68, 17, 62, 1, 2500000, 2500000),
	(69, 20, 62, 1, 7800000, 7800000),
	(70, 20, 63, 1, 7800000, 7800000),
	(71, 21, 63, 1, 2300000, 2300000),
	(72, 15, 64, 1, 1500000, 1500000),
	(73, 16, 64, 1, 15000000, 15000000),
	(74, 21, 64, 1, 2300000, 2300000);

-- Dumping structure for view db_crewbig.view_cart
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_cart` (
	`id` INT(10) NOT NULL,
	`product_id` INT(10) NULL,
	`qty` INT(10) NULL,
	`customer_id` INT(10) NULL,
	`name` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`price` DOUBLE NOT NULL,
	`image` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Dumping structure for view db_crewbig.view_transaction
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_transaction` (
	`id` INT(10) NOT NULL,
	`customer_id` INT(10) NULL,
	`date` DATE NULL,
	`username` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`hp` DOUBLE NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_crewbig.view_transaction_detail
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_transaction_detail` (
	`id` INT(10) NOT NULL,
	`product_id` INT(10) NULL,
	`transaction_id` INT(10) NULL,
	`qty` INT(10) NULL,
	`price` FLOAT NULL,
	`sub_total` FLOAT NULL,
	`name` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`stock` INT(10) NOT NULL,
	`image` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_cart`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_cart` AS select `cart`.`id` AS `id`,`cart`.`product_id` AS `product_id`,`cart`.`qty` AS `qty`,`cart`.`customer_id` AS `customer_id`,`products`.`name` AS `name`,`products`.`price` AS `price`,`products`.`image` AS `image` from (`cart` join `products`) where (`products`.`id` = `cart`.`product_id`);

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_transaction`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_transaction` AS select `transaction`.`id` AS `id`,`transaction`.`customer_id` AS `customer_id`,`transaction`.`date` AS `date`,`customer`.`username` AS `username`,`customer`.`name` AS `name`,`customer`.`hp` AS `hp` from (`transaction` join `customer`) where (`transaction`.`customer_id` = `customer`.`id`);

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_transaction_detail`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_transaction_detail` AS select `transaction_details`.`id` AS `id`,`transaction_details`.`product_id` AS `product_id`,`transaction_details`.`transaction_id` AS `transaction_id`,`transaction_details`.`qty` AS `qty`,`transaction_details`.`price` AS `price`,`transaction_details`.`sub_total` AS `sub_total`,`products`.`name` AS `name`,`products`.`stock` AS `stock`,`products`.`image` AS `image` from (`transaction_details` join `products`) where (`transaction_details`.`product_id` = `products`.`id`);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
