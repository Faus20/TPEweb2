-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2021 a las 21:29:13
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

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
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `nombre`, `comentario`, `puntuacion`, `id_destino`) VALUES
(1, 'fausto', 'fsdafdsahfdshfdf', 5, 16),
(2, 'fafa', 'sfsdfsd dsfsdfsdf dsfdsfsdfsdf', 3, 30),
(3, 'fausto', 'fdsfds', 4, 16),
(4, 'fausto', 'rewrw', 2, 16),
(5, 'fausto', 'lalalalalalalalalallala', 4, 16),
(6, 'fausto', 'una mierda', 3, 16),
(7, 'fausto', 'FAUSTO EL MEJOR!', 4, 16),
(8, 'usuarix3', 'FUNCIONA!!!!!!!!', 2, 32),
(9, 'usuarix3', 'ASSSAS', 3, 32),
(10, 'usuarix3', 'REWREWR', 3, 32),
(11, 'usuarix3', 'FDGDFGDF', 4, 32),
(12, 'usuarix3', 'GDFGDF', 3, 32),
(13, 'usuarix3', 'FSE', 2, 32),
(14, 'usuarix3', 'terte', 2, 32),
(15, 'usuarix3', 'rtgret', 3, 32),
(16, 'usuarix3', 'ghdfg', 3, 32),
(17, 'usuarix3', 'fdgdf', 5, 32),
(18, 'usuarix3', 'fgsfsd', 4, 32),
(19, 'usuarix3', 'sdgfsd', 3, 32),
(31, 'fausto', 'Morbi vel velit vel enim faucibus mollis. Nullam quis mauris feugiat, fringilla nisi id, sagittis eros. Morbi pulvinar eros at rutrum auctor. Quisque id felis lorem. Cras vitae ligula vitae ipsum ullamcorper tincidunt a et nunc. Sed at semper augue, vel ultrices ante. Donec venenatis ultrices lacus, a scelerisque augue cursus in. In in augue at mauris vestibulum imperdiet.', 3, 37),
(32, 'usuarix3', 'Aenean sed est quis ligula feugiat blandit ut nec dui. Duis posuere elit sed elit malesuada, et ornare arcu pellentesque. Mauris non lorem congue, varius purus vitae, consequat magna. Aenean faucibus aliquam erat sit amet vehicula. Quisque placerat diam a ornare cursus. Cras felis felis, volutpat sed lorem a, luctus gravida libero. Pellentesque fermentum et odio sed imperdiet. Pellentesque fermentum varius velit vel ornare. Nam malesuada mauris at odio sollicitudin ultricies in cursus ex.', 5, 37),
(33, 'fausto', 'Proin vel luctus leo. Ut quis nunc sit amet sem convallis vehicula id in sem. Praesent commodo porttitor ex, vitae porttitor massa finibus non. Aliquam tincidunt dolor eu efficitur convallis. Nam auctor convallis tempor. Duis gravida dui tortor, sit amet dictum turpis laoreet vel. Vestibulum finibus mattis diam, fermentum interdum augue faucibus et.', 4, 35),
(34, 'usuarix3', 'lalalalalalal \nlalalallaal\nlalalalal', 3, 35);

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
  `imagen` varchar(100) NOT NULL,
  `id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id`, `nombre`, `precio`, `dias`, `detalle`, `imagen`, `id_pais`) VALUES
