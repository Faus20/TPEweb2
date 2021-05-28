-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-05-2021 a las 19:16:46
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabajo_web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `precio` float NOT NULL,
  `dias` int(11) NOT NULL,
  `detalle` text NOT NULL,
  `id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id`, `nombre`, `precio`, `dias`, `detalle`, `id_pais`) VALUES
(10, 'Iguazu', 16.709, 4, 'Vuelo + Hotel los Helechos con una noche de regalo + Traslados y excursion gratis + Cataratas Argentina', 1),
(11, 'Mendoza', 22.639, 4, 'Vuelo + Hotel + Traslados + Excursion  a bodegas + Excursion Alta montaña', 1),
(12, 'Bariloche', 26.373, 3, 'Aéreo, 3 noches de alojamiento según régimen de comidas indicado y traslados.', 1),
(13, 'Buzios', 70.148, 8, 'Aéreo , Alojamiento por 7 noches en Búzios según régimen de comidas indicado y Asistencia Médica. ', 6),
(14, 'Costa do Sauípe', 174.921, 8, 'Aéreo, 7 Noches de alojamiento en Costa do Sauípe con All Inclusive y Asistencia Médica ', 6),
(15, 'Miami', 203.795, 7, 'Aéreos & 6 Noches de Alojamiento en Miami según regimen de comidas indicado. ', 9),
(16, 'Nueva York', 126.664, 3, '4 Noches de Alojamiento en Nueva York, Traslados de llegada y salida al aeropuerto & City Tour por la ciudad en español y Paseo en crucero Landmarks en Manhattan.', 9),
(17, 'Las Vegas', 89.845, 4, 'Paquete de 3 noches de Alojamiento, traslados de llegada y salida y paseo en helicóptero por el Strip de Las Vegas.', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `nombre`) VALUES
(1, 'Argentina'),
(6, 'Brasil'),
(9, 'Estados Unidos'),
(16, 'Peru'),
(17, 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `password`) VALUES
(2, 'fausto', '$2y$10$kk0xjQjVV35TopvTGoQRZuAqx6NIM5zmkrBj3wizrLewyUij9lOWu'),
(3, 'anabel', '$2y$10$w/uJoTYC0bTh35ckmtwnRuBTSGYMqCN4ZRF9DJyTF..D3n9WSlnVK');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_destino_pais` (`id_pais`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD CONSTRAINT `fk_destino_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
