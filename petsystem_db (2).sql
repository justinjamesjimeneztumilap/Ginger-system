-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2026 at 07:14 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petsystem_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoption_requests`
--

CREATE TABLE `adoption_requests` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `adopter_seen` tinyint(1) NOT NULL DEFAULT 1,
  `admin_seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adoption_requests`
--

INSERT INTO `adoption_requests` (`id`, `user_id`, `pet_id`, `message`, `status`, `created_at`, `updated_at`, `adopter_seen`, `admin_seen`) VALUES
(18, 30342121347147677, 14, 'Ganhan ko ani', 'Approved', '2026-10-27 03:47:12', '2026-10-27 05:18:48', 1, 0),
(19, 30342121347147677, 21, 'Cute si butch', 'Approved', '2026-10-27 03:47:25', '2026-10-27 05:33:23', 1, 0),
(20, 30342121347147677, 20, '', 'Approved', '2026-10-27 07:40:25', '2026-10-27 07:40:37', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `species` enum('Dog','Cat','Other') NOT NULL DEFAULT 'Dog',
  `breed` varchar(100) NOT NULL,
  `age` varchar(30) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `health_status` varchar(50) NOT NULL DEFAULT 'Healthy',
  `status` enum('Available','Pending','Adopted') NOT NULL DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `species`, `breed`, `age`, `gender`, `description`, `photo`, `health_status`, `status`, `created_at`) VALUES
(14, 'Ginger', 'Cat', 'Big Bone', '1 year old', 'Male', 'Healthy and cute', '486ea3589de1243d.png', 'Healthy', 'Adopted', '2026-10-27 03:36:37'),
(15, 'Doppy', 'Cat', 'Abyssinian', '1 year old', 'Male', 'Healthy', '467c2e407d1e8406.webp', 'Healthy', 'Available', '2026-10-27 03:38:09'),
(16, 'Snow', 'Cat', 'Persian', '1 year old', 'Female', 'Cute', '6b4bc5adac4e2d5a.webp', 'Healthy', 'Available', '2026-10-27 03:39:03'),
(17, 'Milky', 'Cat', 'BigBone', '8 Months old', 'Male', 'Smooth', 'ff0462ace3572805.jpg', 'Healthy', 'Available', '2026-10-27 03:39:44'),
(18, 'Orange', 'Cat', 'Puspin', '6 months old', 'Male', 'Cute and loving cat', '1b4a104b24b9ab44.jpg', 'Healthy', 'Available', '2026-10-27 03:40:50'),
(19, 'BITO', 'Dog', 'Golden Retriever', '3 years old', 'Male', 'Cute', '380244943f94748f.jpg', 'Healthy', 'Available', '2026-10-27 03:41:49'),
(20, 'Milky', 'Dog', 'Golden retriever', '1 year old', 'Female', 'Loving dog', '2511d83bdd809caa.jpg', 'Healthy', 'Adopted', '2026-10-27 03:42:36'),
(21, 'Butch', 'Dog', 'Aspin', '8 months old', 'Male', 'Happy', '165ce632c1295f20.jpg', 'Healthy', 'Adopted', '2026-10-27 03:43:23'),
(22, 'Jumbo', 'Dog', 'Golden retriever', '1 year old', 'Male', 'Cute', '8047bab235e7b188.jpg', 'Healthy', 'Available', '2026-10-27 03:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `security_question` varchar(100) NOT NULL,
  `security_answer` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_type` enum('Admin','Adopter') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `user_name`, `email`, `password`, `security_question`, `security_answer`, `date`, `user_type`) VALUES
(1, 707590562987, 'Admin', 'admin@petadopt.com', '$2y$10$5o9X7eeww6A3/nHSUGBHQOuPHMdMv7HA18KesoJsKNq.5CxZhJADi', 'What is your favorite color?', 'blue', '2026-10-01 13:29:33', 'Admin'),
(2, 7699410573718581, 'Justin', 'Justin@gmail.com', '$2y$10$iR70NgWI10JGL12vBVDdpuWn./QK/8tJwhrPCN1J.2Az6DmIWC5cy', 'What is your favorite color?', 'black', '2026-10-01 14:18:51', 'Adopter'),
(3, 30342121347147677, 'justinjamesjimenez.tumilap@my.smciligan.edu.ph', 'khermelrosales@gmail.com', '$2y$10$3lRzAq2IISQ1YYJULpNF1eUwU1hcuG63af.N7CmPwD4pHUdQGbpIe', 'What is your favorite color?', 'm', '2026-10-26 13:28:02', 'Adopter');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoption_requests`
--
ALTER TABLE `adoption_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoption_requests`
--
ALTER TABLE `adoption_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoption_requests`
--
ALTER TABLE `adoption_requests`
  ADD CONSTRAINT `fk_request_pet` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
