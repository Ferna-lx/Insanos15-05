-- --------------------------------------------------------
-- Host:                         10.68.0.251
-- Versión del servidor:         5.7.21 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para 15_05_MiguelMatias
CREATE DATABASE IF NOT EXISTS `15_05_MiguelMatias` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `15_05_MiguelMatias`;

-- Volcando estructura para tabla 15_05_MiguelMatias.Clientes
CREATE TABLE IF NOT EXISTS `Clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_cliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion_cliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_cliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Clientes: ~2 rows (aproximadamente)
INSERT INTO `Clientes` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `contacto_cliente`) VALUES
	(1, 'Miguel', 'Leyton', 'Santo Tomas', '9-56789032'),
	(2, 'Matias', 'Leyton', 'Santo Tomas', '9-34567832');

-- Volcando estructura para tabla 15_05_MiguelMatias.Cuentas
CREATE TABLE IF NOT EXISTS `Cuentas` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_cuenta` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Cuentas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 15_05_MiguelMatias.Detalle_Pedidos
CREATE TABLE IF NOT EXISTS `Detalle_Pedidos` (
  `id_detallePedido` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pedido` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detalle_pedido` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_detallePedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Detalle_Pedidos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 15_05_MiguelMatias.Pedios
CREATE TABLE IF NOT EXISTS `Pedios` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pedido` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_pedido` int(11) DEFAULT NULL,
  `descripcion_pedido` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Pedios: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 15_05_MiguelMatias.Productos
CREATE TABLE IF NOT EXISTS `Productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Productos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 15_05_MiguelMatias.Sucursale
CREATE TABLE IF NOT EXISTS `Sucursale` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion_sucursal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_sucursal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Sucursale: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 15_05_MiguelMatias.Ventas
CREATE TABLE IF NOT EXISTS `Ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_detallePedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_producto` (`id_producto`),
  KEY `id_cuenta` (`id_cuenta`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_detallePedido` (`id_detallePedido`),
  CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `Productos` (`id_producto`),
  CONSTRAINT `Ventas_ibfk_3` FOREIGN KEY (`id_cuenta`) REFERENCES `Cuentas` (`id_cuenta`),
  CONSTRAINT `Ventas_ibfk_4` FOREIGN KEY (`id_sucursal`) REFERENCES `Sucursale` (`id_sucursal`),
  CONSTRAINT `Ventas_ibfk_5` FOREIGN KEY (`id_pedido`) REFERENCES `Pedios` (`id_pedido`),
  CONSTRAINT `Ventas_ibfk_6` FOREIGN KEY (`id_detallePedido`) REFERENCES `Detalle_Pedidos` (`id_detallePedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 15_05_MiguelMatias.Ventas: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
