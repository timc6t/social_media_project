-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2023 a las 19:59:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `social_network`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `text_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`comment_id`, `text_id`, `user_id`, `content`, `created_at`) VALUES
(1, 2, 523, 'Your Instagram makes you seem so fun!', '2023-11-15 18:21:37'),
(2, 2, 523, 'It’s really difficult to underestimate you.', '2023-11-15 18:22:14'),
(3, 5, 527, 'ppp', '2023-11-23 17:36:26'),
(4, 4, 526, 'ppp', '2023-11-23 17:46:00'),
(5, 4, 526, 'Comment test', '2023-11-23 17:47:57'),
(6, 5, 526, 'nice', '2023-11-23 17:48:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `follows`
--

CREATE TABLE `follows` (
  `follow_id` int(11) NOT NULL,
  `follower_id` int(11) DEFAULT NULL,
  `following_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `follows`
--

INSERT INTO `follows` (`follow_id`, `follower_id`, `following_id`, `user_id`, `created_at`) VALUES
(1, 527, 523, NULL, '2023-11-23 17:35:08'),
(2, 526, 523, NULL, '2023-11-23 17:39:02'),
(3, 526, 527, NULL, '2023-11-23 17:41:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texts`
--

CREATE TABLE `texts` (
  `text_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `is_public` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `texts`
--

INSERT INTO `texts` (`text_id`, `user_id`, `title`, `content`, `is_public`, `created_at`) VALUES
(1, 523, 'buh2', 'post', 1, '2023-11-13 19:05:09'),
(2, 523, 'buh3', 'brahhhhhhhhhhh', 1, '2023-11-14 18:58:50'),
(4, 526, 'ptsd', 'post prueba', 1, '2023-11-22 14:38:49'),
(5, 527, 'Fear', 'Would I rather be feared or loved? Easy. Both. I want people to be afraid of how much they love me.', 1, '2023-11-23 17:36:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `text_tags`
--

CREATE TABLE `text_tags` (
  `text_tag_id` int(11) NOT NULL,
  `text_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activation_key` varchar(100) DEFAULT NULL,
  `profile_image` varchar(255) NOT NULL,
  `is_activated` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `activation_key`, `profile_image`, `is_activated`, `created_at`) VALUES
(523, 'timc6t', 'tim.casiano7@gmail.com', '$2y$10$qQaUAmfGMm6dIZdra7.qF.YyHaWGDTOhFdwJgJQ80K2Zpqj5wPs.C', NULL, '', 0, '2023-11-08 18:57:17'),
(526, 'hashedpwd', 'poketimy@gmail.com', '$2y$10$yKiLE221iy.J84vNl6fCYeONxL8h/1CHTtyomSQPq.CCHvk6IKckS', NULL, '', 0, '2023-11-22 14:29:45'),
(527, 'michael_scott', 'timtester74@gmail.com', '$2y$10$n/XVLhvd2rt.HFUgUIrECOOpU3U2ipN1Ar2pDbSkns4kR4IzsTEtW', NULL, '', 0, '2023-11-23 16:35:01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `text_id` (`text_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indices de la tabla `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`text_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `text_tags`
--
ALTER TABLE `text_tags`
  ADD PRIMARY KEY (`text_tag_id`),
  ADD KEY `text_id` (`text_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `follows`
--
ALTER TABLE `follows`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `texts`
--
ALTER TABLE `texts`
  MODIFY `text_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `text_tags`
--
ALTER TABLE `text_tags`
  MODIFY `text_tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`text_id`) REFERENCES `texts` (`text_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `texts`
--
ALTER TABLE `texts`
  ADD CONSTRAINT `texts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `text_tags`
--
ALTER TABLE `text_tags`
  ADD CONSTRAINT `text_tags_ibfk_1` FOREIGN KEY (`text_id`) REFERENCES `texts` (`text_id`),
  ADD CONSTRAINT `text_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
