-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26 مايو 2020 الساعة 02:53
-- إصدار الخادم: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`) VALUES
(2, 'php', 'exercitationemasa'),
(3, 'javascript', 'maioresss'),
(4, 'css', 'sunt'),
(5, 'html', 'assumenda'),
(6, 'relational databases', 'cumque'),
(7, 'linux', 'nesciunt');

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reply_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `likes`
--

INSERT INTO `likes` (`id`, `created_at`, `updated_at`, `user_id`, `reply_id`) VALUES
(2, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 5, 2),
(3, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 5, 31),
(4, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 9, 7),
(5, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 2, 25),
(6, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 3, 13),
(7, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 5, 30),
(8, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 2, 9),
(9, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 10, 39),
(10, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 5, 5),
(11, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 3, 17),
(12, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 8, 12),
(13, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 1, 32),
(14, '2020-03-16 17:15:50', '2020-03-16 17:15:50', 2, 28),
(15, '2020-03-16 17:15:51', '2020-03-16 17:15:51', 1, 29),
(16, '2020-03-16 17:15:51', '2020-03-16 17:15:51', 8, 15),
(17, '2020-03-16 17:15:51', '2020-03-16 17:15:51', 1, 39),
(18, '2020-03-16 17:15:51', '2020-03-16 17:15:51', 10, 38),
(19, '2020-03-16 17:15:51', '2020-03-16 17:15:51', 8, 15),
(20, '2020-03-16 17:15:51', '2020-03-16 17:15:51', 4, 21),
(24, '2020-05-25 00:44:32', '2020-05-25 00:44:32', 7, 53),
(25, '2020-05-25 01:04:07', '2020-05-25 01:04:07', 7, 52),
(38, '2020-05-25 01:58:59', '2020-05-25 01:58:59', 7, 57),
(45, '2020-05-25 03:13:32', '2020-05-25 03:13:32', 7, 54),
(46, '2020-05-25 03:15:43', '2020-05-25 03:15:43', 7, 56),
(51, '2020-05-25 03:35:51', '2020-05-25 03:35:51', 7, 55),
(55, '2020-05-25 22:21:39', '2020-05-25 22:21:39', 7, 62),
(56, '2020-05-25 22:36:53', '2020-05-25 22:36:53', 7, 63);

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_03_11_000000_create_categories_table', 1),
(4, '2020_03_11_192155_create_questions_table', 1),
(5, '2020_03_11_192242_create_replies_table', 1),
(6, '2020_03_11_192545_create_likes_table', 1),
(7, '2020_05_25_155914_create_websockets_statistics_entries_table', 2);

-- --------------------------------------------------------

--
-- بنية الجدول `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `questions`
--

