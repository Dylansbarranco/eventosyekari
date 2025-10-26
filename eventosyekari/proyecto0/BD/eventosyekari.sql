-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2025 a las 04:15:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eventosyekari`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Identificacion` int(10) NOT NULL,
  `Nombre` int(10) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `CargaEmpresarial` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Celular` int(10) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `Clave` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Identificacion`, `Nombre`, `Apellido`, `CargaEmpresarial`, `Direccion`, `Celular`, `FechaNacimiento`, `CorreoElectronico`, `Clave`) VALUES
(333, 1, '1', '', '2', 2, '2025-10-01', '1@22', 11),
(1233456789, 1, '11', '1', '1', 1, '2025-10-01', '@', 12345678);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Identificacion` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Celular` int(10) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `Clave` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `cliente_identificacion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_evento` date DEFAULT NULL,
  `hora_evento` time DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id`, `cliente_identificacion`, `total`, `direccion`, `fecha_evento`, `hora_evento`, `telefono`, `creado_en`) VALUES
(1, '1047047', 180000.00, NULL, NULL, NULL, NULL, '2025-10-24 23:07:38'),
(2, '24444', 180000.00, NULL, NULL, NULL, NULL, '2025-10-24 23:14:18'),
(3, '', 130000.00, '', NULL, NULL, NULL, '2025-10-25 00:58:44'),
(4, 'Barranco', 170000.00, 'CALLA 46b 14-45', '2025-10-09', '00:04:00', NULL, '2025-10-25 00:59:15'),
(5, '2332445', 180000.00, 'CALLE 7B 19A -6', '2025-11-06', '21:30:00', '3162402680', '2025-10-25 01:26:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_items`
--

