-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Мар 16 2026 г., 10:56
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_expenses`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) NOT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `make` varchar(255) NOT NULL,
  `mileage` int(11) DEFAULT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `license_plate`, `make`, `mileage`, `model`, `year`, `owner_id`) VALUES
(5, 'А058Ну138', 'toyota', 85000, 'allion', 2010, 3),
(6, 'Т643УН38', 'toyota', 415000, 'corolla', 1992, 3),
(7, 'Г211ГГ138', 'volkswagen', 45000, 'golf', 2016, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(38,2) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('FINE','FUEL','INSURANCE','MAINTENANCE','OIL','OTHER','REPAIR','TAX') DEFAULT NULL,
  `car_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `expenses`
--

INSERT INTO `expenses` (`id`, `amount`, `date`, `description`, `type`, `car_id`) VALUES
(8, 5000.00, '2026-04-20', NULL, 'FUEL', 5),
(9, 1212.00, '2026-01-13', 'выавы', 'INSURANCE', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `maintenance`
--

CREATE TABLE `maintenance` (
  `id` bigint(20) NOT NULL,
  `completed` bit(1) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `car_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `maintenance`
--

INSERT INTO `maintenance` (`id`, `completed`, `date`, `description`, `mileage`, `car_id`) VALUES
(3, b'0', '2026-03-12', 'АИ92', 45000, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`) VALUES
(1, 'test@example.com', '$2a$10$5Odwf1mQ8g55u7/L9H0Ce.UaKJTaZl7HE91SnxQuulqZcR/hxN8gC', 'testuser'),
(2, NULL, '$2a$10$48tImQuoPX4E5TH0jjnD6umv/W9doGisCNQvAbHTImh61HOJGh.y6', 'admin'),
(3, NULL, '$2a$10$/KPx9UYeg2XKbDz6o6RXQOpC6dNjS/PQWT0lh.L5ygWNf06YG23NO', 'apleshkov'),
(4, NULL, '$2a$10$2mKVoFztS5o/pP8s8T.fhujNfgSBvfaBU3QOj/vM4lSCUVPSCQECy', 'л'),
(5, 'pleshkov@mail.ru', '$2a$10$WroSvy/q20MhogX6M6fAG.TTig4IrM8aVjDOzoC7uWxoL.eUX2e7O', 'pleshkov');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm5ibu05fg8g81fo6491puswuu` (`owner_id`);

--
-- Индексы таблицы `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa0ngm6acc7tw0daiku48v3ne8` (`car_id`);

--
-- Индексы таблицы `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9l44b1pm3tyvl0uydqkekp1qd` (`car_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `FKm5ibu05fg8g81fo6491puswuu` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `FKa0ngm6acc7tw0daiku48v3ne8` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`);

--
-- Ограничения внешнего ключа таблицы `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `FK9l44b1pm3tyvl0uydqkekp1qd` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
