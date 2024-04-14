-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 21, 2024 lúc 08:17 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cinema_manager`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `age_ratings`
--

CREATE TABLE `age_ratings` (
  `rating_id` varchar(10) NOT NULL,
  `rating_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `age_ratings`
--

INSERT INTO `age_ratings` (`rating_id`, `rating_description`) VALUES
('G', 'General Audience'),
('NC-17', 'Adults Only'),
('PG', 'Parental Guidance Suggested'),
('PG-13', 'Parents Strongly Cautioned'),
('R', 'Restricted');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` binary(16) NOT NULL,
  `booking_date` datetime(6) NOT NULL,
  `screening_id` varchar(9) DEFAULT NULL,
  `user` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_product`
--

CREATE TABLE `booking_product` (
  `booking` binary(16) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `total_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `province` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `branches`
--

INSERT INTO `branches` (`branch_id`, `address`, `branch_name`, `province`) VALUES
(1, '1 Đường A, Quận 1, Hà Nội', 'Branch 1 - Hà Nội', 1),
(2, '2 Đường B, Quận 2, Hà Nội', 'Branch 2 - Hà Nội', 1),
(3, '123 Nguyễn Hồng Đào, Quận 3, Hồ Chí Minh', 'Branch 1 - Hồ Chí Minh', 2),
(4, '456 Lê Văn Sỹ, Quận 10, Hồ Chí Minh', 'Branch 2 - Hồ Chí Minh', 2),
(5, '789 Phan Châu Trinh, Quận Hải Châu, Đà Nẵng', 'Branch 1 - Đà Nẵng', 3),
(6, '101 Trần Hưng Đạo, Quận Sơn Trà, Đà Nẵng', 'Branch 2 - Đà Nẵng', 3),
(7, '121 Lê Hồng Phong, Quận Ngô Quyền, Hải Phòng', 'Branch 1 - Hải Phòng', 4),
(8, '141 Trần Nguyên Hãn, Quận Lê Chân, Hải Phòng', 'Branch 2 - Hải Phòng', 4),
(9, '161 Cách Mạng Tháng Tám, Quận Ninh Kiều, Cần Thơ', 'Branch 1 - Cần Thơ', 5),
(10, '181 Võ Văn Kiệt, Quận Bình Thủy, Cần Thơ', 'Branch 2 - Cần Thơ', 5),
(11, '201 Ngô Gia Tự, TP Bắc Ninh, Bắc Ninh', 'Branch 1 - Bắc Ninh', 6),
(12, '221 Lê Thánh Tông, TP Bắc Ninh, Bắc Ninh', 'Branch 2 - Bắc Ninh', 6),
(13, '241 Đại Lộ Bình Dương, TP Thủ Dầu Một, Bình Dương', 'Branch 1 - Bình Dương', 7),
(14, '261 Đường Bàu Bàng, TP Dĩ An, Bình Dương', 'Branch 2 - Bình Dương', 7),
(15, '281 Lê Lợi, TP Thái Nguyên, Thái Nguyên', 'Branch 1 - Thái Nguyên', 9),
(16, '301 Quang Trung, TP Thái Nguyên, Thái Nguyên', 'Branch 2 - Thái Nguyên', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `daily_revenues`
--

CREATE TABLE `daily_revenues` (
  `revenue_id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `revenue` decimal(10,2) NOT NULL,
  `movie` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film_formats`
--

CREATE TABLE `film_formats` (
  `format_id` varchar(10) NOT NULL,
  `format_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `food_status` enum('AVAILABLE','DISCONTINUED') NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sold` bigint(20) NOT NULL,
  `food_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Animation'),
(4, 'Comedy'),
(5, 'Crime'),
(6, 'Drama'),
(7, 'Family'),
(8, 'Fantasy'),
(9, 'History'),
(10, 'Horror'),
(11, 'Mystery'),
(12, 'Romance'),
(13, 'Sci-Fi'),
(14, 'Thriller'),
(15, 'Western');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `halls`
--

CREATE TABLE `halls` (
  `hall_id` varchar(10) NOT NULL,
  `col_count` int(11) NOT NULL,
  `hall_name` varchar(10) NOT NULL,
  `row_count` int(11) NOT NULL,
  `branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `halls`
--

INSERT INTO `halls` (`hall_id`, `col_count`, `hall_name`, `row_count`, `branch`) VALUES
('HA0001', 10, 'RAP1', 15, 1),
('HA0002', 12, 'RAP2', 18, 1),
('HA0003', 8, 'RAP3', 10, 1),
('HA0004', 14, 'RAP4', 20, 1),
('HA0005', 11, 'RAP1', 16, 2),
('HA0006', 13, 'RAP2', 22, 2),
('HA0007', 9, 'RAP3', 12, 2),
('HA0008', 15, 'RAP4', 24, 2),
('HA0009', 9, 'RAP1', 14, 3),
('HA0010', 11, 'RAP2', 20, 3),
('HA0011', 7, 'RAP3', 8, 3),
('HA0012', 13, 'RAP4', 16, 3),
('HA0013', 10, 'RAP1', 18, 4),
('HA0014', 12, 'RAP2', 24, 4),
('HA0015', 8, 'RAP3', 12, 4),
('HA0016', 14, 'RAP4', 22, 4),
('HA0017', 8, 'RAP1', 14, 5),
('HA0018', 10, 'RAP2', 20, 5),
('HA0019', 6, 'RAP3', 10, 5),
('HA0020', 12, 'RAP4', 16, 5),
('HA0021', 9, 'RAP1', 16, 6),
('HA0022', 11, 'RAP2', 22, 6),
('HA0023', 7, 'RAP3', 12, 6),
('HA0024', 13, 'RAP4', 18, 6),
('HA0025', 10, 'RAP1', 15, 7),
('HA0026', 12, 'RAP2', 18, 7),
('HA0027', 8, 'RAP3', 10, 7),
('HA0028', 14, 'RAP4', 20, 7),
('HA0029', 11, 'RAP1', 16, 8),
('HA0030', 13, 'RAP2', 22, 8),
('HA0031', 9, 'RAP3', 12, 8),
('HA0032', 15, 'RAP4', 24, 8),
('HA0033', 9, 'RAP1', 14, 9),
('HA0034', 11, 'RAP2', 20, 9),
('HA0035', 7, 'RAP3', 8, 9),
('HA0036', 13, 'RAP4', 16, 9),
('HA0037', 10, 'RAP1', 18, 10),
('HA0038', 12, 'RAP2', 24, 10),
('HA0039', 8, 'RAP3', 12, 10),
('HA0040', 14, 'RAP4', 22, 10),
('HA0041', 8, 'RAP1', 14, 11),
('HA0042', 10, 'RAP2', 20, 11),
('HA0043', 6, 'RAP3', 10, 11),
('HA0044', 12, 'RAP4', 16, 11),
('HA0045', 9, 'RAP1', 16, 12),
('HA0046', 11, 'RAP2', 22, 12),
('HA0047', 7, 'RAP3', 12, 12),
('HA0048', 13, 'RAP4', 18, 12),
('HA0049', 10, 'RAP1', 15, 13),
('HA0050', 12, 'RAP2', 18, 13),
('HA0051', 8, 'RAP3', 10, 13),
('HA0052', 14, 'RAP4', 20, 13),
('HA0053', 11, 'RAP1', 16, 14),
('HA0054', 13, 'RAP2', 22, 14),
('HA0055', 9, 'RAP3', 12, 14),
('HA0056', 15, 'RAP4', 24, 14),
('HA0057', 9, 'RAP1', 14, 15),
('HA0058', 11, 'RAP2', 20, 15),
('HA0059', 7, 'RAP3', 8, 15),
('HA0060', 13, 'RAP4', 16, 15),
('HA0061', 10, 'RAP1', 18, 16),
('HA0062', 12, 'RAP2', 24, 16),
('HA0063', 8, 'RAP3', 12, 16),
('HA0064', 14, 'RAP4', 22, 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movies`
--

CREATE TABLE `movies` (
  `movie_id` binary(16) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `movie_name` varchar(100) NOT NULL,
  `movie_status` enum('AVAILABLE','COMING_SOON','DISCONTINUED') NOT NULL,
  `poster_url` varchar(255) NOT NULL,
  `rating` double NOT NULL,
  `release_date` date NOT NULL,
  `total_revenue` decimal(12,2) NOT NULL,
  `total_reviews` int(11) NOT NULL,
  `trailer_url` varchar(255) NOT NULL,
  `age_rating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`movie_id`, `banner_url`, `description`, `duration`, `movie_name`, `movie_status`, `poster_url`, `rating`, `release_date`, `total_revenue`, `total_reviews`, `trailer_url`, `age_rating`) VALUES
(0xa565bccec5c911ee9f757c10c9ac570f, 'http://example.com/banner.jpg', 'Mind-bending thriller', 120, 'Inception', 'AVAILABLE', 'http://example.com/poster.jpg', 8.5, '2023-01-15', 5000000.00, 1200, 'http://example.com/trailer.mp4', 'PG-13'),
(0xa565ce11c5c911ee9f757c10c9ac570f, 'http://example.com/banner_toystory.jpg', 'Animated family adventure', 105, 'Toy Story', 'AVAILABLE', 'http://example.com/poster_toystory.jpg', 7.8, '2023-02-28', 3000000.50, 800, 'http://example.com/trailer_toystory.mp4', 'PG'),
(0xa565d05bc5c911ee9f757c10c9ac570f, 'http://example.com/banner_shawshank.jpg', 'Drama and redemption', 150, 'The Shawshank Redemption', 'AVAILABLE', 'http://example.com/poster_shawshank.jpg', 9.2, '2023-04-12', 8000000.75, 1500, 'http://example.com/trailer_shawshank.mp4', 'R'),
(0xa565d0acc5c911ee9f757c10c9ac570f, 'http://example.com/banner_jurassicpark.jpg', 'Dinosaur adventure', 110, 'Jurassic Park', 'AVAILABLE', 'http://example.com/poster_jurassicpark.jpg', 6.9, '2023-06-20', 2500000.25, 600, 'http://example.com/trailer_jurassicpark.mp4', 'PG'),
(0xa565d10dc5c911ee9f757c10c9ac570f, 'http://example.com/banner_darkknight.jpg', 'Gotham\'s caped crusader', 135, 'The Dark Knight', 'AVAILABLE', 'http://example.com/poster_darkknight.jpg', 8.1, '2023-08-05', 4000000.50, 1000, 'http://example.com/trailer_darkknight.mp4', 'PG-13'),
(0xa565d151c5c911ee9f757c10c9ac570f, 'http://example.com/banner_findingnemo.jpg', 'Animated underwater adventure', 95, 'Finding Nemo', 'AVAILABLE', 'http://example.com/poster_findingnemo.jpg', 7.2, '2023-09-18', 1800000.75, 500, 'http://example.com/trailer_findingnemo.mp4', 'PG'),
(0xa565d19ac5c911ee9f757c10c9ac570f, 'http://example.com/banner_godfather.jpg', 'Mafia drama masterpiece', 125, 'The Godfather', 'AVAILABLE', 'http://example.com/poster_godfather.jpg', 9.5, '2023-11-02', 7000000.80, 1200, 'http://example.com/trailer_godfather.mp4', 'R'),
(0xa565d1e6c5c911ee9f757c10c9ac570f, 'http://example.com/banner_lionking.jpg', 'Animated savannah epic', 100, 'The Lion King', 'AVAILABLE', 'http://example.com/poster_lionking.jpg', 7, '2024-01-10', 3200000.40, 900, 'http://example.com/trailer_lionking.mp4', 'PG'),
(0xa565d22dc5c911ee9f757c10c9ac570f, 'http://example.com/banner_twilight.jpg', 'Vampire romance', 110, 'Twilight', 'AVAILABLE', 'http://example.com/poster_twilight.jpg', 6.3, '2024-07-08', 1800000.30, 500, 'http://example.com/trailer_twilight.mp4', 'PG'),
(0xa565d274c5c911ee9f757c10c9ac570f, 'http://example.com/banner_backtothefuture.jpg', 'Time-traveling adventure', 115, 'Back to the Future', 'DISCONTINUED', 'http://example.com/poster_backtothefuture.jpg', 7.5, '2024-12-18', 2800000.50, 850, 'http://example.com/trailer_backtothefuture.mp4', 'PG-13'),
(0xa565d2bdc5c911ee9f757c10c9ac570f, 'http://example.com/banner_matrix.jpg', 'Virtual reality action', 130, 'The Matrix', 'COMING_SOON', 'http://example.com/poster_matrix.jpg', 8.8, '2025-03-25', 4200000.65, 950, 'http://example.com/trailer_matrix.mp4', 'PG-13'),
(0xa565d302c5c911ee9f757c10c9ac570f, 'http://example.com/banner_shrek.jpg', 'Animated ogre adventure', 95, 'Shrek', 'AVAILABLE', 'http://example.com/poster_shrek.jpg', 7.6, '2025-05-12', 2800000.45, 720, 'http://example.com/trailer_shrek.mp4', 'PG'),
(0xa565d391c5c911ee9f757c10c9ac570f, 'http://example.com/banner_avengers.jpg', 'Superhero ensemble', 110, 'The Avengers', 'AVAILABLE', 'http://example.com/poster_avengers.jpg', 8, '2025-07-30', 3500000.60, 880, 'http://example.com/trailer_avengers.mp4', 'PG-13'),
(0xa565d3d1c5c911ee9f757c10c9ac570f, 'http://example.com/banner_frozen.jpg', 'Animated ice queen tale', 125, 'Frozen', 'AVAILABLE', 'http://example.com/poster_frozen.jpg', 7.3, '2025-09-15', 2000000.35, 600, 'http://example.com/trailer_frozen.mp4', 'PG'),
(0xa565d40dc5c911ee9f757c10c9ac570f, 'http://example.com/banner_pulpfiction.jpg', 'Quentin Tarantino classic', 145, 'Pulp Fiction', 'AVAILABLE', 'http://example.com/poster_pulpfiction.jpg', 9.3, '2025-12-01', 6000000.70, 1100, 'http://example.com/trailer_pulpfiction.mp4', 'R'),
(0xa565d44dc5c911ee9f757c10c9ac570f, 'http://example.com/banner_silenceofthelambs.jpg', 'Psychological thriller', 120, 'The Silence of the Lambs', 'COMING_SOON', 'http://example.com/poster_silenceofthelambs.jpg', 8.2, '2026-02-14', 3200000.55, 780, 'http://example.com/trailer_silenceofthelambs.mp4', 'PG-13'),
(0xa565d48fc5c911ee9f757c10c9ac570f, 'http://example.com/banner_forrestgump.jpg', 'Epic journey of a simple man', 135, 'Forrest Gump', 'AVAILABLE', 'http://example.com/poster_forrestgump.jpg', 7.7, '2026-04-08', 4000000.60, 900, 'http://example.com/trailer_forrestgump.mp4', 'PG'),
(0xa565d4d4c5c911ee9f757c10c9ac570f, 'http://example.com/banner_fightclub.jpg', 'Dystopian fight against consumerism', 110, 'Fight Club', 'AVAILABLE', 'http://example.com/poster_fightclub.jpg', 8.6, '2026-06-22', 5500000.75, 1200, 'http://example.com/trailer_fightclub.mp4', 'R'),
(0xa565d515c5c911ee9f757c10c9ac570f, 'http://example.com/banner_littlemermaid.jpg', 'Animated underwater fairy tale', 105, 'The Little Mermaid', 'COMING_SOON', 'http://example.com/poster_littlemermaid.jpg', 7.5, '2026-09-10', 2800000.40, 700, 'http://example.com/trailer_littlemermaid.mp4', 'PG'),
(0xa565d558c5c911ee9f757c10c9ac570f, 'http://example.com/banner_godfather2.jpg', 'Continuation of the mafia saga', 140, 'The Godfather: Part II', 'AVAILABLE', 'http://example.com/poster_godfather2.jpg', 9.1, '2026-11-27', 4800000.70, 1100, 'http://example.com/trailer_godfather2.mp4', 'R'),
(0xa565d595c5c911ee9f757c10c9ac570f, 'http://example.com/banner_forrestgump2.jpg', 'Continuation of the epic journey', 125, 'Forrest Gump: Part II', 'COMING_SOON', 'http://example.com/poster_forrestgump2.jpg', 8.4, '2027-03-15', 3800000.65, 850, 'http://example.com/trailer_forrestgump2.mp4', 'PG-13'),
(0xa565d5d5c5c911ee9f757c10c9ac570f, 'http://example.com/banner_incredibles.jpg', 'Superhero family adventure', 110, 'The Incredibles', 'AVAILABLE', 'http://example.com/poster_incredibles.jpg', 7.9, '2027-05-20', 3200000.55, 720, 'http://example.com/trailer_incredibles.mp4', 'PG'),
(0xa565d613c5c911ee9f757c10c9ac570f, 'http://example.com/banner_inglouriousbasterds.jpg', 'Quentin Tarantino war drama', 140, 'Inglourious Basterds', 'COMING_SOON', 'http://example.com/poster_inglouriousbasterds.jpg', 8.7, '2027-08-10', 5200000.80, 1100, 'http://example.com/trailer_inglouriousbasterds.mp4', 'R'),
(0xa565d650c5c911ee9f757c10c9ac570f, 'http://example.com/banner_junglebook.jpg', 'Live-action/CGI adventure', 115, 'The Jungle Book', 'AVAILABLE', 'http://example.com/poster_junglebook.jpg', 7.8, '2027-10-25', 2600000.45, 650, 'http://example.com/trailer_junglebook.mp4', 'PG-13'),
(0xa565d68fc5c911ee9f757c10c9ac570f, 'http://example.com/banner_schindlerslist.jpg', 'Historical drama', 130, 'Schindler\'s List', 'COMING_SOON', 'http://example.com/poster_schindlerslist.jpg', 9, '2027-12-12', 4700000.70, 1050, 'http://example.com/trailer_schindlerslist.mp4', 'R'),
(0xa565d6ccc5c911ee9f757c10c9ac570f, 'http://example.com/banner_grandbudapesthotel.jpg', 'Quirky Wes Anderson comedy', 125, 'The Grand Budapest Hotel', 'COMING_SOON', 'http://example.com/poster_grandbudapesthotel.jpg', 8.2, '2028-02-20', 3500000.60, 800, 'http://example.com/trailer_grandbudapesthotel.mp4', 'PG-13'),
(0xa565d714c5c911ee9f757c10c9ac570f, 'http://example.com/banner_beautyandthebeast.jpg', 'Live-action fairy tale', 110, 'Beauty and the Beast', 'AVAILABLE', 'http://example.com/poster_beautyandthebeast.jpg', 7.5, '2028-05-15', 2800000.50, 720, 'http://example.com/trailer_beautyandthebeast.mp4', 'PG'),
(0xa565d752c5c911ee9f757c10c9ac570f, 'http://example.com/banner_djangounchained.jpg', 'Tarantino\'s western revenge', 140, 'Django Unchained', 'COMING_SOON', 'http://example.com/poster_djangounchained.jpg', 8.9, '2028-08-08', 5000000.75, 1100, 'http://example.com/trailer_djangounchained.mp4', 'R'),
(0xa565d791c5c911ee9f757c10c9ac570f, 'http://example.com/banner_moana.jpg', 'Animated Polynesian adventure', 115, 'Moana', 'AVAILABLE', 'http://example.com/poster_moana.jpg', 7.7, '2028-10-30', 3200000.55, 700, 'http://example.com/trailer_moana.mp4', 'PG-13'),
(0xa565d7d0c5c911ee9f757c10c9ac570f, 'http://example.com/banner_bladerunner2049.jpg', 'Sci-fi sequel', 120, 'Blade Runner 2049', 'COMING_SOON', 'http://example.com/poster_bladerunner2049.jpg', 8.6, '2029-01-05', 4200000.70, 950, 'http://example.com/trailer_bladerunner2049.mp4', 'R');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_genre`
--

CREATE TABLE `movie_genre` (
  `genre` int(11) NOT NULL,
  `movie` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movie_genre`
--

INSERT INTO `movie_genre` (`genre`, `movie`) VALUES
(1, 0xa565d10dc5c911ee9f757c10c9ac570f),
(1, 0xa565d391c5c911ee9f757c10c9ac570f),
(1, 0xa565d752c5c911ee9f757c10c9ac570f),
(2, 0xa565d0acc5c911ee9f757c10c9ac570f),
(2, 0xa565d274c5c911ee9f757c10c9ac570f),
(2, 0xa565d650c5c911ee9f757c10c9ac570f),
(3, 0xa565ce11c5c911ee9f757c10c9ac570f),
(3, 0xa565d151c5c911ee9f757c10c9ac570f),
(3, 0xa565d3d1c5c911ee9f757c10c9ac570f),
(3, 0xa565d515c5c911ee9f757c10c9ac570f),
(3, 0xa565d791c5c911ee9f757c10c9ac570f),
(4, 0xa565d302c5c911ee9f757c10c9ac570f),
(4, 0xa565d6ccc5c911ee9f757c10c9ac570f),
(5, 0xa565d4d4c5c911ee9f757c10c9ac570f),
(5, 0xa565d613c5c911ee9f757c10c9ac570f),
(6, 0xa565d05bc5c911ee9f757c10c9ac570f),
(6, 0xa565d19ac5c911ee9f757c10c9ac570f),
(6, 0xa565d40dc5c911ee9f757c10c9ac570f),
(6, 0xa565d48fc5c911ee9f757c10c9ac570f),
(6, 0xa565d4d4c5c911ee9f757c10c9ac570f),
(6, 0xa565d558c5c911ee9f757c10c9ac570f),
(6, 0xa565d595c5c911ee9f757c10c9ac570f),
(7, 0xa565ce11c5c911ee9f757c10c9ac570f),
(7, 0xa565d1e6c5c911ee9f757c10c9ac570f),
(7, 0xa565d3d1c5c911ee9f757c10c9ac570f),
(7, 0xa565d44dc5c911ee9f757c10c9ac570f),
(7, 0xa565d5d5c5c911ee9f757c10c9ac570f),
(7, 0xa565d650c5c911ee9f757c10c9ac570f),
(7, 0xa565d714c5c911ee9f757c10c9ac570f),
(9, 0xa565d05bc5c911ee9f757c10c9ac570f),
(9, 0xa565d68fc5c911ee9f757c10c9ac570f),
(12, 0xa565d10dc5c911ee9f757c10c9ac570f),
(12, 0xa565d22dc5c911ee9f757c10c9ac570f),
(12, 0xa565d48fc5c911ee9f757c10c9ac570f),
(12, 0xa565d595c5c911ee9f757c10c9ac570f),
(13, 0xa565bccec5c911ee9f757c10c9ac570f),
(13, 0xa565d2bdc5c911ee9f757c10c9ac570f),
(13, 0xa565d7d0c5c911ee9f757c10c9ac570f),
(14, 0xa565bccec5c911ee9f757c10c9ac570f),
(14, 0xa565d0acc5c911ee9f757c10c9ac570f),
(14, 0xa565d151c5c911ee9f757c10c9ac570f),
(14, 0xa565d19ac5c911ee9f757c10c9ac570f),
(14, 0xa565d1e6c5c911ee9f757c10c9ac570f),
(14, 0xa565d22dc5c911ee9f757c10c9ac570f),
(14, 0xa565d274c5c911ee9f757c10c9ac570f),
(14, 0xa565d2bdc5c911ee9f757c10c9ac570f),
(14, 0xa565d391c5c911ee9f757c10c9ac570f),
(14, 0xa565d44dc5c911ee9f757c10c9ac570f),
(14, 0xa565d515c5c911ee9f757c10c9ac570f),
(14, 0xa565d5d5c5c911ee9f757c10c9ac570f),
(14, 0xa565d613c5c911ee9f757c10c9ac570f),
(14, 0xa565d714c5c911ee9f757c10c9ac570f),
(14, 0xa565d752c5c911ee9f757c10c9ac570f);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(5) NOT NULL,
  `product_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `provinces`
--

CREATE TABLE `provinces` (
  `province_id` int(11) NOT NULL,
  `province_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `provinces`
--

INSERT INTO `provinces` (`province_id`, `province_Name`) VALUES
(6, 'Bắc Ninh'),
(7, 'Bình Dương'),
(5, 'Cần Thơ'),
(1, 'Hà Nội'),
(4, 'Hải Phòng'),
(2, 'Hồ Chí Minh'),
(9, 'Thái Nguyên'),
(3, 'Đà Nẵng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` varchar(10) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `screenings`
--

CREATE TABLE `screenings` (
  `screening_id` int(11) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `screening_price` decimal(8,2) NOT NULL,
  `showtime` datetime(6) NOT NULL,
  `user_id` varchar(9) DEFAULT NULL,
  `film_format` varchar(10) NOT NULL,
  `hall` varchar(10) NOT NULL,
  `movie` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seats`
--

CREATE TABLE `seats` (
  `col_num` int(11) NOT NULL,
  `row_num` int(11) NOT NULL,
  `seat_type` enum('NORMAL','VIP','COUPLE') NOT NULL,
  `seat_id` varchar(10) NOT NULL,
  `hall` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` binary(16) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `creating_date` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `birthdate`, `creating_date`, `email`, `fullName`, `password`, `phone`) VALUES
(0x0b4e15e3d06811eea2667c10c9ac570f, '2003-01-12', '2024-02-21 10:20:00.000000', 'benlun99@gmail.com', 'Lê Duy Nhân', '123456', '0703361342'),
(0x23aecc49d06811eea2667c10c9ac570f, '2003-01-12', '2024-02-21 10:20:00.000000', 'benlun01@gmail.com', 'Lê Duy Human', '123456', '0903331360'),
(0x3dd21565d06811eea2667c10c9ac570f, '2003-01-12', '2024-02-21 10:20:00.000000', 'benlun02@gmail.com', 'Lê Văn Lâm', '123456', '0937819470');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `role` varchar(255) NOT NULL,
  `user` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `age_ratings`
--
ALTER TABLE `age_ratings`
  ADD PRIMARY KEY (`rating_id`);

--
-- Chỉ mục cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_bookings_users` (`user`);

--
-- Chỉ mục cho bảng `booking_product`
--
ALTER TABLE `booking_product`
  ADD PRIMARY KEY (`booking`,`product`),
  ADD KEY `fk_booking_product_products` (`product`);

--
-- Chỉ mục cho bảng `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `UK_cg8xnm1f8r6ohberdss40rhmm` (`branch_name`),
  ADD KEY `fk_branches_provinces` (`province`);

--
-- Chỉ mục cho bảng `daily_revenues`
--
ALTER TABLE `daily_revenues`
  ADD PRIMARY KEY (`revenue_id`),
  ADD KEY `fk_daily_revenues_movies` (`movie`);

--
-- Chỉ mục cho bảng `film_formats`
--
ALTER TABLE `film_formats`
  ADD PRIMARY KEY (`format_id`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`food_id`);

--
-- Chỉ mục cho bảng `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `UK_11hq5auj6f9viwt8hr86j714d` (`genre_name`);

--
-- Chỉ mục cho bảng `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hall_id`),
  ADD KEY `fk_halls_branches` (`branch`);

--
-- Chỉ mục cho bảng `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`),
  ADD UNIQUE KEY `UK_nh6l2fpydr26j7vopnxjs9qkj` (`movie_name`),
  ADD KEY `fk_movies_ratings` (`age_rating`);

--
-- Chỉ mục cho bảng `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`genre`,`movie`),
  ADD KEY `fk_movie_genre_movies` (`movie`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`province_id`),
  ADD UNIQUE KEY `UK_sb5jjoblqsg7b26klcvnl8gfw` (`province_Name`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `UK_716hgxp60ym1lifrdgp67xt5k` (`role_name`);

--
-- Chỉ mục cho bảng `screenings`
--
ALTER TABLE `screenings`
  ADD PRIMARY KEY (`screening_id`),
  ADD KEY `FKs4v9l0awj719k1f93lqfx2526` (`film_format`),
  ADD KEY `FK4pkoeno45qhnct6vae2bf2o1h` (`hall`),
  ADD KEY `FKehv5b27ohnvbjiq2nuerxy4pq` (`movie`);

--
-- Chỉ mục cho bảng `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `fk_seats_halls` (`hall`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UK_du5v5sr43g5bfnji4vb8hg5s3` (`phone`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role`,`user`),
  ADD KEY `fk_user_role_users` (`user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `daily_revenues`
--
ALTER TABLE `daily_revenues`
  MODIFY `revenue_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `provinces`
--
ALTER TABLE `provinces`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `screenings`
--
ALTER TABLE `screenings`
  MODIFY `screening_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_users` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `booking_product`
--
ALTER TABLE `booking_product`
  ADD CONSTRAINT `fk_booking_product_bookings` FOREIGN KEY (`booking`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_product_products` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fk_branches_provinces` FOREIGN KEY (`province`) REFERENCES `provinces` (`province_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `daily_revenues`
--
ALTER TABLE `daily_revenues`
  ADD CONSTRAINT `fk_daily_revenues_movies` FOREIGN KEY (`movie`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `fk_foods_products` FOREIGN KEY (`food_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `halls`
--
ALTER TABLE `halls`
  ADD CONSTRAINT `fk_halls_branches` FOREIGN KEY (`branch`) REFERENCES `branches` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_movies_ratings` FOREIGN KEY (`age_rating`) REFERENCES `age_ratings` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `fk_movie_genre_genres` FOREIGN KEY (`genre`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_genre_movies` FOREIGN KEY (`movie`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `screenings`
--
ALTER TABLE `screenings`
  ADD CONSTRAINT `FK4pkoeno45qhnct6vae2bf2o1h` FOREIGN KEY (`hall`) REFERENCES `halls` (`hall_id`),
  ADD CONSTRAINT `FKehv5b27ohnvbjiq2nuerxy4pq` FOREIGN KEY (`movie`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `FKs4v9l0awj719k1f93lqfx2526` FOREIGN KEY (`film_format`) REFERENCES `film_formats` (`format_id`);

--
-- Các ràng buộc cho bảng `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `fk_seats_halls` FOREIGN KEY (`hall`) REFERENCES `halls` (`hall_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seats_products` FOREIGN KEY (`seat_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_user_role_roles` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_role_users` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