CREATE TABLE `orden_items` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_items`
--

INSERT INTO `orden_items` (`id`, `orden_id`, `servicio_id`, `cantidad`, `precio_unitario`) VALUES
(5, 5, 16, 1, 180000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `duracion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `descripcion` text DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `codigo`, `titulo`, `imagen`, `duracion`, `precio`, `descripcion`, `creado_en`, `actualizado_en`) VALUES
(6, 'BRINKIS5X3', 'BRINKIS 5x3', 'BRINKIS_5x3.jpg', '3 HORAS', 130000.00, 'Medidas: 5m x 3m. \r\n    2 resbaladeros. \r\n    Colores: naranja, verde, azul, amarillo. \r\n    Modelo: castillo. \r\n    Capacidad: 10 niños. \r\n    Estatura máxima: 1.30 m. \r\n    El precio incluye transporte en Cúcuta.', '2025-10-24 23:39:52', '2025-10-24 23:44:15'),
(7, 'BRINKIS5X3_V1', 'BRINKIS 5x3', 'BRINKIS_5x3_1.jpg', '3 HORAS', 130000.00, 'Medidas: 5m x 3m.\r\n    2 resbaladeros.\r\n    Colores: azul, rosado, verde, rojo.\r\n    Modelo: castillo.\r\n    Capacidad: 10 niños.\r\n    Estatura máxima: 1.30 m.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-24 23:46:42', NULL),
(8, 'BRINKIS5X6', 'BRINKIS 5x6', 'BRINKIS_5X6.jpg', '3 HORAS', 150000.00, 'Medidas: 5m x 6m.\r\n    3 resbaladeros.\r\n    Colores: rojo, negro, verde, azul, amarillo.\r\n    Modelo: castillo.\r\n    Capacidad: 15 niños.\r\n    Estatura máxima: 1.30 m.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:23:37', NULL),
(9, 'BRINKIS7X5', 'BRINKIS 7x5', 'BRINKIS_7x5.jpg', '3 HORAS', 160000.00, 'Medidas: 7m x 6m.\r\n    Resbaladero interno.\r\n    Colores: naranja, verde, azul, amarillo.\r\n    Capacidad: 10 niños.\r\n    Estatura máxima: 1.30 m.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:25:39', NULL),
(10, 'BRINKISBEBE', 'BRINKIS BEBÉ', 'BRINKIS_BEBE.jpg', '3 HORAS', 120000.00, 'Medidas: 3m x 3m.\r\n    Área de saltar.\r\n    Colores: verde, azul, amarillo.\r\n    Modelo: castillo.\r\n    Capacidad: 6 niños.\r\n    Estatura máxima: 1.10 m.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:27:02', NULL),
(11, 'BRINKISRESBALADERO', 'BRINKIS RESBALADERO', 'BRINKIS_RESBALADERO.jpg', '3 HORAS', 160000.00, 'Medidas: 4m x 5m.\r\n    2 resbaladeros.\r\n    Colores: verde, azul, amarillo, rojo, naranja.\r\n    Modelo: resbaladero.\r\n    Capacidad: ilimitada.\r\n    Estatura máxima: ilimitada.\r\n    Peso máximo: 80 kg.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:28:53', '2025-10-25 00:32:22'),
(12, 'BRINKISBLANCO', 'BRINKIS BLANCO', 'BRINKIS_BLANCO.jpg', '3 HORAS', 250000.00, 'Medidas: 5m x 3m.\r\n    1 resbaladero.\r\n    Colores: blanco.\r\n    Modelo: castillo.\r\n    Capacidad: 10 niños.\r\n    Estatura máxima: 1.10 m.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:30:46', NULL),
(14, 'BRINKISTRAMPOLIN', 'BRINKIS TRAMPOLIN', 'BRINKIS_TRAMPOLIN.jpg', '3 HORAS', 140000.00, 'Medidas: 3m x 3m.\r\n    Área de saltar.\r\n    Colores: negro y azul.\r\n    Modelo: circular.\r\n    Capacidad: 8 niños.\r\n    Estatura máxima: 1.50 m.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:34:25', NULL),
(15, 'CANONESPUMA', 'CAÑON DE ESPUMA', 'CAÑON_DE_ESPUMA.jpg', '1 HORA', 180000.00, 'Incluye 7 lanzamientos de espuma.\r\n    1 operador.\r\n    Jabón no dañino.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:35:46', NULL),
(16, 'PISCINA_BLANCA', 'PISCINA DE PELOTAS BLANCA', 'PISCINA_DE_PELOTAS_BLANCAS.jpg', '3 HORAS', 180000.00, 'Medidas: 3mx3m.\r\n    1 resbaladero.\r\n    Colores: blanco.\r\n    Modelo: cuadrado.\r\n    Capacidad: 7 niños.\r\n    Estatura máxima: 1.10 cm.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:37:30', '2025-10-25 00:39:37'),
(17, 'PISCINA_COLORES', 'PISCINA DE PELOTAS COLORES', 'PISCINA_DE_PELOTAS_COLORES.jpg', '3 HORAS', 180000.00, 'Medidas: 3mx3m.\r\n    1 resbaladero.\r\n    Colores: blanco.\r\n    Modelo: cuadrado.\r\n    Capacidad: 7 niños.\r\n    Estatura máxima: 1.10 cm.\r\n    El precio incluye transporte en Cúcuta.', '2025-10-25 00:39:07', NULL),
(18, 'ALGODONES_AZUCAR', 'ALGODONES DE AZÚCAR', 'ALGODON_DE_AZUCAR.jpg', '3 HORAS', 170000.00, 'Incluye 100 algodones de azúcar.\r\n    2 colores: azul y rosado.\r\n    Incluye máquina y carrito.\r\n    Incluye operador.\r\n    Servicio de entrega por 3 horas.', '2025-10-25 00:41:08', '2025-10-25 00:45:56'),
(19, 'CRISPETAS_100UND', 'CRISPETAS', 'CRISPETAS.jpg', '3 HORAS', 170000.00, 'Incluye 100 unidades (bolsa de libra).\r\n    Crispeta con sal.\r\n    Incluye máquina y carrito.\r\n    Incluye operador.\r\n    Servicio de entrega por 3 horas.', '2025-10-25 00:42:32', NULL),
(20, 'FUENTE_CHOCOLATE_100UND', 'FUENTE DE CHOCOLATE', 'FUENTE_DE_CHOCOLATE.jpg', '3 HORAS', 240000.00, 'Incluye 100 unidades con brochetas de masmellos y chocolate.\r\n    Incluye 1kg de chocolate.\r\n    Incluye fuente.\r\n    Incluye operador.\r\n    Servicio de entrega por 3 horas.', '2025-10-25 00:44:16', NULL),
(21, 'RASPADO_100UND', 'RASPADO', 'RASPADO.jpg', '3 HORAS', 170000.00, 'Incluye 100 unidades de raspados color rojo con miel y leche condensada.\r\n    Incluye máquina y carrito.\r\n    Incluye operador.\r\n    Servicio de entrega por 3 horas.', '2025-10-25 00:45:23', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Identificacion`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden_items`
--
ALTER TABLE `orden_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden_items`
--
ALTER TABLE `orden_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden_items`
--
ALTER TABLE `orden_items`
  ADD CONSTRAINT `orden_items_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orden_items_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