(10, 'Iguazu', 16.709, 4, 'Vuelo + Hotel los Helechos con una noche de regalo + Traslados y excursión gratis + Cataratas Argentina', 'imgs/60c7bc7b7f3c96.92608408.jpg', 1),
(11, 'Mendoza', 22.639, 4, 'Vuelo + Hotel + Traslados + Excursion  a bodegas + Excursion Alta montaña', 'imgs/60c7bc60cb7e94.77903723.jpg', 1),
(12, 'Bariloche', 26.373, 3, 'Aéreo, 3 noches de alojamiento según régimen de comidas indicado y traslados.', 'imgs/60c7bc4454c9f2.69741507.jpg', 1),
(13, 'Buzios', 70.148, 8, 'Aéreo , Alojamiento por 7 noches en Búzios según régimen de comidas indicado y Asistencia Médica. ', 'imgs/60c7bc20a1dd03.51559846.jpg', 6),
(14, 'Costa do Sauípe', 174.921, 8, 'Aéreo, 7 Noches de alojamiento en Costa do Sauípe con All Inclusive y Asistencia Médica ', 'imgs/60c7bc0c136e09.79910759.jpg', 6),
(15, 'Miami', 203.795, 7, 'Aéreos & 6 Noches de Alojamiento en Miami según regimen de comidas indicado. ', 'imgs/60c7bbf0040148.17961117.jpg', 9),
(16, 'Nueva York', 126.664, 3, '4 Noches de Alojamiento en Nueva York, Traslados de llegada y salida al aeropuerto & City Tour por la ciudad en español y Paseo en crucero Landmarks en Manhattan.', 'imgs/60c7bb6ce4f902.44467175.jpg', 9),
(17, 'Las Vegas', 89.845, 4, 'Paquete de 3 noches de Alojamiento, traslados de llegada y salida y paseo en helicóptero por el Strip de Las Vegas.', 'imgs/60c7bb3e3594f6.01164196.jpg', 9),
(26, 'El Cairo', 122.199, 8, 'Hotel + Servicios', 'imgs/60c7bf525f2520.59177901.jpg', 23),
(28, 'Sicilia', 198.755, 7, '6 noches de alojamiento según régimen de comidas indicado', 'imgs/60c7c13a3f9493.37528486.jpg', 24),
(29, 'Roma', 131.699, 6, '5 noches de alojamiento según régimen de comidas indicado, traslado y excursión', 'imgs/60c7c1c2b2c7d5.12812007.jpg', 24),
(30, 'Venecia', 196.799, 10, 'Alojamiento y desayuno + Vuelo +\r\nTraslados opcionales', 'imgs/60c7c2cf6dc268.67428032.jpg', 24),
(32, 'Florida', 121.931, 4, '- Billetes de avión de ida y vuelta en clase turista.\r\n- Traslados de llegada y salida.\r\n- 3, 4 o 5 noches de alojamiento en Orlando.\r\n- Desayuno continental.\r\n- Tour de compras a los Premium Outlets.\r\n- Impuestos hoteleros.\r\n- Tasas aéreas.', 'imgs/60c904d6adbd72.79237115.jpg', 9),
(33, 'California', 287.337, 8, '- 7 noches de alojamiento en los hoteles previstos o similares.\r\n- 7 desayunos (6 americanos y 1 continental).\r\n- Incluye admisión a Antílope Canyon y Horseshoe Bend.\r\n- Incluye admisión a Bryce Canyon y Zion National Park.\r\n- Incluye admisión al Grand Canyon.', 'imgs/60c905871d78e9.54745504.jpg', 9),
(34, 'Rio de Janeiro', 42.833, 8, 'Vuelo + Hotel', 'imgs/60c9079d950c53.23791351.jpg', 6),
(35, 'Florianópolis', 65.673, 5, 'Vuelo + Hotel\r\nFlorianópolis es conocida como la isla de la magia debido a la fuerte presencia de alquimistas durante la colonización española y portuguesa. Es una de las ciudades brasileñas con mayor presencia europea del país, no sólo a nivel cultural sino también climatológico.', 'imgs/60c908486d6e36.76495564.jpg', 6),
(37, 'Ushuaia', 35.155, 5, 'Vuelo+Hotel\r\n\r\nLos panoramas invernales que siempre soñaste están en Ushuaia donde vas a poder de un clima frío que rodea los 6° en promedio, ideal para vivir todas las aventuras que te están esperando ahí.\r\n', 'imgs/60c909adede5c5.30995321.jpg', 1);

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
(19, 'Canada'),
(22, 'Australia'),
(23, 'Egipto'),
(24, 'Italia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `password`, `admin`) VALUES
(2, 'fausto', '$2y$10$kk0xjQjVV35TopvTGoQRZuAqx6NIM5zmkrBj3wizrLewyUij9lOWu', 2),
(3, 'anabel', '$2y$10$w/uJoTYC0bTh35ckmtwnRuBTSGYMqCN4ZRF9DJyTF..D3n9WSlnVK', 2),
(28, 'usuarix1', '$2y$10$2sfTpkEPwmc4CDtc3sQJoeHlm2.trG7OhZk7IvZvFGEVIqYsLi7FO', 1),
(29, 'usuarix2', '$2y$10$YXbY0Jd56xza/8.x6S9HouSBtcjC4vOBWnbAlM0wN08Ycq99zZ2TK', 1),
(30, 'usuarix3', '$2y$10$hh8nS05vfraGM0DaLUQC8OR4ExqPy6OVn//..x0bqNiQn9S4AOcCW', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_destino_comentario` (`id_destino`);

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
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_destino_comentario` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD CONSTRAINT `fk_destino_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