INSERT INTO `questions` (`id`, `created_at`, `updated_at`, `title`, `slug`, `body`, `category_id`, `user_id`) VALUES
(1, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Laudantium similique libero non iste placeat doloribus vitae.', 'laudantium-similique-libero-non-iste-placeat-doloribus-vitae', 'Earum delectus voluptatem ut. Ab aspernatur autem aspernatur natus. Voluptatem sit amet repudiandae. Deleniti aut minima soluta est. Iure quo sunt a est cupiditate reiciendis sint.', 1, 8),
(2, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Aperiam tempora sunt dolor sed.', 'aperiam-tempora-sunt-dolor-sed', 'Dolore atque placeat culpa eos reprehenderit. Voluptatem cupiditate qui nam molestiae aut est in. Eum sapiente nisi neque distinctio.', 2, 8),
(3, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Vero laudantium atque illum ut aut explicabo.', 'vero-laudantium-atque-illum-ut-aut-explicabo', 'Magnam quia omnis et cumque dolorem dolore. Tenetur dolore sed ad dolorum est. Fugiat reiciendis possimus consequuntur nihil illum dicta repellat quas.', 1, 2),
(4, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Et perspiciatis corporis cum commodi velit non.', 'et-perspiciatis-corporis-cum-commodi-velit-non', 'Veniam officiis et aut sed facilis. Doloremque expedita sapiente sed ad. Debitis error est iste deserunt. Aliquid praesentium rerum aut aliquam molestiae fugit.', 2, 6),
(5, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Voluptas aperiam voluptatem voluptates dolorem.', 'voluptas-aperiam-voluptatem-voluptates-dolorem', 'Blanditiis laborum et mollitia tempore nam et. Molestiae consequatur laudantium et atque voluptas. Doloremque delectus fugit dolor est aut ad officiis iste. Dolor sit dolor rem quos.', 2, 6),
(6, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Quasi sed asperiores et et sunt dolore corporis occaecati.', 'quasi-sed-asperiores-et-et-sunt-dolore-corporis-occaecati', 'Quasi aspernatur blanditiis impedit quidem sunt velit. Assumenda nisi consectetur deserunt dolorem nisi. Molestiae corrupti sed fuga vel et.', 2, 10),
(7, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Dolores numquam aut quo odio aut temporibus hic.', 'dolores-numquam-aut-quo-odio-aut-temporibus-hic', 'Delectus pariatur dolores eaque. At fugit corporis excepturi adipisci doloribus.', 1, 10),
(8, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Laboriosam ad quasi quisquam voluptate dolorem alias vitae sint.', 'laboriosam-ad-quasi-quisquam-voluptate-dolorem-alias-vitae-sint', 'Ducimus et ab placeat veritatis rerum. Esse qui praesentium incidunt expedita nihil numquam sit. Sed corporis placeat sed tenetur illum. Quas et pariatur et tenetur in aperiam nam.', 1, 4),
(9, '2020-03-16 17:15:45', '2020-03-16 17:15:45', 'Dolores error voluptatem eveniet facere.', 'dolores-error-voluptatem-eveniet-facere', 'Et esse ipsum alias iure dolores sint. Excepturi fuga qui maiores molestiae illo molestiae eligendi. Ea non dignissimos veniam. Architecto commodi rerum voluptate iste eos.', 4, 9),
(10, '2020-03-16 17:15:46', '2020-03-16 17:21:57', 'cat', 'cat', 'body', 1, 1),
(11, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Doloribus totam recusandae voluptatem.', 'doloribus-totam-recusandae-voluptatem', 'Aut dignissimos laborum alias sed dignissimos atque placeat minima. Hic qui et veniam deleniti et. Et nam est est facere.', 2, 4),
(12, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Quaerat accusantium ipsum itaque enim.', 'quaerat-accusantium-ipsum-itaque-enim', 'Quis animi quos molestiae eum ut quis tenetur laudantium. Repudiandae eligendi voluptatum tempora non explicabo. Vero facere amet sapiente neque consectetur distinctio eum.', 1, 10),
(13, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Sit minus optio aperiam tempore.', 'sit-minus-optio-aperiam-tempore', 'Numquam ea voluptate iure quia. Hic eligendi repudiandae iure aliquam earum minima. Libero quo qui culpa aperiam deserunt.', 5, 5),
(14, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Corporis natus occaecati sunt veniam accusantium at assumenda.', 'corporis-natus-occaecati-sunt-veniam-accusantium-at-assumenda', 'Fugit voluptate dolores voluptatem itaque nulla. Qui sed dolores porro eum harum odio aspernatur. Sit beatae id voluptas laboriosam iure corporis.', 1, 9),
(15, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Et deserunt in sit.', 'et-deserunt-in-sit', 'Voluptatem ratione officiis ut veritatis quis autem corporis et. Repellendus sunt quod ut optio magni. Dolor quas illum atque neque totam nihil. Mollitia sit illo et et molestiae.', 2, 6),
(16, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Aut ex nihil iste ipsa.', 'aut-ex-nihil-iste-ipsa', 'Et quia est nulla in aut quidem. Soluta et error aut porro necessitatibus maxime. Enim doloremque et sit magnam occaecati in.', 2, 9),
(17, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Est cumque in accusantium minus nisi expedita iusto.', 'est-cumque-in-accusantium-minus-nisi-expedita-iusto', 'Quia tenetur nemo aut voluptatem velit. Quaerat cupiditate impedit enim dolores itaque.', 1, 8),
(18, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Commodi possimus non iusto architecto ea.', 'commodi-possimus-non-iusto-architecto-ea', 'Necessitatibus ea quisquam est quidem. In sapiente et ab. Reiciendis excepturi sed vero tempora nesciunt eum. Necessitatibus repudiandae voluptates nesciunt assumenda quas.', 5, 4),
(19, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Rerum ut veniam necessitatibus sint sit laborum.', 'rerum-ut-veniam-necessitatibus-sint-sit-laborum', 'Fugit et voluptas dolor maxime dolor velit. Officiis ab et facere dolorem et rerum in. Ut nam autem eos nihil autem odit dolore. Recusandae exercitationem cum consectetur vel.', 2, 10),
(20, '2020-03-16 17:15:46', '2020-03-16 17:15:46', 'Velit quidem quisquam impedit itaque et aspernatur et.', 'velit-quidem-quisquam-impedit-itaque-et-aspernatur-et', 'Quod ad sed quia accusantium. Nihil culpa autem tempora velit nihil debitis delectus. Est aut quia non enim.', 1, 9),
(21, '2020-03-17 00:49:53', '2020-03-17 00:49:53', 'tenetur', 'tenetur', 'Molestiae doloribus quas similique itaque. Consequuntur dolorum ipsam nobis ut voluptatem voluptas eveniet. Rerum harum aut dolores eos ad iste voluptatem pariatur. Optio ad facere aut et laudantium.', 10, 11),
(22, '2020-03-17 00:49:53', '2020-03-17 00:49:53', 'quo', 'quo', 'Et ea qui ea ea et qui sed. Quam dolor iusto earum alias quibusdam. Ipsa voluptas eveniet mollitia eius. Optio illum velit voluptate iusto dolorum. Quasi debitis veritatis vero autem.', 9, 10),
(23, '2020-03-17 00:49:53', '2020-05-25 22:35:09', 'what is the new features in php7', 'minima', 'what is the new features in php7what is the new features in php7\nwhat is the new features in php7what is the new features in php7', 2, 7),
(24, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'eos', 'eos', 'Quia enim repellat voluptas aut voluptatem optio. Ipsam quia natus sunt. Dignissimos praesentium et ipsam qui.', 5, 18),
(25, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'animi', 'animi', 'Dolor et quasi voluptatem itaque voluptas quae. Ut explicabo nostrum voluptas cupiditate. Quibusdam voluptas nesciunt sed quas totam aperiam sint molestiae.', 5, 3),
(26, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'enim', 'enim', 'Eum a earum repudiandae cumque temporibus et at. Sapiente voluptas aperiam inventore nam. Qui voluptate sit sunt consequuntur.', 8, 14),
(27, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'doloremque', 'doloremque', 'Sit itaque id ut cupiditate sint. Aut corrupti perspiciatis magni deleniti quo quia. Quia sint harum minus fuga ducimus. Quis molestiae at mollitia quia voluptas.', 9, 9),
(28, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'tempore', 'tempore', 'Quis nostrum deleniti animi aperiam consectetur et qui. Nisi soluta dolor perspiciatis. Placeat dolor dolorem quisquam.', 10, 16),
(30, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'aut', 'aut', 'Sit aut fugit et dolor est quisquam. Minus dolore aut in aut ut. Ea magni pariatur velit sit impedit eos ut. Nulla eveniet deserunt voluptate rerum et. Mollitia explicabo harum laborum.', 6, 20),
(31, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'ex', 'ex', 'Ratione vero magni qui rerum. Tempora minima corrupti ducimus ratione minima. Est ut aut quidem blanditiis quasi. Esse enim dolorem blanditiis consequatur aut. Omnis et numquam aut et facere nemo.', 1, 19),
(32, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'totam', 'totam', 'Laboriosam quisquam et enim eum quidem qui non. Quod omnis est quia ratione dolorem tenetur vel.', 1, 12),
(33, '2020-03-17 00:49:54', '2020-03-17 00:49:54', 'est', 'est', 'Possimus consequuntur quia et perspiciatis sunt odio ut. Dolor nihil dolores rerum sapiente qui quod provident.', 7, 10),
(62, '2020-05-25 22:18:01', '2020-05-25 22:18:01', 'what is laravel', 'what-is-laravel', 'what is laravel and how it works', 2, 7),
(63, '2020-05-25 22:24:43', '2020-05-25 22:24:43', 'what is the road map to become full stack developer', 'what-is-the-road-map-to-become-full-stack-developer', 'i want to know what is the road map to become full stack developer\nand how to maintain all these technologies', 3, 7);

-- --------------------------------------------------------

--
-- بنية الجدول `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `replies`
--

INSERT INTO `replies` (`id`, `created_at`, `updated_at`, `body`, `user_id`, `question_id`) VALUES
(2, '2020-03-16 17:15:46', '2020-03-18 19:49:36', '\"some body\"', 8, 2),
(3, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Quo velit a error. Porro saepe quasi architecto nostrum. Maiores quis et expedita quam. Mollitia impedit nostrum numquam.', 6, 3),
(4, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Eius reprehenderit hic quis cum occaecati. Et sint non consequatur delectus soluta officia. Ab nihil ducimus animi.', 8, 1),
(5, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Iure vel qui illum labore. Aut consequatur blanditiis quia a deleniti. Nisi ad rerum qui.', 9, 4),
(6, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Qui error molestiae et ipsam qui vel tenetur. Quia voluptate distinctio voluptas accusamus iste. Delectus repudiandae vel nisi blanditiis ut assumenda assumenda.', 2, 19),
(7, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Sequi culpa ut dolores. Labore odio officia earum sed. Pariatur sed soluta qui ea repellendus vero quo.', 4, 13),
(8, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Dolorum ut vero in sapiente ducimus atque non. Voluptatem cum error quisquam neque.', 4, 19),
(9, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Aut explicabo hic culpa est at. Eligendi unde quis pariatur nam iste molestiae. Hic magnam at aut ex. Eos cumque voluptas quos et similique doloribus. Ea accusamus fuga iure ea doloribus quae.', 9, 14),
(10, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Autem est sed adipisci in natus. Ea possimus et sunt ut. Aliquid similique nisi officiis repellat cum quis.', 2, 3),
(11, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Facere cum fuga iure debitis officia. Laboriosam aut qui libero deleniti sed. Hic porro culpa voluptatum nam velit. Deleniti sequi laboriosam sed consequatur quis consequuntur.', 4, 13),
(12, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Voluptatibus ut voluptatem qui nihil vero nobis et. Veritatis praesentium non excepturi. Est illo accusantium voluptatem accusantium. Vel sapiente laboriosam culpa possimus quae rerum.', 5, 8),
(13, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Enim et ea occaecati quia. Omnis perferendis assumenda nemo quis doloremque laboriosam. Cupiditate dolore dignissimos accusantium saepe aliquid. Similique sit doloremque eligendi enim sit.', 1, 19),
(14, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Est alias ad animi molestias et. Est praesentium et quibusdam ipsa. Itaque quod est dignissimos delectus magnam nobis non. Pariatur eaque corporis ut animi cupiditate accusantium.', 10, 10),
(15, '2020-03-16 17:15:47', '2020-03-16 17:15:47', 'Eum nam ut voluptatibus. Eum doloremque consequuntur quo inventore dolores. Soluta occaecati minima quidem qui. Cumque delectus est occaecati perspiciatis.', 10, 7),
(16, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Excepturi quam et rerum quae quas. Vero harum tenetur rem modi maiores. Libero ut dolorem et quia libero laudantium voluptate. Quasi quibusdam ducimus officia quo facere distinctio est.', 4, 8),
(17, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Sint sed qui fuga doloremque molestiae dolores. Fugiat hic autem aut soluta et temporibus. Voluptate earum vero voluptatibus architecto eum. Quo unde minus atque molestiae iusto.', 6, 16),
(18, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Sequi perferendis voluptatem rerum debitis nostrum laborum. Quis saepe rerum odio. Quo ullam dicta totam omnis suscipit.', 4, 7),
(19, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Sit dolores nobis inventore molestiae voluptatem modi quia at. Voluptas quia iste itaque voluptatibus. Minus commodi sint totam aut eum voluptatibus. Omnis in omnis assumenda totam.', 5, 1),
(20, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Quo exercitationem nesciunt animi exercitationem. Deserunt facere eaque voluptatibus possimus iure accusantium facere et. Nisi molestiae aliquid explicabo qui.', 7, 16),
(21, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Nulla quos in nihil unde. Laborum beatae est consequatur. Atque enim animi ex natus est ipsam.', 1, 10),
(22, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Molestiae nam sed rerum voluptatem totam. Ratione sapiente asperiores qui dolorem dolores. Placeat odio corporis vel accusamus ducimus facere libero.', 7, 16),
(23, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Id doloremque voluptatibus dolore quod laudantium laborum. Cumque nesciunt vitae autem porro dolor. Eos adipisci distinctio dignissimos ut.', 3, 17),
(24, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Facilis corporis reprehenderit maiores. Ex facere molestiae perferendis. Est molestiae facere non tenetur est. Amet dolorum sunt iste omnis possimus est nostrum.', 9, 9),
(25, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Sit perferendis expedita beatae cumque natus maxime quis perferendis. Cumque tempora facere alias. Placeat cupiditate temporibus aliquid animi iure. Porro rerum unde quo pariatur officiis aliquam.', 3, 16),
(26, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Placeat autem illo modi possimus reiciendis ullam. Sit nihil occaecati optio et. Provident exercitationem sequi nam dolorum iure.', 9, 17),
(27, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Sequi ipsam impedit earum rem eos et. Velit expedita quia doloribus ut incidunt blanditiis et. Quia aliquid inventore laudantium sunt dolores reprehenderit qui. Eum qui ut eius ex quod sequi aut ut.', 6, 11),
(28, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Autem harum sunt omnis aut. Architecto magnam dolorem aspernatur consequuntur excepturi sed maxime. Error autem consequatur non tempore vel neque. Consequatur occaecati nulla soluta aut quo.', 10, 4),
(29, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Eligendi itaque perspiciatis fugiat occaecati qui sed. Corrupti sint vel sed non provident expedita voluptatem. Recusandae iste suscipit eos numquam minus hic harum illo.', 2, 5),
(30, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Dolor distinctio voluptas inventore ipsum tempora. Eum nulla quis aut maiores praesentium ex commodi.', 2, 12),
(31, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Fugit quia laudantium quas temporibus et autem est. Commodi quos sed vel excepturi beatae. Dolores minus debitis repellat soluta. Quaerat ipsum minima blanditiis corporis non minus debitis.', 6, 13),
(32, '2020-03-16 17:15:48', '2020-03-16 17:15:48', 'Vel necessitatibus similique consequatur magnam. Ut neque iusto delectus officiis. Possimus nam velit deleniti repudiandae sed et vel. Odio maxime vel rerum in.', 9, 15),
(33, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Dolor quas expedita consequuntur consequatur cum. Earum tempora doloremque dolore quo. Earum incidunt explicabo ipsa impedit. Vitae totam quis molestiae architecto ad.', 2, 9),
(34, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Sed ullam quia dolorem ut molestiae ut dolores. Ea ut molestiae ut tenetur labore impedit et.', 10, 5),
(35, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Pariatur et autem eaque perspiciatis. Eaque rerum autem officiis. Ea consequatur ea quia incidunt et.', 8, 2),
(36, '2020-03-16 17:15:49', '2020-03-18 19:22:55', '\"some body\"', 1, 2),
(37, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Sint iste similique libero qui ipsa vero est. Quaerat ut repellat et qui id itaque. Corporis vel corrupti reprehenderit architecto molestiae molestiae dolorum.', 3, 9),
(38, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Et eum commodi perspiciatis consequatur cupiditate illo. Sed a eius quis corrupti iste quia. Molestiae porro voluptas ducimus voluptatem ipsum qui.', 6, 5),
(39, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Molestias adipisci mollitia quaerat qui. Non quas sit adipisci possimus. Qui magnam sit perferendis iusto provident ut.', 4, 6),
(40, '2020-03-16 17:15:49', '2020-03-16 17:15:49', 'Accusantium exercitationem modi et ut ullam ut occaecati. Ad repellendus distinctio et voluptatem asperiores a aut nam. Vitae sit et officiis cumque necessitatibus.', 4, 7),
(50, '2020-05-22 23:34:42', '2020-05-22 23:34:42', 'nmnmn', 7, 53),
(51, '2020-05-22 23:34:43', '2020-05-22 23:34:43', 'nmnmn', 7, 53),
(52, '2020-05-25 00:25:47', '2020-05-25 00:25:47', 'dsdsds', 7, 54),
(53, '2020-05-25 00:26:01', '2020-05-25 00:26:01', 'ffffgffg', 7, 54),
(54, '2020-05-25 01:28:06', '2020-05-25 01:28:06', 'hyyhy', 7, 55),
(55, '2020-05-25 01:30:23', '2020-05-25 01:30:23', 'jjjjjjjjjj', 7, 55),
(56, '2020-05-25 01:44:09', '2020-05-25 01:44:09', 'ddsdsss', 7, 55),
(57, '2020-05-25 01:58:54', '2020-05-25 01:58:54', 'gfggfgf', 7, 55),
(58, '2020-05-25 02:01:08', '2020-05-25 02:01:08', 'fdfddfdfd', 7, 55),
(59, '2020-05-25 02:06:11', '2020-05-25 02:07:30', 'fdfdfdhjjhh\nfdfddffdhjhj', 7, 55),
(60, '2020-05-25 03:19:33', '2020-05-25 03:19:33', 'fdgfgf', 7, 55),
(61, '2020-05-25 22:20:19', '2020-05-25 22:20:19', 'laravel is greatest mvc php framework', 7, 62),
(62, '2020-05-25 22:21:32', '2020-05-25 22:21:32', 'mvc framework to easily maintain your web app', 7, 62),
(63, '2020-05-25 22:36:46', '2020-05-25 22:36:46', 'you can ask google', 7, 63);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Meaghan Carter II', 'candida.mosciski@example.org', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8erzs1JdDw', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(2, 'Alba Hamill', 'sarah.franecki@example.net', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'A9K0VImrcr', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(3, 'Miss Sarina D\'Amore Jr.', 'alexis98@example.org', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hluIjyz0Fx', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(4, 'Kailey Marks', 'sdouglas@example.net', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oB0oXxGDQQ', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(5, 'Aditya Turcotte', 'van90@example.net', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'X50qMhUGId', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(6, 'Prof. Ahmed Rau Sr.', 'colten89@example.net', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VovSIogkxz', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(7, 'Elliot Crooks', 'admin@admin.com', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jpPkIQvMLl', '2020-03-16 17:15:43', '2020-03-16 17:15:43'),
(8, 'Madge Fay', 'idare@example.com', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6UoS8Owa9V', '2020-03-16 17:15:44', '2020-03-16 17:15:44'),
(9, 'Stone Will', 'hlowe@example.com', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9TwSXIeUzd', '2020-03-16 17:15:44', '2020-03-16 17:15:44'),
(10, 'Prof. Levi Fisher Jr.', 'twila50@example.org', '2020-03-16 17:15:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iSMPAM51yB', '2020-03-16 17:15:44', '2020-03-16 17:15:44'),
(11, 'Clementina O\'Reilly', 'fbatz@example.net', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FU3O2HeRpN', '2020-03-17 00:49:50', '2020-03-17 00:49:50'),
(12, 'Jammie Bayer', 'salvador.terry@example.net', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HrODud4u8H', '2020-03-17 00:49:50', '2020-03-17 00:49:50'),
(13, 'Ms. Teresa Jacobs DVM', 'djacobs@example.com', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OcIod5mv8W', '2020-03-17 00:49:50', '2020-03-17 00:49:50'),
(14, 'Bettye Mayert', 'rey.armstrong@example.net', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oeHnVDXywc', '2020-03-17 00:49:50', '2020-03-17 00:49:50'),
(15, 'Eula Dare', 'lurline.feest@example.org', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MldnkM78Vu', '2020-03-17 00:49:50', '2020-03-17 00:49:50'),
(16, 'Dr. Gus Moore', 'ovandervort@example.com', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LoTWxtMyVU', '2020-03-17 00:49:51', '2020-03-17 00:49:51'),
(17, 'Bart Hammes', 'maia50@example.com', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1E5ftW7OIS', '2020-03-17 00:49:51', '2020-03-17 00:49:51'),
(18, 'Felix McCullough', 'celestino55@example.com', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'o7TaN7rEwD', '2020-03-17 00:49:51', '2020-03-17 00:49:51'),
(19, 'Prof. Billy Schroeder I', 'achamplin@example.com', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ec4fJw4svc', '2020-03-17 00:49:51', '2020-03-17 00:49:51'),
(20, 'Loren Fritsch', 'cankunding@example.com', '2020-03-17 00:49:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SFuXvuDd8l', '2020-03-17 00:49:52', '2020-03-17 00:49:52'),
(22, 'sasasa', 'saas@admin.com', NULL, 'password', NULL, '2020-05-12 01:31:59', '2020-05-12 01:31:59'),
(23, 'mustfa', 'mustfa@example.com', NULL, 'password', NULL, '2020-05-12 15:49:51', '2020-05-12 15:49:51'),
(24, 'mus', 'mus@admin.com', NULL, 'password', NULL, '2020-05-12 15:51:01', '2020-05-12 15:51:01'),
(25, 'sss', 'ss@admin.com', NULL, 'ssssss', NULL, '2020-05-12 15:52:00', '2020-05-12 15:52:00'),
(26, 'sasa', 'sasa@admin.com', NULL, 'sasasa', NULL, '2020-05-12 15:57:49', '2020-05-12 15:57:49'),
(27, 'sasa', 'sasasa@admin.com', NULL, 'sasasa', NULL, '2020-05-12 15:59:15', '2020-05-12 15:59:15'),
(28, 'fefe', 'fefe@dd.com', NULL, 'fefefe', NULL, '2020-05-12 16:02:24', '2020-05-12 16:02:24'),
(29, 'fefe', 'fef@dd.com', NULL, 'fefefe', NULL, '2020-05-12 16:18:37', '2020-05-12 16:18:37'),
(30, 'rffddffddfe', 'fssef@dd.com', NULL, 'fefefe', NULL, '2020-05-12 16:20:25', '2020-05-12 16:20:25'),
(31, 'rffddffddfe', 'fssssef@dd.com', NULL, 'fefefe', NULL, '2020-05-12 16:23:37', '2020-05-12 16:23:37'),
(32, 'mostfa', 'mostfa@admin.com', NULL, 'sasasa', NULL, '2020-05-12 16:24:08', '2020-05-12 16:24:08'),
(33, 'mostfa', 'mostfa1@admin.com', NULL, 'password', NULL, '2020-05-12 16:25:08', '2020-05-12 16:25:08'),
(34, 'mostfa11', 'mostfa11@admin.com', NULL, 'password', NULL, '2020-05-12 16:25:38', '2020-05-12 16:25:38'),
(35, 'mustfa', 'mostfa2@admin.com', NULL, 'password', NULL, '2020-05-12 16:27:38', '2020-05-12 16:27:38'),
(36, 'mostfa', 'mostfa222@admin.com', NULL, 'password', NULL, '2020-05-12 16:28:28', '2020-05-12 16:28:28'),
(37, 'dssd', 'alec333@example.com', NULL, 'password', NULL, '2020-05-13 19:08:00', '2020-05-13 19:08:00'),
(38, 'sasa', 'alec3@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2...\r\n', NULL, '2020-05-13 19:08:40', '2020-05-13 19:08:40'),
(39, 'dsds', 'alec31@example.com', NULL, 'password', NULL, '2020-05-13 19:24:10', '2020-05-13 19:24:10'),
(40, 'bjbj', 'alec32@example.com', NULL, 'password', NULL, '2020-05-13 19:25:20', '2020-05-13 19:25:20'),
(41, 'sdsd', 'alec35dsds@example.com', NULL, 'password', NULL, '2020-05-13 19:30:51', '2020-05-13 19:30:51'),
(42, 'fdfddf', 'alec33df@example.com', NULL, 'password', NULL, '2020-05-13 19:34:08', '2020-05-13 19:34:08'),
(43, 'dsd', 'alec33ds@example.com', NULL, 'password', NULL, '2020-05-13 19:38:31', '2020-05-13 19:38:31'),
(44, 'sasasa', 'alec33as@example.com', NULL, 'password', NULL, '2020-05-13 22:59:57', '2020-05-13 22:59:57'),
(45, 'ewew', 'alec33qq@example.com', NULL, 'password', NULL, '2020-05-13 23:06:39', '2020-05-13 23:06:39'),
(46, 'sas', 'alec33wqqq@example.com', NULL, 'password', NULL, '2020-05-13 23:38:04', '2020-05-13 23:38:04');

-- --------------------------------------------------------

--
-- بنية الجدول `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `questions_slug_unique` (`slug`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
