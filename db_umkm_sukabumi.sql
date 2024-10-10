-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jun 2023 pada 10.01
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_umkm_sukabumi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `images`, `created_at`, `updated_at`) VALUES
(7, 'Makanan dan Minuman', 'makanan-dan-minuman', 'Yd66xum9i2ggoPgZfzt0C8644MdXjF2xLvUlMk5S.png', '2023-04-14 20:28:14', '2023-05-29 02:45:28'),
(9, 'Fotografi', 'fotografi', 'EDFe5h9ZOVOtHz724R0vGaDZafGQZIcu8P8Ltu45.png', '2023-05-19 21:05:32', '2023-05-29 02:45:20'),
(10, 'Fashion', 'fashion', '3DDRiDXUelP4qEBcZiOek3uM2O8GwUfl4DWHfzD8.png', '2023-05-19 21:06:20', '2023-05-29 02:45:04'),
(11, 'otomotif', 'otomotif', 'N7ap39S14PkjL2oPu3PmMF8JZ1MrK5sCIvhRBwnl.png', '2023-05-19 21:06:37', '2023-05-29 02:44:35'),
(12, 'Aksesoris', 'aksesoris', 'RrkOvez1C5gW9nLYKBLMyTQCZSP925N4hDUi2BUg.png', '2023-05-29 17:39:57', '2023-05-29 17:39:57'),
(13, 'Kerajinan Tangan', 'kerajinan-tangan', 'W5Of1ShmayJNHCnz0OCdY2r5cB3H24gSfwkmxEGR.png', '2023-05-29 17:40:09', '2023-05-29 17:40:09'),
(14, 'Kesehatan', 'kesehatan', 'hMGkFo8DRNPEk6Lov1IGi5e3VhgjZMNfhIgBdQQb.png', '2023-05-29 17:40:18', '2023-05-29 17:40:18'),
(15, 'Kecantikan', 'kecantikan', 'd51HVhM4yU963kHulxT0qLeZWaqSrpSgSFRUUnYK.png', '2023-05-29 17:40:28', '2023-05-29 17:40:28'),
(16, 'Pelatihan Kursus', 'pelatihan-kursus', 't9GW0KtCvf1Wzz4Sxfe2Aq30yDOcwq3Pa03KXAmH.png', '2023-05-29 17:41:02', '2023-05-29 17:41:02'),
(17, 'Peternakan', 'peternakan', 'nrNPMYDDE4RRyEt3bZ3y76Zngw82TYCxA0Bn24WA.png', '2023-05-29 17:41:14', '2023-05-29 17:41:14'),
(18, 'Laundry', 'laundry', 'xMU00EaVIhAiJWhE04b1DjYDlTzZ4bLbtlDqGr7M.png', '2023-05-29 17:41:34', '2023-05-29 17:41:34'),
(19, 'Desain Grafis dan Percetakan', 'desain-grafis-dan-percetakan', 'nN8O7w6e699Lq7BY0dAMjrR6Cnq4EiR06351ckBv.png', '2023-05-29 17:42:39', '2023-05-29 17:42:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_04_09_054418_create_categories_table', 1),
(5, '2023_04_09_054551_create_profils_table', 1),
(6, '2023_04_09_054943_create_profil_images_table', 1),
(7, '2023_04_09_055010_create_sliders_table', 1),
(8, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(9, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(10, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(11, '2016_06_01_000004_create_oauth_clients_table', 2),
(12, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(13, '2023_04_14_030022_update_latitude_column_in_profils_table', 3),
(14, '2023_05_17_054245_add_food_delivery_services_to_profils', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0f8bff5e53e87e0c90c3595e64e431ae96c107121efd1900f3109fb513aa6ef4ab81776df78e1de3', 1, 1, 'authToken', '[]', 0, '2023-05-17 01:14:14', '2023-05-17 01:14:14', '2024-05-17 08:14:14'),
('0fad26e729bd40d17c32255f4963c8706dc0271d3201adcb71236f94215435330157a3e2e9f1eb6a', 1, 1, 'authToken', '[]', 0, '2023-06-07 08:34:49', '2023-06-07 08:34:49', '2024-06-07 15:34:49'),
('10c3134160850b327245ceb7567833ba4bc1600acdd47a8528044dea1c25a3e1e265150f43e0d017', 1, 1, 'authToken', '[]', 0, '2023-06-12 22:51:27', '2023-06-12 22:51:27', '2024-06-13 05:51:27'),
('12c9c114330612b080a22d14249802239b45a94d0f7afcbcac696c47f502436313eaf5d1c1edf11d', 1, 1, 'authToken', '[]', 0, '2023-05-29 02:44:05', '2023-05-29 02:44:05', '2024-05-29 09:44:05'),
('344f99a0c450b5022090029a3239e9d3405bf27e99c89c3eddbd4fb6b9f22b190011093e0571787b', 1, 1, 'authToken', '[]', 0, '2023-05-16 23:18:33', '2023-05-16 23:18:33', '2024-05-17 06:18:33'),
('345efd215501365da4fe2962c9567e0d1a2b1e47ecfbc1c793d4ccae3c8d4f943433d21068942cad', 1, 1, 'authToken', '[]', 0, '2023-05-19 21:02:27', '2023-05-19 21:02:27', '2024-05-20 04:02:27'),
('3ab5df3e4fa5660a7202d13af73e67bbcd949c8b3a0207dead8fbea958b1d02a926d30d9748e649f', 1, 1, 'authToken', '[]', 0, '2023-06-03 03:31:14', '2023-06-03 03:31:14', '2024-06-03 10:31:14'),
('4cf645d38f139287dc7b236d16779d3d451db2394b4493234d8c60eb23ea41c80144235d655fd37c', 1, 1, 'authToken', '[]', 0, '2023-05-29 17:39:33', '2023-05-29 17:39:33', '2024-05-30 00:39:33'),
('8c7ee7d19546badc71b61f5e7be2c75276d3781133ecf513c3230bd2716be4b46e0a130e4bf82eaa', 1, 1, 'authToken', '[]', 0, '2023-06-04 19:33:27', '2023-06-04 19:33:27', '2024-06-05 02:33:27'),
('b163610b30604e1eb9b8015ee3c27635604383d0b90095c228667f8f2af8f01a617c5ba005bb5f41', 1, 1, 'authToken', '[]', 0, '2023-05-29 06:09:41', '2023-05-29 06:09:41', '2024-05-29 13:09:41'),
('b3175adafe1579865f9596bbb8a974a1347da6f1d3d2d80a4bca357bf9ea455fc5e0423f126ee9b2', 1, 1, 'authToken', '[]', 0, '2023-06-11 05:13:24', '2023-06-11 05:13:24', '2024-06-11 12:13:24'),
('c26e861316525ba346d39a6126cf7f86e411238fc3a5f1cc8562aa8d73ff9e1d5cf55ee1503ea0d5', 1, 1, 'authToken', '[]', 0, '2023-06-11 05:18:34', '2023-06-11 05:18:34', '2024-06-11 12:18:34'),
('cf1a051b69464f5226baa3504c7c4fac2f6a3a9fb83384c4bd38ea58b419c7b71be915e4de2297a8', 1, 1, 'authToken', '[]', 0, '2023-06-04 02:13:58', '2023-06-04 02:13:58', '2024-06-04 09:13:58'),
('e6053938df2d00ee8baa79bb995df38e7e9174ab135fcc13a63c3d7def9206446aed02bed4d75148', 1, 1, 'authToken', '[]', 0, '2023-06-03 01:09:03', '2023-06-03 01:09:03', '2024-06-03 08:09:03'),
('fca3f01e3b43094de1acc36af39d318029ac79acb5af1e3453e55c93c7c273dc9d338c18b01b5945', 1, 1, 'authToken', '[]', 0, '2023-06-13 18:01:19', '2023-06-13 18:01:19', '2024-06-14 01:01:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'yC8hBJcrLhuAnAWKWzjP9klWu2Tuy3hSBSLz3mmJ', NULL, 'http://localhost', 1, 0, 0, '2023-04-08 23:13:43', '2023-04-08 23:13:43'),
(2, NULL, 'Laravel Password Grant Client', 'HLfL08XVtxtUsEODfTVSupKkj5UseTtdMK0rqNlO', 'users', 'http://localhost', 0, 1, 0, '2023-04-08 23:13:43', '2023-04-08 23:13:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-08 23:13:43', '2023-04-08 23:13:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `profils`
--

CREATE TABLE `profils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `waktu_kerja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perizinan_usaha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sertifikat_usaha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gofood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grabfood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopeefood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `profils`
--

INSERT INTO `profils` (`id`, `title`, `slug`, `user_id`, `category_id`, `waktu_kerja`, `description`, `address`, `status`, `phone`, `website`, `instagram`, `facebook`, `perizinan_usaha`, `sertifikat_usaha`, `longitude`, `latitude`, `created_at`, `updated_at`, `gofood`, `grabfood`, `shopeefood`) VALUES
(18, 'MachiMayo Kitchen', 'machimayo-kitchen', 1, 7, '08.00 - 17.00', '<p>Machi Mayo Kitchen adalah sebuah UMKM yang bergerak di bidang kuliner dan spesialisasi dalam menawarkan berbagai macam kue. Mereka menyediakan berbagai jenis kue seperti cake, pastry, dan roti dengan berbagai rasa dan variasi yang menarik.</p><p>Machi Mayo Kitchen didirikan oleh seorang pengusaha muda yang memiliki keahlian dalam membuat kue dan mempunyai impian untuk menghadirkan kue yang berkualitas dengan harga yang terjangkau. Semua produk kue yang dihasilkan oleh Machi Mayo Kitchen dibuat dari bahan-bahan berkualitas dan diolah dengan teknik yang baik untuk menghasilkan kue yang lezat dan berkualitas.</p><p>Selain itu, Machi Mayo Kitchen juga menawarkan layanan katering kue untuk berbagai acara seperti ulang tahun, pernikahan, dan acara lainnya. Mereka dapat menghasilkan kue dengan jumlah besar dan variasi rasa yang berbeda-beda sesuai dengan keinginan pelanggan.</p><p>Machi Mayo Kitchen memiliki motto \"Membuat Pelanggan Puas dengan Setiap Gigitan\", sehingga mereka selalu berusaha memberikan kualitas yang terbaik dan membuat pelanggan puas dengan setiap produk kue yang dihasilkan. Dengan layanan yang profesional dan kualitas yang terjamin, Machi Mayo Kitchen menjadi pilihan yang tepat untuk memenuhi kebutuhan kue Anda.</p>', 'Jl. Pabuaran, Warudoyong, Kec. Warudoyong, Kota Sukabumi, Jawa Barat 43131', 'Aktif', '085938513170', '', 'https://instagram.com/machimayo.kitchen?igshid=YmMyMTA2M2Y=', '', 'SPTJM SINTIA.pdf', 'HashMicro Odoo Developer Test.pdf', '106.9218009711492', '-6.92677819869013', '2023-04-14 20:51:41', '2023-04-15 02:28:29', NULL, NULL, NULL),
(22, 'Sinta Studio', 'sinta-studio', 1, 9, '08.00 - 17.00', '<p>sinta studio membuka foto</p>', 'Jalan Bhayangkara No Ganjil 1 115 Kel Gunung Puyuh Kec Gunungpuyuh Kota Sukabumi Jawa Barat', 'Aktif', '081250331766', '', '', '', 'perizinan_usaha_1684556862113.pdf', 'sertifikat_usaha_1684556867819.pdf', '106.9222451280815', '-6.9164908744511', '2023-05-19 21:27:49', '2023-05-19 21:27:49', '', '', ''),
(23, 'Seblak Mamah Azril', 'seblak-mamah-azril', 1, 7, '08.00 - 17.00', '<p>Seblak</p>', 'Jl. Mayawati Atas No.16, Gunungparang, Cikole, Kota Sukabumi, Jawa Barat 43111, Indonesia', 'Aktif', '081250331766', '', '', '', 'perizinan_usaha_1684557019823.pdf', 'sertifikat_usaha_1684557023793.pdf', '106.93149742067624', '-6.917306772581227', '2023-05-19 21:30:56', '2023-05-19 21:30:56', '', '', ''),
(24, 'Rika Fashion', 'rika-fashion', 1, 10, '08.00 - 17.00', '<p>fashion</p>', 'Warudoyong', 'Aktif', '085789762345', '', '', '', 'perizinan_usaha_1684557480075.pdf', 'sertifikat_usaha_1684557485201.pdf', '106.92179597432244', '-6.926731974832734', '2023-05-19 21:39:10', '2023-05-19 21:39:10', '', '', ''),
(25, 'RANGINANG JAMPANG', 'ranginang-jampang', 1, 7, '09.00 - 17.00', '<p>Hello world</p>', 'hello world', 'hello world', '081250331766', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html', 'perizinan_usaha_1686706543459.pdf', 'sertifikat_usaha_1686706551780.pdf', '106.91767173592092', '-6.915107845692461', '2023-06-13 18:36:20', '2023-06-13 18:36:20', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html'),
(26, 'Studio Fadil', 'studio-fadil', 1, 9, '08.00 - 17.00', '<p>Hello world</p>', 'Hello world', 'Aktif', '081250331766', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html', 'perizinan_usaha_1686708115901.pdf', 'sertifikat_usaha_1686708152936.pdf', '106.93486724241995', '-6.922155880560368', '2023-06-13 19:02:35', '2023-06-13 19:02:35', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html', 'https://legacy.reactjs.org/docs/forms.html');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_images`
--

CREATE TABLE `profil_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profil_id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `profil_images`
--

INSERT INTO `profil_images` (`id`, `profil_id`, `images`, `created_at`, `updated_at`) VALUES
(9, 18, 'SoHkrF9GdqyvJNpewLiBGjiDw8WnXQtHAOrGJiut.jpg', '2023-04-14 20:51:41', '2023-04-14 20:51:41'),
(10, 18, 'QTDGYURLHW4TusN31xlu8vlgxT49wZYjWRtOd7j4.jpg', '2023-04-14 20:51:41', '2023-04-14 20:51:41'),
(11, 18, 'YeDCAWZslTDoNt6emVrGqu4s4Z0tas9saflbpr8g.jpg', '2023-04-14 20:51:41', '2023-04-14 20:51:41'),
(15, 22, 'XknybM6ehDSNyUb6E2IEvA3DDa55LzbJg01tqYj2.jpg', '2023-05-19 21:27:49', '2023-05-19 21:27:49'),
(16, 22, 'K91QxLriv3uEZ2AjfTSDFMVpjIA9opdF4dStRtMX.jpg', '2023-05-19 21:27:49', '2023-05-19 21:27:49'),
(17, 23, 'YcwXbQoM4m18m2sx7hXgqG0d7bbJ1sWqzKnyzxkS.jpg', '2023-05-19 21:30:56', '2023-05-19 21:30:56'),
(18, 23, 'F9kKHSUT6KAcGIiJYuP2y9pCqSCk8ttCAcratVYF.jpg', '2023-05-19 21:30:56', '2023-05-19 21:30:56'),
(19, 23, '7SRJV1cy9w6xKXIFxilNtVl3v91F5E4ddBIhTIca.jpg', '2023-05-19 21:30:56', '2023-05-19 21:30:56'),
(20, 24, 'WxydtNvfzXyhf4R3SKBb6jI0Q5hlZ6VZvsNWKMj5.jpg', '2023-05-19 21:39:10', '2023-05-19 21:39:10'),
(21, 24, 'fU1Vsn7Ec7wCx21Lryfyx8wmUBkTapOVtss8Agkg.jpg', '2023-05-19 21:39:10', '2023-05-19 21:39:10'),
(22, 25, 's3VOU3Zvb6Sh7avdVI7qpBbwNxpQZQBCTAF33Lpr.jpg', '2023-06-13 18:36:20', '2023-06-13 18:36:20'),
(23, 25, 'aCcjFeaDeNpg6taG5lddnfxCnneop55h7vGLdGSf.jpg', '2023-06-13 18:36:20', '2023-06-13 18:36:20'),
(24, 26, 'ot04p2f320lfd7DitX7S3XJcXoE7Wh75GHzvbDGO.jpg', '2023-06-13 19:02:35', '2023-06-13 19:02:35'),
(25, 26, 'PGOBnNXqudUVcyYUEnJHPdV8gTSyqRTVZ6hSHjH8.jpg', '2023-06-13 19:02:35', '2023-06-13 19:02:35'),
(26, 26, 'UITwiGzmxtOU6KHenWstZ21CZFy99RYxepE04DNK.jpg', '2023-06-13 19:02:35', '2023-06-13 19:02:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sliders`
--

INSERT INTO `sliders` (`id`, `user_id`, `images`, `created_at`, `updated_at`) VALUES
(7, 1, 'CFNVDjFWMQnOkLmHaQAwlc36euds0Jz4ASISxK1b.jpg', '2023-04-14 20:54:52', '2023-04-14 20:54:52'),
(11, 1, 'VeJBOoH8Ft6i1hBMSSqqhl1yWNE2e45g67dA95Am.jpg', '2023-06-13 02:39:05', '2023-06-13 02:39:05'),
(12, 1, 'kM1BOulVorGPWJF14FEQRt4gjzcUpIqdENieVLRI.jpg', '2023-06-13 02:49:27', '2023-06-13 02:49:27'),
(13, 1, '53RDUckbyk8jJA11GaJ9GJetVsYJ9omcWuE0f2a0.jpg', '2023-06-13 02:49:32', '2023-06-13 02:49:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$10$nmPPnkWPfyGVGznh/OG97Owpvs.skXCi1KaWgSHc.ZSIu3ih.9xdy', NULL, NULL, NULL),
(3, 'Saeful A Sayuti', 'Saeful.abdulloh_ti19@nusaputra.ac.id', NULL, '$2y$10$T0E7vnQS5Z3UB2.DU2IsZOxrmFrVbOwJgeZdYWoRujp/b.178oa7S', NULL, '2023-04-13 00:42:01', '2023-04-13 00:46:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `profils`
--
ALTER TABLE `profils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profils_category_id_foreign` (`category_id`),
  ADD KEY `profils_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `profil_images`
--
ALTER TABLE `profil_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profil_images_profil_id_foreign` (`profil_id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `profils`
--
ALTER TABLE `profils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `profil_images`
--
ALTER TABLE `profil_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `profils`
--
ALTER TABLE `profils`
  ADD CONSTRAINT `profils_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `profils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `profil_images`
--
ALTER TABLE `profil_images`
  ADD CONSTRAINT `profil_images_profil_id_foreign` FOREIGN KEY (`profil_id`) REFERENCES `profils` (`id`);

--
-- Ketidakleluasaan untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
