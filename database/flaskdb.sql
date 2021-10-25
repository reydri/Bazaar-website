-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2021 at 03:06 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `price`) VALUES
(1, 'Kisi-Kisi CPNS', 'Mikhaela M.', 120000),
(2, 'Bacaan Shalat', 'Ust. Somad', 100000),
(3, 'Soal SKB', 'Mikhaela M.', 120000),
(4, 'Soal SKD', 'Mikhaela M.', 150000),
(5, 'Komunikasi', 'Najwa Sihab', 125000),
(6, 'Sosial', 'Ridwan ', 100000),
(7, 'Politik', 'Najwa Sihab', 200000),
(8, 'Sejarah Islam', 'Ust. Khalid', 100000),
(9, 'Sejarah Dunia', 'Rocky', 200000),
(10, 'Teknologi ', 'Jerome', 250000);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `name`, `title`, `price`) VALUES
(1, 'Dicoding', 'Belajar Dasar Python', 100000),
(2, 'Dicoding', 'Belajar Visualisasi Data', 100000),
(3, 'Dicoding', 'Belajar Machine Learning', 150000),
(4, 'Dicoding', 'Belajar Dasar Javascript', 125000),
(5, 'Dicoding', 'Belajar Dasar AWS', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `device_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`device_id`, `name`, `type`, `price`) VALUES
(1, 'Microsoft Windows 10 Pro', 'Software', 500000),
(2, 'Ms. Office 2016', 'Software', 450000),
(3, 'Ms. Office 2013', 'Software', 300000),
(4, 'Microsoft Windows 8', 'Software', 350000),
(5, 'Mouse', 'Hardware', 150000),
(6, 'Webcam', 'Hardware', 400000),
(7, 'Mikrofon', 'Hardware', 100000),
(8, 'Keyboard', 'Hardware', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `description`) VALUES
(1, 'Barcelona Kalah ', 'Barcelona kalah dari Real Madrid dengan skor 1-2'),
(2, 'Barcelona Menang', 'Barcelona menang 1-0 di Liga Champions'),
(3, 'Pengumuman SKB', 'SKB akan diumumkan pada bulan November'),
(4, 'Lowongan Kerja', 'Pihak Telkomsel membuka loker hari ini'),
(5, 'Covid-19', 'Penurunan virus Covid-19 di Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` enum('M','L') NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone`, `gender`, `email`, `password`) VALUES
(1, 'Reyhan Alkadri', '082389888651', 'M', 'reyhanalkadri@gmail.com', '$2b$12$Zg5gfRs15tw3SQOJKS729eZIkXCKXdMh3BFwTWcxrOAaFQ1L8WvVK'),
(2, 'Muhammad Salam', '0811663821', 'M', 'm_salam@gmail.com', '$2b$12$sJNTss17P6XTXPNzEoK9mOAwxFF0IWrX.0D8m7zLONH1hC6rNsGq2'),
(3, 'Muhammad Faridzia', '087865886973', 'M', 'faridzia@gmail.com', '$2b$12$INh7wmHeMFgVYOjfwh0TfebYBPSmqNtggBz56F1TFP7DNXC7qWBSm'),
(4, 'Muhammad Rafli', '081275422988', 'M', 'rafli@gmail.com', '$2b$12$QYhpwq8CvHLDTwjAEPOZpeSREgUErdb4AekQH6NWzH/kL4BRX6pCu'),
(5, 'Iyon Priyono', '08111546864', 'M', 'iyonpriyono@gmail.com', '$2b$12$Y0F1Yay80/GZU5aOUAoGveWscNgEYfOVXGpTM2mvp7sz7mPzF35Ia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
