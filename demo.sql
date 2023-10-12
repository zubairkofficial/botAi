-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2023 at 02:32 AM
-- Server version: 10.3.38-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `themeta1_writebot`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_earnings`
--

CREATE TABLE `affiliate_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `subscription_history_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `commission_rate` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_earnings`
--

INSERT INTO `affiliate_earnings` (`id`, `user_id`, `referred_by`, `subscription_history_id`, `amount`, `commission_rate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 2, 5, 2.5, 10, '2023-06-05 21:09:04', '2023-06-05 21:09:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `payment_method` varchar(191) NOT NULL,
  `payment_document` longtext DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'requested',
  `additional_info` longtext DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payout_accounts`
--

CREATE TABLE `affiliate_payout_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `account_details` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_chats`
--

CREATE TABLE `ai_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ai_chat_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `total_words` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ai_chats`
--

INSERT INTO `ai_chats` (`id`, `user_id`, `ai_chat_category_id`, `title`, `total_words`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Ai Chat Bot Chat', 0, '2023-06-17 19:21:33', '2023-06-17 19:22:08', NULL),
(2, 1, 1, 'New Chat with Ai', 0, '2023-06-17 19:22:18', '2023-06-17 19:23:05', NULL),
(3, 1, 2, 'Mr Kevin Chat', 0, '2023-06-17 19:23:16', '2023-06-17 19:24:43', NULL),
(4, 1, 2, 'Writebot SEO', 0, '2023-06-17 19:24:48', '2023-06-17 19:25:34', NULL),
(5, 1, 1, 'Ai Chat Bot Chat', 0, '2023-06-19 10:17:10', '2023-06-19 10:17:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ai_chat_categories`
--

CREATE TABLE `ai_chat_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `role` varchar(191) DEFAULT NULL,
  `user_name` varchar(191) DEFAULT NULL,
  `assists_with` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ai_chat_categories`
--

INSERT INTO `ai_chat_categories` (`id`, `name`, `short_name`, `slug`, `description`, `role`, `user_name`, `assists_with`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ai Chat Bot', 'DC', 'default', 'Chat With AI', 'default', '', '', 'backend/assets/img/expertise/1.jpg', NULL, NULL, NULL),
(2, 'Mr Kevin', 'MK', 'seo-expert', 'Chat With SEO Expert', 'SEO Expert', '', 'I will assist you to generate better the seo contents', 'backend/assets/img/expertise/2.jpg', NULL, NULL, NULL),
(3, 'Tara Prater', 'TP', 'cyber-expert', 'Chat With Cybersecurity Expert', 'Cybersecurity Expert', '', 'I will guide you for the security of your online world', 'backend/assets/img/expertise/3.jpg', NULL, NULL, NULL),
(4, 'Carol Vizcarra', 'CV', 'career-consultant', 'Chat With Career Consultant', 'Career Consultant', '', 'I will guide you to be more successful in your career', 'backend/assets/img/expertise/4.jpg', NULL, NULL, NULL),
(5, 'Megan Hyde', 'MH', 'accountant', 'Chat With Accountant', 'Accountant', '', 'I will answer your accounting related questions', 'backend/assets/img/expertise/5.jpg', NULL, NULL, NULL),
(6, 'Flossie Cardoza', 'FC', 'mbbs-doctor', 'Chat With MBBS Doctor', 'MBBS Doctor', '', 'I will help you to have a healthy life', 'backend/assets/img/expertise/6.jpg', NULL, NULL, NULL),
(7, 'Matthew Smith', 'MS', 'Interior-Designer', 'Chat With Interior Designer', 'Interior Designer', '', 'I will help you to decorate your lifestyle', 'backend/assets/img/expertise/7.jpg', NULL, NULL, NULL),
(8, 'Mary Easley', 'ME', 'Business-Consultant', 'Chat With Business Consultant', 'Business Consultant', '', 'I will help you to expand your business', 'backend/assets/img/expertise/8.jpg', NULL, NULL, NULL),
(9, 'Tammy Allen', 'TA', 'Neurosurgery-Specialist', 'Chat With Neurosurgery Specialist', 'Neurosurgery Specialist', '', 'I will assist you with neurosurgery information', 'backend/assets/img/expertise/9.jpg', NULL, NULL, NULL),
(10, 'Evan Vaughn', 'EV', 'Language-Tutor', 'Chat With Language Tutor', 'Language Tutor', '', 'I will help you learning and developing your language skills', 'backend/assets/img/expertise/10.jpg', NULL, NULL, NULL),
(11, 'Lottie Tuck', 'LT', 'Travel-Guide', 'Chat With Lottie Tuck', 'Travel Guide', '', 'I will help you to locate your next travel', 'backend/assets/img/expertise/11.jpg', NULL, NULL, NULL),
(12, 'William Wood', 'WW', 'UI/UX-Designer', 'Chat With UI/UX Designer', 'UI/UX Designer', '', 'I will help you designing & creating user experiences for your website & applications', 'backend/assets/img/expertise/12.jpg', NULL, NULL, NULL),
(13, 'Jason Ferrara', 'JF', 'Web-Developer', 'Chat With Web Developer', 'Web Developer', '', 'I will help you developing your website & applications', 'backend/assets/img/expertise/13.jpg', NULL, NULL, NULL),
(14, 'Henry Martin', 'HM', 'Finance-Expert', 'Chat With Finance Expert', 'Finance Expert', '', 'I will help you in your finances', 'backend/assets/img/expertise/14.jpg', NULL, NULL, NULL),
(15, 'Paul Teeter', 'PT', 'Locksmith-Expert', 'Chat With Locksmith Expert', 'Locksmith Expert', '', 'I will help you to secure your assets', 'backend/assets/img/expertise/15.jpg', NULL, NULL, NULL),
(16, 'Carl Oakes', 'CO', 'Fitness-Trainer', 'Chat With Fitness Trainer', 'Fitness Trainer', '', 'I will help you to keep yourself healthy & fit', 'backend/assets/img/expertise/16.jpg', NULL, NULL, NULL),
(17, 'Carl Oakes', 'CO', 'Fitness-Trainer', 'Chat With Fitness Trainer', 'Fitness Trainer', '', 'I will help you to keep yourself healthy & fit', 'backend/assets/img/expertise/17.jpg', NULL, NULL, NULL),
(18, 'Jeffery Ham', 'JH', 'Motivational-Expert', 'Chat With Motivational Expert', 'Motivational Expert', '', 'I will help you to cheer you up to achieve your next goal', 'backend/assets/img/expertise/18.jpg', NULL, NULL, NULL),
(19, 'Maria Hoy', 'MH', 'Photographer', 'Chat With Photographer', 'Photographer', '', 'I will help you to capture photos with quality', 'backend/assets/img/expertise/19.jpg', NULL, NULL, NULL),
(20, 'Julie Fields', 'JF', 'Project-Manager', 'Chat With Project Manager', 'Project Manager', '', 'I will help you to manage your projects & team', 'backend/assets/img/expertise/20.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ai_chat_messages`
--

CREATE TABLE `ai_chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ai_chat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prompt` longtext DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `words` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ai_chat_messages`
--

INSERT INTO `ai_chat_messages` (`id`, `ai_chat_id`, `user_id`, `prompt`, `response`, `result`, `words`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Hello! I am Ai Chat Bot, and I\'m here to answer your all questions.', 'Hello! I am Ai Chat Bot, and I\'m here to answer your all questions.', 0, '2023-06-17 19:21:33', '2023-06-17 19:21:33'),
(2, 1, 1, 'Hey', NULL, 'Hey', 0, '2023-06-17 19:21:42', '2023-06-17 19:21:42'),
(3, 1, 1, NULL, 'Hello! How may I assist you today?', 'Hello! How may I assist you today?', 7, '2023-06-17 19:21:44', '2023-06-17 19:21:44'),
(4, 1, 1, 'Can you find me a location?', NULL, 'Can you find me a location?', 0, '2023-06-17 19:22:08', '2023-06-17 19:22:08'),
(5, 1, 1, NULL, 'Sure, where would you like me to find a location for you? Please provide me with some details about what you\'re looking for.', 'Sure, where would you like me to find a location for you? Please provide me with some details about what you\'re looking for.', 23, '2023-06-17 19:22:13', '2023-06-17 19:22:13'),
(6, 2, 1, NULL, 'Hello! I am Ai Chat Bot, and I\'m here to answer your all questions.', 'Hello! I am Ai Chat Bot, and I\'m here to answer your all questions.', 0, '2023-06-17 19:22:18', '2023-06-17 19:22:18'),
(7, 2, 1, 'Hey', NULL, 'Hey', 0, '2023-06-17 19:22:46', '2023-06-17 19:22:46'),
(8, 2, 1, NULL, 'Hello! How may I assist you today?', 'Hello! How may I assist you today?', 7, '2023-06-17 19:22:48', '2023-06-17 19:22:48'),
(9, 2, 1, 'Tell me your experties', NULL, 'Tell me your experties', 0, '2023-06-17 19:23:05', '2023-06-17 19:23:05'),
(10, 2, 1, NULL, 'As an AI chatbot, I have expertise in various domains such as answering general knowledge questions, providing weather updates, news headlines, scheduling appointments, setting reminders, making recommendations, conversions from one unit to another, and chit-chatting. However, my capabilities are not limited to these, and I am always learning and improving to better assist you.', 'As an AI chatbot, I have expertise in various domains such as answering general knowledge questions, providing weather updates, news headlines, scheduling appointments, setting reminders, making recommendations, conversions from one unit to another, and chit-chatting. However, my capabilities are not limited to these, and I am always learning and improving to better assist you.', 54, '2023-06-17 19:23:10', '2023-06-17 19:23:10'),
(11, 3, 1, NULL, 'Hello! I am Mr Kevin, and I\'m SEO Expert. I will assist you to generate better the seo contents.', 'Hello! I am Mr Kevin, and I\'m SEO Expert. I will assist you to generate better the seo contents.', 0, '2023-06-17 19:23:16', '2023-06-17 19:23:16'),
(12, 3, 1, 'Hey', NULL, 'Hey', 0, '2023-06-17 19:23:22', '2023-06-17 19:23:22'),
(13, 3, 1, NULL, 'Hello! How may I assist you today?', 'Hello! How may I assist you today?', 7, '2023-06-17 19:23:24', '2023-06-17 19:23:24'),
(14, 3, 1, 'Can I know your experties?', NULL, 'Can I know your experties?', 0, '2023-06-17 19:23:31', '2023-06-17 19:23:31'),
(15, 3, 1, NULL, 'Sure! I am an SEO (Search Engine Optimization) expert. My expertise includes keyword research, on-page optimization, link building, content creation, website analysis, and SEO strategy development. I am experienced in working with various industries such as e-commerce, health and wellness, technology, and more. I also stay up-to-date with the latest SEO trends and algorithm updates to ensure that my clients\' websites are optimized to achieve top search engine rankings.', 'Sure! I am an SEO (Search Engine Optimization) expert. My expertise includes keyword research, on-page optimization, link building, content creation, website analysis, and SEO strategy development. I am experienced in working with various industries such as e-commerce, health and wellness, technology, and more. I also stay up-to-date with the latest SEO trends and algorithm updates to ensure that my clients\' websites are optimized to achieve top search engine rankings.', 69, '2023-06-17 19:23:39', '2023-06-17 19:23:39'),
(16, 3, 1, 'How can I improve my website seo?', NULL, 'How can I improve my website seo?', 0, '2023-06-17 19:24:26', '2023-06-17 19:24:26'),
(17, 3, 1, NULL, 'Here are some ways you can improve your website\'s SEO:\n\n1. Do keyword research and use relevant keywords throughout your content.\n\n2. Optimize your website\'s meta tags (title, description, and headers).\n\n3. Improve website speed through optimization techniques like image compression, using a CDN, etc.\n\n4. Make sure your website is mobile-friendly.\n\n5. Build high-quality backlinks to your website.\n\n6. Improve your website\'s user experience.\n\n7. Create high-quality, informative, and engaging content for your website.\n\n8. Use internal linking to connect pages on your website.\n\n9. Monitor your website\'s analytics to track progress and make necessary improvements.\n\n10. Keep up-to-date with the latest SEO trends and algorithm updates.', 'Here are some ways you can improve your website\'s SEO:<br/><br/>1. Do keyword research and use relevant keywords throughout your content.<br/><br/>2. Optimize your website\'s meta tags (title, description, and headers).<br/><br/>3. Improve website speed through optimization techniques like image compression, using a CDN, etc.<br/><br/>4. Make sure your website is mobile-friendly.<br/><br/>5. Build high-quality backlinks to your website.<br/><br/>6. Improve your website\'s user experience.<br/><br/>7. Create high-quality, informative, and engaging content for your website.<br/><br/>8. Use internal linking to connect pages on your website.<br/><br/>9. Monitor your website\'s analytics to track progress and make necessary improvements.<br/><br/>10. Keep up-to-date with the latest SEO trends and algorithm updates.', 98, '2023-06-17 19:24:37', '2023-06-17 19:24:37'),
(18, 3, 1, 'Thanks', NULL, 'Thanks', 0, '2023-06-17 19:24:43', '2023-06-17 19:24:43'),
(19, 3, 1, NULL, 'You\'re welcome! If you have any more questions or need further assistance, feel free to ask.', 'You\'re welcome! If you have any more questions or need further assistance, feel free to ask.', 16, '2023-06-17 19:24:46', '2023-06-17 19:24:46'),
(20, 4, 1, NULL, 'Hello! I am Mr Kevin, and I\'m SEO Expert. I will assist you to generate better the seo contents.', 'Hello! I am Mr Kevin, and I\'m SEO Expert. I will assist you to generate better the seo contents.', 0, '2023-06-17 19:24:48', '2023-06-17 19:24:48'),
(21, 4, 1, 'Hey', NULL, 'Hey', 0, '2023-06-17 19:25:04', '2023-06-17 19:25:04'),
(22, 4, 1, NULL, 'Hello! How may I assist you today?', 'Hello! How may I assist you today?', 7, '2023-06-17 19:25:05', '2023-06-17 19:25:05'),
(23, 4, 1, 'Can you find best seo keyword for writbot', NULL, 'Can you find best seo keyword for writbot', 0, '2023-06-17 19:25:34', '2023-06-17 19:25:34'),
(24, 4, 1, NULL, 'Certainly! For the keyword \"Writbot\", here are some potential SEO keywords you could consider:\n\n1. Online writing tool\n2. AI writing software\n3. Writing assistant\n4. Content generation platform\n5. Automated writing tool\n6. Writing productivity software\n7. Writing efficiency tools\n8. Writing productivity app\n9. AI copywriter software\n10. Text generation software\n\nPlease let me know if you have any questions or if there\'s anything else I can help you with.', 'Certainly! For the keyword \"Writbot\", here are some potential SEO keywords you could consider:<br/><br/>1. Online writing tool<br/>2. AI writing software<br/>3. Writing assistant<br/>4. Content generation platform<br/>5. Automated writing tool<br/>6. Writing productivity software<br/>7. Writing efficiency tools<br/>8. Writing productivity app<br/>9. AI copywriter software<br/>10. Text generation software<br/><br/>Please let me know if you have any questions or if there\'s anything else I can help you with.', 61, '2023-06-17 19:25:43', '2023-06-17 19:25:43'),
(25, 5, 1, NULL, 'Hello! I am Ai Chat Bot, and I\'m here to answer your all questions.', 'Hello! I am Ai Chat Bot, and I\'m here to answer your all questions.', 0, '2023-06-19 10:17:10', '2023-06-19 10:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `thumbnail_image` text DEFAULT NULL,
  `banner` longtext DEFAULT NULL,
  `video_provider` varchar(191) NOT NULL DEFAULT 'youtube' COMMENT 'youtube / vimeo / ...',
  `video_link` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_popular` tinyint(4) NOT NULL DEFAULT 0,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_img` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `blog_category_id`, `short_description`, `description`, `thumbnail_image`, `banner`, `video_provider`, `video_link`, `is_active`, `is_popular`, `meta_title`, `meta_img`, `meta_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'OpenAI Prompts to Supercharge Sales & Marketing Teams', 'openai-prompts-to-supercharge-sales-marketing-teams-f9g8r', 1, 'Prompts are text-based commands that AI can understand and respond to. It’s basically how you describe the desired output—what you want AI to do for you, and how.', '<div id=\"what-are-prompts\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Prompts are text-based commands that AI can understand and respond to. It’s basically how you describe the desired output—what you want AI to do for you, and how. A prompt may contain any combination of:</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Questions</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Statements</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Definitions</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Instructions</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Input data (or context)</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Role assignments to provide additional context (i.e. asking AI to answer a data security question as a “detailed-oriented head of IT with 15 years experience”)</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\"><span style=\"box-sizing: border-box;\">ChatGPT ≠ GPT.</span>&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">If you’re new to generative AI, it’s easy to get befuddled by all the acronyms.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">GPT—or Generative Pre-trained Transformer—refers to a family of natural language processing (NLP) models developed by OpenAI. It’s basically the engine that runs all generative AI-related platforms, including ChatGPT and WriteBot. Its latest version is&nbsp;<font color=\"#47beb9\"><span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><u>GPT-4</u></span></font>, but you’ll also frequently hear about GPT-3 and GPT-3.5.</p></div><div id=\"prompt-best-practices\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Prompt best practices</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Before you get started with AI prompts, here are a few things to keep in mind:</p><ol role=\"list\" style=\"box-sizing: border-box; margin-bottom: 10px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">There’s no magic prompt.&nbsp;</span>The Internet is flooded with AI prompts, but it might take some trial and error before you figure out which type is most effective for your particular use case.&nbsp;</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Clarify your desired outcome.</span>&nbsp;A good rule of thumb: the response will generally be as broad or specific as its prompt. In some cases, it might actually be&nbsp;preferable&nbsp;to skimp on the details—like if you’re brainstorming blog post topics and want more varied and diverse answers. Something more complex, like a sales playbook or will almost always require more details.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Garbage in, garbage out.&nbsp;</span>The quality of the output depends entirely on the input. AI enables teams to move a lot faster, but it’s still important to take the time to flesh out your prompts. Otherwise, you could find yourself drowning in responses that are unclear, inaccurate, irrelevant or just wildly off-base.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Do your homework.</span>&nbsp;AI performs three core functions: processing data, identfiying patterns, and making predictions. It was&nbsp;not&nbsp;designed to fact check its own outputs, which is why it’s important to do your due dilligence and manually verify accuracy.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">ABT: Always Be Testing.&nbsp;</span>If you’ve ever heard someone fret about a potential robot uprising, that’s probably because AI “teaches” itself every time it processes new data. Prompt iteration—tweaking, testing, and refining different types of instructions—will help generate more usable responses over time. Often, it’s just a matter of rephrasing your prompts. If you feel tuck, try playing around with synonyms.</li></ol></div>', NULL, '7', 'youtube', NULL, 1, 0, 'OpenAI Prompts to Supercharge Sales & Marketing Teams', NULL, 'Prompts are text-based commands that AI can understand and respond to. It’s basically how you describe the desired output—what you want AI to do for you, and how.', '2023-05-29 15:15:33', '2023-06-19 10:23:36', NULL),
(2, 'How To Create Powerful Competitor Battlecards with AI', 'how-to-create-powerful-competitor-battlecards-with-ai-onvqv', 3, 'It’s not breaking news that buyer expectations have changed. And because of this, it’s forced sales teams to change how they sell.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">It’s not breaking news that buyer expectations have changed. And because of this, it’s forced sales teams to change&nbsp;<font color=\"#160647\" face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">how&nbsp;they sell.&nbsp;</span></font></p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Sales people no longer hold all of the cards when it comes to access to information about a product or service—not with Google around. Today, people spend less time talking to companies, and more time researching on their own. In fact “any given sales rep has roughly 5% of a customer’s total purchase time” according to&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Gartner</span>.&nbsp; The rest of their time is used on internal discussions and research.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">So, your sales reps need to be ready to address questions, concerns, and be the experts across the competitive landscape when they’ve got a prospect’s attention.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That’s where battlecards come in.</p><div id=\"what-are-sales-battlecards\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\">What are sales battlecards?</h2><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Sales battlecards provide the information your sales team needs on calls in order to have more productive conversations that move the deal forward.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Effective battlecards need to be an “at-a-glance” reference that can help quickly and effectively respond to common customer objections and questions about competitors.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">They usually feature some combination of the following:</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Company Overview:</span>&nbsp;An elevator pitch of the company and its services</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Target Market:&nbsp;</span>Key personas or functions they will be reaching out to</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Competitor Overview:</span>&nbsp;List of key competitors and their offerings in the market</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Competitive Advantage:</span>&nbsp;How your company stacks up against each competitor</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Pain Points:</span>&nbsp;A list of pain points that your customers typically experience</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Customer Success Stories:</span>&nbsp;Internal success statistics, case studies, and testimonials</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Objection Handling:</span>&nbsp;Common objections that come up during sales calls along with clear and concise responses</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\">While skeptics might claim these tools to be just another piece of sales enablement collateral collecting dust, they\'re a proven method for helping sales teams win deals.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\"><span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">According to a survey</span>&nbsp;of over 1,000 sales enablement and competitive intelligence professionals, 63% enable their sellers with competitive battlecards and a healthy subset of that bunch believe that they’ve increased their win rate as a result.</p></div><div id=\"best-practices-for-creating-battlecards\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\">Best practices for creating battlecards</h2><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Creating effective battlecards that will&nbsp;actually&nbsp;set your sales team up for success is a lot more than cobbling together existing assets and cramming them into one page. Building even one effective battlecard involves a lot of moving parts and digesting a huge amount of information.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">A great battlecard is:&nbsp;</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Clear and concise:&nbsp;</span>So your team can understand what information is there without feeling overwhelmed.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Scannable and organized:</span>&nbsp;Serving as a quick reference for pre-call or in-the-moment conversations.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Informative and helpful:</span>&nbsp;No words should be wasted in the making of this&nbsp; battle card.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Based around customer feedback:</span>&nbsp;It’s not a compilation of educated guesses your team is making, but rather filled out from customer feedback across sales, marketing, and success efforts.</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\">If you’re thinking about crafting your own sales battle card,&nbsp;</p></div>', NULL, '8', 'youtube', NULL, 1, 0, 'How To Create Powerful Competitor Battlecards with AI', NULL, 'It’s not breaking news that buyer expectations have changed. And because of this, it’s forced sales teams to change how they sell.', '2023-05-29 16:01:12', '2023-06-19 10:24:46', NULL),
(3, 'Best AI Translation Software (That You\'ll Actually Use)', 'best-ai-translation-software-that-youll-actually-use-2gv8r', 5, 'The term “AI translation” is exactly what it sounds like the process of using machine learning and natural language processing (NLP) techniques to translate text from one language to another automatically.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">The term “AI translation” is exactly what it sounds like the process of using machine learning and natural language processing (NLP) techniques to translate text from one language to another automatically. The goal is to preserve the meaning, context, and tone of the original content.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Sometimes this works really well, and sometimes it really doesn’t. It all depends on the software you use.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">But advancements in artificial intelligence (AI) have made it easier than ever to get reliable translations for all your text-based assets at a low cost.&nbsp;</p><div id=\"are-ai-translations-reliable-2\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Are AI translations reliable?&nbsp;</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Like any technology, AI translations aren’t&nbsp;always&nbsp;perfect and sometimes make errors or mistranslations. This is especially true with idiomatic expressions and cultural nuances, which can stump human translators, too.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That said, nothing with tech stays still for long.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI translation tools have come a long way in recent years and have become increasingly reliable. With the development of neural machine translation (NMT) models, these tools have become better at recognizing context and generating translations that accurately reflect the tone and meaning of the original content.&nbsp;</p></div><div id=\"why-would-companies-use-ai-for-translations-2\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Why would companies use AI for translations?&nbsp;</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI has completely transformed the way companies interact with their audience. Customers expect highly personalized user journeys, and with all the software at your disposal, communicating with customers in their first language has become table stakes.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Here are some reasons why companies are increasingly turning to AI translation tools:</p><div id=\"1-fast-and-cost-effective-solution\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">1. Fast and cost-effective solution</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI translations offer a more efficient and budget-friendly alternative to hiring professional human translators. These tools can process large volumes of text in seconds, allowing businesses to save both time and money on translation tasks without sacrificing quality.</p></div><div id=\"2-breaking-down-language-barriers\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">2. Breaking down language barriers</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">With the ability to translate text and speech in real-time, AI translation tools enable companies to communicate effectively with people from diverse backgrounds. This creates better relationships, improves customer satisfaction, and expands the company\'s reach in global markets (win-win-win).&nbsp;</p></div><div id=\"3-scalability\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">3. Scalability</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">As a company expands its operations and deals with more languages, AI translation tools can effortlessly scale to meet these growing needs. This scalability ensures businesses can continue to provide timely and accurate translations regardless of the size or complexity of their projects.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\"><font face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">Curious to see how AI can scale your business in other ways? Check out this post on&nbsp;</span></font><span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">becoming AI native</span><font face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">.&nbsp;</span></font></p></div><div id=\"4-evolving-technology\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">4. Evolving technology</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI translation technology is constantly evolving, with improvements in accuracy happening all the time. While it may not always be perfect, the technology has reached a level where it\'s often accurate enough for many business use cases.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">And with that in mind, let’s turn to some of the best AI translation software at your disposal.</p></div></div>', NULL, '2', 'youtube', NULL, 1, 0, 'Best AI Translation Software (That You\'ll Actually Use)', NULL, 'The term “AI translation” is exactly what it sounds like the process of using machine learning and natural language processing (NLP) techniques to translate text from one language to another automatically.', '2023-05-29 16:06:30', '2023-06-19 10:28:56', NULL),
(4, 'Generate Personalized Cold InMail Messages at Scale with AI', 'generate-personalized-cold-inmail-messages-at-scale-with-ai-cnmpi', 4, 'Cold InMail is a part of many sales teams’ strategy, and for good reason: 78% of companies that use social selling outperform those who don’t.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">Cold InMail is a part of many sales teams’ strategy, and for good reason:&nbsp;78% of companies that use social selling&nbsp;outperform those who don’t.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">However, finding success with cold InMails isn’t as easy as blasting hundreds of LinkedIn users with generic, cookie-cutter messages. Every week, professionals receive dozens—if not hundreds—of cold messages on LinkedIn. In most cases, when people look at their LinkedIn inbox, here’s how they’re feeling:</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Cutting through the noise requires salespeople to craft personalized, clear messages for the people they’re selling to.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">In this article, we’ll walk through how you can make your InMail messages stand out, why personalization matters, and how you can use artificial intelligence (AI) to produce personalized and engaging InMails at scale.</p><div id=\"what-makes-a-great-inmail-message\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\">What makes a great InMail message?</h2><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Chances are, you could take a look at your LinkedIn inbox today and identify a handful of terrible cold messages. Maybe they got your name wrong (or addressed you simply as “Sir and/or Madam”) or sent you a pitch that’s completely irrelevant to your role or industry. Instant delete.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">But, if you think back to a message that&nbsp;did&nbsp;prompt you to respond or book a call, can you think of what made it stand out?</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Often, it’s harder to pinpoint the elements that make up&nbsp;<span style=\"box-sizing: border-box;\">a strong InMail message</span>&nbsp;than it is to find the glaring errors in those that aren’t effective. However, if you look closely, you’ll find that effective InMails generally nail these four elements.</p><div id=\"personalization\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Personalization</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">According to McKinsey,&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">71% of consumers</span>&nbsp;expect companies to deliver personalized experiences, and 76% get frustrated when they don’t.&nbsp; This goes beyond product recommendations on a website or an email. People want to feel like they’re at the center of a brand’s universe, not just one of the masses.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That’s why LinkedIn InMails that are sent individually also see&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">response rates that are 15% higher</span>&nbsp;than InMails blasted en masse.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Clearly, personalization matters. But how you personalize a message&nbsp;also&nbsp;matters.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">To get the best results from your cold InMail messages, you’ll want to go beyond simply addressing a recipient by name. You’ll also want to tailor your pitch to their business’ industry or the prospect’s role at an organization (and the challenges they’re likely facing). You can also mention something specific and interesting about their profile or background to show that you’ve done your research.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">When using any generative AI platform, the way in which you write prompts will make a big difference.</p></div></div>', NULL, '12', 'youtube', NULL, 1, 0, 'Generate Personalized Cold InMail Messages at Scale with AI', NULL, 'Cold InMail is a part of many sales teams’ strategy, and for good reason: 78% of companies that use social selling outperform those who don’t.', '2023-05-29 16:10:26', '2023-06-19 10:25:11', NULL),
(5, '6 Best AI Blog Post Generators for 2023', '6-best-ai-blog-post-generators-for-2023-y2mal', 1, 'As a content creator, marketer, or business owner, you spend a large part of your day—and marketing budget—producing blog posts.', '<div id=\"6-best-ai-blog-post-generators-for-2023\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><p style=\"box-sizing: border-box; margin-bottom: 24px;\">As a content creator, marketer, or business owner, you spend a large part of your day—and marketing budget—producing blog posts. But sometimes, your creative engine refuses to kickstart and needs a little extra oil. Or, you’re so caught up in a myriad of other tasks that you can’t put as much thought as you’d like into the writing process.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That’s nothing a sprinkle of AI can’t fix. Whether you’re growing a personal blog, scaling content marketing operations, or building a business, an AI blog post generator helps ignite your creative spark, saves you time, and frees up your resources for other activities.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Compare the top six AI blog post generators on the market and choose the tool that will best serve your writing needs.&nbsp;</p></div><div id=\"6-best-ai-blog-post-generators\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\"><span style=\"box-sizing: border-box;\">6 Best AI blog post generators</span></h2><figure class=\"w-richtext-figure-type-image w-richtext-align-fullwidth\" style=\"box-sizing: border-box; margin-right: auto; margin-bottom: 16px; margin-left: auto; position: relative; width: 764px; clear: both;\"><div style=\"box-sizing: border-box; display: inline-block; padding-bottom: inherit;\"><img src=\"https://assets-global.website-files.com/628288c5cd3e8451380a36c7/642225aa88e5ba1f3347bc36_Table%20(1).png\" loading=\"lazy\" alt=\"\" style=\"box-sizing: border-box; border: 0px; display: inline-block; border-radius: 24px; width: 764px;\"></div></figure></div>', NULL, '7', 'youtube', NULL, 1, 0, '6 Best AI Blog Post Generators for 2023', NULL, 'As a content creator, marketer, or business owner, you spend a large part of your day—and marketing budget—producing blog posts.', '2023-05-29 16:12:49', '2023-06-19 10:24:33', NULL),
(6, 'Automated Product Descriptions for E-commerce', 'automated-product-descriptions-for-e-commerce-9cwix', 3, 'An automated product description is exactly what it sounds like: a product description displayed on your website, but one written by a piece of technology (meaning artificial intelligence) rather than a human.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">An automated product description is exactly what it sounds like: a product description displayed on your website, but one written by a piece of technology (meaning artificial intelligence) rather than a human.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">There are a few reasons why retailers might choose to automate their product descriptions:</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Save time</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Save money</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Generate better descriptions</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\">First, automated product descriptions can&nbsp;<span style=\"box-sizing: border-box;\">help large e-commerce retailers save time</span>. Rather than writing descriptions for every item you sell, you can create them with generative AI at the click of a button.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">In other cases, companies might have a content marketing team without having a professional copywriter on staff. These businesses are left with two options: use an AI writing tool or outsource the project to a freelance copywriter.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">While both roads will likely lead you to better product descriptions, hiring a copywriter will be more expensive (and time-consuming) than using an AI writing tool.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Search the phrase<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;\'writers for product descriptions\'</span>&nbsp;on sites like Upwork, and you’ll spend anywhere between $40 - $200 per hour for minimal descriptions. And according to ZipRecruiter, the average&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">e-commerce copywriter earns $48,408</span>&nbsp;per year (or $23/hour).<br style=\"box-sizing: border-box;\"><br style=\"box-sizing: border-box;\">AI content generators, however, gives you a professional e-commerce copywriter in a box&nbsp;<span style=\"box-sizing: border-box;\">that can write product descriptions at scale</span>.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Copy.ai, for example, costs $49/month and&nbsp;<span style=\"box-sizing: border-box;\">lets you write unlimited words</span>&nbsp;in both long and short-form content.This gives you everything you need for product descriptions in bulk and your other text-based marketing assets. And for those of you doing the math, unlimited content with Copy.ai is roughly two hours of the average copywriter\'s time.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Finally, online retailers may find that&nbsp;<span style=\"box-sizing: border-box;\">they get better quality output from an AI writing tool</span>&nbsp;than they do from outsourcing to a writer on Upwork. This is becoming more and more common as AI tools are continuously improving in quality.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Considering the accessibility, affordability, and potential for growth offered by modern product description generators, there\'s no reason for large retailers to drag their heels on implementation.</p><div id=\"do-product-descriptions-impact-conversion-rates\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Do product descriptions impact conversion rates?</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Yes, product descriptions impact conversion rates. This happens both directly and indirectly.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Indirectly, product descriptions have the potential to bring more organic traffic. That’s because they’re large pieces of text on your product’s landing page, meaning it can be crawled/ranked by Google.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">SEO-friendly product descriptions are a great way of attracting more customers to your online store through search engines.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">But product descriptions also have a more direct impact on your conversions/sales.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">The way your product is conveyed can be the deciding factor on whether or not customers go ahead with their purchase. Descriptions that are generic, thin, or vague tend to underperform compared to descriptions that are engaging, full, and…well…&nbsp;descriptive.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">This makes product descriptions the ideal place to highlight the value of your products and the quality of your brand.</p></div>', NULL, '11', 'youtube', NULL, 1, 0, 'Automated Product Descriptions for Large E-commerce Retailers', NULL, 'An automated product description is exactly what it sounds like: a product description displayed on your website, but one written by a piece of technology (meaning artificial intelligence) rather than a human.', '2023-05-29 16:17:44', '2023-06-19 10:25:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'OpenAi', '2023-05-29 15:06:58', '2023-05-29 15:06:58', NULL),
(2, 'Announcements', '2023-05-29 15:07:50', '2023-05-29 15:07:50', NULL),
(3, 'Technology', '2023-05-29 15:08:08', '2023-05-29 15:08:08', NULL),
(4, 'Free Tools', '2023-05-29 15:08:22', '2023-05-29 15:08:22', NULL),
(5, 'Marketing', '2023-05-29 15:08:39', '2023-05-29 15:08:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_localizations`
--

CREATE TABLE `blog_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `lang_key` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_localizations`
--

INSERT INTO `blog_localizations` (`id`, `blog_id`, `title`, `short_description`, `description`, `lang_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'OpenAI Prompts to Supercharge Sales & Marketing Teams', 'Prompts are text-based commands that AI can understand and respond to. It’s basically how you describe the desired output—what you want AI to do for you, and how.', '<div id=\"what-are-prompts\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Prompts are text-based commands that AI can understand and respond to. It’s basically how you describe the desired output—what you want AI to do for you, and how. A prompt may contain any combination of:</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Questions</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Statements</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Definitions</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Instructions</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Input data (or context)</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Role assignments to provide additional context (i.e. asking AI to answer a data security question as a “detailed-oriented head of IT with 15 years experience”)</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\"><span style=\"box-sizing: border-box;\">ChatGPT ≠ GPT.</span>&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">If you’re new to generative AI, it’s easy to get befuddled by all the acronyms.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">GPT—or Generative Pre-trained Transformer—refers to a family of natural language processing (NLP) models developed by OpenAI. It’s basically the engine that runs all generative AI-related platforms, including ChatGPT and WriteBot. Its latest version is&nbsp;<font color=\"#47beb9\"><span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><u>GPT-4</u></span></font>, but you’ll also frequently hear about GPT-3 and GPT-3.5.</p></div><div id=\"prompt-best-practices\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Prompt best practices</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Before you get started with AI prompts, here are a few things to keep in mind:</p><ol role=\"list\" style=\"box-sizing: border-box; margin-bottom: 10px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">There’s no magic prompt.&nbsp;</span>The Internet is flooded with AI prompts, but it might take some trial and error before you figure out which type is most effective for your particular use case.&nbsp;</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Clarify your desired outcome.</span>&nbsp;A good rule of thumb: the response will generally be as broad or specific as its prompt. In some cases, it might actually be&nbsp;preferable&nbsp;to skimp on the details—like if you’re brainstorming blog post topics and want more varied and diverse answers. Something more complex, like a sales playbook or will almost always require more details.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Garbage in, garbage out.&nbsp;</span>The quality of the output depends entirely on the input. AI enables teams to move a lot faster, but it’s still important to take the time to flesh out your prompts. Otherwise, you could find yourself drowning in responses that are unclear, inaccurate, irrelevant or just wildly off-base.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Do your homework.</span>&nbsp;AI performs three core functions: processing data, identfiying patterns, and making predictions. It was&nbsp;not&nbsp;designed to fact check its own outputs, which is why it’s important to do your due dilligence and manually verify accuracy.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">ABT: Always Be Testing.&nbsp;</span>If you’ve ever heard someone fret about a potential robot uprising, that’s probably because AI “teaches” itself every time it processes new data. Prompt iteration—tweaking, testing, and refining different types of instructions—will help generate more usable responses over time. Often, it’s just a matter of rephrasing your prompts. If you feel tuck, try playing around with synonyms.</li></ol></div>', 'en', '2023-05-29 15:15:33', '2023-06-19 10:23:36', NULL),
(2, 2, 'How To Create Powerful Competitor Battlecards with AI', 'It’s not breaking news that buyer expectations have changed. And because of this, it’s forced sales teams to change how they sell.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">It’s not breaking news that buyer expectations have changed. And because of this, it’s forced sales teams to change&nbsp;<font color=\"#160647\" face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">how&nbsp;they sell.&nbsp;</span></font></p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Sales people no longer hold all of the cards when it comes to access to information about a product or service—not with Google around. Today, people spend less time talking to companies, and more time researching on their own. In fact “any given sales rep has roughly 5% of a customer’s total purchase time” according to&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Gartner</span>.&nbsp; The rest of their time is used on internal discussions and research.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">So, your sales reps need to be ready to address questions, concerns, and be the experts across the competitive landscape when they’ve got a prospect’s attention.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That’s where battlecards come in.</p><div id=\"what-are-sales-battlecards\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\">What are sales battlecards?</h2><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Sales battlecards provide the information your sales team needs on calls in order to have more productive conversations that move the deal forward.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Effective battlecards need to be an “at-a-glance” reference that can help quickly and effectively respond to common customer objections and questions about competitors.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">They usually feature some combination of the following:</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Company Overview:</span>&nbsp;An elevator pitch of the company and its services</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Target Market:&nbsp;</span>Key personas or functions they will be reaching out to</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Competitor Overview:</span>&nbsp;List of key competitors and their offerings in the market</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Competitive Advantage:</span>&nbsp;How your company stacks up against each competitor</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Pain Points:</span>&nbsp;A list of pain points that your customers typically experience</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Customer Success Stories:</span>&nbsp;Internal success statistics, case studies, and testimonials</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Objection Handling:</span>&nbsp;Common objections that come up during sales calls along with clear and concise responses</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\">While skeptics might claim these tools to be just another piece of sales enablement collateral collecting dust, they\'re a proven method for helping sales teams win deals.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\"><span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">According to a survey</span>&nbsp;of over 1,000 sales enablement and competitive intelligence professionals, 63% enable their sellers with competitive battlecards and a healthy subset of that bunch believe that they’ve increased their win rate as a result.</p></div><div id=\"best-practices-for-creating-battlecards\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\">Best practices for creating battlecards</h2><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Creating effective battlecards that will&nbsp;actually&nbsp;set your sales team up for success is a lot more than cobbling together existing assets and cramming them into one page. Building even one effective battlecard involves a lot of moving parts and digesting a huge amount of information.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">A great battlecard is:&nbsp;</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Clear and concise:&nbsp;</span>So your team can understand what information is there without feeling overwhelmed.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Scannable and organized:</span>&nbsp;Serving as a quick reference for pre-call or in-the-moment conversations.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Informative and helpful:</span>&nbsp;No words should be wasted in the making of this&nbsp; battle card.</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\"><span style=\"box-sizing: border-box;\">Based around customer feedback:</span>&nbsp;It’s not a compilation of educated guesses your team is making, but rather filled out from customer feedback across sales, marketing, and success efforts.</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\">If you’re thinking about crafting your own sales battle card,&nbsp;</p></div>', 'en', '2023-05-29 16:01:12', '2023-06-19 10:24:46', NULL),
(3, 3, 'Best AI Translation Software (That You\'ll Actually Use)', 'The term “AI translation” is exactly what it sounds like the process of using machine learning and natural language processing (NLP) techniques to translate text from one language to another automatically.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">The term “AI translation” is exactly what it sounds like the process of using machine learning and natural language processing (NLP) techniques to translate text from one language to another automatically. The goal is to preserve the meaning, context, and tone of the original content.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Sometimes this works really well, and sometimes it really doesn’t. It all depends on the software you use.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">But advancements in artificial intelligence (AI) have made it easier than ever to get reliable translations for all your text-based assets at a low cost.&nbsp;</p><div id=\"are-ai-translations-reliable-2\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Are AI translations reliable?&nbsp;</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Like any technology, AI translations aren’t&nbsp;always&nbsp;perfect and sometimes make errors or mistranslations. This is especially true with idiomatic expressions and cultural nuances, which can stump human translators, too.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That said, nothing with tech stays still for long.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI translation tools have come a long way in recent years and have become increasingly reliable. With the development of neural machine translation (NMT) models, these tools have become better at recognizing context and generating translations that accurately reflect the tone and meaning of the original content.&nbsp;</p></div><div id=\"why-would-companies-use-ai-for-translations-2\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Why would companies use AI for translations?&nbsp;</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI has completely transformed the way companies interact with their audience. Customers expect highly personalized user journeys, and with all the software at your disposal, communicating with customers in their first language has become table stakes.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Here are some reasons why companies are increasingly turning to AI translation tools:</p><div id=\"1-fast-and-cost-effective-solution\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">1. Fast and cost-effective solution</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI translations offer a more efficient and budget-friendly alternative to hiring professional human translators. These tools can process large volumes of text in seconds, allowing businesses to save both time and money on translation tasks without sacrificing quality.</p></div><div id=\"2-breaking-down-language-barriers\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">2. Breaking down language barriers</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">With the ability to translate text and speech in real-time, AI translation tools enable companies to communicate effectively with people from diverse backgrounds. This creates better relationships, improves customer satisfaction, and expands the company\'s reach in global markets (win-win-win).&nbsp;</p></div><div id=\"3-scalability\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">3. Scalability</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">As a company expands its operations and deals with more languages, AI translation tools can effortlessly scale to meet these growing needs. This scalability ensures businesses can continue to provide timely and accurate translations regardless of the size or complexity of their projects.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\"><font face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">Curious to see how AI can scale your business in other ways? Check out this post on&nbsp;</span></font><span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">becoming AI native</span><font face=\"Inter, sans-serif\"><span style=\"font-size: 16px;\">.&nbsp;</span></font></p></div><div id=\"4-evolving-technology\" style=\"box-sizing: border-box;\"><h4 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 30px;\">4. Evolving technology</h4><p style=\"box-sizing: border-box; margin-bottom: 24px;\">AI translation technology is constantly evolving, with improvements in accuracy happening all the time. While it may not always be perfect, the technology has reached a level where it\'s often accurate enough for many business use cases.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">And with that in mind, let’s turn to some of the best AI translation software at your disposal.</p></div></div>', 'en', '2023-05-29 16:06:30', '2023-06-19 10:24:57', NULL),
(4, 4, 'Generate Personalized Cold InMail Messages at Scale with AI', 'Cold InMail is a part of many sales teams’ strategy, and for good reason: 78% of companies that use social selling outperform those who don’t.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">Cold InMail is a part of many sales teams’ strategy, and for good reason:&nbsp;78% of companies that use social selling&nbsp;outperform those who don’t.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">However, finding success with cold InMails isn’t as easy as blasting hundreds of LinkedIn users with generic, cookie-cutter messages. Every week, professionals receive dozens—if not hundreds—of cold messages on LinkedIn. In most cases, when people look at their LinkedIn inbox, here’s how they’re feeling:</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Cutting through the noise requires salespeople to craft personalized, clear messages for the people they’re selling to.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">In this article, we’ll walk through how you can make your InMail messages stand out, why personalization matters, and how you can use artificial intelligence (AI) to produce personalized and engaging InMails at scale.</p><div id=\"what-makes-a-great-inmail-message\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\">What makes a great InMail message?</h2><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Chances are, you could take a look at your LinkedIn inbox today and identify a handful of terrible cold messages. Maybe they got your name wrong (or addressed you simply as “Sir and/or Madam”) or sent you a pitch that’s completely irrelevant to your role or industry. Instant delete.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">But, if you think back to a message that&nbsp;did&nbsp;prompt you to respond or book a call, can you think of what made it stand out?</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Often, it’s harder to pinpoint the elements that make up&nbsp;<span style=\"box-sizing: border-box;\">a strong InMail message</span>&nbsp;than it is to find the glaring errors in those that aren’t effective. However, if you look closely, you’ll find that effective InMails generally nail these four elements.</p><div id=\"personalization\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Personalization</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">According to McKinsey,&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">71% of consumers</span>&nbsp;expect companies to deliver personalized experiences, and 76% get frustrated when they don’t.&nbsp; This goes beyond product recommendations on a website or an email. People want to feel like they’re at the center of a brand’s universe, not just one of the masses.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That’s why LinkedIn InMails that are sent individually also see&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">response rates that are 15% higher</span>&nbsp;than InMails blasted en masse.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Clearly, personalization matters. But how you personalize a message&nbsp;also&nbsp;matters.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">To get the best results from your cold InMail messages, you’ll want to go beyond simply addressing a recipient by name. You’ll also want to tailor your pitch to their business’ industry or the prospect’s role at an organization (and the challenges they’re likely facing). You can also mention something specific and interesting about their profile or background to show that you’ve done your research.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">When using any generative AI platform, the way in which you write prompts will make a big difference.</p></div></div>', 'en', '2023-05-29 16:10:26', '2023-06-19 10:25:11', NULL),
(5, 5, '6 Best AI Blog Post Generators for 2023', 'As a content creator, marketer, or business owner, you spend a large part of your day—and marketing budget—producing blog posts.', '<div id=\"6-best-ai-blog-post-generators-for-2023\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><p style=\"box-sizing: border-box; margin-bottom: 24px;\">As a content creator, marketer, or business owner, you spend a large part of your day—and marketing budget—producing blog posts. But sometimes, your creative engine refuses to kickstart and needs a little extra oil. Or, you’re so caught up in a myriad of other tasks that you can’t put as much thought as you’d like into the writing process.&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">That’s nothing a sprinkle of AI can’t fix. Whether you’re growing a personal blog, scaling content marketing operations, or building a business, an AI blog post generator helps ignite your creative spark, saves you time, and frees up your resources for other activities.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Compare the top six AI blog post generators on the market and choose the tool that will best serve your writing needs.&nbsp;</p></div><div id=\"6-best-ai-blog-post-generators\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h2 style=\"box-sizing: border-box; margin-bottom: 16px; margin-top: 10px; line-height: 40px;\"><span style=\"box-sizing: border-box;\">6 Best AI blog post generators</span></h2><figure class=\"w-richtext-figure-type-image w-richtext-align-fullwidth\" style=\"box-sizing: border-box; margin-right: auto; margin-bottom: 16px; margin-left: auto; position: relative; width: 764px; clear: both;\"><div style=\"box-sizing: border-box; display: inline-block; padding-bottom: inherit;\"><img src=\"https://assets-global.website-files.com/628288c5cd3e8451380a36c7/642225aa88e5ba1f3347bc36_Table%20(1).png\" loading=\"lazy\" alt=\"\" style=\"box-sizing: border-box; border: 0px; display: inline-block; border-radius: 24px; width: 764px;\"></div></figure></div>', 'en', '2023-05-29 16:12:49', '2023-06-19 10:24:33', NULL),
(6, 6, 'Automated Product Descriptions for E-commerce', 'An automated product description is exactly what it sounds like: a product description displayed on your website, but one written by a piece of technology (meaning artificial intelligence) rather than a human.', '<p style=\"box-sizing: border-box; margin-bottom: 24px;\">An automated product description is exactly what it sounds like: a product description displayed on your website, but one written by a piece of technology (meaning artificial intelligence) rather than a human.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">There are a few reasons why retailers might choose to automate their product descriptions:</p><ul role=\"list\" style=\"box-sizing: border-box; margin-bottom: 16px; padding-left: 40px; overflow: hidden;\"><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Save time</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Save money</li><li style=\"box-sizing: border-box; margin-bottom: 16px;\">Generate better descriptions</li></ul><p style=\"box-sizing: border-box; margin-bottom: 24px;\">First, automated product descriptions can&nbsp;<span style=\"box-sizing: border-box;\">help large e-commerce retailers save time</span>. Rather than writing descriptions for every item you sell, you can create them with generative AI at the click of a button.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">In other cases, companies might have a content marketing team without having a professional copywriter on staff. These businesses are left with two options: use an AI writing tool or outsource the project to a freelance copywriter.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">While both roads will likely lead you to better product descriptions, hiring a copywriter will be more expensive (and time-consuming) than using an AI writing tool.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Search the phrase<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;\'writers for product descriptions\'</span>&nbsp;on sites like Upwork, and you’ll spend anywhere between $40 - $200 per hour for minimal descriptions. And according to ZipRecruiter, the average&nbsp;<span style=\"text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">e-commerce copywriter earns $48,408</span>&nbsp;per year (or $23/hour).<br style=\"box-sizing: border-box;\"><br style=\"box-sizing: border-box;\">AI content generators, however, gives you a professional e-commerce copywriter in a box&nbsp;<span style=\"box-sizing: border-box;\">that can write product descriptions at scale</span>.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Copy.ai, for example, costs $49/month and&nbsp;<span style=\"box-sizing: border-box;\">lets you write unlimited words</span>&nbsp;in both long and short-form content.This gives you everything you need for product descriptions in bulk and your other text-based marketing assets. And for those of you doing the math, unlimited content with Copy.ai is roughly two hours of the average copywriter\'s time.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Finally, online retailers may find that&nbsp;<span style=\"box-sizing: border-box;\">they get better quality output from an AI writing tool</span>&nbsp;than they do from outsourcing to a writer on Upwork. This is becoming more and more common as AI tools are continuously improving in quality.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Considering the accessibility, affordability, and potential for growth offered by modern product description generators, there\'s no reason for large retailers to drag their heels on implementation.</p><div id=\"do-product-descriptions-impact-conversion-rates\" style=\"box-sizing: border-box; scroll-margin-top: 120px;\"><h3 style=\"box-sizing: border-box; margin-bottom: 16px; line-height: 35px;\">Do product descriptions impact conversion rates?</h3><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Yes, product descriptions impact conversion rates. This happens both directly and indirectly.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">Indirectly, product descriptions have the potential to bring more organic traffic. That’s because they’re large pieces of text on your product’s landing page, meaning it can be crawled/ranked by Google.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">SEO-friendly product descriptions are a great way of attracting more customers to your online store through search engines.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">But product descriptions also have a more direct impact on your conversions/sales.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">The way your product is conveyed can be the deciding factor on whether or not customers go ahead with their purchase. Descriptions that are generic, thin, or vague tend to underperform compared to descriptions that are engaging, full, and…well…&nbsp;descriptive.</p><p style=\"box-sizing: border-box; margin-bottom: 24px;\">This makes product descriptions the ideal place to highlight the value of your products and the quality of your brand.</p></div>', 'en', '2023-05-29 16:17:44', '2023-06-19 10:25:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `blog_id`, `tag_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, NULL, NULL, NULL),
(2, 1, 4, NULL, NULL, NULL),
(3, 1, 5, NULL, NULL, NULL),
(4, 1, 9, NULL, NULL, NULL),
(5, 1, 10, NULL, NULL, NULL),
(6, 2, 3, NULL, NULL, NULL),
(7, 2, 7, NULL, NULL, NULL),
(8, 2, 8, NULL, NULL, NULL),
(9, 2, 11, NULL, NULL, NULL),
(10, 3, 3, NULL, NULL, NULL),
(11, 3, 5, NULL, NULL, NULL),
(12, 3, 6, NULL, NULL, NULL),
(13, 3, 10, NULL, NULL, NULL),
(14, 3, 11, NULL, NULL, NULL),
(15, 4, 3, NULL, NULL, NULL),
(16, 4, 4, NULL, NULL, NULL),
(17, 4, 8, NULL, NULL, NULL),
(18, 4, 10, NULL, NULL, NULL),
(19, 4, 11, NULL, NULL, NULL),
(20, 5, 4, NULL, NULL, NULL),
(21, 5, 10, NULL, NULL, NULL),
(22, 5, 11, NULL, NULL, NULL),
(23, 6, 5, NULL, NULL, NULL),
(24, 6, 8, NULL, NULL, NULL),
(25, 6, 10, NULL, NULL, NULL),
(26, 6, 11, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_messages`
--

CREATE TABLE `contact_us_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `is_seen` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact_us_messages`
--

INSERT INTO `contact_us_messages` (`id`, `name`, `email`, `phone`, `message`, `is_seen`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Robert Liy', 'customer@themetags.com', '217-733-8882', 'How can i change my logo?', 1, '2023-05-29 17:53:51', '2023-06-10 10:12:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `alignment` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for left, 1 for right',
  `rate` double NOT NULL DEFAULT 1,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `alignment`, `rate`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'usd', 'US Dollar', '$', 0, 1, 1, '2022-11-27 17:21:37', '2022-11-27 17:21:37', NULL),
(2, '235492', 'INR', 'R', 2, 82, 1, '2023-06-10 12:52:40', '2023-06-11 18:24:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_templates`
--

CREATE TABLE `custom_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `custom_template_category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `prompt` longtext NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `total_words_generated` bigint(20) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` varchar(191) DEFAULT NULL COMMENT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_templates`
--

INSERT INTO `custom_templates` (`id`, `user_id`, `custom_template_category_id`, `name`, `slug`, `code`, `description`, `fields`, `prompt`, `icon`, `total_words_generated`, `is_active`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'LinkedIn Posts', 'linkedin-posts', 'linkedin-posts', NULL, '[{\"label\":\"Type about of your post\",\"is_required\":true,\"field\":{\"name\":\"about\",\"type\":\"text\"}}]', 'Write a linkedin post about: {_about_}', '<i class=\"lab la-linkedin-in\"></i>', 2928, 1, 'admin', '2023-06-07 17:24:27', '2023-06-12 09:47:33', NULL),
(2, 1, 1, 'LinkedIn Ad Descriptions', 'linkedin-ad-descriptions', 'linkedin-ad-descriptions', NULL, '[{\"label\":\"Type ad descriptions\",\"is_required\":true,\"field\":{\"name\":\"ad-descriptions\",\"type\":\"text\"}}]', 'Write linkedin ad descriptions about:{_ad-descriptions_}', '<i class=\"lab la-linkedin-in\"></i>', 243, 1, 'admin', '2023-06-07 17:27:04', '2023-06-12 09:17:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_template_categories`
--

CREATE TABLE `custom_template_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `created_by` varchar(191) DEFAULT NULL COMMENT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_template_categories`
--

INSERT INTO `custom_template_categories` (`id`, `user_id`, `name`, `slug`, `icon`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Social Media', 'social-media', '<i class=\"lab la-linkedin-in\"></i>', 'admin', '2023-06-07 17:22:35', '2023-06-07 17:22:35', NULL),
(2, 2, 'gfgg', 'gfgg', NULL, '', '2023-06-11 21:51:20', '2023-06-11 21:51:20', NULL),
(3, 1, 'HR', 'hr', NULL, 'admin', '2023-06-12 01:16:56', '2023-06-12 01:16:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'What can I create with WriteBot?', 'We have copywriting tools for everything you need to start and run your business! You can write blog posts, product descriptions, and even Instagram captions with WriteBot. We\'re always updating our tools, so let us know what else you\'d like to see!', '2023-05-29 18:30:09', '2023-05-29 18:30:09'),
(2, 'How much does it cost?', 'Our copywriting tools have a free plan!\r\nThat\'s right, you can create content with our free tools.\r\nHowever, if you want more content, you\'ll have to subscribe to our Pro plan!', '2023-05-29 18:30:52', '2023-05-29 18:30:52'),
(3, 'What languages does it support?', 'With the Pro plan, you can create content in the following 250+ languages:', '2023-05-29 18:31:41', '2023-05-29 18:31:41'),
(4, 'Can I get a demo of the product?', 'Of course! We are currently running 1 live demo a week. You can sign up and register for our next one here.', '2023-05-29 18:32:08', '2023-05-29 18:32:08'),
(5, 'Where can I learn more about copywriting or entrepreneurship?', 'WriteBot - is an innovative SaaS platform that harnesses the power of OpenAI Artificial Intelligence technology to provide your users with a range of exceptional features. WriteBot, users can effortlessly generate unique and plagiarism-free content and images, taking advantage of multiple languages for enhanced versatility. It\'s all in one SaaS platform to generate AI content, image and code.', '2023-05-29 18:32:35', '2023-05-29 18:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_templates`
--

CREATE TABLE `favorite_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorite_templates`
--

INSERT INTO `favorite_templates` (`id`, `user_id`, `template_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-06-05 10:54:18', '2023-06-05 10:54:18'),
(2, 2, 9, '2023-06-05 10:54:21', '2023-06-05 10:54:21'),
(4, 2, 14, '2023-06-05 10:54:24', '2023-06-05 10:54:24'),
(5, 2, 16, '2023-06-05 10:54:27', '2023-06-05 10:54:27'),
(6, 2, 30, '2023-06-05 10:54:28', '2023-06-05 10:54:28'),
(7, 2, 29, '2023-06-05 10:54:29', '2023-06-05 10:54:29'),
(8, 2, 28, '2023-06-05 10:54:30', '2023-06-05 10:54:30'),
(9, 2, 38, '2023-06-05 10:54:32', '2023-06-05 10:54:32'),
(10, 2, 39, '2023-06-05 10:54:32', '2023-06-05 10:54:32'),
(11, 2, 55, '2023-06-05 10:54:34', '2023-06-05 10:54:34'),
(12, 2, 56, '2023-06-05 10:54:35', '2023-06-05 10:54:35'),
(14, 1, 1, '2023-06-10 11:43:02', '2023-06-10 11:43:02'),
(15, 1, 52, '2023-06-10 11:43:05', '2023-06-10 11:43:05'),
(18, 2, 71, '2023-06-11 16:49:55', '2023-06-11 16:49:55'),
(19, 1, 2, '2023-06-11 21:20:17', '2023-06-11 21:20:17'),
(20, 1, 3, '2023-06-11 21:20:19', '2023-06-11 21:20:19'),
(21, 2, 66, '2023-06-12 03:22:14', '2023-06-12 03:22:14'),
(22, 1, 62, '2023-06-12 09:36:40', '2023-06-12 09:36:40'),
(24, 1, 35, '2023-06-19 10:06:04', '2023-06-19 10:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `user_id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Blog Contents', 'blog-contents', '2023-05-29 14:42:10', '2023-05-29 14:42:10', NULL),
(2, 1, 'Email Contents', 'email-contents', '2023-05-29 14:42:29', '2023-05-29 14:42:29', NULL),
(3, 1, 'Social Media Content', 'social-media-content', '2023-05-29 14:42:40', '2023-05-29 14:42:40', NULL),
(4, 1, 'Fun and Quote', 'fun-and-quote', '2023-05-29 14:43:00', '2023-05-29 14:43:00', NULL),
(5, 1, 'Brand Name', 'brand-name', '2023-05-29 14:43:13', '2023-05-29 14:43:13', NULL),
(6, 1, 'Medium Article', 'medium-article', '2023-05-29 14:43:40', '2023-05-29 14:43:40', NULL),
(7, 1, 'Video Description', 'video-description', '2023-05-29 14:44:00', '2023-05-29 14:44:00', NULL),
(8, 1, 'Success Story', 'success-story', '2023-05-29 14:44:29', '2023-05-29 14:44:29', NULL),
(9, 1, 'Website Branding', 'website-branding', '2023-05-29 14:54:46', '2023-05-29 14:54:46', NULL),
(10, 2, 'test folder', 'test-folder', '2023-06-05 18:12:42', '2023-06-05 18:12:42', NULL),
(11, 1, 'w3cms', 'w3cms', '2023-06-17 15:58:29', '2023-06-17 15:58:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `flag` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `flag`, `code`, `is_rtl`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', 'en', 0, 1, NULL, NULL, NULL),
(2, 'हिंदी', 'in', 'hn', 0, 0, '2023-06-05 08:59:37', '2023-06-19 10:14:57', NULL),
(3, '中文', 'ad', 'cn', 1, 0, '2023-06-05 11:00:52', '2023-06-17 08:34:59', NULL),
(4, 'Turkish', 'tr', 'tr', 0, 0, '2023-06-11 13:17:03', '2023-06-17 08:35:03', NULL),
(5, 'Vietnamese', 'vn', 'vn', 0, 1, '2023-06-11 13:17:55', '2023-06-19 10:20:31', NULL),
(6, 'Spanish', 'es', 'ESP', 0, 1, '2023-06-11 13:18:34', '2023-06-11 13:18:34', NULL),
(7, 'buga', 'bn', 'bn', 0, 0, '2023-06-11 18:09:42', '2023-06-17 08:35:05', NULL),
(8, 'hungarian', 'hu', 'hu', 0, 1, '2023-06-17 17:00:18', '2023-06-17 17:00:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `localizations`
--

CREATE TABLE `localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_key` varchar(191) NOT NULL,
  `t_key` longtext NOT NULL,
  `t_value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `localizations`
--

INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'en', 'home', 'Home', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(2, 'en', 'start_writing', 'Start Writing', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(3, 'en', 'our_best_features', 'Our Best Features', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(4, 'en', 'we_are_more_powerful_than_others', 'We are more powerful than others', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(5, 'en', 'blog_content', 'Blog Content', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(6, 'en', 'email_template', 'Email Template', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(7, 'en', 'social_media', 'Social Media', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(8, 'en', 'video_content', 'Video Content', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(9, 'en', 'website_content', 'Website Content', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(10, 'en', 'fun__quote', 'Fun & Quote', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(11, 'en', 'medium_content', 'Medium Content', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(12, 'en', 'tik_tok', 'Tik Tok', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(13, 'en', 'instagram', 'Instagram', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(14, 'en', 'success_story', 'Success Story', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(15, 'en', 'we_help_you', 'We Help You', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(16, 'en', 'to_write_better_contents_faster', 'To Write Better Contents Faster', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(17, 'en', 'favorite', 'Favorite', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(18, 'en', 'words_generated', 'Words Generated', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(19, 'en', 'view_all_templates', 'View All Templates', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(20, 'en', 'what_customers_saying', 'What Customers Saying', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(21, 'en', 'about_us', 'About Us', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(22, 'en', 'our_subscription_packages', 'Our Subscription Packages', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(23, 'en', 'ready_to_get_started', 'Ready to get started?', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(24, 'en', 'monthly', 'Monthly', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(25, 'en', 'select_payment_method', 'Select Payment Method', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(26, 'en', 'proceed', 'Proceed', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(27, 'en', 'please_wait', 'Please Wait', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(28, 'en', 'templates', 'Templates', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(29, 'en', 'everything_that_you_need', 'Everything That You Need', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(30, 'en', 'pricing', 'Pricing', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(31, 'en', 'company', 'Company', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(32, 'en', 'useful_links', 'Useful Links', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(33, 'en', 'contact_us', 'Contact Us', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(34, 'en', 'our_latest_news', 'Our Latest News', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(35, 'en', 'customer_review', 'Customer Review', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(36, 'en', 'dashboard', 'Dashboard', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(37, 'en', 'enter_email_address', 'Enter Email Address', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(38, 'en', 'subscribe', 'Subscribe', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(39, 'en', 'content_has_been_copied_successfully', 'Content has been copied successfully', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(40, 'en', 'contents_generated_successfully', 'Contents generated successfully', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(41, 'en', 'something_went_wrong', 'Something went wrong', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(42, 'en', 'please_generate_ai_contents_first', 'Please generate AI contents first', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(43, 'en', 'project_moved_successfully', 'Project moved successfully', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(44, 'en', 'contents_updated_successfully', 'Contents updated successfully', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(45, 'en', 'image_generated_successfully', 'Image generated successfully', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(46, 'en', 'code_generated_successfully', 'Code generated successfully', '2023-05-29 12:31:02', '2023-05-29 12:31:02', NULL),
(47, 'en', 'last_7_days', 'Last 7 days', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(48, 'en', 'overview', 'Overview', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(49, 'en', 'create_content', 'Create Content', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(50, 'en', 'subscription_packages', 'Subscription Packages', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(51, 'en', 'total_words_generated', 'Total words generated', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(52, 'en', 'total_image_generated', 'Total Image generated', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(53, 'en', 'total_code_generated', 'Total code generated', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(54, 'en', 'total_spech_to_text', 'Total spech to text', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(55, 'en', 'last_30_days', 'Last 30 days', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(56, 'en', 'last_3_months', 'Last 3 months', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(57, 'en', 'words', 'Words', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(58, 'en', 'top_5_templates', 'Top 5 Templates', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(59, 'en', 'recent_projects', 'Recent Projects', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(60, 'en', 'sl', 'S/L', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(61, 'en', 'project_name', 'Project Name', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(62, 'en', 'created_date', 'Created Date', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(63, 'en', 'type', 'Type', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(64, 'en', 'wordssize', 'Words/Size', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(65, 'en', 'action', 'Action', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(66, 'en', 'subscriptions', 'Subscriptions', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(67, 'en', 'subscription_histories', 'Subscription Histories', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(68, 'en', 'manage_documents', 'Manage Documents', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(69, 'en', 'folders', 'Folders', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(70, 'en', 'all_projects', 'All Projects', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(71, 'en', 'ai_tools', 'AI Tools', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(72, 'en', 'prompts', 'Prompts', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(73, 'en', 'speech_to_text', 'Speech to Text', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(74, 'en', 'generate_images', 'Generate Images', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(75, 'en', 'generate_code', 'Generate Code', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(76, 'en', 'popular_templates', 'Popular Templates', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(77, 'en', 'favorite_templates', 'Favorite Templates', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(78, 'en', 'manage_users', 'Manage Users', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(79, 'en', 'customers', 'Customers', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(80, 'en', 'employee_staffs', 'Employee Staffs', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(81, 'en', 'support', 'Support', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(82, 'en', 'queries', 'Queries', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(83, 'en', 'manage_contents', 'Manage Contents', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(84, 'en', 'tags', 'Tags', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(85, 'en', 'blogs', 'Blogs', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(86, 'en', 'all_blogs', 'All Blogs', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(87, 'en', 'categories', 'Categories', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(88, 'en', 'pages', 'Pages', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(89, 'en', 'all_faqs', 'All FAQs', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(90, 'en', 'media_manager', 'Media Manager', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(91, 'en', 'manage_promotions', 'Manage Promotions', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(92, 'en', 'newsletters', 'Newsletters', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(93, 'en', 'bulk_emails', 'Bulk Emails', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(94, 'en', 'subscribers', 'Subscribers', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(95, 'en', 'manage_settings', 'Manage Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(96, 'en', 'open_ai', 'Open AI', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(97, 'en', 'appearance', 'Appearance', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(98, 'en', 'homepage', 'Homepage', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(99, 'en', 'header', 'Header', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(100, 'en', 'footer', 'Footer', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(101, 'en', 'roles__permissions', 'Roles & Permissions', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(102, 'en', 'system_settings', 'System Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(103, 'en', 'auth_settings', 'Auth Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(104, 'en', 'otp_settings', 'OTP Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(105, 'en', 'smtp_settings', 'SMTP Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(106, 'en', 'general_settings', 'General Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(107, 'en', 'payment_methods', 'Payment Methods', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(108, 'en', 'social_media_login', 'Social Media Login', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(109, 'en', 'multilingual_settings', 'Multilingual Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(110, 'en', 'multi_currency_settings', 'Multi Currency Settings', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(111, 'en', 'my_account', 'My Account', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(112, 'en', 'sign_out', 'Sign out', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(113, 'en', 'search', 'Search', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(114, 'en', 'no_new_notification', 'No New Notification', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(115, 'en', 'visit_website', 'Visit Website', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(116, 'en', 'media_files', 'Media Files', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(117, 'en', 'recently_uploaded_files', 'Recently uploaded files', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(118, 'en', 'add_files_here', 'Add files here', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(119, 'en', 'previously_uploaded_files', 'Previously uploaded files', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(120, 'en', 'search_by_name', 'Search by name', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(121, 'en', 'load_more', 'Load More', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(122, 'en', 'select', 'Select', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(123, 'en', 'delete_confirmation', 'Delete Confirmation', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(124, 'en', 'are_you_sure_to_delete_this', 'Are you sure to delete this?', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(125, 'en', 'all_data_related_to_this_may_get_deleted', 'All data related to this may get deleted.', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(126, 'en', 'cancel', 'Cancel', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(127, 'en', 'no_data_found', 'No data found', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(128, 'en', 'selected_file', 'Selected File', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(129, 'en', 'selected_files', 'Selected Files', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(130, 'en', 'file_added', 'File added', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(131, 'en', 'files_added', 'Files added', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(132, 'en', 'no_file_chosen', 'No file chosen', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(133, 'en', 'move_to_folder', 'Move To Folder', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(134, 'en', 'move_project', 'Move Project', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(135, 'en', 'save_changes', 'Save Changes', '2023-05-29 12:31:03', '2023-05-29 12:31:03', NULL),
(136, 'en', 'website_homepage_configuration', 'Website Homepage Configuration', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(137, 'en', 'hero_section_configuration', 'Hero Section Configuration', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(138, 'en', 'hero', 'Hero', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(139, 'en', 'hero_information', 'Hero Information', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(140, 'en', 'title', 'Title', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(141, 'en', 'colorful_title', 'Colorful Title', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(142, 'en', 'sub_title', 'Sub Title', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(143, 'en', 'background_image', 'Background Image', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(144, 'en', 'choose_background', 'Choose Background', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(145, 'en', 'animated_image', 'Animated Image', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(146, 'en', 'choose_animated_image', 'Choose Animated Image', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(147, 'en', 'homepage_configuration', 'Homepage Configuration', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(148, 'en', 'hero_section', 'Hero Section', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(149, 'en', 'trusted_by', 'Trusted By', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(150, 'en', 'how_it_works', 'How It Works?', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(151, 'en', 'feature_images', 'Feature Images', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(152, 'en', 'client_feedback', 'Client Feedback', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(153, 'en', 'cta_section', 'CTA Section', '2023-05-29 12:31:31', '2023-05-29 12:31:31', NULL),
(154, 'en', 'website_header_configuration', 'Website Header Configuration', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(155, 'en', 'navbar_information', 'Navbar Information', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(156, 'en', 'navbar_logo_white', 'Navbar Logo White', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(157, 'en', 'choose_navbar_white_logo', 'Choose Navbar White Logo', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(158, 'en', 'navbar_logo_dark', 'Navbar Logo Dark', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(159, 'en', 'choose_navbar_dark_logo', 'Choose Navbar Dark Logo', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(160, 'en', 'templates_group', 'Templates Group', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(161, 'en', 'select_groups', 'Select groups', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(162, 'en', 'select_pages', 'Select pages', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(163, 'en', 'header_configuration', 'Header Configuration', '2023-05-29 12:31:33', '2023-05-29 12:31:33', NULL),
(164, 'en', 'settings_updated_successfully', 'Settings updated successfully', '2023-05-29 12:34:46', '2023-05-29 12:34:46', NULL),
(165, 'en', 'general_informations', 'General Informations', '2023-05-29 12:35:39', '2023-05-29 12:35:39', NULL),
(166, 'en', 'system_title', 'System Title', '2023-05-29 12:35:39', '2023-05-29 12:35:39', NULL),
(167, 'en', 'browser_tab_title_separator', 'Browser Tab Title Separator', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(168, 'en', 'contact_email', 'Contact Email', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(169, 'en', 'contact_phone', 'Contact Phone', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(170, 'en', 'dashboard_logo__favicon', 'Dashboard Logo & Favicon', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(171, 'en', 'dashboard_logo', 'Dashboard Logo', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(172, 'en', 'choose_dashboard_logo', 'Choose Dashboard Logo', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(173, 'en', 'favicon', 'Favicon', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(174, 'en', 'choose_favicon', 'Choose Favicon', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(175, 'en', 'maintenance_mode', 'Maintenance Mode', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(176, 'en', 'enable_maintenance_mode', 'Enable Maintenance Mode', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(177, 'en', 'set_maintenance_mode', 'Set maintenance mode', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(178, 'en', 'enable', 'Enable', '2023-05-29 12:35:40', '2023-05-29 12:35:40', NULL),
(179, 'en', 'disable', 'Disable', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(180, 'en', 'seo_meta_configuration', 'SEO Meta Configuration', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(181, 'en', 'meta_title', 'Meta Title', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(182, 'en', 'type_meta_title', 'Type meta title', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(183, 'en', 'set_a_meta_tag_title_recommended_to_be_simple_and_unique', 'Set a meta tag title. Recommended to be simple and unique.', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(184, 'en', 'meta_description', 'Meta Description', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(185, 'en', 'type_your_meta_description', 'Type your meta description', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(186, 'en', 'meta_keywords', 'Meta Keywords', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(187, 'en', 'meta_image', 'Meta Image', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(188, 'en', 'choose_meta_image', 'Choose Meta Image', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(189, 'en', 'save_configuration', 'Save Configuration', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(190, 'en', 'configure_general_settings', 'Configure General Settings', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(191, 'en', 'general_information', 'General Information', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(192, 'en', 'dashborad_logo__favicon', 'Dashborad Logo & Favicon', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(193, 'en', 'seo_configuration', 'SEO Configuration', '2023-05-29 12:35:46', '2023-05-29 12:35:46', NULL),
(194, 'en', 'please_login_to_continue', 'Please login to continue', '2023-05-29 12:36:34', '2023-05-29 12:36:34', NULL),
(195, 'en', 'login', 'Login', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(196, 'en', 'email', 'Email', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(197, 'en', 'enter_your_email', 'Enter your email', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(198, 'en', 'login_with_phone', 'Login with phone?', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(199, 'en', 'phone', 'Phone', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(200, 'en', 'login_with_email', 'Login with email?', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(201, 'en', 'password', 'Password', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(202, 'en', 'enter_your_password', 'Enter your password', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(203, 'en', 'sign_in', 'Sign In', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(204, 'en', 'dont_have_an_account', 'Don\'t have an Account?', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(205, 'en', 'sign_up', 'Sign Up', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(206, 'en', 'forgot_password', 'Forgot Password', '2023-05-29 12:36:35', '2023-05-29 12:36:35', NULL),
(207, 'en', 'get_started', 'Get Started', '2023-05-29 12:36:48', '2023-05-29 12:36:48', NULL),
(208, 'en', 'trusted_by_information', 'Trusted By Information', '2023-05-29 13:00:54', '2023-05-29 13:00:54', NULL),
(209, 'en', 'trusted_by_images', 'Trusted By Images', '2023-05-29 13:00:54', '2023-05-29 13:00:54', NULL),
(210, 'en', 'choose_images', 'Choose Images', '2023-05-29 13:00:54', '2023-05-29 13:00:54', NULL),
(211, 'en', 'step_1', 'Step 1:', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(212, 'en', 'short_description', 'Short Description', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(213, 'en', 'features', 'Features', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(214, 'en', 'comma_separated_one_two', 'Comma Separated: One, Two', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(215, 'en', 'button_title', 'Button Title', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(216, 'en', 'button_link', 'Button Link', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(217, 'en', 'step_1_image', 'Step 1 Image', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(218, 'en', 'step_2', 'Step 2:', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(219, 'en', 'step_2_image', 'Step 2 Image', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(220, 'en', 'step_3', 'Step 3:', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(221, 'en', 'step_3_image', 'Step 3 Image', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(222, 'en', 'step_4', 'Step 4:', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(223, 'en', 'step_4_image', 'Step 4 Image', '2023-05-29 13:02:25', '2023-05-29 13:02:25', NULL),
(224, 'en', 'all_templates', 'All Templates', '2023-05-29 13:04:44', '2023-05-29 13:04:44', NULL),
(225, 'en', 'blog_section', 'Blog Section', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(226, 'en', 'generate_contents', 'Generate Contents', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(227, 'en', 'select_input__output_language', 'Select input & output language', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(228, 'en', 'title_of_the_blog', 'Title of the blog', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(229, 'en', 'eg_best_restaurants_in_la_to_eat_indian_foods', 'e.g. best restaurants in LA to eat indian foods', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(230, 'en', 'what_are_the_main_points_you_want_to_cover', 'What are the main points you want to cover?', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(231, 'en', 'eg_dosa_biriyani_tandoori_chicken', 'e.g. dosa, biriyani, tandoori chicken', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(232, 'en', 'advance_options', 'Advance Options', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(233, 'en', 'browse_more_fields', 'Browse more fields', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(234, 'en', 'creative_label', 'Creative Label', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(235, 'en', 'creativity_level_of_the_output_will_be_as_selected', 'Creativity level of the output will be as selected', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(236, 'en', 'high', 'High', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(237, 'en', 'medium', 'Medium', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(238, 'en', 'low', 'Low', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(239, 'en', 'choose_a_tone', 'Choose a Tone', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(240, 'en', 'choose_the_tone_of_the_result_text_as_you_need', 'Choose the tone of the result text as you need', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(241, 'en', 'friendly', 'Friendly', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(242, 'en', 'luxury', 'Luxury', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(243, 'en', 'relaxed', 'Relaxed', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(244, 'en', 'professional', 'Professional', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(245, 'en', 'casual', 'Casual', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(246, 'en', 'excited', 'Excited', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(247, 'en', 'bold', 'Bold', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(248, 'en', 'masculine', 'Masculine', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(249, 'en', 'dramatic', 'Dramatic', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(250, 'en', 'number_of_results', 'Number of Results', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(251, 'en', 'select_how_many_variations_of_result_you_want', 'Select how many variations of result you want', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(252, 'en', 'max_results_length', 'Max Results Length', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(253, 'en', 'maximum_words_for_each_result', 'Maximum words for each result', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(254, 'en', 'enter_maximum_word_limit', 'Enter maximum word limit', '2023-05-29 13:07:25', '2023-05-29 13:07:25', NULL),
(255, 'en', 'your_project_title', 'Your project title', '2023-05-29 13:07:26', '2023-05-29 13:07:26', NULL),
(256, 'en', 'copy_contents', 'Copy Contents', '2023-05-29 13:07:26', '2023-05-29 13:07:26', NULL),
(257, 'en', 'languages', 'Languages', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(258, 'en', 'name', 'Name', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(259, 'en', 'iso_6391_code', 'ISO 639-1 Code', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(260, 'en', 'active', 'Active', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(261, 'en', 'edit', 'Edit', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(262, 'en', 'localizations', 'Localizations', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(263, 'en', 'add_new_language', 'Add New Language', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(264, 'en', 'language_name', 'Language Name', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(265, 'en', 'type_language_name', 'Type language name', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(266, 'en', 'enbn', 'en/bn', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(267, 'en', 'flag', 'Flag', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(268, 'en', 'rtl', 'RTL', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(269, 'en', 'save_language', 'Save Language', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(270, 'en', 'set_default_language', 'Set Default Language', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(271, 'en', 'default_language', 'Default Language', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(272, 'en', 'language_information', 'Language Information', '2023-05-29 13:13:28', '2023-05-29 13:13:28', NULL),
(273, 'en', 'all_languages', 'All Languages', '2023-05-29 13:13:29', '2023-05-29 13:13:29', NULL),
(274, 'en', 'lang_key', 'Lang Key', '2023-05-29 13:14:26', '2023-05-29 13:14:26', NULL),
(275, 'en', 'type_localization_here', 'Type localization here', '2023-05-29 13:14:26', '2023-05-29 13:14:26', NULL),
(276, 'en', 'copy_localizations', 'Copy Localizations', '2023-05-29 13:14:26', '2023-05-29 13:14:26', NULL),
(277, 'en', 'save', 'Save', '2023-05-29 13:14:26', '2023-05-29 13:14:26', NULL),
(278, 'en', 'currencies', 'Currencies', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(279, 'en', 'symbol', 'Symbol', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(280, 'en', 'code', 'Code', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(281, 'en', 'alignment', 'Alignment', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(282, 'en', '1_usd__', '1 USD = ?', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(283, 'en', 'symbolamount', '[symbol][amount]', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(284, 'en', 'add_new_currency', 'Add New Currency', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(285, 'en', 'currency_name', 'Currency Name', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(286, 'en', 'type_currency_name', 'Type currency name', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(287, 'en', 'currency_symbol', 'Currency Symbol', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(288, 'en', 'type_symbol', 'Type symbol', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(289, 'en', 'currency_code', 'Currency Code', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(290, 'en', 'type_code', 'Type code', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(291, 'en', 'rate', 'Rate', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(292, 'en', 'amountsymbol', '[amount][symbol]', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(293, 'en', 'symbol_amount', '[symbol] [amount]', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(294, 'en', 'amount_symbol', '[amount] [symbol]', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(295, 'en', 'save_currency', 'Save Currency', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(296, 'en', 'set_default_currency', 'Set Default Currency', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(297, 'en', 'default_currency', 'Default Currency', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(298, 'en', 'no_of_decimals', 'No of Decimals', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(299, 'en', 'price_format', 'Price Format', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(300, 'en', 'show_full_price_1000000', 'Show Full Price (1000000)', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(301, 'en', 'truncate_price_1m1b', 'Truncate Price (1M/1B)', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(302, 'en', 'save_configurations', 'Save Configurations', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(303, 'en', 'currency_information', 'Currency Information', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(304, 'en', 'all_currencies', 'All Currencies', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(305, 'en', 'currency_configurations', 'Currency Configurations', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(306, 'en', 'status_updated_successfully', 'Status updated successfully', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(307, 'en', 'default_currency_can_not_be_disabled', 'Default currency can not be disabled', '2023-05-29 13:17:19', '2023-05-29 13:17:19', NULL),
(308, 'en', 'image_1', 'Image 1:', '2023-05-29 13:37:20', '2023-05-29 13:37:20', NULL),
(309, 'en', 'feature_image_1', 'Feature Image 1', '2023-05-29 13:37:20', '2023-05-29 13:37:20', NULL),
(310, 'en', 'feature_image_2', 'Feature Image 2:', '2023-05-29 13:37:20', '2023-05-29 13:37:20', NULL),
(311, 'en', 'feature_image_3', 'Feature Image 3:', '2023-05-29 13:37:20', '2023-05-29 13:37:20', NULL),
(312, 'en', 'feature_image_4', 'Feature Image 4:', '2023-05-29 13:37:20', '2023-05-29 13:37:20', NULL),
(313, 'en', 'feature_image_5', 'Feature Image 5:', '2023-05-29 13:37:20', '2023-05-29 13:37:20', NULL),
(314, 'en', 'what_clients_say', 'What Clients Say', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(315, 'en', 'image', 'Image', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(316, 'en', 'designation', 'Designation', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(317, 'en', 'heading', 'Heading', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(318, 'en', 'review', 'Review', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(319, 'en', 'add_new_feedback', 'Add New Feedback', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(320, 'en', 'type_reviewer_name', 'Type reviewer name', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(321, 'en', 'type_reviewer_designation', 'Type reviewer designation', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(322, 'en', 'hading', 'Hading', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(323, 'en', 'type_heading', 'Type heading', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(324, 'en', 'rating', 'Rating', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(325, 'en', 'type_review', 'Type review', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(326, 'en', 'avatar_image', 'Avatar Image', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(327, 'en', 'choose_avatar_image', 'Choose Avatar Image', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(328, 'en', 'save_feedback', 'Save Feedback', '2023-05-29 13:42:33', '2023-05-29 13:42:33', NULL),
(329, 'en', 'feedback_added_successfully', 'Feedback added successfully', '2023-05-29 13:51:44', '2023-05-29 13:51:44', NULL),
(330, 'en', 'delete', 'Delete', '2023-05-29 13:51:44', '2023-05-29 13:51:44', NULL),
(331, 'en', 'update_feedback', 'Update Feedback', '2023-05-29 13:56:51', '2023-05-29 13:56:51', NULL),
(332, 'en', 'client_feedback_configuration', 'Client Feedback Configuration', '2023-05-29 13:56:51', '2023-05-29 13:56:51', NULL),
(333, 'en', 'feedback_updated_successfully', 'Feedback updated successfully', '2023-05-29 13:56:56', '2023-05-29 13:56:56', NULL),
(334, 'en', 'cta_configurations', 'CTA Configurations', '2023-05-29 14:08:43', '2023-05-29 14:08:43', NULL),
(335, 'en', 'title_colored', 'Title Colored', '2023-05-29 14:08:43', '2023-05-29 14:08:43', NULL),
(336, 'en', 'website_footer_configuration', 'Website Footer Configuration', '2023-05-29 14:13:54', '2023-05-29 14:13:54', NULL),
(337, 'en', 'quick_links', 'Quick Links', '2023-05-29 14:13:54', '2023-05-29 14:13:54', NULL),
(338, 'en', 'select_quick_link_pages', 'Select quick link pages', '2023-05-29 14:13:54', '2023-05-29 14:13:54', NULL),
(339, 'en', 'copyright_text', 'Copyright Text', '2023-05-29 14:13:54', '2023-05-29 14:13:54', NULL),
(340, 'en', 'footer_configuration', 'Footer Configuration', '2023-05-29 14:13:54', '2023-05-29 14:13:54', NULL),
(341, 'en', 'our_pricing', 'Our Pricing', '2023-05-29 14:26:21', '2023-05-29 14:26:21', NULL),
(342, 'en', 'simple_and_flexible_only_pay_for_what_you_use', 'Simple and flexible. Only pay for what you use.', '2023-05-29 14:26:21', '2023-05-29 14:26:21', NULL),
(343, 'en', 'frequently_asked_questions', 'Frequently Asked Questions', '2023-05-29 14:26:21', '2023-05-29 14:26:21', NULL),
(344, 'en', 'everything_you_need_to_know_about_the_product_and_billing', 'Everything you need to know about the product and billing.', '2023-05-29 14:26:21', '2023-05-29 14:26:21', NULL),
(345, 'en', 'get_to_know_more_about_us', 'Get to know more about us.', '2023-05-29 14:37:31', '2023-05-29 14:37:31', NULL),
(346, 'en', 'update_profile', 'Update Profile', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(347, 'en', 'profile', 'Profile', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(348, 'en', 'basic_information', 'Basic Information', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(349, 'en', 'type_your_name', 'Type your name', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(350, 'en', 'type_your_email', 'Type your email', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(351, 'en', 'type_your_phone', 'Type your phone', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(352, 'en', 'avatar', 'Avatar', '2023-05-29 14:40:02', '2023-05-29 14:40:02', NULL),
(353, 'en', 'choose_avatar', 'Choose Avatar', '2023-05-29 14:40:03', '2023-05-29 14:40:03', NULL),
(354, 'en', 'type_password', 'Type password', '2023-05-29 14:40:03', '2023-05-29 14:40:03', NULL),
(355, 'en', 'confirm_password', 'Confirm Password', '2023-05-29 14:40:03', '2023-05-29 14:40:03', NULL),
(356, 'en', 'retype_password', 'Re-type password', '2023-05-29 14:40:03', '2023-05-29 14:40:03', NULL),
(357, 'en', 'user_information', 'User Information', '2023-05-29 14:40:03', '2023-05-29 14:40:03', NULL),
(358, 'en', 'password_confirmation_does_not_match', 'Password confirmation does not match', '2023-05-29 14:40:20', '2023-05-29 14:40:20', NULL),
(359, 'en', 'profile_has_been_updated', 'Profile has been updated', '2023-05-29 14:40:46', '2023-05-29 14:40:46', NULL),
(360, 'en', 'user', 'User', '2023-05-29 14:40:58', '2023-05-29 14:40:58', NULL),
(361, 'en', 'package', 'Package', '2023-05-29 14:40:58', '2023-05-29 14:40:58', NULL),
(362, 'en', 'price', 'Price', '2023-05-29 14:40:58', '2023-05-29 14:40:58', NULL),
(363, 'en', 'start_date', 'Start Date', '2023-05-29 14:40:58', '2023-05-29 14:40:58', NULL),
(364, 'en', 'expire_date', 'Expire Date', '2023-05-29 14:40:59', '2023-05-29 14:40:59', NULL),
(365, 'en', 'payment_method', 'Payment Method', '2023-05-29 14:40:59', '2023-05-29 14:40:59', NULL),
(366, 'en', 'showing', 'Showing', '2023-05-29 14:40:59', '2023-05-29 14:40:59', NULL),
(367, 'en', 'of', 'of', '2023-05-29 14:40:59', '2023-05-29 14:40:59', NULL),
(368, 'en', 'results', 'results', '2023-05-29 14:40:59', '2023-05-29 14:40:59', NULL),
(369, 'en', 'yearly', 'Yearly', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(370, 'en', 'lifetime', 'Lifetime', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(371, 'en', 'selected_package_type', 'Selected package type', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(372, 'en', 'free', 'Free', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(373, 'en', 'ai_templates', 'AI Templates', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(374, 'en', 'words_per_month', 'Words per month', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(375, 'en', 'images_per_month', 'Images per month', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(376, 'en', 'speech_to_text_per_month', 'Speech to Text per month', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(377, 'en', 'audio_file_size_limit', 'Audio file size limit', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(378, 'en', 'allow_ai_images', 'Allow AI Images', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(379, 'en', 'allow_ai_code', 'Allow AI Code', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(380, 'en', 'live_support', 'Live Support', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(381, 'en', 'free_support', 'Free Support', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(382, 'en', 'is_featured', 'Is Featured?', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(383, 'en', 'select_open_ai_model', 'Select Open AI Model', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(384, 'en', 'type_additional_features', 'Type additional features', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(385, 'en', 'comma_separated_feature_afeature_b', 'Comma separated: Feature A,Feature B', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(386, 'en', 'is_active', 'Is Active?', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(387, 'en', 'if_active_this_will_be_applied_to_new_users_registration', 'If active, this will be applied to new user\'s registration.', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(388, 'en', 'close', 'Close', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(389, 'en', 'templates_updated_successfully', 'Templates updated successfully', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(390, 'en', 'package_created_successfully', 'Package created successfully', '2023-05-29 14:41:02', '2023-05-29 14:41:02', NULL),
(391, 'en', 'all_folders', 'All Folders', '2023-05-29 14:41:35', '2023-05-29 14:41:35', NULL),
(392, 'en', 'add_new_folder', 'Add New Folder', '2023-05-29 14:41:35', '2023-05-29 14:41:35', NULL),
(393, 'en', 'folder_name', 'Folder Name', '2023-05-29 14:41:35', '2023-05-29 14:41:35', NULL),
(394, 'en', 'type_folder_name', 'Type folder name', '2023-05-29 14:41:35', '2023-05-29 14:41:35', NULL),
(395, 'en', 'save_folder', 'Save Folder', '2023-05-29 14:41:35', '2023-05-29 14:41:35', NULL),
(396, 'en', 'folder_information', 'Folder Information', '2023-05-29 14:41:35', '2023-05-29 14:41:35', NULL),
(397, 'en', 'projects', 'Projects', '2023-05-29 14:41:38', '2023-05-29 14:41:38', NULL),
(398, 'en', 'all', 'All', '2023-05-29 14:41:38', '2023-05-29 14:41:38', NULL),
(399, 'en', 'content', 'Content', '2023-05-29 14:41:38', '2023-05-29 14:41:38', NULL),
(400, 'en', 'folder_has_been_inserted_successfully', 'Folder has been inserted successfully', '2023-05-29 14:42:10', '2023-05-29 14:42:10', NULL),
(401, 'en', 'rename', 'Rename', '2023-05-29 14:42:10', '2023-05-29 14:42:10', NULL),
(402, 'en', 'prompts_configuration', 'Prompts Configuration', '2023-05-29 14:55:06', '2023-05-29 14:55:06', NULL),
(403, 'en', 'prompt_localizations', 'Prompt Localizations', '2023-05-29 14:55:06', '2023-05-29 14:55:06', NULL),
(404, 'en', 'prompt_key', 'Prompt Key', '2023-05-29 14:55:06', '2023-05-29 14:55:06', NULL),
(405, 'en', 'prompt_updated_successfully', 'Prompt updated successfully', '2023-05-29 14:55:06', '2023-05-29 14:55:06', NULL),
(406, 'en', 'select_status', 'Select status', '2023-05-29 14:55:24', '2023-05-29 14:55:24', NULL),
(407, 'en', 'banned', 'Banned', '2023-05-29 14:55:24', '2023-05-29 14:55:24', NULL),
(408, 'en', 'open_ai_settings', 'Open AI Settings', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(409, 'en', 'default_creativity_level', 'Default Creativity Level', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(410, 'en', 'default_tone_of_output_result', 'Default Tone Of Output Result', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(411, 'en', 'default_number_of_results', 'Default Number Of Results', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(412, 'en', 'default_max_result_length', 'Default Max Result Length', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(413, 'en', 'insert_1_to_make_it_unlimited', 'Insert -1 to make it unlimited', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(414, 'en', 'open_ai_model', 'Open AI Model', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(415, 'en', 'default_ai_model', 'Default AI Model', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(416, 'en', 'open_ai_secret_key', 'Open AI Secret Key', '2023-05-29 14:56:46', '2023-05-29 14:56:46', NULL),
(417, 'en', 'add_blog', 'Add Blog', '2023-05-29 15:04:07', '2023-05-29 15:04:07', NULL),
(418, 'en', 'hidden', 'Hidden', '2023-05-29 15:04:07', '2023-05-29 15:04:07', NULL),
(419, 'en', 'category', 'Category', '2023-05-29 15:04:07', '2023-05-29 15:04:07', NULL),
(420, 'en', 'add_new_blog', 'Add New blog', '2023-05-29 15:04:10', '2023-05-29 15:04:10', NULL),
(421, 'en', 'blog_title', 'Blog Title', '2023-05-29 15:04:10', '2023-05-29 15:04:10', NULL),
(422, 'en', 'type_blog_title', 'Type blog title', '2023-05-29 15:04:10', '2023-05-29 15:04:10', NULL),
(423, 'en', 'select_a_category', 'Select a category', '2023-05-29 15:04:10', '2023-05-29 15:04:10', NULL),
(424, 'en', 'select_tags', 'Select tags..', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(425, 'en', 'youtube_video_link', 'Youtube Video Link', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(426, 'en', 'type_your_short_description', 'Type your short description', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(427, 'en', 'description', 'Description', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(428, 'en', 'images', 'Images', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(429, 'en', 'thumbnail_image', 'Thumbnail Image', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(430, 'en', 'choose_blog_thumbnail', 'Choose Blog Thumbnail', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(431, 'en', 'blog_details_image', 'Blog Details Image', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(432, 'en', 'choose_blog_details_image', 'Choose Blog Details Image', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(433, 'en', 'save_blog', 'Save Blog', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(434, 'en', 'blog_information', 'Blog Information', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(435, 'en', 'blog_images', 'Blog Images', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(436, 'en', 'seo_meta_options', 'SEO Meta Options', '2023-05-29 15:04:11', '2023-05-29 15:04:11', NULL),
(437, 'en', 'its_free', 'It\'s Free', '2023-05-29 15:05:45', '2023-05-29 15:05:45', NULL),
(438, 'en', 'ai_images', 'AI Images', '2023-05-29 15:05:45', '2023-05-29 15:05:45', NULL),
(439, 'en', 'ai_code', 'AI Code', '2023-05-29 15:05:45', '2023-05-29 15:05:45', NULL),
(440, 'en', 'blog_categories', 'Blog Categories', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(441, 'en', 'add_new_blog_category', 'Add New Blog Category', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(442, 'en', 'category_name', 'Category Name', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(443, 'en', 'type_category_name', 'Type category name', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(444, 'en', 'save_category', 'Save Category', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(445, 'en', 'category_information', 'Category Information', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(446, 'en', 'all_categories', 'All Categories', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(447, 'en', 'add_new_category', 'Add New Category', '2023-05-29 15:06:45', '2023-05-29 15:06:45', NULL),
(448, 'en', 'category_has_been_inserted_successfully', 'Category has been inserted successfully', '2023-05-29 15:06:58', '2023-05-29 15:06:58', NULL),
(449, 'en', 'add_new_tag', 'Add New Tag', '2023-05-29 15:09:49', '2023-05-29 15:09:49', NULL),
(450, 'en', 'tag_name', 'Tag Name', '2023-05-29 15:09:49', '2023-05-29 15:09:49', NULL),
(451, 'en', 'type_tag_name', 'Type tag name', '2023-05-29 15:09:49', '2023-05-29 15:09:49', NULL),
(452, 'en', 'save_tag', 'Save Tag', '2023-05-29 15:09:50', '2023-05-29 15:09:50', NULL),
(453, 'en', 'tag_information', 'Tag Information', '2023-05-29 15:09:50', '2023-05-29 15:09:50', NULL),
(454, 'en', 'all_tags', 'All Tags', '2023-05-29 15:09:50', '2023-05-29 15:09:50', NULL),
(455, 'en', 'tag_has_been_inserted_successfully', 'Tag has been inserted successfully', '2023-05-29 15:09:55', '2023-05-29 15:09:55', NULL),
(456, 'en', 'tag_has_been_deleted_successfully', 'Tag has been deleted successfully', '2023-05-29 15:10:37', '2023-05-29 15:10:37', NULL),
(457, 'en', 'blog_has_been_inserted_successfully', 'Blog has been inserted successfully', '2023-05-29 15:15:33', '2023-05-29 15:15:33', NULL),
(458, 'en', 'view', 'View', '2023-05-29 15:15:34', '2023-05-29 15:15:34', NULL),
(459, 'en', 'our_blogs', 'Our Blogs', '2023-05-29 15:15:40', '2023-05-29 15:15:40', NULL),
(460, 'en', 'read_our_blogs__latest_news', 'Read our blogs & latest news', '2023-05-29 15:15:40', '2023-05-29 15:15:40', NULL),
(461, 'en', 'blog_details', 'Blog Details', '2023-05-29 15:15:51', '2023-05-29 15:15:51', NULL),
(462, 'en', 'update_blog', 'Update Blog', '2023-05-29 15:20:31', '2023-05-29 15:20:31', NULL),
(463, 'en', 'blog_slug', 'Blog Slug', '2023-05-29 15:20:31', '2023-05-29 15:20:31', NULL),
(464, 'en', 'type_blog_slug', 'Type blog slug', '2023-05-29 15:20:31', '2023-05-29 15:20:31', NULL),
(465, 'en', 'blog_has_been_updated_successfully', 'Blog has been updated successfully', '2023-05-29 15:21:18', '2023-05-29 15:21:18', NULL),
(466, 'en', 'testimonials', 'Testimonials', '2023-05-29 16:10:39', '2023-05-29 16:10:39', NULL),
(467, 'en', 'what_customers_saying_about_us', 'What Customers Saying about us?', '2023-05-29 16:10:39', '2023-05-29 16:10:39', NULL),
(468, 'en', 'get_connected_to_us_to_learn_more', 'Get connected to us to learn more.', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(469, 'en', 'chat_with_us', 'Chat with Us', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(470, 'en', 'get_connected_to_us_we_are_happy_to_hear_from_you', 'Get connected to us, we are happy to hear from you.', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(471, 'en', 'email_us', 'Email Us', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(472, 'en', 'drop_us_an_email_and_youll_receive_a_reply_within_a_short_time', 'Drop us an email and you\'ll receive a reply within a short time.', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(473, 'en', 'give_us_a_call', 'Give us a call', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(474, 'en', 'give_us_a_call_our_experts_are_ready_to_talk_to_you', 'Give us a call. Our Experts are ready to talk to you.', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(475, 'en', 'talk_to_our_team', 'Talk to Our Team', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(476, 'en', 'write_to_us_we_are_happy_to_assist_you_about_your_queries', 'Write to us, we are happy to assist you about your queries.', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(477, 'en', 'your_name', 'Your name', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(478, 'en', 'you_email', 'You email', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(479, 'en', 'you_phone', 'You phone', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(480, 'en', 'messages', 'Messages', '2023-05-29 16:21:08', '2023-05-29 16:21:08', NULL),
(481, 'en', 'write_your_message', 'Write your message', '2023-05-29 16:21:09', '2023-05-29 16:21:09', NULL),
(482, 'en', 'get_in_touch', 'Get in Touch', '2023-05-29 16:21:09', '2023-05-29 16:21:09', NULL),
(483, 'en', 'login__registration', 'Login & Registration', '2023-05-29 16:26:07', '2023-05-29 16:26:07', NULL),
(484, 'en', 'customer_registration', 'Customer Registration', '2023-05-29 16:26:07', '2023-05-29 16:26:07', NULL),
(485, 'en', 'email_required', 'Email Required', '2023-05-29 16:26:07', '2023-05-29 16:26:07', NULL),
(486, 'en', 'email__phone_both_required', 'Email & Phone Both Required', '2023-05-29 16:26:07', '2023-05-29 16:26:07', NULL),
(487, 'en', 'registration_verification', 'Registration Verification', '2023-05-29 16:26:07', '2023-05-29 16:26:07', NULL);
INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(488, 'en', 'email_verification', 'Email Verification', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(489, 'en', 'otp_verification', 'OTP Verification', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(490, 'en', 'leftbar_title', 'Leftbar Title', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(491, 'en', 'leftbar_colored_title', 'Leftbar Colored Title', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(492, 'en', 'rightbar_title', 'Rightbar Title', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(493, 'en', 'rightbar_subtitle', 'Rightbar Subtitle', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(494, 'en', 'google_recaptcha_v3', 'Google Recaptcha V3', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(495, 'en', 'recaptcha_site_key', 'Recaptcha Site Key', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(496, 'en', 'recaptcha_secret_key', 'Recaptcha Secret Key', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(497, 'en', 'enable_recaptcha', 'Enable Recaptcha', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(498, 'en', 'google_recaptcha', 'Google Recaptcha', '2023-05-29 16:26:08', '2023-05-29 16:26:08', NULL),
(499, 'en', 'about_what_is_your_blog_post', 'About what is your blog post?', '2023-05-29 16:42:29', '2023-05-29 16:42:29', NULL),
(500, 'en', 'new_package', 'New Package', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(501, 'en', 'create_new_package', 'Create New Package', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(502, 'en', 'or', 'Or', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(503, 'en', 'copy_from_existing', 'Copy From Existing', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(504, 'en', 'monthly_packages', 'Monthly Packages', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(505, 'en', 'yearly_packages', 'Yearly Packages', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(506, 'en', 'lifetime_packages', 'Lifetime Packages', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(507, 'en', 'copy', 'Copy', '2023-05-29 16:45:09', '2023-05-29 16:45:09', NULL),
(508, 'en', 'set_0_to_make_it_free', 'Set $0 to make it free', '2023-05-29 16:45:15', '2023-05-29 16:45:15', NULL),
(509, 'en', 'featured', 'Featured', '2023-05-29 16:49:31', '2023-05-29 16:49:31', NULL),
(510, 'en', 'staffs', 'Staffs', '2023-05-29 16:56:27', '2023-05-29 16:56:27', NULL),
(511, 'en', 'new_employee', 'New Employee', '2023-05-29 16:56:27', '2023-05-29 16:56:27', NULL),
(512, 'en', 'add_employee', 'Add Employee', '2023-05-29 16:56:27', '2023-05-29 16:56:27', NULL),
(513, 'en', 'role', 'Role', '2023-05-29 16:56:27', '2023-05-29 16:56:27', NULL),
(514, 'en', 'transcribe_your_speech_to_text_using_this_text_generator', 'Transcribe your speech to text using this text generator.', '2023-05-29 17:15:10', '2023-05-29 17:15:10', NULL),
(515, 'en', 'type_text_title', 'Type Text Title', '2023-05-29 17:15:10', '2023-05-29 17:15:10', NULL),
(516, 'en', 'type_your_title', 'Type your title', '2023-05-29 17:15:10', '2023-05-29 17:15:10', NULL),
(517, 'en', 'upload_audio_file', 'Upload Audio File', '2023-05-29 17:15:10', '2023-05-29 17:15:10', NULL),
(518, 'en', 'allowed_file_types_', 'Allowed file types: ', '2023-05-29 17:15:10', '2023-05-29 17:15:10', NULL),
(519, 'en', 'full_name', 'Full Name', '2023-05-29 17:41:36', '2023-05-29 17:41:36', NULL),
(520, 'en', 'type_full_name', 'Type full name', '2023-05-29 17:41:36', '2023-05-29 17:41:36', NULL),
(521, 'en', '880xxxxxxxxxx', '+880xxxxxxxxxx', '2023-05-29 17:41:36', '2023-05-29 17:41:36', NULL),
(522, 'en', 'already_have_an_account', 'Already have an Account?', '2023-05-29 17:41:36', '2023-05-29 17:41:36', NULL),
(523, 'en', 'registration_successful', 'Registration successful.', '2023-05-29 17:45:30', '2023-05-29 17:45:30', NULL),
(524, 'en', 'used_out_of', 'Used out of', '2023-05-29 17:45:30', '2023-05-29 17:45:30', NULL),
(525, 'en', 'histories', 'Histories', '2023-05-29 17:45:30', '2023-05-29 17:45:30', NULL),
(526, 'en', 'applied_on_regirsation', 'Applied on Registration', '2023-05-29 17:46:47', '2023-05-29 17:46:47', NULL),
(527, 'en', 'this_template_not_included_in_your_subscription_plan', 'This template not included in your subscription plan', '2023-05-29 17:47:06', '2023-05-29 17:47:06', NULL),
(528, 'en', 'used', 'Used', '2023-05-29 17:48:41', '2023-05-29 17:48:41', NULL),
(529, 'en', 'remaining_images', 'Remaining Images', '2023-05-29 17:48:41', '2023-05-29 17:48:41', NULL),
(530, 'en', 'view_contents', 'View Contents', '2023-05-29 17:48:49', '2023-05-29 17:48:49', NULL),
(531, 'en', 'generate_images_from_any_of_your_text', 'Generate images from any of your text.', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(532, 'en', 'type_image_title', 'Type Image Title', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(533, 'en', 'image_of_a_bird', 'Image of a bird', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(534, 'en', 'type_image_description', 'Type Image Description', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(535, 'en', 'a_bird_flying_over_the_sea', 'A bird flying over the sea', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(536, 'en', 'image_style', 'Image Style', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(537, 'en', 'style_of_the_image_will_be_as_selected', 'Style of the image will be as selected', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(538, 'en', 'none', 'None', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(539, 'en', 'abstract', 'Abstract', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(540, 'en', 'realstic', 'Realstic', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(541, 'en', 'cartoon', 'Cartoon', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(542, 'en', 'digital_art', 'Digital Art', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(543, 'en', 'illustration', 'Illustration', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(544, 'en', 'photography', 'Photography', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(545, 'en', '3d_render', '3D Render', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(546, 'en', 'pencil_drawing', 'Pencil Drawing', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(547, 'en', 'mood', 'Mood', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(548, 'en', 'mood_of_the_image_will_be_as_selected', 'Mood of the image will be as selected', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(549, 'en', 'angry', 'Angry', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(550, 'en', 'agressive', 'Agressive', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(551, 'en', 'calm', 'Calm', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(552, 'en', 'cheerful', 'Cheerful', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(553, 'en', 'chilling', 'Chilling', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(554, 'en', 'dark', 'Dark', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(555, 'en', 'happy', 'Happy', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(556, 'en', 'sad', 'Sad', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(557, 'en', 'image_resolution', 'Image Resolution', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(558, 'en', 'select_image_resolution_size_that_you_need', 'Select image resolution size that you need', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(559, 'en', 'small_256x256', 'Small [256x256]', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(560, 'en', 'medium_512x512', 'Medium [512x512]', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(561, 'en', 'large_1024x1024', 'Large [1024x1024]', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(562, 'en', 'create_image', 'Create Image', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(563, 'en', 'type__hit_enter', 'Type & hit enter', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(564, 'en', 'created_at', 'Created at', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(565, 'en', 'resolation', 'Resolation', '2023-05-29 17:48:54', '2023-05-29 17:48:54', NULL),
(566, 'en', 'smtp_configuration', 'SMTP Configuration', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(567, 'en', 'sendmail', 'Sendmail', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(568, 'en', 'smtp', 'SMTP', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(569, 'en', 'mail_host', 'Mail Host', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(570, 'en', 'type_mail_host', 'Type mail host', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(571, 'en', 'mail_port', 'Mail Port', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(572, 'en', 'type_mail_port', 'Type mail port', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(573, 'en', 'mail_username', 'Mail Username', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(574, 'en', 'type_mail_username', 'Type mail username', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(575, 'en', 'mail_password', 'Mail Password', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(576, 'en', 'type_mail_password', 'Type mail password', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(577, 'en', 'mail_encryption', 'Mail Encryption', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(578, 'en', 'type_mail_encryption', 'Type mail encryption', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(579, 'en', 'mail_from_address', 'Mail From Address', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(580, 'en', 'type_mail_from_address', 'Type mail from address', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(581, 'en', 'mail_from_name', 'Mail From Name', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(582, 'en', 'type_mail_from_name', 'Type mail from name', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(583, 'en', 'configure_smtp', 'Configure SMTP', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(584, 'en', 'smtp_information', 'SMTP Information', '2023-05-29 17:49:49', '2023-05-29 17:49:49', NULL),
(585, 'en', 'twilio_credentials', 'Twilio Credentials', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(586, 'en', 'twilio_sid', 'Twilio SID', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(587, 'en', 'twilio_auth_token', 'Twilio Auth Token', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(588, 'en', 'valid_twilo_number', 'Valid Twilo Number', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(589, 'en', 'active_sms_gateway', 'Active SMS Gateway', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(590, 'en', 'select_sms_gateway', 'Select SMS gateway', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(591, 'en', 'twilio', 'Twilio', '2023-05-29 17:49:52', '2023-05-29 17:49:52', NULL),
(592, 'en', 'payment_methods_settings', 'Payment Methods Settings', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(593, 'en', 'paypal_credentials', 'Paypal Credentials', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(594, 'en', 'paypal_client_id', 'Paypal Client ID', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(595, 'en', 'paypal_client_secret', 'Paypal Client Secret', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(596, 'en', 'enable_paypal', 'Enable Paypal', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(597, 'en', 'enable_test_sandbox_mode', 'Enable Test Sandbox Mode', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(598, 'en', 'stripe_credentials', 'Stripe Credentials', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(599, 'en', 'stripe_key', 'Stripe Key', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(600, 'en', 'stripe_secret', 'Stripe Secret', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(601, 'en', 'enable_stripe', 'Enable Stripe', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(602, 'en', 'paytm_credentials', 'PayTm Credentials', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(603, 'en', 'paytm_environment', 'PayTm Environment', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(604, 'en', 'paytm_merchant_id', 'PayTm Merchant ID', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(605, 'en', 'paytm_merchant_key', 'PayTm Merchant Key', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(606, 'en', 'paytm_merchant_website', 'PayTm Merchant Website', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(607, 'en', 'paytm_channel', 'PayTm Channel', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(608, 'en', 'paytm_industry_type', 'PayTm Industry Type', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(609, 'en', 'enable_paytm', 'Enable PayTm', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(610, 'en', 'razorpay_credentials', 'Razorpay Credentials', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(611, 'en', 'razorpay_key', 'Razorpay Key', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(612, 'en', 'razorpay_secret', 'Razorpay Secret', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(613, 'en', 'enable_razorpay', 'Enable Razorpay', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(614, 'en', 'iyzico_credentials', 'IyZico Credentials', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(615, 'en', 'iyzico_api_key', 'IyZico API Key', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(616, 'en', 'iyzico_secret_key', 'IyZico Secret Key', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(617, 'en', 'enable_iyzico', 'Enable IyZico', '2023-05-29 17:50:27', '2023-05-29 17:50:27', NULL),
(618, 'en', 'payment_settings_updated_successfully', 'Payment settings updated successfully', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(619, 'en', 'paypal', 'Paypal', '2023-05-29 17:50:51', '2023-05-29 17:50:51', NULL),
(620, 'en', 'stripe', 'Stripe', '2023-05-29 17:50:51', '2023-05-29 17:50:51', NULL),
(621, 'en', 'paytm', 'Paytm', '2023-05-29 17:50:51', '2023-05-29 17:50:51', NULL),
(622, 'en', 'razorpay', 'Razorpay', '2023-05-29 17:50:51', '2023-05-29 17:50:51', NULL),
(623, 'en', 'iyzico', 'IyZico', '2023-05-29 17:50:51', '2023-05-29 17:50:51', NULL),
(624, 'en', 'subscription_package_updated_successfully', 'Subscription package updated successfully', '2023-05-29 17:51:39', '2023-05-29 17:51:39', NULL),
(625, 'en', 'renew_package', 'Renew Package', '2023-05-29 17:51:47', '2023-05-29 17:51:47', NULL),
(626, 'en', 'roles', 'Roles', '2023-05-29 17:52:31', '2023-05-29 17:52:31', NULL),
(627, 'en', 'add_role', 'Add Role', '2023-05-29 17:52:32', '2023-05-29 17:52:32', NULL),
(628, 'en', 'na', 'n/a', '2023-05-29 17:52:32', '2023-05-29 17:52:32', NULL),
(629, 'en', 'write_a_complete_article_on_this_topic', 'Write a complete article on this topic', '2023-05-29 17:52:55', '2023-05-29 17:52:55', NULL),
(630, 'en', 'your_message_has_been_sent', 'Your message has been sent', '2023-05-29 17:53:51', '2023-05-29 17:53:51', NULL),
(631, 'en', 'new', 'New', '2023-05-29 17:53:58', '2023-05-29 17:53:58', NULL),
(632, 'en', 'new_contact_message', 'New Contact Message', '2023-05-29 17:53:58', '2023-05-29 17:53:58', NULL),
(633, 'en', 'blog_tags', 'Blog Tags', '2023-05-29 17:54:44', '2023-05-29 17:54:44', NULL),
(634, 'en', 'write_blog_tags_about', 'Write blog tags about', '2023-05-29 17:55:19', '2023-05-29 17:55:19', NULL),
(635, 'en', 'remaining_words', 'Remaining Words', '2023-05-29 17:55:23', '2023-05-29 17:55:23', NULL),
(636, 'en', 'blog_ideas', 'Blog Ideas', '2023-05-29 17:55:48', '2023-05-29 17:55:48', NULL),
(637, 'en', 'write_interesting_blog_ideas_and_outline_about', 'Write interesting blog ideas and outline about', '2023-05-29 17:57:09', '2023-05-29 17:57:09', NULL),
(638, 'en', 'output_result_should_sound_like', 'Output result should sound like', '2023-05-29 17:57:09', '2023-05-29 17:57:09', NULL),
(639, 'en', 'project_details', 'Project Details', '2023-05-29 17:58:29', '2023-05-29 17:58:29', NULL),
(640, 'en', 'project_information', 'Project Information', '2023-05-29 17:58:29', '2023-05-29 17:58:29', NULL),
(641, 'en', 'generate_10_appropriate_blog_titles_for', 'Generate 10 appropriate blog titles for', '2023-05-29 17:58:45', '2023-05-29 17:58:45', NULL),
(642, 'en', 'social_media_bio', 'Social Media Bio', '2023-05-29 17:58:45', '2023-05-29 17:58:45', NULL),
(643, 'en', 'eg_entrepreneur_writer_photographer', 'e.g. Entrepreneur, Writer, Photographer', '2023-05-29 17:58:45', '2023-05-29 17:58:45', NULL),
(644, 'en', 'write_bio_for_social_media_using_following_keywords', 'Write bio for social media using following keywords', '2023-05-29 17:58:56', '2023-05-29 17:58:56', NULL),
(645, 'en', 'download_image', 'Download Image', '2023-05-29 18:06:02', '2023-05-29 18:06:02', NULL),
(646, 'en', 'max_size_', 'Max Size: ', '2023-05-29 18:06:45', '2023-05-29 18:06:45', NULL),
(647, 'en', 'write_code_using_this_code_generator_in_any_programming_language', 'Write code using this code generator in any programming language.', '2023-05-29 18:07:09', '2023-05-29 18:07:09', NULL),
(648, 'en', 'type_title', 'Type Title', '2023-05-29 18:07:09', '2023-05-29 18:07:09', NULL),
(649, 'en', 'type_code_title', 'Type code title', '2023-05-29 18:07:09', '2023-05-29 18:07:09', NULL),
(650, 'en', 'type_description', 'Type Description', '2023-05-29 18:07:09', '2023-05-29 18:07:09', NULL),
(651, 'en', 'generate_a_javascript_function_to_add_2_numbers_and_return_their_sum', 'Generate a javascript function to add 2 numbers and return their sum', '2023-05-29 18:07:09', '2023-05-29 18:07:09', NULL),
(652, 'en', 'social_login_configurations', 'Social Login Configurations', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(653, 'en', 'google_login', 'Google Login', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(654, 'en', 'google_client_id', 'Google Client ID', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(655, 'en', 'google_client_secret', 'Google Client Secret', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(656, 'en', 'facebook_login', 'Facebook Login', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(657, 'en', 'facebook_app_id', 'Facebook App ID', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(658, 'en', 'facebook_app_secret', 'Facebook App Secret', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(659, 'en', 'faccebook_login', 'Faccebook Login', '2023-05-29 18:11:12', '2023-05-29 18:11:12', NULL),
(660, 'en', 'connect_with_google', 'Connect With Google', '2023-05-29 18:18:56', '2023-05-29 18:18:56', NULL),
(661, 'en', 'connect_with_facebook', 'Connect With Facebook', '2023-05-29 18:18:56', '2023-05-29 18:18:56', NULL),
(662, 'en', 'or_continue_with', 'or Continue With', '2023-05-29 18:18:56', '2023-05-29 18:18:56', NULL),
(663, 'en', 'faqs', 'FAQs', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(664, 'en', 'question', 'Question', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(665, 'en', 'answer', 'Answer', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(666, 'en', 'add_new_faq', 'Add New FAQ', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(667, 'en', 'type_question', 'Type question', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(668, 'en', 'type_answer', 'Type answer', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(669, 'en', 'save_faq', 'Save FAQ', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(670, 'en', 'faq_information', 'FAQ Information', '2023-05-29 18:29:12', '2023-05-29 18:29:12', NULL),
(671, 'en', 'faq_has_been_added_successfully', 'FAQ has been added successfully', '2023-05-29 18:30:09', '2023-05-29 18:30:09', NULL),
(672, 'en', 'affiliate_system', 'Affiliate System', '2023-06-02 11:14:23', '2023-06-02 11:14:23', NULL),
(673, 'en', 'configurations', 'Configurations', '2023-06-02 11:14:23', '2023-06-02 11:14:23', NULL),
(674, 'en', 'code_has_been_copied_successfully', 'Code has been copied successfully', '2023-06-02 11:14:25', '2023-06-02 11:14:25', NULL),
(675, 'en', 'affiliate_configurations', 'Affiliate Configurations', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(676, 'en', 'affiliate_commission_', 'Affiliate Commission %', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(677, 'en', 'type_affiliate_commission_', 'Type affiliate commission %', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(678, 'en', 'minimum_withdrawal_amount', 'Minimum Withdrawal Amount', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(679, 'en', 'type_minimum_withdrawal_amount', 'Type minimum withdrawal amount', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(680, 'en', 'allow_commission_continuously', 'Allow Commission Continuously', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(681, 'en', 'if_enabled_user_will_get_commission_for_each_subscriptions_of_referred_user_otherwise_only_for_the_first_subscription', 'If enabled, user will get commission for each subscriptions of referred user. Otherwise only for the first subscription.', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(682, 'en', 'payout_payment_methods', 'Payout Payment Methods', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(683, 'en', 'select_payout_payment_methods', 'Select payout payment methods', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(684, 'en', 'bank_payment', 'Bank Payment', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(685, 'en', 'enable_affiliate_system', 'Enable Affiliate System', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(686, 'en', 'configure_affiliate_settings', 'Configure Affiliate Settings', '2023-06-02 11:14:29', '2023-06-02 11:14:29', NULL),
(687, 'en', 'withdraw_requests', 'Withdraw Requests', '2023-06-02 11:14:53', '2023-06-02 11:14:53', NULL),
(688, 'en', 'earning_histories', 'Earning Histories', '2023-06-02 11:14:53', '2023-06-02 11:14:53', NULL),
(689, 'en', 'payment_histories', 'Payment Histories', '2023-06-02 11:14:53', '2023-06-02 11:14:53', NULL),
(690, 'en', 'affiliate_withdraw_requests', 'Affiliate Withdraw Requests', '2023-06-02 11:15:00', '2023-06-02 11:15:00', NULL),
(691, 'en', 'date', 'Date', '2023-06-02 11:15:01', '2023-06-02 11:15:01', NULL),
(692, 'en', 'amount', 'Amount', '2023-06-02 11:15:01', '2023-06-02 11:15:01', NULL),
(693, 'en', 'status', 'Status', '2023-06-02 11:15:01', '2023-06-02 11:15:01', NULL),
(694, 'en', 'additional_info', 'Additional Info', '2023-06-02 11:15:01', '2023-06-02 11:15:01', NULL),
(695, 'en', 'remarks', 'Remarks', '2023-06-02 11:15:01', '2023-06-02 11:15:01', NULL),
(696, 'en', 'language_has_been_inserted_successfully', 'Language has been inserted successfully', '2023-06-05 08:59:37', '2023-06-05 08:59:37', NULL),
(697, 'hn', 'home', 'घर', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(698, 'hn', 'start_writing', 'लिखना शुरू करें', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(699, 'hn', 'our_best_features', 'हमारी सर्वश्रेष्ठ विशेषताएं', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(700, 'hn', 'we_are_more_powerful_than_others', 'हम दूसरों से अधिक शक्तिशाली हैं', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(701, 'hn', 'blog_content', 'ब्लॉग सामग्री', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(702, 'hn', 'email_template', 'ईमेल टेम्पलेट', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(703, 'hn', 'social_media', 'सामाजिक मीडिया', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(704, 'hn', 'video_content', 'वीडियो सामग्री', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(705, 'hn', 'website_content', 'वेबसाइट सामग्री', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(706, 'hn', 'fun__quote', 'मज़ा और उद्धरण', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(707, 'hn', 'medium_content', 'मध्यम सामग्री', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(708, 'hn', 'tik_tok', 'टिक टॉक', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(709, 'hn', 'instagram', 'Instagram', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(710, 'hn', 'success_story', 'सफलता की कहानी', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(711, 'hn', 'we_help_you', 'हम आपकी मदद करते हैं', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(712, 'hn', 'to_write_better_contents_faster', 'बेहतर सामग्री को तेज़ी से लिखने के लिए', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(713, 'hn', 'favorite', 'पसंदीदा', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(714, 'hn', 'words_generated', 'शब्द उत्पन्न', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(715, 'hn', 'view_all_templates', 'सभी टेम्पलेट देखें', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(716, 'hn', 'what_customers_saying', 'ग्राहक क्या कह रहे हैं', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(717, 'hn', 'about_us', 'हमारे बारे में', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(718, 'hn', 'our_subscription_packages', 'हमारे सदस्यता पैकेज', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(719, 'hn', 'ready_to_get_started', 'आरंभ करने के लिए तैयार हैं?', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(720, 'hn', 'monthly', 'महीने के', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(721, 'hn', 'select_payment_method', 'भुगतान का तरीका चुनें', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(722, 'hn', 'proceed', 'आगे बढ़ना', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(723, 'hn', 'please_wait', 'कृपया प्रतीक्षा करें', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(724, 'hn', 'templates', 'टेम्पलेट्स', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(725, 'hn', 'everything_that_you_need', 'आपको जो कुछ भी चाहिए', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(726, 'hn', 'pricing', 'मूल्य निर्धारण', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(727, 'en', 'localizations_have_been_updated', 'Localizations have been updated', '2023-06-05 09:00:14', '2023-06-05 09:00:14', NULL),
(728, 'hn', 'company', 'कंपनी', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(729, 'hn', 'useful_links', 'उपयोगी कड़ियां', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(730, 'hn', 'contact_us', 'संपर्क करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(731, 'hn', 'our_latest_news', 'हमारे नवीनतम समाचार', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(732, 'hn', 'customer_review', 'ग्राहक समीक्षा', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(733, 'hn', 'dashboard', 'डैशबोर्ड', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(734, 'hn', 'enter_email_address', 'ईमेल पता दर्ज करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(735, 'hn', 'subscribe', 'सदस्यता लें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(736, 'hn', 'content_has_been_copied_successfully', 'सामग्री को सफलतापूर्वक कॉपी कर लिया गया है', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(737, 'hn', 'contents_generated_successfully', 'सामग्री सफलतापूर्वक उत्पन्न हुई', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(738, 'hn', 'something_went_wrong', 'कुछ गलत हो गया', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(739, 'hn', 'please_generate_ai_contents_first', 'कृपया पहले AI सामग्री तैयार करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(740, 'hn', 'project_moved_successfully', 'प्रोजेक्ट सफलतापूर्वक चला गया', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(741, 'hn', 'contents_updated_successfully', 'सामग्री सफलतापूर्वक अपडेट की गई', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(742, 'hn', 'image_generated_successfully', 'छवि सफलतापूर्वक उत्पन्न हुई', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(743, 'hn', 'code_generated_successfully', 'कोड सफलतापूर्वक उत्पन्न हुआ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(744, 'hn', 'last_7_days', 'पिछले 7 दिन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(745, 'hn', 'overview', 'अवलोकन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(746, 'hn', 'create_content', 'सामग्री बनाएँ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(747, 'hn', 'subscription_packages', 'सदस्यता पैकेज', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(748, 'hn', 'total_words_generated', 'कुल शब्द उत्पन्न हुए', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(749, 'hn', 'total_image_generated', 'कुल छवि उत्पन्न', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(750, 'hn', 'total_code_generated', 'कुल कोड जनरेट किया गया', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(751, 'hn', 'total_spech_to_text', 'पाठ के लिए कुल युक्ति', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(752, 'hn', 'last_30_days', 'पिछले 30 दिनों में', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(753, 'hn', 'last_3_months', 'पिछले 3 महीने', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(754, 'hn', 'words', 'शब्द', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(755, 'hn', 'top_5_templates', 'शीर्ष 5 टेम्पलेट्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(756, 'hn', 'recent_projects', 'हाल ही में की परियोजनाएं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(757, 'hn', 'sl', 'एस/एल', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(758, 'hn', 'project_name', 'परियोजना का नाम', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(759, 'hn', 'created_date', 'सृजित दिनांक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(760, 'hn', 'type', 'प्रकार', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(761, 'hn', 'wordssize', 'शब्द / आकार', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(762, 'hn', 'action', 'कार्य', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(763, 'hn', 'subscriptions', 'सदस्यता', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(764, 'hn', 'subscription_histories', 'सदस्यता इतिहास', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(765, 'hn', 'manage_documents', 'दस्तावेज़ प्रबंधित करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(766, 'hn', 'folders', 'फ़ोल्डर', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(767, 'hn', 'all_projects', 'सभी परियोजनाएं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(768, 'hn', 'ai_tools', 'एआई उपकरण', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(769, 'hn', 'prompts', 'संकेतों', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(770, 'hn', 'speech_to_text', 'भाषण से पाठ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(771, 'hn', 'generate_images', 'छवियां उत्पन्न करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(772, 'hn', 'generate_code', 'कोड जनरेट करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(773, 'hn', 'popular_templates', 'लोकप्रिय टेम्पलेट्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(774, 'hn', 'favorite_templates', 'पसंदीदा टेम्पलेट्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(775, 'hn', 'manage_users', 'उपयोगकर्ताओं को प्रबंधित करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(776, 'hn', 'customers', 'ग्राहकों', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(777, 'hn', 'employee_staffs', 'कर्मचारी कर्मचारी', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(778, 'hn', 'support', 'सहायता', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(779, 'hn', 'queries', 'प्रश्नों', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(780, 'hn', 'manage_contents', 'सामग्री प्रबंधित करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(781, 'hn', 'tags', 'टैग', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(782, 'hn', 'blogs', 'ब्लॉग', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(783, 'hn', 'all_blogs', 'सभी ब्लॉग', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(784, 'hn', 'categories', 'श्रेणियाँ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(785, 'hn', 'pages', 'पृष्ठों', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(786, 'hn', 'all_faqs', 'सभी अक्सर पूछे जाने वाले प्रश्न', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(787, 'hn', 'media_manager', 'मीडिया प्रबंधक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(788, 'hn', 'manage_promotions', 'प्रचार प्रबंधित करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(789, 'hn', 'newsletters', 'समाचार', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(790, 'hn', 'bulk_emails', 'थोक ईमेल', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(791, 'hn', 'subscribers', 'ग्राहकों', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(792, 'hn', 'manage_settings', 'सेटिंग्स प्रबंधित करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(793, 'hn', 'open_ai', 'एआई खोलें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(794, 'hn', 'appearance', 'उपस्थिति', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(795, 'hn', 'homepage', 'मुखपृष्ठ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(796, 'hn', 'header', 'हैडर', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(797, 'hn', 'footer', 'फ़ुटबाल', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(798, 'hn', 'roles__permissions', 'भूमिकाएँ और अनुमतियाँ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(799, 'hn', 'system_settings', 'प्रणाली व्यवस्था', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(800, 'hn', 'auth_settings', 'प्रामाणिक सेटिंग्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(801, 'hn', 'otp_settings', 'ओटीपी सेटिंग्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(802, 'hn', 'smtp_settings', 'एसएमटीपी सेटिंग्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(803, 'hn', 'general_settings', 'सामान्य सेटिंग्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(804, 'hn', 'payment_methods', 'भुगतान की विधि', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(805, 'hn', 'social_media_login', 'सोशल मीडिया लॉगिन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(806, 'hn', 'multilingual_settings', 'बहुभाषी सेटिंग्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(807, 'hn', 'multi_currency_settings', 'बहु मुद्रा सेटिंग्स', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(808, 'hn', 'my_account', 'मेरा खाता', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(809, 'hn', 'sign_out', 'साइन आउट', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(810, 'hn', 'search', 'खोज', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(811, 'hn', 'no_new_notification', 'कोई नई अधिसूचना नहीं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(812, 'hn', 'visit_website', 'बेवसाइट देखना', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(813, 'hn', 'media_files', 'मीडिया फ़ाइलें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(814, 'hn', 'recently_uploaded_files', 'हाल ही में अपलोड की गई फ़ाइलें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(815, 'hn', 'add_files_here', 'फ़ाइलें यहाँ जोड़ें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(816, 'hn', 'previously_uploaded_files', 'पहले अपलोड की गई फ़ाइलें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(817, 'hn', 'search_by_name', 'नाम से खोजें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(818, 'hn', 'load_more', 'और लोड करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(819, 'hn', 'select', 'चुनना', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(820, 'hn', 'delete_confirmation', 'पुष्टि हटाएं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(821, 'hn', 'are_you_sure_to_delete_this', 'क्या आप वाकई इसे मिटाना चाहते हैं?', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(822, 'hn', 'all_data_related_to_this_may_get_deleted', 'इससे संबंधित सभी डेटा डिलीट हो सकते हैं।', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(823, 'hn', 'cancel', 'रद्द करना', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(824, 'hn', 'no_data_found', 'डाटा प्राप्त नहीं हुआ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(825, 'hn', 'selected_file', 'चयनित फ़ाइल', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(826, 'hn', 'selected_files', 'चयनित फ़ाइलें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(827, 'hn', 'file_added', 'फ़ाइल जोड़ी गई', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(828, 'hn', 'files_added', 'फ़ाइलें जोड़ी गईं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(829, 'hn', 'no_file_chosen', 'कोई फ़ाइल चुना नही', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(830, 'hn', 'move_to_folder', 'फ़ोल्डर में ले जाएँ', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(831, 'hn', 'move_project', 'मूव प्रोजेक्ट', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(832, 'hn', 'save_changes', 'परिवर्तनों को सुरक्षित करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(833, 'hn', 'website_homepage_configuration', 'वेबसाइट होमपेज कॉन्फ़िगरेशन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(834, 'hn', 'hero_section_configuration', 'हीरो सेक्शन कॉन्फ़िगरेशन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(835, 'hn', 'hero', 'नायक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(836, 'hn', 'hero_information', 'हीरो सूचना', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(837, 'hn', 'title', 'शीर्षक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(838, 'hn', 'colorful_title', 'रंगीन शीर्षक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(839, 'hn', 'sub_title', 'उप शीर्षक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(840, 'hn', 'background_image', 'पृष्ठभूमि छवि', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(841, 'hn', 'choose_background', 'पृष्ठभूमि चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(842, 'hn', 'animated_image', 'एनिमेटेड छवि', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(843, 'hn', 'choose_animated_image', 'एनिमेटेड छवि चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(844, 'hn', 'homepage_configuration', 'मुखपृष्ठ विन्यास', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(845, 'hn', 'hero_section', 'हीरो सेक्शन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(846, 'hn', 'trusted_by', 'द्वारा विश्वसनीय', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(847, 'hn', 'how_it_works', 'यह काम किस प्रकार करता है?', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(848, 'hn', 'feature_images', 'फीचर छवियां', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(849, 'hn', 'client_feedback', 'ग्राहक प्रतिक्रिया', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(850, 'hn', 'cta_section', 'सीटीए अनुभाग', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(851, 'hn', 'website_header_configuration', 'वेबसाइट हैडर कॉन्फ़िगरेशन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(852, 'hn', 'navbar_information', 'नवबार सूचना', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(853, 'hn', 'navbar_logo_white', 'नवबार लोगो सफेद', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(854, 'hn', 'choose_navbar_white_logo', 'नवबार सफेद लोगो चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(855, 'hn', 'navbar_logo_dark', 'नवबार लोगो डार्क', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(856, 'hn', 'choose_navbar_dark_logo', 'नवबार डार्क लोगो चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(857, 'hn', 'templates_group', 'टेम्पलेट समूह', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(858, 'hn', 'select_groups', 'समूहों का चयन करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(859, 'hn', 'select_pages', 'पृष्ठों का चयन करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(860, 'hn', 'header_configuration', 'शीर्षलेख विन्यास', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(861, 'hn', 'settings_updated_successfully', 'सेटिंग्स सफलतापूर्वक अपडेट की गईं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(862, 'hn', 'general_informations', 'सामान्य सूचनाएं', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(863, 'hn', 'system_title', 'सिस्टम शीर्षक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(864, 'hn', 'browser_tab_title_separator', 'ब्राउज़र टैब शीर्षक विभाजक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(865, 'hn', 'contact_email', 'ई - मेल से संपर्क करे', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(866, 'hn', 'contact_phone', 'संपर्क फ़ोन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(867, 'hn', 'dashboard_logo__favicon', 'डैशबोर्ड लोगो और फ़ेविकॉन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(868, 'hn', 'dashboard_logo', 'डैशबोर्ड लोगो', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(869, 'hn', 'choose_dashboard_logo', 'डैशबोर्ड लोगो चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(870, 'hn', 'favicon', 'फ़ेविकॉन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(871, 'hn', 'choose_favicon', 'फ़ेविकॉन चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(872, 'hn', 'maintenance_mode', 'रखरखाव मोड', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(873, 'hn', 'enable_maintenance_mode', 'रखरखाव मोड सक्षम करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(874, 'hn', 'set_maintenance_mode', 'रखरखाव मोड सेट करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(875, 'hn', 'enable', 'सक्षम', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(876, 'hn', 'disable', 'अक्षम करना', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(877, 'hn', 'seo_meta_configuration', 'एसईओ मेटा कॉन्फ़िगरेशन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(878, 'hn', 'meta_title', 'मेटा शीर्षक', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(879, 'hn', 'type_meta_title', 'मेटा शीर्षक टाइप करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(880, 'hn', 'set_a_meta_tag_title_recommended_to_be_simple_and_unique', 'मेटा टैग शीर्षक सेट करें। सरल और अद्वितीय होने की अनुशंसा की जाती है।', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(881, 'hn', 'meta_description', 'मेटा विवरण', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(882, 'hn', 'type_your_meta_description', 'अपना मेटा विवरण टाइप करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(883, 'hn', 'meta_keywords', 'मेटा खोजशब्दों', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(884, 'hn', 'meta_image', 'मेटा छवि', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(885, 'hn', 'choose_meta_image', 'मेटा इमेज चुनें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(886, 'hn', 'save_configuration', 'कॉन्फ़िगरेशन सहेजें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(887, 'hn', 'configure_general_settings', 'सामान्य सेटिंग्स कॉन्फ़िगर करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(888, 'hn', 'general_information', 'सामान्य जानकारी', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(889, 'hn', 'dashborad_logo__favicon', 'डैशबोर्ड लोगो और फ़ेविकॉन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(890, 'hn', 'seo_configuration', 'एसईओ विन्यास', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(891, 'hn', 'please_login_to_continue', 'जारी रखने के लिए कृपया लॉगिन करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(892, 'hn', 'login', 'लॉग इन करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(893, 'hn', 'email', 'ईमेल', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(894, 'hn', 'enter_your_email', 'अपना ईमेल दर्ज करें', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(895, 'hn', 'login_with_phone', 'फ़ोन से लॉग इन करें?', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(896, 'hn', 'phone', 'फ़ोन', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(897, 'hn', 'login_with_email', 'ईमेल से लॉगिन करें?', '2023-06-05 09:03:08', '2023-06-05 09:03:08', NULL),
(898, 'hn', 'password', 'पासवर्ड', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(899, 'hn', 'enter_your_password', 'अपना कूटशब्द भरें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(900, 'hn', 'sign_in', 'दाखिल करना', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(901, 'hn', 'dont_have_an_account', 'खाता नहीं है?', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(902, 'hn', 'sign_up', 'साइन अप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(903, 'hn', 'forgot_password', 'पासवर्ड भूल गए', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(904, 'hn', 'get_started', 'शुरू हो जाओ', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(905, 'hn', 'trusted_by_information', 'सूचना के भरोसे', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(906, 'hn', 'trusted_by_images', 'छवियों द्वारा विश्वसनीय', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(907, 'hn', 'choose_images', 'छवियां चुनें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(908, 'hn', 'step_1', 'स्टेप 1:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(909, 'hn', 'short_description', 'संक्षिप्त वर्णन', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(910, 'hn', 'features', 'विशेषताएँ', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(911, 'hn', 'comma_separated_one_two', 'अल्पविराम से अलग: एक, दो', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(912, 'hn', 'button_title', 'बटन शीर्षक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(913, 'hn', 'button_link', 'बटन लिंक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(914, 'hn', 'step_1_image', 'चरण 1 छवि', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(915, 'hn', 'step_2', 'चरण दो:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(916, 'hn', 'step_2_image', 'चरण 2 छवि', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(917, 'hn', 'step_3', 'चरण 3:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(918, 'hn', 'step_3_image', 'चरण 3 छवि', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(919, 'hn', 'step_4', 'चरण 4:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(920, 'hn', 'step_4_image', 'चरण 4 छवि', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(921, 'hn', 'all_templates', 'सभी टेम्पलेट्स', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(922, 'hn', 'blog_section', 'ब्लॉग अनुभाग', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(923, 'hn', 'generate_contents', 'सामग्री उत्पन्न करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(924, 'hn', 'select_input__output_language', 'इनपुट और आउटपुट भाषा का चयन करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(925, 'hn', 'title_of_the_blog', 'ब्लॉग का शीर्षक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(926, 'hn', 'eg_best_restaurants_in_la_to_eat_indian_foods', 'उदाहरण के लिए, भारतीय खाद्य पदार्थ खाने के लिए एलए में सर्वश्रेष्ठ रेस्तरां', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(927, 'hn', 'what_are_the_main_points_you_want_to_cover', 'आप किन मुख्य बिंदुओं को कवर करना चाहते हैं?', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(928, 'hn', 'eg_dosa_biriyani_tandoori_chicken', 'जैसे डोसा, बिरयानी, तंदूरी चिकन', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(929, 'hn', 'advance_options', 'अग्रिम विकल्प', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(930, 'hn', 'browse_more_fields', 'अधिक फ़ील्ड ब्राउज़ करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(931, 'hn', 'creative_label', 'क्रिएटिव लेबल', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(932, 'hn', 'creativity_level_of_the_output_will_be_as_selected', 'आउटपुट का रचनात्मकता स्तर चयनित के रूप में होगा', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(933, 'hn', 'high', 'उच्च', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(934, 'hn', 'medium', 'मध्यम', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(935, 'hn', 'low', 'कम', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(936, 'hn', 'choose_a_tone', 'एक स्वर चुनें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(937, 'hn', 'choose_the_tone_of_the_result_text_as_you_need', 'अपनी आवश्यकता के अनुसार परिणाम पाठ का स्वर चुनें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(938, 'hn', 'friendly', 'दोस्ताना', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(939, 'hn', 'luxury', 'विलासिता', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(940, 'hn', 'relaxed', 'ढील', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(941, 'hn', 'professional', 'पेशेवर', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(942, 'hn', 'casual', 'अनौपचारिक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(943, 'hn', 'excited', 'उत्तेजित', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(944, 'hn', 'bold', 'निडर', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(945, 'hn', 'masculine', 'मदार्ना', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(946, 'hn', 'dramatic', 'नाटकीय', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(947, 'hn', 'number_of_results', 'परिणामों की संख्या', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(948, 'hn', 'select_how_many_variations_of_result_you_want', 'चुनें कि आप कितने प्रकार के परिणाम चाहते हैं', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(949, 'hn', 'max_results_length', 'अधिकतम परिणाम लंबाई', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(950, 'hn', 'maximum_words_for_each_result', 'प्रत्येक परिणाम के लिए अधिकतम शब्द', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(951, 'hn', 'enter_maximum_word_limit', 'अधिकतम शब्द सीमा दर्ज करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(952, 'hn', 'your_project_title', 'आपका प्रोजेक्ट शीर्षक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(953, 'hn', 'copy_contents', 'कॉपी सामग्री', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(954, 'hn', 'languages', 'बोली', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(955, 'hn', 'name', 'नाम', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(956, 'hn', 'iso_6391_code', 'आईएसओ 639-1 कोड', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(957, 'hn', 'active', 'सक्रिय', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(958, 'hn', 'edit', 'संपादन करना', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(959, 'hn', 'localizations', 'स्थानीयकरणों', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(960, 'hn', 'add_new_language', 'नई भाषा जोड़ें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(961, 'hn', 'language_name', 'भाषा का नाम', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(962, 'hn', 'type_language_name', 'भाषा का नाम टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(963, 'hn', 'enbn', 'और/बीएन', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(964, 'hn', 'flag', 'झंडा', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(965, 'hn', 'rtl', 'आरटीएल', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(966, 'hn', 'save_language', 'भाषा सहेजें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(967, 'hn', 'set_default_language', 'डिफ़ॉल्ट भाषा सेट करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(968, 'hn', 'default_language', 'डिफ़ॉल्ट भाषा', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL);
INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(969, 'hn', 'language_information', 'भाषा की जानकारी', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(970, 'hn', 'all_languages', 'सारी भाषाएँ', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(971, 'hn', 'lang_key', 'लैंग की', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(972, 'hn', 'type_localization_here', 'स्थानीयकरण यहाँ टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(973, 'hn', 'copy_localizations', 'स्थानीयकरण कॉपी करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(974, 'hn', 'save', 'बचाना', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(975, 'hn', 'currencies', 'मुद्राओं', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(976, 'hn', 'symbol', 'प्रतीक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(977, 'hn', 'code', 'कोड', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(978, 'hn', 'alignment', 'संरेखण', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(979, 'hn', '1_usd__', '1 यूएसडी = ?', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(980, 'hn', 'symbolamount', '[प्रतीक] [राशि]', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(981, 'hn', 'add_new_currency', 'नई मुद्रा जोड़ें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(982, 'hn', 'currency_name', 'मुद्रा का नाम', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(983, 'hn', 'type_currency_name', 'करेंसी का नाम टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(984, 'hn', 'currency_symbol', 'मुद्रा चिन्ह', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(985, 'hn', 'type_symbol', 'प्रतीक टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(986, 'hn', 'currency_code', 'मुद्रा कोड', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(987, 'hn', 'type_code', 'कोड टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(988, 'hn', 'rate', 'दर', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(989, 'hn', 'amountsymbol', '[राशि][प्रतीक]', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(990, 'hn', 'symbol_amount', '[प्रतीक] [राशि]', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(991, 'hn', 'amount_symbol', '[राशि] [प्रतीक]', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(992, 'hn', 'save_currency', 'मुद्रा बचाओ', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(993, 'hn', 'set_default_currency', 'डिफ़ॉल्ट मुद्रा सेट करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(994, 'hn', 'default_currency', 'डिफ़ॉल्ट मुद्रा', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(995, 'hn', 'no_of_decimals', 'दशमलव की संख्या', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(996, 'hn', 'price_format', 'मूल्य प्रारूप', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(997, 'hn', 'show_full_price_1000000', 'पूरी कीमत दिखाएं (1000000)', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(998, 'hn', 'truncate_price_1m1b', 'ट्रंकेट मूल्य (1M/1B)', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(999, 'hn', 'save_configurations', 'कॉन्फ़िगरेशन सहेजें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1000, 'hn', 'currency_information', 'मुद्रा की जानकारी', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1001, 'hn', 'all_currencies', 'सभी मुद्राएँ', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1002, 'hn', 'currency_configurations', 'मुद्रा विन्यास', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1003, 'hn', 'status_updated_successfully', 'स्थिति सफलतापूर्वक अपडेट की गई', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1004, 'hn', 'default_currency_can_not_be_disabled', 'डिफ़ॉल्ट मुद्रा अक्षम नहीं की जा सकती', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1005, 'hn', 'image_1', 'छवि 1:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1006, 'hn', 'feature_image_1', 'फ़ीचर छवि 1', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1007, 'hn', 'feature_image_2', 'फ़ीचर छवि 2:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1008, 'hn', 'feature_image_3', 'फ़ीचर छवि 3:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1009, 'hn', 'feature_image_4', 'फ़ीचर छवि 4:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1010, 'hn', 'feature_image_5', 'फ़ीचर छवि 5:', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1011, 'hn', 'what_clients_say', 'क्या कहते हैं ग्राहक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1012, 'hn', 'image', 'छवि', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1013, 'hn', 'designation', 'पद', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1014, 'hn', 'heading', 'शीर्षक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1015, 'hn', 'review', 'समीक्षा', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1016, 'hn', 'add_new_feedback', 'नई प्रतिक्रिया जोड़ें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1017, 'hn', 'type_reviewer_name', 'समीक्षक का नाम टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1018, 'hn', 'type_reviewer_designation', 'समीक्षक पदनाम टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1019, 'hn', 'hading', 'हैडिंग', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1020, 'hn', 'type_heading', 'हेडिंग टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1021, 'hn', 'rating', 'रेटिंग', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1022, 'hn', 'type_review', 'समीक्षा टाइप करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1023, 'hn', 'avatar_image', 'अवतार छवि', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1024, 'hn', 'choose_avatar_image', 'अवतार छवि चुनें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1025, 'hn', 'save_feedback', 'प्रतिक्रिया सहेजें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1026, 'hn', 'feedback_added_successfully', 'फ़ीडबैक सफलतापूर्वक जोड़ा गया', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1027, 'hn', 'delete', 'मिटाना', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1028, 'hn', 'update_feedback', 'फीडबैक अपडेट करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1029, 'hn', 'client_feedback_configuration', 'क्लाइंट फीडबैक कॉन्फ़िगरेशन', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1030, 'hn', 'feedback_updated_successfully', 'प्रतिक्रिया सफलतापूर्वक अपडेट की गई', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1031, 'hn', 'cta_configurations', 'सीटीए विन्यास', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1032, 'hn', 'title_colored', 'शीर्षक रंगीन', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1033, 'hn', 'website_footer_configuration', 'वेबसाइट पाद विन्यास', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1034, 'hn', 'quick_links', 'त्वरित सम्पक', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1035, 'hn', 'select_quick_link_pages', 'त्वरित लिंक पृष्ठों का चयन करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1036, 'hn', 'copyright_text', 'कॉपीराइट पाठ', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1037, 'hn', 'footer_configuration', 'पाद विन्यास', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1038, 'hn', 'our_pricing', 'हमारा मूल्य निर्धारण', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1039, 'hn', 'simple_and_flexible_only_pay_for_what_you_use', 'सरल और लचीला। आप जो उपयोग करते हैं उसके लिए ही भुगतान करें।', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1040, 'hn', 'frequently_asked_questions', 'अक्सर पूछे जाने वाले प्रश्नों', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1041, 'hn', 'everything_you_need_to_know_about_the_product_and_billing', 'उत्पाद और बिलिंग के बारे में वह सब कुछ जो आपको जानना चाहिए।', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1042, 'hn', 'get_to_know_more_about_us', 'हमारे बारे में और जानें।', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1043, 'hn', 'update_profile', 'प्रोफ़ाइल अपडेट करें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1044, 'hn', 'profile', 'प्रोफ़ाइल', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1045, 'hn', 'basic_information', 'मूल जानकारी', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1046, 'hn', 'type_your_name', 'अपना नाम डालें', '2023-06-05 09:03:33', '2023-06-05 09:03:33', NULL),
(1047, 'hn', 'type_your_email', 'अपना ईमेल टाइप करें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1048, 'hn', 'type_your_phone', 'अपना फोन टाइप करें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1049, 'hn', 'avatar', 'अवतार', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1050, 'hn', 'choose_avatar', 'अवतार चुनें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1051, 'hn', 'type_password', 'पासवर्ड लिखें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1052, 'hn', 'confirm_password', 'पासवर्ड की पुष्टि कीजिये', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1053, 'hn', 'retype_password', 'पासवर्ड फिर से लिखें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1054, 'hn', 'user_information', 'यूजर जानकारी', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1055, 'hn', 'password_confirmation_does_not_match', 'पासवर्ड की पुष्टि मेल नहीं खाती', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1056, 'hn', 'profile_has_been_updated', 'प्रोफ़ाइल अपडेट कर दी गई है', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1057, 'hn', 'user', 'उपयोगकर्ता', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1058, 'hn', 'package', 'पैकेट', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1059, 'hn', 'price', 'कीमत', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1060, 'hn', 'start_date', 'आरंभ करने की तिथि', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1061, 'hn', 'expire_date', 'समाप्त होने की तिथि', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1062, 'hn', 'payment_method', 'भुगतान विधि', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1063, 'hn', 'showing', 'दिखा', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1064, 'hn', 'of', 'का', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1065, 'hn', 'results', 'परिणाम', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1066, 'hn', 'yearly', 'सालाना', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1067, 'hn', 'lifetime', 'जीवनभर', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1068, 'hn', 'selected_package_type', 'चयनित पैकेज प्रकार', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1069, 'hn', 'free', 'मुक्त', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1070, 'hn', 'ai_templates', 'एआई टेम्पलेट्स', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1071, 'hn', 'words_per_month', 'प्रति माह शब्द', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1072, 'hn', 'images_per_month', 'प्रति माह छवियां', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1073, 'hn', 'speech_to_text_per_month', 'प्रति माह भाषण से पाठ', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1074, 'hn', 'audio_file_size_limit', 'ऑडियो फ़ाइल आकार सीमा', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1075, 'hn', 'allow_ai_images', 'एआई छवियों की अनुमति दें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1076, 'hn', 'allow_ai_code', 'एआई कोड की अनुमति दें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1077, 'hn', 'live_support', 'लाइव सहायता', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1078, 'hn', 'free_support', 'मुफ्त समर्थन', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1079, 'hn', 'is_featured', 'चित्रित है?', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1080, 'hn', 'select_open_ai_model', 'ओपन एआई मॉडल का चयन करें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1081, 'hn', 'type_additional_features', 'अतिरिक्त सुविधाएँ टाइप करें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1082, 'hn', 'comma_separated_feature_afeature_b', 'कोमा से अलग किया गया: फ़ीचर ए, फ़ीचर बी', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1083, 'hn', 'is_active', 'सक्रिय है?', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1084, 'hn', 'if_active_this_will_be_applied_to_new_users_registration', 'सक्रिय होने पर, यह नए उपयोगकर्ता के पंजीकरण पर लागू होगा।', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1085, 'hn', 'close', 'बंद करना', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1086, 'hn', 'templates_updated_successfully', 'टेम्प्लेट सफलतापूर्वक अपडेट किए गए', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1087, 'hn', 'package_created_successfully', 'पैकेज सफलतापूर्वक बनाया गया', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1088, 'hn', 'all_folders', 'सभी फ़ोल्डर', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1089, 'hn', 'add_new_folder', 'नया फ़ोल्डर जोड़ें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1090, 'hn', 'folder_name', 'फ़ोल्डर का नाम', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1091, 'hn', 'type_folder_name', 'फ़ोल्डर का नाम टाइप करें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1092, 'hn', 'save_folder', 'फोल्डर सेव करें', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1093, 'hn', 'folder_information', 'फ़ोल्डर जानकारी', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1094, 'hn', 'projects', 'परियोजनाओं', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1095, 'hn', 'all', 'सभी', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1096, 'hn', 'content', 'संतुष्ट', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1097, 'hn', 'folder_has_been_inserted_successfully', 'फ़ोल्डर सफलतापूर्वक डाला गया है', '2023-06-05 09:03:34', '2023-06-05 09:03:34', NULL),
(1098, 'hn', 'rename', 'नाम बदलें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1099, 'hn', 'prompts_configuration', 'कॉन्फ़िगरेशन का संकेत देता है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1100, 'hn', 'prompt_localizations', 'शीघ्र स्थानीयकरण', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1101, 'hn', 'prompt_key', 'शीघ्र कुंजी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1102, 'hn', 'prompt_updated_successfully', 'संकेत सफलतापूर्वक अपडेट किया गया', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1103, 'hn', 'select_status', 'स्थिति का चयन करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1104, 'hn', 'banned', 'प्रतिबंधित', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1105, 'hn', 'open_ai_settings', 'एआई सेटिंग्स खोलें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1106, 'hn', 'default_creativity_level', 'डिफ़ॉल्ट रचनात्मकता स्तर', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1107, 'hn', 'default_tone_of_output_result', 'आउटपुट परिणाम का डिफ़ॉल्ट स्वर', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1108, 'hn', 'default_number_of_results', 'परिणामों की डिफ़ॉल्ट संख्या', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1109, 'hn', 'default_max_result_length', 'डिफ़ॉल्ट अधिकतम परिणाम लंबाई', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1110, 'hn', 'insert_1_to_make_it_unlimited', 'इसे असीमित बनाने के लिए -1 डालें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1111, 'hn', 'open_ai_model', 'एआई मॉडल खोलें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1112, 'hn', 'default_ai_model', 'डिफ़ॉल्ट एआई मॉडल', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1113, 'hn', 'open_ai_secret_key', 'एआई गुप्त कुंजी खोलें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1114, 'hn', 'add_blog', 'ब्लॉग जोड़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1115, 'hn', 'hidden', 'छिपा हुआ', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1116, 'hn', 'category', 'वर्ग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1117, 'hn', 'add_new_blog', 'नया ब्लॉग जोड़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1118, 'hn', 'blog_title', 'ब्लॉग का शीर्षक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1119, 'hn', 'type_blog_title', 'ब्लॉग का शीर्षक टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1120, 'hn', 'select_a_category', 'एक श्रेणी चुनें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1121, 'hn', 'select_tags', 'टैग चुनें..', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1122, 'hn', 'youtube_video_link', 'यूट्यूब वीडियो लिंक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1123, 'hn', 'type_your_short_description', 'अपना संक्षिप्त विवरण टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1124, 'hn', 'description', 'विवरण', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1125, 'hn', 'images', 'इमेजिस', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1126, 'hn', 'thumbnail_image', 'थंबनेल छवि', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1127, 'hn', 'choose_blog_thumbnail', 'ब्लॉग थंबनेल चुनें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1128, 'hn', 'blog_details_image', 'ब्लॉग विवरण छवि', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1129, 'hn', 'choose_blog_details_image', 'ब्लॉग विवरण छवि चुनें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1130, 'hn', 'save_blog', 'ब्लॉग सहेजें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1131, 'hn', 'blog_information', 'ब्लॉग जानकारी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1132, 'hn', 'blog_images', 'ब्लॉग छवियां', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1133, 'hn', 'seo_meta_options', 'एसईओ मेटा विकल्प', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1134, 'hn', 'its_free', 'यह निःशुल्क है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1135, 'hn', 'ai_images', 'एआई छवियां', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1136, 'hn', 'ai_code', 'एआई कोड', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1137, 'hn', 'blog_categories', 'ब्लॉग श्रेणियाँ', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1138, 'hn', 'add_new_blog_category', 'नई ब्लॉग श्रेणी जोड़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1139, 'hn', 'category_name', 'श्रेणी नाम', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1140, 'hn', 'type_category_name', 'श्रेणी का नाम टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1141, 'hn', 'save_category', 'श्रेणी सहेजें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1142, 'hn', 'category_information', 'श्रेणी की जानकारी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1143, 'hn', 'all_categories', 'सब वर्ग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1144, 'hn', 'add_new_category', 'नई श्रेणी जोड़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1145, 'hn', 'category_has_been_inserted_successfully', 'श्रेणी सफलतापूर्वक सम्मिलित की गई है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1146, 'hn', 'add_new_tag', 'नया टैग जोड़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1147, 'hn', 'tag_name', 'टैग नाम', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1148, 'hn', 'type_tag_name', 'टैग नाम टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1149, 'hn', 'save_tag', 'टैग सहेजें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1150, 'hn', 'tag_information', 'टैग जानकारी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1151, 'hn', 'all_tags', 'सभी टैग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1152, 'hn', 'tag_has_been_inserted_successfully', 'टैग सफलतापूर्वक डाला गया है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1153, 'hn', 'tag_has_been_deleted_successfully', 'टैग सफलतापूर्वक हटा दिया गया है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1154, 'hn', 'blog_has_been_inserted_successfully', 'ब्लॉग सफलतापूर्वक डाला गया है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1155, 'hn', 'view', 'देखना', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1156, 'hn', 'our_blogs', 'हमारे ब्लॉग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1157, 'hn', 'read_our_blogs__latest_news', 'हमारे ब्लॉग और नवीनतम समाचार पढ़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1158, 'hn', 'blog_details', 'ब्लॉग विवरण', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1159, 'hn', 'update_blog', 'अपडेट ब्लॉग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1160, 'hn', 'blog_slug', 'ब्लॉग स्लग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1161, 'hn', 'type_blog_slug', 'ब्लॉग स्लग टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1162, 'hn', 'blog_has_been_updated_successfully', 'ब्लॉग को सफलतापूर्वक अपडेट कर दिया गया है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1163, 'hn', 'testimonials', 'प्रशंसापत्र', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1164, 'hn', 'what_customers_saying_about_us', 'ग्राहक हमारे बारे में क्या कह रहे हैं?', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1165, 'hn', 'get_connected_to_us_to_learn_more', 'अधिक जानने के लिए हमसे जुड़ें।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1166, 'hn', 'chat_with_us', 'हमारे साथ चैट करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1167, 'hn', 'get_connected_to_us_we_are_happy_to_hear_from_you', 'हमसे जुड़ें, हम आपसे सुनकर खुश हैं।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1168, 'hn', 'email_us', 'हमें ईमेल करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1169, 'hn', 'drop_us_an_email_and_youll_receive_a_reply_within_a_short_time', 'हमें एक ईमेल ड्रॉप करें और आपको थोड़े समय के भीतर उत्तर प्राप्त होगा।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1170, 'hn', 'give_us_a_call', 'हमें एक फोन कर देना', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1171, 'hn', 'give_us_a_call_our_experts_are_ready_to_talk_to_you', 'हमें एक फोन कर देना। हमारे विशेषज्ञ आपसे बात करने के लिए तैयार हैं।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1172, 'hn', 'talk_to_our_team', 'हमारी टीम से बात करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1173, 'hn', 'write_to_us_we_are_happy_to_assist_you_about_your_queries', 'हमें लिखें, हमें आपके प्रश्नों के बारे में आपकी सहायता करने में प्रसन्नता हो रही है।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1174, 'hn', 'your_name', 'अप का नाम', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1175, 'hn', 'you_email', 'आपका ईमेल', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1176, 'hn', 'you_phone', 'आप फोन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1177, 'hn', 'messages', 'संदेशों', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1178, 'hn', 'write_your_message', 'अपना संदेश लिखें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1179, 'hn', 'get_in_touch', 'संपर्क में रहो', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1180, 'hn', 'login__registration', 'लॉगिन और पंजीकरण', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1181, 'hn', 'customer_registration', 'ग्राहक पंजीकरण', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1182, 'hn', 'email_required', 'ईमेल (अनिवार्य', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1183, 'hn', 'email__phone_both_required', 'ईमेल और फोन दोनों आवश्यक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1184, 'hn', 'registration_verification', 'पंजीकरण सत्यापन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1185, 'hn', 'email_verification', 'ईमेल सत्यापन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1186, 'hn', 'otp_verification', 'ओटीपी सत्यापन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1187, 'hn', 'leftbar_title', 'लेफ्टबार शीर्षक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1188, 'hn', 'leftbar_colored_title', 'लेफ्टबार रंगीन शीर्षक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1189, 'hn', 'rightbar_title', 'राइटबार शीर्षक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1190, 'hn', 'rightbar_subtitle', 'राइटबार उपशीर्षक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1191, 'hn', 'google_recaptcha_v3', 'गूगल रिकैप्चा V3', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1192, 'hn', 'recaptcha_site_key', 'रिकैप्चा साइट कुंजी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1193, 'hn', 'recaptcha_secret_key', 'रिकैप्चा गुप्त कुंजी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1194, 'hn', 'enable_recaptcha', 'रिकैप्चा सक्षम करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1195, 'hn', 'google_recaptcha', 'गूगल रिकैप्चा', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1196, 'hn', 'about_what_is_your_blog_post', 'आपका ब्लॉग पोस्ट किस बारे में है?', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1197, 'hn', 'new_package', 'नया पैकेज', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1198, 'hn', 'create_new_package', 'नया पैकेज बनाएँ', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1199, 'hn', 'or', 'या', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1200, 'hn', 'copy_from_existing', 'मौजूदा से कॉपी करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1201, 'hn', 'monthly_packages', 'मासिक पैकेज', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1202, 'hn', 'yearly_packages', 'वार्षिक पैकेज', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1203, 'hn', 'lifetime_packages', 'लाइफटाइम पैकेज', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1204, 'hn', 'copy', 'प्रतिलिपि', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1205, 'hn', 'set_0_to_make_it_free', 'इसे निःशुल्क बनाने के लिए $0 सेट करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1206, 'hn', 'featured', 'प्रदर्शित', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1207, 'hn', 'staffs', 'कर्मचारी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1208, 'hn', 'new_employee', 'नया कर्मचारी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1209, 'hn', 'add_employee', 'कर्मचारी जोड़ें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1210, 'hn', 'role', 'भूमिका', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1211, 'hn', 'transcribe_your_speech_to_text_using_this_text_generator', 'इस टेक्स्ट जनरेटर का उपयोग करके अपने भाषण को टेक्स्ट में ट्रांसक्रिप्ट करें।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1212, 'hn', 'type_text_title', 'टेक्स्ट शीर्षक टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1213, 'hn', 'type_your_title', 'अपना शीर्षक टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1214, 'hn', 'upload_audio_file', 'ऑडियो फ़ाइल अपलोड करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1215, 'hn', 'allowed_file_types_', 'अनुमत फ़ाइल प्रकार:', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1216, 'hn', 'full_name', 'पूरा नाम', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1217, 'hn', 'type_full_name', 'पूरा नाम टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1218, 'hn', '880xxxxxxxxxx', '+880xxxxxxxxxxx', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1219, 'hn', 'already_have_an_account', 'क्या आपके पास पहले से एक खाता मौजूद है?', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1220, 'hn', 'registration_successful', 'सफल पंजीकरण।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1221, 'hn', 'used_out_of', 'से प्रयोग किया जाता है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1222, 'hn', 'histories', 'इतिहास', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1223, 'hn', 'applied_on_regirsation', 'पंजीकरण पर आवेदन किया', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1224, 'hn', 'this_template_not_included_in_your_subscription_plan', 'यह टेम्प्लेट आपकी सदस्यता योजना में शामिल नहीं है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1225, 'hn', 'used', 'इस्तेमाल किया गया', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1226, 'hn', 'remaining_images', 'शेष छवियां', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1227, 'hn', 'view_contents', 'सामग्री देखें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1228, 'hn', 'generate_images_from_any_of_your_text', 'अपने किसी भी पाठ से चित्र बनाएँ।', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1229, 'hn', 'type_image_title', 'इमेज का शीर्षक टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1230, 'hn', 'image_of_a_bird', 'एक पक्षी की छवि', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1231, 'hn', 'type_image_description', 'छवि विवरण टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1232, 'hn', 'a_bird_flying_over_the_sea', 'समुद्र के ऊपर उड़ता एक पक्षी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1233, 'hn', 'image_style', 'छवि शैली', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1234, 'hn', 'style_of_the_image_will_be_as_selected', 'छवि की शैली चयनित के रूप में होगी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1235, 'hn', 'none', 'कोई नहीं', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1236, 'hn', 'abstract', 'अमूर्त', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1237, 'hn', 'realstic', 'यथार्थवादी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1238, 'hn', 'cartoon', 'कार्टून', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1239, 'hn', 'digital_art', 'डिजिटल कला', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1240, 'hn', 'illustration', 'चित्रण', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1241, 'hn', 'photography', 'फोटोग्राफी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1242, 'hn', '3d_render', '3डी रेंडर', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1243, 'hn', 'pencil_drawing', 'पेंसिल ड्राइंग', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1244, 'hn', 'mood', 'मनोदशा', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1245, 'hn', 'mood_of_the_image_will_be_as_selected', 'छवि का मूड जैसा चुना जाएगा', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1246, 'hn', 'angry', 'गुस्सा', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1247, 'hn', 'agressive', 'आक्रामक', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1248, 'hn', 'calm', 'शांत', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1249, 'hn', 'cheerful', 'खुश', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1250, 'hn', 'chilling', 'द्रुतशीतन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1251, 'hn', 'dark', 'अँधेरा', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1252, 'hn', 'happy', 'खुश', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1253, 'hn', 'sad', 'उदास', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1254, 'hn', 'image_resolution', 'छवि वियोजन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1255, 'hn', 'select_image_resolution_size_that_you_need', 'छवि रिज़ॉल्यूशन आकार का चयन करें जिसकी आपको आवश्यकता है', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1256, 'hn', 'small_256x256', 'छोटा [256x256]', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1257, 'hn', 'medium_512x512', 'मध्यम [512x512]', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1258, 'hn', 'large_1024x1024', 'बड़ा [1024x1024]', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1259, 'hn', 'create_image', 'चित्र बनाएं', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1260, 'hn', 'type__hit_enter', 'टाइप करें और एंटर दबाएं', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1261, 'hn', 'created_at', 'पर बनाया गया', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1262, 'hn', 'resolation', 'संकल्प', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1263, 'hn', 'smtp_configuration', 'एसएमटीपी कॉन्फ़िगरेशन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1264, 'hn', 'sendmail', 'मेल भेजने', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1265, 'hn', 'smtp', 'एसएमटीपी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1266, 'hn', 'mail_host', 'मेल होस्ट', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1267, 'hn', 'type_mail_host', 'मेल होस्ट टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1268, 'hn', 'mail_port', 'मेल पोर्ट', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1269, 'hn', 'type_mail_port', 'मेल पोर्ट टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1270, 'hn', 'mail_username', 'मेल उपयोगकर्ता नाम', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1271, 'hn', 'type_mail_username', 'मेल उपयोगकर्ता नाम टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1272, 'hn', 'mail_password', 'मेल पासवर्ड', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1273, 'hn', 'type_mail_password', 'मेल पासवर्ड टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1274, 'hn', 'mail_encryption', 'मेल एन्क्रिप्शन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1275, 'hn', 'type_mail_encryption', 'मेल एन्क्रिप्शन टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1276, 'hn', 'mail_from_address', 'पते से मेल करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1277, 'hn', 'type_mail_from_address', 'पते से मेल टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1278, 'hn', 'mail_from_name', 'नाम से मेल', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1279, 'hn', 'type_mail_from_name', 'नाम से मेल टाइप करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1280, 'hn', 'configure_smtp', 'एसएमटीपी कॉन्फ़िगर करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1281, 'hn', 'smtp_information', 'एसएमटीपी सूचना', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1282, 'hn', 'twilio_credentials', 'ट्विलियो क्रेडेंशियल्स', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1283, 'hn', 'twilio_sid', 'ट्विलियो एसआईडी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1284, 'hn', 'twilio_auth_token', 'ट्विलियो ऑथ टोकन', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1285, 'hn', 'valid_twilo_number', 'मान्य ट्वाइलो नंबर', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1286, 'hn', 'active_sms_gateway', 'सक्रिय एसएमएस गेटवे', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1287, 'hn', 'select_sms_gateway', 'एसएमएस गेटवे का चयन करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1288, 'hn', 'twilio', 'टवीलियो', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1289, 'hn', 'payment_methods_settings', 'भुगतान के तरीके सेटिंग्स', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1290, 'hn', 'paypal_credentials', 'पेपैल क्रेडेंशियल्स', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1291, 'hn', 'paypal_client_id', 'पेपैल क्लाइंट आईडी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1292, 'hn', 'paypal_client_secret', 'पेपैल ग्राहक रहस्य', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1293, 'hn', 'enable_paypal', 'पेपैल सक्षम करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1294, 'hn', 'enable_test_sandbox_mode', 'टेस्ट सैंडबॉक्स मोड सक्षम करें', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1295, 'hn', 'stripe_credentials', 'स्ट्राइप क्रेडेंशियल्स', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1296, 'hn', 'stripe_key', 'धारीदार कुंजी', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1297, 'hn', 'stripe_secret', 'धारी रहस्य', '2023-06-05 09:04:01', '2023-06-05 09:04:01', NULL),
(1298, 'hn', 'enable_stripe', 'स्ट्राइप को सक्षम करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1299, 'hn', 'paytm_credentials', 'पेटीएम क्रेडेंशियल्स', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1300, 'hn', 'paytm_environment', 'पेटीएम पर्यावरण', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1301, 'hn', 'paytm_merchant_id', 'पेटीएम मर्चेंट आईडी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1302, 'hn', 'paytm_merchant_key', 'पेटीएम मर्चेंट कुंजी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1303, 'hn', 'paytm_merchant_website', 'पेटीएम मर्चेंट वेबसाइट', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1304, 'hn', 'paytm_channel', 'पेटीएम चैनल', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1305, 'hn', 'paytm_industry_type', 'पेटीएम उद्योग प्रकार', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1306, 'hn', 'enable_paytm', 'पेटीएम को सक्षम करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1307, 'hn', 'razorpay_credentials', 'रेज़रपे क्रेडेंशियल्स', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1308, 'hn', 'razorpay_key', 'रेज़रपे कुंजी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1309, 'hn', 'razorpay_secret', 'रेजरपे सीक्रेट', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1310, 'hn', 'enable_razorpay', 'रेजरपे को सक्षम करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1311, 'hn', 'iyzico_credentials', 'इज़िको क्रेडेंशियल्स', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1312, 'hn', 'iyzico_api_key', 'इज़िको एपीआई कुंजी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1313, 'hn', 'iyzico_secret_key', 'इज़िको गुप्त कुंजी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1314, 'hn', 'enable_iyzico', 'इज़िको को सक्षम करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1315, 'hn', 'payment_settings_updated_successfully', 'भुगतान सेटिंग सफलतापूर्वक अपडेट की गईं', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1316, 'hn', 'paypal', 'Paypal', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1317, 'hn', 'stripe', 'पट्टी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1318, 'hn', 'paytm', 'Paytm', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1319, 'hn', 'razorpay', 'रेजरपे', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1320, 'hn', 'iyzico', 'इज़िको', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1321, 'hn', 'subscription_package_updated_successfully', 'सदस्यता पैकेज सफलतापूर्वक अपडेट किया गया', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1322, 'hn', 'renew_package', 'पैकेज का नवीनीकरण करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1323, 'hn', 'roles', 'भूमिकाएँ', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1324, 'hn', 'add_role', 'भूमिका जोड़ें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1325, 'hn', 'na', 'लागू नहीं', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1326, 'hn', 'write_a_complete_article_on_this_topic', 'इस विषय पर एक पूरा लेख लिखें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1327, 'hn', 'your_message_has_been_sent', 'आपका संदेश भेज दिया गया है', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1328, 'hn', 'new', 'नया', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1329, 'hn', 'new_contact_message', 'नया संपर्क संदेश', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1330, 'hn', 'blog_tags', 'ब्लॉग टैग', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1331, 'hn', 'write_blog_tags_about', 'के बारे में ब्लॉग टैग लिखें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1332, 'hn', 'remaining_words', 'शेष शब्द', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1333, 'hn', 'blog_ideas', 'ब्लॉग विचार', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1334, 'hn', 'write_interesting_blog_ideas_and_outline_about', 'दिलचस्प ब्लॉग विचार लिखें और इसके बारे में रूपरेखा तैयार करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1335, 'hn', 'output_result_should_sound_like', 'आउटपुट परिणाम इस तरह लगना चाहिए', '2023-06-05 09:04:24', '2023-06-05 09:20:00', NULL),
(1336, 'hn', 'project_details', 'परियोजना विवरण', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1337, 'hn', 'project_information', 'परियोजना की जानकारी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1338, 'hn', 'generate_10_appropriate_blog_titles_for', 'के लिए 10 उपयुक्त ब्लॉग शीर्षक उत्पन्न करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1339, 'hn', 'social_media_bio', 'सोशल मीडिया बायो', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1340, 'hn', 'eg_entrepreneur_writer_photographer', 'उदाहरण के लिए उद्यमी, लेखक, फोटोग्राफर', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1341, 'hn', 'write_bio_for_social_media_using_following_keywords', 'निम्नलिखित कीवर्ड्स का प्रयोग करते हुए सोशल मीडिया के लिए बायो लिखें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1342, 'hn', 'download_image', 'छवि डाउनलोड करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1343, 'hn', 'max_size_', 'अधिकतम आकार:', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1344, 'hn', 'write_code_using_this_code_generator_in_any_programming_language', 'इस कोड जनरेटर का उपयोग करके किसी भी प्रोग्रामिंग भाषा में कोड लिखें।', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1345, 'hn', 'type_title', 'शीर्षक टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1346, 'hn', 'type_code_title', 'कोड शीर्षक टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1347, 'hn', 'type_description', 'विवरण टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1348, 'hn', 'generate_a_javascript_function_to_add_2_numbers_and_return_their_sum', '2 नंबर जोड़ने और उनका योग वापस करने के लिए एक जावास्क्रिप्ट फ़ंक्शन उत्पन्न करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1349, 'hn', 'social_login_configurations', 'सामाजिक लॉगिन कॉन्फ़िगरेशन', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1350, 'hn', 'google_login', 'गूगल लॉगिन', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1351, 'hn', 'google_client_id', 'Google क्लाइंट आईडी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1352, 'hn', 'google_client_secret', 'Google क्लाइंट रहस्य', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1353, 'hn', 'facebook_login', 'फेसबुक लॉग इन', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1354, 'hn', 'facebook_app_id', 'फेसबुक ऐप आईडी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1355, 'hn', 'facebook_app_secret', 'फेसबुक ऐप सीक्रेट', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1356, 'hn', 'faccebook_login', 'फेसबुक लॉगिन', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1357, 'hn', 'connect_with_google', 'गूगल से जुड़ें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1358, 'hn', 'connect_with_facebook', 'फेसबुक से कनेक्ट करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1359, 'hn', 'or_continue_with', 'या साथ जारी रखें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1360, 'hn', 'faqs', 'पूछे जाने वाले प्रश्न', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1361, 'hn', 'question', 'सवाल', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1362, 'hn', 'answer', 'उत्तर', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1363, 'hn', 'add_new_faq', 'नया एफएक्यू जोड़ें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1364, 'hn', 'type_question', 'प्रश्न टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1365, 'hn', 'type_answer', 'जवाब टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1366, 'hn', 'save_faq', 'अक्सर पूछे जाने वाले प्रश्न सहेजें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1367, 'hn', 'faq_information', 'सामान्य प्रश्न सूचना', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1368, 'hn', 'faq_has_been_added_successfully', 'अक्सर पूछे जाने वाले प्रश्न सफलतापूर्वक जोड़े गए हैं', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1369, 'hn', 'affiliate_system', 'संबद्ध प्रणाली', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1370, 'hn', 'configurations', 'विन्यास', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1371, 'hn', 'code_has_been_copied_successfully', 'कोड सफलतापूर्वक कॉपी कर लिया गया है', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1372, 'hn', 'affiliate_configurations', 'संबद्ध विन्यास', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1373, 'hn', 'affiliate_commission_', 'संबद्ध आयोग %', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1374, 'hn', 'type_affiliate_commission_', 'एफिलिएट कमीशन % टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1375, 'hn', 'minimum_withdrawal_amount', 'न्यूनतम निकासी राशि', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1376, 'hn', 'type_minimum_withdrawal_amount', 'न्यूनतम निकासी राशि टाइप करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1377, 'hn', 'allow_commission_continuously', 'आयोग को लगातार अनुमति दें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1378, 'hn', 'if_enabled_user_will_get_commission_for_each_subscriptions_of_referred_user_otherwise_only_for_the_first_subscription', 'सक्षम होने पर, संदर्भित उपयोगकर्ता की प्रत्येक सदस्यता के लिए उपयोगकर्ता को कमीशन मिलेगा। अन्यथा केवल पहली सदस्यता के लिए।', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1379, 'hn', 'payout_payment_methods', 'भुगतान भुगतान के तरीके', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1380, 'hn', 'select_payout_payment_methods', 'पेआउट भुगतान विधियों का चयन करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1381, 'hn', 'bank_payment', 'बैंक भुगतान', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1382, 'hn', 'enable_affiliate_system', 'संबद्ध प्रणाली को सक्षम करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1383, 'hn', 'configure_affiliate_settings', 'संबद्ध सेटिंग्स कॉन्फ़िगर करें', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1384, 'hn', 'withdraw_requests', 'अनुरोध वापस लेना', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1385, 'hn', 'earning_histories', 'कमाई का इतिहास', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1386, 'hn', 'payment_histories', 'भुगतान इतिहास', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1387, 'hn', 'affiliate_withdraw_requests', 'संबद्ध निकासी अनुरोध', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1388, 'hn', 'date', 'तारीख', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1389, 'hn', 'amount', 'मात्रा', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1390, 'hn', 'status', 'दर्जा', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1391, 'hn', 'additional_info', 'अतिरिक्त जानकारी', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1392, 'hn', 'remarks', 'टिप्पणियां', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1393, 'hn', 'language_has_been_inserted_successfully', 'भाषा सफलतापूर्वक डाली गई है', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1394, 'hn', 'localizations_have_been_updated', 'स्थानीयकरण अपडेट किए गए हैं', '2023-06-05 09:04:24', '2023-06-05 09:04:24', NULL),
(1395, 'hn', 'write_an_interesting_blog_post_intro_about', 'के बारे में एक दिलचस्प ब्लॉग पोस्ट परिचय लिखें', '2023-06-05 09:04:37', '2023-06-05 09:08:00', NULL),
(1396, 'hn', 'use_following_keywords_in_the_article', 'लेख में निम्नलिखित कीवर्ड का प्रयोग करें', '2023-06-05 09:04:40', '2023-06-05 09:07:46', NULL),
(1397, 'hn', 'blog_post_title', 'ब्लॉग पोस्ट का शीर्षक', '2023-06-05 09:04:47', '2023-06-05 09:08:13', NULL),
(1398, 'hn', 'write_an_interesting_blog_conclusion_about', 'के बारे में एक दिलचस्प ब्लॉग निष्कर्ष लिखें', '2023-06-05 09:04:49', '2023-06-05 09:09:51', NULL),
(1399, 'hn', 'write_blog_summary_about', 'के बारे में ब्लॉग सारांश लिखें', '2023-06-05 09:04:54', '2023-06-05 09:10:05', NULL),
(1400, 'hn', 'write_a_testimonial_email_about', 'इसके बारे में एक प्रशंसापत्र ईमेल लिखें', '2023-06-05 09:04:56', '2023-06-05 09:11:03', NULL),
(1401, 'en', 'payout_configuration', 'Payout Configuration', '2023-06-05 09:06:46', '2023-06-05 09:06:46', NULL),
(1402, 'en', 'your_code_will_appear_here', 'Your code will appear here', '2023-06-05 09:07:36', '2023-06-05 09:07:36', NULL),
(1403, 'en', 'copy_code', 'Copy Code', '2023-06-05 09:07:36', '2023-06-05 09:07:36', NULL),
(1404, 'en', 'disabled_in_demo', 'Disabled in demo', '2023-06-05 09:09:21', '2023-06-05 09:09:21', NULL),
(1405, 'en', 'resolution', 'Resolution', '2023-06-05 09:09:22', '2023-06-05 09:09:22', NULL),
(1406, 'hn', 'write_a_confirmation_email_about', 'के बारे में एक पुष्टिकरण ईमेल लिखें', '2023-06-05 09:10:11', '2023-06-05 09:10:19', NULL),
(1407, 'hn', 'write_a_discount_email_about', 'इसके बारे में एक छूट ईमेल लिखें', '2023-06-05 09:10:31', '2023-06-05 09:10:54', NULL),
(1408, 'hn', 'write_a_promotional_email_about', 'इसके बारे में एक प्रचार ईमेल लिखें', '2023-06-05 09:11:07', '2023-06-05 09:11:11', NULL),
(1409, 'hn', 'write_a_follow_up_email_about', 'इसके बारे में एक अनुवर्ती ईमेल लिखें', '2023-06-05 09:11:18', '2023-06-05 09:11:22', NULL),
(1410, 'hn', 'write_a_catchy_promotional_article_to_give_discount_about', 'के बारे में छूट देने के लिए एक आकर्षक प्रचार लेख लिखें', '2023-06-05 09:11:30', '2023-06-05 09:11:35', NULL),
(1411, 'hn', 'title_of_the_promotion_is', 'प्रचार का शीर्षक है', '2023-06-05 09:11:38', '2023-06-05 09:11:43', NULL),
(1412, 'hn', 'write_a_facebook_ads_description_that_makes_your_ad_stand_out_and_generates_leads_target_audience', 'एक फेसबुक विज्ञापन विवरण लिखें जो आपके विज्ञापन को सबसे अलग बनाता है और लीड उत्पन्न करता है। लक्षित दर्शक', '2023-06-05 09:11:50', '2023-06-05 09:11:55', NULL),
(1413, 'hn', 'product_name', 'प्रोडक्ट का नाम', '2023-06-05 09:11:58', '2023-06-05 09:12:02', NULL),
(1414, 'hn', 'product_description', 'उत्पाद वर्णन', '2023-06-05 09:12:05', '2023-06-05 09:12:12', NULL),
(1415, 'hn', 'grab_attention_with_catchy_captions_for_this_instagram_post', 'इस Instagram पोस्ट के आकर्षक कैप्शन के साथ ध्यान आकर्षित करें', '2023-06-05 09:12:15', '2023-06-05 09:12:22', NULL),
(1416, 'hn', 'write_a_complete_social_media_post_about', 'इसके बारे में पूरी सोशल मीडिया पोस्ट लिखें', '2023-06-05 09:12:26', '2023-06-05 09:12:30', NULL),
(1417, 'hn', 'write_a_catchy_promotional_article_for_this_event_about', 'इस घटना के बारे में एक आकर्षक प्रचार लेख लिखें', '2023-06-05 09:12:34', '2023-06-05 09:12:39', NULL),
(1418, 'hn', 'event_title', 'कार्यक्रम का शीर्षक', '2023-06-05 09:12:46', '2023-06-05 09:12:50', NULL),
(1419, 'hn', 'write_catchy_30character_headlines_to_promote_your_product_with_google_ads_target_audience', 'Google Ads के साथ अपने उत्पाद का प्रचार करने के लिए आकर्षक 30-वर्णों की सुर्खियाँ लिखें। लक्षित दर्शक', '2023-06-05 09:12:54', '2023-06-05 09:13:00', NULL),
(1420, 'hn', 'write_a_google_ads_description_that_makes_your_ad_stand_out_and_generates_leads_target_audience', 'एक Google विज्ञापन विवरण लिखें जो आपके विज्ञापन को सबसे अलग बनाता है और लीड उत्पन्न करता है। लक्षित दर्शक', '2023-06-05 09:13:05', '2023-06-05 09:13:09', NULL),
(1421, 'hn', 'write_compelling_youtube_video_title_for_the_provided_video_description_to_get_people_interested_in_watching', 'लोगों को देखने में रुचि लेने के लिए प्रदान किए गए वीडियो विवरण के लिए आकर्षक YouTube वीडियो शीर्षक लिखें', '2023-06-05 09:13:11', '2023-06-05 09:13:16', NULL),
(1422, 'hn', 'generate_seooptimized_youtube_tags_and_keywords_for', 'इसके लिए SEO-अनुकूलित YouTube टैग और कीवर्ड जेनरेट करें', '2023-06-05 09:13:20', '2023-06-05 09:13:24', NULL);
INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1423, 'hn', 'generate_list_of_10_frequently_asked_questions_based_on_description', 'विवरण के आधार पर अक्सर पूछे जाने वाले 10 प्रश्नों की सूची तैयार करें', '2023-06-05 09:13:27', '2023-06-05 09:13:33', NULL),
(1424, 'hn', 'write_answer_for_this_faq_question', 'इस अक्सर पूछे जाने वाले प्रश्न का उत्तर लिखें', '2023-06-05 09:13:34', '2023-06-05 09:13:40', NULL),
(1425, 'hn', 'write_review_to_submit_on_a_website_based_on_description', 'विवरण के आधार पर वेबसाइट पर सबमिट करने के लिए समीक्षा लिखें', '2023-06-05 09:13:42', '2023-06-05 09:13:48', NULL),
(1426, 'hn', 'write_title_for_a_website_based_on_description', 'विवरण के आधार पर वेबसाइट के लिए शीर्षक लिखें', '2023-06-05 09:13:51', '2023-06-05 09:13:57', NULL),
(1427, 'en', 'instragram_hashtag', 'Instragram Hashtag', '2023-06-05 09:14:00', '2023-06-05 09:14:00', NULL),
(1428, 'en', 'about_what_is_the_story', 'About what is the story?', '2023-06-05 09:14:00', '2023-06-05 09:14:00', NULL),
(1429, 'en', 'type_description_of_the_story', 'Type description of the story', '2023-06-05 09:14:00', '2023-06-05 09:14:00', NULL),
(1430, 'hn', 'write_meta_tags_for_a_website_based_on_description', 'विवरण के आधार पर वेबसाइट के लिए मेटा टैग लिखें', '2023-06-05 09:14:00', '2023-06-05 09:14:04', NULL),
(1431, 'hn', 'write_seo_friendly_meta_description_for_a_website_based_on_description', 'डिस्क्रिप्शन के आधार पर वेबसाइट के लिए SEO फ्रेंडली मेटा डिस्क्रिप्शन लिखें', '2023-06-05 09:14:08', '2023-06-05 09:14:14', NULL),
(1432, 'hn', 'generate_about_us_content_for_a_website_based_on_description', 'विवरण के आधार पर वेबसाइट के लिए हमारे बारे में सामग्री तैयार करें', '2023-06-05 09:14:17', '2023-06-05 09:14:23', NULL),
(1433, 'hn', 'write_paragraph_on_this_topic', 'इस विषय पर अनुच्छेद लिखिए', '2023-06-05 09:14:32', '2023-06-05 09:14:39', NULL),
(1434, 'hn', 'rewrite_this_content', 'इस सामग्री को फिर से लिखें', '2023-06-05 09:14:45', '2023-06-05 09:14:52', NULL),
(1435, 'hn', 'focus_on_the_following_keywords_while_generating_the_content', 'सामग्री तैयार करते समय निम्नलिखित खोजशब्दों पर ध्यान दें', '2023-06-05 09:14:54', '2023-06-05 09:15:00', NULL),
(1436, 'hn', 'write_a_long_creative_product_description_for', 'इसके लिए एक लंबा रचनात्मक उत्पाद विवरण लिखें', '2023-06-05 09:15:04', '2023-06-05 09:15:11', NULL),
(1437, 'hn', 'create_creative_product_names_based_on_the_description', 'विवरण के आधार पर रचनात्मक उत्पाद नाम बनाएँ', '2023-06-05 09:15:14', '2023-06-05 09:15:21', NULL),
(1438, 'hn', 'summarize_this_text_in_a_short_concise_way', 'इस पाठ को संक्षेप में संक्षेप में प्रस्तुत करें', '2023-06-05 09:15:23', '2023-06-05 09:15:28', NULL),
(1439, 'hn', 'check_and_correct_grammar_of_this_text', 'इस पाठ के व्याकरण की जाँच करें और सही करें', '2023-06-05 09:15:32', '2023-06-05 09:15:36', NULL),
(1440, 'hn', 'generate_an_interesting_creative_story_based_on_the_description', 'विवरण के आधार पर एक दिलचस्प रचनात्मक कहानी बनाएँ', '2023-06-05 09:15:40', '2023-06-05 09:15:46', NULL),
(1441, 'hn', 'generate_start_up_names_based_on_the_description', 'विवरण के आधार पर स्टार्ट अप नाम उत्पन्न करें', '2023-06-05 09:15:48', '2023-06-05 09:15:54', NULL),
(1442, 'hn', 'write_pros_and_cons_of_the_topic', 'विषय के पेशेवरों और विपक्षों को लिखें', '2023-06-05 09:15:57', '2023-06-05 09:16:03', NULL),
(1443, 'hn', 'write_job_description_based_on_the_requirements', 'आवश्यकताओं के आधार पर नौकरी विवरण लिखें', '2023-06-05 09:16:07', '2023-06-05 09:16:12', NULL),
(1444, 'hn', 'job_position', 'काम की स्थिति', '2023-06-05 09:16:14', '2023-06-05 09:16:18', NULL),
(1445, 'hn', 'write_a_rejection_letter_about', 'इसके बारे में एक अस्वीकृति पत्र लिखें', '2023-06-05 09:16:21', '2023-06-05 09:16:26', NULL),
(1446, 'hn', 'recipient_name', 'प्राप्तकर्ता का नाम', '2023-06-05 09:16:29', '2023-06-05 09:16:35', NULL),
(1447, 'hn', 'write_an_offer_letter_about', 'के बारे में एक प्रस्ताव पत्र लिखें', '2023-06-05 09:16:39', '2023-06-05 09:16:43', NULL),
(1448, 'hn', 'write_a_promotion_letter', 'एक पदोन्नति पत्र लिखें.', '2023-06-05 09:16:47', '2023-06-05 09:16:55', NULL),
(1449, 'hn', 'previous_position', 'पुरानी स्थिति', '2023-06-05 09:16:59', '2023-06-05 09:17:03', NULL),
(1450, 'hn', 'new_position', 'नई स्थिति', '2023-06-05 09:17:05', '2023-06-05 09:17:11', NULL),
(1451, 'hn', 'write_inspiring_motivational_quotes_to_overcome_the_given_situations', 'दी गई परिस्थितियों से उबरने के लिए प्रेरक प्रेरक उद्धरण लिखें', '2023-06-05 09:17:15', '2023-06-05 09:17:20', NULL),
(1452, 'hn', 'write_full_song_lyrics_of', 'के पूरे गाने के बोल लिखें', '2023-06-05 09:17:22', '2023-06-05 09:17:26', NULL),
(1453, 'hn', 'write_a_creative_short_story_based_on_the_description', 'विवरण के आधार पर एक रचनात्मक लघु कहानी लिखें', '2023-06-05 09:17:29', '2023-06-05 09:17:35', NULL),
(1454, 'hn', 'write_lovely_wedding_quotes_based_on_the_keywords', 'कीवर्ड्स के आधार पर सुंदर विवाह उद्धरण लिखें', '2023-06-05 09:17:39', '2023-06-05 09:17:45', NULL),
(1455, 'hn', 'write_birthday_wish_quotes_based_on_the_keywords', 'कीवर्ड्स के आधार पर बर्थडे विश कोट्स लिखें', '2023-06-05 09:17:48', '2023-06-05 09:17:52', NULL),
(1456, 'hn', 'write_the_outline_of_the_story_for_mediumcom_based_on_the_description', 'विवरण के आधार पर माध्यम.कॉम के लिए कहानी की रूपरेखा लिखें', '2023-06-05 09:17:54', '2023-06-05 09:18:00', NULL),
(1457, 'en', 'bad_words', 'Bad Words', '2023-06-05 09:18:02', '2023-06-05 09:18:02', NULL),
(1458, 'en', 'these_words_will_be_filtered_from_user_inputs_while_generating_contents', 'These words will be filtered from user inputs while generating contents', '2023-06-05 09:18:02', '2023-06-05 09:18:02', NULL),
(1459, 'hn', 'write_the_title__subtitle_of_the_story_for_mediumcom_based_on_the_description', 'विवरण के आधार पर माध्यम.कॉम के लिए कहानी का शीर्षक और उपशीर्षक लिखें', '2023-06-05 09:18:03', '2023-06-05 09:18:09', NULL),
(1460, 'hn', 'write_interesting_story_ideas_for_mediumcom_based_on_the_keywords', 'मध्यम.कॉम के लिए खोजशब्दों के आधार पर दिलचस्प कहानी विचार लिखें', '2023-06-05 09:18:12', '2023-06-05 09:18:17', NULL),
(1461, 'hn', 'write_interesting_tiktok_video_script_based_on_the_keywords', 'कीवर्ड्स के आधार पर रोचक टिकटॉक वीडियो स्क्रिप्ट लिखें', '2023-06-05 09:18:20', '2023-06-05 09:18:25', NULL),
(1462, 'hn', 'write_interesting_video_ideas_based_on_the_keywords', 'कीवर्ड्स के आधार पर दिलचस्प वीडियो विचार लिखें', '2023-06-05 09:18:27', '2023-06-05 09:18:31', NULL),
(1463, 'hn', 'write_interesting_instagram_story_ideas_based_on_the_description', 'विवरण के आधार पर दिलचस्प इंस्टाग्राम कहानी विचार लिखें', '2023-06-05 09:18:42', '2023-06-05 09:18:47', NULL),
(1464, 'hn', 'write_interesting_instagram_post_ideas_based_on_the_description', 'विवरण के आधार पर दिलचस्प इंस्टाग्राम पोस्ट विचार लिखें', '2023-06-05 09:18:50', '2023-06-05 09:18:55', NULL),
(1465, 'hn', 'write_interesting_instagram_reel_ideas_based_on_the_description', 'विवरण के आधार पर दिलचस्प इंस्टाग्राम रील विचार लिखें', '2023-06-05 09:18:59', '2023-06-05 09:19:04', NULL),
(1466, 'en', 'write_job_description_based_on_the_requirements', 'Write job description based on the requirements', '2023-06-05 09:19:05', '2023-06-05 09:19:05', NULL),
(1467, 'hn', 'generate_hashtags_for_instagram_based_on_the_description', 'विवरण के आधार पर इंस्टाग्राम के लिए हैशटैग बनाएं', '2023-06-05 09:19:07', '2023-06-05 09:19:11', NULL),
(1468, 'hn', 'write_success_story_of_career_based_on_the_description', 'विवरण के आधार पर करियर की सफलता की कहानी लिखें', '2023-06-05 09:19:14', '2023-06-05 09:19:21', NULL),
(1469, 'hn', 'write_success_story_of_business_based_on_the_description', 'विवरण के आधार पर व्यवसाय की सफलता की कहानी लिखें', '2023-06-05 09:19:24', '2023-06-05 09:19:30', NULL),
(1470, 'en', 'issue', 'Issue', '2023-06-05 09:19:30', '2023-06-05 09:19:30', NULL),
(1471, 'en', 'message', 'Message', '2023-06-05 09:19:30', '2023-06-05 09:19:30', NULL),
(1472, 'en', 'mark_as_read', 'Mark As Read', '2023-06-05 09:19:30', '2023-06-05 09:19:30', NULL),
(1473, 'en', 'reply_in_email', 'Reply in Email', '2023-06-05 09:19:30', '2023-06-05 09:19:30', NULL),
(1474, 'hn', 'write_success_story_of_start_up_based_on_the_description', 'विवरण के आधार पर स्टार्ट अप की सफलता की कहानी लिखें', '2023-06-05 09:19:33', '2023-06-05 09:19:37', NULL),
(1475, 'hn', 'write_success_story_for_matrimonial_website_based_on_the_description', 'विवरण के आधार पर वैवाहिक वेबसाइट की सफलता की कहानी लिखें', '2023-06-05 09:19:39', '2023-06-05 09:19:45', NULL),
(1476, 'hn', 'partners_name', 'साथी का नाम', '2023-06-05 09:19:48', '2023-06-05 09:19:53', NULL),
(1477, 'en', 'matrimonial_website', 'Matrimonial Website', '2023-06-05 09:20:31', '2023-06-05 09:20:31', NULL),
(1478, 'en', 'what_are_partners_name', 'What are partners name?', '2023-06-05 09:20:31', '2023-06-05 09:20:31', NULL),
(1479, 'en', 'eg_bride_tanu_bridegroom_manu', 'e.g. Bride: Tanu, Bridegroom: Manu', '2023-06-05 09:20:31', '2023-06-05 09:20:31', NULL),
(1480, 'en', 'description_of_their_journey', 'Description of their journey', '2023-06-05 09:20:31', '2023-06-05 09:20:31', NULL),
(1481, 'en', 'write_success_story_for_matrimonial_website_based_on_the_description', 'Write success story for matrimonial website based on the description', '2023-06-05 09:21:14', '2023-06-05 09:21:14', NULL),
(1482, 'en', 'partners_name', 'Partners name', '2023-06-05 09:21:14', '2023-06-05 09:21:14', NULL),
(1483, 'en', 'affiliate_earnings', 'Affiliate Earnings', '2023-06-05 09:21:42', '2023-06-05 09:21:42', NULL),
(1484, 'en', 'referred_by', 'Referred By', '2023-06-05 09:21:43', '2023-06-05 09:21:43', NULL),
(1485, 'en', 'earning', 'Earning', '2023-06-05 09:21:43', '2023-06-05 09:21:43', NULL),
(1486, 'en', 'affiliate_payment_histories', 'Affiliate Payment Histories', '2023-06-05 09:21:45', '2023-06-05 09:21:45', NULL),
(1487, 'en', 'motivational_quote', 'Motivational Quote', '2023-06-05 09:36:04', '2023-06-05 09:36:04', NULL),
(1488, 'en', 'about_what_you_want_to_generate_motivational_quote', 'About what you want to generate motivational quote?', '2023-06-05 09:36:04', '2023-06-05 09:36:04', NULL),
(1489, 'en', 'eg_emotional_breakdown_economical_breakdown_career_issue', 'e.g. Emotional breakdown, economical breakdown, career issue', '2023-06-05 09:36:04', '2023-06-05 09:36:04', NULL),
(1490, 'en', 'write_inspiring_motivational_quotes_to_overcome_the_given_situations', 'Write inspiring motivational quotes to overcome the given situations', '2023-06-05 09:36:33', '2023-06-05 09:36:33', NULL),
(1491, 'en', 'song_lyrics', 'Song Lyrics', '2023-06-05 10:03:15', '2023-06-05 10:03:15', NULL),
(1492, 'en', 'title_of_the_song_and_name_of_the_singerwriter', 'Title of the song and name of the singer/writer', '2023-06-05 10:03:15', '2023-06-05 10:03:15', NULL),
(1493, 'en', 'eg_500_miles_by_hedy_west', 'e.g. 500 miles by Hedy West', '2023-06-05 10:03:15', '2023-06-05 10:03:15', NULL),
(1494, 'en', 'write_full_song_lyrics_of', 'Write full song lyrics of', '2023-06-05 10:03:57', '2023-06-05 10:03:57', NULL),
(1495, 'en', 'blog_conclusion', 'Blog Conclusion', '2023-06-05 10:05:41', '2023-06-05 10:05:41', NULL),
(1496, 'en', '', '', '2023-06-05 10:05:41', '2023-06-05 10:05:41', NULL),
(1497, 'en', 'write_an_interesting_blog_conclusion_about', 'Write an interesting blog conclusion about', '2023-06-05 10:06:24', '2023-06-05 10:06:24', NULL),
(1498, 'en', 'blog_post_title', 'Blog post title', '2023-06-05 10:06:24', '2023-06-05 10:06:24', NULL),
(1499, 'en', 'tiktok_video_script', 'TikTok Video Script', '2023-06-05 10:12:07', '2023-06-05 10:12:07', NULL),
(1500, 'en', 'what_are_the_key_points', 'What are the key points?', '2023-06-05 10:12:07', '2023-06-05 10:12:07', NULL),
(1501, 'en', 'eg_fun_prank_popular_tune', 'e.g. Fun, prank, popular tune', '2023-06-05 10:12:07', '2023-06-05 10:12:07', NULL),
(1502, 'en', 'write_interesting_tiktok_video_script_based_on_the_keywords', 'Write interesting tiktok video script based on the keywords', '2023-06-05 10:12:22', '2023-06-05 10:12:22', NULL),
(1503, 'en', 'image_has_been_deleted_successfully', 'Image has been deleted successfully', '2023-06-05 10:20:07', '2023-06-05 10:20:07', NULL),
(1504, 'en', 'blog_summary', 'Blog Summary', '2023-06-05 10:26:15', '2023-06-05 10:26:15', NULL),
(1505, 'en', 'write_blog_summary_about', 'Write blog summary about', '2023-06-05 10:26:56', '2023-06-05 10:26:56', NULL),
(1506, 'en', 'folder', 'Folder', '2023-06-05 10:27:31', '2023-06-05 10:27:31', NULL),
(1507, 'en', 'tiktok_video_caption', 'TikTok Video Caption', '2023-06-05 10:28:43', '2023-06-05 10:28:43', NULL),
(1508, 'en', 'about_what_is_the_video', 'About what is the video?', '2023-06-05 10:28:43', '2023-06-05 10:28:43', NULL),
(1509, 'en', 'type_description_of_the_video', 'Type description of the video', '2023-06-05 10:28:43', '2023-06-05 10:28:43', NULL),
(1510, 'en', 'affiliate_program', 'Affiliate Program', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1511, 'en', 'affiliate', 'Affiliate', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1512, 'en', 'withdraw_balance', 'Withdraw Balance', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1513, 'en', 'available_balance', 'Available Balance', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1514, 'en', 'total_subscriptions', 'Total Subscriptions', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1515, 'en', 'total_clicks', 'Total Clicks', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1516, 'en', 'referral_signups', 'Referral Signups', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1517, 'en', 'how_to_use_referral_program', 'How to use Referral Program', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1518, 'en', 'our_affiliate_program_commission_rate_for_subscriptions_is', 'Our affiliate program commission rate for subscriptions is', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1519, 'en', '1_copy_referral_link', '1. Copy referral link', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1520, 'en', '2_share_with_your_friends__others', '2. Share with your friends & others', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1521, 'en', '3_make_money_on_their_subscriptions', '3. Make money on their subscriptions', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1522, 'en', 'your_referral_link', 'Your Referral Link', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1523, 'en', 'invite_your_friends__others_and_earn_commissions_from_their_subscriptions', 'Invite your friends & others and earn commissions from their subscriptions', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1524, 'en', 'copied', 'Copied', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1525, 'en', 'copy_link', 'Copy Link', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1526, 'en', 'recent_affiliate_earnings', 'Recent Affiliate Earnings', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1527, 'en', 'withdraw_money', 'Withdraw Money', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1528, 'en', 'withdrawal_amount', 'Withdrawal Amount', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1529, 'en', 'type_amount', 'Type amount', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1530, 'en', 'minimum_withdrawal_amount_', 'Minimum Withdrawal Amount: ', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1531, 'en', 'payout_account', 'Payout Account', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1532, 'en', 'select_payout_account', 'Select Payout Account', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1533, 'en', 'type_additional_info', 'Type additional info', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1534, 'en', 'submit_request', 'Submit Request', '2023-06-05 10:35:47', '2023-06-05 10:35:47', NULL),
(1535, 'en', 'youtube_video_description', 'Youtube Video Description', '2023-06-05 10:50:33', '2023-06-05 10:50:33', NULL),
(1536, 'en', 'write_compelling_youtube_description_for_the_provided_video_description_to_get_people_interested_in_watching', 'Write compelling YouTube description for the provided video description to get people interested in watching', '2023-06-05 10:50:51', '2023-06-05 10:50:51', NULL),
(1537, 'en', 'added_to_favorite_templates', 'Added to favorite templates', '2023-06-05 10:54:18', '2023-06-05 10:54:18', NULL),
(1538, 'en', 'removed_from_favorite_templates', 'Removed from favorite templates', '2023-06-05 10:54:43', '2023-06-05 10:54:43', NULL),
(1539, 'en', 'remaining_speech_to_text', 'Remaining Speech to Text', '2023-06-05 10:56:33', '2023-06-05 10:56:33', NULL),
(1540, 'en', 'drop_your_files_here_or', 'Drop your files here or', '2023-06-05 10:56:33', '2023-06-05 10:56:33', NULL),
(1541, 'en', 'browse', 'Browse', '2023-06-05 10:56:33', '2023-06-05 10:56:33', NULL),
(1542, 'en', 'update_language', 'Update Language', '2023-06-05 11:01:00', '2023-06-05 11:01:00', NULL),
(1543, 'en', 'update', 'Update', '2023-06-05 11:01:00', '2023-06-05 11:01:00', NULL),
(1544, 'en', 'add_page', 'Add Page', '2023-06-05 12:16:41', '2023-06-05 12:16:41', NULL),
(1545, 'en', 'page_link', 'Page Link', '2023-06-05 12:16:41', '2023-06-05 12:16:41', NULL),
(1546, 'en', 'add_new_role', 'Add New Role', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1547, 'en', 'new_role', 'New Role', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1548, 'en', 'role_name', 'Role Name', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1549, 'en', 'type_role_name', 'Type role name', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1550, 'en', 'permissions', 'Permissions', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1551, 'en', 'select_all', 'Select All', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1552, 'en', 'select_all_of', 'Select all of', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1553, 'en', 'subscriptions_histories', 'Subscriptions Histories', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1554, 'en', 'ban_customers', 'Ban Customers', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1555, 'en', 'add_staffs', 'Add Staffs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1556, 'en', 'edit_staffs', 'Edit Staffs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1557, 'en', 'delete_staffs', 'Delete Staffs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1558, 'en', 'contact_us_messages', 'Contact Us Messages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1559, 'en', 'add_tags', 'Add Tags', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1560, 'en', 'edit_tags', 'Edit Tags', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1561, 'en', 'delete_tags', 'Delete Tags', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1562, 'en', 'add_blogs', 'Add Blogs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1563, 'en', 'edit_blogs', 'Edit Blogs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1564, 'en', 'publish_blogs', 'Publish Blogs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1565, 'en', 'delete_blogs', 'Delete Blogs', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1566, 'en', 'add_blog_categories', 'Add Blog Categories', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1567, 'en', 'edit_blog_categories', 'Edit Blog Categories', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1568, 'en', 'delete_blog_categories', 'Delete Blog Categories', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1569, 'en', 'add_pages', 'Add Pages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1570, 'en', 'edit_pages', 'Edit Pages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1571, 'en', 'delete_pages', 'Delete Pages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1572, 'en', 'add_media', 'Add Media', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1573, 'en', 'delete_media', 'Delete Media', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1574, 'en', 'delete_subscribers', 'Delete Subscribers', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1575, 'en', 'roles_and_permissions', 'Roles And Permissions', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1576, 'en', 'add_roles_and_permissions', 'Add Roles And Permissions', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1577, 'en', 'edit_roles_and_permissions', 'Edit Roles And Permissions', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1578, 'en', 'delete_roles_and_permissions', 'Delete Roles And Permissions', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1579, 'en', 'currency_settings', 'Currency Settings', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1580, 'en', 'add_currency', 'Add Currency', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1581, 'en', 'edit_currency', 'Edit Currency', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1582, 'en', 'publish_currency', 'Publish Currency', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1583, 'en', 'language_settings', 'Language Settings', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1584, 'en', 'add_languages', 'Add Languages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1585, 'en', 'edit_languages', 'Edit Languages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1586, 'en', 'publish_languages', 'Publish Languages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1587, 'en', 'translate_languages', 'Translate Languages', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1588, 'en', 'payment_settings', 'Payment Settings', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1589, 'en', 'social_login_settings', 'Social Login Settings', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1590, 'en', 'save_role', 'Save Role', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1591, 'en', 'role_information', 'Role Information', '2023-06-05 12:16:56', '2023-06-05 12:16:56', NULL),
(1592, 'en', 'product_description', 'Product Description', '2023-06-05 12:28:42', '2023-06-05 12:28:42', NULL),
(1593, 'en', 'what_is_the_name_of_the_product', 'What is the name of the product?', '2023-06-05 12:28:42', '2023-06-05 12:28:42', NULL),
(1594, 'en', 'eg_iphone_14_pro', 'e.g. iPhone 14 Pro', '2023-06-05 12:28:42', '2023-06-05 12:28:42', NULL),
(1595, 'en', 'write_a_long_creative_product_description_for', 'Write a long creative product description for', '2023-06-05 12:29:01', '2023-06-05 12:29:01', NULL),
(1596, 'en', 'image_generation_is_turned_off_in_demo', 'Image generation is turned off in demo', '2023-06-05 13:16:35', '2023-06-05 13:16:35', NULL),
(1597, 'en', 'promotional_email', 'Promotional Email', '2023-06-05 13:23:41', '2023-06-05 13:23:41', NULL),
(1598, 'en', 'what_is_recipient_name', 'What is recipient name?', '2023-06-05 13:23:41', '2023-06-05 13:23:41', NULL),
(1599, 'en', 'eg_ryan_toland', 'e.g. Ryan Toland', '2023-06-05 13:23:41', '2023-06-05 13:23:41', NULL),
(1600, 'en', 'about_what_is_your_email', 'About what is your email?', '2023-06-05 13:23:41', '2023-06-05 13:23:41', NULL),
(1601, 'en', 'eg_for_serving_the_company_with_sincerity', 'e.g. For serving the company with sincerity', '2023-06-05 13:23:41', '2023-06-05 13:23:41', NULL),
(1602, 'en', 'pros__cons', 'Pros & Cons', '2023-06-05 13:26:46', '2023-06-05 13:26:46', NULL),
(1603, 'en', 'what_is_the_topic', 'What is the topic?', '2023-06-05 13:26:46', '2023-06-05 13:26:46', NULL),
(1604, 'en', 'eg_using_mobile_phone', 'e.g. Using mobile phone', '2023-06-05 13:26:46', '2023-06-05 13:26:46', NULL),
(1605, 'en', 'story_outline', 'Story Outline', '2023-06-05 13:27:05', '2023-06-05 13:27:05', NULL),
(1606, 'en', 'job_description', 'Job Description', '2023-06-05 13:32:59', '2023-06-05 13:32:59', NULL),
(1607, 'en', 'what_is_the_job_position', 'What is the job position?', '2023-06-05 13:32:59', '2023-06-05 13:32:59', NULL),
(1608, 'en', 'eg_what_is_the_position_of_the_job', 'e.g. What is the position of the job?', '2023-06-05 13:32:59', '2023-06-05 13:32:59', NULL),
(1609, 'en', 'what_are_the_core_requirements', 'What are the core requirements?', '2023-06-05 13:32:59', '2023-06-05 13:32:59', NULL),
(1610, 'en', 'type_requirements_for_the_position', 'Type requirements for the position', '2023-06-05 13:32:59', '2023-06-05 13:32:59', NULL),
(1611, 'en', 'job_position', 'Job position', '2023-06-05 13:33:54', '2023-06-05 13:33:54', NULL),
(1612, 'en', 'text_to_speech_is_turned_off_in_demo', 'Text to speech is turned off in demo', '2023-06-05 13:58:22', '2023-06-05 13:58:22', NULL),
(1613, 'en', 'content_rewriter', 'Content Rewriter', '2023-06-05 14:00:55', '2023-06-05 14:00:55', NULL),
(1614, 'en', 'what_would_you_like_to_rewrite', 'What would you like to rewrite?', '2023-06-05 14:00:55', '2023-06-05 14:00:55', NULL),
(1615, 'en', 'type_your_content_here_to_rewrite', 'Type your content here to rewrite', '2023-06-05 14:00:55', '2023-06-05 14:00:55', NULL),
(1616, 'en', 'eg_key_point_1_key_point_2', 'e.g. key point 1, key point 2', '2023-06-05 14:00:55', '2023-06-05 14:00:55', NULL),
(1617, 'en', 'story_ideas', 'Story Ideas', '2023-06-05 14:48:32', '2023-06-05 14:48:32', NULL),
(1618, 'en', 'eg_benefit_of_new_ai_technologies', 'e.g. Benefit of new AI technologies', '2023-06-05 14:48:32', '2023-06-05 14:48:32', NULL),
(1619, 'en', 'write_interesting_story_ideas_for_mediumcom_based_on_the_keywords', 'Write interesting story ideas for medium.com based on the keywords', '2023-06-05 14:50:02', '2023-06-05 14:50:02', NULL),
(1620, 'en', 'article_generator', 'Article Generator', '2023-06-05 14:52:36', '2023-06-05 14:52:36', NULL),
(1621, 'en', 'title_of_the_article', 'Title of the article', '2023-06-05 14:52:36', '2023-06-05 14:52:36', NULL),
(1622, 'en', 'use_following_keywords_in_the_article', 'Use following keywords in the article', '2023-06-05 14:52:54', '2023-06-05 14:52:54', NULL),
(1623, 'en', 'instagram_post_ideas', 'Instagram Post Ideas', '2023-06-05 15:05:57', '2023-06-05 15:05:57', NULL),
(1624, 'en', 'video_ideas', 'Video Ideas', '2023-06-05 15:06:09', '2023-06-05 15:06:09', NULL),
(1625, 'en', 'payout_configurations', 'Payout Configurations', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1626, 'en', 'payouts', 'Payouts', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1627, 'en', 'configure_payout_accounts', 'Configure Payout Accounts', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1628, 'en', 'bank_details', 'Bank Details', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1629, 'en', 'type_bank_payment_details', 'Type bank payment details', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1630, 'en', 'paypal_details', 'Paypal Details', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1631, 'en', 'type_paypal_payment_details', 'Type paypal payment details', '2023-06-05 16:25:09', '2023-06-05 16:25:09', NULL),
(1632, 'en', 'write_interesting_video_ideas_based_on_the_keywords', 'Write interesting video ideas based on the keywords', '2023-06-05 18:22:39', '2023-06-05 18:22:39', NULL),
(1633, 'en', 'cookie_consent', 'Cookie Consent', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1634, 'en', 'show_cookie_consent', 'Show Cookie Consent', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1635, 'en', 'select_an_option', 'Select an option', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1636, 'en', 'cookie_consent_text', 'Cookie Consent Text', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1637, 'en', 'system_templates', 'System Templates', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1638, 'en', 'custom_templates', 'Custom Templates', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1639, 'en', 'reports', 'Reports', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1640, 'en', 'words_report', 'Words Report', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1641, 'en', 'codes_report', 'Codes Report', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1642, 'en', 'images_report', 'Images Report', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1643, 'en', 'speech_to_texts', 'Speech to Texts', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1644, 'en', 'most_used_templates', 'Most Used Templates', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1645, 'en', 'subscriptions_reports', 'Subscriptions Reports', '2023-06-07 17:04:31', '2023-06-07 17:04:31', NULL),
(1646, 'en', 'package_templates', 'Package Templates', '2023-06-07 17:07:39', '2023-06-07 17:07:39', NULL),
(1647, 'en', 'reset_with_phone', 'Reset with phone?', '2023-06-07 17:08:56', '2023-06-07 17:08:56', NULL),
(1648, 'en', 'reset_with_email', 'Reset with email?', '2023-06-07 17:08:56', '2023-06-07 17:08:56', NULL),
(1649, 'en', 'reset_password', 'Reset Password', '2023-06-07 17:08:57', '2023-06-07 17:08:57', NULL),
(1650, 'en', 'business', 'Business', '2023-06-07 17:10:25', '2023-06-07 17:10:25', NULL),
(1651, 'en', 'this_is_turned_off_in_demo', 'This is turned off in demo', '2023-06-07 17:14:06', '2023-06-07 17:14:06', NULL),
(1652, 'en', 'i_understood', 'I Understood', '2023-06-07 17:16:20', '2023-06-07 17:16:20', NULL),
(1653, 'en', 'start_date__end_date', 'Start date - End date', '2023-06-07 17:18:32', '2023-06-07 17:18:32', NULL),
(1654, 'en', 'total_words', 'Total Words', '2023-06-07 17:18:32', '2023-06-07 17:18:32', NULL),
(1655, 'en', 'generated_on', 'Generated On', '2023-06-07 17:18:32', '2023-06-07 17:18:32', NULL),
(1656, 'en', 'template', 'Template', '2023-06-07 17:18:32', '2023-06-07 17:18:32', NULL),
(1657, 'en', 'total_codes_generated', 'Total Codes Generated', '2023-06-07 17:18:37', '2023-06-07 17:18:37', NULL),
(1658, 'en', 'add_custom_template', 'Add Custom Template', '2023-06-07 17:20:32', '2023-06-07 17:20:32', NULL),
(1659, 'en', 'custom_template_categories', 'Custom Template Categories', '2023-06-07 17:20:52', '2023-06-07 17:20:52', NULL),
(1660, 'en', 'icon', 'Icon', '2023-06-07 17:20:52', '2023-06-07 17:20:52', NULL),
(1661, 'en', 'show', 'Show?', '2023-06-07 17:22:23', '2023-06-07 17:22:23', NULL),
(1662, 'en', 'custom', 'Custom', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1663, 'en', 'add_template', 'Add Template', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1664, 'en', 'template_name', 'Template Name', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1665, 'en', 'type_template_name', 'Type template name', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1666, 'en', 'type_short_description', 'Type short description', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1667, 'en', 'input_information', 'Input Information', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1668, 'en', 'input_type', 'Input Type', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1669, 'en', 'input_field', 'Input Field', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1670, 'en', 'textarea_field', 'Textarea Field', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1671, 'en', 'input_name', 'Input Name', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1672, 'en', 'type_input_name', 'Type input name', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1673, 'en', 'input_label', 'Input Label', '2023-06-07 17:22:47', '2023-06-07 17:22:47', NULL),
(1674, 'en', 'type_input_label', 'Type input label', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1675, 'en', 'add_more', 'Add More', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1676, 'en', 'prompt_information', 'Prompt Information', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1677, 'en', 'input_variables', 'Input Variables', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1678, 'en', 'click_on_variable_to_set_the_user_input_of_it_in_your_prompts', 'Click on variable to set the user input of it in your prompts', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1679, 'en', 'custom_prompt', 'Custom Prompt', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1680, 'en', 'type_your_prompt', 'Type your prompt', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1681, 'en', 'save_template', 'Save Template', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1682, 'en', 'template_information', 'Template Information', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1683, 'en', 'basic', 'Basic', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1684, 'en', 'inputs', 'Inputs', '2023-06-07 17:22:48', '2023-06-07 17:22:48', NULL),
(1685, 'en', 'send_bulk_emails', 'Send Bulk Emails', '2023-06-07 17:23:58', '2023-06-07 17:23:58', NULL),
(1686, 'en', 'select_users', 'Select Users', '2023-06-07 17:23:58', '2023-06-07 17:23:58', NULL),
(1687, 'en', 'select_subscribers', 'Select Subscribers', '2023-06-07 17:23:58', '2023-06-07 17:23:58', NULL),
(1688, 'en', 'email_subject', 'Email Subject', '2023-06-07 17:23:58', '2023-06-07 17:23:58', NULL),
(1689, 'en', 'email_body', 'Email Body', '2023-06-07 17:23:58', '2023-06-07 17:23:58', NULL),
(1690, 'en', 'send_emails', 'Send Emails', '2023-06-07 17:23:58', '2023-06-07 17:23:58', NULL),
(1691, 'en', 'template_has_been_added_successfully', 'Template has been added successfully', '2023-06-07 17:24:27', '2023-06-07 17:24:27', NULL),
(1692, 'en', 'linkedin_posts', 'LinkedIn Posts', '2023-06-07 17:24:31', '2023-06-07 17:24:31', NULL),
(1693, 'en', 'type_about_of_your_post', 'Type about of your post', '2023-06-07 17:24:31', '2023-06-07 17:24:31', NULL),
(1694, 'en', 'grammar_checker', 'Grammar Checker', '2023-06-10 15:10:49', '2023-06-10 15:10:49', NULL),
(1695, 'en', 'type_content_you_would_like_to_check_grammar', 'Type content you would like to check grammar', '2023-06-10 15:10:49', '2023-06-10 15:10:49', NULL),
(1696, 'en', 'type_your_content_here_to_check_grammar', 'Type your content here to check grammar', '2023-06-10 15:10:49', '2023-06-10 15:10:49', NULL),
(1697, 'en', 'mark_as_unread', 'Mark As Unread', '2023-06-10 15:28:46', '2023-06-10 15:28:46', NULL),
(1698, 'en', 'generate_image', 'Generate Image', '2023-06-10 15:35:26', '2023-06-10 15:35:26', NULL),
(1699, 'en', 'choose_style_mood_resolution_number_of_results', 'Choose style, mood, resolution, number of results', '2023-06-10 15:35:30', '2023-06-10 15:35:30', NULL),
(1700, 'en', 'type_your_image_title_or_description_that_you_are_looking_for', 'Type your image title or description that you are looking for', '2023-06-10 15:35:30', '2023-06-10 15:35:30', NULL),
(1701, 'en', 'generated_image_result', 'Generated Image Result', '2023-06-10 15:35:30', '2023-06-10 15:35:30', NULL),
(1702, 'en', 'testimonial_email', 'Testimonial Email', '2023-06-10 16:07:24', '2023-06-10 16:07:24', NULL),
(1703, 'cn', 'write_a_complete_article_on_this_topic', 'Write a complete article on this topic', '2023-06-10 16:10:49', '2023-06-10 16:10:49', NULL),
(1704, 'en', 'project_has_been_deleted_successfully', 'Project has been deleted successfully', '2023-06-11 13:23:47', '2023-06-11 13:23:47', NULL),
(1705, 'en', 'facebook_ads', 'Facebook Ads', '2023-06-11 15:23:24', '2023-06-11 15:23:24', NULL),
(1706, 'en', 'who_is_your_targetted_audiences', 'Who is your targetted audiences?', '2023-06-11 15:23:24', '2023-06-11 15:23:24', NULL),
(1707, 'en', 'eg_children_couple', 'e.g. Children, Couple', '2023-06-11 15:23:24', '2023-06-11 15:23:24', NULL),
(1708, 'en', 'type_product_description', 'Type product description', '2023-06-11 15:23:24', '2023-06-11 15:23:24', NULL),
(1709, 'en', 'invite_your_friends_and_earn_money_from_their_subscriptions', 'Invite your friends and earn money from their subscriptions', '2023-06-11 16:42:22', '2023-06-11 16:42:22', NULL),
(1710, 'en', 'invite_friends', 'Invite Friends', '2023-06-11 16:42:22', '2023-06-11 16:42:22', NULL),
(1711, 'en', 'search_template_that_you_are_looking_for', 'Search template that you are looking for', '2023-06-11 16:44:29', '2023-06-11 16:44:29', NULL),
(1712, 'en', 'search_now', 'Search Now', '2023-06-11 16:44:29', '2023-06-11 16:44:29', NULL),
(1713, 'en', 'logout', 'Logout', '2023-06-11 16:45:08', '2023-06-11 16:45:08', NULL),
(1714, 'en', 'created_by_admin', 'Created by admin', '2023-06-11 16:49:06', '2023-06-11 16:49:06', NULL),
(1715, 'en', 'instagram_story_ideas', 'Instagram Story Ideas', '2023-06-11 17:51:24', '2023-06-11 17:51:24', NULL),
(1716, 'en', 'default_language_updated_successfully', 'Default language updated successfully', '2023-06-11 18:02:40', '2023-06-11 18:02:40', NULL),
(1717, 'en', 'language_has_been_updated_successfully', 'Language has been updated successfully', '2023-06-11 18:10:57', '2023-06-11 18:10:57', NULL),
(1718, 'en', 'youtube_video_title', 'Youtube Video Title', '2023-06-11 18:43:06', '2023-06-11 18:43:06', NULL),
(1719, 'en', 'startup_name_generator', 'Startup Name Generator', '2023-06-11 18:53:49', '2023-06-11 18:53:49', NULL),
(1720, 'en', 'start_up_description', 'Start Up Description', '2023-06-11 18:53:49', '2023-06-11 18:53:49', NULL),
(1721, 'en', 'type_start_up_description', 'Type start up description', '2023-06-11 18:53:49', '2023-06-11 18:53:49', NULL),
(1722, 'en', 'product_name_generator', 'Product Name Generator', '2023-06-11 18:54:02', '2023-06-11 18:54:02', NULL),
(1723, 'en', 'edit_custom_template', 'Edit Custom Template', '2023-06-11 19:42:11', '2023-06-11 19:42:11', NULL),
(1724, 'en', 'edit_template', 'Edit Template', '2023-06-11 19:42:11', '2023-06-11 19:42:11', NULL),
(1725, 'en', 'old_prompt', 'Old Prompt', '2023-06-11 19:42:11', '2023-06-11 19:42:11', NULL),
(1726, 'en', 'affiliate_withdraw', 'Affiliate Withdraw', '2023-06-11 19:44:42', '2023-06-11 19:44:42', NULL),
(1727, 'en', 'affiliate_earning_histories', 'Affiliate Earning Histories', '2023-06-11 19:44:42', '2023-06-11 19:44:42', NULL),
(1728, 'en', 'report', 'Report', '2023-06-11 19:44:42', '2023-06-11 19:44:42', NULL),
(1729, 'en', 's2t_report', 'S2t Report', '2023-06-11 19:44:42', '2023-06-11 19:44:42', NULL),
(1730, 'en', 'instagram_reel_ideas', 'Instagram Reel Ideas', '2023-06-11 20:07:13', '2023-06-11 20:07:13', NULL),
(1731, 'en', 'blog_post_seo_meta_description', 'Blog Post SEO Meta Description', '2023-06-11 20:16:23', '2023-06-11 20:16:23', NULL),
(1732, 'en', 'what_is_your_blog_title', 'What is your blog title?', '2023-06-11 20:16:23', '2023-06-11 20:16:23', NULL),
(1733, 'en', 'description_of_your_blog', 'Description of your blog', '2023-06-11 20:16:23', '2023-06-11 20:16:23', NULL),
(1734, 'en', 'type_description_of_the_blog', 'Type description of the blog', '2023-06-11 20:16:23', '2023-06-11 20:16:23', NULL),
(1735, 'en', 'linkedin_ad_descriptions', 'LinkedIn Ad Descriptions', '2023-06-11 20:17:17', '2023-06-11 20:17:17', NULL),
(1736, 'en', 'type_ad_descriptions', 'Type ad descriptions', '2023-06-11 20:17:17', '2023-06-11 20:17:17', NULL),
(1737, 'en', 'instagram_captions', 'Instagram Captions', '2023-06-11 20:17:58', '2023-06-11 20:17:58', NULL),
(1738, 'en', 'about_what_is_your_instagram_post', 'About what is your instagram post?', '2023-06-11 20:17:58', '2023-06-11 20:17:58', NULL),
(1739, 'en', 'eg_travelling_the_world', 'e.g. Travelling the world', '2023-06-11 20:17:58', '2023-06-11 20:17:58', NULL),
(1740, 'en', 'subscribed_users', 'Subscribed users', '2023-06-11 20:57:12', '2023-06-11 20:57:12', NULL),
(1741, 'en', 'suibscribed_at', 'Suibscribed At', '2023-06-11 20:57:12', '2023-06-11 20:57:12', NULL),
(1742, 'en', 'add_new_employee_staff', 'Add New Employee Staff', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1743, 'en', 'add_new_staff', 'Add New Staff', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1744, 'en', 'new_staff', 'New Staff', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1745, 'en', 'staff_name', 'Staff Name', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1746, 'en', 'type_staff_name', 'Type staff name', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1747, 'en', 'staff_email', 'Staff Email', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1748, 'en', 'type_staff_email', 'Type staff email', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1749, 'en', 'staff_role', 'Staff Role', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1750, 'en', 'staff_phone', 'Staff Phone', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1751, 'en', 'type_staff_phone', 'Type staff phone', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1752, 'en', 'save_staff', 'Save Staff', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1753, 'en', 'staff_information', 'Staff Information', '2023-06-11 21:25:32', '2023-06-11 21:25:32', NULL),
(1754, 'en', 'confirmation_email', 'Confirmation Email', '2023-06-11 21:37:25', '2023-06-11 21:37:25', NULL),
(1755, 'en', 'eg_signing_up_to_a_web_app', 'e.g. Signing up to a web app', '2023-06-11 21:37:25', '2023-06-11 21:37:25', NULL),
(1756, 'en', 'follow_up_email', 'Follow Up Email', '2023-06-11 21:51:24', '2023-06-11 21:51:24', NULL),
(1757, 'en', 'eg_following_up_after_an_interview', 'e.g. Following up after an interview', '2023-06-11 21:51:24', '2023-06-11 21:51:24', NULL),
(1758, 'en', 'short_story', 'Short Story', '2023-06-11 22:33:23', '2023-06-11 22:33:23', NULL),
(1759, 'en', 'payment_failed_please_try_again', 'Payment failed, please try again', '2023-06-11 23:57:23', '2023-06-11 23:57:23', NULL),
(1760, 'en', 'blog_intro', 'Blog Intro', '2023-06-11 23:57:39', '2023-06-11 23:57:39', NULL),
(1761, 'en', 'career', 'Career', '2023-06-12 00:02:26', '2023-06-12 00:02:26', NULL),
(1762, 'en', 'high__low', 'High ⟶ Low', '2023-06-12 00:16:30', '2023-06-12 00:16:30', NULL),
(1763, 'en', 'low__high', 'Low ⟶ High', '2023-06-12 00:16:30', '2023-06-12 00:16:30', NULL),
(1764, 'en', 'website_faq', 'Website FAQ', '2023-06-12 00:19:48', '2023-06-12 00:19:48', NULL),
(1765, 'en', 'about_what_is_the_faq', 'About what is the FAQ?', '2023-06-12 00:19:48', '2023-06-12 00:19:48', NULL),
(1766, 'en', 'currency_changed_to_', 'Currency changed to ', '2023-06-12 00:54:42', '2023-06-12 00:54:42', NULL),
(1767, 'en', 'offer_letter', 'Offer Letter', '2023-06-12 01:09:21', '2023-06-12 01:09:21', NULL),
(1768, 'en', 'about_what_is_the_offer_letter', 'About what is the offer letter?', '2023-06-12 01:09:21', '2023-06-12 01:09:21', NULL),
(1769, 'en', 'eg_offer_letter_of_the_job_for_the_position_of_software_engineer', 'e.g. Offer letter of the job for the position of software engineer', '2023-06-12 01:09:21', '2023-06-12 01:09:21', NULL),
(1770, 'en', 'update_template_category', 'Update Template Category', '2023-06-12 01:17:01', '2023-06-12 01:17:01', NULL),
(1771, 'en', 'template_categories', 'Template Categories', '2023-06-12 01:17:01', '2023-06-12 01:17:01', NULL),
(1772, 'en', 'add_new_page', 'Add New Page', '2023-06-12 01:43:24', '2023-06-12 01:43:24', NULL),
(1773, 'en', 'page_title', 'Page Title', '2023-06-12 01:43:24', '2023-06-12 01:43:24', NULL),
(1774, 'en', 'type_page_title', 'Type page title', '2023-06-12 01:43:24', '2023-06-12 01:43:24', NULL),
(1775, 'en', 'page_description', 'Page Description', '2023-06-12 01:43:24', '2023-06-12 01:43:24', NULL),
(1776, 'en', 'save_page', 'Save Page', '2023-06-12 01:43:24', '2023-06-12 01:43:24', NULL),
(1777, 'en', 'page_information', 'Page Information', '2023-06-12 01:43:24', '2023-06-12 01:43:24', NULL),
(1778, 'en', 'event_promotion', 'Event Promotion', '2023-06-12 01:49:25', '2023-06-12 01:49:25', NULL),
(1779, 'en', 'title_of_the_event', 'Title of the event', '2023-06-12 01:49:25', '2023-06-12 01:49:25', NULL),
(1780, 'en', 'eg_celebration_of_victory_day', 'e.g. Celebration of victory day', '2023-06-12 01:49:25', '2023-06-12 01:49:25', NULL),
(1781, 'en', 'about_what_is_your_event', 'About what is your event?', '2023-06-12 01:49:25', '2023-06-12 01:49:25', NULL),
(1782, 'en', 'type_short_description_about_the_event', 'Type short description about the event', '2023-06-12 01:49:25', '2023-06-12 01:49:25', NULL),
(1783, 'en', 'start_up', 'Start up', '2023-06-12 02:51:54', '2023-06-12 02:51:54', NULL),
(1784, 'en', 'home_page_seo_meta_description', 'Home Page SEO Meta Description', '2023-06-12 04:03:51', '2023-06-12 04:03:51', NULL),
(1785, 'en', 'what_is_your_website_branding_name', 'What is your website branding name?', '2023-06-12 04:03:51', '2023-06-12 04:03:51', NULL),
(1786, 'en', 'description_of_your_website', 'Description of your website', '2023-06-12 04:03:51', '2023-06-12 04:03:51', NULL),
(1787, 'en', 'type_description_of_the_website', 'Type description of the website', '2023-06-12 04:03:51', '2023-06-12 04:03:51', NULL),
(1788, 'en', 'website_review', 'Website Review', '2023-06-12 05:19:51', '2023-06-12 05:19:51', NULL),
(1789, 'en', 'website_faq_answers', 'Website FAQ Answers', '2023-06-12 06:04:30', '2023-06-12 06:04:30', NULL),
(1790, 'en', 'what_is_the_question', 'What is the question?', '2023-06-12 06:04:30', '2023-06-12 06:04:30', NULL),
(1791, 'en', 'eg_do_we_provide_support_for_247', 'e.g. Do we provide support for 24/7?', '2023-06-12 06:04:30', '2023-06-12 06:04:30', NULL),
(1792, 'en', 'social_media_post', 'Social Media Post', '2023-06-12 06:27:16', '2023-06-12 06:27:16', NULL),
(1793, 'en', 'about_what_is_your_post', 'About what is your post?', '2023-06-12 06:27:16', '2023-06-12 06:27:16', NULL),
(1794, 'en', 'website_title', 'Website Title', '2023-06-12 07:21:55', '2023-06-12 07:21:55', NULL),
(1795, 'en', 'about_what_is_the_website', 'About what is the website?', '2023-06-12 07:21:55', '2023-06-12 07:21:55', NULL),
(1796, 'en', 'update_page', 'Update Page', '2023-06-12 07:53:27', '2023-06-12 07:53:27', NULL),
(1797, 'en', 'page_slug', 'Page Slug', '2023-06-12 07:53:27', '2023-06-12 07:53:27', NULL),
(1798, 'en', 'type_page_slug', 'Type page slug', '2023-06-12 07:53:27', '2023-06-12 07:53:27', NULL),
(1799, 'en', 'website_terms_and_conditions', 'Website Terms And Conditions', '2023-06-12 08:12:53', '2023-06-12 08:12:53', NULL),
(1800, 'en', 'what_is_your_website_title', 'What is your website title?', '2023-06-12 08:12:53', '2023-06-12 08:12:53', NULL),
(1801, 'en', 'type_title_of_the_website', 'Type title of the website', '2023-06-12 08:12:53', '2023-06-12 08:12:53', NULL),
(1802, 'en', 'google_ads_description', 'Google Ads Description', '2023-06-12 09:40:01', '2023-06-12 09:40:01', NULL),
(1803, 'en', 'who_is_your_targetted_audience', 'Who is your targetted audience?', '2023-06-12 09:40:01', '2023-06-12 09:40:01', NULL),
(1804, 'en', 'product_page_seo_meta_description', 'Product Page SEO Meta Description', '2023-06-12 10:58:50', '2023-06-12 10:58:50', NULL),
(1805, 'en', 'what_is_your_product_name', 'What is your product name?', '2023-06-12 10:58:50', '2023-06-12 10:58:50', NULL),
(1806, 'en', 'description_of_your_product', 'Description of your product', '2023-06-12 10:58:50', '2023-06-12 10:58:50', NULL),
(1807, 'en', 'type_description_of_the_product', 'Type description of the product', '2023-06-12 10:58:50', '2023-06-12 10:58:50', NULL),
(1808, 'en', 'default_language_can_not_be_disabled', 'Default language can not be disabled', '2023-06-17 08:35:00', '2023-06-17 08:35:00', NULL),
(1809, 'en', 'paragraph_generator', 'Paragraph Generator', '2023-06-17 10:09:08', '2023-06-17 10:09:08', NULL),
(1810, 'en', 'title_of_the_paragraph', 'Title of the paragraph', '2023-06-17 10:09:08', '2023-06-17 10:09:08', NULL),
(1811, 'en', 'discount_email', 'Discount Email', '2023-06-17 10:37:23', '2023-06-17 10:37:23', NULL),
(1812, 'en', 'eg_get_discount_on_first_purchase_of_product_namefrom_company_name', 'e.g. Get discount on first purchase (of product name/from company name)', '2023-06-17 10:37:23', '2023-06-17 10:37:23', NULL),
(1813, 'en', 'page_has_been_created_successfully', 'Page has been created successfully', '2023-06-17 14:37:36', '2023-06-17 14:37:36', NULL),
(1814, 'en', 'website_about_us', 'Website About Us', '2023-06-17 16:59:24', '2023-06-17 16:59:24', NULL),
(1815, 'en', 'ai_chat', 'AI Chat', '2023-06-17 19:14:58', '2023-06-17 19:14:58', NULL),
(1816, 'en', 'no_conversation_found', 'No conversation found', '2023-06-17 19:20:43', '2023-06-17 19:20:43', NULL),
(1817, 'en', 'new_conversation', 'New Conversation', '2023-06-17 19:20:43', '2023-06-17 19:20:43', NULL),
(1818, 'en', 'open_a_new_conversation_to_chat_with_ai', 'Open a new conversation to chat with Ai', '2023-06-17 19:20:43', '2023-06-17 19:20:43', NULL),
(1819, 'en', 'allow_ai_chat', 'Allow AI Chat', '2023-06-17 19:20:52', '2023-06-17 19:20:52', NULL),
(1820, 'en', 'type_your_message', 'Type your message', '2023-06-17 19:21:33', '2023-06-17 19:21:33', NULL),
(1821, 'en', 'website_meta_description', 'Website Meta Description', '2023-06-17 19:25:25', '2023-06-17 19:25:25', NULL),
(1822, 'fr', 'total_words', 'Total Words', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1823, 'fr', 'sl', 'S/L', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1824, 'fr', 'generated_on', 'Generated On', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1825, 'fr', 'template', 'Template', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1826, 'fr', 'words', 'Words', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1827, 'fr', 'showing', 'Showing', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1828, 'fr', 'of', 'of', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1829, 'fr', 'results', 'results', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1830, 'fr', 'dashboard', 'Dashboard', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1831, 'fr', 'subscriptions', 'Subscriptions', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1832, 'fr', 'subscription_histories', 'Subscription Histories', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1833, 'fr', 'subscription_packages', 'Subscription Packages', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1834, 'fr', 'affiliate_system', 'Affiliate System', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1835, 'fr', 'configurations', 'Configurations', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1836, 'fr', 'withdraw_requests', 'Withdraw Requests', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1837, 'fr', 'earning_histories', 'Earning Histories', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1838, 'fr', 'payment_histories', 'Payment Histories', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1839, 'fr', 'manage_documents', 'Manage Documents', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1840, 'fr', 'folders', 'Folders', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1841, 'fr', 'all_projects', 'All Projects', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1842, 'fr', 'ai_tools', 'AI Tools', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1843, 'fr', 'ai_chat', 'AI Chat', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1844, 'fr', 'templates', 'Templates', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1845, 'fr', 'custom_templates', 'Custom Templates', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL);
INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1846, 'fr', 'categories', 'Categories', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1847, 'fr', 'all_templates', 'All Templates', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1848, 'fr', 'speech_to_text', 'Speech to Text', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1849, 'fr', 'generate_images', 'Generate Images', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1850, 'fr', 'generate_code', 'Generate Code', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1851, 'fr', 'popular_templates', 'Popular Templates', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1852, 'fr', 'favorite_templates', 'Favorite Templates', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1853, 'fr', 'reports', 'Reports', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1854, 'fr', 'words_report', 'Words Report', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1855, 'fr', 'codes_report', 'Codes Report', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1856, 'fr', 'images_report', 'Images Report', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1857, 'fr', 'speech_to_texts', 'Speech to Texts', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1858, 'fr', 'most_used_templates', 'Most Used Templates', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1859, 'fr', 'subscriptions_reports', 'Subscriptions Reports', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1860, 'fr', 'manage_users', 'Manage Users', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1861, 'fr', 'customers', 'Customers', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1862, 'fr', 'employee_staffs', 'Employee Staffs', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1863, 'fr', 'support', 'Support', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1864, 'fr', 'queries', 'Queries', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1865, 'fr', 'manage_contents', 'Manage Contents', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1866, 'fr', 'tags', 'Tags', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1867, 'fr', 'blogs', 'Blogs', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1868, 'fr', 'all_blogs', 'All Blogs', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1869, 'fr', 'pages', 'Pages', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1870, 'fr', 'all_faqs', 'All FAQs', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1871, 'fr', 'media_manager', 'Media Manager', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1872, 'fr', 'manage_promotions', 'Manage Promotions', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1873, 'fr', 'newsletters', 'Newsletters', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1874, 'fr', 'bulk_emails', 'Bulk Emails', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1875, 'fr', 'subscribers', 'Subscribers', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1876, 'fr', 'manage_settings', 'Manage Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1877, 'fr', 'open_ai', 'Open AI', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1878, 'fr', 'appearance', 'Appearance', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1879, 'fr', 'homepage', 'Homepage', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1880, 'fr', 'header', 'Header', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1881, 'fr', 'footer', 'Footer', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1882, 'fr', 'roles__permissions', 'Roles & Permissions', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1883, 'fr', 'system_settings', 'System Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1884, 'fr', 'auth_settings', 'Auth Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1885, 'fr', 'otp_settings', 'OTP Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1886, 'fr', 'smtp_settings', 'SMTP Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1887, 'fr', 'general_settings', 'General Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1888, 'fr', 'payment_methods', 'Payment Methods', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1889, 'fr', 'social_media_login', 'Social Media Login', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1890, 'fr', 'multilingual_settings', 'Multilingual Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1891, 'fr', 'multi_currency_settings', 'Multi Currency Settings', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1892, 'fr', 'logout', 'Logout', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1893, 'fr', 'search', 'Search', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1894, 'fr', 'no_new_notification', 'No New Notification', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1895, 'fr', 'my_account', 'My Account', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1896, 'fr', 'sign_out', 'Sign out', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1897, 'fr', 'media_files', 'Media Files', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1898, 'fr', 'recently_uploaded_files', 'Recently uploaded files', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1899, 'fr', 'add_files_here', 'Add files here', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1900, 'fr', 'previously_uploaded_files', 'Previously uploaded files', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1901, 'fr', 'search_by_name', 'Search by name', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1902, 'fr', 'load_more', 'Load More', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1903, 'fr', 'select', 'Select', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1904, 'fr', 'delete_confirmation', 'Delete Confirmation', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1905, 'fr', 'are_you_sure_to_delete_this', 'Are you sure to delete this?', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1906, 'fr', 'all_data_related_to_this_may_get_deleted', 'All data related to this may get deleted.', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1907, 'fr', 'proceed', 'Proceed', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1908, 'fr', 'cancel', 'Cancel', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1909, 'fr', 'no_data_found', 'No data found', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1910, 'fr', 'selected_file', 'Selected File', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1911, 'fr', 'selected_files', 'Selected Files', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1912, 'fr', 'file_added', 'File added', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1913, 'fr', 'files_added', 'Files added', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1914, 'fr', 'no_file_chosen', 'No file chosen', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1915, 'fr', 'please_wait', 'Please wait', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1916, 'fr', 'create_content', 'Create Content', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1917, 'fr', 'generate_image', 'Generate Image', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1918, 'fr', 'move_to_folder', 'Move To Folder', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1919, 'fr', 'move_project', 'Move Project', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1920, 'fr', 'save_changes', 'Save Changes', '2023-06-19 10:05:41', '2023-06-19 10:05:41', NULL),
(1921, 'fr', 'affiliate_withdraw_requests', 'Affiliate Withdraw Requests', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1922, 'fr', 'user', 'User', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1923, 'fr', 'date', 'Date', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1924, 'fr', 'amount', 'Amount', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1925, 'fr', 'payment_method', 'Payment Method', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1926, 'fr', 'status', 'Status', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1927, 'fr', 'additional_info', 'Additional Info', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1928, 'fr', 'remarks', 'Remarks', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1929, 'fr', 'action', 'Action', '2023-06-19 10:05:51', '2023-06-19 10:05:51', NULL),
(1930, 'fr', 'affiliate_earnings', 'Affiliate Earnings', '2023-06-19 10:05:53', '2023-06-19 10:05:53', NULL),
(1931, 'fr', 'referred_by', 'Referred By', '2023-06-19 10:05:53', '2023-06-19 10:05:53', NULL),
(1932, 'fr', 'package', 'Package', '2023-06-19 10:05:53', '2023-06-19 10:05:53', NULL),
(1933, 'fr', 'rate', 'Rate', '2023-06-19 10:05:53', '2023-06-19 10:05:53', NULL),
(1934, 'fr', 'earning', 'Earning', '2023-06-19 10:05:53', '2023-06-19 10:05:53', NULL),
(1935, 'fr', 'affiliate_payment_histories', 'Affiliate Payment Histories', '2023-06-19 10:05:56', '2023-06-19 10:05:56', NULL),
(1936, 'fr', 'words_generated', 'Words Generated', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1937, 'fr', 'favorite', 'Favorite', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1938, 'fr', 'please_generate_ai_contents_first', 'Please generate AI contents first', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1939, 'fr', 'something_went_wrong', 'Something went wrong', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1940, 'fr', 'project_moved_successfully', 'Project moved successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1941, 'fr', 'code_has_been_copied_successfully', 'Code has been copied successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1942, 'fr', 'content_has_been_copied_successfully', 'Content has been copied successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1943, 'fr', 'contents_generated_successfully', 'Contents generated successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1944, 'fr', 'contents_updated_successfully', 'Contents updated successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1945, 'fr', 'image_generated_successfully', 'Image generated successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1946, 'fr', 'code_generated_successfully', 'Code generated successfully', '2023-06-19 10:06:00', '2023-06-19 10:06:00', NULL),
(1947, 'fr', 'added_to_favorite_templates', 'Added to favorite templates', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1948, 'fr', 'product_name_generator', 'Product Name Generator', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1949, 'fr', 'generate_contents', 'Generate Contents', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1950, 'fr', 'select_input__output_language', 'Select input & output language', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1951, 'fr', 'product_description', 'Product Description', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1952, 'fr', 'type_product_description', 'Type product description', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1953, 'fr', 'advance_options', 'Advance Options', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1954, 'fr', 'browse_more_fields', 'Browse more fields', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1955, 'fr', 'creative_label', 'Creative Label', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1956, 'fr', 'creativity_level_of_the_output_will_be_as_selected', 'Creativity level of the output will be as selected', '2023-06-19 10:06:04', '2023-06-19 10:06:04', NULL),
(1957, 'fr', 'high', 'High', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1958, 'fr', 'medium', 'Medium', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1959, 'fr', 'low', 'Low', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1960, 'fr', 'choose_a_tone', 'Choose a Tone', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1961, 'fr', 'choose_the_tone_of_the_result_text_as_you_need', 'Choose the tone of the result text as you need', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1962, 'fr', 'friendly', 'Friendly', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1963, 'fr', 'luxury', 'Luxury', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1964, 'fr', 'relaxed', 'Relaxed', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1965, 'fr', 'professional', 'Professional', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1966, 'fr', 'casual', 'Casual', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1967, 'fr', 'excited', 'Excited', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1968, 'fr', 'bold', 'Bold', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1969, 'fr', 'masculine', 'Masculine', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1970, 'fr', 'dramatic', 'Dramatic', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1971, 'fr', 'number_of_results', 'Number of Results', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1972, 'fr', 'select_how_many_variations_of_result_you_want', 'Select how many variations of result you want', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1973, 'fr', 'max_results_length', 'Max Results Length', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1974, 'fr', 'maximum_words_for_each_result', 'Maximum words for each result', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1975, 'fr', 'enter_maximum_word_limit', 'Enter maximum word limit', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1976, 'fr', 'your_project_title', 'Your project title', '2023-06-19 10:06:05', '2023-06-19 10:06:05', NULL),
(1977, 'fr', 'search_template_that_you_are_looking_for', 'Search template that you are looking for', '2023-06-19 10:06:21', '2023-06-19 10:06:21', NULL),
(1978, 'fr', 'search_now', 'Search Now', '2023-06-19 10:06:21', '2023-06-19 10:06:21', NULL),
(1979, 'fr', 'used', 'Used', '2023-06-19 10:06:32', '2023-06-19 10:06:32', NULL),
(1980, 'fr', 'remaining_words', 'Remaining Words', '2023-06-19 10:06:32', '2023-06-19 10:06:32', NULL),
(1981, 'fr', 'browse_experts', 'Browse Experts', '2023-06-19 10:06:41', '2023-06-19 10:06:41', NULL),
(1982, 'fr', 'type__hit_enter', 'Type & hit enter', '2023-06-19 10:06:41', '2023-06-19 10:06:41', NULL),
(1983, 'fr', 'new_conversation', 'New Conversation', '2023-06-19 10:06:41', '2023-06-19 10:06:41', NULL),
(1984, 'fr', 'delete', 'Delete', '2023-06-19 10:06:41', '2023-06-19 10:06:41', NULL),
(1985, 'fr', 'type_your_message', 'Type your message', '2023-06-19 10:06:41', '2023-06-19 10:06:41', NULL),
(1986, 'fr', 'update_profile', 'Update Profile', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1987, 'fr', 'profile', 'Profile', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1988, 'fr', 'basic_information', 'Basic Information', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1989, 'fr', 'name', 'Name', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1990, 'fr', 'type_your_name', 'Type your name', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1991, 'fr', 'email', 'Email', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1992, 'fr', 'type_your_email', 'Type your email', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1993, 'fr', 'phone', 'Phone', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1994, 'fr', 'type_your_phone', 'Type your phone', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1995, 'fr', 'avatar', 'Avatar', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1996, 'fr', 'choose_avatar', 'Choose Avatar', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1997, 'fr', 'password', 'Password', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1998, 'fr', 'type_password', 'Type password', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(1999, 'fr', 'confirm_password', 'Confirm Password', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(2000, 'fr', 'retype_password', 'Re-type password', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(2001, 'fr', 'user_information', 'User Information', '2023-06-19 10:06:42', '2023-06-19 10:06:42', NULL),
(2002, 'fr', 'ai_images', 'AI Images', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2003, 'fr', 'choose_style_mood_resolution_number_of_results', 'Choose style, mood, resolution, number of results', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2004, 'fr', 'image_style', 'Image Style', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2005, 'fr', 'style_of_the_image_will_be_as_selected', 'Style of the image will be as selected', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2006, 'fr', 'none', 'None', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2007, 'fr', 'abstract', 'Abstract', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2008, 'fr', 'realstic', 'Realstic', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2009, 'fr', 'cartoon', 'Cartoon', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2010, 'fr', 'digital_art', 'Digital Art', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2011, 'fr', 'illustration', 'Illustration', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2012, 'fr', 'photography', 'Photography', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2013, 'fr', '3d_render', '3D Render', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2014, 'fr', 'pencil_drawing', 'Pencil Drawing', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2015, 'fr', 'mood', 'Mood', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2016, 'fr', 'mood_of_the_image_will_be_as_selected', 'Mood of the image will be as selected', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2017, 'fr', 'angry', 'Angry', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2018, 'fr', 'agressive', 'Agressive', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2019, 'fr', 'calm', 'Calm', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2020, 'fr', 'cheerful', 'Cheerful', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2021, 'fr', 'chilling', 'Chilling', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2022, 'fr', 'dark', 'Dark', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2023, 'fr', 'happy', 'Happy', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2024, 'fr', 'sad', 'Sad', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2025, 'fr', 'disabled_in_demo', 'Disabled in demo', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2026, 'fr', 'image_resolution', 'Image Resolution', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2027, 'fr', 'select_image_resolution_size_that_you_need', 'Select image resolution size that you need', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2028, 'fr', 'small_256x256', 'Small [256x256]', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2029, 'fr', 'medium_512x512', 'Medium [512x512]', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2030, 'fr', 'large_1024x1024', 'Large [1024x1024]', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2031, 'fr', 'type_your_image_title_or_description_that_you_are_looking_for', 'Type your image title or description that you are looking for', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2032, 'fr', 'generated_image_result', 'Generated Image Result', '2023-06-19 10:06:44', '2023-06-19 10:06:44', NULL),
(2033, 'fr', 'home', 'Home', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2034, 'fr', 'start_writing', 'Start Writing', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2035, 'fr', 'its_free', 'It\'s Free', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2036, 'fr', 'our_best_features', 'Our Best Features', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2037, 'fr', 'we_are_more_powerful_than_others', 'We are more powerful than others', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2038, 'fr', 'blog_content', 'Blog Content', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2039, 'fr', 'email_template', 'Email Template', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2040, 'fr', 'social_media', 'Social Media', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2041, 'fr', 'video_content', 'Video Content', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2042, 'fr', 'website_content', 'Website Content', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2043, 'fr', 'fun__quote', 'Fun & Quote', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2044, 'fr', 'medium_content', 'Medium Content', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2045, 'fr', 'tik_tok', 'Tik Tok', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2046, 'fr', 'instagram', 'Instagram', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2047, 'fr', 'success_story', 'Success Story', '2023-06-19 10:07:39', '2023-06-19 10:07:39', NULL),
(2048, 'fr', 'we_help_you', 'We Help You', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2049, 'fr', 'to_write_better_contents_faster', 'To Write Better Contents Faster', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2050, 'fr', 'view_all_templates', 'View All Templates', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2051, 'fr', 'what_customers_saying', 'What Customers Saying', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2052, 'fr', 'about_us', 'About Us', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2053, 'fr', 'our_subscription_packages', 'Our Subscription Packages', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2054, 'fr', 'ready_to_get_started', 'Ready to get started?', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2055, 'fr', 'monthly', 'Monthly', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2056, 'fr', 'yearly', 'Yearly', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2057, 'fr', 'lifetime', 'Lifetime', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2058, 'fr', 'free', 'Free', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2059, 'fr', 'get_started', 'Get Started', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2060, 'fr', 'open_ai_model', 'Open AI Model', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2061, 'fr', 'ai_templates', 'AI Templates', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2062, 'fr', 'words_per_month', 'Words per month', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2063, 'fr', 'images_per_month', 'Images per month', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2064, 'fr', 'speech_to_text_per_month', 'Speech to Text per month', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2065, 'fr', 'audio_file_size_limit', 'Audio file size limit', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2066, 'fr', 'ai_code', 'AI Code', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2067, 'fr', 'live_support', 'Live Support', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2068, 'fr', 'free_support', 'Free Support', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2069, 'fr', 'featured', 'Featured', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2070, 'fr', 'subscribe', 'Subscribe', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2071, 'fr', 'select_payment_method', 'Select Payment Method', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2072, 'fr', 'paypal', 'Paypal', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2073, 'fr', 'stripe', 'Stripe', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2074, 'fr', 'paytm', 'Paytm', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2075, 'fr', 'razorpay', 'Razorpay', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2076, 'fr', 'iyzico', 'IyZico', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2077, 'fr', 'i_understood', 'I Understood', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2078, 'fr', 'everything_that_you_need', 'Everything That You Need', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2079, 'fr', 'pricing', 'Pricing', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2080, 'fr', 'company', 'Company', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2081, 'fr', 'useful_links', 'Useful Links', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2082, 'fr', 'contact_us', 'Contact Us', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2083, 'fr', 'our_latest_news', 'Our Latest News', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2084, 'fr', 'customer_review', 'Customer Review', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2085, 'fr', 'enter_email_address', 'Enter Email Address', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2086, 'fr', 'package_templates', 'Package Templates', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2087, 'fr', 'close', 'Close', '2023-06-19 10:07:40', '2023-06-19 10:07:40', NULL),
(2088, 'fr', 'login', 'Login', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2089, 'fr', 'connect_with_google', 'Connect With Google', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2090, 'fr', 'connect_with_facebook', 'Connect With Facebook', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2091, 'fr', 'or_continue_with', 'or Continue With', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2092, 'fr', 'enter_your_email', 'Enter your email', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2093, 'fr', 'login_with_phone', 'Login with phone?', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2094, 'fr', 'login_with_email', 'Login with email?', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2095, 'fr', 'enter_your_password', 'Enter your password', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2096, 'fr', 'sign_in', 'Sign In', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2097, 'fr', 'dont_have_an_account', 'Don\'t have an Account?', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2098, 'fr', 'sign_up', 'Sign Up', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2099, 'fr', 'forgot_password', 'Forgot Password', '2023-06-19 10:07:48', '2023-06-19 10:07:48', NULL),
(2100, 'fr', 'add_custom_template', 'Add Custom Template', '2023-06-19 10:09:03', '2023-06-19 10:09:03', NULL),
(2101, 'fr', 'edit', 'Edit', '2023-06-19 10:09:03', '2023-06-19 10:09:03', NULL),
(2102, 'fr', '404', '404', '2023-06-19 10:09:08', '2023-06-19 10:09:08', NULL),
(2103, 'fr', 'this_template_not_included_in_your_subscription_plan', 'This template not included in your subscription plan', '2023-06-19 10:11:15', '2023-06-19 10:11:15', NULL),
(2104, 'fr', 'overview', 'Overview', '2023-06-19 10:11:15', '2023-06-19 10:11:15', NULL),
(2105, 'fr', 'payout_configuration', 'Payout Configuration', '2023-06-19 10:11:15', '2023-06-19 10:11:15', NULL),
(2106, 'fr', 'invite_your_friends_and_earn_money_from_their_subscriptions', 'Invite your friends and earn money from their subscriptions', '2023-06-19 10:11:15', '2023-06-19 10:11:15', NULL),
(2107, 'fr', 'invite_friends', 'Invite Friends', '2023-06-19 10:11:15', '2023-06-19 10:11:15', NULL),
(2108, 'fr', 'open_ai_settings', 'Open AI Settings', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2109, 'fr', 'default_creativity_level', 'Default Creativity Level', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2110, 'fr', 'default_tone_of_output_result', 'Default Tone Of Output Result', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2111, 'fr', 'default_number_of_results', 'Default Number Of Results', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2112, 'fr', 'default_max_result_length', 'Default Max Result Length', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2113, 'fr', 'insert_1_to_make_it_unlimited', 'Insert -1 to make it unlimited', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2114, 'fr', 'bad_words', 'Bad Words', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2115, 'fr', 'these_words_will_be_filtered_from_user_inputs_while_generating_contents', 'These words will be filtered from user inputs while generating contents', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2116, 'fr', 'comma_separated_one_two', 'Comma Separated: One, Two', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2117, 'fr', 'default_ai_model', 'Default AI Model', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2118, 'fr', 'open_ai_secret_key', 'Open AI Secret Key', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2119, 'fr', 'save_configuration', 'Save Configuration', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2120, 'fr', 'configure_general_settings', 'Configure General Settings', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2121, 'fr', 'general_information', 'General Information', '2023-06-19 10:14:14', '2023-06-19 10:14:14', NULL),
(2122, 'fr', 'currencies', 'Currencies', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2123, 'fr', 'symbol', 'Symbol', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2124, 'fr', 'code', 'Code', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2125, 'fr', 'alignment', 'Alignment', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2126, 'fr', '1_usd__', '1 USD = ?', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2127, 'fr', 'active', 'Active', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2128, 'fr', 'symbolamount', '[symbol][amount]', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2129, 'fr', 'amountsymbol', '[amount][symbol]', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2130, 'fr', 'add_new_currency', 'Add New Currency', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2131, 'fr', 'currency_name', 'Currency Name', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2132, 'fr', 'type_currency_name', 'Type currency name', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2133, 'fr', 'currency_symbol', 'Currency Symbol', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2134, 'fr', 'type_symbol', 'Type symbol', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2135, 'fr', 'currency_code', 'Currency Code', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2136, 'fr', 'type_code', 'Type code', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2137, 'fr', 'symbol_amount', '[symbol] [amount]', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2138, 'fr', 'amount_symbol', '[amount] [symbol]', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2139, 'fr', 'save_currency', 'Save Currency', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2140, 'fr', 'set_default_currency', 'Set Default Currency', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2141, 'fr', 'default_currency', 'Default Currency', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2142, 'fr', 'no_of_decimals', 'No of Decimals', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2143, 'fr', 'disable', 'Disable', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2144, 'fr', 'price_format', 'Price Format', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2145, 'fr', 'show_full_price_1000000', 'Show Full Price (1000000)', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2146, 'fr', 'truncate_price_1m1b', 'Truncate Price (1M/1B)', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2147, 'fr', 'save_configurations', 'Save Configurations', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2148, 'fr', 'currency_information', 'Currency Information', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2149, 'fr', 'all_currencies', 'All Currencies', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2150, 'fr', 'currency_configurations', 'Currency Configurations', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2151, 'fr', 'status_updated_successfully', 'Status updated successfully', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2152, 'fr', 'default_currency_can_not_be_disabled', 'Default currency can not be disabled', '2023-06-19 10:14:47', '2023-06-19 10:14:47', NULL),
(2153, 'fr', 'languages', 'Languages', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2154, 'fr', 'iso_6391_code', 'ISO 639-1 Code', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2155, 'fr', 'localizations', 'Localizations', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2156, 'fr', 'add_new_language', 'Add New Language', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2157, 'fr', 'language_name', 'Language Name', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2158, 'fr', 'type_language_name', 'Type language name', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2159, 'fr', 'enbn', 'en/bn', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2160, 'fr', 'flag', 'Flag', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2161, 'fr', 'rtl', 'RTL', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2162, 'fr', 'save_language', 'Save Language', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2163, 'fr', 'set_default_language', 'Set Default Language', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2164, 'fr', 'default_language', 'Default Language', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2165, 'fr', 'language_information', 'Language Information', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2166, 'fr', 'all_languages', 'All Languages', '2023-06-19 10:14:51', '2023-06-19 10:14:51', NULL),
(2167, 'fr', 'lang_key', 'Lang Key', '2023-06-19 10:15:02', '2023-06-19 10:15:02', NULL),
(2168, 'fr', 'type_localization_here', 'Type localization here', '2023-06-19 10:15:02', '2023-06-19 10:15:02', NULL),
(2169, 'fr', 'copy_localizations', 'Copy Localizations', '2023-06-19 10:15:02', '2023-06-19 10:15:02', NULL),
(2170, 'fr', 'save', 'Save', '2023-06-19 10:15:02', '2023-06-19 10:15:02', NULL),
(2171, 'fr', 'update_language', 'Update Language', '2023-06-19 10:15:13', '2023-06-19 10:15:13', NULL),
(2172, 'fr', 'update', 'Update', '2023-06-19 10:15:13', '2023-06-19 10:15:13', NULL),
(2173, 'fr', 'send_bulk_emails', 'Send Bulk Emails', '2023-06-19 10:15:51', '2023-06-19 10:15:51', NULL),
(2174, 'fr', 'select_users', 'Select Users', '2023-06-19 10:15:51', '2023-06-19 10:15:51', NULL),
(2175, 'fr', 'select_subscribers', 'Select Subscribers', '2023-06-19 10:15:51', '2023-06-19 10:15:51', NULL),
(2176, 'fr', 'email_subject', 'Email Subject', '2023-06-19 10:15:51', '2023-06-19 10:15:51', NULL),
(2177, 'fr', 'email_body', 'Email Body', '2023-06-19 10:15:51', '2023-06-19 10:15:51', NULL),
(2178, 'fr', 'send_emails', 'Send Emails', '2023-06-19 10:15:51', '2023-06-19 10:15:51', NULL),
(2179, 'fr', 'start_date__end_date', 'Start date - End date', '2023-06-19 10:16:00', '2023-06-19 10:16:00', NULL),
(2180, 'fr', 'price', 'Price', '2023-06-19 10:16:07', '2023-06-19 10:16:07', NULL),
(2181, 'fr', 'start_date', 'Start Date', '2023-06-19 10:16:07', '2023-06-19 10:16:07', NULL),
(2182, 'fr', 'expire_date', 'Expire Date', '2023-06-19 10:16:07', '2023-06-19 10:16:07', NULL),
(2183, 'fr', 'selected_package_type', 'Selected package type', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2184, 'fr', 'allow_ai_chat', 'Allow AI Chat', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2185, 'fr', 'allow_ai_images', 'Allow AI Images', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2186, 'fr', 'allow_ai_code', 'Allow AI Code', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2187, 'fr', 'is_featured', 'Is Featured?', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2188, 'fr', 'select_open_ai_model', 'Select Open AI Model', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2189, 'fr', 'show', 'Show?', '2023-06-19 10:16:10', '2023-06-19 10:16:10', NULL),
(2190, 'fr', 'type_additional_features', 'Type additional features', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2191, 'fr', 'comma_separated_feature_afeature_b', 'Comma separated: Feature A,Feature B', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2192, 'fr', 'is_active', 'Is Active?', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2193, 'fr', 'if_active_this_will_be_applied_to_new_users_registration', 'If active, this will be applied to new user\'s registration.', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2194, 'fr', 'set_0_to_make_it_free', 'Set $0 to make it free', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2195, 'fr', 'templates_updated_successfully', 'Templates updated successfully', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2196, 'fr', 'package_created_successfully', 'Package created successfully', '2023-06-19 10:16:11', '2023-06-19 10:16:11', NULL),
(2197, 'fr', 'affiliate_configurations', 'Affiliate Configurations', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2198, 'fr', 'affiliate_commission_', 'Affiliate Commission %', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2199, 'fr', 'type_affiliate_commission_', 'Type affiliate commission %', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2200, 'fr', 'minimum_withdrawal_amount', 'Minimum Withdrawal Amount', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2201, 'fr', 'type_minimum_withdrawal_amount', 'Type minimum withdrawal amount', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2202, 'fr', 'allow_commission_continuously', 'Allow Commission Continuously', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2203, 'fr', 'enable', 'Enable', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2204, 'fr', 'if_enabled_user_will_get_commission_for_each_subscriptions_of_referred_user_otherwise_only_for_the_first_subscription', 'If enabled, user will get commission for each subscriptions of referred user. Otherwise only for the first subscription.', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2205, 'fr', 'payout_payment_methods', 'Payout Payment Methods', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2206, 'fr', 'select_payout_payment_methods', 'Select payout payment methods', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2207, 'fr', 'bank_payment', 'Bank Payment', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2208, 'fr', 'enable_affiliate_system', 'Enable Affiliate System', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2209, 'fr', 'configure_affiliate_settings', 'Configure Affiliate Settings', '2023-06-19 10:16:33', '2023-06-19 10:16:33', NULL),
(2210, 'fr', 'last_7_days', 'Last 7 days', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2211, 'fr', 'total_words_generated', 'Total words generated', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2212, 'fr', 'total_image_generated', 'Total Image generated', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2213, 'fr', 'total_code_generated', 'Total code generated', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2214, 'fr', 'total_spech_to_text', 'Total spech to text', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2215, 'fr', 'last_30_days', 'Last 30 days', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2216, 'fr', 'last_3_months', 'Last 3 months', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2217, 'fr', 'top_5_templates', 'Top 5 Templates', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2218, 'fr', 'recent_projects', 'Recent Projects', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2219, 'fr', 'project_name', 'Project Name', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2220, 'fr', 'created_date', 'Created Date', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2221, 'fr', 'type', 'Type', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2222, 'fr', 'wordssize', 'Words/Size', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2223, 'fr', 'view_contents', 'View Contents', '2023-06-19 10:16:50', '2023-06-19 10:16:50', NULL),
(2224, 'fr', 'no_conversation_found', 'No conversation found', '2023-06-19 10:17:12', '2023-06-19 10:17:12', NULL),
(2225, 'fr', 'open_a_new_conversation_to_chat_with_ai', 'Open a new conversation to chat with Ai', '2023-06-19 10:17:12', '2023-06-19 10:17:12', NULL),
(2226, 'fr', 'blog_section', 'Blog Section', '2023-06-19 10:17:21', '2023-06-19 10:17:21', NULL),
(2227, 'fr', 'title_of_the_blog', 'Title of the blog', '2023-06-19 10:17:21', '2023-06-19 10:17:21', NULL),
(2228, 'fr', 'eg_best_restaurants_in_la_to_eat_indian_foods', 'e.g. best restaurants in LA to eat indian foods', '2023-06-19 10:17:21', '2023-06-19 10:17:21', NULL),
(2229, 'fr', 'what_are_the_main_points_you_want_to_cover', 'What are the main points you want to cover?', '2023-06-19 10:17:21', '2023-06-19 10:17:21', NULL),
(2230, 'fr', 'eg_dosa_biriyani_tandoori_chicken', 'e.g. dosa, biriyani, tandoori chicken', '2023-06-19 10:17:21', '2023-06-19 10:17:21', NULL),
(2231, 'fr', 'type_title', 'Type Title', '2023-06-19 10:17:31', '2023-06-19 10:17:31', NULL),
(2232, 'fr', 'type_code_title', 'Type code title', '2023-06-19 10:17:31', '2023-06-19 10:17:31', NULL),
(2233, 'fr', 'type_description', 'Type Description', '2023-06-19 10:17:31', '2023-06-19 10:17:31', NULL),
(2234, 'fr', 'generate_a_javascript_function_to_add_2_numbers_and_return_their_sum', 'Generate a javascript function to add 2 numbers and return their sum', '2023-06-19 10:17:31', '2023-06-19 10:17:31', NULL),
(2235, 'fr', 'your_code_will_appear_here', 'Your code will appear here', '2023-06-19 10:17:31', '2023-06-19 10:17:31', NULL),
(2236, 'fr', 'login__registration', 'Login & Registration', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2237, 'fr', 'customer_registration', 'Customer Registration', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2238, 'fr', 'email_required', 'Email Required', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2239, 'fr', 'email__phone_both_required', 'Email & Phone Both Required', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2240, 'fr', 'registration_verification', 'Registration Verification', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2241, 'fr', 'email_verification', 'Email Verification', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2242, 'fr', 'otp_verification', 'OTP Verification', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2243, 'fr', 'leftbar_title', 'Leftbar Title', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2244, 'fr', 'leftbar_colored_title', 'Leftbar Colored Title', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2245, 'fr', 'rightbar_title', 'Rightbar Title', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2246, 'fr', 'rightbar_subtitle', 'Rightbar Subtitle', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2247, 'fr', 'google_recaptcha_v3', 'Google Recaptcha V3', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2248, 'fr', 'recaptcha_site_key', 'Recaptcha Site Key', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2249, 'fr', 'recaptcha_secret_key', 'Recaptcha Secret Key', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2250, 'fr', 'enable_recaptcha', 'Enable Recaptcha', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2251, 'fr', 'google_recaptcha', 'Google Recaptcha', '2023-06-19 10:19:15', '2023-06-19 10:19:15', NULL),
(2252, 'fr', 'twilio_credentials', 'Twilio Credentials', '2023-06-19 10:19:25', '2023-06-19 10:19:25', NULL),
(2253, 'fr', 'twilio_sid', 'Twilio SID', '2023-06-19 10:19:25', '2023-06-19 10:19:25', NULL),
(2254, 'fr', 'twilio_auth_token', 'Twilio Auth Token', '2023-06-19 10:19:25', '2023-06-19 10:19:25', NULL),
(2255, 'fr', 'valid_twilo_number', 'Valid Twilo Number', '2023-06-19 10:19:26', '2023-06-19 10:19:26', NULL),
(2256, 'fr', 'active_sms_gateway', 'Active SMS Gateway', '2023-06-19 10:19:26', '2023-06-19 10:19:26', NULL),
(2257, 'fr', 'select_sms_gateway', 'Select SMS gateway', '2023-06-19 10:19:26', '2023-06-19 10:19:26', NULL),
(2258, 'fr', 'twilio', 'Twilio', '2023-06-19 10:19:26', '2023-06-19 10:19:26', NULL),
(2259, 'fr', 'please_login_to_continue', 'Please login to continue', '2023-06-19 10:19:29', '2023-06-19 10:19:29', NULL),
(2260, 'fr', 'smtp_configuration', 'SMTP Configuration', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2261, 'fr', 'sendmail', 'Sendmail', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2262, 'fr', 'smtp', 'SMTP', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2263, 'fr', 'mail_host', 'Mail Host', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2264, 'fr', 'type_mail_host', 'Type mail host', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2265, 'fr', 'mail_port', 'Mail Port', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2266, 'fr', 'type_mail_port', 'Type mail port', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2267, 'fr', 'mail_username', 'Mail Username', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2268, 'fr', 'type_mail_username', 'Type mail username', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2269, 'fr', 'mail_password', 'Mail Password', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2270, 'fr', 'type_mail_password', 'Type mail password', '2023-06-19 10:19:32', '2023-06-19 10:19:32', NULL),
(2271, 'fr', 'mail_encryption', 'Mail Encryption', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2272, 'fr', 'type_mail_encryption', 'Type mail encryption', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2273, 'fr', 'mail_from_address', 'Mail From Address', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2274, 'fr', 'type_mail_from_address', 'Type mail from address', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2275, 'fr', 'mail_from_name', 'Mail From Name', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2276, 'fr', 'type_mail_from_name', 'Type mail from name', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2277, 'fr', 'configure_smtp', 'Configure SMTP', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2278, 'fr', 'smtp_information', 'SMTP Information', '2023-06-19 10:19:33', '2023-06-19 10:19:33', NULL),
(2279, 'fr', 'general_informations', 'General Informations', '2023-06-19 10:19:36', '2023-06-19 10:19:36', NULL),
(2280, 'fr', 'system_title', 'System Title', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2281, 'fr', 'browser_tab_title_separator', 'Browser Tab Title Separator', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2282, 'fr', 'contact_email', 'Contact Email', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2283, 'fr', 'contact_phone', 'Contact Phone', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2284, 'fr', 'dashboard_logo__favicon', 'Dashboard Logo & Favicon', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2285, 'fr', 'dashboard_logo', 'Dashboard Logo', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2286, 'fr', 'choose_dashboard_logo', 'Choose Dashboard Logo', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2287, 'fr', 'favicon', 'Favicon', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2288, 'fr', 'choose_favicon', 'Choose Favicon', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2289, 'fr', 'maintenance_mode', 'Maintenance Mode', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2290, 'fr', 'enable_maintenance_mode', 'Enable Maintenance Mode', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2291, 'fr', 'set_maintenance_mode', 'Set maintenance mode', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2292, 'fr', 'seo_meta_configuration', 'SEO Meta Configuration', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2293, 'fr', 'meta_title', 'Meta Title', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2294, 'fr', 'type_meta_title', 'Type meta title', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2295, 'fr', 'set_a_meta_tag_title_recommended_to_be_simple_and_unique', 'Set a meta tag title. Recommended to be simple and unique.', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2296, 'fr', 'meta_description', 'Meta Description', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2297, 'fr', 'type_your_meta_description', 'Type your meta description', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2298, 'fr', 'meta_keywords', 'Meta Keywords', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2299, 'fr', 'meta_image', 'Meta Image', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2300, 'fr', 'choose_meta_image', 'Choose Meta Image', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2301, 'fr', 'cookie_consent', 'Cookie Consent', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2302, 'fr', 'show_cookie_consent', 'Show Cookie Consent', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2303, 'fr', 'select_an_option', 'Select an option', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2304, 'fr', 'cookie_consent_text', 'Cookie Consent Text', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2305, 'fr', 'dashborad_logo__favicon', 'Dashborad Logo & Favicon', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2306, 'fr', 'seo_configuration', 'SEO Configuration', '2023-06-19 10:19:37', '2023-06-19 10:19:37', NULL),
(2307, 'fr', 'payment_methods_settings', 'Payment Methods Settings', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2308, 'fr', 'paypal_credentials', 'Paypal Credentials', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2309, 'fr', 'paypal_client_id', 'Paypal Client ID', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2310, 'fr', 'paypal_client_secret', 'Paypal Client Secret', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2311, 'fr', 'enable_paypal', 'Enable Paypal', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2312, 'fr', 'enable_test_sandbox_mode', 'Enable Test Sandbox Mode', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2313, 'fr', 'stripe_credentials', 'Stripe Credentials', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2314, 'fr', 'stripe_key', 'Stripe Key', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2315, 'fr', 'stripe_secret', 'Stripe Secret', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2316, 'fr', 'enable_stripe', 'Enable Stripe', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2317, 'fr', 'paytm_credentials', 'PayTm Credentials', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2318, 'fr', 'paytm_environment', 'PayTm Environment', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2319, 'fr', 'paytm_merchant_id', 'PayTm Merchant ID', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2320, 'fr', 'paytm_merchant_key', 'PayTm Merchant Key', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2321, 'fr', 'paytm_merchant_website', 'PayTm Merchant Website', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2322, 'fr', 'paytm_channel', 'PayTm Channel', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL);
INSERT INTO `localizations` (`id`, `lang_key`, `t_key`, `t_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2323, 'fr', 'paytm_industry_type', 'PayTm Industry Type', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2324, 'fr', 'enable_paytm', 'Enable PayTm', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2325, 'fr', 'razorpay_credentials', 'Razorpay Credentials', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2326, 'fr', 'razorpay_key', 'Razorpay Key', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2327, 'fr', 'razorpay_secret', 'Razorpay Secret', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2328, 'fr', 'enable_razorpay', 'Enable Razorpay', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2329, 'fr', 'iyzico_credentials', 'IyZico Credentials', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2330, 'fr', 'iyzico_api_key', 'IyZico API Key', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2331, 'fr', 'iyzico_secret_key', 'IyZico Secret Key', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2332, 'fr', 'enable_iyzico', 'Enable IyZico', '2023-06-19 10:19:51', '2023-06-19 10:19:51', NULL),
(2333, 'fr', 'social_login_configurations', 'Social Login Configurations', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2334, 'fr', 'google_login', 'Google Login', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2335, 'fr', 'google_client_id', 'Google Client ID', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2336, 'fr', 'google_client_secret', 'Google Client Secret', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2337, 'fr', 'facebook_login', 'Facebook Login', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2338, 'fr', 'facebook_app_id', 'Facebook App ID', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2339, 'fr', 'facebook_app_secret', 'Facebook App Secret', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2340, 'fr', 'faccebook_login', 'Faccebook Login', '2023-06-19 10:20:15', '2023-06-19 10:20:15', NULL),
(2341, 'fr', 'default_language_updated_successfully', 'Default language updated successfully', '2023-06-19 10:20:41', '2023-06-19 10:20:41', NULL),
(2342, 'vn', 'default_language_updated_successfully', 'Default language updated successfully', '2023-06-19 10:20:44', '2023-06-19 10:20:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_managers`
--

CREATE TABLE `media_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `media_file` longtext DEFAULT NULL,
  `media_size` int(11) DEFAULT NULL,
  `media_type` varchar(191) DEFAULT NULL COMMENT 'video / image / pdf / ...',
  `media_name` text DEFAULT NULL,
  `media_extension` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media_managers`
--

INSERT INTO `media_managers` (`id`, `user_id`, `media_file`, `media_size`, `media_type`, `media_name`, `media_extension`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'uploads/media/aJ7wAo70bSOXLSXTvI4hhtBBSYpusjHSrKuGO0L7.png', 124065, 'image', 'bg-gradient.png', 'png', '2023-05-29 12:33:17', '2023-05-29 12:33:17', NULL),
(2, 1, 'uploads/media/WLWgVML58lHjPWtis3H1MSsCAy6LWuo1ZzPbBYcE.png', 205461, 'image', 'copy-publish.png', 'png', '2023-05-29 12:33:18', '2023-05-29 12:33:18', NULL),
(3, 1, 'uploads/media/OnAXEv6O8iK2S0SOvwrcK6gIevuH2Eg2xLXgQJ3g.jpg', 221760, 'image', 'feature-3.jpg', 'jpg', '2023-05-29 12:33:18', '2023-05-29 12:33:18', NULL),
(4, 1, 'uploads/media/JlMry90Z6zwsOssK0pLIDFmVKGxlxJ4zy4sxxEw8.jpg', 313808, 'image', 'feature-2.jpg', 'jpg', '2023-05-29 12:33:18', '2023-05-29 12:33:18', NULL),
(5, 1, 'uploads/media/g9DOLLnCDzgFjP5FMbCOcLg23Wh2T5S0DSqKjhh6.jpg', 282897, 'image', 'feature-1.jpg', 'jpg', '2023-05-29 12:33:18', '2023-05-29 12:33:18', NULL),
(6, 1, 'uploads/media/sNkOGJkxjsX53ITIdFp4m5CrgcOkwVnIHx9mVHe2.jpg', 286529, 'image', 'feature-4.jpg', 'jpg', '2023-05-29 12:33:18', '2023-05-29 12:33:18', NULL),
(7, 1, 'uploads/media/lOF5TPvuGPcU0HBFb4vyvE11lvXufZemYwZBSgPq.jpg', 458111, 'image', 'feature-top-2.jpg', 'jpg', '2023-05-29 12:33:19', '2023-05-29 12:33:19', NULL),
(8, 1, 'uploads/media/Kvvt9vH6u55udSDVevRdPjvRlTXLrSTjKTfORIrs.png', 264611, 'image', 'hero-img.png', 'png', '2023-05-29 12:33:19', '2023-05-29 12:33:19', NULL),
(9, 1, 'uploads/media/gDOTo2s8VY2P01XXBxQnvu61K5MlbuOcQ2DME2Za.png', 39931, 'image', 'hero-robot.png', 'png', '2023-05-29 12:33:19', '2023-05-29 12:33:19', NULL),
(10, 1, 'uploads/media/eQuDX4Xoxaopqzak7tXBZ12vw208b4ZU1DknerAE.png', 142328, 'image', 'select-advance-option.png', 'png', '2023-05-29 12:33:19', '2023-05-29 12:33:19', NULL),
(11, 1, 'uploads/media/eCu54yrdjXTNBt9IEdjnnkGjHOGD1xiXZJcDp6MK.png', 166740, 'image', 'select-template.png', 'png', '2023-05-29 12:33:19', '2023-05-29 12:33:19', NULL),
(12, 1, 'uploads/media/VHLlVTJb3sfnMtm5yCBo3vwBqqwVaKYeIeKdA9Mk.png', 173138, 'image', 'write-prompt.png', 'png', '2023-05-29 12:33:19', '2023-05-29 12:33:19', NULL),
(13, 1, 'uploads/media/tLTQLIFlP0I9v0lA1MYX5RlZfsDXxjQSbQSZ7cU0.png', 4319, 'image', 'favicon.png', 'png', '2023-05-29 12:34:25', '2023-05-29 12:34:25', NULL),
(14, 1, 'uploads/media/bwZeX0SwgEwevLfO0yCGNAvxkFq8vdlVAt6swLQX.png', 2496, 'image', 'logo-color.png', 'png', '2023-05-29 12:34:25', '2023-05-29 12:34:25', NULL),
(15, 1, 'uploads/media/TmrQOAsKTfTmPBmyJ4p5AvxWy4Ff76PLdP5O5Cd0.png', 2399, 'image', 'logo-white.png', 'png', '2023-05-29 12:34:25', '2023-05-29 12:34:25', NULL),
(16, 1, 'uploads/media/aUtenzo6i8hhJxcHl0n69ZFTZd0j10T9wcxXCt5C.png', 794, 'image', 'logo-icon.png', 'png', '2023-05-29 12:36:10', '2023-05-29 12:36:10', NULL),
(17, 1, 'uploads/media/PeegEpyC8yJKOncHmcFHO0FzZZflFp0vuM0lbXy3.png', 1650, 'image', 'logo.png', 'png', '2023-05-29 12:36:10', '2023-05-29 12:36:10', NULL),
(18, 1, 'uploads/media/lxkdLUhhClW2gS7lnGB2o0orGb9UwSn3bdvffnmF.png', 3100, 'image', 'brand-4.png', 'png', '2023-05-29 13:01:13', '2023-05-29 13:01:13', NULL),
(19, 1, 'uploads/media/88fdY65pfvVX8ikbEHJ96uaVm0XVbXQNAQugzEem.png', 2982, 'image', 'brand-3.png', 'png', '2023-05-29 13:01:13', '2023-05-29 13:01:13', NULL),
(20, 1, 'uploads/media/fp9a6rz9m8Up4sWGYOvUhnTdQPY6jRkt396xA48F.png', 3119, 'image', 'brand-5.png', 'png', '2023-05-29 13:01:13', '2023-05-29 13:01:13', NULL),
(21, 1, 'uploads/media/mlvcdXpf4UMUUwPW2PvF0YILNVz7ign3Xex0sBTb.png', 2898, 'image', 'brand-1.png', 'png', '2023-05-29 13:01:13', '2023-05-29 13:01:13', NULL),
(22, 1, 'uploads/media/sdv4Y3czchHd6E64HH0vp3T1BiCHkY9MJwkiFuj9.png', 3023, 'image', 'brand-2.png', 'png', '2023-05-29 13:01:13', '2023-05-29 13:01:13', NULL),
(23, 1, 'uploads/media/LrcRjOJv1gVlTHeWB61Y9ONBsYqmunc6dP1GdJqp.png', 2491, 'image', 'brand-7.png', 'png', '2023-05-29 13:01:14', '2023-05-29 13:01:14', NULL),
(24, 1, 'uploads/media/hLdXSlU2o9xtOgRvbjIb1eaSlynZJeFBLMnHuwdb.png', 2592, 'image', 'brand-8.png', 'png', '2023-05-29 13:01:14', '2023-05-29 13:01:14', NULL),
(25, 1, 'uploads/media/wBLJC29tMJ8SWRpx15XtZukHCjV7GY7I6rx4X7Ep.png', 3732, 'image', 'brand-6.png', 'png', '2023-05-29 13:01:14', '2023-05-29 13:01:14', NULL),
(26, 1, 'uploads/media/xwezZUvaxRS9pjH6mI6MfNznDTToN6bqQyrVaPnH.png', 2233, 'image', 'brand-9.png', 'png', '2023-05-29 13:01:14', '2023-05-29 13:01:14', NULL),
(27, 1, 'uploads/media/KL5lx1UypJXI4mmV7FeblDIUpMyH1PzIrnNKVDuZ.jpg', 6325, 'image', '3.jpg', 'jpg', '2023-05-29 13:49:35', '2023-05-29 13:49:35', NULL),
(28, 1, 'uploads/media/TDnetBh0y5ppwaYd2hfILXwXih0XaHXecGTlKtGq.jpg', 6587, 'image', '2.jpg', 'jpg', '2023-05-29 13:49:35', '2023-05-29 13:49:35', NULL),
(29, 1, 'uploads/media/dX6Ci8opVohOjE7axAH4QcC3BSNu0qRiqQH86NBz.jpg', 8310, 'image', '5.jpg', 'jpg', '2023-05-29 13:49:35', '2023-05-29 13:49:35', NULL),
(30, 1, 'uploads/media/Gk34IvkoLgo0x4BNJLYH6qKyCWnwwBe3TyCWeyBG.jpg', 8250, 'image', '4.jpg', 'jpg', '2023-05-29 13:49:35', '2023-05-29 13:49:35', NULL),
(31, 1, 'uploads/media/O5GvAe2XxpInTfRZrEWjPITIQTMdIkCtZAJPBTNo.jpg', 6851, 'image', '6.jpg', 'jpg', '2023-05-29 13:49:35', '2023-05-29 13:49:35', NULL),
(32, 2, 'uploads/media/EAuMFug7lSa1oxXB5kT66fTsTlOysXfCt6pjrawR.jpg', 8250, 'image', '4.jpg', 'jpg', '2023-05-29 17:46:20', '2023-05-29 17:46:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_31_050025_create_languages_table', 1),
(6, '2022_10_31_050126_create_localizations_table', 1),
(7, '2022_11_07_061318_create_tags_table', 1),
(8, '2022_11_07_064323_create_blog_categories_table', 1),
(9, '2022_11_07_085058_create_blogs_table', 1),
(10, '2022_11_07_085227_create_blog_localizations_table', 1),
(11, '2022_11_07_105203_create_blog_tags_table', 1),
(12, '2022_11_09_050229_create_currencies_table', 1),
(13, '2022_11_12_044845_create_system_settings_table', 1),
(14, '2022_11_16_094759_create_subscribed_users_table', 1),
(15, '2022_11_20_085351_create_pages_table', 1),
(16, '2022_11_20_085638_create_page_localizations_table', 1),
(17, '2022_11_27_080124_create_permission_tables', 1),
(18, '2022_12_13_051944_create_media_managers_table', 1),
(19, '2023_04_17_042610_create_subscription_packages_table', 1),
(20, '2023_04_17_054102_create_subscription_package_templates_table', 1),
(21, '2023_04_17_054442_create_open_ai_models_table', 1),
(22, '2023_04_17_064710_create_template_groups_table', 1),
(23, '2023_04_17_064720_create_templates_table', 1),
(24, '2023_04_17_064727_create_template_usages_table', 1),
(25, '2023_04_17_085249_create_prompts_table', 1),
(26, '2023_04_17_093903_create_projects_table', 1),
(27, '2023_04_17_102312_create_folders_table', 1),
(28, '2023_04_19_055241_create_subscription_histories_table', 1),
(29, '2023_05_16_131036_create_favorite_templates_table', 1),
(30, '2023_05_26_121658_create_faqs_table', 1),
(31, '2023_05_27_093725_create_contact_us_messages_table', 1),
(32, '2023_05_31_054841_create_affiliate_earnings_table', 2),
(33, '2023_05_31_055019_create_affiliate_payments_table', 2),
(34, '2023_05_31_055103_create_affiliate_payout_accounts_table', 2),
(35, '2023_06_05_094934_create_custom_templates_table', 3),
(36, '2023_06_05_095225_create_custom_template_categories_table', 3),
(37, '2023_06_13_085132_create_ai_chat_categories_table', 4),
(38, '2023_06_13_085649_create_ai_chats_table', 4),
(39, '2023_06_13_085806_create_ai_chat_messages_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `open_ai_models`
--

CREATE TABLE `open_ai_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `open_ai_models`
--

INSERT INTO `open_ai_models` (`id`, `name`, `key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ada (The Fastest but Simplest)', 'text-ada-001', NULL, NULL, NULL),
(2, 'Babbage (Average)', 'text-babbage-001', NULL, NULL, NULL),
(3, 'Curie (Good)', 'text-curie-001', NULL, NULL, NULL),
(4, 'Davinci (Powerful but Most Expensive)', 'text-davinci-001', NULL, NULL, NULL),
(5, 'ChatGPT 3.5', 'gpt-3.5-turbo', NULL, NULL, NULL),
(6, 'ChatGPT 4 (Beta)', 'gpt-4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms & Conditions', 'terms-conditions', '<div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\"><span style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px; background-color: var(--bs-body-bg); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Welcome to ThemeTags!</span><br></h2><p style=\"\">These terms and conditions outline the rules and regulations for the use of Themetags\'s Website, located at https://themetags.com/.</p><p style=\"\">By accessing this website we assume you accept these terms and conditions. Do not continue to use ThemeTags if you do not agree to take all of the terms and conditions stated on this page.</p><p class=\"mb-0\" style=\"\">The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Cookies</h2><p>We employ the use of cookies. By accessing ThemeTags, you agreed to use cookies in agreement with the Themetags\'s Privacy Policy.</p><p class=\"mb-0\">Most interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">License</h2><p>Unless otherwise stated, Themetags and/or its licensors own the intellectual property rights for all material on ThemeTags. All intellectual property rights are reserved. You may access this from ThemeTags for your own personal use subjected to restrictions set in these terms and conditions.</p><p>You must not:</p><ul class=\"mb-3\"><li>Republish material from ThemeTags</li><li>Sell, rent or sub-license material from ThemeTags</li><li>Reproduce, duplicate or copy material from ThemeTags</li><li>Redistribute content from ThemeTags</li></ul><p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Themetags does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Themetags,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Themetags shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p><p>Themetags reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p><p>You warrant and represent that:</p><ul class=\"mb-3\"><li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li><li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li><li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li><li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li></ul><p class=\"mb-0\">You hereby grant Themetags a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Hyperlinking to our Content</h2><p>The following organizations may link to our Website without prior written approval:</p><ul class=\"mb-3\"><li>Government agencies;</li><li>Search engines;</li><li>News organizations;</li><li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li><li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li></ul><p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\'s site.</p><p>We may consider and approve other link requests from the following types of organizations:</p><ul class=\"mb-3\"><li>commonly-known consumer and/or business information sources;</li><li>dot.com community sites;</li><li>associations or other groups representing charities;</li><li>online directory distributors;</li><li>internet portals;</li><li>accounting, law and consulting firms; and</li><li>educational institutions and trade associations.</li></ul><p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Themetags; and (d) the link is in the context of general resource information.</p><p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party\'s site.</p><p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Themetags. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p><p>Approved organizations may hyperlink to our Website as follows:</p><ul class=\"mb-3\"><li>By use of our corporate name; or</li><li>By use of the uniform resource locator being linked to; or</li><li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.</li></ul><p>No use of Themetags\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">iFrames</h2><p class=\"mb-0\">Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Content Liability</h2><p class=\"mb-0\">We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Your Privacy</h2><p class=\"mb-0\">Please read Privacy Policy</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Reservation of Rights</h2><p class=\"mb-0\">We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\'s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Removal of links from our website</h2><p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p><p class=\"mb-0\">We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p></div><div class=\"content-group\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Disclaimer</h2><p style=\"\">To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p><ul style=\"\"><li>limit or exclude our or your liability for death or personal injury;</li><li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li><li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li><li>exclude any of our or your liabilities that may not be excluded under applicable law.</li></ul><p style=\"\">The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p><p class=\"mb-0\" style=\"\">As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p></div>', 'Quis ab ut officia b', '30', 'Explicabo Consectet', '2023-02-16 11:28:22', '2023-03-01 10:18:38', NULL),
(2, 'test', 'test', NULL, NULL, NULL, NULL, '2023-06-17 14:37:36', '2023-06-17 14:37:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_localizations`
--

CREATE TABLE `page_localizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `lang_key` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page_localizations`
--

INSERT INTO `page_localizations` (`id`, `page_id`, `title`, `content`, `lang_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Terms & Conditions', '<div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\"><span style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px; background-color: var(--bs-body-bg); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Welcome to ThemeTags!</span><br></h2><p style=\"\">These terms and conditions outline the rules and regulations for the use of Themetags\'s Website, located at https://themetags.com/.</p><p style=\"\">By accessing this website we assume you accept these terms and conditions. Do not continue to use ThemeTags if you do not agree to take all of the terms and conditions stated on this page.</p><p class=\"mb-0\" style=\"\">The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Cookies</h2><p>We employ the use of cookies. By accessing ThemeTags, you agreed to use cookies in agreement with the Themetags\'s Privacy Policy.</p><p class=\"mb-0\">Most interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">License</h2><p>Unless otherwise stated, Themetags and/or its licensors own the intellectual property rights for all material on ThemeTags. All intellectual property rights are reserved. You may access this from ThemeTags for your own personal use subjected to restrictions set in these terms and conditions.</p><p>You must not:</p><ul class=\"mb-3\"><li>Republish material from ThemeTags</li><li>Sell, rent or sub-license material from ThemeTags</li><li>Reproduce, duplicate or copy material from ThemeTags</li><li>Redistribute content from ThemeTags</li></ul><p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Themetags does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Themetags,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Themetags shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p><p>Themetags reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p><p>You warrant and represent that:</p><ul class=\"mb-3\"><li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li><li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li><li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li><li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li></ul><p class=\"mb-0\">You hereby grant Themetags a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Hyperlinking to our Content</h2><p>The following organizations may link to our Website without prior written approval:</p><ul class=\"mb-3\"><li>Government agencies;</li><li>Search engines;</li><li>News organizations;</li><li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li><li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li></ul><p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\'s site.</p><p>We may consider and approve other link requests from the following types of organizations:</p><ul class=\"mb-3\"><li>commonly-known consumer and/or business information sources;</li><li>dot.com community sites;</li><li>associations or other groups representing charities;</li><li>online directory distributors;</li><li>internet portals;</li><li>accounting, law and consulting firms; and</li><li>educational institutions and trade associations.</li></ul><p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Themetags; and (d) the link is in the context of general resource information.</p><p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party\'s site.</p><p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Themetags. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p><p>Approved organizations may hyperlink to our Website as follows:</p><ul class=\"mb-3\"><li>By use of our corporate name; or</li><li>By use of the uniform resource locator being linked to; or</li><li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.</li></ul><p>No use of Themetags\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">iFrames</h2><p class=\"mb-0\">Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Content Liability</h2><p class=\"mb-0\">We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Your Privacy</h2><p class=\"mb-0\">Please read Privacy Policy</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Reservation of Rights</h2><p class=\"mb-0\">We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\'s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p></div><div class=\"mb-5\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Removal of links from our website</h2><p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p><p class=\"mb-0\">We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p></div><div class=\"content-group\" style=\"color: rgb(71, 85, 105); font-family: Jost, sans-serif; font-size: 15.008px;\"><h2 class=\"h5\" style=\"font-family: Rubik, sans-serif; font-weight: 500; color: rgb(51, 65, 85); font-size: 1.1725rem;\">Disclaimer</h2><p style=\"\">To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p><ul style=\"\"><li>limit or exclude our or your liability for death or personal injury;</li><li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li><li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li><li>exclude any of our or your liabilities that may not be excluded under applicable law.</li></ul><p style=\"\">The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p><p class=\"mb-0\" style=\"\">As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p></div>', 'en', '2023-02-16 11:28:22', '2023-03-01 10:18:38', NULL),
(2, 2, 'test', NULL, 'en', '2023-06-17 14:37:36', '2023-06-17 14:37:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `group_name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `group_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(75, 'dashboard', 'dashboard', 'web', NULL, NULL),
(76, 'subscriptions', 'subscriptions', 'web', NULL, NULL),
(77, 'subscriptions_histories', 'subscriptions', 'web', NULL, NULL),
(78, 'folders', 'folders', 'web', NULL, NULL),
(79, 'projects', 'projects', 'web', NULL, NULL),
(80, 'templates', 'templates', 'web', NULL, NULL),
(81, 'speech_to_text', 'templates', 'web', NULL, NULL),
(82, 'generate_images', 'templates', 'web', NULL, NULL),
(83, 'generate_code', 'templates', 'web', NULL, NULL),
(84, 'customers', 'customers', 'web', NULL, NULL),
(85, 'ban_customers', 'customers', 'web', NULL, NULL),
(86, 'staffs', 'staffs', 'web', NULL, NULL),
(87, 'add_staffs', 'staffs', 'web', NULL, NULL),
(88, 'edit_staffs', 'staffs', 'web', NULL, NULL),
(89, 'delete_staffs', 'staffs', 'web', NULL, NULL),
(90, 'contact_us_messages', 'contact_us_messages', 'web', NULL, NULL),
(91, 'tags', 'tags', 'web', NULL, NULL),
(92, 'add_tags', 'tags', 'web', NULL, NULL),
(93, 'edit_tags', 'tags', 'web', NULL, NULL),
(94, 'delete_tags', 'tags', 'web', NULL, NULL),
(95, 'blogs', 'blogs', 'web', NULL, NULL),
(96, 'add_blogs', 'blogs', 'web', NULL, NULL),
(97, 'edit_blogs', 'blogs', 'web', NULL, NULL),
(98, 'publish_blogs', 'blogs', 'web', NULL, NULL),
(99, 'delete_blogs', 'blogs', 'web', NULL, NULL),
(100, 'blog_categories', 'blogs', 'web', NULL, NULL),
(101, 'add_blog_categories', 'blogs', 'web', NULL, NULL),
(102, 'edit_blog_categories', 'blogs', 'web', NULL, NULL),
(103, 'delete_blog_categories', 'blogs', 'web', NULL, NULL),
(104, 'pages', 'pages', 'web', NULL, NULL),
(105, 'add_pages', 'pages', 'web', NULL, NULL),
(106, 'edit_pages', 'pages', 'web', NULL, NULL),
(107, 'delete_pages', 'pages', 'web', NULL, NULL),
(108, 'faqs', 'faqs', 'web', NULL, NULL),
(109, 'media_manager', 'media_manager', 'web', NULL, NULL),
(110, 'add_media', 'media_manager', 'web', NULL, NULL),
(111, 'delete_media', 'media_manager', 'web', NULL, NULL),
(112, 'newsletters', 'newsletters', 'web', NULL, NULL),
(113, 'subscribers', 'newsletters', 'web', NULL, NULL),
(114, 'delete_subscribers', 'newsletters', 'web', NULL, NULL),
(115, 'open_ai', 'open_ai', 'web', NULL, NULL),
(116, 'homepage', 'appearance', 'web', NULL, NULL),
(117, 'header', 'appearance', 'web', NULL, NULL),
(118, 'footer', 'appearance', 'web', NULL, NULL),
(119, 'roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(120, 'add_roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(121, 'edit_roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(122, 'delete_roles_and_permissions', 'roles_and_permissions', 'web', NULL, NULL),
(123, 'smtp_settings', 'system_settings', 'web', NULL, NULL),
(124, 'general_settings', 'system_settings', 'web', NULL, NULL),
(125, 'currency_settings', 'system_settings', 'web', NULL, NULL),
(126, 'add_currency', 'system_settings', 'web', NULL, NULL),
(127, 'edit_currency', 'system_settings', 'web', NULL, NULL),
(128, 'publish_currency', 'system_settings', 'web', NULL, NULL),
(129, 'language_settings', 'system_settings', 'web', NULL, NULL),
(130, 'add_languages', 'system_settings', 'web', NULL, NULL),
(131, 'edit_languages', 'system_settings', 'web', NULL, NULL),
(132, 'publish_languages', 'system_settings', 'web', NULL, NULL),
(133, 'translate_languages', 'system_settings', 'web', NULL, NULL),
(134, 'payment_settings', 'system_settings', 'web', NULL, NULL),
(135, 'default_language', 'system_settings', 'web', NULL, NULL),
(136, 'default_currency', 'system_settings', 'web', NULL, NULL),
(137, 'social_login_settings', 'system_settings', 'web', NULL, NULL),
(138, 'auth_settings', 'system_settings', 'web', NULL, NULL),
(139, 'otp_settings', 'system_settings', 'web', NULL, NULL),
(140, 'affiliate_configurations', 'affiliate_system', 'web', NULL, NULL),
(141, 'affiliate_withdraw', 'affiliate_system', 'web', NULL, NULL),
(142, 'affiliate_earning_histories', 'affiliate_system', 'web', NULL, NULL),
(143, 'affiliate_payment_histories', 'affiliate_system', 'web', NULL, NULL),
(144, 'custom_template_categories', 'templates', 'web', NULL, NULL),
(145, 'custom_templates', 'templates', 'web', NULL, NULL),
(146, 'words_report', 'report', 'web', NULL, NULL),
(147, 'codes_report', 'report', 'web', NULL, NULL),
(148, 'images_report', 'report', 'web', NULL, NULL),
(149, 's2t_report', 'report', 'web', NULL, NULL),
(150, 'most_used_templates', 'report', 'web', NULL, NULL),
(151, 'subscriptions_reports', 'report', 'web', NULL, NULL),
(152, 'ai_chat', 'templates', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `custom_template_id` int(11) DEFAULT NULL,
  `model_name` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `prompts` bigint(20) DEFAULT NULL,
  `completion` bigint(20) DEFAULT NULL,
  `words` bigint(20) DEFAULT NULL,
  `content_type` varchar(191) DEFAULT NULL COMMENT 'content/image/code/speech_to_text...',
  `resolution` varchar(191) DEFAULT NULL,
  `audio_file` text DEFAULT NULL,
  `text_to_speech_content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, NULL, NULL, 'whisper-1', 'Hey, Introduction', 'hey-introduction-g1cxe', 'Barron\'s Essential Words for the Ayelts by Lynn Lawheed. Published by Barron\'s Educational Series, Inc. Audio Scripts for Units 1 through 30.', 0, 22, 22, 'speech_to_text', NULL, NULL, NULL, '2023-05-29 17:48:41', '2023-05-29 17:48:41', NULL),
(2, 1, NULL, 6, NULL, 'gpt-3.5-turbo', 'Restaurant - 2023-05-29', 'untitled-project-2023-05-29-cbhzw', '1. Bangladeshi cuisine<br>\r\n2. Indian restaurant<br>\r\n3. Authentic Bangladeshi food<br>\r\n4. Culinary delight<br>\r\n5. Spicy delights<br>\r\n6. Must-try dishes<br>\r\n7. Indian cuisine with a twist<br>\r\n8. Foodie heaven<br>\r\n9. Fine dining experience<br>\r\n10. Traditional Bangladeshi flavors.', 24, 70, 94, 'content', NULL, NULL, NULL, '2023-05-29 17:55:23', '2023-05-29 17:55:38', NULL),
(3, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Best AI website list', 'untitled-project-2023-05-29-hjdcw', 'Introduction: <br>\r\nAs technology advances, more and more businesses and individuals are turning to AI (Artificial Intelligence) to enhance their websites. With AI, websites can easily accomplish tasks and provide an exceptional user experience. In this blog, we will take a look at the top 20 best AI websites in the world.<br>\r\n<br>\r\nIdea 1: <br>\r\nTop 5 websites using AI-based chatbots: <br>\r\nOutline: <br>\r\n- Introduction to chatbots and how they are used in websites<br>\r\n- Description of each website and their chatbot capabilities <br>\r\n- Benefits of using chatbots on websites<br>\r\n- Conclusion on the effectiveness of AI chatbots on websites<br>\r\n<br>\r\nIdea 2: <br>\r\nTop 5 websites using AI for personalization: <br>\r\nOutline: <br>\r\n- Explanation of AI personalization and how it differs from traditional methods<br>\r\n- Examples of websites that use AI to personalize user\'s experience <br>\r\n- Benefits of using AI for personalization on websites <br>\r\n- Conclusion on the effectiveness of AI personalization on websites<br>\r\n<br>\r\nIdea 3: <br>\r\nTop 5 websites using AI for product recommendations: <br>\r\nOutline: <br>\r\n- Explanation of AI product recommendations and its benefits <br>\r\n- Examples of websites that use AI for product recommendations<br>\r\n- Advantages of using AI for product recommendations <br>\r\n- Conclusion on the effectiveness of AI product recommendations on websites<br>\r\n<br>\r\nIdea 4: <br>\r\nTop 5 websites using AI for content creation: <br>\r\nOutline: <br>\r\n- Explanation of AI content creation and how it functions <br>\r\n- Examples of websites that use AI for content creation <br>\r\n- Benefits of using AI for content creation on websites <br>\r\n- Limitations of using AI for content creation <br>\r\n- Conclusion on the effectiveness of AI for content creation on websites <br>\r\n<br>\r\nIdea 5: <br>\r\nTop 5 websites using AI for SEO optimization: <br>\r\nOutline: <br>\r\n- Explanation of AI-based SEO optimization and its advantages <br>\r\n- Examples of websites that use AI for SEO optimization <br>\r\n- Benefits of using AI for SEO optimization on websites <br>\r\n- Comparison of AI-based SEO with traditional SEO methods <br>\r\n- Conclusion on the effectiveness of AI for SEO optimization on websites <br>\r\n<br>\r\nConclusion:<br>\r\nTo wrap it up, AI is quickly becoming an essential tool for websites to enhance their performance and provide a better experience for their visitors. By implementing AI, businesses and individuals can easily accomplish tasks that traditionally required more time and effort. The examples provided demonstrate how AI is being utilized in various ways in websites, and highlights the benefits that it brings to the table.', 35, 488, 523, 'content', NULL, NULL, NULL, '2023-05-29 17:57:32', '2023-05-29 18:00:10', NULL),
(4, 2, NULL, 3, NULL, 'gpt-3.5-turbo', 'AI website title', 'untitled-project-2023-05-29-wktof', '1. \"5 Best AI-Powered Websites for an Enhanced User Experience\"<br>\r\n2. \"Revolutionizing Web Design with AI: Top Websites to Check Out\"<br>\r\n3. \"Maximizing Your Web Presence with AI: Top Websites Leading the Charge\"<br>\r\n4. \"AI is Changing the Game: A Look at the Most Innovative Websites\"<br>\r\n5. \"Artificial Intelligence Meets Web Design: The Future of User-Friendly Websites\"<br>\r\n6. \"Smart Design: How AI is Revolutionizing Website Creation\"<br>', 29, 100, 129, 'content', NULL, NULL, NULL, '2023-05-29 17:58:51', '2023-05-29 17:59:40', NULL),
(5, 1, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-05-29', 'untitled-project-2023-05-29-u1gpb', 'Explorer, Dreamer, Coffee lover<br>\r\n<br>\r\nMeet me, the ultimate adventurer - a writer, photographer, and explorer. With a passion for capturing stories through words and lens, I aim to bring the beauty of the world to every corner of your imagination. As a dreamer with a creative flair, I\'m constantly pushing myself to explore new horizons and keep my work fresh and exciting. And what\'s a better way to fuel my creativity than a warm cup of coffee? I\'m a total coffee lover, always sipping on my favorite blend while working on my latest project. Follow me on my journey of capturing the essence of life and the wonders of the world through my lens and words.', 20, 139, 159, 'content', NULL, NULL, NULL, '2023-05-29 17:59:04', '2023-05-29 17:59:09', NULL),
(8, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', '1 to 100 PHP code', 'optimize-script-code-bjovg', 'Here\'s the PHP code to add numbers 1 to 100:<br>\r\n<br>\r\n```<br>\r\n$total = 0; // initialize the total variable to zero<br>\r\n<br>\r\nfor ($i = 1; $i &lt;= 100; $i++) { // loop through numbers 1 to 100<br>\r\n  $total += $i; // add each number to the total variable<br>\r\n}<br>\r\n<br>\r\necho \"The sum of numbers 1 to 100 is: \" . $total; // display the total value<br>\r\n```<br>\r\n<br>\r\nThis code uses a `for` loop to iterate through each number from 1 to 100 and adds it to the `$total` variable. After the loop is finished, the code displays the total value using `echo`.', 34, 144, 178, 'code', NULL, NULL, NULL, '2023-05-29 18:08:50', '2023-05-29 18:09:22', NULL),
(9, 2, NULL, NULL, NULL, 'whisper-1', 'Introduction', 'introduction-q2scb', 'Barron\'s Essential Words for the Ayelts by Lynn Lawheed. Published by Barron\'s Educational Series, Inc. Audio Scripts for Units 1 through 30.', 0, 22, 22, 'speech_to_text', NULL, NULL, NULL, '2023-05-29 18:10:12', '2023-05-29 18:10:12', NULL),
(10, 1, NULL, 46, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-jz2wu', 'तुम ही हो, अब तुम ही हो<br />\nजिन्दगी अब तुम ही हो<br />\n<br />\nतुम ही हो, ज़िन्दगी अब तुम ही हो<br />\nअँधेरा मेरा सँभलता कैसे<br />\nतुम ही हो, वो बातें अभी तुम ही हो<br />\nकी अभी तुम हो कुछ ना कहा होता<br />\n<br />\nतुम ही हो, मुझे हर ख़ुशी मिलती है पर<br />\nक्यों आज कल तेरे साथ छोटी-छोटी जीत हुई दूरियाँ अभी तुम ही हो,<br />\nजिन्दगी अब तुम ही हो.<br />\n<br />\nतेरा मेरा मिलना दुर के दिवाने<br />\nतेरी मेरी गलती स्वेट्स में टुलेंगे<br />\nदुनिया रहे न रहें हम मुझमें<br />\nहम तुम नहीं रहेंगे<br />\nमेरी आश्रया में तुम हो, तुम हो<br />\n<br />\nतुम ही हो, बंदगी मेरी सदा<br />\nतुम ही हो, जन्नत मेरी अब<br />\nतुम ही हो, ज़िन्दगी अब तुम ही हो<br />\nतुम', 43, 500, 543, 'content', NULL, NULL, NULL, '2023-06-05 10:04:39', '2023-06-05 10:04:39', NULL),
(11, 1, NULL, 5, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-myt3w', 'यदि आप ELA में खाने के लिए खोज रहे हैं तो हम आपकी सहायता कर सकते हैं। यहाँ हम आपको एलए में सर्वश्रेष्ठ रेस्तरां की सूची प्रदान करने जा रहे हैं।<br />\n<br />\n1. Côte Brasserie - यहाँ पर आपको दक्षिणी फ्रांसीसी खाने का स्वाद मिलता है। इस रेस्तरां की स्पेशलिटी डक और मुर्ग के साथ एक अद्भुत कुकेड', 172, 250, 422, 'content', NULL, NULL, NULL, '2023-06-05 10:06:33', '2023-06-05 10:06:33', NULL),
(12, 1, NULL, NULL, NULL, NULL, 'Love birds', 'love-birds-vu4js', 'images/0itQ6ZNcLa.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:07:21', '2023-06-05 10:07:21', NULL),
(15, 2, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-ib7fh', 'voice-over:<br />\n<br />\nHey there, do you rely on Google every day just like I do? Well, let me take you on a quick tour of some facts about our favorite search engine.<br />\n<br />\nFirst off, did you know that Google processes over 3.5 billion searches every single day? That\'s more than the population of China!<br />\n<br />\nWhat\'s more amazing is that Google was initially named Backrub in 1996, and only became Google in 1997. The name actually came from the word \'googol\', which means a number that\'s equal to 10 followed by one hundred zeros!<br />\n<br />\nBut wait, there\'s more! Google also has its own street view feature that allows you to explore the world from a 360 view without leaving your home, and Google AI has helped researchers map the human brain!<br />\n<br />\nAs much as we love Google, let\'s not forget to remind ourselves to use it responsibly, and to always fact-check the information we find online.<br />\n<br />\nThanks for joining me on this fun fact-filled tour of Google, and remember, Google should always be your friend and not foe. See ya!', 28, 221, 249, 'content', NULL, NULL, NULL, '2023-06-05 10:12:28', '2023-06-05 10:12:28', NULL),
(16, 1, NULL, NULL, NULL, NULL, 'Google', 'google-9iczg', 'images/ewwnIq0f1j.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:18:35', '2023-06-05 10:18:35', NULL),
(17, 1, NULL, NULL, NULL, NULL, 'Meta', 'meta-fbe1y', 'images/WxADI3ADQS.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:19:03', '2023-06-05 10:19:03', NULL),
(18, 1, NULL, NULL, NULL, NULL, 'Google', 'google-6hoxa', 'images/4fBTA9E6QJ.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:19:23', '2023-06-05 10:19:23', NULL),
(22, 1, NULL, NULL, NULL, NULL, 'Spring', 'spring-p8fqs', 'images/d1aO1lEMs1.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:22:59', '2023-06-05 10:22:59', NULL),
(23, 1, NULL, NULL, NULL, NULL, 'Kashmir', 'kashmir-4mwzc', 'images/aQU2fF8x3t.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:23:26', '2023-06-05 10:23:26', NULL),
(24, 1, NULL, NULL, NULL, NULL, 'Kashmir', 'kashmir-ipsqq', 'images/kvtI5eA7Mb.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:23:43', '2023-06-05 10:23:43', NULL),
(25, 1, NULL, NULL, NULL, NULL, 'Switzerland', 'switzerland-w6jcz', 'images/P54PDJiOXT.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:24:19', '2023-06-05 10:24:19', NULL),
(26, 1, 1, 7, NULL, 'gpt-3.5-turbo', 'writebot blog summery', 'untitled-project-2023-06-05-rkr9z', 'and efficient, WriteBot AI content generator is a game changer for writers looking to save time and boost productivity. Using advanced algorithms, it can generate high-quality articles, blog posts, product descriptions, and more with a few clicks of a button. With features like customizable templates, keyword suggestions, and integrated SEO optimization, WriteBot makes it easy for writers of all levels to create compelling content that engages readers and drives traffic. Whether you\'re a professional writer or just getting started, WriteBot can help you streamline your workflow and take your content creation to the next level.', 28, 113, 141, 'content', NULL, NULL, NULL, '2023-06-05 10:27:02', '2023-06-05 10:28:10', NULL),
(27, 1, NULL, 54, NULL, 'gpt-3.5-turbo', 'TikTok', 'untitled-project-2023-06-05-yolja', 'As an AI language model developed by OpenAI, I do not have personal beliefs. My primary function is to provide helpful and informative responses to your queries.', 8, 31, 39, 'content', NULL, NULL, NULL, '2023-06-05 10:29:46', '2023-06-05 10:30:14', NULL),
(29, 2, NULL, NULL, NULL, NULL, 'Ai image', 'ai-image-qjhxr', 'images/wZdnWYMtkU.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:34:53', '2023-06-05 10:34:53', NULL),
(30, 2, NULL, NULL, NULL, NULL, 'Restaurant', 'restaurant-00pqb', 'images/AguyehGetT.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:35:30', '2023-06-05 10:35:30', NULL),
(31, 2, 4, NULL, NULL, 'gpt-3.5-turbo', 'PHP Add function', 'php-add-function-vz4mu', 'Sure, here is the PHP code for an add function that takes in two parameters and returns their sum, with a check to ensure both numbers are between 1-50:\n\n```\nfunction addNumbers($num1, $num2) {\n  if ($num1 >= 1 && $num1 <= 50 && $num2 >= 1 && $num2 <= 50) {\n    return $num1 + $num2;\n  } else {\n    return \"Both numbers must be between 1-50.\";\n  }\n}\n```\n\nThis function first checks if `num1` and `num2` are between 1-50. If they are, it returns their sum. If not, it returns an error message. You can call this function passing two numbers as its parameter. \n\nFor example, `addNumbers(10, 20)` would return `30` because both numbers are within range. However, `addNumbers(0, 60)` would return \"Both numbers must be between 1-50.\" because one of them is outside the range.', 31, 221, 252, 'code', NULL, NULL, NULL, '2023-06-05 10:37:08', '2023-06-05 10:37:28', NULL),
(32, 2, NULL, 6, NULL, 'gpt-3.5-turbo', 'WriteBot Tag', 'untitled-project-2023-06-05-tot7x', '1. #Writebot<br>\r\n2. #AIwritingassistant<br>\r\n3. #Productivityhack<br>\r\n4. #Writingtechnology<br>\r\n5. #Automatedwriting<br>\r\n6. #Contentcreation<br>\r\n7. #Writingtools<br>\r\n8. #Artificialintelligence<br>\r\n9. #Efficientwriting<br>\r\n10. #Digitalwritingfundamentals', 18, 66, 84, 'content', NULL, NULL, NULL, '2023-06-05 10:41:53', '2023-06-05 10:42:10', NULL),
(33, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Python', 'python-k3fir', 'Sure, here\'s the code for a simple JavaScript function that adds the numbers from 1 to 50:\n\n```\nfunction addNumbers() {\n  let sum = 0;\n  for (let i = 1; i <= 50; i++) {\n    sum += i;\n  }\n  return sum;\n}\n\nconsole.log(addNumbers()); // Output: 1275\n```\n\nThe function initializes a variable `sum` to 0, then uses a `for` loop to iterate through the numbers from 1 to 50, adding each number to the `sum` variable. Finally, it returns the total sum. You can call this function by invoking it in your script and outputting or using the returned value.', 31, 148, 179, 'code', NULL, NULL, NULL, '2023-06-05 10:44:02', '2023-06-05 10:44:02', NULL),
(34, 2, NULL, NULL, NULL, NULL, 'Fish', 'fish-8xwjr', 'images/igPmuhSAwB.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-05 10:45:53', '2023-06-05 10:45:53', NULL),
(35, 2, NULL, 3, NULL, 'gpt-3.5-turbo', 'Blog Title list', 'untitled-project-2023-06-05-o3yg1', '1. \"Why WriteBot is the Future of Content Creation: Explained\"<br>\r\n2. \"Unleash Your Writing Potential with WriteBot - The Ultimate AI Platform\"<br>\r\n3. \"Revolutionize Your Content Strategy with WriteBot\'s Cutting-Edge Technology\"<br>\r\n4. \"Streamline Your Writing Process with WriteBot\'s User-Friendly Interface\"<br>\r\n5. \"Get More Done: How WriteBot\'s Powerhouse AI Engine Saves You Time\"<br>\r\n6. \"The Benefits of Using WriteBot for Content Creation: A Comprehensive Guide\"<br>\r\n7. \"Content Creation Made Easy: Why WriteBot is the Ultimate Choice for Writers\"<br>\r\n8. \"From Idea to Publication: How WriteBot Simplifies the Writing Process\"<br>\r\n9. \"Say Goodbye to Writer\'s Block with WriteBot: The AI Writing Assistant You Need\"<br>\r\n10. \"Transform Your Writing Game with WriteBot\'s Advanced AI Technology\"', 38, 176, 214, 'content', NULL, NULL, NULL, '2023-06-05 10:50:08', '2023-06-05 10:50:20', NULL),
(36, 2, NULL, 22, NULL, 'gpt-3.5-turbo', 'Writebot Video', 'untitled-project-2023-06-05-nmqri', 'greetings, tech enthusiasts! Get ready to witness the power of cutting-edge AI technology with our latest video featuring the Writebot. This amazing tool is designed to help you craft impeccable content with ease and speed. From bloggers to digital marketers and content creators, the Writebot has something amazing to offer. Our video provides a detailed look at the powerful features of this game-changing tool, so don\'t miss out. Join us today and take your content creation skills to the next level!', 37, 96, 133, 'content', NULL, NULL, NULL, '2023-06-05 10:50:55', '2023-06-05 10:51:12', NULL),
(37, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'sum of numbers', 'sum-of-numbers-mtemv', 'Here is a JavaScript function that calculates the sum of an array of numbers:\n\n```js\nfunction sum(numbers) {\n  let total = 0;\n  for (let i=0; i<numbers.length; i++) {\n    total += numbers[i];\n  }\n  return total;\n}\n```\n\nThe function takes an array of numbers as an argument and initializes a variable `total` to zero. It then loops through the array, adding each number to the total. Finally, it returns the total sum of the numbers in the array.', 28, 109, 137, 'code', NULL, NULL, NULL, '2023-06-05 12:14:14', '2023-06-05 12:14:14', NULL),
(38, 2, NULL, 34, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-miyah', 'and engaging yet informative, highlighting all of its unique features and benefits.<br />\n<br />\nIntroducing the iPhone 12 Pro Max - the ultimate smartphone experience that will take your digital life to the next level! With its stunning design, powerful performance, and advanced camera system, the iPhone 12 Pro Max is the perfect device for anyone who demands nothing but the best from their mobile device.<br />\n<br />\nLet\'s start with the design - the iPhone 12 Pro Max features a sleek and modern look that is both stylish and functional. It boasts a durable Ceramic Shield front cover that is four times more resistant to drops than previous models, making it the most durable iPhone yet.<br />\n<br />\nBut it\'s not just about looks - the iPhone 12 Pro Max also has a powerful hardware and software performance that will keep you up to speed in everything you do. With its powerful A14 Bionic chip, the iPhone 12 Pro Max delivers faster performance, smoother gaming experience, and quicker app loading times than ever before.<br />\n<br />\nAnd let\'s not forget about the camera - the iPhone 12 Pro Max is equipped with an incredible triple-camera system that takes stunning photos and videos in any light. With advanced features like Deep Fusion and Night mode, you can capture every moment in stunning detail, whether you\'re taking', 29, 250, 279, 'content', NULL, NULL, NULL, '2023-06-05 12:29:10', '2023-06-05 12:29:10', NULL),
(40, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'excel', 'excel-octrj', 'Here\'s the formula you can use in Excel to perform the operation you described:\n\n```\n=(SUM(2:2)/3)-5\n```\n\nThe `SUM(2:2)` part adds up all the cells in row 2. Then we divide that total by the cells in row 3 using `/3`. Finally, we subtract 5 from the result using `-5`.', 39, 79, 118, 'code', NULL, NULL, NULL, '2023-06-05 13:31:50', '2023-06-05 13:31:50', NULL),
(41, 2, NULL, 41, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-bhioj', 'reminder: We do not encourage or condone the use of language that presents biases or stereotypes related to age, gender, race, religion, culture, or any personal characteristic. We recommend using inclusive language that focuses on the qualifications and requirements for the job position. Here\'s a suggested job description based on the given requirements:<br />\n<br />\nJob Position: Hazardous Chemical Truck Driver<br />\n<br />\nWe are seeking a reliable and safety-conscious Hazardous Chemical Truck Driver to join our team. The successful candidate will have tanker experience and a strong dedication to delivering products to our customers on time, every time.<br />\n<br />\nResponsibilities:<br />\n- Transport hazardous chemicals to customer sites in a safe and timely manner.<br />\n- Ensure compliance with federal, state, and local transportation regulations.<br />\n- Perform daily safety checks on the vehicle and equipment.<br />\n- Maintain accurate records of delivery and ensure timely filing of reports.<br />\n- Communicate effectively with customers and team members to ensure a smooth delivery process.<br />\n- Attend regular safety meetings and comply with all safety policies and procedures.<br />\n<br />\nRequirements:<br />\n- High school diploma or equivalent.<br />\n- Valid CDL with hazardous materials (HAZMAT) and tanker endorsements.<br />\n- Minimum of 2 years of experience in driving tanker trucks.<br />\n- Clean driving record and a commitment to safe driving practices.<br />\n- Good', 59, 250, 309, 'content', NULL, NULL, NULL, '2023-06-05 13:34:02', '2023-06-05 13:34:02', NULL),
(42, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'template', 'template-iyao3', '<!DOCTYPE html>\n<html>\n  <head>\n    <title>My Website</title>\n  </head>\n  <body>\n    <h1>Welcome to my website!</h1>\n    <p>This is some sample text.</p>\n    <a href=\"https://www.example.com\">Click here</a> to visit another website.\n    <ul>\n      <li>Item 1</li>\n      <li>Item 2</li>\n      <li>Item 3</li>\n    </ul>\n    <ol>\n      <li>First item</li>\n      <li>Second item</li>\n      <li>Third item</li>\n    </ol>\n  </body>\n</html>', 23, 151, 174, 'code', NULL, NULL, NULL, '2023-06-05 13:57:47', '2023-06-05 13:57:47', NULL),
(43, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'template', 'template-awsyn', 'The sum of 2 and 4 is 6. In Python, you can write `2+4` to get the result.', 25, 28, 53, 'code', NULL, NULL, NULL, '2023-06-05 13:57:59', '2023-06-05 13:57:59', NULL),
(44, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'template', 'template-ibdtz', 'Software as a Service (SaaS) is a cloud computing model that provides software applications to users over the internet. With SaaS, users do not have to install and maintain software on their own computers or servers; instead, they access the software through a web browser. SaaS applications are typically hosted by a third-party provider and are offered on a subscription basis. Some popular examples of SaaS applications include Salesforce, G Suite, and Dropbox. As a creative assistant, I can help you develop SaaS applications that provide useful and innovative solutions to your customers.', 24, 112, 136, 'code', NULL, NULL, NULL, '2023-06-05 13:58:13', '2023-06-05 13:58:13', NULL),
(45, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Calculadora', 'calculadora-m1nei', '¡Claro! Te enseñaré cómo crear una calculadora básica en JavaScript. Asegúrate de agregar un archivo HTML en el que puedas conectar tu código JavaScript.\n\nPrimero, en tu archivo HTML, agrega los siguientes elementos:\n\n```html\n<body>\n  <h1>Calculadora</h1>\n  <input id=\"input\" type=\"text\" placeholder=\"0\">\n  <table>\n    <tr>\n      <td><button onclick=\"pushButton(\'7\')\">7</button></td>\n      <td><button onclick=\"pushButton(\'8\')\">8</button></td>\n      <td><button onclick=\"pushButton(\'9\')\">9</button></td>\n      <td><button onclick=\"pushButton(\'/\')\">/</button></td>\n    </tr>\n    <tr>\n      <td><button onclick=\"pushButton(\'4\')\">4</button></td>\n      <td><button onclick=\"pushButton(\'5\')\">5</button></td>\n      <td><button onclick=\"pushButton(\'6\')\">6</button></td>\n      <td><button onclick=\"pushButton(\'*\')\">*</button></td>\n    </tr>\n    <tr>\n      <td><button onclick=\"pushButton(\'1\')\">1</button></td>\n      <td><button onclick=\"pushButton(\'2\')\">2</button></td>\n      <td><button onclick=\"pushButton(\'3\')\">3</button></td>\n      <td><button onclick=\"pushButton(\'-\')\">-</button></td>\n    </tr>\n    <tr>\n      <td><button onclick=\"pushButton(\'0\')\">0</button></td>\n      <td><button onclick=\"pushButton(\'.\')\">.</button></td>\n      <td><button onclick=\"clearInput()\">C</button></td>\n      <td><button onclick=\"pushButton(\'+\')\">+</button></td>\n    </tr>\n    <tr>\n      <td><button onclick=\"calculate()\">=</button></td>\n    </tr>\n  </table>\n\n  <script src=\"miArchivoJS.js\"></script>\n</body>\n```\n\nLuego, en tu archivo JS, agrega las siguientes funciones:\n\n```javascript\nlet input = document.getElementById(\'input\');\n\nfunction pushButton(obj) {\n  input.value += obj;\n}\n\nfunction clearInput() {\n  input.value = \'\';\n}\n\nfunction calculate() {\n  try {\n    input.value = eval(input.value);\n  } catch (evalError) {\n    if (evalError instanceof SyntaxError) {\n      input.value = \'Syntax Error\';\n    } else {\n      throw evalError;\n    }\n  }\n}\n```\n\nEn la función `pushButton`, se agregarán los números y los operadores que presionamos en la calculadora, concatenándolos al valor actual del input.\n\nEn `clearInput`, limpiamos el valor del input.\n\nFinalmente, en `calculate`, utilizamos la función `eval` de JavaScript para calcular la operación. Si la operación es inválida, se lanza una excepción y se muestra un mensaje de error en el input.\n\n¡Listo! Con esto, ya tienes una calculadora básica en JavaScript.', 29, 659, 688, 'code', NULL, NULL, NULL, '2023-06-05 14:19:46', '2023-06-05 14:19:46', NULL),
(46, 1, NULL, 52, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-b8tvh', '<b>[Output-1]</b><br />\r\n1. \"The Impact of AI-Powered Healthcare: Transforming Patient Care and Saving Lives\"<br />\n2. \"Revolutionizing the Financial Industry with AI: How Machine Learning is Changing Banking and Investments\"<br />\n3. \"From Customer Service to Chatbots: How AI is Changing the Game for Businesses and Consumers Alike\"<br />\n4. \"Smart Homes to Autonomous Cities: The Future of Urban Living with AI Technology\"<br />\n5. \"The Ethics of AI: Examining the Benefits and Risks of Advanced Machine Intelligence\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n1. \"5 Ways AI Technology is Revolutionizing Healthcare: From Diagnosis to Treatment \"<br />\n<br />\n2. \"The Game-Changing Benefits of AI in the Business World: Why Firms That Fail to Adapt Will be Left Behind \"<br />\n<br />\n3. \"AI in Education: How it\'s Improving Learning and Changing the Way We Teach \"<br />\n<br />\n4. \"AI and Agriculture: How Farmers Can Harness the Power of Technology to Boost Crop Yields and Efficiency \"<br />\n<br />\n5. \"AI and Climate Change: How Advanced Analytics are Helping Fight Global Warming \"<br />\n<br />\n6. \"AI and Cybersecurity: Ensuring Safe Digital Interactions for a Smarter Tomorrow \"<br />\n<br />\n7. \"AI in Manufacturing: How Automation and Machine Learning are Powering the Fourth Industrial Revolution \"<br />\n<br />\n8. \"AI and Smart Cities: Transforming Urban Spaces for Better Quality of Life \"<br />\n<br />\n9. \"The Ethical Implications of AI: Balancing Technology\'s Advantages with Humans\' Moral Obligations \"<br />\n<br />\n10. \"Beyond Siri and Alexa: Futuristic Applications of AI that Will Change Our Lives Forever\".<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n1. How AI Is Revolutionizing Healthcare: A Look at the Benefits of New Technologies<br />\n<br />\n2. The Future of Work: How AI is Changing the Way We Work and the Benefits We Can Expect<br />\n<br />\n3. From Chatbots to Personalized Ads: The Benefits of AI for Marketing and Sales<br />\n<br />\n4. How AI is Driving Innovation in the Education Sector: Benefits and Challenges<br />\n<br />\n5. Improved Efficiency, Reduced Costs, and More: The Benefits of AI in Manufacturing and Production<br />\n<br />\n6. AI for Financial Services: Benefits and Risks of Implementing New Technologies<br />\n<br />\n7. Impacting Lives: The Social Benefits of AI in Health, Education, and the Environment<br />\n<br />\n8. Understanding the Challenges and Benefits of AI Ethics: What You Need to Know<br />\n<br />\n9. Balancing the Benefits and Risks of AI: The Impact on Jobs and the Economy<br />\n<br />\n10. The Future is Now: How AI is Paving the Way for a More Sustainable World.<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\nwriters can explore the following captivating story ideas around the benefits of new artificial intelligence technologies on Medium.com:<br />\n<br />\n1. The future of healthcare: AI advancements that may revolutionize medicine.<br />\n2. AI-powered financial literacy tools: Helping people manage their money better.<br />\n3. AI-based technology and the fight against climate change.<br />\n4. AI in the workplace: How automated systems are reshaping job roles.<br />\n5. The rise of AI-powered home assistants: A boon or a bane?<br />\n6. The ethical dilemma of AI: Addressing the concerns around machine morality.<br />\n7. Tech giants investing in AI: What it means for the future of technology?<br />\n8. The evolution of personalized shopping experiences with AI-based recommendation engines.<br />\n9. AI-powered transportation systems and the future of smart cities.<br />\n10. Intelligent risk management: The role of AI in enhancing security and mitigating risks.<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n1. \"AI in Healthcare: Transforming the Future of Patient Care\"<br />\n2. \"Revolutionizing Customer Service With AI: How Companies Are Streamlining the Support Process\"<br />\n3. \"Exploring the Ethical Implications of Artificial Intelligence: Debating the Pros and Cons\"<br />\n4. \"The Rise of Intelligent Automation: How AI is Changing the Way We Work\"<br />\n5. \"The Future of Education is Here: AI-Assisted Learning and its Benefits\"<br />\n6. \"Artificial Intelligence in Finance: A Game-Changer for the Industry\"<br />\n7. \"AI and Cybersecurity: How Machine Learning is Bolstering Our Security Measures\"<br />\n8. \"Transforming Manufacturing with Intelligent Machines: The Benefits of AI in Industry 4.0\"<br />\n9. \"Why AI is the Key to Unlocking the Full Potential of Renewable Energy\"<br />\n10. \"A Brighter Future for Agriculture: How AI is Revolutionizing Farming Techniques\".<br />\r\n<br />\r\n<br />', 41, 857, 898, 'content', NULL, NULL, NULL, '2023-06-05 14:50:08', '2023-06-05 14:50:08', NULL),
(47, 1, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-gdsmj', 'machines have been around for a while. However, with the emergence of advanced artificial intelligence (AI), machines are now becoming capable of more than just performing mechanical tasks. AI technology is now progressing at a rapid pace, and its transformative potential is unparalleled. However, the ethics of AI are a significant concern, and it is important to examine both the benefits and risks associated with this advanced technology.<br />\n<br />\nThe benefits of advanced AI technology are many, the most significant of which is its potential to improve our quality of life. With artificial intelligence, machines can be made to operate more efficiently, reducing inefficiencies and improving productivity. This technology has the potential for use in various fields, including healthcare, where it can be applied in areas such as medical diagnosis and surgery.<br />\n<br />\nThe potential for AI to increase efficiency and reduce human error is immense. Self-driving cars, for instance, can significantly lower the number of human-caused car accidents. Other benefits include improving the development of new technology, reducing costs, and advancing scientific research and development.<br />\n<br />\nHowever, the ethical concerns surrounding AI are also significant. With the increased use of AI, there are concerns about individuals losing their jobs to machines. There are also concerns about privacy and AI, with machines potentially having the ability to learn', 88, 250, 338, 'content', NULL, NULL, NULL, '2023-06-05 14:53:01', '2023-06-05 14:53:01', NULL),
(48, 1, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-nshqn', 'advice for anyone who loves to travel, our blog is dedicated to making your next adventure the best one yet! From insider tips and tricks to must-see sights and destinations, our blog covers it all. Check out some of our favorite blog ideas and outlines for inspiration.<br />\n<br />\n1. \"The Top 10 Hidden Gems to Discover in Europe\"<br />\nOutline:<br />\n- Introduction to the beauty and diversity of Europe<br />\n- Explanation of why finding hidden gems is important when travelling<br />\n- List of 10 off-the-beaten-path destinations in Europe<br />\n- Description of each destination, including must-see sights and local recommendations<br />\n- Conclusion and encouragement to explore beyond the tourist hotspots<br />\n<br />\n2. \"Solo Travel Tips: How to Have an Amazing Solo Trip\"<br />\nOutline:<br />\n- Introduction to the benefits of solo travel<br />\n- Discussion of common concerns about travelling alone<br />\n- List of practical tips for solo travellers, including safety, budgeting, and meeting people<br />\n- Personal anecdotes and advice from experienced solo travellers<br />\n- Conclusion and encouragement to embrace solo travel as a transformative experience<br />\n<br />\n3. \"The Best Destinations for Foodies: A Culinary Tour around the World\"<br />\nOutline:<br />\n- Introduction to the importance of food in travel<br />\n- List of 10 destinations around the', 27, 250, 277, 'content', NULL, NULL, NULL, '2023-06-05 15:23:15', '2023-06-05 15:23:15', NULL),
(49, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'js', 'js-4w424', 'Sure, here\'s an example:\n\n```javascript\nfunction generateAndAddNumbers() {\n  // Generate two random numbers\n  let number1 = Math.floor(Math.random() * 100);\n  let number2 = Math.floor(Math.random() * 100);\n  \n  // Add the two numbers\n  let sum = number1 + number2;\n  \n  // Return the sum\n  return sum;\n}\n```\n\nThis function generates two random numbers between 0 and 100 (inclusive) and adds them together to get their sum. You can use this function in your code by calling it like this:\n\n```javascript\nlet result = generateAndAddNumbers();\nconsole.log(result); // Prints the sum of the two generated numbers\n```\n\nHope that helps! Let me know if you have any questions.', 35, 162, 197, 'code', NULL, NULL, NULL, '2023-06-05 16:13:12', '2023-06-05 16:13:12', NULL),
(50, 2, NULL, 46, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-zchxl', 'Verse 1:<br />\nI\'m walking out the door and I\'m leaving behind<br />\nAll the memories and the thoughts that defined<br />\nMy life up to this point, but it\'s time to move on<br />\nI\'m heading out into the world, where I belong<br />\n<br />\nChorus:<br />\nCause I\'m gonna walk 500 miles<br />\nAnd I won\'t stop until I\'ve seen it all<br />\nThrough the mountains and the seas<br />\nI\'ll find a place where I\'m free<br />\n<br />\nVerse 2:<br />\nI\'ve got my backpack on and my boots are laced up<br />\nI\'m ready for the journey, no need for a crutch<br />\nI\'ll trek through the wilds, and I\'ll sleep beneath the stars<br />\nMy travels will take me near and far<br />\n<br />\nChorus:<br />\nCause I\'m gonna walk 500 miles<br />\nAnd I won\'t stop until I\'ve seen it all<br />\nThrough the mountains and the seas<br />\nI\'ll find a place where I\'m free<br />\n<br />\nBridge:<br />\nThere will be times when my feet are sore<br />\nAnd I\'ll feel like I can\'t take any more<br />\nBut I\'ll push through, I\'ll carry on<br />\nCause this journey is where I belong<br />\n<br />\nChorus:<br />\nCause I\'m gonna walk 500 miles<br />\nAnd I won\'t', 20, 250, 270, 'content', NULL, NULL, NULL, '2023-06-05 17:37:02', '2023-06-05 17:37:02', NULL),
(51, 2, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-pgwo8', 'As an experienced Laravel developer, I am dedicated to creating high-quality web applications that exceed expectations. With my skills in PHP, MySQL, HTML, and CSS, I have the ability to design and develop scalable and maintainable applications that meet your business needs. Whether you are looking to build a simple website or a complex web application, I have the knowledge and expertise to get the job done. Trust me to deliver robust, efficient and well-designed Laravel applications tailored to your unique requirements. Let\'s work together to achieve your business goals! #LaravelDeveloper #WebApplications #WebDevelopment #PHPDeveloper #MySQL #HTML #CSS', 20, 125, 145, 'content', NULL, NULL, NULL, '2023-06-05 18:05:14', '2023-06-05 18:05:14', NULL),
(52, 2, NULL, 55, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-gx0nk', '1. \"Top 10 Inspirational Business Quotes to Live By\"<br />\n2. \"How Business Quotes Can Improve Your Life and Career\"<br />\n3. \"Celebrity Entrepreneurs Share Their Favorite Business Quotes\"<br />\n4. \"The Psychology Behind Successful Business Quotes\"<br />\n5. \"Using Business Quotes to Overcome Challenges in Your Career\"<br />\n6. \"Funny Business Quotes to Lighten Up Your Workday\"<br />\n7. \"Business Quotes Every Entrepreneur Should Know\"<br />\n8. \"How to Create Beautiful Wall Art with Business Quotes\"<br />\n9. \"The Evolution of Business Quotes Through History\"<br />\n10. \"What Your Favorite Business Quote Says About You\"', 27, 125, 152, 'content', NULL, NULL, NULL, '2023-06-05 18:22:43', '2023-06-05 18:22:43', NULL),
(53, 2, NULL, 3, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-elhp6', '1. The Ultimate Guide to Choosing the Best Web Hosting Service for Your Site<br />\n2. Shared vs. Dedicated Hosting: Which is Right for Your Online Business?<br />\n3. How to Boost Your Website\'s Speed and Performance with Web Hosting Optimization<br />\n4. The Pros and Cons of Free Hosting: Is it Worth the Risk?<br />\n5. The Importance of Choosing a Reliable Web Host for Your Online Store<br />\n6. How to Secure Your Website from Cyber Attacks with Advanced Web Hosting Features<br />\n7. WordPress Hosting: The Only Guide You\'ll Ever Need<br />\n8. The Future of Web Hosting: Predictions and Expectations for the Next Decade<br />\n9. How to Migrate Your Website to a New Web Host Without Losing Data or SEO<br />\n10. The Benefits of Cloud Hosting for Small Business Owners and Entrepreneurs', 26, 161, 187, 'content', NULL, NULL, NULL, '2023-06-05 19:44:05', '2023-06-05 19:44:05', NULL),
(54, 1, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-dwqxh', 'and aesthetically pleasing, wooden sofas are a timeless piece of furniture that suits every household. They come in various designs and models, which in turn have different price ranges depending on the quality of the wood and style of the sofa. <br />\n<br />\nThe versatility and adaptability of wooden sofas make them perfect for any living room. A wooden sofa can be an affordable addition to your home that\'s easy on the eyes and provides comfort and style. The beauty of wooden sofas lies in their nature to blend in perfectly with different types of interior styles, whether it be modern or traditional. <br />\n<br />\nWhen it comes to design and model, wooden sofas come in various forms. Some of the popular designs include minimalist designs, vintage style, and rustic designs. Minimalist design is the most popular model, as it is simple yet elegant. The vintage style gives a nostalgic feel which is suitable for those who love old-school aesthetics. On the other hand, rustic style wooden sofas give a raw, natural aesthetic that can add a touch of warmth to your living space. <br />\n<br />\nPrice ranges for wooden sofas vary depending on the quality and style of the wood used. Some wooden sofas are made of high-quality wood and can be expensive, while others are made of less expensive types of wood,', 50, 250, 300, 'content', NULL, NULL, NULL, '2023-06-05 19:58:08', '2023-06-05 19:58:08', NULL),
(55, 2, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-05', 'untitled-project-2023-06-05-kpjwn', 'Valves and Automation: The Future is Here with Be Asia Private Limited<br />\n<br />\nWhen it comes to controlling the flow of liquids, gases and other media, valves have always been an essential component of the process. And with the advent of automation, these valves have taken on a whole new level of importance. Automation systems help companies improve their productivity and efficiency, along with reducing costs and minimizing human error. Be Asia Private Limited is leading the way in this industry, providing cutting-edge solutions for valves and automation that pave the way to a bright future.<br />\n<br />\nWhy Automate?<br />\n<br />\nIn the past, valve systems were mostly controlled manually, and their operation relied heavily on the operator\'s intuition and skill. More recently, however, as technology has advanced, automated valve systems have become much more common. An automated valve system uses electronics, hydraulics, or pneumatics to control the flow of media in a plant or factory, reducing human errors and errors in machinery operations.<br />\n<br />\nThe Benefits of Valves and Automation<br />\n<br />\nThe perks that come with valves and automation are numerous. For one, these systems are designed to handle large capacity operations, and can be programmed to work continuously throughout a 24-hour cycle. They reduce the need for manual labor, improving productivity while minimizing operational expenses', 44, 250, 294, 'content', NULL, NULL, NULL, '2023-06-05 20:40:33', '2023-06-05 20:40:33', NULL),
(56, 2, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-07', 'untitled-project-2023-06-07-h0xju', 'Voiceover: Ah, the classic prank. It always brings a little excitement into our lives. Today, we\'re going to show you some of the most hilarious pranks that will leave your friends in stitches.<br />\n<br />\n[Cut to scene of friends gathered in one room]<br />\n<br />\nFriend 1: Alright, guys. I have the perfect prank planned. <br />\n<br />\nFriend 2: Ooh, what is it?<br />\n<br />\nFriend 1: I\'ve put a fake spider in the fridge. Let\'s see who freaks out the most when they come looking for a snack.<br />\n<br />\n[Cut to scene of friend opening the fridge]<br />\n<br />\nFriend 3: ARRRGHHHHH!!!<br />\n<br />\n[Cut to scene of friends laughing]<br />\n<br />\nFriend 2: Okay, my turn. [Holds up a squirt gun] Anyone want to play a game of water tag?<br />\n<br />\n[Cut to scene of friends running and screaming as they get squirted]<br />\n<br />\nFriend 4: I think we need to up the ante. [Starts putting on a fake mustache] Let\'s see how long we can keep this mustache on without anyone noticing.<br />\n<br />\n[Cut to scene of everyone trying to act normal while Friend 4\'s mustache falls off]<br />\n<br />\n[Cut to scene of everyone laughing]<br />\n<br />\nVoice', 29, 250, 279, 'content', NULL, NULL, NULL, '2023-06-07 17:16:51', '2023-06-07 17:16:51', NULL),
(57, 1, NULL, NULL, 1, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-07', 'untitled-project-2023-06-07-bxvb5', 'Exciting news for all job seekers out there! ThemeTags, one of the leading companies in the digital marketing industry, is currently looking for passionate and skilled individuals to join their team. If you’re someone who’s interested in work that combines creativity and innovation, then this job circular is definitely for you!<br />\n<br />\nThemeTags is seeking candidates for various positions, including content writers, graphic designers, digital marketing professionals, and web developers. Candidates who possess the required skills and experience are encouraged to apply for the available roles.<br />\n<br />\nWorking at ThemeTags provides a wonderful opportunity for candidates to grow and develop their skills while working on exciting projects. With their client-centric approach, ThemeTags is dedicated to delivering high-quality results and providing exceptional customer service.<br />\n<br />\nSo if you’re looking for a rewarding career in the digital marketing industry, this is your chance to join a vibrant and dynamic team at ThemeTags. Don\'t miss out on this incredible opportunity and apply today! #JobVacancy #ThemeTags #DigitalMarketing #CareerOpportunities.', 22, 203, 225, 'content', NULL, NULL, NULL, '2023-06-07 17:25:07', '2023-06-07 17:25:07', NULL),
(58, 2, NULL, 1, NULL, 'gpt-3.5-turbo', 'top 10 ai writing tools', 'untitled-project-2023-06-10-orwk5', 'and Easy-to-Use AI Writing Tools for Better Productivity<br>\r\n<br>\r\nArtificial intelligence (AI) is rapidly changing the way we engage with technology. It\'s no wonder that AI writing tools are gaining popularity among writers, bloggers, and marketing professionals. They help to improve productivity, writing speed, and produce high-quality content quickly.<br>\r\n<br>\r\nIn this article, we have compiled a list of the top 10 AI writing tools that will enhance your writing experience.<br>\r\n<br>\r\n1. Xwriter.Ai<br>\r\n<br>\r\nOne of the most popular AI writing tools today is Xwriter.Ai. It provides easy-to-use features that allow for high accuracy in text generation. Xwriter.Ai\'s interface is user-friendly and works perfectly well for beginners and experienced writers alike. Its AI writing capabilities are top-notch, and you can employ it for a wide range of writing tasks.<br>\r\n<br>\r\n2. Grammarly\'s AI Writing Assistant<br>\r\n<br>\r\nGrammarly has become a household name when it comes to grammar and spelling checkers. But, Grammarly\'s AI writing assistant takes things a notch higher. Its capabilities are well-suited for the optimization of blog posts and maintaining a consistent tone-of-voice across all your texts.<br>\r\n<br>\r\n3. Article Forge<br>\r\n<br>\r\nArticle Forge uses machine learning algorithms to create SEO-optimized content in record time. Simply enter a topic and let their AI engine produce an article that\'s highly researched and unique.<br>\r\n<br>\r\n4. Quillbot<br>\r\n<br>\r\nQuillbot is the go-to AI writing tool for writers looking to avoid plagiarism in their content. Its algorithms can generate unique content that closely matches the source documents\' meaning.<br>\r\n<br>\r\n5. Copyscape<br>\r\n<br>\r\nCopyscape was initially a plagiarism checker, but it has evolved into an AI writing tool that\'s intuitive and easy to use. It\'s perfect for businesses looking to produce unique web content.<br>\r\n<br>\r\n6. SEMrush<br>\r\n<br>\r\nSEMrush has a suite of great writing tools, including an AI-generated SEO content template that informs article structure and keywords research.<br>\r\n<br>\r\n7. Textio<br>\r\n<br>\r\nTextio is a fantastic tool for businesses focused on their company brand and messaging. Its AI engine makes language recommendations that will enhance the feel and quality of your content.<br>\r\n<br>\r\n8. Atomic AI<br>\r\n<br>\r\nAtomic AI\'s primary goal is to improve the quality of your writing. It uses machine learning to identify areas where your content is weak and provides recommendations on how to improve it.<br>\r\n<br>\r\n9. GPT-3<br>\r\n<br>\r\nGPT-3 is a general-purpose language model capable of writing content in a range of contexts. It\'s well suited for creative writing and imaginative tasks like creating content for storyboards.<br>\r\n<br>\r\n10. Jarvis.ai<br>\r\n<br>\r\nLast but not least, Jarvis.ai is another excellent AI writing tool that\'s particularly suitable for copywriters. It employs natural language processing, making it perfect for tasks like ad copywriting and email marketing.<br>\r\n<br>\r\nThe Takeaway<br>\r\n<br>\r\nAI writing tools are becoming increasingly popular among bloggers, writers, and marketers. They are getting more sophisticated and user-friendly than ever before, allowing even amateurs to produce professional-quality content. These top 10 AI writing tools will improve your writing productivity, speed, and accuracy while providing excellent value for your money. So, why not try one out today and see the difference AI writing can make to your work?', 42, 640, 682, 'content', NULL, NULL, NULL, '2023-06-10 08:52:50', '2023-06-10 08:54:07', NULL),
(59, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Css', 'css-xelhx', 'Sure, here\'s an example of a basic flexbox CSS code for a theme:\n\n```css\n/* Set up the flex container */\n.flex-container {\n  display: flex;\n  flex-direction: row; /* or column */\n  justify-content: center; /* align items along the main axis */\n  align-items: center; /* align items along the cross axis */\n  flex-wrap: wrap; /* wrap items onto multiple lines if needed */\n}\n\n/* Style the flex items */\n.flex-item {\n  flex-basis: 50%; /* default size of the flex item */\n  flex-grow: 1; /* grow the flex item as necessary */\n  flex-shrink: 1; /* shrink the flex item as necessary */\n  text-align: center; /* center the content inside the flex item */\n  padding: 20px; /* add spacing between items */\n}\n\n/* Set up media queries for responsive design */\n@media only screen and (max-width: 768px) {\n  /* Change the flex direction to column on smaller screens */\n  .flex-container {\n    flex-direction: column;\n  }\n}\n```\n\nYou can customize the values of the flex properties depending on your theme\'s design and layout.', 29, 242, 271, 'code', NULL, NULL, NULL, '2023-06-10 09:23:28', '2023-06-10 09:23:28', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(60, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Bounce animation', 'bounce-animation-a8nhw', 'Here\'s an example code to make a bounce animation using JavaScript:\n\n```\n// Get the element to animate\nconst element = document.getElementById(\"myElement\");\n\n// Set the starting position\nlet posY = 0;\nlet direction = \"down\";\n\n// Set the animation interval\nconst interval = setInterval(() => {\n  // Calculate the new position based on the direction\n  if (direction === \"down\") {\n    posY += 5;\n  } else {\n    posY -= 5;\n  }\n\n  // Reverse the direction when reaching edges\n  if (posY >= 200) {\n    direction = \"up\";\n  } else if (posY <= 0) {\n    direction = \"down\";\n  }\n\n  // Apply the new position to the element\n  element.style.transform = `translateY(${posY}px)`;\n}, 50);\n```\n\nIn this code, we\'re using `setInterval()` to repeatedly update the `transform` property of an HTML element (with id \"myElement\") to create a bouncing animation. The `posY` variable keeps track of the element\'s vertical position and is updated based on the `direction` variable, which is reversed when the element reaches the top or bottom of its animation range (200 pixels in this example). The animation interval is set to 50 milliseconds, but you can adjust this value to speed up or slow down the animation.', 30, 283, 313, 'code', NULL, NULL, NULL, '2023-06-10 10:06:21', '2023-06-10 10:06:21', NULL),
(61, 2, 10, 21, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-pcydh', 'Feathered Flock Takes Flight: A Majestic Bird\'s Eye View of Soaring Skies!', 38, 21, 59, 'content', NULL, NULL, NULL, '2023-06-10 11:29:22', '2023-06-10 11:29:39', NULL),
(62, 1, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-wtn9o', 'and vibrant, Corvallis is a charming college town located in the heart of Oregon. Whether you\'re a student at Oregon State University or simply stopping by for a visit, you\'ll never run out of great restaurants to try. From delicious fast food options to elegant dine-in experiences, here are some of the best restaurants in Corvallis.<br />\n<br />\nFor fast food lovers, the must-visit spot in Corvallis is Burgerville. Known for their mouthwatering burgers made with locally sourced ingredients, Burgerville is a Pacific Northwest classic. They also offer vegan and vegetarian burgers, making it a great spot for all dietary preferences. The sweet potato fries and milkshakes are also highly recommended!<br />\n<br />\nIf you\'re looking for a casual yet upscale dine-in experience, Block 15 Brewery & Tap Room is a great choice. Known for their hand-crafted beers and delicious pub food, Block 15 is a local favorite. The wild mushroom and truffle oil mac and cheese is not to be missed, and the seasonal beer selection is always worth trying.<br />\n<br />\nAnother great option for a sit-down meal is Bellhop. This cozy bistro serves up seasonal American cuisine with a French twist. They offer a variety of unique menu items such as the smoked pork belly', 45, 250, 295, 'content', NULL, NULL, NULL, '2023-06-10 11:39:10', '2023-06-10 11:39:10', NULL),
(63, 1, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-vvjg6', 'and Safe Medical Tourism in Bali: The Ultimate Guide<br />\n<br />\nI. Introduction<br />\nA. Definition of medical tourism<br />\nB. The rise of medical tourism in Bali<br />\nC. The benefits of medical tourism in Bali<br />\nD. The safety and quality of medical facilities in Bali<br />\n<br />\nII. Reasons for Choosing Bali for Medical Tourism<br />\nA. The cost-effectiveness of medical treatments in Bali<br />\nB. The affordability of the living costs in Bali<br />\nC. The availability of well-equipped medical facilities and skilled medical professionals<br />\nD. The Balinese culture and atmosphere that assures relaxation and recovery<br />\n<br />\nIII. Medical Procedures and Treatments Available in Bali<br />\nA. Cosmetic Surgery<br />\nB. Dental Treatments and Services<br />\nC. Fertility Treatments<br />\nD. Rehabilitation and Wellness Programs<br />\n<br />\nIV. How to Choose a Medical Facility in Bali<br />\nA. Research and referrals<br />\nB. Evaluating facility accreditation and certification<br />\nC. Checklist for hospital facilities and amenities<br />\nD. Understanding the risks and complications of medical tourism<br />\n<br />\nV. Tips for Planning Your Medical Tourism Trip to Bali<br />\nA. Visa requirements and travel arrangements<br />\nB. Local currency exchange and insurance coverage<br />\nC. Hotel Accommodations in Bali<br />\nD. Preparing emotionally and physically for medical procedures<br />\n<br />\nVI.', 28, 250, 278, 'content', NULL, NULL, NULL, '2023-06-10 12:18:58', '2023-06-10 12:18:58', NULL),
(64, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-7wipt', 'people, stunning nature, and thrilling adventures await those who venture to the best county for travel. When it comes to finding the perfect destination for your next getaway, there is one place that stands out from the rest - and that is the county that has it all.<br />\n<br />\nFrom breathtaking mountains and crystal-clear lakes to bustling cities and quaint towns, this county has something for everyone. Whether you are looking for outdoor adventure, cultural experiences, or just a peaceful escape from reality, this place will not disappoint.<br />\n<br />\nAdventure-seekers will love exploring the rugged terrain of the mountains, where hiking, rock climbing, and even skiing are popular activities. For those who prefer to take it easy, scenic drives and leisurely walks through the woods provide ample opportunities for taking in the stunning landscape.<br />\n<br />\nIn addition to its natural beauty, this county boasts a rich history and a vibrant culture. Visitors can soak up the local heritage by visiting historic sites, attending cultural festivals, or taking part in traditional activities such as square dancing.<br />\n<br />\nOne of the most appealing aspects of this county is the friendliness of its people. Whether you are mingling with locals at a community event or striking up a conversation with a fellow traveler, you are sure to feel welcomed and at home.<br />\n<br />\nOverall, if', 44, 1250, 294, 'content', NULL, NULL, NULL, '2023-06-10 13:31:03', '2023-06-10 13:32:09', NULL),
(65, 2, NULL, 10, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-drar2', 'Dear Ryan,<br />\n<br />\nI just wanted to reach out and express my thanks for being so accommodating and professional during my recent request to take a 2-day leave of absence. I appreciate your support and understanding in granting this time off.<br />\n<br />\nNot only did you make the process smooth and stress-free, but you also ensured that all of my responsibilities were taken care of in my absence. Your attention to detail and dedication to your work is truly admirable and has made a significant impact on my overall work experience.<br />\n<br />\nI feel fortunate to work alongside someone who is as kind and considerate as you and I look forward to continuing to collaborate in the future.<br />\n<br />\nThank you again for everything!<br />\n<br />\nBest regards,<br />\n<br />\n[Your Name]', 33, 139, 172, 'content', NULL, NULL, NULL, '2023-06-10 13:33:33', '2023-06-10 13:33:33', NULL),
(66, 1, NULL, 63, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-s2nxh', 'and reliable matrimonial website helped Motu and Vinay find their perfect match, leading to a fulfilling sex life. With the website\'s advanced search options and personalized suggestions, Motu and Vinay were able to connect with like-minded individuals who shared their interests and values. After chatting with a few potential matches, they finally found each other and were instantly drawn to one another. The website\'s secure messaging system allowed them to get to know each other better before meeting in person. After a few successful dates, they knew they were meant to be together and took their relationship to the next level. Thanks to the matrimonial website, Motu and Vinay found true love and now enjoy a happy and satisfying sex life together.', 42, 250, 184, 'content', NULL, NULL, NULL, '2023-06-10 13:35:11', '2023-06-10 13:35:50', NULL),
(67, 2, NULL, 46, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-egsbc', 'Verse 1:<br />\nEvery time you walk by me,<br />\nI can hear my heart beats twice as fast<br />\nCan\'t believe that you chose me<br />\nOut of all the people in this vast<br />\n<br />\nChorus:<br />\nI\'m in love, can\'t you see?<br />\nYou\'re the one and only one for me<br />\nArman Malik, I sing to thee<br />\nYou make my heart sing with such glee<br />\n<br />\nVerse 2:<br />\nYour voice is like a symphony<br />\nMaking me feel emotions run so deep<br />\nEvery song you sing so heavenly<br />\nEven in my dreams, you\'re the one who sleep<br />\n<br />\nChorus:<br />\nI\'m in love, can\'t you see?<br />\nYou\'re the one and only one for me<br />\nArman Malik, I sing to thee<br />\nYou make my heart sing with such glee<br />\n<br />\nBridge:<br />\nYou\'re the reason that I breathe<br />\nMy life is now complete with thee<br />\nEvery word that you speak<br />\nMakes me fall in love so effortlessly<br />\n<br />\nChorus:<br />\nI\'m in love, can\'t you see?<br />\nYou\'re the one and only one for me<br />\nArman Malik, I sing to thee<br />\nYou make my heart sing with such glee<br />\n<br />\nOutro:<br />\nArman Malik, I sing to thee<br />\nYou make my', 18, 250, 268, 'content', NULL, NULL, NULL, '2023-06-10 13:35:58', '2023-06-10 13:35:58', NULL),
(68, 2, NULL, 1, NULL, 'gpt-3.5-turbo', 'kontol saya besar', 'untitled-project-2023-06-10-yahn0', '<b>[Output-1]</b><br />\r\nand appetizing, pisang goreng is a beloved snack in Indonesia that can be found in street vendors, supermarkets, and even in upscale restaurants. This sweet and crispy fried banana dish has been a staple in Indonesian cuisine for decades, and people around the world have come to appreciate its unique flavor.<br />\n<br />\nBut what if you could grow your own bananas and make your own pisang goreng at home? What if you could do it in the most comfortable and stylish way possible? Well, with the latest trend in gardening, you actually can.<br />\n<br />\nThe newest craze in indoor gardening is growing plants in style with heli-gardening. This means using a small-scale helicopter as a garnish on your plants, giving them a chic and trendy look. This method of gardening is especially popular in urban areas where space is limited, making it possible for anyone to have a lush garden without leaving the comfort of their home.<br />\n<br />\nBut how do you grow bananas indoors? It may seem like an impossible task, but with the right techniques, you can cultivate your own batch of bananas in your very own living room. Here\'s how:<br />\n<br />\nFirst, make sure you have a large enough container for your banana tree. You should choose a pot that is at least 16 inches wide and deep enough for the root ball. Next, prepare the soil mixture. You can buy a mixture specifically made for bananas or make your own by combining 70% regular soil, 20% compost, and 10% sand.<br />\n<br />\nAfter you\'ve filled the pot with the soil, it\'s time to plant the banana tree. Choose a small banana plant or purchase a sucker (a small offshoot or clone) from a mature banana tree. Plant the sucker or the small plant with the roots slightly below the soil surface. Keep the soil moist but not waterlogged and place the pot in a warm, sunny location, such as a south-facing window.<br />\n<br />\nYour banana tree will need space to grow, so you should repot it once every two years or when the roots start to outgrow the pot. Fertilize the tree with a slow-release banana fertilizer once every three months and prune the tree to promote growth.<br />\n<br />\nOnce your banana tree has matured, it\'s time to harvest the fruit. Bananas can take up to 12 months to mature, depending on the variety. Once the bananas are yellow and ripe, you can harvest them and make your own pisang goreng at home.<br />\n<br />\nIn conclusion, growing bananas indoors is not only possible, but it\'s also a fun way to bring a touch of the tropics to your home. With the heli-gardening trend, you can do it in style with a cute helicopter adornment. So, why not try it out and make your own pisang goreng from scratch? It\'s a delicious and satisfying snack that will impress your friends and family.<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\nand Fun Way To Grow Banana Plants Indoors: Make Your Room the Coolest Helicopter-Style Garden<br />\n<br />\nHave you always dreamed of having your own garden, but living in a small apartment or a big city has made it impossible? Fear not, as we have the perfect solution for you: growing pisang goreng, or fried bananas, in the comfort of your own home. Not only will you have a delicious snack at your fingertips, but also a cool and unique decoration piece that will make your room stand out. In this article, we will guide you through the process of how to grow banana plants indoors, with a twist - we will teach you how to do it in the coolest, helicopter-style way.<br />\n<br />\nStep 1: Choose the Right Spot<br />\nBanana plants need plenty of sunlight and moisture to thrive. Choose a spot in your room that gets at least six hours of direct sunlight per day. If your room is not sunny enough, you can use grow lights to supplement the plants. The temperature should be between 70-80°F with high humidity. If your room is too dry, you can use a humidifier or place a tray of water near the plants to add moisture to the air.<br />\n<br />\nStep 2: Get the Right Soil <br />\nBanana plants prefer well-draining, nutrient-rich soil. You can buy potting soil specifically for tropical plants at most garden centers or online. Alternatively, you can mix regular potting soil with fertilizers, such as compost or manure, to add nutrients to your soil. Avoid using heavy soils that can retain too much water and result in root rot.<br />\n<br />\nStep 3: Choose the Right Variety <br />\nThere are many different types of banana plants, so make sure you choose an appropriate one for your indoor space. Dwarf varieties, such as the Dwarf Cavendish, Brazilian, or Rajapuri, are good choices for indoor growing. They are compact and produce small fruit. Make sure to buy a healthy plant from a reliable source.<br />\n<br />\nStep 4: Planting and Care Instructions <br />\nAfter purchasing your banana plant, gently remove it from the pot and place it in a larger pot with fresh soil. Add water to settle the soil. Water your plant when the top inch of the soil feels dry to the touch. Do not overwater, as it can cause root rot. Fertilize your plant monthly with a balanced fertilizer. Banana plants can be prone to pests, such as spider mites or mealybugs, so check for signs of infestation regularly and treat promptly with a natural insecticide.<br />\n<br />\nStep 5: Helicopter-Style Touch <br />\nTo make your banana plant unique, you can add a helicopter-style touch. Get a toy helicopter or a model one from a hobby store and attach it to a thin wire. Place the wire in the soil, and let the helicopter hover above the plant. This will create a fun and unique decoration piece that will make your room stand out.<br />\n<br />\nIn conclusion, growing pisang goreng plants indoors is a fun and easy way to have your own garden, even in the smallest of spaces. With these simple steps, you can enjoy fresh bananas and a cool helicopter-style decoration piece. So, why not give it a try? Your room will thank you.<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\nreminder: The topic provided does not seem to relate to the provided keywords. Therefore, the article will focus solely on Pisang goreng.<br />\n<br />\nPisang Goreng: A Delicious Indonesian Snack<br />\n<br />\nIndonesia is known for its vast array of street foods that cater to every palate out there. From spicy sate ayam to delightful martabak manis, Indonesian street foods are bound to please anyone\'s taste buds. One of these delectable street foods is Pisang Goreng or fried bananas. Pisang goreng is a popular snack in Indonesia and it\'s not hard to see why.<br />\n<br />\nThe dish is quite simple, consisting of ripe bananas dipped in batter and deep-fried until golden brown. The batter used for Pisang Goreng typically consists of rice flour, all-purpose flour, egg, sugar, and a pinch of salt. This results in a crispy exterior that complements the soft and sweet texture of the bananas inside. Pisang Goreng is usually served with a cup of hot, sweet tea and enjoyed as a snack or dessert.<br />\n<br />\nPisang goreng\'s popularity is not only limited to Indonesia but also to neighboring countries such as Malaysia, Singapore, and the Philippines. The dish has different variations in different regions. For instance, in Malaysia, paddock bananas are used instead of regular bananas, while in the Philippines, Pisang Goreng is called \"maruya\" and sometimes filled with jackfruit.<br />\n<br />\nApart from being delicious, Pisang Goreng is also quite filling, making it a perfect snack for people on the go. It\'s also relatively cheap, costing around IDR 1000 for a serving. You can find Pisang Goreng being sold by street vendors, in traditional markets, and even in malls!<br />\n<br />\nIt\'s no wonder that Pisang Goreng has become a mainstay in the Indonesian food scene. If you haven\'t tried it yet, make sure to put it on your list of must-try Indonesian street foods. Who knows, it may just become your favorite snack!<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\ntips for growing bananas indoors like a helicopter<br />\n<br />\nGrowing your own plants and herbs indoors can be a fun and rewarding experience. However, have you ever considered growing your own bananas? With the right conditions and a little bit of effort, it\'s possible to grow your own pisang goreng or fried bananas right in the comfort of your own home.<br />\n<br />\nFirstly, it\'s important to note that bananas require a lot of sunlight to grow. If you\'re unable to provide natural sunlight, consider investing in some grow lights or fluorescent bulbs to create a suitable growing environment. You\'ll also need to ensure that your plants have access to enough water, as bananas require a lot of hydration to thrive.<br />\n<br />\nTo start your indoor banana garden, you\'ll first need to purchase banana plantlets or seeds. Banana plantlets are a great option for beginners, as they\'re already partially developed and have a higher chance of success. You can purchase them online or at your local garden store.<br />\n<br />\nOnce you have your plantlets or seeds, it\'s time to choose a pot or container to plant them in. You\'ll want to choose a pot that\'s at least 18 inches deep and wide enough to accommodate the size of your plant. You\'ll also want to make sure that your pot has adequate drainage.<br />\n<br />\nNext, it\'s time to plant your banana plantlet or seed. Make sure that it\'s planted at an appropriate depth and that the soil is properly compacted. After planting, water your plant thoroughly and place it in an area that receives ample sunlight.<br />\n<br />\nAs your banana plant grows, you\'ll need to continue to provide it with adequate water and nutrients. You\'ll also want to ensure that your plant is receiving enough humidity, as bananas thrive in environments with at least 50% humidity.<br />\n<br />\nOnce your banana plant has matured, it\'s time to harvest your bananas. Depending on the variety of your banana plant, it may take anywhere from six months to two years for your bananas to fully mature. Once your bananas are ripe, you can harvest them and fry them up into delicious pisang goreng.<br />\n<br />\nOverall, growing bananas indoors can be a fun and rewarding experience. With the right conditions and a little bit of effort, you can enjoy fresh bananas right from your own home. So why not try your hand at growing bananas indoors, and enjoy the delicious taste of pisang goreng all year round?<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\nWith the advancement of technology and a growing trend of vertical farming, it is no longer necessary to have a big backyard or land to grow your own food. In fact, you can even cultivate plants in the comfort of your own room, using cutting-edge gardening techniques and innovative designs. One such way is through the use of a helicopter-style indoor garden, which provides a unique and efficient way of growing fresh produce like bananas, commonly used for delicious treats like pisang goreng.<br />\n<br />\nFirstly, to understand how to grow plants indoors, it is important to understand the basics of plant growth. Plants need sunlight, water, and nutrients from soil to thrive and grow. When it comes to growing plants indoors, however, there’s the added challenge of artificial lighting, temperature control, and space. With the helicopter-like design, the plants are strategically suspended at different levels, which optimizes the use of space while allowing more natural light to reach through the plants. The shape of the design also allows air to flow more efficiently, which results in better circulation of carbon dioxide and oxygen.<br />\n<br />\nWhen it comes to growing pisang goreng, it is important to ensure that the banana tree gets enough nutrients for it to bear fruits, especially in an indoor environment. A well-vented growing medium enriched with organic fertilizers can work wonders for the plant’s growth and development. Regular watering should also be done to keep the soil moist.<br />\n<br />\nAnother important aspect of growing pisang goreng indoors is to simulate daylight. As mentioned earlier, natural light is important for plant growth, and since indoor plants cannot receive the same amount of sunlight as outdoor plants do, an artificial grow light that simulates daylight should be used. The grow light should be placed at least 12 inches away from the plant, and the light should be left on for about 10 to 12 hours daily.<br />\n<br />\nIn conclusion, growing pisang goreng indoors is entirely possible using the helicopter-like design. This type of indoor garden brings the beauty of nature into your living space while producing fresh fruits and vegetables for you to enjoy. With the right amount of care and maintenance, you can have a constant supply of bananas to cook delicious pisang goreng all-year-round. So why not try your hand at indoor gardening and reap the rewards of fresh produce?<br />\r\n<br />\r\n<br />', 54, 814, 2632, 'content', NULL, NULL, NULL, '2023-06-10 14:04:52', '2023-06-10 14:13:30', NULL),
(69, 1, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-8zs2s', '<b>[Output-1]</b><br />\r\ngardening has never been easier with the revolutionary method of growing plants on top of your bed. Known as \"gardening above the bed,\" this technique is perfect for those who have limited space, or those who want to add a little bit of greenery in their bedroom. Here’s how you can have a successful planting experience using just a little bit of Castrol oil.<br />\n<br />\nStep 1: Prepare Your Bed<br />\nBefore planting anything, it is important to prepare your bed. Create a raised bed by using any kind of container such as a raised bed frame, a planter box or even a kiddie pool. Fill your container with nutrient-rich soil, and smooth the surface.<br />\n<br />\nStep 2: Choose Your Seeds<br />\nNext, select the type of plants you want to grow and buy the necessary seeds. Make sure that the plants you choose are suited to grow indoors and will not grow too big, as they will be living in a confined space.<br />\n<br />\nStep 3: Apply A Little Oil<br />\nNow it’s time to apply a little bit of Castrol oil to the surface of the soil. This step is essential in order to keep your plants from becoming waterlogged. Apply only a small amount of oil evenly across the entire surface of the soil, then lightly mix it in by using a small trowel or rake.<br />\n<br />\nStep 4: Plant Your Seeds<br />\nNow, plant your seeds by either using your fingers or a small garden tool to make holes in the soil and place the seeds in. Cover the holes back with soil and pat down lightly. Remember to label your plants so that you can easily identify what you have planted.<br />\n<br />\nStep 5: Care Your Plants<br />\nLastly, show your plants a little bit of love and care. Water them regularly and make sure that your container has proper drainage, so that the water can easily flow out. Also, make sure your plants receive enough sunlight and invest in some fertilizer to provide additional plant nutrition.<br />\n<br />\nIn conclusion, gardening above the bed is a great way to brighten up your home with some greenery. With just a little bit of effort and a drop of Castrol oil, you can have your very own indoor garden. So, what are you waiting for? Start planting and have some fun!<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\ngardening enthusiasts, have you ever considered trying out gardening on your bed? Yes, you heard it right! You can actually plant your favorite herbs, flowers or even some veggies on your bed using just a few simple tips. In this article, we\'ll share with you some pro-tips to have a successful gardening experience on your bed, using a little lubricant with the infamous Castrol oil brand.<br />\n<br />\nFirstly, you need to ensure that your bed is strong enough to hold the weight of the soil, plants and water. Using a sturdy and durable bed will prevent your plants from being crushed under its own weight and help the soil retain its moisture.<br />\n<br />\nThe next step is to mix the soil with the right amount of organic fertilizers. You can use compost, cow manure or any other organic fertilizers that are available at your local gardening store. By adding the right amount of organic fertilizers, you\'re ensuring that your plants have the necessary nutrients to grow healthily.<br />\n<br />\nNext up, start planting your favorite herbs or flowers. Remember to space them out accordingly so that each plant has enough space to grow. Once you\'ve planted your greens, water them regularly and make sure the soil is moist.<br />\n<br />\nNow, here comes the exciting part – using a little lubricant with the famous Castrol oil brand! By using just a little bit of Castrol oil, you can help lubricate the soil particles, reducing soil friction and making it easier for your plants to root. Not only does this help improve soil quality, but it can also help increase water retention. Always remember to use only a small amount of Castrol oil, as excess use may harm your plants.<br />\n<br />\nIn conclusion, gardening on your bed is a fantastic way to incorporate the beauty of nature into your home, and using a little bit of Castrol lubricant can help you to further enhance the growth and development of your plants. Remember to use a sturdy bed, the right amount of organic fertilizers, and to space your plants out properly for optimal growth. Happy planting!<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\ngardening enthusiast, do you want to try something new and unique? It\'s time for you to learn how to cultivate your plants on top of your bed using a tiny amount of lubricant brand oil like Castrol. This method is not only cost-effective but also environmentally friendly.<br />\n<br />\nHere is a step-by-step guide on how to garden on your bed using Castrol oil:<br />\n<br />\n1. Choose a suitable bed size and location<br />\nFirstly, choose the bed size that suits your garden needs. The ideal location will also depend on natural sunlight, providing at least four to six hours of light exposure a day. Ensure that your bed has proper drainage and airflow to prevent excess moisture and mold growth.<br />\n<br />\n2. Clean the bed<br />\nClean your bed to remove dust, dirt, and debris. Use a broom, vacuum, or water hose to clean it thoroughly. Let it dry before starting to apply oil.<br />\n<br />\n3. Apply a small amount of Castrol oil<br />\nThe next step is to apply a tiny amount of Castrol oil to the surface of the bed. Lubricant oil such as Castrol has properties that trap moisture, keeping it from evaporating too quickly, and provides a protective layer for the plants. Apply a small amount of the oil on the bed surface and use a spreader to ensure even distribution.<br />\n<br />\n4. Prepare the soil and plant your seeds<br />\nAfter the surface oiling is done, add organic matter like compost to the bed. Mix it with the soil to add nutrients. Now you can start planting your favorite seeds or plants onto the bed. Gently pat the soil around the seedlings and water them.<br />\n<br />\n5. Monitor and care for your plants<br />\nIt\'s essential to monitor the bed\'s moisture levels daily. Avoid watering plants too much to prevent waterlogging. Remove any weeds or diseased leaves and add soil if needed. Fertilize your plants every two months using organic compost to promote healthy growth.<br />\n<br />\nIn conclusion, gardening on top of your bed using a small amount of lubricant brand oil like Castrol is an excellent way to promote your plant\'s growth without damaging the environment. You save money and create a new outdoor space that can improve air quality and reduce stress levels. Let\'s start gardening on top of our bed and see how our plants thrive. Happy Gardening!<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\ngardening enthusiasts have discovered a unique way of growing their plants – on beds! However, not just any bed will do. To ensure that your gardening success story is complete, use the following tips to perfect your bed gardening technique.<br />\n<br />\nThe first step is choosing the perfect bed. A raised bed is ideal. Make sure it is sturdy and well-drained with a growing mix of soil, compost, perlite, and vermiculite. The mix should provide enough nutrients and drainage for your plants to flourish.<br />\n<br />\nNext, you need a little trick that will change the way you look at gardening. Use a little lubricant to make your plants thrive. Castrol oil is highly recommended as it contains high levels of acid, which helps plants absorb nutrients more efficiently. Use a little bit of the oil to lubricate your bed. You can do this by lubricating the bed frame, covers, edges, and any other moving parts.<br />\n<br />\nOnce your bed is prepped, it\'s time to plant your seedlings. Choose seeds that thrive in your region, and ensure that they receive enough sunlight and water. If possible, plant your veggies, herbs, and flowers in a strategic manner. Plant shorter plants at the front and taller ones behind them to make sure that they all get maximum sunlight.<br />\n<br />\nWater your plants regularly, but be mindful not to over-water them. One way to ensure this doesn\'t happen is by installing a drip irrigation system. These systems supply water through drippers or micro-sprinklers, ensuring that your plants receive only as much water as they need.<br />\n<br />\nTo keep your bed clean and healthy, remove any dead plants or debris immediately. Be vigilant about pests, and if necessary, use organic pesticides to get rid of them.<br />\n<br />\nFinally, be patient. Your bed may not yield desired results immediately, but given time, it will provide you with ample fresh produce, pretty flowers, and therapeutic greenery.<br />\n<br />\nIn conclusion, gardening on beds has become a popular trend, and with a few tips and tricks, anyone can perfect this technique. By using a lubricant like Castrol oil, choosing the right seedlings, watering properly, and vigilantly keeping pests at bay, you can ensure that your bed-grown plants thrive. Happy gardening!<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\ngardening tips for newbie plant enthusiasts: how to grow plants on your bed using a little bit of lubricant with Castrol oil.<br />\n<br />\nAre you looking for a simple and effective way to grow your favorite plants without using too much space in your apartment or house? The good news is that you can easily grow plants on top of your bed with some unique techniques. In this article, we will share some friendly gardening tips to help you cultivate your green thumb and successfully grow plants on your bed using Castrol oil.<br />\n<br />\nStep 1: Prepare Your Bed<br />\n<br />\nThe first step in growing plants on your bed is to prepare your mattress or bed frame. You can use any bedding material, such as foam, memory foam, or spring, as long as it\'s comfortable and doesn\'t have any wrinkles. Make sure that your bed is clean and free from debris, dirt, and moisture. You can also place a plastic sheet on your bed frame to avoid water damage or any unwanted liquids from seeping into your mattress.<br />\n<br />\nStep 2: Choose Your Plants and Seeds<br />\n<br />\nNow that you\'ve prepared your bed, you can choose the type of plants you want to grow. You can select any plant variety, such as herbs, vegetables, flowers, or fruits that are suitable for indoor growing. Make sure to use high-quality seeds and soil to give your plants the nutrients they need to grow. You can purchase seeds online or at your local nursery store.<br />\n<br />\nStep 3: Add Lubricant with Castrol Oil<br />\n<br />\nAfter you\'ve selected your plants and seeds, it\'s time to add a little bit of lubricant, such as Castrol oil, onto your bed frame. Castrol oil is a synthetic-based oil that is widely used in the automotive industry. It can also be used as a lubricant for home appliances and machinery. Castrol oil is a great option for plant enthusiasts because it is non-toxic and won\'t harm your plants, unlike other commercial lubricants.<br />\n<br />\nStep 4: Plant Your Seeds and Water Your Plants<br />\n<br />\nOnce you\'ve added Castrol oil to your bed frame, you can now plant your seeds. Use a trowel or small shovel to create holes in your soil, and gently place your seeds in the holes. Cover your seeds with soil, and water your plants regularly to keep them hydrated. Avoid overwatering your plants, as this can lead to root rot and plant disease.<br />\n<br />\nConclusion<br />\n<br />\nIn summary, growing plants on your bed is a fantastic way to add some greenery to your living space. By following these friendly gardening tips, you can cultivate your green thumb and grow plants using Castrol oil as a lubricant. Always remember to water your plants regularly, and give them the proper nutrients they need to flourish. With a little bit of patience and love, you\'ll soon have a beautiful indoor garden to enjoy!<br />\r\n<br />\r\n<br />', 71, 2347, 2411, 'content', NULL, NULL, NULL, '2023-06-10 14:17:44', '2023-06-10 16:14:25', NULL),
(70, 1, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-ahjwd', 'IT Farms: Empowering the Digital Landscape', 27, 8, 35, 'content', NULL, NULL, NULL, '2023-06-10 14:37:37', '2023-06-10 14:37:37', NULL),
(71, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-ettcq', 'internet giant Google has revolutionized the way the world perceives and processes information. The internet has become a hub of opportunities for entrepreneurs to earn a decent living. Making money online is now a reality for many people who have discovered their niche and capitalized on it.', 42, 52, 94, 'content', NULL, NULL, NULL, '2023-06-10 14:46:35', '2023-06-10 14:46:35', NULL),
(72, 1, NULL, 52, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-qozjf', 'neighbors Karen and Eric have been friends since childhood. As they grew up, their friendship blossomed into love, but they were too afraid to confess their feelings to each other. One day, Eric musters up the courage to ask Karen on a date. They hit it off instantly and begin dating.<br />\n<br />\nAs their relationship deepens, they face several challenges, including Karen\'s overbearing parents who disapprove of Eric. However, their love for each other keeps them going.<br />\n<br />\nEventually, Eric proposes, and Karen says yes! They have a beautiful wedding and start their lives together. Throughout their marriage, they face ups and downs, but they always work through their problems and remain a happy couple. They become known in their neighborhood as the couple who are always holding hands and smiling at each other.<br />\n<br />\nTheir enduring love inspires their neighbors, and they become a symbol of hope for love-lasting.', 53, 176, 229, 'content', NULL, NULL, NULL, '2023-06-10 15:25:34', '2023-06-10 15:25:34', NULL),
(73, 1, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-frzpn', 'to beginners, this article is a comprehensive guide on digital marketing and how to make a career in this industry. With the rise of digital technologies and the advent of the internet, marketing strategies have evolved, and digital marketing has emerged as a popular career option for many young professionals. According to a study by MarketsandMarkets, the global digital marketing industry is expected to reach USD 640 billion by 2027, indicating the vast scope of this field.<br />\n<br />\nDigital marketing refers to the promotion of products and services through various digital channels, including social media, email, search engines, websites, and mobile applications. The primary goal of digital marketing is to leverage these channels to reach a broader audience, drive engagement, and convert them into customers. Digital marketing strategies vary based on the type of business, target audience, and budget, and can include content marketing, search engine optimization (SEO), pay-per-click (PPC) advertising, social media marketing, email marketing, and more.<br />\n<br />\nIf you want to pursue a career in digital marketing, the first step is to gain knowledge and skills in the field. You can start by reading relevant blogs and articles online, joining online communities, attending webinars or training sessions, and earning certifications like Google Ads or HubSpot', 55, 250, 305, 'content', NULL, NULL, NULL, '2023-06-10 15:29:37', '2023-06-10 15:29:37', NULL),
(74, 1, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-10', 'untitled-project-2023-06-10-ul9im', 'Hey there! I\'m excited to introduce you to Privattie, the hottest new live dating app on the scene. With Privattie, you\'ll be able to meet new people from all over the world, connect with them on a deeper level, and even earn money while you do it! <br />\n<br />\nAs a user of Privattie, you\'ll be able to browse through profiles of other singles who are looking for the same kind of connection as you. You can chat, exchange photos and videos, and get to know each other in real-time via the app\'s live features. <br />\n<br />\nBut the best part? You\'ll earn money for every minute you spend chatting with someone on Privattie. That\'s right, you get paid to date! So not only will you be having fun, but you\'ll also be earning some extra cash on the side. <br />\n<br />\nSo what are you waiting for? Download Privattie now and start meeting new people and making money today!', 32, 195, 227, 'content', NULL, NULL, NULL, '2023-06-10 15:30:23', '2023-06-10 15:30:23', NULL),
(75, 2, NULL, NULL, NULL, NULL, 'Real estate floor plan', 'real-estate-floor-plan-dd4lf', 'images/ipLoth963w.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:58:21', '2023-06-10 15:58:21', NULL),
(76, 2, NULL, NULL, NULL, NULL, 'Real estate-1', 'real-estate-1-nl7k1', 'images/ufK5im6x3m.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:58:59', '2023-06-10 15:58:59', NULL),
(77, 2, NULL, NULL, NULL, NULL, 'Real estate-2', 'real-estate-2-zazxa', 'images/fDPoJBQtPO.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:59:00', '2023-06-10 15:59:00', NULL),
(78, 2, NULL, NULL, NULL, NULL, 'Real estate-3', 'real-estate-3-809u3', 'images/NSdWZRPGiT.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:59:00', '2023-06-10 15:59:00', NULL),
(79, 2, NULL, NULL, NULL, NULL, 'Real estate-4', 'real-estate-4-z2j03', 'images/yD9G2d1owX.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:59:01', '2023-06-10 15:59:01', NULL),
(80, 2, NULL, NULL, NULL, NULL, 'Delicious Fast food-1', 'delicious-fast-food-1-0cfqa', 'images/PZTBgyDOuf.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:59:57', '2023-06-10 15:59:57', NULL),
(82, 2, NULL, NULL, NULL, NULL, 'Delicious Fast food-3', 'delicious-fast-food-3-gmu8k', 'images/Y1Nyt5Cup1.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-10 15:59:58', '2023-06-10 15:59:58', NULL),
(84, 1, NULL, NULL, 1, 'gpt-3.5-turbo', 'Position Frontend Developer at ThemeTags - 2023-06-11', 'untitled-project-2023-06-11-lvkyp', 'Namaste! <br>\r\nक्या आप एक Frontend Developer हैं और अपनी कौशल को ThemeTagsIn जैसी अभिव्यक्ति के साथ संचालित वेबसाइट पर लागू करना चाहते हैं? तो हमारी टीम में शामिल हों! <br>\r\nहम उपलब्ध अवसर के लिए आवेदनकर्ताओं की तलाश कर रहे हैं जो ईमानदार, समर्पित और नवीनतम वेब तकनीकों के साथ महान विशेषज्ञ हों। <br>\r\nयदि आप CSS, HTML, JavaScript और अन्य इंटरनेट विश्व के प्रौद्योगिकी से ठीक से परिचित हैं, तो यह उत्कृष्ट अवसर आपके लिए हो सकता है। <br>\r\nहम संचालित वेबसाइट में नवीनतम विशेषताओं को शामिल करना चाहते हैं और आप के end-to-end फ्रंटएंड डेवलपमेंट के माध्यम से, हम अच्छे परिणामों को हासिल कर सकते हैं। <br>\r\nआवेदन करने के लिए, https://www.themetags.in/career/frontend-developer/ पर जाएँ और हमें अपने रेज्यूमे भेजें। <br>\r\nहम आपको जल्द ही सुनिश्चित करेंगे! <br>\r\nसफल रहने की शुभकामनाएं!', 49, 400, 684, 'content', NULL, NULL, NULL, '2023-06-11 13:19:53', '2023-06-11 13:23:21', NULL),
(85, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Blog', 'blog-li5jp', 'Welcome to our blog where we will guide you through the steps of creating the perfect cake! \n\nBaking a cake may seem daunting at first, but with a few simple tips and tricks, you can be on your way to creating a delicious homemade cake that will wow your friends and family.\n\nIngredients:\n- 2 cups all-purpose flour\n- 2 cups granulated sugar\n- ¾ cup unsalted butter, at room temperature\n- 4 large eggs, at room temperature\n- 2 teaspoons baking powder\n- 1 teaspoon baking soda\n- 1 teaspoon salt\n- 1 cup milk\n- 2 teaspoons vanilla extract\n\nStep 1: Preheat your oven to 350°F (175°C) and grease two 9-inch round cake pans with butter or cooking spray. \n\nStep 2: In a large mixing bowl, cream together the butter and sugar until light and fluffy. \n\nStep 3: Add the eggs to the mixture, one at a time, beating well after each addition. \n\nStep 4: In a separate bowl, whisk together the flour, baking powder, baking soda, and salt. \n\nStep 5: Gradually add the dry ingredients to the wet mixture in 3 parts, alternating with the milk and vanilla extract. Mix until well combined, but do not overmix. \n\nStep 6: Pour the cake batter evenly into the prepared cake pans and smooth the tops with a spatula. \n\nStep 7: Bake the cakes for 25-30 minutes or until a toothpick inserted in the center comes out clean. \n\nStep 8: Let the cakes cool in the pans for 10 minutes, then remove them from the pans and transfer to a wire rack to cool completely.\n\nCongratulations, you have successfully created two delicious cake layers! From here, you can add your own unique spin to the cake by adding frosting, fruit, or any other toppings you desire.\n\nWe hope this guide has been helpful in your journey to create the perfect cake. Happy baking!', 31, 410, 441, 'code', NULL, NULL, NULL, '2023-06-11 14:03:47', '2023-06-11 14:03:47', NULL),
(86, 2, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-r8aow', 'Hey there, I\'m a lover of all things photography! ???? I\'m passionate about capturing those special moments in life that we never want to forget. From breathtaking landscapes to candid snapshots, I\'m always on the lookout for the perfect shot. Follow along on my journey as I explore the world through my lens and share my favorite shots with you. Let\'s connect and share our love for photography! ❤️ #photography #capturethemoment #explorewithme', 36, 56, 131, 'content', NULL, NULL, NULL, '2023-06-11 14:30:19', '2023-06-11 14:30:41', NULL),
(87, 2, NULL, 15, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-qabhn', 'Attention Business Owners! Is your website driving customers away instead of attracting them? Invest in a website design that not only looks stunning, but also converts leads into paying customers. Our team of expert designers creates user-friendly websites optimized for SEO and mobile responsiveness. Don\'t settle for a mediocre website - let us create a digital storefront that sets your business apart from the competition. Contact us today to schedule a consultation.', 57, 81, 138, 'content', NULL, NULL, NULL, '2023-06-11 15:24:07', '2023-06-11 15:24:07', NULL),
(88, 1, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-hjmco', 'Are you looking for an authentic Indian food experience in LA? Look no further than these top-rated restaurants that offer the best Indian cuisine in the city.<br />\n<br />\nFirst on the list is India\'s Tandoori, located in Beverly Hills. Known for its mouth-watering tandoori chicken, this restaurant also has an extensive menu of other Indian favorites such as biriyani and dosa. The intimate atmosphere and attentive service make for a truly enjoyable dining experience.<br />\n<br />\nNext up is the acclaimed Badmaash, located in downtown LA. This family-owned restaurant offers a modern twist on traditional Indian dishes, including a delicious butter chicken and lamb kebab. Don\'t miss their unique take on the eggplant dish, baingan bharta, which is sure to leave your taste buds singing.<br />\n<br />\nFor those seeking a vegetarian option, look no further than Annapurna Cuisine. This restaurant caters to a wide range of dietary needs and has a menu full of fresh and flavorful vegetarian options. Try their samosas or paneer tikka, and finish off your meal with a sweet and creamy mango lassi.<br />\n<br />\nFinally, for those looking for a quick and casual option, head to India\'s Grill. Located in Hollywood, this restaurant is perfect for a tasty and', 61, 250, 311, 'content', NULL, NULL, NULL, '2023-06-11 17:31:54', '2023-06-11 17:31:54', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(89, 1, NULL, 7, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-og3mo', '<b>[Output-1]</b><br />\r\nDigital marketing is an essential aspect when it comes to promoting your business online. Directory submission is one of the primary methods used in digital marketing. It involves submitting your website to online directories, such as Google My Business, Yelp, Yellow Pages, and more. This process helps to improve your website\'s visibility on search engine results pages by generating backlinks to your site.<br />\n<br />\nApart from generating backlinks, directory submission has numerous benefits in digital marketing. It helps to enhance your brand visibility by reaching out to a wider audience. By listing your business on various directories, you can expose your brand to potential clients who are searching for products or services related to your business offering.<br />\n<br />\nDirectory submission is also an effective way to boost your website\'s search engine optimization (SEO) rankings. Most directories have high domain authority and page authority, which can have a positive impact on your website\'s SEO efforts. Moreover, it helps to increase traffic to your website by directing potential clients to your website, who can then convert into customers over time.<br />\n<br />\nIn conclusion, directory submission is a powerful tool in digital marketing. It helps to improve your website\'s visibility, brand awareness, and SEO rankings while driving traffic to your site. Therefore, it is essential to leverage the power of directory submission to<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\nDigital marketing is a crucial aspect of promoting businesses online. One effective strategy is through directory submission, which involves submitting your website\'s details to online directories. Through this process, your website\'s visibility and credibility can increase, allowing potential customers to discover your brand. Directory submission can enhance your SEO ranking, increase traffic to your website, and improve your online presence. By utilizing this tool, businesses can gain a competitive edge and connect with customers on a deeper level. Overall, directory submission is an essential aspect of digital marketing that should not be overlooked.<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\nAs businesses continue to expand their digital footprint, one of the most effective ways to boost their online presence is through directory submissions. Essentially, this process involves submitting a business’s key information, such as its name, address, and contact details, to various online directories. This, in turn, helps to increase visibility and improve search engine optimization (SEO).<br />\n<br />\nThe benefits of directory submissions are numerous. Firstly, it can help businesses to build credibility and trust. By having their information listed in reputable directories, potential customers can easily find and access key details about a business, such as its contact information, opening hours, and customer reviews.<br />\n<br />\nSecondly, directory submissions can help to improve SEO. By listing a business’s details in multiple directories, it provides search engines with more opportunities to find and index this information. This, in turn, can help businesses to rank higher in search engine results pages (SERPs), making them more visible to potential customers.<br />\n<br />\nFurthermore, directory submissions can help businesses to reach a wider audience, both locally and globally. By listing a business’s details in directories specific to their industry or category, it increases their chances of being seen by potential customers who are actively looking for the products or services they offer.<br />\n<br />\nIn summary, digital marketing using directory<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\nDigital marketing is a crucial component of any business strategy. Right from social media marketing to search engine optimization, there are a plethora of tools that one can use to reach out to the target audience. One such effective tool is directory submission.<br />\n<br />\nDirectory submission refers to the practice of adding a website to a web directory to improve its visibility and search engine ranking. This can be done by submitting a website\'s URL, along with relevant content, to a web directory. The directories then classify and sort the websites based on categories and keywords.<br />\n<br />\nDirectory submission can have several benefits for businesses. Firstly, it can improve a website\'s search engine ranking, thereby driving more traffic to the website. Secondly, it can help businesses to build authoritative links, which can further boost their visibility and credibility. Thirdly, directories often have a significant amount of traffic, which can increase the exposure of a business to potential customers.<br />\n<br />\nHowever, it is essential to note that not all directories are equal. Some directories carry more weight than others, and not all direct submissions result in approval. As a result, it is essential to conduct research and choose the most appropriate directories for your business. Additionally, it is crucial to follow the directory submission guidelines and ensure that the content submitted is of high quality<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\nDigital marketing plays a crucial role in today\'s business landscape, and directory submission is an essential part of it. By submitting your business to various online directories, you increase the visibility of your website, reach out to your target audience, and boost your search engine rankings. Directory submission also helps to establish your business as trustworthy and reliable in the eyes of consumers.<br />\n<br />\nThere are many different types of directories, including general directories, industry-specific directories, local directories, and niche directories. Each type of directory offers unique benefits to businesses looking to get noticed online. General directories are ideal for businesses in the early stages of building their online presence, while industry-specific directories offer more targeted exposure to those in specific niches.<br />\n<br />\nLocal directories are an excellent option for businesses looking to target customers in a specific area. These directories can provide a significant boost in local search traffic and help you build a stronger online presence in your community. Niche directories, on the other hand, allow you to connect with a specific audience and help establish your brand as a thought leader in your particular field.<br />\n<br />\nOverall, directory submission is a cost-effective digital marketing strategy that can help your business get noticed online, increase traffic to your website, and reach new customers. By choosing the right directories to submit your<br />\r\n<br />\r\n<br />', 37, 1108, 1145, 'content', NULL, NULL, NULL, '2023-06-11 17:41:48', '2023-06-11 17:41:48', NULL),
(90, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-yywsc', 'Blog Ideas:<br />\n<br />\n1. Top 10 beaches to visit in Greece this summer<br />\n2. Hidden beaches in Greece that will take your breath away<br />\n3. A guide to the best beaches in Crete, Greece<br />\n4. A beach lover’s guide to the Greek island of Mykonos<br />\n5. The most beautiful beaches in Zakynthos, Greece<br />\n6. Discovering the stunning beaches of Santorini, Greece<br />\n7. The best beach activities in Greece for adventure seekers<br />\n8. Finding the perfect beach getaway in Greece for couples<br />\n9. A family-friendly guide to the best beaches in Greece<br />\n10. The best beaches in Greece for solo travelers seeking relaxation<br />\n<br />\nOutline:<br />\n<br />\nI. Introduction<br />\n- Brief overview of Greece\'s reputation for having some of the most beautiful beaches in the world<br />\n- Explanation of why Greece\'s beaches are so special and unique<br />\n<br />\nII. Top Beaches to Visit in Greece<br />\n- List of the top 10 beaches in Greece, such as Myrtos Beach, Navagio Beach, and Voidokilia Beach<br />\n- Descriptions of each beach and what makes them special<br />\n- Photos of each beach to give readers an idea of what to expect<br />\n<br />\nIII. Hidden Beaches in Greece<br />\n- Discussion', 38, 250, 288, 'content', NULL, NULL, NULL, '2023-06-11 17:46:02', '2023-06-11 17:46:02', NULL),
(91, 1, NULL, 56, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-ik4ot', '1. \"Merhaba! Bugün yapay zeka hakkında Türkçe reels paylaşacağız. Hazır mısınız?\"<br />\n<br />\n2. \"Yapay zeka konusunda her zaman meraklı mı oldunuz? O zaman doğru yere geldiniz! Türkçe reels\'imiz için takipte kalın.\"<br />\n<br />\n3. \"Yapay zeka ile ilgili son gelişmeleri öğrenmek isteyenler burada mı? Türkçe reels\'imizde sizler için çok şey var!\"<br />\n<br />\n4. \"Yapay zeka dünyasına adım atmak için, hemen Instagram reels\'imizi izleyin ve hayran kalın! Türkçe dilinde anlatıyoruz.\"<br />\n<br />\n5. \"Yapay zeka ile ilgili her sorunuzun cevabı burada! Tek yapmanız gereken Türkçe reels\'imizi takip etmek.\"<br />\n<br />\n6. \"Sıkıcı videolardan bıktınız mı? Türkçe yaptığımız yapay zeka konulu reels\'', 45, 246, 300, 'content', NULL, NULL, NULL, '2023-06-11 17:51:58', '2023-06-11 17:52:27', NULL),
(92, 1, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-eccro', '1. \"Top 10 SEO Tools Every Marketer Should Use\" - An in-depth review of various SEO tools that can help businesses improve their website\'s search engine rankings and visibility.<br />\n<br />\nOutline:<br />\n<br />\nI. Introduction<br />\n- The importance of SEO for businesses<br />\n- The role of SEO tools in optimizing websites<br />\n<br />\nII. Google Analytics<br />\n- Overview of Google Analytics<br />\n- How it can help businesses track website performance<br />\n- Key features and benefits of Google Analytics<br />\n<br />\nIII. SEMrush<br />\n- Overview of SEMrush<br />\n- How it can help businesses perform competitor analysis<br />\n- Key features and benefits of SEMrush<br />\n<br />\nIV. Ahrefs<br />\n- Overview of Ahrefs<br />\n- How it can help businesses perform keyword research<br />\n- Key features and benefits of Ahrefs<br />\n<br />\nV. Moz<br />\n- Overview of Moz<br />\n- How it can help businesses improve website authority<br />\n- Key features and benefits of Moz<br />\n<br />\nVI. Screaming Frog<br />\n- Overview of Screaming Frog<br />\n- How it can help businesses perform website audits<br />\n- Key features and benefits of Screaming Frog<br />\n<br />\nVII. Yoast SEO<br />\n- Overview of Yoast SEO<br />\n- How it can help businesses optimize content for search engines<br />\n- Key features and benefits of Yoast SEO<br />\n<br />\nVIII. BuzzSumo<br />\n- Overview of BuzzSumo<br />\n- How it can help businesses perform content analysis<br />\n- Key features and benefits of BuzzSumo<br />\n<br />\nIX. SpyFu<br />\n- Overview of SpyFu<br />\n- How it can help businesses perform PPC analysis<br />\n- Key features and benefits of SpyFu<br />\n<br />\nX. Conclusion<br />\n- Recap of top 10 SEO tools<br />\n- Final thoughts and recommendations for marketers<br />\n<br />\n2. \"How to Choose the Right SEO Tools for Your Business\" - A guide that outlines important factors businesses should consider when selecting SEO tools to help them achieve their goals.<br />\n<br />\nOutline:<br />\n<br />\nI. Introduction<br />\n- The importance of choosing the right SEO tools for business<br />\n- Overview of factors that should be considered<br />\n<br />\nII. Business Goals<br />\n- How business goals should impact tool selection<br />\n- Examples of common goals and the tools that can support them<br />\n<br />\nIII. Budget<br />\n- The impact of budget on tool selection<br />\n- Overview of free vs paid tools<br />\n<br />\nIV. Skill Level<br />\n- The importance of choosing tools that match the skill level of the team<br />\n- Overview of beginner, intermediate, and advanced tools<br />\n<br />\nV. Scalability<br />\n- Why scalability is an important factor in tool selection<br />\n- How to choose tools that can grow with the business<br />\n<br />\nVI. Reputation<br />\n- The impact of tool reputation on decision making<br />\n- How to research and evaluate tool reputation<br />\n<br />\nVII. Integration<br />\n- The importance of choosing tools that can integrate with existing systems<br />\n- Overview of common integration options<br />\n<br />\nVIII. Support<br />\n- The role of support in selecting tools<br />\n- How to evaluate the quality of support offered by different tool providers<br />\n<br />\nIX. Conclusion<br />\n- Summary of key factors to consider when selecting SEO tools<br />\n- Final thoughts and recommendations for businesses.', 37, 604, 641, 'content', NULL, NULL, NULL, '2023-06-11 17:54:29', '2023-06-11 17:54:29', NULL),
(93, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'PHP', 'php-ja1eg', 'Öncelikle, HTML formunu oluşturmak için aşağıdaki kodu kullanabilirsiniz:\n\n```html\n<form>\n  <label for=\"name\">Name:</label>\n  <input type=\"text\" id=\"name\" name=\"name\" required><br><br>\n  \n  <label for=\"email\">Email:</label>\n  <input type=\"email\" id=\"email\" name=\"email\" required><br><br>\n\n  <label for=\"subject\">Subject:</label>\n  <input type=\"text\" id=\"subject\" name=\"subject\"><br><br>\n\n  <label for=\"message\">Message:</label>\n  <textarea id=\"message\" name=\"message\" required></textarea><br><br>\n\n  <input type=\"submit\" value=\"Submit\">\n</form>\n```\n\nBu formun içinde ad, e-posta, konu ve mesaj alanları bulunmaktadır. Gönder butonu da yer almaktadır.\n\nJavaScript kullanarak form verilerini almak ve işlemek için ise aşağıdaki adımları takip edebilirsiniz:\n\n1. Formu yakalayın:\n\n```javascript\nconst form = document.querySelector(\'form\');\n```\n\n2. Form gönderimini engelleyin:\n\n```javascript\nform.addEventListener(\'submit\', function(event) {\n  event.preventDefault();\n});\n```\n\n3. Form verilerini toplayın:\n\n```javascript\nconst name = form.elements.name.value;\nconst email = form.elements.email.value;\nconst subject = form.elements.subject.value;\nconst message = form.elements.message.value;\n```\n\n4. Verileri bir nesne içinde saklayın:\n\n```javascript\nconst data = {\n  name: name,\n  email: email,\n  subject: subject,\n  message: message\n};\n```\n\n5. Verileri göndermek için bir XMLHTTP isteği oluşturun:\n\n```javascript\nconst xhr = new XMLHttpRequest();\n\nxhr.open(\'POST\', \'https://example.com/send-email.php\', true);\n\nxhr.setRequestHeader(\'Content-Type\', \'application/json\');\n\nxhr.onreadystatechange = function() {\n  if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {\n    console.log(xhr.responseText);\n  }\n}\n\nxhr.send(JSON.stringify(data));\n```\n\n6. Son olarak, geleneksel bir form gönderimi yerine, event.preventDefault() kodu sayesinde, özel AJAX isteği göndererek formu gönderin.\n\nBu örnek kod parçası, form verilerini JSON formatında bir POST isteğiyle belirtilen URL\'ye gönderir. HttpResponse\'teki yanıtı console.log\'da görüntüler.\n\nTam anlamıyla çalışan bir kod parçası için, sunucu tarafındaki işlemler dahil olmak üzere mevcut bir \"send-email.php\" dosyası oluşturmanız gerekebilir.', 35, 630, 665, 'code', NULL, NULL, NULL, '2023-06-11 17:55:23', '2023-06-11 17:55:23', NULL),
(94, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'PHP', 'php-rnjqk', 'Tamam, burada bir örneği:\n\nHTML Kodu:\n\n```\n<form id=\"contact-form\" method=\"POST\">\n  <div>\n    <label for=\"name\">Adınız:</label>\n    <input type=\"text\" id=\"name\" name=\"name\" required>\n  </div>\n  <div>\n    <label for=\"email\">E-posta Adresiniz:</label>\n    <input type=\"email\" id=\"email\" name=\"email\" required>\n  </div>\n  <div>\n    <label for=\"message\">Mesajınız:</label>\n    <textarea id=\"message\" name=\"message\" required></textarea>\n  </div>\n  <button type=\"submit\">Gönder</button>\n</form>\n```\n\nJavascript Kodu:\n\n```\nconst form = document.getElementById(\"contact-form\");\n\nform.addEventListener(\"submit\", function(event) {\n  event.preventDefault();\n  const name = document.getElementById(\"name\").value;\n  const email = document.getElementById(\"email\").value;\n  const message = document.getElementById(\"message\").value;\n  const data = {name, email, message};\n  const xhr = new XMLHttpRequest();\n  xhr.open(\"POST\", \"url\", true);\n  xhr.setRequestHeader(\"Content-type\", \"application/json\");\n  xhr.onreadystatechange = function() {\n    if(xhr.readyState === 4 && xhr.status === 200) {\n      console.log(\"Mesaj başarıyla gönderildi.\");\n    }\n  };\n  xhr.send(JSON.stringify(data));\n});\n```\n\nBu örnekte, tüm alanlar doldurulmadan form gönderilemez. Bir kişinin adı, e-posta adresi ve mesajı doğru biçimde girildikten sonra, mesaj XMLHttpRequest ile belirtilen URL\'ye gönderilir ve \"Mesaj başarıyla gönderildi.\" mesajı konsola yazdırılır.', 35, 399, 434, 'code', NULL, NULL, NULL, '2023-06-11 17:56:13', '2023-06-11 17:56:13', NULL),
(95, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'PHP', 'php-ylnvd', 'Sure, aşağıdaki gibi bir Javascript iletişim formu yazabilirim:\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n	<title>İletişim Formu</title>\n</head>\n<body>\n	<h1>İletişim Formu</h1>\n	<form id=\"contact-form\">\n		<label for=\"name\">İsim:</label>\n		<input type=\"text\" id=\"name\" name=\"name\"><br><br>\n		<label for=\"email\">Email:</label>\n		<input type=\"email\" id=\"email\" name=\"email\"><br><br>\n		<label for=\"message\">Mesajınız:</label>\n		<textarea id=\"message\" name=\"message\"></textarea><br><br>\n		<input type=\"submit\" value=\"Gönder\">\n	</form>\n	<script>\n		// form submission function\n		document.getElementById(\"contact-form\").addEventListener(\"submit\", function(event) {\n			event.preventDefault(); // prevent default form submission behavior\n			var name = document.getElementById(\"name\").value;\n			var email = document.getElementById(\"email\").value;\n			var message = document.getElementById(\"message\").value;\n			var data = {\n				name: name,\n				email: email,\n				message: message\n			};\n			console.log(data); // log data to console for testing purposes\n			// you can add your preferred method of data submission here\n			alert(\"Mesajınız başarıyla gönderildi!\"); // display success message\n			document.getElementById(\"contact-form\").reset(); // reset form after submission\n		});\n	</script>\n</body>\n</html>\n```\n\nBu örnek form, isim, email ve mesaj alanlarını içerir ve form gönderildiğinde bu verileri JavaScript kullanarak yakalar. Kod, formun gönderimi için varsayılan davranışı engeller ve verileri bir nesne olarak depolar. Bu veriler, ek işleme veya sunucuya gönderme amaçlarıyla kullanılabilir. Son olarak, bir başarı mesajı görüntülenir ve form sıfırlanır.', 35, 464, 499, 'code', NULL, NULL, NULL, '2023-06-11 17:56:15', '2023-06-11 17:56:15', NULL),
(96, 1, NULL, 21, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-uhoui', '<b>[Output-1]</b><br />\r\n\"Unlock Your Web Design Potential: Creating Stunning Websites with HTML, CSS, and JS!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n\"From Zero to Hero: Learn how to create stunning websites with HTML, CSS, and JS!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n\"Unlock Your Web Development Potential: Dive into the World of HTML, CSS, and JS with our Hands-On Tutorial!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\n\"Unlock the Power of Web Design with HTML, CSS, and JS: Learn How to Make Stunning Websites!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n\"Master Web Development with Ease: Learn HTML, CSS, and JS to Create Stunning Websites!\"<br />\r\n<br />\r\n<br />', 44, 19, 150, 'content', NULL, NULL, NULL, '2023-06-11 18:43:16', '2023-06-11 18:44:08', NULL),
(97, 2, NULL, 35, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-l9dnz', '<b>[Output-1]</b><br />\r\n1. Jordanian Journeys<br />\n2. Treks of Jordan<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n1. Wonders of Jordan Tour Experience <br />\n2. Majestic Jordan Discovery<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n1. Wanderlust Journeys<br />\n2. Desert Trails Tours<br />\n3<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\n1. Wanderlust Jordan <br />\n2. Jordanian Getaways <br />\n3.<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n1. Jordan Journey Co.<br />\n2. Explore Jordan<br />\n3. Journey Through<br />\r\n<br />\r\n<br />', 41, 64, 114, 'content', NULL, NULL, NULL, '2023-06-11 18:54:23', '2023-06-11 18:59:31', NULL),
(98, 1, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-vk4z2', '大家好！今天我要分享一些关于美女和性感的话题。我们每个人都知道，美女是让人们心动的存在，而性感则是一种魅力。当一个女性拥有魅力时，她便能吸引更多人的注意力。<br />\n<br />\n那么，什么是美女呢？很难定义，因为每个人都有自己的标准。但是，我认为美女不仅外表要好看，还要有自信、勇气和独立的个性。<br />\n<br />\n再来说说性感。性感不仅仅是指身材好、穿着性感的女性。更重要的是，她们的自信、气质和温柔。这些都是让人们着迷的地方。<br />\n<br />\n最后，我想说的是，女性不一定要去追求别人的眼光和', 43, 250, 293, 'content', NULL, NULL, NULL, '2023-06-11 19:10:22', '2023-06-11 19:10:22', NULL),
(101, 2, NULL, 58, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-vlgcj', '1. Showcasing different money-making ideas like investing in stocks, starting a side hustle, freelancing, and so on, with short and snappy clips along with subtitles.<br />\n<br />\n2. Give tips on how to upskill and acquire technical knowledge to be in demand in the current job market.<br />\n<br />\n3. Share your personal success story of how you managed to turn a passion into a profitable business setup.<br />\n<br />\n4. Share your review of legitimate online money-making platforms like Upwork, Fiverr, and Amazon Mechanical Turk, along with a demonstration of how they operate.<br />\n<br />\n5. Create a collage of short video clips of people engaged in unconventional work setup like street performers, artists, painters, and freelancers, and highlight independent professions\' viability.<br />\n<br />\n6. Pick up successful entrepreneurs and ask them about their journey, the challenges they faced, and what kept them going and how they grew their businesses over time.<br />\n<br />\n7. Share your insights into smart budgeting, saving, and investing strategies that can help people approach their financial goals efficiently.<br />\n<br />\n8. Provide a step-by-step guide on the basics of investing, how to read financial statements, and understanding stocks and bonds.<br />\n<br />\n9. Share your views on \"Passive Income,\" with opinion on whether it\'s achievable and', 45, 250, 295, 'content', NULL, NULL, NULL, '2023-06-11 20:07:48', '2023-06-11 20:07:48', NULL),
(102, 2, NULL, 16, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-x2my1', '1. \"Turn up the volume, it\'s time to groove ????????\"<br />\n2. \"Let the music speak for your soul ❤️????\"<br />\n3. \"When words fail, music speaks ????????\"<br />\n4. \"Life is our dance floor, and music is the rhythm ????????\"<br />\n5. \"Good music, good vibes, good life ????✨\"<br />\n6. \"Music is not just a sound, it\'s an emotion ????❤️\"<br />\n7. \"Let\'s get lost in the music and find ourselves ????????\"<br />\n8. \"The best things in life are free, like the music that feeds our soul ????????\"<br />\n9. \"Music is the universal language that connects us all ????????\"<br />\n10. \"Without music, life would be a mistake ????????\"', 37, 191, 228, 'content', NULL, NULL, NULL, '2023-06-11 20:18:22', '2023-06-11 20:18:22', NULL),
(103, 2, NULL, 59, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-nsddi', 'Hello there! How are you doing today? I just wanted to check in and say hello. I hope you\'re having a great day so far. If you need anything, don\'t hesitate to ask. Have a wonderful day!', 25, 46, 71, 'content', NULL, NULL, NULL, '2023-06-11 20:43:51', '2023-06-11 20:43:51', NULL),
(104, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-nneo5', 'In today\'s digital world, web design is an essential aspect of creating a successful online presence. A well-designed website can significantly impact the user experience and overall success of your online business. So, what are the basic principles of good web design? In this article, we\'ll delve into the basic principles that can make your website visually appealing and user-friendly.<br />\n<br />\n1. Keep it simple<br />\nAn essential principle of good web design is keeping it simple. A cluttered website can create a negative user experience, leading to users leaving your site. A clean design that focuses on the most important aspects of your business can provide a positive user experience and improve website engagement.<br />\n<br />\n2. Focus on the user<br />\nUser experience (UX) is what sets a successful website apart from an unsuccessful one. Focusing on the user\'s needs and creating a design that works for them is critical in creating a positive user experience. A user-centered approach should guide every aspect of your web design, from the layout to the content.<br />\n<br />\n3. Mobile responsiveness<br />\nWith mobile devices accounting for over 50% of web traffic, it is essential to make sure your website is mobile responsive. Mobile responsiveness ensures that your website adjusts to different devices, making it accessible and easy to use on a mobile device.<br />\n<br />\n4. Consistent branding<br />\nConsistent branding is crucial in promoting brand recognition. Whether it\'s your logo or the color scheme of your website, make sure to keep it consistent throughout your site. This creates a cohesive feel and reinforces your brand\'s identity.<br />\n<br />\n5. Easy navigation<br />\nIntuitive navigation is another essential principle of good web design. Your website should be easy to navigate, with clear menus and buttons and easy-to-understand site architecture. This simplifies the user\'s experience and ensures they can find the information they\'re looking for quickly.<br />\n<br />\n6. Accessibility<br />\nWebsite accessibility is essential for creating an inclusive user experience. Make sure your website is accessible by following accessibility guidelines, such as providing alt text for images and ensuring the site is keyboard navigable.<br />\n<br />\n7. Fast load times<br />\nFast load times are critical in retaining website visitors. A website that takes too long to load can be frustrating for users, resulting in them leaving your site. Optimize your website\'s loading speed by minimizing large image files and compressing code.<br />\n<br />\nIn conclusion, these are some of the basic principles of good web design. A well-designed website can engage users, build brand awareness and create an immersive user experience. By keeping your website design simple, focusing on user', 57, 500, 557, 'content', NULL, NULL, NULL, '2023-06-11 20:46:05', '2023-06-11 20:46:05', NULL),
(105, 1, 9, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-rjap9', 'Here are 5 blog ideas about AI content creator:<br>\r\n<br>\r\n1. \"The Future of Writing: How AI Content Creators Are Revolutionizing the Industry\": In this blog, you could explore the ways in which AI content creators are changing the way we think about writing, how they work, and how they are predicted to impact the industry in the future.<br>\r\n<br>\r\nOutline:<br>\r\n<br>\r\n- Introduction: Explain why AI content creators are a topic of interest.<br>\r\n- The basics of AI content creation: Define what an AI content creator is and how it works.<br>\r\n- Strengths of AI content creators: Discuss the strengths of AI content creators and what they can do better than human writers.<br>\r\n- Challenges for the industry: Highlight some of the challenges that AI content creators are posing to the writing industry and the need for change.<br>\r\n- Opportunities for writers: Explore the opportunities that AI content creators present for writers in terms of workflow, productivity, and efficiency.<br>\r\n- Future predictions: Look to the future and speculate on what changes are likely to occur as a result of the rise of AI content creators.<br>\r\n<br>\r\n2. \"Why You Should Embrace AI Content Creation for Your Business\": This blog could explore the many benefits that AI content creators can offer businesses, from time and cost savings to increased productivity and', 43, 250, 293, 'content', NULL, NULL, NULL, '2023-06-11 21:22:09', '2023-06-11 21:23:28', NULL),
(106, 1, NULL, 8, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-yxlkl', 'Subject: Welcome to Banga App!<br />\n<br />\nDear Tolani,<br />\n<br />\nI hope this email finds you well. I am thrilled to confirm that your registration process on Banga App is complete. Congratulations on taking the first step towards a hassle-free banking experience.<br />\n<br />\nBanga App is a one-stop solution for all your banking and financial needs. With our user-friendly interface and advanced features, you can easily manage your accounts, transfer funds, pay bills, and access statements. Plus, we offer the latest security measures to keep your information safe and secure.<br />\n<br />\nWe appreciate your trust in us and are confident that you will enjoy our services. We are continually working to improve our offerings, and your feedback and suggestions are invaluable to us.<br />\n<br />\nIf you have any questions or concerns regarding our services, please feel free to reach out to us at support@bangaapp.com. Our customer support team is available 24/7 to assist you.<br />\n<br />\nThank you once again for choosing Banga App. I look forward to being a part of your financial journey.<br />\n<br />\nSincerely,<br />\n<br />\n[Your Name]', 45, 212, 257, 'content', NULL, NULL, NULL, '2023-06-11 21:38:25', '2023-06-11 21:38:25', NULL),
(107, 1, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-hpvdu', 'Blog ideas:<br />\n<br />\n1. The Future of AI in 2023: What To Expect<br />\n2. 5 Ways AI Will Change Our Lives by 2023<br />\n3. Will AI Replace Human Workers by 2023? <br />\n4. The Ethics of AI: What to Consider in 2023<br />\n5. How AI Technology Advances in 2023 Can Benefit Your Business <br />\n6. The Role of AI in Healthcare by 2023<br />\n7. The Future of Education with AI in 2023<br />\n8. How AI Can Enhance Social Media by 2023<br />\n9. AI and Climate Change: How Technology Can Help in 2023<br />\n10. The Limitations of AI Today and What to Expect in 2023<br />\n<br />\nOutline:<br />\n<br />\nI. Introduction<br />\nA. Definition of AI<br />\nB. Purpose of the blog<br />\n<br />\nII. Advancements of AI Technology<br />\nA. Applications of AI in various industries<br />\nB. Latest developments and trends<br />\nC. The role of machine learning, natural language processing, and automation<br />\n<br />\nIII. AI and Human Workers<br />\nA. The current state of AI and human workforce<br />\nB. Predictions and fears of AI replacing human workers<br />\nC. Possible solutions for a seamless integration of AI in the workplace', 41, 250, 291, 'content', NULL, NULL, NULL, '2023-06-11 21:45:00', '2023-06-11 21:45:00', NULL),
(108, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'xoxo language AI', 'xoxo-language-ai-rm2yj', 'Sure, I can help you with that! The xoxo language API 2.0 provides several features for managing listboxes. Here are some of the functions you can use:\n\n1. **createListBox()**: This function creates a new listbox with the specified properties.\n\n2. **addListBoxItem()**: This function adds a new item to the listbox.\n\n3. **removeListBoxItem()**: This function removes an item from the listbox.\n\n4. **getSelectedListBoxItem()**: This function retrieves the currently selected item in the listbox.\n\n5. **selectAllListBoxItems()**: This function selects all items in the listbox.\n\n6. **deselectAllListBoxItems()**: This function deselects all items in the listbox.\n\n7. **getListBoxItemCount()**: This function retrieves the number of items in the listbox.\n\n8. **setListBoxItemText()**: This function sets the text of a specified item in the listbox.\n\n9. **getListBoxItemText()**: This function retrieves the text of a specified item in the listbox.\n\n10. **setListBoxItemValue()**: This function sets the value of a specified item in the listbox.\n\n11. **getListBoxItemValue()**: This function retrieves the value of a specified item in the listbox.\n\n12. **setListBoxItemEnabled()**: This function enables or disables a specified item in the listbox.\n\n13. **getListBoxItemEnabled()**: This function retrieves the enabled status of a specified item in the listbox.\n\n14. **setListBoxItemVisible()**: This function shows or hides a specified item in the listbox.\n\n15. **getListBoxItemVisible()**: This function retrieves the visibility status of a specified item in the listbox.\n\nThese are just some of the functions available for managing listboxes using the xoxo language API 2.0. Let me know if you need any further assistance!', 35, 391, 426, 'code', NULL, NULL, NULL, '2023-06-11 21:51:38', '2023-06-11 21:51:38', NULL),
(109, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Tetsts', 'tetsts-0l3qy', 'Here is an example of a WordPress plugin for email verification. This plugin will require users to verify their email address before they can access certain features on your site, ensuring that all users have legitimate email addresses.\n\n1. Create a new folder in the wp-content/plugins directory and name it email-verification.\n2. Create a new file in that folder and name it email-verification.php\n3. Add the following code to email-verification.php:\n\n```php\n<?php\n/*\nPlugin Name: Email Verification\nPlugin URI: http://example.com\nDescription: Requires users to verify their email address before accessing certain features.\nVersion: 1.0\nAuthor: Your Name\nAuthor URI: http://example.com\nLicense: GPLv2 or later\n*/\n\n// Function to display an error message to the user\nfunction email_verification_error() {\n    $error_message = \'<p class=\"error\">Please verify your email address in order to access this feature.</p>\';\n    echo $error_message;\n}\n\n// Function to check if a user has verified their email address\nfunction email_verification_check() {\n    global $current_user;\n    get_currentuserinfo();\n    if ( ! get_user_meta( $current_user->ID, \'email_verified\', true ) ) {\n        email_verification_error();\n    }\n}\n\n// Function to add the email verification meta box to the user profile page\nfunction email_verification_add_meta_box() {\n    add_meta_box(\n        \'email-verification-meta-box\',\n        \'Email Verification\',\n        \'email_verification_meta_box_callback\',\n        \'user\',\n        \'normal\',\n        \'default\'\n    );\n}\n\n// Callback function for the email verification meta box\nfunction email_verification_meta_box_callback( $user ) {\n    $email_verified = get_user_meta( $user->ID, \'email_verified\', true );\n    ?>\n    <p>\n        <label for=\"email_verified\">Email Verified</label>\n        <input type=\"checkbox\" name=\"email_verified\" id=\"email_verified\" <?php checked( $email_verified, \'on\' ); ?>>\n    </p>\n    <?php\n}\n\n// Function to save the email verification meta box data\nfunction email_verification_save_meta_box_data( $user_id ) {\n    if ( isset( $_POST[\'email_verified\'] ) ) {\n        update_user_meta( $user_id, \'email_verified\', \'on\' );\n    } else {\n        update_user_meta( $user_id, \'email_verified\', \'off\' );\n    }\n}\n\n// Add the email verification meta box to the user profile page\nadd_action( \'admin_menu\', \'email_verification_add_meta_box\' );\n\n// Save the email verification meta box data when the user profile is updated\nadd_action( \'personal_options_update\', \'email_verification_save_meta_box_data\' );\nadd_action( \'edit_user_profile_update\', \'email_verification_save_meta_box_data\' );\n\n// Add a hook to check if a user has verified their email address before accessing certain features\nadd_action( \'wp\', \'email_verification_check\' );\n?>\n```\n\n4. Save the file.\n5. Activate the plugin from the WordPress dashboard.\n6. Users will now see a \"Email Verification\" meta box on their user profile page. They can check the \"Email Verified\" box to verify their email address.\n7. You can use the `email_verification_check()` function to check if a user has verified their email address before allowing them to access certain features on your site. Simply call the `email_verification_check()` function in your plugin or theme file and the user will be prompted to verify their email address if they have not already done so.', 29, 732, 761, 'code', NULL, NULL, NULL, '2023-06-11 21:53:25', '2023-06-11 21:53:25', NULL),
(110, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', '222', '222-fb0cj', 'Here\'s a basic WordPress plugin that outputs a \"Hello World\" message when activated:\n\n1. First, create a new folder in your `wp-content/plugins` directory and give it a unique name (e.g. `my-plugin`)\n2. Inside your new folder, create a new file called `my-plugin.php`\n3. Add the following code to your `my-plugin.php` file:\n\n```\n<?php\n/*\nPlugin Name: My Plugin\nPlugin URI: http://www.example.com/\nDescription: A basic WordPress plugin\nVersion: 1.0\nAuthor: Your Name\nAuthor URI: http://www.example.com/\n*/\n\nfunction my_plugin_hello_world() {\n    echo \'Hello World!\';\n}\n\nregister_activation_hook( __FILE__, \'my_plugin_hello_world\' );\n```\n\n4. Save your file and navigate to the WordPress backend\n5. Go to the \"Plugins\" page and find your plugin in the list\n6. Click \"Activate\" to activate your plugin\n7. The \"Hello World!\" message should now be outputted on your website.\n\nNote: This is just a very basic example of a WordPress plugin. In practice, plugins can do much more complex things, such as adding custom post types or modifying the way WordPress behaves.', 25, 254, 279, 'code', NULL, NULL, NULL, '2023-06-11 23:46:51', '2023-06-11 23:46:51', NULL),
(111, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Ghbc', 'ghbc-vdpza', 'I\'m sorry, as an AI language model I cannot write the whole code for an online store project due to its complexity. However, I can provide a list of steps to build a telegram online store:\n\n1. Set up a Telegram Bot using the BotFather. Get the API key and store it somewhere safe.\n\n2. Find or create a database where you can store product information. Popular options include MySQL, PostgreSQL, and MongoDB.\n\n3. Create a new Telegram group or channel for your online store. Invite customers to join the group and make purchases using the bot.\n\n4. Build a web application or API that the bot can use to access the product database. This allows customers to search for products, view product information and place orders using the bot.\n\n5. Create command handlers for your bot that allow users to interact with the store. Possible commands include adding items to a cart, checking out, and viewing order history.\n\n6. Integrate a payment provider like Stripe or PayPal to enable customers to pay for their orders within Telegram.\n\n7. Implement a shipping method so that customers can receive their orders.\n\n8. Add administration features to manage inventory, orders, and customer support.\n\n9. Test the bot thoroughly, including edge cases like invalid input and failed payments.\n\n10. Launch the bot and start selling!\n\nNote that this is just a high-level overview and there are many more details to consider when building an online store on Telegram.', 27, 287, 314, 'code', NULL, NULL, NULL, '2023-06-11 23:52:39', '2023-06-11 23:52:39', NULL),
(112, 1, NULL, 15, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-wx4pq', '¡Atención gente mayor de 26 años! Si eres un verdadero amante de la carne, no puedes perderte la increíble Sierra de Esquinar. ¡Con ella podrás partir tus vacas como un verdadero profesional en menos de un minuto! No más esperas interminables o filos que no cortan. ¡Esta sierra es la solución que buscabas! Compra hoy mismo y sorprende a todos tus amigos con la calidad de tus cortes de carne. ¡Haz tu pedido ahora antes de que se agoten!', 84, 119, 203, 'content', NULL, NULL, NULL, '2023-06-11 23:56:35', '2023-06-11 23:56:35', NULL),
(113, 1, NULL, 5, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-jrxor', 'En conclusión, queda claro que la maquinaria en la industria cárnica no solo es importante, sino que resulta fundamental para poder garantizar la calidad y seguridad de los productos que consumimos. La tecnología ha avanzado en el sector y hoy en día es posible contar con equipos que permiten procesar de forma automatizada y eficiente todo tipo de carne, optimizando cada uno de los procesos. Además, la posibilidad de acceder a información en tiempo real permite a los productores tomar decisiones más informadas y mejorar su producción. En definitiva, la inversión en maquinaria adecuada resulta una decisión estratégica para quienes buscan mantenerse competitivos y mejorar su rentabilidad en la industria cárnica. ¡No lo dudes más y apuesta por la tecnología!', 62, 171, 233, 'content', NULL, NULL, NULL, '2023-06-11 23:57:53', '2023-06-11 23:57:53', NULL),
(114, 2, NULL, 3, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-hz1fh', '<b>[Output-1]</b><br />\r\n1. Discover Jordan\'s Hidden Gems: Book Exciting Tours and Activities Now!<br />\n2. Hassle-Free Ticketing: Store and Present Your Jordan Tour Tickets on Mobile<br />\n3. Let Jordan\'s Expert Guides Lead the Way on Your Next Adventure<br />\n4. Uncover Jordan\'s Rich History with Our Guided Tours and Activities<br />\n5. Save Time and Money When Booking Jordan Tours and Activities Online<br />\n6. From Petra to the Dead Sea: Find the Best Jordan Tours and Activities Here<br />\n7. Don\'t Miss Out on Jordan\'s Must-See Sights – Book Your Tour Today!<br />\n8. Experience Authentic Jordanian Culture with Our Unique Tours and Activities<br />\n9. Make the Most of Your Time in Jordan: Book Tours and Activities in Advance<br />\n10. Travel like a Pro: Tips for Booking the Best Tours and Activities in Jordan<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n1. \"Experience Jordan\'s Best Tours and Activities: A Guide to Booking Your Next Adventure\"<br />\n2. \"Say Goodbye to Printed Tickets: How to Store and Access Your Jordan Tour Reservations on Your Smartphone\"<br />\n3. \"Expert Guides and Unforgettable Experiences: Why Jordan is the Ultimate Destination for Tourists\"<br />\n4. \"Discover the Hidden Gems of Jordan: Top-Rated Tours and Activities for the Adventurous Traveler\"<br />\n5. \"Escape the Crowds: Private Tours and Bespoke Experiences in Jordan\"<br />\n6. \"Embark on a Cultural Journey: The Best Jordan Tours for History Buffs\"<br />\n7. \"The Ultimate Jordanian Adventure: Book Your Tour Today!\"<br />\n8. \"Jordan for Families: The Best Tours and Activities for Kids of All Ages\"<br />\n9. \"Eco-Tourism in Jordan: A Guide to Sustainable Travel and Responsible Tourism\"<br />\n10. \"Unlock the Secrets of Petra: Expert Guides and Fascinating Tours Await You in Jordan.\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n1. Discover the Hidden Gems of Jordan with Our Expert Tour Guides<br />\n2. Revolutionize the Way You Book Tours with Mobile Ticketing in Jordan <br />\n3. Your Ultimate Guide to the Best Tours and Activities in Jordan <br />\n4. Why You Need to Download Our Mobile App for Booking Jordan Tours <br />\n5. Take the Stress Out of Planning Your Jordan Tour with Our Expert Guides <br />\n6. Uncover Jordan\'s Rich Cultural History with Our Unique Tour Experiences <br />\n7. Book Your Dream Jordanian Adventure with Our Comprehensive Tour Packages <br />\n8. From Petra to Wadi Rum: A Guide to Jordan\'s Must-See Tourist Attractions <br />\n9. How to Maximize Your Jordan Tour Experience with Our Tailored Itineraries <br />\n10. Explore Jordan like a Local with Our Customizable Tour Packages<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\n1. \"Discover the Best Tours and Activities in Jordan: A Guide\"<br />\n2. \"Book Your Jordanian Adventure: Mobile Ticketing Made Easy\"<br />\n3. \"Insider Tips for Finding Expert Guides for Your Jordan Tour\"<br />\n4. \"Explore Jordan\'s Top Attractions with Hassle-Free Booking\"<br />\n5. \"Experience Jordanian Culture and History with Local Guides\"<br />\n6. \"The Ultimate Guide to Finding the Best Jordan Tours and Activities\"<br />\n7. \"Maximize Your Jordanian Adventure: Book Tours and Activities with Ease\"<br />\n8. \"Expertly Guided Tours: The Key to Exploring Jordan\'s Hidden Gems\"<br />\n9. \"Jordan Tours and Activities: Mobile Ticketing for Modern Travelers\"<br />\n10. \"Discover the Best of Jordan: A Comprehensive Guide to Tour Booking\".<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n1. Discover the Best Tours and Activities in Jordan: Your Ultimate Guide<br />\n2. Simplify Your Travel Experience with Mobile Ticketing in Jordan<br />\n3. Unforgettable Adventures Await: Book Your Jordan Tour Today<br />\n4. Jordan Tours and Activities: From Historical Wonders to Natural Beauty<br />\n5. Get to Know Jordan\'s Rich Culture with Experienced Guides<br />\n6. Your Next Adventure Awaits: Find Your Perfect Jordan Tour<br />\n7. Streamline Your Travel Planning with Convenient Mobile Ticketing<br />\n8. Jordan\'s Best Tours and Activities: A Traveler\'s Dream Come True<br />\n9. See Jordan\'s Hidden Gems with Local Expert Guides<br />\n10. Get the Most Out of Your Jordan Adventure with Professional Tour Organizers<br />\r\n<br />\r\n<br />', 67, 818, 885, 'content', NULL, NULL, NULL, '2023-06-12 00:01:17', '2023-06-12 00:01:17', NULL),
(115, 2, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-awkww', 'Hey everyone! Are you ready for some soccer action?<br />\n<br />\nToday, we\'re at the biggest soccer match of the season! The stadium is packed and the energy is electric. Fans are chanting and waving their flags, getting ready to support their favorite team.<br />\n<br />\nThe players are going through their warmups, kicking the ball back and forth, and doing some quick jogs. It looks like they\'re all ready to give it their best shot out on the pitch.<br />\n<br />\nAs the match starts, the tension in the crowd is palpable. The ball is flying from one end of the field to the other, as both teams battle for the victory. We can hear the roar of the crowd every time a player scores or makes an incredible save.<br />\n<br />\nIt\'s amazing to see how soccer brings people together from different cultures and backgrounds. No matter who you\'re rooting for, it\'s all about the love of the game and the camaraderie that comes with it.<br />\n<br />\nSo, next time you\'re at a soccer match or watching it on TV, remember the passion and excitement that surrounds this amazing sport. Let\'s kick it!', 40, 221, 261, 'content', NULL, NULL, NULL, '2023-06-12 00:01:47', '2023-06-12 00:01:47', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(116, 2, NULL, 60, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-wgyqx', '<b>[Output-1]</b><br />\r\nI have had the pleasure of watching a colleague of mine, Sarah, transition from a entry-level worker to an accomplished and respected professional in her field. When Sarah first started with our company, she had little experience in the industry and was hesitant to take on new challenges. However, she was always eager to learn and absorbed information like a sponge.<br />\n<br />\nAs Sarah gained more confidence in her skills, she began to take on more responsibilities and eventually took the initiative to lead some of her own projects. She would often ask for advice from more seasoned colleagues, but was never afraid to voice her own opinions and offer creative suggestions.<br />\n<br />\nThrough hard work, determination and a positive attitude, Sarah climbed the ranks and was eventually offered a promotion. Today, she is a top-performer in her department and is well-respected by her colleagues and superiors alike.<br />\n<br />\nI am inspired by Sarah\'s success story and the dedication she has shown to achieve her goals. She is proof that with the right mindset and a willingness to learn, anyone can achieve great things in their career.<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\nMeet Sarah, a hardworking and dedicated individual. Sarah started her career as a sales associate in a small retail store but always knew she wanted to do more.<br />\n<br />\nShe took the initiative to learn new skills and approaches to better serve her customers. Her positive attitude and willingness to go the extra mile impressed her managers and she quickly moved up the ranks to become a store manager.<br />\n<br />\nSarah continued to expand her knowledge and expertise, attending conferences and networking with other professionals in her industry. Her reputation as a knowledgeable and inspirational leader grew and she was recruited for a management position at a larger company with more opportunities for growth.<br />\n<br />\nAt her new job, Sarah faced challenges but she persevered and continued to learn from every experience. Her dedication and hard work paid off as she was promoted to a senior management position within the company.<br />\n<br />\nSarah never lost sight of her goals and remained focused on achieving success. She is now a highly respected executive in her field, managing a team of talented individuals and making a significant impact on her company\'s bottom line.<br />\n<br />\nHer advice to others looking to climb the ladder of success is simple: \"Have a positive attitude, work hard, and always be willing to learn. Keep your eyes on your goals and you\'ll get there eventually.\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\nMeet Sarah, a hard-working individual with a passion for her career. She started out in her field as a fresh graduate with little experience, but a whole lot of ambition. Despite the challenges she faced, Sarah didn\'t let that stop her from achieving her dreams.<br />\n<br />\nThrough grit and determination, Sarah took on every opportunity that came her way, working long hours and going above and beyond to ensure that she delivered quality work. Her dedication didn\'t go unnoticed, and before long, Sarah began to receive recognition for her contributions.<br />\n<br />\nAs she gained more experience and skill, Sarah took charge of bigger projects, leading teams and collaborating with colleagues to achieve great results. Her infectious enthusiasm and willingness to lend a hand earned her a reputation as a team player, and people began to seek her out for her insights and guidance.<br />\n<br />\nAs Sarah continued to thrive in her career, opportunities for advancement began to present themselves. She was promoted to a leadership role within her organization, where she now coaches and mentors others, passing on the knowledge she has gained throughout her journey.<br />\n<br />\nToday, Sarah enjoys a successful career, one that she has built with hard work, dedication, and a belief in her abilities. She is an inspiration to many, proof that with perseverance and a passion for your work, anything is possible.<br />\r\n<br />\r\n<br />', 39, 713, 752, 'content', NULL, NULL, NULL, '2023-06-12 00:03:32', '2023-06-12 00:03:32', NULL),
(117, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Form', 'form-0rndh', 'Certainly! Here\'s a basic sales form that you can customize as needed:\n\n```\n<h2>Sales Form</h2>\n\n<form action=\"/submit_sales\" method=\"post\">\n\n  <label for=\"name\">Name:</label>\n  <input type=\"text\" id=\"name\" name=\"name\" required>\n\n  <label for=\"email\">Email:</label>\n  <input type=\"email\" id=\"email\" name=\"email\" required>\n\n  <label for=\"product\">Product:</label>\n  <select id=\"product\" name=\"product\" required>\n    <option value=\"\">-- Please choose a product --</option>\n    <option value=\"Product A\">Product A</option>\n    <option value=\"Product B\">Product B</option>\n    <option value=\"Product C\">Product C</option>\n  </select>\n\n  <label for=\"quantity\">Quantity:</label>\n  <input type=\"number\" id=\"quantity\" name=\"quantity\" min=\"1\" required>\n\n  <button type=\"submit\">Submit</button>\n\n</form>\n```\n\nThis form includes fields for the customer\'s name, email, selected product, and quantity. You can replace the product options with your own specific products, and also adjust the form action and method to match your preferred submission process.', 28, 266, 294, 'code', NULL, NULL, NULL, '2023-06-12 00:53:08', '2023-06-12 00:53:08', NULL),
(118, 2, NULL, 22, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-c0tcq', 'Welcome to our newest video, packed with inspiration quotes that are sure to uplift you and leave you feeling motivated and ready to take on the day! Join us in this journey as we explore some of the most powerful and thought-provoking quotes that will inspire you to chase your dreams, never give up, and believe in yourself. From some of history\'s greatest minds to modern day legends, we\'ve got you covered with a variety of inspiring quotes that will appeal to everyone, no matter what your situation in life may be. So sit back, relax, and let these powerful words ignite your inner fire, and push you towards success. Don\'t wait to be inspired, come and find it with us!', 45, 141, 186, 'content', NULL, NULL, NULL, '2023-06-12 00:53:42', '2023-06-12 00:53:42', NULL),
(119, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Email smtp integration', 'email-smtp-integration-ty4hc', 'Sure, I can do that. Here\'s a general overview of how the integration will work:\n\n1. Frontend: Create a form where users can input their email address and message content.\n2. Once the user submits the form, send the data to the backend.\n3. Backend: Use Node.js to set up an SMTP server with the appropriate credentials (e.g. email address, password, SMTP host, port).\n4. Once the SMTP server is set up, use the Nodemailer library to send an email to the recipient\'s address with the user\'s message content.\n\nHere are the steps to implement this integration:\n\n1. Install and set up the required dependencies for the project: Create a new npm project with `npm init`, then install React.js and the nodemailer package using `npm install react nodemailer` command.\n2. Create a simple form in React.js where users can enter their email address and message content. \n3. Once the user enters their information in the form, handle the form submission with an event handler.\n4. In the event handler, use the axios package to send a POST request to the backend with the user\'s data.\n5. In the backend, set up the SMTP server with Node.js using the NodeMailer package, including the required credentials.\n6. Once the SMTP server is set up, listen for the POST request from the frontend and use the Nodemailer library to send an email to the recipient\'s address with the user\'s message content.\n7. Once the email is sent, send a response back to the frontend to let the user know their email was successfully sent.\n\nIf you need more detailed guidance, let me know and I\'ll be happy to walk you through the steps in more detail.', 39, 352, 391, 'code', NULL, NULL, NULL, '2023-06-12 00:59:56', '2023-06-12 00:59:56', NULL),
(120, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Email smtp integration', 'email-smtp-integration-kfdmg', 'Sure, I can help you with that. Here are the steps to create an email SMTP integration using React.js and Node.js:\n\n## Setting up the project\n\n1. First, we need to create a new React.js project. You can do this by running the following command in your terminal: \n\n```\nnpx create-react-app email-smtp-integration\n```\n\n2. Next, we need to create a new Node.js application. You can do this by running the following command in your terminal:\n\n```\nmkdir email-smtp-integration-backend\ncd email-smtp-integration-backend\nnpm init\n```\n\n3. Now, we need to install the necessary dependencies. In your React.js project directory, run the following command:\n\n```\nnpm install nodemailer\n```\n\nAnd in your Node.js application directory, run the following command:\n\n```\nnpm install express cors body-parser nodemailer\n```\n\n## Creating the backend API\n\n4. In the root folder of your Node.js application, create a new file called `server.js`. \n\n5. In the `server.js` file, import the necessary dependencies and set up the server:\n\n```javascript\nconst express = require(\'express\');\nconst cors = require(\'cors\');\nconst bodyParser = require(\'body-parser\');\nconst nodemailer = require(\'nodemailer\');\n\nconst app = express();\n\napp.use(cors());\napp.use(bodyParser.json());\napp.use(bodyParser.urlencoded({extended: false}));\n\napp.listen(5000, () => {\n    console.log(\'Server started on port 5000\');\n});\n```\n\n6. Next, let\'s create the API endpoint for sending emails. Add the following code to the `server.js` file:\n\n```javascript\napp.post(\'/send-email\', (req, res) => {\n    const { email, message } = req.body;\n\n    const transporter = nodemailer.createTransport({\n        service: \'gmail\',\n        auth: {\n            user: \'youremail@gmail.com\',\n            pass: \'yourpassword\'\n        }\n    });\n\n    const mailOptions = {\n        from: \'youremail@gmail.com\',\n        to: email,\n        subject: \'New email from your website\',\n        text: message\n    };\n\n    transporter.sendMail(mailOptions, (err, info) => {\n        if (err) {\n            console.log(err);\n            res.status(500).send({ message: \'Error sending email\' });\n        } else {\n            console.log(\'Email sent: \' + info.response);\n            res.status(200).send({ message: \'Email sent successfully\' });\n        }\n    });\n});\n```\n\nThis code sets up a nodemailer transport object using your Gmail account credentials. Then it creates a `mailOptions` object with the email address and message from the request body. Finally, it sends the email and returns a success or error message to the client.\n\n## Creating the frontend component\n\n7. In the `src` folder of your React.js project, create a new file called `EmailForm.js`.\n\n8. In the `EmailForm.js` file, add the following code:\n\n```javascript\nimport React, { useState } from \'react\';\nimport axios from \'axios\';\n\nfunction EmailForm() {\n    const [email, setEmail] = useState(\'\');\n    const [message, setMessage] = useState(\'\');\n\n    const handleSubmit = (e) => {\n        e.preventDefault();\n\n        axios.post(\'http://localhost:5000/send-email\', { email, message })\n            .then(res => {\n                alert(res.data.message);\n            })\n            .catch(err => console.log(err));\n\n        setEmail(\'\');\n        setMessage(\'\');\n    }\n\n    return (\n        <form onSubmit={handleSubmit}>\n            <input type=\"email\" placeholder=\"Email\" value={email} onChange={(e) => setEmail(e.target.value)} />\n            <textarea placeholder=\"Message\" value={message} onChange={(e) => setMessage(e.target.value)}></textarea>\n            <button type=\"submit\">Send Email</button>\n        </form>\n    )\n}\n\nexport default EmailForm;\n```\n\nThis code is a simple component that allows the user to enter their email address and a message and submit it to the backend API.\n\n## Using the EmailForm component\n\n9. Finally, we can use the `EmailForm` component in our main `App.js` file:\n\n```javascript\nimport React from \'react\';\nimport EmailForm from \'./EmailForm\';\n\nfunction App() {\n    return (\n        <div>\n            <EmailForm />\n        </div>\n    );\n}\n\nexport default App;\n```\n\n10. Start your React.js project and Node.js application by running the following commands in their respective directories: \n\n```\nnpm start\n```\n\n11. Visit http://localhost:3000 in your web browser to see the EmailForm component. Enter your email address and a message and click the \"Send Email\" button. You should receive a success or error message.\n\nThat\'s it! You\'ve successfully created an email SMTP integration using React.js and Node.js.', 39, 1008, 1047, 'code', NULL, NULL, NULL, '2023-06-12 01:00:47', '2023-06-12 01:00:47', NULL),
(121, 2, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-kwqto', 'Hey guys, welcome back to my TikTok page! Today, I wanted to share a love sad story that always tugs at my heartstrings. <br />\n<br />\nIt\'s a tale as old as time - boy meets girl, they fall in love, but life and circumstances get in the way. They try to make it work but eventually, they have to go their separate ways. <br />\n<br />\nIt\'s a story that\'s been told time and time again, in movies, books, and even in real life. And yet, every time I hear it, it still manages to break my heart a little. <br />\n<br />\nBut what is it about these love sad stories that keeps us coming back for more? Maybe it\'s the fact that love is a universal feeling, something that we can all relate to. Or maybe it\'s because we all secretly yearn for a love that can overcome any obstacle. <br />\n<br />\nWhatever the reason, I think we can all agree that these stories have a power over us, one that we can\'t quite explain. So the next time you\'re feeling down about a lost love, just remember that even the saddest love story can teach us something valuable. <br />\n<br />\nThanks for tuning in guys! Don\'t forget to like and follow for more interesting content', 40, 250, 290, 'content', NULL, NULL, NULL, '2023-06-12 01:06:02', '2023-06-12 01:06:02', NULL),
(122, 2, NULL, 45, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-iaqkg', '1. \"Success in e-commerce requires perseverance, determination, and a willingness to learn and adapt.\"<br />\n<br />\n2. \"With hard work and dedication, your e-commerce venture can bring you endless possibilities and opportunities for growth.\"<br />\n<br />\n3. \"In e-commerce, there\'s always a way to turn every challenge into an opportunity. Keep pushing and don\'t give up!\"<br />\n<br />\n4. \"The beauty of e-commerce is that you have the power to create your own destiny. Believe in yourself and your dreams.\"<br />\n<br />\n5. \"E-commerce may seem overwhelming, but don\'t let that stop you from pursuing your goals. Take small steps every day and your success will follow.\"', 38, 130, 168, 'content', NULL, NULL, NULL, '2023-06-12 01:07:13', '2023-06-12 01:07:13', NULL),
(123, 1, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-xbfre', 'Hey there! I\'m a photographer based in [location]. Capturing life through my lens brings me so much joy. Whether it\'s a wedding, family portrait, or a scenic landscape, I love using photography to express myself and tell stories. When I\'m not behind the camera, you can find me hiking, trying out new recipes, or spending time with my family. Let\'s connect and create something beautiful together! ????????', 36, 89, 125, 'content', NULL, NULL, NULL, '2023-06-12 02:04:49', '2023-06-12 02:04:49', NULL),
(124, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-lmggy', '1. \"Türkiye\'de Teknolojinin Geleceği Şekillendi: Girişimci Ruhlu İşletmeler ve Yenilikçi Çözümler\"<br />\n- The rise of technology startups in Turkey and their impact on the country\'s economy and society<br />\n- Examples of successful Turkish tech companies and their innovative products/services<br />\n- How the Turkish government is supporting and promoting the tech industry in the country<br />\n- Opportunities and challenges for the future of technology in Turkey<br />\n<br />\n2. \"Türkiye\'de Yapay Zekanın Yükselişi: Kullanım Alanları ve Etkileri\"<br />\n- The increasing prevalence of artificial intelligence in Turkey and its various applications, such as in healthcare, finance, and transportation<br />\n- Potential benefits and risks of AI in Turkey, including job displacement and privacy concerns<br />\n- Examples of Turkish companies and institutions using AI technology, and their impact on the industry<br />\n- The importance of ethical and responsible AI development and regulation in Turkey<br />\n<br />\n3. \"Türkiye\'de E-Öğrenme ve Online Eğitim Çözümleri: Geleceğin Eğitim S', 52, 250, 302, 'content', NULL, NULL, NULL, '2023-06-12 02:12:12', '2023-06-12 02:12:12', NULL),
(125, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-11', 'untitled-project-2023-06-11-stkbi', 'John 1:17 Meaning: Understanding the True Message behind the Verse<br />\n<br />\nThe Bible is a sacred text that has been revered by millions of people throughout history. It is a source of hope and inspiration for those who seek enlightenment and guidance in their lives. One of the most profound verses in the Bible is John 1:17, which has been the subject of much debate and interpretation.<br />\n<br />\nThe meaning of John 1:17 is multifaceted. However, it\'s crucial to understand the message behind the verse to appreciate its true significance. The verse states, \"For the law was given through Moses, but grace and truth came through Jesus Christ.\"<br />\n<br />\nAt first glance, the verse may seem simple enough, but it goes much deeper than that. The first part of the verse, \"For the law was given through Moses,\" is a reference to the Old Testament of the Bible when God gave Moses the Ten Commandments on Mount Sinai. This was the beginning of the law, which regulated every aspect of Jewish life.<br />\n<br />\nThe second part of the verse, \"but grace and truth came through Jesus Christ,\" represents a paradigm shift that occurred when Jesus came into the world. Jesus brought a message of love, grace, and redemption, which was radically different', 55, 250, 305, 'content', NULL, NULL, NULL, '2023-06-12 03:03:13', '2023-06-12 03:03:13', NULL),
(126, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Banner Ad', 'banner-ad-9qlzz', 'Sure, here\'s the HTML code for a banner advertisement to be opened in a new tab:\n\n```\n<a href=\"https://www.example.com\" target=\"_blank\">\n  <img src=\"https://www.example.com/banner.jpg\" alt=\"Advertisement\" width=\"728\" height=\"90\">\n</a>\n```\n\nThis code will create a banner ad that, when clicked, will open up a new tab in the user\'s browser with the URL \"https://www.example.com\". The ad image itself is a JPEG file located at \"https://www.example.com/banner.jpg\", with a width of 728 pixels and a height of 90 pixels. Feel free to adjust the URLs and image dimensions as needed for your specific banner ad.', 35, 148, 183, 'code', NULL, NULL, NULL, '2023-06-12 03:23:32', '2023-06-12 03:23:32', NULL),
(127, 2, 10, NULL, NULL, 'gpt-3.5-turbo', 'React js tabs component', 'react-js-tabs-component-qecms', 'Here\'s an example of a simple ReactJS tabs component:\n\n```\nimport React, { useState } from \"react\";\n\nconst Tabs = ({ tabs }) => {\n  const [selectedTab, setSelectedTab] = useState(tabs[0].title);\n  \n  const handleTabClick = (title) => {\n    setSelectedTab(title);\n  };\n  \n  return (\n    <div>\n      <div className=\"tabs\">\n        {tabs.map((tab) => (\n          <div\n            key={tab.title}\n            className={`tab ${selectedTab === tab.title ? \"active\" : \"\"}`}\n            onClick={() => handleTabClick(tab.title)}\n          >\n            {tab.title}\n          </div>\n        ))}\n      </div>\n      {tabs.map(\n        (tab) =>\n          selectedTab === tab.title && <div key={tab.title}>{tab.content}</div>\n      )}\n    </div>\n  );\n};\n\nexport default Tabs;\n```\n\nTo use the component, you would pass in an array of objects as a prop, where each object represents a tab and contains a `title` and `content` property:\n\n```\nimport React from \"react\";\nimport Tabs from \"./Tabs\";\n\nconst App = () => {\n  const tabs = [\n    {\n      title: \"Tab 1\",\n      content: <div>Content for Tab 1</div>,\n    },\n    {\n      title: \"Tab 2\",\n      content: <div>Content for Tab 2</div>,\n    },\n    {\n      title: \"Tab 3\",\n      content: <div>Content for Tab 3</div>,\n    },\n  ];\n  \n  return <Tabs tabs={tabs} />;\n};\n\nexport default App;\n```\n\nIn this implementation, the active tab is tracked using React state. When a tab is clicked, its title is saved in state, and the corresponding content is displayed using conditional rendering. The CSS classes `tab` and `active` are used to style the tabs and highlight the active tab, respectively.', 26, 408, 434, 'code', NULL, NULL, NULL, '2023-06-12 03:26:53', '2023-06-12 03:27:40', NULL),
(128, 1, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-xqfre', 'Cooking is an art that has been practiced for centuries. From simple bread-making to complex molecular gastronomy, there are countless recipes that we can follow to create delicious and nutritious meals. For those who are new to cooking, it can be hard to know where to begin. Thankfully, there are many individuals who are willing to share their recipes and offer guidance to those who are starting out. Today, we will be talking about one such person, Waqas, and his recipe for a delicious chicken curry.<br />\n<br />\nWaqas is a passionate home cook who loves experimenting with different spices and flavors. He has been cooking for his family for over a decade and has picked up many tips and tricks along the way. His chicken curry recipe is a favorite among family and friends and is always a hit at gatherings.<br />\n<br />\nThe recipe is relatively easy to follow, even for beginners. The ingredients are simple and can be easily found at any grocery store. Here are the ingredients that you will need:<br />\n<br />\n- 1 kg chicken, cut into small pieces<br />\n- 2 onions, chopped<br />\n- 2 tomatoes, pureed<br />\n- 2 tbsp ginger-garlic paste<br />\n- 1 tsp cumin powder<br />\n- 1 tsp coriander powder<br />\n-', 47, 250, 297, 'content', NULL, NULL, NULL, '2023-06-12 04:21:19', '2023-06-12 04:21:19', NULL),
(129, 1, NULL, 7, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-hrxzu', 'A business card is an essential tool that represents you and your business. It is a small, portable advertising tool that includes your name, company name, and contact information. A well-designed business card can help you make a great first impression on potential clients and customers. When designing your business card, it\'s important to consider the layout, font, and color scheme to make it stand out from the rest. You want your card to be memorable and representative of your brand. Don\'t underestimate the power of a business card - it can lead to great opportunities and networking connections. Always have a few on hand and be sure to hand them out at every opportunity. Remember, your business card is a reflection of you and the quality of work you provide.', 33, 149, 182, 'content', NULL, NULL, NULL, '2023-06-12 04:51:57', '2023-06-12 04:51:57', NULL),
(130, 1, NULL, 18, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-o5lky', 'It\'s the moment we\'ve all been waiting for - the grand finale of the soccer season is here! The tension is high as the mighty Chivas take on the fierce Tigres in what is sure to be an epic showdown. On top of that, we\'ve got something special for all those who love sushi. At Suchinola, we proudly boast the best sushi in town!<br />\n<br />\nOur team has been preparing for weeks, ensuring that every roll and every piece of nigiri is made with the utmost precision and care. We take pride in sourcing only the freshest and highest quality ingredients for our sushi, so you can be sure that every bite will be a flavor explosion.<br />\n<br />\nBut that\'s not all! At Suchinola, we understand that watching sports requires the perfect combination of delicious food and refreshing drinks. Our extensive menu of sake, beer, and cocktails will be sure to quench your thirst and complement the delicious flavors of our sushi.<br />\n<br />\nSo what are you waiting for? Grab a seat, root for your favorite team, and indulge in some of the best sushi you\'ll ever taste. It\'s the perfect way to spend an unforgettable evening with friends, family, or colleagues. Don\'t miss out on the ultimate soccer experience coupled with an incredible', 62, 250, 312, 'content', NULL, NULL, NULL, '2023-06-12 05:15:47', '2023-06-12 05:17:10', NULL),
(131, 2, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-uyfil', 'Black Windows: The New Trend in Doors and Windows<br />\n<br />\nThe exterior of a home sets the tone for what lies within. It gives the first impression of what kind of personality the house has. And one of the most important elements of that impression is the condition and style of the windows and doors. The right color, design, and framing can make all the difference, and one trend that’s becoming increasingly popular is the use of black windows.<br />\n<br />\nBlack windows and doors may sound a little intimidating or dramatic, but in reality, they can be incredibly versatile. Whether for a traditional or modern home, they are elegant, sophisticated, and provide a contrast that is hard to beat. They can be fully black or paired with white or wood-toned frames to add a touch of class to any design.<br />\n<br />\nOne of the benefits of black windows is that they can complement a wide range of exterior colors. They accentuate light-colored stucco or brick, and add contrast to a dark color siding. Black windows add character to homes with a more traditional style, while also serving as a powerful element in contemporary or minimalist architecture.<br />\n<br />\nThe color black is often associated with extravagance and luxury, so it’s no wonder that this trend has taken off. It has become a', 47, 250, 297, 'content', NULL, NULL, NULL, '2023-06-12 05:44:12', '2023-06-12 05:44:12', NULL),
(136, 2, NULL, 56, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-dpymh', '1. \"Football fever is on! Exciting news coming up, are you ready?\"<br />\n<br />\n2. \"Let\'s kick off the day with some fresh football news, stay tuned!\"<br />\n<br />\n3. \"Breaking news in the world of football, the highlights are just a tap away.\"<br />\n<br />\n4. \"Are you a true football fanatic? You won\'t want to miss this latest update.\"<br />\n<br />\n5. \"Ready for a football frenzy? I\'ve got the scoop on the latest happenings!\"', 40, 250, 135, 'content', NULL, NULL, NULL, '2023-06-12 06:56:07', '2023-06-12 06:56:22', NULL),
(137, 1, NULL, 54, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-sdock', 'Hello there! How are you doing today? I hope you\'re having a wonderful day so far. I just wanted to touch base with you and see what\'s new in your world. Is there anything exciting going on that you\'d like to share? Or maybe something that\'s been on your mind that you\'d like to talk about? Whatever it is, I\'m here and happy to listen. So, let\'s catch up and have a nice chat!', 25, 59, 116, 'content', NULL, NULL, NULL, '2023-06-12 07:20:36', '2023-06-12 07:20:54', NULL),
(138, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-kfhvk', '\"Discover the Wonders of Jordan: Book the Best Tours\"', 43, 13, 56, 'content', NULL, NULL, NULL, '2023-06-12 07:22:19', '2023-06-12 07:22:19', NULL),
(139, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-8ikej', 'When it comes to running, having the right pair of shoes can make all the difference. But with so many options to choose from, it can be overwhelming to decide which ones are best for you. If you\'re also planning on tackling some hiking trails, there are specific features you\'ll want to look for. Here are some tips on which running shoes are the best for hiking.<br />\n<br />\nH1: What to Consider When Choosing Running Shoes for Hiking<br />\nH2: Durability<br />\nThe first thing you\'ll want to consider is the durability of the shoes. Hiking can be tough on footwear, and you\'ll want a pair of shoes that can withstand the wear and tear. Look for shoes made with sturdy materials, such as synthetic materials or high-quality leather, and with reinforced toe caps.<br />\n<br />\nH2: Traction<br />\nHiking often takes you through rocky or slippery terrain, so the sole of your shoes should be designed to keep you steady. Look for shoes that have a tread pattern that provides excellent grip on terrain surfaces. A Vibram sole, for example, is an excellent choice for traction.<br />\n<br />\nH2: Breathability<br />\nHiking can be sweaty work, especially if you\'re running. Shoes with breathable materials can help keep your feet cool and dry, reducing the risk of blisters and other foot-related problems. Mesh or synthetic materials are great options for breathability.<br />\n<br />\nH1: Top Running Shoes for Hiking<br />\nH2: Nike Zoom Terra Kiger 5<br />\nThe Nike Zoom Terra Kiger 5 is a popular choice among runners and hikers alike. The shoes feature a cushioned sole with a rock plate for added protection, a durable upper, and a grippy outsole that provides excellent traction. They are also breathable, thanks to the mesh upper.<br />\n<br />\nH2: Salomon Speedcross 5<br />\nThe Salomon Speedcross 5 is another popular option. The shoes are designed for trail running and feature a sturdy, anti-debris mesh upper that helps keep your feet clean and dry. The sole is made with Contagrip technology, which provides excellent traction on wet and slippery terrain.<br />\n<br />\nH2: Brooks Cascadia 15<br />\nThe Brooks Cascadia 15 is a well-cushioned shoe that provides comfort on long hikes or runs. The shoes feature a durable upper, a protective rock plate, and a sole that provides excellent traction. They are also breathable, thanks to the mesh upper and perforations to allow air flow.<br />\n<br />\nIn conclusion, if you\'re planning on running and hiking, you\'ll want a pair of shoes that are durable, have good traction, and are breathable. The Nike Zoom Terra Kiger 5, Salomon Speedcross 5, and Brooks Cascadia 15 are all excellent options that combine these features with comfort and style. By choosing the right shoes, you can make sure your running and hiking experiences are enjoyable and injury-free.', 53, 449, 649, 'content', NULL, NULL, NULL, '2023-06-12 07:49:01', '2023-06-12 07:50:30', NULL),
(140, 1, NULL, 7, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-fqnqc', 'Hey there, app developers! Are you looking to create the best app possible? Well, look no further because we have some tips for you. First off, make sure your app is user-friendly and easy to navigate. No one wants to struggle with an app that they can\'t figure out. Secondly, consider the design and aesthetics of your app. A visually appealing app can make a big difference in attracting users. Additionally, make sure your app solves a problem or fulfills a need for your audience. Lastly, keep up with updates and improvements to keep your app running smoothly and maintaining user interest. By following these tips, you can create an app that is sure to be a hit with users. Good luck!', 36, 143, 179, 'content', NULL, NULL, NULL, '2023-06-12 07:52:30', '2023-06-12 07:52:30', NULL),
(141, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-4eh0c', '1. The Top 10 Surprising Benefits of Eating Healthy<br />\n- Introduction: Brief explanation of why healthy food habits are important<br />\n- Benefit 1: Improved Mood and Mental Health<br />\n- Benefit 2: Increased Energy and Stamina<br />\n- Benefit 3: Stronger Immune System<br />\n- Benefit 4: Better Digestive Health<br />\n- Benefit 5: Reduced Risk of Chronic Diseases<br />\n- Benefit 6: Improved Skin Health<br />\n- Benefit 7: Weight Management<br />\n- Benefit 8: Reduced Inflammation<br />\n- Benefit 9: Better Sleep Quality<br />\n- Benefit 10: Longevity and Overall Health<br />\n<br />\n2. The Importance of Meal Planning for Healthy Eating<br />\n- Introduction: The basics of meal planning<br />\n- Step 1: Assessing Your Nutritional Needs<br />\n- Step 2: Setting Realistic Goals<br />\n- Step 3: Creating a Balanced Diet<br />\n- Step 4: Planning Your Meals and Snacks<br />\n- Step 5: Making a Grocery List<br />\n- Step 6: Preparing Your Food<br />\n- Step 7: Sticking to the Plan<br />\n- Conclusion: The benefits of meal planning for overall health.<br />\n<br />\n3. Healthy Eating on a Budget<br />\n- Introduction: The challenges of eating healthy on', 37, 250, 287, 'content', NULL, NULL, NULL, '2023-06-12 07:54:52', '2023-06-12 07:54:52', NULL),
(142, 1, NULL, 59, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-p6ug5', 'Hello! How are you doing today? I hope you\'re having a great day so far. I just wanted to check in and say hi, and see if there\'s anything I can do to help you out. Let me know if you need anything at all, and I\'ll be happy to assist you in any way I can. Have a fantastic day!', 25, 97, 97, 'content', NULL, NULL, NULL, '2023-06-12 08:06:22', '2023-06-12 08:06:56', NULL),
(143, 2, NULL, NULL, 1, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-2agqq', 'Hey everyone! ???? ThemeTags is hiring! We are currently looking for a talented Frontend Developer to join our team. ????<br />\n<br />\nAs a Frontend Developer at ThemeTags, you\'ll work with a dynamic group of professionals who are passionate about creating amazing user interfaces and experiences. You\'ll have the opportunity to work on exciting projects that challenge your skills and help you grow as a developer. ????<br />\n<br />\nSome of the key skills we\'re looking for include experience with HTML/CSS, JavaScript, and ideally familiarity with React or Vue.js. If you\'re a creative problem-solver with a strong attention to detail and a passion for coding, we\'d love to hear from you!<br />\n<br />\nAt ThemeTags, we pride ourselves on our inclusive, supportive culture and our commitment to ongoing learning and development. If you\'re looking for an exciting new challenge in a friendly and collaborative environment, we\'d love to hear from you. ????<br />\n<br />\nSo, what are you waiting for? Apply now and join our team of talented developers! ???? #frontenddeveloper #hiring #jobopening #themetags #webdevelopment #developmentjobs #css #javascript #react #vuejs', 44, 235, 279, 'content', NULL, NULL, NULL, '2023-06-12 08:26:39', '2023-06-12 08:26:39', NULL),
(144, 2, NULL, 15, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-u97p2', 'Attention all adults, singles and couples looking to make a difference in the world! Discover a whole new way of exploring the globe with Journey4good - the luxury travel experience that lets you support a good cause while living your dreams. Travel to exotic destinations and make a positive impact on local communities. From building schools to protecting endangered wildlife, every Journey4good trip brings you closer to the world\'s most pressing challenges. Join us on a journey like no other and make a real difference today! #Journey4Good #TravelWithPurpose #LuxuryExperience #MakeADifference #GlobalImpact', 73, 79, 191, 'content', NULL, NULL, NULL, '2023-06-12 08:27:24', '2023-06-12 08:30:32', NULL),
(145, 1, NULL, 46, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-1ycem', 'Verse 1:<br />\nI\'ve been wanting to say these words<br />\nFor such a long, long time<br />\nBut every time I try to speak<br />\nMy heart starts racing wild<br />\n<br />\nChorus:<br />\nI love you, love you,<br />\nMore than words can say<br />\nI want to hold you close to me<br />\nAnd never let you go away<br />\n<br />\nVerse 2:<br />\nI never thought that I could feel<br />\nThis way that I do now<br />\nYou make me smile, you make me laugh<br />\nAnd I don\'t want to take a bow<br />\n<br />\nChorus:<br />\nI love you, love you,<br />\nMore than words can say<br />\nI want to hold you close to me<br />\nAnd never let you go away<br />\n<br />\nBridge:<br />\nI know that we\'re just friends right now<br />\nBut I\'m hoping we could be more<br />\nI promise to be there for you<br />\nAnd love you like never before<br />\n<br />\nChorus:<br />\nI love you, love you,<br />\nMore than words can say<br />\nI want to hold you close to me<br />\nAnd never let you go away<br />\n<br />\nOutro:<br />\nYou mean the world to me<br />\nAnd I hope that you can see<br />\nThat I love you, love you,<br />\nTruly and wholeheartedly.', 34, 239, 273, 'content', NULL, NULL, NULL, '2023-06-12 09:08:37', '2023-06-12 09:08:37', NULL),
(146, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'token', 'token-hvy3o', 'Here is an example code snippet for creating an ERC20 token on Ethereum with the name \"Dada\" and a total supply of 1,000,000:\n\n```\npragma solidity ^0.8.0;\n\ncontract DadaToken {\n    string public name = \"Dada\";\n    string public symbol = \"DADA\";\n    uint256 public totalSupply = 1000000;\n\n    mapping(address => uint256) public balances;\n\n    constructor() {\n        balances[msg.sender] = totalSupply;\n    }\n\n    function transfer(address _to, uint256 _value) public returns (bool success) {\n        require(balances[msg.sender] >= _value);\n        balances[msg.sender] -= _value;\n        balances[_to] += _value;\n        emit Transfer(msg.sender, _to, _value);\n        return true;\n    }\n\n    event Transfer(address indexed _from, address indexed _to, uint256 _value);\n}\n```\n\nThis code defines a smart contract for the DadaToken. The `name`, `symbol`, and `totalSupply` variables are set to \"Dada\", \"DADA\", and 1,000,000, respectively.\n\nThe `balances` mapping keeps track of the balance of each address that holds the token. The `constructor` function assigns the entire supply to the contract deployer\'s address.\n\nThe `transfer` function is used to transfer the tokens from one address to another. It checks if the sender\'s balance is sufficient, updates the balances, and emits a `Transfer` event.', 34, 312, 346, 'code', NULL, NULL, NULL, '2023-06-12 09:10:09', '2023-06-12 09:10:09', NULL),
(147, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'token', 'token-zvn3x', 'Here\'s an example solidity code for the DADA token with 1,000,000 total supply that prevents anti-bot mechanisms:\n\n```\npragma solidity ^0.8.0;\n// SPDX-License-Identifier: UNLICENSED\n\ncontract DADAToken {\n    string public name = \"DADA\";\n    string public symbol = \"DAD\";\n    uint256 public totalSupply = 1000000;\n    uint8 public decimals = 18;\n\n    mapping (address => uint256) public balanceOf;\n    mapping (address => mapping(address => uint256)) public allowance;\n\n    mapping (address => bool) public whitelist;\n\n    bool public antiBotEnabled = true;\n\n    event Transfer(address indexed from, address indexed to, uint256 value);\n    event Approval(address indexed owner, address indexed spender, uint256 value);\n\n    constructor() {\n        balanceOf[msg.sender] = totalSupply;\n        whitelist[msg.sender] = true;\n    }\n\n    function transfer(address _to, uint256 _value) public returns (bool success) {\n        require(balanceOf[msg.sender] >= _value, \"Insufficient balance\");\n        if (antiBotEnabled) {\n            require(whitelist[msg.sender] || whitelist[_to], \"Anti-bot mechanism triggered\");\n        }\n        balanceOf[msg.sender] -= _value;\n        balanceOf[_to] += _value;\n        emit Transfer(msg.sender, _to, _value);\n        return true;\n    }\n\n    function approve(address _spender, uint256 _value) public returns (bool success) {\n        allowance[msg.sender][_spender] = _value;\n        emit Approval(msg.sender, _spender, _value);\n        return true;\n    }\n\n    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {\n        require(_value <= balanceOf[_from], \"Insufficient balance\");\n        require(_value <= allowance[_from][msg.sender], \"Insufficient allowance\");\n        if (antiBotEnabled) {\n            require(whitelist[msg.sender] || whitelist[_from] || whitelist[_to], \"Anti-bot mechanism triggered\");\n        }\n        balanceOf[_from] -= _value;\n        balanceOf[_to] += _value;\n        allowance[_from][msg.sender] -= _value;\n        emit Transfer(_from, _to, _value);\n        return true;\n    }\n\n    function addWhitelist(address _address) public {\n        whitelist[_address] = true;\n    }\n\n    function removeWhitelist(address _address) public {\n        whitelist[_address] = false;\n    }\n\n    function disableAntiBot() public {\n        antiBotEnabled = false;\n    }\n\n    function enableAntiBot() public {\n        antiBotEnabled = true;\n    }\n}\n```\n\nThe `whitelist` mapping stores the addresses that are exempted from the anti-bot mechanism. The `antiBotEnabled` variable can be toggled on and off by the contract owner. If anti-bot check fails, the transaction will fail as well. \n\nNote that this is just an example and it\'s important to properly test and audit the code before deploying it.', 37, 633, 670, 'code', NULL, NULL, NULL, '2023-06-12 09:11:17', '2023-06-12 09:11:17', NULL),
(148, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'token', 'token-ca8vu', 'Here\'s some sample code in Solidity for an ERC20 token on the Ethereum network with the given specifications:\n\n```\n// SPDX-License-Identifier: MIT\npragma solidity >=0.6.0 <0.9.0;\n\ncontract DadaToken {\n    string public name = \"Dada\";\n    string public symbol = \"DADA\";\n    uint256 public totalSupply = 1000000;\n    uint8 public decimals = 18;\n\n    mapping(address => uint256) public balanceOf;\n    mapping(address => mapping(address => uint256)) public allowance;\n\n    constructor() {\n        balanceOf[msg.sender] = totalSupply;\n    }\n\n    function transfer(address _to, uint256 _value) public returns (bool success) {\n        require(balanceOf[msg.sender] >= _value, \"Not enough tokens\");\n\n        balanceOf[msg.sender] -= _value;\n        balanceOf[_to] += _value;\n\n        emit Transfer(msg.sender, _to, _value);\n        return true;\n    }\n\n    function approve(address _spender, uint256 _value) public returns (bool success) {\n        allowance[msg.sender][_spender] = _value;\n\n        emit Approval(msg.sender, _spender, _value);\n        return true;\n    }\n\n    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {\n        require(balanceOf[_from] >= _value, \"Not enough tokens\");\n        require(allowance[_from][msg.sender] >= _value, \"Not enough allowance\");\n\n        balanceOf[_from] -= _value;\n        balanceOf[_to] += _value;\n        allowance[_from][msg.sender] -= _value;\n\n        emit Transfer(_from, _to, _value);\n        return true;\n    }\n\n    event Transfer(address indexed _from, address indexed _to, uint256 _value);\n    event Approval(address indexed _owner, address indexed _spender, uint256 _value);\n}\n```\n\nThis code will create a new ERC20 token with the name \"Dada\", symbol \"DADA\", and total supply of 1,000,000 tokens, with 18 decimals. It includes the basic functions for transfer, approve, and transferFrom, as well as two events for keeping track of token transfers and approvals. Additionally, an anti-bot mechanism can be implemented by adding a function to limit the rate of token transfers that originate from a single account.', 37, 493, 530, 'code', NULL, NULL, NULL, '2023-06-12 09:11:18', '2023-06-12 09:11:18', NULL),
(153, 1, NULL, NULL, 2, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-t7phw', '1. Looking to strengthen your professional network? Look no further! My LinkedIn profile is the perfect place to connect and collaborate with like-minded individuals. From sharing insights, to exploring opportunities, let\'s work together towards success.<br />\n<br />\n2. Hey there! Thanks for stopping by my LinkedIn profile. As a driven and dynamic individual, I\'m always on the lookout for ways to grow and learn. Whether you\'re looking for a skilled collaborator or just want to stay connected, you\'ve come to the right place.<br />\n<br />\n3. Seeking to enhance your profile on LinkedIn? Let\'s team up to create a strong and compelling personal brand. With my skills and experience, we can craft a powerful message that showcases your unique talents and abilities. Let\'s get started!<br />\n<br />\n4. Attention all professionals! Are you ready to take your career to the next level? With my LinkedIn profile, I offer a wealth of knowledge and expertise that can help you achieve your goals. From networking to skill-building, let\'s work together to unlock your full potential.', 39, 204, 243, 'content', NULL, NULL, NULL, '2023-06-12 09:17:01', '2023-06-12 09:17:01', NULL),
(154, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'mev bot', 'mev-bot-sxn9c', 'A MEV (Maximal Extractable Value) bot in Ethereum is a program that seeks to capture profits generated from reordering and front-running transactions in the transaction pool. MEV is essentially the difference in profits between the expected outcome and the actual outcome of a transaction. \n\nTo create a MEV bot in Ethereum, you will need to have knowledge of programming languages such as Solidity and web3.js. The bot will need to be able to identify transactions that are profitable to extract MEV and execute them quickly.\n\nHere are some steps to create a simple MEV bot in Ethereum:\n\n1. Establish a connection with the Ethereum network using web3.js.\n2. Monitor the transaction pool for incoming transactions and analyze their contents to determine if there is a profitable opportunity.\n3. If a profitable transaction is identified, simulate the transaction and determine the expected MEV.\n4. If the expected MEV is sufficient, execute the transaction quickly.\n5. Repeat steps 2-4 continuously to identify and capture as much MEV as possible.\n\nKeep in mind that MEV extraction can be a controversial topic within the Ethereum community. It\'s important to always act ethically and be transparent about the operations of your bot.', 26, 243, 269, 'code', NULL, NULL, NULL, '2023-06-12 09:17:41', '2023-06-12 09:17:41', NULL),
(155, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'mev bot', 'mev-bot-pitko', 'I\'m sorry, I\'m not sure what you mean by \"mev bot.\" Could you please provide more details or context?', 26, 26, 52, 'code', NULL, NULL, NULL, '2023-06-12 09:18:14', '2023-06-12 09:18:14', NULL),
(157, 1, NULL, NULL, 1, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-xjyqn', 'Hey everyone! Are you interested in becoming a great programmer? Let me share with you some tips that can help you become one!<br />\n<br />\nFirst of all, it\'s essential to understand the fundamentals of programming. Learning the basics of any programming language, such as syntax and data structures, will provide a strong foundation for your career. <br />\n<br />\nSecondly, practice coding regularly. The more you code, the more you will learn. Start building small projects and gradually move towards more complex ones. Additionally, keep an eye on innovative technologies and incorporate them into your projects.<br />\n<br />\nThirdly, never stop learning. As technology evolves, so must your skills. Continuously educate yourself by attending classes, reading books, or joining online communities. <br />\n<br />\nLastly, communication is key. Being able to communicate your ideas clearly to your team and clients is vital. Good communication skills will help you work efficiently and produce excellent results.<br />\n<br />\nThese are some tips to become an excellent programmer. Always remember, it takes determination and hard work, but the end result will be worth it.', 38, 206, 244, 'content', NULL, NULL, NULL, '2023-06-12 09:20:48', '2023-06-12 09:20:48', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(158, 2, NULL, NULL, 1, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-7wtjk', 'Hey folks! ????<br />\n<br />\nAre you an experienced Frontend Developer looking for a new opportunity? Look no further! ThemeTags is hiring for the position of Frontend Developer.<br />\n<br />\nAs a member of our team, you’ll have the opportunity to work on exciting projects and collaborate with a group of talented individuals. ????<br />\n<br />\nTo be successful in this role, you should have a strong foundation in JavaScript, HTML/CSS, and be comfortable working with frameworks like React or Vue. You should also have experience working with APIs and be able to confidently debug code.<br />\n<br />\nIf this sounds like the perfect fit for you, head over to our website to learn more and apply. We look forward to hearing from you! ????<br />\n<br />\n#frontenddeveloper #hiring #javascript #react #vue #wearehiring #dreamjob', 44, 164, 208, 'content', NULL, NULL, NULL, '2023-06-12 09:30:15', '2023-06-12 09:30:15', NULL),
(159, 1, NULL, NULL, 1, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-b32zm', 'Hey there, fellow programmers! <br />\n<br />\nAs someone who\'s been in the programming game for a while now, I\'ve learned a thing or two about what it takes to be a good programmer. And let me tell you, it\'s not just about knowing how to code.<br />\n<br />\nFirst and foremost, a good programmer is a problem solver. You need to be able to look at a challenge, break it down into smaller pieces, and find creative ways to overcome it. This means being curious, persistent, and willing to try new things.<br />\n<br />\nBut technical skills are important, too. Make sure you\'re constantly honing your coding abilities and staying up-to-date with the latest languages and frameworks. Take on new projects that challenge you, seek out feedback from colleagues, and never stop learning.<br />\n<br />\nCommunicating effectively with your team is also a key part of being a good programmer. Don\'t be afraid to ask questions or offer your own thoughts and ideas. And remember, code is meant to be read by humans, not just machines. So make sure your code is clean, well-documented, and easy to understand.<br />\n<br />\nFinally, don\'t forget the importance of collaboration and teamwork. Building great software is rarely a solo effort, so learn to work effectively with others and be', 38, 225, 288, 'content', NULL, NULL, NULL, '2023-06-12 09:39:06', '2023-06-12 09:47:26', NULL),
(160, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-8pzck', '<b>[Output-1]</b><br />\r\n\"Discover Jordan\'s Best Kept Secrets with our Expert Guidebooks\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n\"Explore Jordan with Award-Winning Guidebooks: Maps, Itineraries, and Expert Guidance\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n\"Discover Jordan\'s Heart: Expert Guidebooks, Maps, and Itineraries\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\n\"Explore Jordan Like a Pro: Award-Winning Guidebooks with Expert Itineraries and Maps\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n\"Explore Jordan with our Award-Winning Guidebooks - Comprehensive Itineraries and Expert Guidance Included\"<br />\r\n<br />\r\n<br />', 63, 91, 154, 'content', NULL, NULL, NULL, '2023-06-12 09:39:26', '2023-06-12 09:39:26', NULL),
(161, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-iwcui', '<b>[Output-1]</b><br />\r\n\"Discover Jordan\'s Best Tours & Activities with Our Trusted Travel Agent - Book Now!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n\"Discover the Best of Jordan with Our Trusted Travel Agency - Book Now for Unforgettable Tours and Activities!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n\"Experience Jordan Like Never Before: Book with the Most Trusted Travel Agent Now!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\n\"Experience Jordan\'s Best with our Trusted Travel Agency - Book Now!\"<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n\"Experience the Best of Jordan with our Trusted Travel Agent - Book Now!\"<br />\r\n<br />\r\n<br />', 60, 83, 143, 'content', NULL, NULL, NULL, '2023-06-12 09:41:57', '2023-06-12 09:41:57', NULL),
(162, 2, NULL, 6, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-dfyxl', '<b>[Output-1]</b><br />\r\n1. Jordan Travel Adventures<br />\n2. Best Travel Agent in Jordan<br />\n3. Discover Jordan\'s Hidden Gems<br />\n4. Unforgettable Experiences in Jordan<br />\n5. Authentic Jordanian Culture<br />\n6. Top Jordanian Attractions<br />\n7. Expert Jordan Travel Planning<br />\n8. Luxury Jordan Tours<br />\n9. Jordan Adventure Packages<br />\n10. Group Travel to Jordan<br />\r\n<br />\r\n<br />\r\n<b>[Output-2]</b><br />\r\n1. Jordan travel<br />\n2. Jordan tour packages<br />\n3. Trusted travel agent<br />\n4. Jordanian culture<br />\n5. Historical Jordan<br />\n6. Luxury travel to Jordan<br />\n7. Top tourist destinations in Jordan<br />\n8. Jordanian cuisine<br />\n9. Jordan adventure travel<br />\n10. Jordanian hospitality<br />\n11. Jordan travel tips<br />\n12. Jordanian architecture<br />\n13. Religious sites in Jordan<br />\n14. Jordan wildlife and nature<br />\n15. Jordan travel safety tips<br />\r\n<br />\r\n<br />\r\n<b>[Output-3]</b><br />\r\n1. Jordan Travel<br />\n2. Unforgettable Experiences <br />\n3. Trusted Travel Agent<br />\n4. Jordan Tourism <br />\n5. Cultural Exploration <br />\n6. Adventure Travel <br />\n7. Spectacular Scenery <br />\n8. Luxury Travel <br />\n9. Authentic Jordanian Cuisine <br />\n10. Historical Landmarks.<br />\r\n<br />\r\n<br />\r\n<b>[Output-4]</b><br />\r\n1. Jordan Travel<br />\n2. Trusted Travel Agent<br />\n3. Unique Jordan Experience<br />\n4. Jordan Adventures<br />\n5. Discover Jordan<br />\n6. Authentic Jordan Travel<br />\n7. Jordan Tours<br />\n8. Jordanian Culture<br />\n9. Unforgettable Jordan Memories<br />\n10. Jordan Travel Packages<br />\n11. Jordanian Cuisine<br />\n12. Luxury Jordan Travel<br />\n13. Ecotourism in Jordan<br />\n14. Jordanian History<br />\n15. Best Places to Visit in Jordan.<br />\r\n<br />\r\n<br />\r\n<b>[Output-5]</b><br />\r\n1) Jordan Travel <br />\n2) Jordan Tours <br />\n3) Trusted Travel Agent <br />\n4) Jordan Culture <br />\n5) Jordan Adventure <br />\n6) Jordan Landmarks <br />\n7) Best Jordan Itinerary <br />\n8) Jordan Vacation <br />\n9) Jordan History <br />\n10) Authentic Jordan Experience<br />\r\n<br />\r\n<br />', 44, 71, 413, 'content', NULL, NULL, NULL, '2023-06-12 09:43:46', '2023-06-12 09:44:03', NULL),
(163, 1, NULL, NULL, 1, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-a6vve', 'Hey everyone! ????????<br />\n<br />\nAre you interested in becoming a great programmer? It\'s not just about knowing the programming languages or memorizing the syntax. Being a good programmer is much more than that! Here are some tips that can guide you towards becoming a competent and sought-after programmer:<br />\n<br />\n1️⃣???? Understand the problem first before jumping into coding.<br />\n<br />\n2️⃣???? Always look for ways to learn and improve your skills.<br />\n<br />\n3️⃣???? Collaborate and communicate effectively with your team.<br />\n<br />\n4️⃣???? Pay attention to details while coding.<br />\n<br />\n5️⃣???? Practice, practice, practice!<br />\n<br />\nAnd most importantly:<br />\n<br />\n6️⃣???? Have a positive attitude! Being a good programmer also means being a good team player and always having a growth mindset.<br />\n<br />\nRemember, becoming a great programmer is a journey that requires consistency, dedication and a willingness to learn and improve.<br />\n<br />\nWhat other tips would you give to someone who wants to become a good programmer? Share your thoughts in the comments below! ????????<br />\n<br />\n#programming #coding #development #technology #tips #careeradvice #growthmindset #teamwork #', 38, 250, 288, 'content', NULL, NULL, NULL, '2023-06-12 09:47:33', '2023-06-12 09:47:33', NULL),
(164, 1, NULL, 56, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-kcqbw', '1. \"Love can conquer anything! This story of a poor man who married a rich girl after facing countless obstacles for her sake will leave you feeling inspired. ❤️ #LoveConquersAll #TrueLove\"<br />\n2. \"You won\'t want to miss this heartwarming story of how a man\'s undying love for his partner led him to overcome all odds. ???????? Watch now! #LoveStory #RelationshipGoals\"<br />\n3. \"It\'s easy to forget what truly matters in life, but this story will remind you. Join us for the incredible story of a couple who proves that love knows no bounds. ???? #RealLove #Soulmates\"<br />\n4. \"If you believe in true love, you need to watch this. ❤️ We\'re sharing the remarkable story of a man who went through unimaginable difficulty for the sake of his partner. #UnconditionalLove #RelationshipGoals\"<br />\n5. \"Grab a box of tissues, you\'re going to need it! ???? This powerful story showcases how a couple\'s love persevered against all odds. #LoveWins #RomanticStory\"', 54, 228, 282, 'content', NULL, NULL, NULL, '2023-06-12 09:53:04', '2023-06-12 09:53:04', NULL),
(165, 1, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-fhs4e', 'Hey there, I\'m a multiple award winner, multi-patent holder, serial entrepreneur, pharmacist, programmer, expert, and cyber security specialist. With years of experience in different fields, I\'ve gathered a versatile set of skills that allow me to innovate and think outside the box. When I\'m not busy protecting my clients\' digital assets, I\'m probably exploring the world, hiking, or trying out new recipes. Life\'s too short to not pursue your passions, right? Let\'s connect and see how I can help you achieve your goals.', 57, 110, 167, 'content', NULL, NULL, NULL, '2023-06-12 09:54:35', '2023-06-12 09:54:35', NULL),
(166, 1, NULL, 61, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-aiuif', 'Once upon a time in Nigeria, there were millions of people who were unable to access financial services, because they were not part of the formal banking sector. They were often called the unbanked. They were left out of the financial ecosystem and unable to save for the future, invest, or grow their businesses. However, in the midst of this challenge, a group of entrepreneurs saw an opportunity to make a difference by providing fintech services that catered to the unbanked and underbanked in the country.<br />\n<br />\nThey founded a company that focused on promoting financial inclusion for everyone, regardless of their location, education, background, or socio-economic status. The founders used their expertise in mobile technology, data analytics, and customer behavior to create a platform that offered a range of financial services, such as peer-to-peer lending, savings, insurance, and payments. They also created a user-friendly app that made it easy for customers to access the services from their mobile devices.<br />\n<br />\nAs the company continued to grow, it faced several challenges, including regulatory requirements, security concerns, and expanding its reach to remote areas. However, the team remained committed to their mission and worked tirelessly to overcome these hurdles. They partnered with local banks, microfinance institutions, and other', 56, 250, 306, 'content', NULL, NULL, NULL, '2023-06-12 10:01:17', '2023-06-12 10:01:17', NULL),
(167, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-x548a', 'Blog Ideas:<br />\n<br />\n1. A Culinary Tour of South London: Discovering the Best Restaurants<br />\n2. London\'s Hidden Gems: Uncovering the Best Kept Secrets of South London Dining<br />\n3. Going Beyond Fish & Chips: Exploring the Diverse Food Scene in South London<br />\n4. Best Brunch Spots in South London: Where to Find Delicious Breakfast and Brunch<br />\n5. A Vegetarian\'s Guide to South London\'s Best Restaurants<br />\n6. Celebrating Cultural Diversity: Exploring Ethnic Cuisine in South London<br />\n7. From Street Food to Fine Dining: The Evolution of South London Restaurants<br />\n8. Date Night in South London: Romantic Restaurants Worth Checking Out<br />\n9. So Much Choice, So Little Time: Tips for Finding the Best South London Restaurants<br />\n10. Industry Insight: A Chat with South London Chefs on the Future of Food<br />\n<br />\nOutline:<br />\n<br />\nI. Introduction<br />\n- Brief overview of South London\'s food scene<br />\n- Purpose of the blog post <br />\n<br />\nII. Body<br />\nA. Culinary Tour of South London<br />\n- Introduction to the best restaurants<br />\n- Description of recommended dishes<br />\n- Why you should visit<br />\n<br />\nB. London\'s Hidden Gems:<br />\n- Definition of what makes restaurants hidden gems <br />\n- Description of recommended hidden gems', 38, 250, 288, 'content', NULL, NULL, NULL, '2023-06-12 10:36:34', '2023-06-12 10:36:34', NULL),
(168, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Login form', 'login-form-ychxh', 'Sure! Here\'s a basic PHP login form you can use as a starting point:\n\n```\n<!DOCTYPE html>\n<html>\n<head>\n	<title>Login</title>\n</head>\n<body>\n\n	<h1>Login Form</h1>\n\n	<form action=\"login.php\" method=\"post\">\n		<label for=\"username\">Username:</label>\n		<input type=\"text\" id=\"username\" name=\"username\" required>\n\n		<label for=\"password\">Password:</label>\n		<input type=\"password\" id=\"password\" name=\"password\" required>\n\n		<input type=\"submit\" value=\"Login\">\n	</form>\n\n</body>\n</html>\n```\n\nThis form has two inputs: one for the username and one for the password. It also has an action of `login.php`, which is where we\'ll handle the form submission. \n\nIn `login.php`, you would need to verify the username/password combination and then redirect the user to the appropriate page. Here\'s an example implementation:\n\n```\n<?php\n	\n	// Check if form was submitted\n	if ($_SERVER[\"REQUEST_METHOD\"] == \"POST\") {\n\n		// Get form data\n		$username = $_POST[\"username\"];\n		$password = $_POST[\"password\"];\n\n		// Verify username and password\n		if ($username == \"myusername\" && $password == \"mypassword\") {\n			// Redirect user to dashboard\n			header(\"Location: dashboard.php\");\n			exit;\n		} else {\n			// Invalid credentials\n			echo \"Invalid username or password.\";\n		}\n\n	}\n\n?>\n```\n\nIn this example, the script checks if the form was submitted using `$_SERVER[\"REQUEST_METHOD\"] == \"POST\"`, and then gets the form data using `$_POST`. It then verifies the username and password (just using hardcoded values for demonstration purposes), and either redirects the user to the dashboard or displays an error message if the credentials are invalid.', 27, 397, 424, 'code', NULL, NULL, NULL, '2023-06-12 11:51:15', '2023-06-12 11:51:15', NULL),
(169, 1, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-yxqhi', 'Chào bạn đọc,<br />\n<br />\nNếu bạn đang tìm kiếm một con đường để trở thành một kĩ sư dữ liệu, thì việc bắt đầu từ kiến thức cơ bản về backend NodeJS là một bước đi tuyệt vời. Tuy nhiên, một khi bạn đã có nền tảng cơ bản này, bạn sẽ cần phải xây dựng một \"road map\" cho bản thân để trở thành một data engineer chuyên nghiệp từ base backend NodeJS trên nền tảng Azure hoặc AWS.<br />\n<br />\nĐầu tiên, bạn cần bổ sung kiến thức về cơ sở dữ liệu. Vì đây là lĩnh vực bạn sẽ làm việc nhiều đến trong vai trò data engineer. Bạn nên tìm hiểu về các loại cơ sở dữ liệu khác nhau, cách sử dụ', 102, 250, 352, 'content', NULL, NULL, NULL, '2023-06-12 11:57:35', '2023-06-12 11:57:35', NULL),
(170, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Giúp tôi gợi ý road map data engineer từ base backend NodeJS (Trên nền Azure hoặc AWS)', 'giup-toi-goi-y-road-map-data-engineer-tu-base-backend-nodejs-tren-nen-azure-hoac-aws-ary79', 'Dưới đây là một gợi ý road map cho Data Engineer từ base backend NodeJS trên nền tảng Azure hoặc AWS:\n\n1. Học về cơ sở dữ liệu: \n- Tìm hiểu về kiến trúc cơ sở dữ liệu và quản lý cơ sở dữ liệu.\n- Học SQL và các công cụ quản lý cơ sở dữ liệu như MySQL hoặc PostgreSQL.\n- Tìm hiểu về NoSQL và các công cụ như MongoDB hoặc Cassandra.\n\n2. Tìm hiểu về Cloud Computing:\n- Tìm hiểu về nền tảng điện toán đám mây và tìm hiểu về các dịch vụ như Amazon Web Services (AWS) hoặc Microsoft Azure.\n- Học cách sử dụng các dịch vụ liên quan đến việc lưu trữ dữ liệu và xử lý dữ liệu trên cloud.\n\n3. Làm quen với Big Data:\n- Học cách xử lý và phân tích dữ liệu lớn.\n- Tìm hiểu về các công cụ như Apache Hadoop hoặc Apache Spark.\n- Học cách sử dụng các công cụ Big Data trên cloud như Amazon EMR hoặc Azure HDInsight.\n\n4. Tích hợp dữ liệu:\n- Tìm hiểu cách tích hợp dữ liệu từ các nguồn khác nhau, ví dụ như dữ liệu từ cơ sở dữ liệu, dữ liệu từ các API hoặc các tệp dữ liệu khác.\n- Tìm hiểu cách sử dụng các công cụ trực quan để kết hợp dữ liệu và thực hiện tiền xử lý.\n\n5. Xây dựng hệ thống xử lý dữ liệu:\n- Phát triển các phần mềm xử lý dữ liệu trên nền NodeJS.\n- Tìm hiểu về Real-time processing và xử lý dữ liệu dòng.\n- Xây dựng Workflow quản lý xử lý dữ liệu.\n\n6. Học cách quản lý dữ liệu và bảo mật:\n- Tìm hiểu tư tưởng quản lý dữ liệu.\n- Học cách bảo vệ dữ liệu và xử lý các vấn đề liên quan đến bảo mật, bao gồm cả quản lý quyền truy cập và tích hợp các giải pháp bảo mật khác nhau.\n\nNgoài ra, bạn cũng có thể nghiên cứu một số dự án tiêu biểu và hướng dẫn trực tuyến có liên quan đến lĩnh vực này để tiếp cận sâu hơn về Data Engineering trên nền tảng Azure hoặc AWS.', 53, 748, 801, 'code', NULL, NULL, NULL, '2023-06-12 11:57:43', '2023-06-12 11:57:43', NULL),
(171, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Write 1-10 add php code', 'write-1-10-add-php-code-ak5nm', 'Sure, here\'s how you can write a PHP code to add numbers 1 through 10:\n\n```\n<?php\n$sum = 0;\nfor($i = 1; $i <= 10; $i++){\n    $sum += $i;\n}\necho \"The sum of 1 through 10 is: \" . $sum;\n?>\n```\n\nThis code initializes a variable called `$sum` to zero, and then uses a `for` loop to add each number from 1 through 10 to the `$sum` variable. Finally, it prints out the result using the `echo` statement.', 30, 126, 156, 'code', NULL, NULL, NULL, '2023-06-12 12:30:55', '2023-06-12 12:30:55', NULL),
(172, 2, NULL, NULL, NULL, NULL, 'Popular gaming poster-1', 'popular-gaming-poster-1-54or6', 'images/CIppqQQVrI.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:31:57', '2023-06-12 12:31:57', NULL),
(173, 2, NULL, NULL, NULL, NULL, 'Popular gaming poster-2', 'popular-gaming-poster-2-m5bem', 'images/ZKfiHbdmKu.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:31:57', '2023-06-12 12:31:57', NULL),
(174, 2, NULL, NULL, NULL, NULL, 'Popular gaming poster-3', 'popular-gaming-poster-3-sql3g', 'images/tXpvECmCmf.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:31:57', '2023-06-12 12:31:57', NULL),
(175, 2, NULL, NULL, NULL, NULL, 'Popular gaming poster-4', 'popular-gaming-poster-4-qd2ca', 'images/A4pyB8zhZd.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:31:58', '2023-06-12 12:31:58', NULL),
(176, 2, NULL, NULL, NULL, NULL, 'Popular gaming poster-5', 'popular-gaming-poster-5-chaqs', 'images/CyF5LK9ah3.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:31:58', '2023-06-12 12:31:58', NULL),
(177, 2, NULL, NULL, NULL, NULL, 'Natural Image for Wallpaper-1', 'natural-image-for-wallpaper-1-wtysw', 'images/iozQaJabot.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:32:39', '2023-06-12 12:32:39', NULL),
(178, 2, NULL, NULL, NULL, NULL, 'Natural Image for Wallpaper-2', 'natural-image-for-wallpaper-2-gy44o', 'images/5c7nnwlljj.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:32:39', '2023-06-12 12:32:39', NULL),
(179, 2, NULL, NULL, NULL, NULL, 'Natural Image for Wallpaper-3', 'natural-image-for-wallpaper-3-wzcpk', 'images/ajReAJAOh5.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:32:40', '2023-06-12 12:32:40', NULL),
(180, 2, NULL, NULL, NULL, NULL, 'Natural Image for Wallpaper-4', 'natural-image-for-wallpaper-4-rczr5', 'images/OLFuKWtFU6.png', NULL, NULL, NULL, 'image', '256x256', NULL, NULL, '2023-06-12 12:32:40', '2023-06-12 12:32:40', NULL),
(181, 2, NULL, 11, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-12', 'untitled-project-2023-06-12-huvja', 'Dear Writebot,<br />\n<br />\nWe hope this email finds you well. We are excited to introduce you to our product, Writebot. As an intelligent writing assistant, Writebot was designed to make your writing experience more efficient and productive.<br />\n<br />\nWhether you are a blogger, journalist, or simply looking to improve your writing skills, Writebot is the perfect tool for you. With its advanced machine learning algorithms, Writebot can help you generate ideas, enhance your grammar and vocabulary, and assist you in perfecting your written content.<br />\n<br />\nWritebot is not only easy to use but also customizable to your individual writing style. You can tailor the tool to fit your specific preferences and create a personalized writing experience.<br />\n<br />\nAs a valued customer, we want to offer you an exclusive discount on your purchase of Writebot. Use the code WRITEBOT20 at checkout to receive 20% off your purchase.<br />\n<br />\nTake your writing to the next level with Writebot. We look forward to assisting you on your writing journey.<br />\n<br />\nBest regards,<br />\n<br />\n[Your Name]', 41, 202, 243, 'content', NULL, NULL, NULL, '2023-06-12 12:34:46', '2023-06-12 12:34:46', NULL),
(182, 1, 9, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-9c4rn', 'En el mundo moderno en el que vivimos, el número 12131 puede parecer solo una simple combinación de números. Sin embargo, en el mundo de la programación, este número tiene un significado más profundo. Es una secuencia numérica utilizada en el diseño y desarrollo de software que garantiza la calidad y la eficiencia del código.<br/><br/>Esta secuencia numérica, también conocida como 3213, es una técnica utilizada por programadores y desarrolladores de software para garantizar que los programas creados sean de alta calidad, estables y eficientes. La técnica de 3213 se basa en una serie de iteraciones y pruebas para identificar y solucionar cualquier error o defecto en el código antes de que se implemente en un sistema en vivo.<br/><br/>La técnica 3213 se utiliza normalmente en el desarrollo de software para garantizar la calidad del producto final. Los desarrolladores utilizan esta secuencia de números para identificar, revisar y perfeccionar el código que han creado. Esta técnica ayuda a reducir el número de errores que pueden surgir después de que el software se haya desplegado en un sistema en', 47, 250, 297, 'content', NULL, NULL, NULL, '2023-06-16 17:40:58', '2023-06-16 18:22:18', NULL),
(183, 1, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-cehzc', '¿Qué significa el número 12131? Probablemente para la mayoría de las personas este número no tenga ningún significado especial. Sin embargo, para los amantes de los números, este podría ser un número fascinante por varias razones.<br/><br/>Comenzando por el número en sí, podemos notar que es un número de cinco cifras, que es la suma de dos números primos: 12131 = 12107 + 24. El número 12107 es un número primo, mientras que el 24 es el producto de los números primos 2, 2 y 3.<br/><br/>Además, si procedemos a sumar las cifras de este número, encontraremos que la suma es 7. El número 7 es considerado por muchos como un número mágico, y se relaciona con conceptos como la perfección, la plenitud y la armonía.<br/><br/>Otro aspecto interesante de este número es que es un número palindrómico, es decir, se lee igual de izquierda a derecha que de derecha a izquierda. Los números palindrómicos tienen una curiosidad mística y algunos incluso los consideran como números de', 47, 250, 297, 'content', NULL, NULL, NULL, '2023-06-16 17:41:13', '2023-06-16 17:41:13', NULL),
(184, 2, NULL, 55, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-2dcyu', '1. \"Fun Day Out\" vlog – document a day spent doing fun activities like visiting an amusement park or going bowling with friends.<br/><br/>2. \"Fun Facts about [insert topic]\" – create an informative video full of interesting and amusing facts about a particular topic. For example, \"Fun Facts About Dogs\" or \"Fun Facts About Space.\"<br/><br/>3. \"Challenge Time\" – come up with a challenge (e.g. eating spicy food, doing a yoga pose, or trying to break a world record) and film yourself attempting it.<br/><br/>4. \"DIY Fun Projects\" – share step-by-step instructions for creating fun crafts or DIY projects, such as making slime or painting a unique picture.<br/><br/>5. \"Fun with Food\" – try out a new recipe or experiment with wacky food combinations (e.g. making a pizza with weird toppings or cooking a meal using only ingredients ordered from a vending machine).<br/><br/>6. \"Funniest Jokes\" – share a video of yourself telling your favorite jokes and try not to laugh while doing so.<br/><br/>7. \"Fun and Games\" – film yourself playing fun games with friends or family, such as charades or Pictionary.<br/><br/>8. \"Travel Adventures\" – share footage from a recent trip', 37, 250, 287, 'content', NULL, NULL, NULL, '2023-06-16 17:53:27', '2023-06-16 17:53:27', NULL),
(185, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-owyaa', '1. \"The Rise of AI: How Artificial Intelligence is Revolutionizing the World\"<br/>2. \"Understanding AI: Demystifying the Terminology and Applications\"<br/>3. \"AI in the Workplace: How Automation and Machine Learning are Changing the Job Market\"<br/>4. \"The Ethical Implications of AI: Exploring the Debate on the Consequences of AI Advancements\"<br/>5. \"AI in the Healthcare Industry: From Improving Diagnostics to Finding New Cures\"<br/>6. \"The Future of Entertainment: How AI is Shaping the Way We Consume Media\"<br/>7. \"AI in Education: Enhancing Learning Experiences with Machine Learning\"<br/>8. \"Challenges and Opportunities in Developing AI: Exploring the Cutting-Edge Research and Development\"<br/>9. \"AI and Cybersecurity: How Machine Learning Can Help Protect Against Cyber Attacks\"<br/>10. \"The Role of AI in Sustainability: Addressing Environmental Issues with Machine Learning\"', 37, 188, 225, 'content', NULL, NULL, NULL, '2023-06-16 18:29:06', '2023-06-16 18:29:06', NULL),
(186, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'code', 'code-jypb1', 'Sure, here\'s a basic Dockerfile for a website:\n\n```\n# Use an official Python runtime as a parent image\nFROM python:latest\n\n# Set the working directory to /app\nWORKDIR /app\n\n# Copy the current directory contents into the container at /app\nCOPY . /app\n\n# Install any needed packages specified in requirements.txt\nRUN pip install --trusted-host pypi.python.org -r requirements.txt\n\n# Make port 80 available to the world outside this container\nEXPOSE 80\n\n# Define environment variable\nENV NAME World\n\n# Run app.py when the container launches\nCMD [\"python\", \"app.py\"]\n```\n\nOf course, you will need to replace `requirements.txt` and `app.py` with the appropriate files for your website. Additionally, you may need to modify the port number or other details depending on your specific application.', 28, 177, 205, 'code', NULL, NULL, NULL, '2023-06-16 19:43:40', '2023-06-16 19:43:40', NULL),
(187, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'code', 'code-vwiq9', 'Here\'s an example of basic HTML code for a website:\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n	<title>My Website</title>\n</head>\n<body>\n	<header>\n		<h1>Welcome to My Website</h1>\n		<nav>\n			<ul>\n				<li><a href=\"#\">Home</a></li>\n				<li><a href=\"#\">About Us</a></li>\n				<li><a href=\"#\">Contact</a></li>\n			</ul>\n		</nav>\n	</header>\n	<main>\n		<p>Hello World!</p>\n	</main>\n	<footer>\n		<p>&copy; My Website 2021</p>\n	</footer>\n</body>\n</html>\n```\n\nIn this example, we have:\n\n- `<!DOCTYPE html>`: This is the document type declaration that tells the browser that we\'re using HTML5.\n- `<html>`: This is the root element of our HTML document.\n- `<head>`: This is where we put metadata about our document, such as the title.\n- `<title>My Website</title>`: This sets the title of our webpage (which appears in the browser tab).\n- `<body>`: This is where we put the visible content of our webpage.\n- `<header>`: This is a container for the top section of our webpage, which usually contains the website logo, menu, and introductory text.\n- `<nav>`: This is a container for the navigation links.\n- `<ul>` and `<li>`: These are used to create an unordered list of navigation links.\n- `<main>`: This is a container for the main content of our webpage.\n- `<p>Hello World!</p>`: This is a paragraph of text.\n- `<footer>`: This is a container for the bottom section of our webpage, which usually contains copyright information and other legal notices.', 26, 390, 416, 'code', NULL, NULL, NULL, '2023-06-16 19:44:56', '2023-06-16 19:44:56', NULL),
(188, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'code', 'code-euvxf', '<!DOCTYPE html>\n<html>\n<head>\n	<title>My Website</title>\n	<meta charset=\"UTF-8\">\n	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n	<link rel=\"stylesheet\" href=\"style.css\">\n</head>\n<body>\n	<header>\n		<h1>My Website</h1>\n	</header>\n	<nav>\n		<ul>\n			<li><a href=\"#\">Home</a></li>\n			<li><a href=\"#\">About</a></li>\n			<li><a href=\"#\">Services</a></li>\n			<li><a href=\"#\">Portfolio</a></li>\n			<li><a href=\"#\">Contact</a></li>\n		</ul>\n	</nav>\n	<main>\n		<section>\n			<h2>Welcome to my website</h2>\n			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt facilisis orci, vel luctus enim luctus a. Quisque et quam vel leo faucibus mattis.</p>\n		</section>\n		<section>\n			<h2>About me</h2>\n			<p>Nullam sed risus vitae arcu aliquam malesuada sit amet quis urna. Fusce ac purus pretium, iaculis turpis in, congue felis.</p>\n		</section>\n		<section>\n			<h2>Services</h2>\n			<ul>\n				<li>Web design</li>\n				<li>Graphic design</li>\n				<li>Social media marketing</li>\n			</ul>\n		</section>\n		<section>\n			<h2>Portfolio</h2>\n			<div class=\"portfolio-item\">\n				<img src=\"image1.jpg\" alt=\"Project 1\">\n				<h3>Project 1</h3>\n				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n			</div>\n			<div class=\"portfolio-item\">\n				<img src=\"image2.jpg\" alt=\"Project 2\">\n				<h3>Project 2</h3>\n				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n			</div>\n			<div class=\"portfolio-item\">\n				<img src=\"image3.jpg\" alt=\"Project 3\">\n				<h3>Project 3</h3>\n				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n			</div>\n		</section>\n		<section>\n			<h2>Contact me</h2>\n			<form>\n				<label for=\"name\">Name:</label>\n				<input type=\"text\" id=\"name\" name=\"name\"><br>\n\n				<label for=\"email\">Email:</label>\n				<input type=\"email\" id=\"email\" name=\"email\"><br>\n\n				<label for=\"message\">Message:</label>\n				<textarea id=\"message\" name=\"message\"></textarea><br>\n\n				<input type=\"submit\" value=\"Send\">\n			</form>\n		</section>\n	</main>\n	<footer>\n		<p>&copy; 2021 My Website. All rights reserved.</p>\n	</footer>\n</body>\n</html>', 26, 686, 712, 'code', NULL, NULL, NULL, '2023-06-16 19:45:20', '2023-06-16 19:45:20', NULL),
(189, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-bq4wm', 'When it comes to biriyani, this mouthwatering dish has been a favorite among many food lovers for generations. Originating from South Asia, biriyani is a one-pot meal of spiced rice cooked with different proteins and vegetables. It\'s known to be a rich, flavorful dish that\'s perfect for sharing with family and friends. But with so many variations of biriyani available, which one should you try? Let\'s explore some of the best biriyanis and what makes them so special.<br/><br/>Hyderabadi biriyani is a classic and widely popular biriyani that originally hails from Hyderabad in India. This variation of biriyani is cooked with marinated meat, basmati rice, and a blend of aromatic spices like saffron, cardamom, and cinnamon. The meat can be anything from chicken to mutton, and when cooked to perfection, it falls right off the bone. What makes Hyderabadi biriyani so unique is the cooking method. The meat is first cooked in its own juices before being layered with rice, which makes for a moist and flavorful dish.<br/><br/>The Awadhi biriyani, which is also known as Lucknowi biriyani,', 52, 250, 302, 'content', NULL, NULL, NULL, '2023-06-16 19:46:10', '2023-06-16 19:46:10', NULL),
(190, 2, NULL, 56, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-feqoz', '1. \"We may not be afraid of no ghosts, but capturing them with our cameras is exhilarating! Join us on our next ghost hunting excursion. #GhostPhotographyCommunity #HauntedAdventures\"<br/><br/>2. \"Do you believe in ghosts? Our community of ghost photographers just might convince you. Check out our latest spooky photos and videos. #GhostlyEncounters #ParanormalActivity\"<br/><br/>3. \"If you\'re ready for a hair-raising experience, come join us as we explore the most haunted buildings in town! Share your own ghostly encounters with the hashtag #GhostsInMyCamera #GhostPhotographyCommunity\"<br/><br/>4. \"We know what you\'re thinking - another group of ghost hunters looking for their 15 minutes of fame. But we\'re different! We love capturing the history of forgotten buildings as much as we love capturing apparitions. #GhostPhotographyCommunity #HauntedHistory\"<br/><br/>5. \"Strap on your brave boots and come on over! We\'re headed to the abandoned asylum down the road. Who knows what kind of spooky encounters we\'ll have? #GhostHunting #HauntedPlaces #GhostPhotographyCommunity\"', 57, 233, 290, 'content', NULL, NULL, NULL, '2023-06-16 20:07:07', '2023-06-16 20:07:07', NULL),
(191, 2, NULL, 39, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-cjvi7', '1. CareHub <br/>2. MedEase <br/>3. Hospital360 <br/>4. HealthFlow <br/>5. ClinicNation <br/>6. DoctorMate <br/>7. CareNavigator <br/>8. MediSavvy <br/>9. HealthFusion <br/>10. HospitalHero <br/>11. Axiom Health <br/>12. SmartClinicPro <br/>13. MedConnect <br/>14. PulsePoint <br/>15. HealthClinique <br/>16. CareUnity <br/>17. Clinico <br/>18. MedicalEase <br/>19. GPBoost <br/>20. HealthTrackz.', 46, 109, 155, 'content', NULL, NULL, NULL, '2023-06-16 20:09:58', '2023-06-16 20:09:58', NULL),
(192, 1, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-gslqa', 'Las telecomunicaciones son un aspecto fundamental en nuestras vidas, ya que nos permiten estar conectados con el mundo y disfrutar de un sinfín de comodidades. Una de las tecnologías que ha revolucionado nuestro modo de vida es el wifi.<br/><br/>Gracias al wifi, podemos conectarnos a internet desde cualquier lugar de nuestra casa o incluso de nuestro vecindario, sin tener que preocuparnos por cables y conexiones engorrosas. Además, el wifi nos permite utilizar una amplia gama de dispositivos, desde laptops y smartphones hasta consolas de videojuegos y altavoces inteligentes.<br/><br/>Pero ¿cómo funciona el wifi? En términos sencillos, el wifi es una tecnología que nos permite conectarnos a internet mediante ondas de radio. Estas ondas se envían desde un router o punto de acceso, que se encarga de tomar la señal de internet que llega a nuestra casa y distribuirla a través de una red inalámbrica.<br/><br/>Para disfrutar del wifi en casa, es necesario contar con un proveedor de internet que nos brinde una conexión de alta velocidad. A su vez, deb', 48, 250, 298, 'content', NULL, NULL, NULL, '2023-06-16 20:13:38', '2023-06-16 20:13:38', NULL),
(193, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'factura', 'factura-d9xgf', '¡Claro! Un facturero para MercadoLibre podría tener la siguiente funcionalidad:\n\n- Registro de usuario: El usuario ingresaría sus datos personales y de facturación en un formulario.\n- Integración con MercadoPago: El facturero estaría integrado con MercadoPago para validar la transacción y obtener la información necesaria para la factura.\n- Generación de factura: El facturero generaría la factura automáticamente con los datos suministrados por el usuario y la información de la transacción en MercadoPago.\n- Descarga de factura: Una vez generada la factura, el usuario podría descargarla en formato PDF o recibir un correo electrónico con la factura adjunta.\n\nAdemás, el facturero podría tener una sección de administración donde el usuario pudiera consultar todas las facturas generadas y descargarlas nuevamente si es necesario.', 27, 184, 211, 'code', NULL, NULL, NULL, '2023-06-16 20:14:52', '2023-06-16 20:14:52', NULL),
(194, 1, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-c4d1w', '¡Good day, amigos! ¿Cómo están hoy? Yo estoy muy emocionado porque hoy vamos a hablar sobre uno de los inventos más importantes de nuestro tiempo, ¡el WiFi!<br/><br/>¿Alguna vez se han preguntado cómo sería nuestra vida sin WiFi? Yo no podría imaginar el caos que sería. No podría ver mis programas favoritos en streaming, no podría conectarme con mi familia y amigos en línea, ¡ni siquiera podría hablar con ustedes en TikTok!<br/><br/>Gracias al WiFi, podemos hacer todas estas cosas y más. Así que, ¿por qué no aprovechar al máximo esta maravillosa tecnología? Usen una contraseña segura para mantener a los intrusos fuera de su red, y asegúrense de que su WiFi esté siempre funcionando correctamente para tener la mejor experiencia en línea posible.<br/><br/>Y si alguna vez necesitan ayuda para solucionar problemas de WiFi, recuerden que siempre pueden buscar en línea, ¡o incluso pedir ayuda a un experto en informática!<br/><br/>Entonces, amigos, espero que hayan aprendido algo nuevo e interesante sobre el WiFi hoy. ¡Gracias por ver, y nos vemos en', 39, 250, 289, 'content', NULL, NULL, NULL, '2023-06-16 20:16:23', '2023-06-16 20:16:23', NULL),
(195, 2, NULL, 61, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-az042', 'Once upon a time, a group of passionate entrepreneurs had the idea to create a web application for hospital management systems. They saw a gap in the market and wanted to make healthcare more accessible and efficient. <br/><br/>With knowledge of coding and an understanding of the healthcare industry, the team worked tirelessly to develop the application. They knew that the success of their business depended on creating something user-friendly and easy to navigate. <br/><br/>After months of hard work and dedication, the web application was ready to launch. The team reached out to hospitals and medical professionals across the country, showcasing the benefits of their system. <br/><br/>The system proved to be a huge success, quickly becoming the go-to choice for many healthcare providers. The team received positive feedback from clients who praised the easy-to-use interface, ability to schedule appointments, track patient records, and manage inventory. <br/><br/>With the success of the web application, the team continued to innovate and add new features to their platform, ensuring it remained ahead of the competition. With each update, they saw an increase in demand from healthcare providers, and the business began to grow exponentially. <br/><br/>Today, the company continues to thrive, and the team is proud of the positive impact their web application has had on the healthcare industry. Patients receive better', 48, 250, 298, 'content', NULL, NULL, NULL, '2023-06-16 20:16:43', '2023-06-16 20:16:43', NULL),
(196, 2, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-mlnko', 'Hey there! I\'m an IT entrepreneur who loves creating awesome things with technology. I\'m all about innovation and making our world a better place through clever solutions. But don\'t let my techy side fool you - I\'m a cool guy who loves to have a good time and connect with new people. As a true visionary, I\'m always thinking ahead and imagining what\'s possible. So let\'s chat and see where our creative minds can take us!', 46, 91, 137, 'content', NULL, NULL, NULL, '2023-06-16 20:20:10', '2023-06-16 20:20:10', NULL),
(197, 2, NULL, 56, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-9jfdm', '1. \"Bedtime shenanigans with my little ones!\"<br/>2. \"When my kids take over the bed, it\'s sweet chaos.\"<br/>3. \"Can\'t resist jumping on the bed with these cuties.\"<br/>4. \"Watching my kids play on the bed brings me so much joy.\"<br/>5. \"Who says beds are just for sleeping? My kids turn it into an adventure!\"', 42, 250, 121, 'content', NULL, NULL, NULL, '2023-06-16 20:21:08', '2023-06-16 20:21:47', NULL),
(198, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'python', 'python-4cjbi', 'Para crear un CRM (Customer Relationship Management) en Python, se pueden usar varias herramientas y librerías. Una de las opciones más populares es Django, un framework de desarrollo web en Python. \n\nEstos son los pasos a seguir para crear un simple CRM con Django:\n\n1. Instalar Django: Para instalar Django, se puede utilizar el comando pip en la terminal: `pip install Django`\n\n2. Crear un proyecto Django: Una vez que se ha instalado Django, se puede crear un nuevo proyecto ejecutando el siguiente comando en la terminal: `django-admin startproject crm`\n\n3. Crear una aplicación de Django: Crear una aplicación dentro del proyecto Django con el siguiente comando en la terminal: `python manage.py startapp cliente`\n\n4. Crear modelos de base de datos: En el archivo `models.py`, se pueden definir los modelos de datos que se van a utilizar para los clientes. Por ejemplo, se podría crear un modelo para representar a un cliente con los siguientes campos: nombre, apellido, correo electrónico y teléfono.\n\n5. Crear vistas: Las vistas en Django son las funciones que procesan las solicitudes HTTP y devuelven una respuesta. En el archivo `views.py`, se pueden crear funciones que rendericen plantillas HTML para mostrar la información de los clientes, o para modificar la información existente.\n\n6. Crear URLs: En el archivo `urls.py` se pueden definir las URLs que corresponden a diferentes vistas. Por ejemplo, se podría crear una URL para mostrar la lista de clientes, otra para crear un nuevo cliente y otra para editar la información de un cliente existente.\n\n7. Crear las plantillas HTML: Para renderizar las vistas, se deben crear plantillas HTML que contengan los elementos necesarios para mostrar la información del cliente.\n\nUna vez que se han seguido estos pasos, se puede ejecutar el servidor de prueba de Django con `python manage.py runserver`, y se puede acceder al CRM en un navegador web.', 29, 417, 446, 'code', NULL, NULL, NULL, '2023-06-16 20:41:28', '2023-06-16 20:41:28', NULL),
(199, 1, NULL, 15, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-z3zki', '¡Descubre Ingrid Sharpe, lo que necesitas para destacar en tu día a día! Con Natus excepturi dolo, nuestra fórmula de calidad, podrás concretar tus objetivos de manera sencilla y eficaz. Todos tenemos el potencial para alcanzar nuestras metas, ¡y con Ingrid Sharpe lo lograrás! Haz clic ahora mismo y obtén la herramienta perfecta para impulsar tu vida. #IngridSharpe #PotencialSinLímites', 64, 109, 173, 'content', NULL, NULL, NULL, '2023-06-16 20:44:47', '2023-06-16 20:44:47', NULL),
(200, 2, NULL, 15, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-qip57', 'Are you craving delicious and savory street food? Look no further! Our food truck has got you covered with the best food around. From mouthwatering burgers to flavorful tacos, we\'ve got something for everyone. Don\'t settle for boring fast food joints - come to our truck and experience a culinary adventure! Follow us today for updates on locations and specials. You won\'t regret it! #BestFoodTruck #FoodieHeaven #SatisfyYourCravings', 62, 111, 156, 'content', NULL, NULL, NULL, '2023-06-16 20:47:52', '2023-06-16 20:48:05', NULL),
(201, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'node.js', 'nodejs-xjhrd', 'Unfortunately, there is no official WhatsApp API that allows developers to connect directly to their server and send messages. WhatsApp has strict policies against automated or bulk messaging and does not offer any public API for developers to connect with.\n\nHowever, there are third-party APIs and libraries available for node.js that can be used to send messages through WhatsApp. One such library is the `whatsapp-web.js` library, which allows programmatic access to the WhatsApp web client interface.\n\nHere is a sample script that uses the `whatsapp-web.js` library to connect to the WhatsApp web client:\n\n```\nconst { Client } = require(\'whatsapp-web.js\');\nconst qrcode = require(\'qrcode-terminal\');\n\nconst client = new Client();\n\nclient.on(\'qr\', (qr) => {\n    qrcode.generate(qr, { small: true });\n});\n\nclient.on(\'ready\', () => {\n    console.log(\'Client is ready!\');\n});\n\nclient.initialize();\n```\n\nWhen you run this script, it will display a QR code in the console. You can scan the QR code using the WhatsApp mobile app on your phone to establish the connection between the node.js script and the WhatsApp web client. Once the connection is established, you can use the `whatsapp-web.js` library to send messages, create groups, etc.', 33, 260, 293, 'code', NULL, NULL, NULL, '2023-06-16 21:27:46', '2023-06-16 21:27:46', NULL),
(202, 2, NULL, 23, NULL, 'gpt-3.5-turbo', 'tags', 'untitled-project-2023-06-16-zrbmj', '1. perros gigantes<br>2. razas de perros grandes<br>3. animales más grandes del mundo<br>4. perros de raza semanal<br>5. perros de caza<br>6. perros domesticados<br>7. perros simpáticos<br>8. mascotas gigantes<br>9. perros populares<br>10. animales impactantes', 47, 78, 125, 'content', NULL, NULL, NULL, '2023-06-16 21:57:46', '2023-06-16 21:59:06', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(203, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'ihb', 'ihb-5pf7j', 'Sure, here\'s how you can create a basic calculator using Laravel:\n\nStep 1: Install Laravel on your system by following the installation guide given on the Laravel official website.\n\nStep 2: Open your terminal and navigate to the Laravel project directory. Run the following command to create a new controller:\n\n```\nphp artisan make:controller CalculatorController\n```\n\nStep 3: Open the `CalculatorController.php` file in the `app/Http/Controllers` directory and define the `index()` and `calculate()` methods as shown below:\n\n```\n<?php\n\nnamespace App\\Http\\Controllers;\n\nuse Illuminate\\Http\\Request;\n\nclass CalculatorController extends Controller\n{\n    public function index()\n    {\n        return view(\'calculator\');\n    }\n\n    public function calculate(Request $request)\n    {\n        $operand1 = $request->operand1;\n        $operand2 = $request->operand2;\n        $operator = $request->operator;\n\n        switch ($operator) {\n            case \'+\':\n                $result = $operand1 + $operand2;\n                break;\n            case \'-\':\n                $result = $operand1 - $operand2;\n                break;\n            case \'*\':\n                $result = $operand1 * $operand2;\n                break;\n            case \'/\':\n                $result = $operand1 / $operand2;\n                break;\n            default:\n                $result = \"\";\n        }\n\n        return view(\'calculator\', [\'result\' => $result]);\n    }\n}\n```\n\nStep 4: Create a view file `calculator.blade.php` in the `resources/views` directory and add the following code to it:\n\n```\n<!DOCTYPE html>\n<html>\n<head>\n    <title>Calculator</title>\n</head>\n<body>\n    <form method=\"POST\" action=\"{{route(\'calculate\')}}\">\n        @csrf\n        <label for=\"operand1\">Operand 1:</label>\n        <input type=\"number\" name=\"operand1\"><br><br>\n\n        <label for=\"operand2\">Operand 2:</label>\n        <input type=\"number\" name=\"operand2\"><br><br>\n\n        <label for=\"operator\">Operator:</label>\n        <select name=\"operator\">\n            <option value=\"+\">+</option>\n            <option value=\"-\">-</option>\n            <option value=\"*\">*</option>\n            <option value=\"/\">/</option>\n        </select><br><br>\n\n        <input type=\"submit\" value=\"Calculate\">\n    </form>\n\n    @if(isset($result))\n        <h2>Result: {{$result}}</h2>\n    @endif\n</body>\n</html>\n```\n\nStep 5: Define a route for the `CalculatorController` by adding the following code to `routes/web.php`:\n\n```\nRoute::get(\'/\', \'CalculatorController@index\');\nRoute::post(\'/calculate\', \'CalculatorController@calculate\')->name(\'calculate\');\n```\n\nStep 6: Run the Laravel development server using the following command:\n\n```\nphp artisan serve\n```\n\nStep 7: Open your browser and navigate to `http://127.0.0.1:8000/`. You should now be able to see a basic calculator UI. Enter the numbers and the operator, and click on the \"Calculate\" button to get the result.\n\nThat\'s it! You have successfully created a basic calculator using Laravel.', 28, 682, 710, 'code', NULL, NULL, NULL, '2023-06-16 22:14:38', '2023-06-16 22:14:38', NULL),
(204, 2, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-2xspz', 'The United Kingdom offers a wide range of cuisines from different cultures, which means there is something for everyone to try. Whether you are a local or a tourist, the UK has some of the best restaurants that you should consider visiting.<br/><br/>One cuisine that has become a favorite for many is Indian cuisine, and the UK has some of the finest restaurants that are experts in this field. One such restaurant is Briiani, which has two restaurants; one in Manchester and the other in Macclesfield. The Manchester location has been recognized for serving the best Indian food in the city. The restaurant offers a wide range of Indian dishes, including meat, vegetarian, and vegan options, to cater to everyone\'s preferences.<br/><br/>Another Indian restaurant that is worth trying is Tandori, located in London. This restaurant is known for its unique and authentic Indian dishes that are prepared using the finest ingredients. The restaurant offers a wide range of options, from delicious curries to mouth-watering kebabs. The service at Tandori is exceptional, with a warm and friendly atmosphere that is perfect for intimate gatherings or family gatherings.<br/><br/>If you are looking for a restaurant that specializes in British cuisine, then the River Cafe in Hammersmith should be at the top of', 54, 250, 307, 'content', NULL, NULL, NULL, '2023-06-16 22:20:45', '2023-06-16 22:22:00', NULL),
(205, 2, NULL, 7, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-hpeoy', 'In this blog post, the writer delves into the topic of mental health in remote working environments. They provide tips and suggestions on how one can take care of themselves in such settings. The tone of the post is friendly and aims to provide guidance to those struggling to maintain their well-being while working remotely. Whether it\'s establishing a routine, incorporating physical activity into one\'s day, or setting boundaries, the writer emphasizes the importance of prioritizing one\'s mental health in this new work culture.', 58, 98, 156, 'content', NULL, NULL, NULL, '2023-06-16 22:22:06', '2023-06-16 22:22:06', NULL),
(206, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-lbyqp', '\"Streamline Your Business with Our User-Friendly Invoice and CRM System\"', 42, 15, 57, 'content', NULL, NULL, NULL, '2023-06-16 23:10:00', '2023-06-16 23:10:00', NULL),
(207, 2, NULL, 29, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-v1pqn', 'Looking for an efficient and user-friendly invoice and CRM system? Look no further! Our website offers a comprehensive solution that simplifies your administrative tasks. Try it out today and streamline your workflow with ease!', 45, 40, 85, 'content', NULL, NULL, NULL, '2023-06-16 23:10:34', '2023-06-16 23:10:34', NULL),
(208, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'online calculator', 'online-calculator-acohb', 'Here\'s a simple online calculator coded in Python. It takes two input values from the user and then performs either addition, subtraction, multiplication, or division based on the user\'s input.\n\n```\nnum1 = float(input(\"Enter first number: \"))\nnum2 = float(input(\"Enter second number: \"))\n\nprint(\"Select an operation.\")\nprint(\"+ for addition\")\nprint(\"- for subtraction\")\nprint(\"* for multiplication\")\nprint(\"/ for division\")\n\nchoice = input(\"Enter operation: \")\n\nif choice == \'+\':\n    print(num1, \"+\", num2, \"=\", num1 + num2)\nelif choice == \'-\':\n    print(num1, \"-\", num2, \"=\", num1 - num2)\nelif choice == \'*\':\n    print(num1, \"*\", num2, \"=\", num1 * num2)\nelif choice == \'/\':\n    print(num1, \"/\", num2, \"=\", num1 / num2)\nelse:\n    print(\"Invalid input. Please enter +, -, *, or /\")\n```\n\nSimply copy and paste this into a Python IDE or run it in a command-line Python prompt to try it out.', 24, 223, 247, 'code', NULL, NULL, NULL, '2023-06-16 23:47:20', '2023-06-16 23:47:20', NULL),
(209, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'online calculator', 'online-calculator-kcil7', 'Here is a basic HTML code for an online calculator:\n\n```\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n	<meta charset=\"UTF-8\">\n	<title>Online Calculator</title>\n</head>\n<body>\n	<h1>Online Calculator</h1>\n	<form name=\"calculator\">\n		<input type=\"text\" name=\"result\" placeholder=\"0\">\n		<br><br>\n		<input type=\"button\" value=\"1\" onclick=\"calculator.result.value += \'1\'\">\n		<input type=\"button\" value=\"2\" onclick=\"calculator.result.value += \'2\'\">\n		<input type=\"button\" value=\"3\" onclick=\"calculator.result.value += \'3\'\">\n		<input type=\"button\" value=\"+\" onclick=\"calculator.result.value += \'+\'\">\n		<br>\n		<input type=\"button\" value=\"4\" onclick=\"calculator.result.value += \'4\'\">\n		<input type=\"button\" value=\"5\" onclick=\"calculator.result.value += \'5\'\">\n		<input type=\"button\" value=\"6\" onclick=\"calculator.result.value += \'6\'\">\n		<input type=\"button\" value=\"-\" onclick=\"calculator.result.value += \'-\'\">\n		<br>\n		<input type=\"button\" value=\"7\" onclick=\"calculator.result.value += \'7\'\">\n		<input type=\"button\" value=\"8\" onclick=\"calculator.result.value += \'8\'\">\n		<input type=\"button\" value=\"9\" onclick=\"calculator.result.value += \'9\'\">\n		<input type=\"button\" value=\"*\" onclick=\"calculator.result.value += \'*\'\">\n		<br>\n		<input type=\"button\" value=\"C\" onclick=\"calculator.result.value = \'\'\">\n		<input type=\"button\" value=\"0\" onclick=\"calculator.result.value += \'0\'\">\n		<input type=\"button\" value=\"=\" onclick=\"calculator.result.value = eval(calculator.result.value)\">\n		<input type=\"button\" value=\"/\" onclick=\"calculator.result.value += \'/\'\">\n	</form>\n</body>\n</html>\n```\n\nThis calculator uses basic HTML form elements and JavaScript for the calculations. Users can enter numbers and perform basic arithmetic operations like addition, subtraction, multiplication, and division. The \"C\" button clears the result field and the \"=\" button evaluates the expression in the result field.', 25, 481, 506, 'code', NULL, NULL, NULL, '2023-06-16 23:48:17', '2023-06-16 23:48:17', NULL),
(210, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'online calculator', 'online-calculator-y5utu', 'Sure, here\'s an example code for a basic online calculator in HTML:\n\n```\n<!DOCTYPE html>\n<html>\n<head>\n	<title>Online Calculator</title>\n</head>\n<body>\n	<h1>Online Calculator</h1>\n	<form>\n		<input type=\"text\" name=\"output\" id=\"output\" readonly>\n		<table>\n			<tr>\n				<td><button type=\"button\" onclick=\"append(\'7\')\">7</button></td>\n				<td><button type=\"button\" onclick=\"append(\'8\')\">8</button></td>\n				<td><button type=\"button\" onclick=\"append(\'9\')\">9</button></td>\n				<td><button type=\"button\" onclick=\"append(\'/\')\">/</button></td>\n			</tr>\n			<tr>\n				<td><button type=\"button\" onclick=\"append(\'4\')\">4</button></td>\n				<td><button type=\"button\" onclick=\"append(\'5\')\">5</button></td>\n				<td><button type=\"button\" onclick=\"append(\'6\')\">6</button></td>\n				<td><button type=\"button\" onclick=\"append(\'*\')\">*</button></td>\n			</tr>\n			<tr>\n				<td><button type=\"button\" onclick=\"append(\'1\')\">1</button></td>\n				<td><button type=\"button\" onclick=\"append(\'2\')\">2</button></td>\n				<td><button type=\"button\" onclick=\"append(\'3\')\">3</button></td>\n				<td><button type=\"button\" onclick=\"append(\'-\')\">-</button></td>\n			</tr>\n			<tr>\n				<td><button type=\"button\" onclick=\"append(\'.\')\">.</button></td>\n				<td><button type=\"button\" onclick=\"append(\'0\')\">0</button></td>\n				<td><button type=\"button\" onclick=\"evaluate()\">=</button></td>\n				<td><button type=\"button\" onclick=\"append(\'+\')\">+</button></td>\n			</tr>\n			<tr>\n				<td><button type=\"button\" onclick=\"clearOutput()\">C</button></td>\n			</tr>\n		</table>\n	</form>\n\n	<script type=\"text/javascript\">\n		function append(value) {\n			document.getElementById(\'output\').value += value;\n		}\n\n		function clearOutput() {\n			document.getElementById(\'output\').value = \'\';\n		}\n\n		function evaluate() {\n			var result = eval(document.getElementById(\'output\').value);\n\n			document.getElementById(\'output\').value = result;\n		}\n	</script>\n</body>\n</html>\n```\n\nThis code creates a calculator interface with a text input field and number buttons, plus symbols for operators. The JavaScript code listens for button clicks and updates the input field accordingly. When the \"=\" button is clicked, the input field is evaluated using JavaScript\'s built-in \"eval\" function.', 25, 613, 638, 'code', NULL, NULL, NULL, '2023-06-16 23:48:23', '2023-06-16 23:48:23', NULL),
(211, 2, NULL, 39, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-cvu3d', '1. VidPro<br/>2. PlayVIP<br/>3. BlogFix<br/>4. FoxVid<br/>5. PlayBloger<br/>6. VIPFix<br/>7. BlogPlay<br/>8. VidFox<br/>9. FixBloger<br/>10. VIPBlog', 48, 54, 104, 'content', NULL, NULL, NULL, '2023-06-17 00:05:04', '2023-06-17 00:07:00', NULL),
(212, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'golang code webserver', 'golang-code-webserver-lxoj2', 'Here is a sample code in Golang that can serve HTML files from a folder:\n```go\npackage main\n\nimport (\n    \"net/http\"\n)\n\nfunc main() {\n    // Set the folder path to serve HTML files from\n    fileServer := http.FileServer(http.Dir(\"path/to/folder\"))\n\n    // Create a handler function to serve HTML files\n    http.HandleFunc(\"/\", func(w http.ResponseWriter, r *http.Request) {\n        // Set the content type to HTML\n        w.Header().Set(\"Content-Type\", \"text/html\")\n\n        // Serve the HTML file by passing the request to the file server\n        fileServer.ServeHTTP(w, r)\n    })\n\n    // Start the server on port 8080\n    http.ListenAndServe(\":8080\", nil)\n}\n```\nReplace \"path/to/folder\" with the actual path to the folder containing your HTML files. Save the file with a `.go` extension and run `go build` and `./filename` to start serving your HTML files on `http://localhost:8080`.', 35, 214, 249, 'code', NULL, NULL, NULL, '2023-06-17 00:05:15', '2023-06-17 00:05:15', NULL),
(213, 1, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-cbk0x', 'Hey guys! Today I’m super excited to share my latest project with you. I’ve been working on something pretty cool and I think you’re going to love it!<br/><br/>So, if you’ve ever wanted to make money on YouTube, then you’re going to want to pay attention. I’ve created an AI-powered system that offers a new and unique way to boost your video engagement and ultimately, your revenue.<br/><br/>By using state-of-the-art artificial intelligence algorithms, I’ve created a tool that analyses your videos and helps you tailor your content to your target audience. So, say goodbye to guesswork and hello to bigger and better results!<br/><br/>And the best part? It’s super easy to use. All you have to do is sign up, upload your videos, and let the AI do the rest. It’s that simple!<br/><br/>So, gone are the days of struggling to get your content noticed on YouTube. With my new AI-powered system, you can start making money on YouTube in no time. Trust me, you won’t regret giving it a try.<br/><br/>Thanks for watching guys, and I’ll catch you in the next one!', 55, 226, 281, 'content', NULL, NULL, NULL, '2023-06-17 00:21:57', '2023-06-17 00:21:57', NULL),
(214, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-qfmxc', 'Best AI Tools for Bloggers<br/><br/>Summary:<br/>Artificial intelligence (AI) tools can assist bloggers in automating their work and maximizing their productivity. In this digital era, AI tools not only provide great help to streamline the blogging process, but also saves time and effort. Therefore, it\'s important for bloggers to understand the best AI tools available to them. Here\'s a rundown of the ten best AI tools for bloggers.<br/><br/>Introduction:<br/>Blogging has become an essential part of the online world for advertisers, entrepreneurs, and writers. Blogging requires significant time and exertion, which can be a bit challenging for writers. Artificial Intelligence (AI) tools have made life easier for writers by automating repetitive tasks. Choosing the right AI tool for your blog allows you to optimize your time and produce high-quality content. Let\'s dive into the ten best AI tools for bloggers.<br/><br/>1. Grammarly:<br/>Writing impeccable content is crucial for bloggers. Grammarly AI tool helps in detecting spelling and grammatical errors, making it an essential tool for blog writers.<br/><br/>2. Google Analytics:<br/>Understanding your blog\'s analytics is important for enhancing your search engine optimization (SEO). Google Analytics provides critical information such as the number of visitors, source of traffic, and page views.<br/><br/>3. Google Trends:<br/>Google Trends helps in finding the most popular and searched topics based on various categories.<br/><br/>4. Yoast SEO:<br/>Yoast SEO plugin gives bloggers an SEO score for their content, telling them how well optimized their blog post is.<br/><br/>5. Hemingway Editor:<br/>Hemingway Editor helps in improving the readability of the content, making it more engaging for the readers.<br/><br/>6. HubSpot\'s Blog Ideas Generator:<br/>Running out of ideas for blog topics? HubSpot\'s blog ideas generator provides ideas based on relevant keywords or topics.<br/><br/>7. AnswerThePublic:<br/>AnswerThePublic AI tool helps in finding the audience\'s questions based on keywords, allowing bloggers to create topics relevant to their audience.<br/><br/>8. Hootsuite:<br/>Promoting your blog on social media platforms can be a bit time-consuming. Hootsuite automates the social media scheduling process for your blogs.<br/><br/>9. CoSchedule:<br/>CoSchedule is a marketing calendar that helps bloggers to organize their social media, content, and upcoming promotional campaigns.<br/><br/>10. Canva:<br/>Visual content is necessary to make your blogs more appealing to readers. Canva is an AI tool that allows bloggers to create high-quality graphics for their blog posts without any graphic design skills.<br/><br/>Conclusion:<br/>AI tools enhance the productivity of bloggers by automating repetitive tasks and proper optimization of content. By using AI tools, bloggers can optimize their time and efforts into creating high-quality content. Incorporating these ten AI tools mentioned in the article will make your blogging journey a lot easier and efficient.', 57, 554, 611, 'content', NULL, NULL, NULL, '2023-06-17 00:31:07', '2023-06-17 00:31:07', NULL),
(215, 2, NULL, 3, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-s6o6h', '1. \"Taste the Flavors of Lithuania: Our Top Restaurant Picks\"<br/>2. \"Feed Your Wanderlust with These Must-Try Restaurants in Lithuania\"<br/>3. \"Indulge in the Best Cuisine Lithuania Has to Offer\"<br/>4. \"From Traditional Fare to Modern Cuisine: The Best Restaurants in Lithuania\"<br/>5. \"Satisfy Your Hunger with These Incredible Lithuanian Restaurants\"<br/>6. \"Explore the Culinary Delights of Lithuania with These Top Restaurants\"<br/>7. \"Dine Like a Local: Where to Find the Best Food in Lithuania\"<br/>8. \"Discover Lithuania\'s Hidden Gems: The Top Restaurants You Need to Try\"<br/>9. \"Foodie\'s Paradise: The Best Restaurants in Lithuania\"<br/>10. \"Experience Lithuanian Culture through These Fantastic Restaurants\".', 43, 157, 200, 'content', NULL, NULL, NULL, '2023-06-17 00:55:28', '2023-06-17 00:55:28', NULL),
(216, 2, NULL, 18, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-v4uxg', 'Hello everyone! Are you ready to celebrate the arrival of the new year? Join us for an incredible night of fun, laughter and unforgettable memories at our incredible event aptly titled \"New Year\"! The countdown to 2022 is on, so gear up to witness a thrilling, once-in-a-lifetime celebration!<br/><br/>If you\'re looking to begin the new year in style, we\'ve got you covered! Our party\'s got it all, from live music to delicious food and drinks, to exciting activities, there\'s something for everyone. It\'s the perfect opportunity to dress up and hit the dance floor, surrounded by your friends and loved ones.<br/><br/>Bid adieu to the year gone by and usher in the new year with a bang! Come make the most out of the final hours of 2021 and cherish the first moments of 2022 with us. We assure you that our party will be the perfect way to kick-off the new year!<br/><br/>So what are you waiting for? Mark your calendars and dust off your dancing shoes. We promise to make it a night to remember. Book your tickets today and join us for an unforgettable celebration – the \"New Year\" event! Happy New Year everyone!', 49, 242, 291, 'content', NULL, NULL, NULL, '2023-06-17 00:57:10', '2023-06-17 00:57:10', NULL),
(217, 2, NULL, 3, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-9kofp', '1. ¡Lleva tus estrategias de marketing al siguiente nivel con nuestro servicio de whatsapp masivo! <br>2. ¿Quieres aumentar tus ventas? ¡Te ofrecemos el servicio de whatsapp masivo perfecto para lograrlo! <br>3. ¡La solución perfecta para tus campañas de publicidad: nuestro servicio de whatsapp masivo! <br>4. ¡Llegó el momento de ampliar tus horizontes! Conoce nuestro servicio de whatsapp masivo. <br>5. ¡Impulsa tu negocio con nuestro servicio de whatsapp masivo! <br>6. ¡No esperes más para mejorar tus estrategias! Nuestro servicio de whatsapp masivo es la clave. <br>7. ¡Aprovecha esta oportunidad única para potenciar tu marca! Descubre nuestro servicio de whatsapp masivo. <br>8. ¡Haz que tu negocio destaque con nuestro servicio de whatsapp masivo! <br>9. ¡Tu camino al éxito comienza con nuestro servicio de whatsapp masivo! <br>10. ¡Sé parte de la revolución digital con nuestro servicio de whatsapp masivo!', 45, 193, 274, 'content', NULL, NULL, NULL, '2023-06-17 01:06:32', '2023-06-17 01:07:18', NULL),
(218, 2, 10, NULL, NULL, 'gpt-3.5-turbo', 'javascript', 'javascript-cucoo', 'Aquí te dejo una posible función en JavaScript para hacer un navbar responsive:\n\n```javascript\nfunction toggleNavbar() {\n   const navbar = document.getElementById(\"navbar\");\n   if (navbar.className === \"navbar\") {\n      navbar.className += \" responsive\";\n   } else {\n      navbar.className = \"navbar\";\n   }\n}\n```\n\nEsta función usa la propiedad `className` del elemento `navbar` para cambiar entre su clase original `\"navbar\"` y la clase `\"navbar responsive\"`. La clase `\"responsive\"` debería contener las reglas CSS necesarias para hacer el navbar responsive, como por ejemplo:\n\n```CSS\n@media screen and (max-width: 600px) {\n   .navbar a:not(:first-child) {\n      display: none;\n   }\n   .navbar a.icon {\n      float: right;\n      display: block;\n   }\n}\n\n.navbar.responsive {\n   position: relative;\n }\n .navbar.responsive a.icon {\n   position: absolute;\n   right: 0;\n   top: 0;\n }\n .navbar.responsive a {\n   float: none;\n   display: block;\n   text-align: left;\n }\n```\n\nEn este ejemplo, el navbar se transformará en un menú desplegable cuando la pantalla sea más pequeña que 600px y se agregará un botón con clase `\"icon\"`. Al hacer clic en el botón, se activará la función `toggleNavbar()` para mostrar y ocultar los elementos del navbar.\n\nEs importante mencionar que esta función puede variar dependiendo de la estructura HTML y las reglas CSS que se estén utilizando en tu proyecto.', 32, 333, 365, 'code', NULL, NULL, NULL, '2023-06-17 01:09:04', '2023-06-17 01:11:02', NULL),
(219, 5, NULL, NULL, NULL, 'gpt-3.5-turbo', 'main', 'main-qw9hl', 'Sure, I can help you with that! Here\'s a simple HTML5 game using JavaScript.\n\nHTML5 Code:\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n	<title>Simple Game</title>\n	<style>\n		canvas {\n			border: solid black 1px;\n		}\n	</style>\n</head>\n<body>\n\n	<canvas id=\"myCanvas\" width=\"400\" height=\"400\"></canvas>\n\n	<script src=\"game.js\"></script>\n</body>\n</html>\n```\n\nJavaScript Code:\n\n```javascript\n//Get canvas context\nvar canvas = document.getElementById(\"myCanvas\");\nvar ctx = canvas.getContext(\"2d\");\n\n//Set starting position and speed\nvar x = canvas.width/2;\nvar y = canvas.height-30;\nvar dx = 2;\nvar dy = -2;\n\n//Draw the ball\nfunction drawBall() {\n	ctx.beginPath();\n	ctx.arc(x, y, 10, 0, Math.PI*2);\n	ctx.fillStyle = \"#0095DD\";\n	ctx.fill();\n	ctx.closePath();\n}\n\n//Move the ball and bounce it off the walls\nfunction moveBall() {\n	if(x + dx > canvas.width-10 || x + dx < 10) {\n		dx = -dx;\n	}\n\n	if(y + dy > canvas.height-10 || y + dy < 10) {\n		dy = -dy;\n	}\n\n	x += dx;\n	y += dy;\n}\n\n//Update the canvas\nfunction updateCanvas() {\n	ctx.clearRect(0, 0, canvas.width, canvas.height);\n	drawBall();\n	moveBall();\n}\n\n//Call the update function every 10 milliseconds\nsetInterval(updateCanvas, 10);\n```\n\nThis will create a canvas with a bouncing ball. You can customize the ball\'s appearance and behavior by changing the properties in the `drawBall` and `moveBall` functions. Good luck with your game development!', 28, 385, 413, 'code', NULL, NULL, NULL, '2023-06-17 01:38:24', '2023-06-17 01:38:24', NULL),
(220, 2, NULL, 14, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-0dhzg', '<b>[Output-1]</b><br/>Joyful Jordanian Journeys is a well-known travel company based in Petra, Jordan. Founded 12 years ago by a group of young and highly motivated locals, we are dedicated to providing our clients with an authentic Middle Eastern experience that they will never forget. Our team is committed to offering the best tours that the Kingdom of Jordan has to offer whether you are travelling alone or with a group. <br/><br/>At Joyful Jordanian Journeys, we offer a range of tours that cater to your every travel need. From Adventure tours to In-Depth Cultural tours, Luxury tours to Relaxing tours, we have it all. We even provide tailor-made tours to suit your requirements and needs. Imagine a holiday package crafted by the very people who live and work in the country that you are visiting. <br/><br/>Our team comprises of experienced and highly skilled professionals who are passionate about what they do. With a wealth of knowledge about Jordan\'s history, culture, and natural beauty, we are your perfect travel companions. Our commitment to delivering exceptional services and experiences has earned us a reputation as one of the best travel companies in Jordan.<br/><br/>Choose Joyful Jordanian Journeys today for an unforgettable Middle Eastern travel experience.<br/><br/><br/><b>[Output-2]</b><br/>Welcome to Joyful Jordanian Journeys, the premier provider of authentic and enriching travel experiences in the Kingdom of Jordan. Founded 12 years ago by a group of young and motivated locals, our team is committed to delivering the best tours the country has to offer. Whether traveling solo, with a group, or seeking adventure, we have something for everyone.<br/><br/>Our Adventure Tours are perfect for thrill-seekers, while our In-Depth Cultural Tours offer a deeper understanding of Jordan\'s fascinating history and heritage. If you\'re looking for a touch of luxury, we offer tailored tours to fit your needs. Our Relaxing Tours are ideal for those seeking a tranquil escape.<br/><br/>We pride ourselves on our expertise and firsthand knowledge of the region, enabling us to create holiday packages that cater to your every requirement. With Joyful Jordanian Journeys, you\'ll receive a professional and personalized service that is unmatched in the industry.<br/><br/>Based in Petra, we offer an authentic Middle Eastern experience that showcases the beauty and diversity of Jordan. Join us on an unforgettable journey, and discover the wonders of this fascinating country.<br/><br/><br/><b>[Output-3]</b><br/>Welcome to Joyful Jordanian Journeys, based in the stunning location of Petra! We are a company that was founded 12 years ago by a group of passionate and local individuals. Our goal is to provide our clients with the best tours that the Kingdom of Jordan has to offer, with a focus on delivering an authentic Middle Eastern experience.<br/><br/>We cater to all types of travelers, whether you\'re solo, part of a group, or looking for a specific adventure. Our tours include Adventure Tours, In-Depth Cultural Tours, Luxury Tours, and Relaxing Tours, among others. Whatever your requirements are, we can cater to them and create a package that is tailored to your needs.<br/><br/>Our experienced team of professionals is motivated to deliver the highest level of service and ensure that our clients have an unforgettable experience. Our tours showcase the richness and charm of Jordan, all from the perspective of locals who live and work in this beautiful country.<br/><br/>We pride ourselves on our commitment to providing our clients with an exceptional experience. So why not join us for the adventure of a lifetime? Let Joyful Jordanian Journeys show you around and take you on an unforgettable journey!<br/><br/><br/><b>[Output-4]</b><br/>Looking for a truly authentic Middle Eastern experience in the beautiful Kingdom of Jordan? Look no further than Joyful Jordanian Journeys! Founded 12 years ago by a team of young, local individuals who are passionate about providing their clients with the best tours Jordan has to offer, we offer Adventure Tours, In Depth cultural tours, Luxury Tours, Relaxing Tours, and much more. Whether you\'re a solo traveler or part of a group, we\'ll work with you to create a holiday package that meets your unique needs and requirements. Plus, because we live and work in Jordan, we\'re able to provide unparalleled insight and expertise. So what are you waiting for? Book your dream Jordanian adventure today with Joyful Jordanian Journeys!<br/><br/><br/>', 45, 387, 1002, 'content', NULL, NULL, NULL, '2023-06-17 03:06:14', '2023-06-17 03:07:56', NULL),
(221, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-abqay', '<b>[Output-1]</b><br/>\"Discover Jordan\'s Delightful Destinations with Joyful Journeys\"<br/><br/><br/><b>[Output-2]</b><br/>\"Discover the Wonder of Jordan with Joyful Journeys\"<br/><br/><br/><b>[Output-3]</b><br/>\"Discover the Beauty of Jordan with Joyful Journeys\"<br/><br/><br/><b>[Output-4]</b><br/>\"Exploring Jordan with Joy: Your Guide to Memorable Journeys\"<br/><br/><br/><b>[Output-5]</b><br/>\"Discover Joyful Adventures in Jordan with Our Professional Guided Journeys\"<br/><br/><br/>', 51, 98, 116, 'content', NULL, NULL, NULL, '2023-06-17 03:12:01', '2023-06-17 03:28:19', NULL),
(222, 2, NULL, 29, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-otiat', '\"Discover a new generation social e-commerce network tailored for savvy business professionals in logistics and sales with innovative solutions. Join our community today and take your business to new heights!\"', 57, 44, 115, 'content', NULL, NULL, NULL, '2023-06-17 03:13:09', '2023-06-17 03:19:10', NULL),
(223, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-bvplr', 'Moving can be a stressful and overwhelming experience, especially if you are doing it alone or for the first time. However, finding the best and cheapest movers in Copenhagen can make the process of moving smooth and hassle-free. Here we have rounded up some top-notch movers in Copenhagen that can help you move your belongings effortlessly.<br/><br/>First on our list is \"Copenhagen Movers\". This company is known for its top-quality services and affordable prices. They have a highly trained team of movers who use their expertise to package, transport and unpack your belongings without causing any damage. Additionally, Copenhagen Movers offers a wide range of services that can cater to your specific needs, such as packing, storage, and international relocation.<br/><br/>Another great option is \"Danish Movers\". They have been in the business for over 30 years and have established themselves as one of the most experienced movers in Copenhagen. Danish Movers offer a customizable range of services that fit your budget and requirements. Whether you need a full-service move or a simple transport service, Danish Movers got you covered!<br/><br/>If you are looking for a company that specializes in international moves, then \"Nordic Relocation Group\" is the best option for you. They have a team of professional movers who offer a variety of services, including packing, loading, unloading, and even helping you settle in the new country. Moreover, Nordic Relocation Group provides comprehensive insurance policies that can protect your belongings during the move.<br/><br/>\"Omega Moving\" is another reputable option for finding the best and cheapest movers in Copenhagen. They pride themselves on offering high-quality services at an affordable price. Omega Moving has a team of experts that can handle all aspects of your move, including planning, packing, loading, and unloading.<br/><br/>In conclusion, finding the best and cheapest movers in Copenhagen is all about choosing a reputable and experienced company that understands your needs. The movers mentioned above have a proven track record of providing exceptional services at a reasonable price. Don\'t hesitate to reach out to them for a seamless and stress-free moving experience.', 56, 410, 466, 'content', NULL, NULL, NULL, '2023-06-17 03:14:40', '2023-06-17 03:14:40', NULL),
(224, 2, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-c766z', 'Hi everyone, welcome to my TikTok account where we talk about the latest trends in business and advertising on social media.<br/><br/>Today, we are going to talk about how to effectively use social media platforms for promoting your business through targeted advertising campaigns. <br/><br/>There are many social media platforms out there, but not all of them are created equal when it comes to advertising. Some platforms are more suited to visual content, such as Instagram and TikTok, while others are better for text-based content like Twitter and LinkedIn. <br/><br/>You need to identify which social media platform your target audience spends most of their time on and create advertising content that resonates with them. This will increase the chances of your ads being seen and acted upon by your target audience.<br/><br/>When creating ad content, stay true to your brand\'s voice and message. Ensure your ad content aligns with the values and tone of your brand to create consistency across all your marketing channels.<br/><br/>Lastly, analyze your ad performance regularly to make necessary adjustments and optimize your campaigns for maximum results.<br/><br/>Thanks for tuning in to today’s video, share your thoughts and experiences with me in the comments below. Don\'t forget to follow me for more insights into business and advertising on social media.', 57, 242, 299, 'content', NULL, NULL, NULL, '2023-06-17 03:20:36', '2023-06-17 03:20:36', NULL),
(225, 2, NULL, 61, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-mfumm', 'As I embarked on my journey in sales, I decided to start an online store. It was not an easy task, but I had the motivation and drive to achieve my dreams. I spent countless hours researching the industry, analyzing the market trends and calculating my finances to ensure my success. <br/><br/>Once I launched my online store, it was a challenging phase. I faced many obstacles and challenges along the way. But instead of losing hope, I took them as opportunities to learn and grow. I made timely changes to my business model and product offerings to attract more customers and increase sales. <br/><br/>Through my hard work and dedication, my online store started gaining popularity. More and more people started visiting my website, and my sales started surging. Word of mouth recommendations spread fast, and my online store became one of the top destinations for customers looking for quality products at an affordable price. <br/><br/>I continued to innovate and expand my business. I added new products, improved my website, and introduced new features to enhance the shopping experience of my customers. I focused on providing excellent customer service, which became my hallmark. <br/><br/>My efforts gradually paid off, and my online store became a thriving business. Today, it gives me immense satisfaction to see how far I have come from where I started. My online store is now a successful enterprise, and I am proud of what I have created.', 64, 262, 338, 'content', NULL, NULL, NULL, '2023-06-17 03:22:33', '2023-06-17 03:23:27', NULL),
(226, 2, NULL, 62, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-qtr4w', 'Starting an online store can be daunting, but for one determined entrepreneur, it was the start of a successful venture. Let\'s call her Sarah.<br/><br/>Sarah had always been a creative person, with a passion for handmade crafts and unique products. She often found herself browsing online marketplaces in search of the perfect gift or accessory, and soon realized that she could turn her own talents into a business.<br/><br/>With little experience in online marketing or e-commerce, Sarah began researching and learning all she could about the industry. She poured countless hours into designing her own website, creating product listings, and building a social media presence.<br/><br/>It wasn\'t easy - Sarah faced challenges like finding reliable suppliers and managing inventory, but she persisted.<br/><br/>Slowly but surely, the orders started coming in. Customers praised Sarah\'s craftsmanship and the uniqueness of her products. Through word-of-mouth and positive reviews, she started gaining a loyal following.<br/><br/>As her business grew, Sarah expanded her offerings and invested in targeted advertising. She was able to quit her day job and focus entirely on her online store.<br/><br/>Today, Sarah\'s business is thriving. She has a team of employees and a network of suppliers, and her products are sold all over the world. She never imagined that her passion for crafting would lead', 50, 250, 300, 'content', NULL, NULL, NULL, '2023-06-17 03:26:03', '2023-06-17 03:26:03', NULL),
(227, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-cixpl', '<b>[Output-1]</b><br/>\"Discover the Best of Jordan with Tourist Jordan Tours: Group, Private, and Daily Tours and Packages Available\"<br/><br/><br/><b>[Output-2]</b><br/>\"Discover Jordan with Tourist Jordan Tours: Your Guide to Unique Group and Private Tours\"<br/><br/><br/><b>[Output-3]</b><br/>\"Discover the Wonders of Jordan with Tourist Jordan Tours\"<br/><br/><br/><b>[Output-4]</b><br/>\"Discover Jordan with Tourist Jordan Tours: Your Guide to Unforgettable Travel Experiences\"<br/><br/><br/><b>[Output-5]</b><br/>\"Discover Jordan with Tourist Jordan Tours: Professional Group, Daily, Private Tours and Activities\"<br/><br/><br/>', 53, 74, 156, 'content', NULL, NULL, NULL, '2023-06-17 03:30:33', '2023-06-17 03:44:37', NULL),
(228, 2, NULL, 35, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-hfuuk', '<b>[Output-1]</b><br/>1. Stonehaven Retreat<br/>2. Shadow Mountain Hideaway<br/>3. Echo Ridge Estates<br/>4. Obsidian Oasis<br/>5. Cavernous Canyon<br/>6. Terra Cotta Trail<br/>7. Mystic Mine Manor<br/>8. Whispering Winds Hollow<br/>9. Slate Springs Sanctuary<br/>10. Granite Grotto Gardens.<br/><br/><br/><b>[Output-2]</b><br/>1. Stone Hollow<br/>2. Limestone Lair<br/>3. Mineral Mansion<br/>4. Cave Dweller\'s Estate<br/>5. Rocky Retreat<br/>6. Bedrock Burrow<br/>7. Crystal Cavern Abode<br/>8. Fossil Fortress<br/>9. Geode Grotto<br/>10. Pebble Palace<br/><br/><br/><b>[Output-3]</b><br/>1. Cave Master<br/>2. Petra Kingdom<br/>3. Stone Sage<br/>4. Ancient Abode<br/>5. Rocky Retreat<br/>6. Natural Nook<br/>7. Subterranean Sanctuary<br/>8. Stonehaven<br/>9. Rocky Lodge<br/>10. Cavern Corridor.<br/><br/><br/><b>[Output-4]</b><br/>1. Cave\'s Sonar<br/>2. Stalactite Sonix <br/>3. Geolight <br/>4. CavernTone <br/>5. Subterranean Sound <br/>6. SpeleoSound <br/>7. CrystalEcho <br/>8. FossilFidelity <br/>9. Underground Utopia <br/>10. MineralMelody<br/><br/><br/><b>[Output-5]</b><br/>1. CaveWhisperer<br/>2. PetraEcho<br/>3. StoneDweller<br/>4. UndergroundHeir<br/>5. CaveClaimer<br/>6. RockExplorer<br/>7. SubterraneanSearcher<br/>8. CavernChild<br/>9. MineralMystic<br/>10. RockyReveler<br/><br/><br/>', 64, 365, 354, 'content', NULL, NULL, NULL, '2023-06-17 03:45:49', '2023-06-17 03:50:02', NULL),
(229, 2, NULL, 27, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-16', 'untitled-project-2023-06-16-e2fku', '<b>[Output-1]</b><br/>\"Explore the Wonders of Jordan with Petra Caves Son Tours - Your Ultimate Vacation Package Solution\"<br/><br/><br/><b>[Output-2]</b><br/>\"Experience Jordan\'s Wonders with Petra Cave Son Tours\"<br/><br/><br/><b>[Output-3]</b><br/>\"Embark on Joyful Jordanian Journeys with Petra Caves Son Tours: Your Professional Guide to Jordan Tours and Vacation Packages\"<br/><br/><br/><b>[Output-4]</b><br/>\"Discover the Beauty of Jordan with Petra Caves Son Tours: Your Joyful Journey Begins Here!\"<br/><br/><br/><b>[Output-5]</b><br/>\"Discover Jordan\'s Hidden Wonders with Petra Caves Son Tours - Your Ultimate Travel Companion\"<br/><br/><br/>', 59, 110, 157, 'content', NULL, NULL, NULL, '2023-06-17 03:56:41', '2023-06-17 03:57:53', NULL),
(230, 2, 10, 6, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-vdg2h', '<b>[Output-1]</b><br/>1. Jordan travel <br/>2. Jordan tourism <br/>3. Middle East travel <br/>4. Exploring Jordan <br/>5. Jordan attractions <br/>6. Cultural travel <br/>7. Historical sites in Jordan <br/>8. Adventure travel in Jordan <br/>9. Jordanian cuisine <br/>10. Luxury travel in Jordan <br/>11. Ancient architecture in Jordan <br/>12. Jordanian hospitality <br/>13. Jordanian culture <br/>14. Jordanian landscapes <br/>15. Petra tours <br/>16. Wadi Rum desert <br/>17. Jordanian history <br/>18. Amman city guide <br/>19. Jordanian traditions <br/>20. Jordanian souvenirs<br/><br/><br/><b>[Output-2]</b><br/>1. Jordan travel <br/>2. Middle East vacation <br/>3. Explore Jordan <br/>4. Historical sites in Jordan <br/>5. Jordan tourism <br/>6. Jordanian culture <br/>7. Things to do in Jordan <br/>8. Travel tips for Jordan <br/>9. Must-see destinations in Jordan <br/>10. Jordanian cuisine <br/>11. Solo travel to Jordan <br/>12. Adventure activities in Jordan <br/>13. Luxury travel in Jordan <br/>14. Jordanian hospitality <br/>15. Discover Jordan.<br/><br/><br/><b>[Output-3]</b><br/>1. Jordan travel guide<br/>2. Exploring Jordan<br/>3. Top tourist attractions in Jordan<br/>4. Authentic experiences in Jordan<br/>5. Jordanian culture and traditions<br/>6. The best time to visit Jordan<br/>7. Jordanian cuisine and food culture<br/>8. Luxury travel in Jordan<br/>9. Budget travel in Jordan<br/>10. Adventure activities in Jordan.<br/><br/><br/><b>[Output-4]</b><br/>1. Jordan <br/>2. Travel <br/>3. Tourism <br/>4. Middle East <br/>5. Adventure <br/>6. Culture <br/>7. History <br/>8. Heritage <br/>9. Architecture <br/>10. Wonders of the world <br/>11. Red Sea <br/>12. Petra <br/>13. Dead Sea <br/>14. Amman <br/>15. Jerash <br/>16. Wadi Rum <br/>17. Desert <br/>18. Explore <br/>19. Vacation <br/>20. Landmarks<br/><br/><br/><b>[Output-5]</b><br/>1. Jordan travel guide <br/>2. Discover Jordan <br/>3. Exploring Jordan <br/>4. Jordan tourism <br/>5. Jordanian culture <br/>6. Middle East travel <br/>7. Petra <br/>8. Dead Sea <br/>9. Amman city <br/>10. Wadi Rum <br/>11. Jordan adventure <br/>12. Group tours in Jordan <br/>13. Luxury travel in Jordan <br/>14. Jordan history <br/>15. Best time to visit Jordan.<br/><br/><br/>', 40, 319, 507, 'content', NULL, NULL, NULL, '2023-06-17 04:04:53', '2023-06-17 04:10:06', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(231, 2, NULL, 62, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-mly8q', '<b>[Output-1]</b><br/>From living in a cave in Petra to running a successful start-up, my journey has been nothing short of remarkable. The ancient city provided me with a unique perspective on life and the importance of living simply. After years of living in the cave, I knew that it was time for a change. With an entrepreneurial spirit and the drive to succeed, I decided to start my own business.<br/><br/>I started by creating a walled terrace with a garden of flowering shrubs outside the cave, where I welcomed visitors for tea. It was a simple idea, but it quickly gained popularity among tourists and locals alike. The garden provided a peaceful oasis in the desert, and people were eager to take a break from the hustle and bustle of daily life.<br/><br/>Over time, I expanded the business, offering homemade goods and souvenirs crafted by local artisans. My start-up quickly gained attention, and I was soon approached by UNESCO to take a house in the neighboring village. However, I refused, as I knew that my success was rooted in the authenticity of my business. My clients appreciated the fact that I stayed true to my roots, and refused to compromise my values for the sake of profit.<br/><br/>Today, my start-up is thriving, and I\'m proud to employ local people in the production of our goods. It\'s an honor to showcase the incredible talent of the Bedouin community, and to create a sustainable business that contributes positively to the economy of Petra.<br/><br/>Starting a business from a cave in Petra was no easy feat, but it has been a journey of growth and perseverance. I\'m thankful for the lessons learned along the way, and look forward to continuing on this path of success.<br/><br/><br/><b>[Output-2]</b><br/>Despite growing up in a humble environment in the ancient city of Petra, this entrepreneur has managed to transform his living situation into a successful start-up. Living in a cave just a stone\'s throw from where he was born, he constructed a walled terrace with a garden of flowering shrubs which he uses to welcome visitors for tea. <br/><br/>Despite the challenges of living in a remote location, this entrepreneur has managed to attract visitors from all over the world to his unique living space. In the winter, the rain waters the plants, while in the summer, he hauls water up from a restaurant in the tourist area. <br/><br/>Having faced a significant decline in the population of Petra over the years, with only 10 families still remaining in the center of the park, this entrepreneur has managed to stay afloat by creating a unique experience for visitors. <br/><br/>UNESCO even tried to convince him to take a house in the village, but he refused, stating that he prefers the isolated living in Petra. With his determination and unique vision, this entrepreneur has managed to create a successful start-up in a remote location, proving that with innovation and creativity, anything is possible.<br/><br/><br/><b>[Output-3]</b><br/>Despite growing up in a historical city with fading residency, one individual refused to leave the comfortable surroundings of a cave. With a walled terrace complete with a garden of flowering shrubs, this individual welcomes visitors for tea in an environment that has thrived despite its lack of modern indulgences. Jordanian heritage is present in the remnants of the Bedouins, where only a short amount of time ago individuals would come for a month-long stay. By repurposing his personal space to welcome guests and maintaining a delicate ecosystem that enhances his surroundings, this individual has created a unique experience that can\'t be duplicated, even by the city.<br/><br/><br/><b>[Output-4]</b><br/>From humble beginnings in the ancient city of Petra, one innovator has taken his love for his home and transformed it into a thriving startup. Living in a cave just as he did as a child, this visionary has built a walled terrace with a stunning garden of flowering shrubs where his guests can enjoy a traditional Jordanian tea. With carefully crafted windows drilled into the rock to let in natural light, this unique space is more spacious than many city apartments, and offers a peaceful retreat in the heart of the city.<br/><br/>Despite numerous attempts to convince him to move to a house in the village, this tenacious entrepreneur refused, recognizing the potential that his cave offered. As the last remaining resident in the center of the park, this startup founder has created a tourist destination that attracts visitors from around the world.<br/><br/>He has even found a way to survive the arid Jordanian summers, hauling water up from a nearby restaurant to keep his garden flourishing. His love for his home, and his determination to make it a success, has inspired countless tourists and locals alike.<br/><br/>With a Jordanian flag standing tall over the canyon below, this unique startup has captured the imagination of visitors and residents alike. And in an age where people spend their lives surrounded by concrete and digital screens, this visionary entrepreneur has created a space that allows people to reconnect with nature and remember what it means to truly live.<br/><br/><br/><b>[Output-5]</b><br/>Despite growing up in a remote and ancient city, I had big dreams of success. After experiencing the tourism industry in my hometown of Petra, I saw an opportunity to create a unique experience for visitors. I wanted to showcase my city and its rich history in a way that was authentic and personal. <br/><br/>Using my knowledge of the area and my love for hospitality, I started my own tour company. At first, it was just me taking small groups of tourists on personalized tours of Petra. But as the positive reviews started pouring in, I knew I had something special. <br/><br/>I expanded my team and started offering different types of tours, from sunrise hikes to late-night candlelit walks through the ancient ruins. The business grew quickly, and we were soon recognized as one of the top tour companies in Petra. <br/><br/>But I didn\'t stop there. I saw a need for authentic Bedouin-style accommodations in the area, so I started my own small Bedouin campsite, complete with traditional tents and a shared community area. It was an instant hit with visitors looking for an immersive experience in Petra. <br/><br/>Now, my small start-up has transformed into a thriving tourism business, employing locals and providing unforgettable experiences for visitors from all over the world. And despite the success, I continue to live in my cave home, just a stone\'s throw from where I was born. It\'s a reminder of how far I\'ve come and what can be achieved with hard work and determination.<br/><br/><br/>', 318, 1337, 1554, 'content', NULL, NULL, NULL, '2023-06-17 04:31:25', '2023-06-17 04:36:52', NULL),
(232, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-zhssu', '1. \"The Rise of AI: How Artificial Intelligence is Transforming Our World\"<br>2. \"AI and Ethics: The Ethical Implications of Machine Learning and AI\"<br>3. \"AI in Healthcare: How Machine Learning is Revolutionizing the Medical Industry\"<br>4. \"AI in Education: The Role of Artificial Intelligence in Transforming Learning and Teaching\"<br>5. \"AI and the Future of Work: Will Machines Take Over Our Jobs?\"<br>6. \"The Limits of AI: Understanding the Capabilities and Limitations of Machine Learning\"<br>7. \"AI and Cybersecurity: How Machine Learning is Improving Online Security\"<br>8. \"AI and Climate Change: Can Artificial Intelligence Help Solve the Environmental Crisis?\"<br>9. \"The Importance of Diversity and Inclusivity in AI Development\"<br>10. \"AI in Entertainment: How Machine Learning is Changing the Way We Consume Media\"', 37, 175, 212, 'content', NULL, NULL, NULL, '2023-06-17 04:45:47', '2023-06-17 04:46:02', NULL),
(233, 1, NULL, 40, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-bgamk', 'Pros:<br/>- Hay una gran demanda para la decoración de fiestas con globos debido a su popularidad y versatilidad.<br/>- Los costos de inicio pueden ser relativamente bajos en comparación con otros tipos de negocios.<br/>- Es una industria en constante crecimiento, con muchas oportunidades para expandirse y diversificar los servicios ofrecidos.<br/>- Ofrecer servicios de decoración de globos puede ser una opción divertida y creativa para emprendedores que disfrutan del diseño y la planificación de eventos.<br/><br/>Cons:<br/>- La competencia puede ser alta en este mercado, lo que podría resultar en precios bajos que dificulten la rentabilidad.<br/>- Se requieren habilidades especializadas y experiencia en diseño de globos para ofrecer servicios de alta calidad que se destaquen en el mercado.<br/>- La temporada alta de trabajo puede estar concentrada en ciertas épocas del año, lo que podría generar ingresos variables y dificultades para mantener una base de clientes estable.<br/>- Los costos de materiales y suministros pueden aumentar significativamente si se pretende ofrecer una amplia variedad de estilos y diseños de decor', 45, 250, 299, 'content', NULL, NULL, NULL, '2023-06-17 06:44:06', '2023-06-17 06:45:42', NULL),
(234, 1, NULL, 34, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-hqyfs', 'Bienvenida a nuestro producto estrella, las pestañas mink una a una. ¿Estás buscando un material de calidad para realzar la belleza de tus ojos? ¡Aquí lo tienes!<br/><br/>Nuestras pestañas mink están hechas de pelo natural de mink. Esto significa que no solo son suaves y cómodas, sino que también son livianas y fáciles de usar. Además, las pestañas mink se ven y se sienten como tus propias pestañas, ya que se aplican una a una para personalizar el largo y el volumen.<br/><br/>Con nuestras pestañas mink una a una, lograrás una apariencia natural y sofisticada que dura hasta tres semanas. Ya sea que quieras transformar tus pestañas para una ocasión especial o para tu día a día, nuestras pestañas mink son perfectas para cualquier situación.<br/><br/>Además, nuestras pestañas mink son duraderas y resistentes al agua. Esto significa que puedes disfrutar de tus actividades diarias sin preocuparte por el desprendimiento o la pérdida de tus pestañas.<br/><br/>Nuestro', 43, 250, 293, 'content', NULL, NULL, NULL, '2023-06-17 06:48:08', '2023-06-17 06:48:08', NULL),
(235, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-v3kfw', '1. Why digital marketing is crucial for every business?<br/>2. The importance of having a consistent brand voice in your digital marketing strategy.<br/>3. Creative ways to engage your audience through digital marketing.<br/>4. The advantages of incorporating video into your digital marketing plan.<br/>5. Tips for creating effective email marketing campaigns.<br/>6. The benefits of investing in social media marketing for your business.<br/>7. How to measure the success of your digital marketing efforts.<br/>8. The impact of SEO on your digital marketing strategy.<br/>9. The evolution of digital marketing: What to expect in the future.<br/>10. Common mistakes to avoid in your digital marketing plan.', 38, 128, 166, 'content', NULL, NULL, NULL, '2023-06-17 06:49:02', '2023-06-17 06:49:02', NULL),
(236, 1, NULL, 13, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-rfxfn', '¡Atención a todos los amantes del verano! ¡Tenemos una promoción increíble para ti! ¿Estás buscando una forma divertida y fresca de pasar tus días de verano? ¡Tenemos la solución perfecta para ti! Ofrecemos un 3x2 en la renta de Brincolines acuáticos durante todo el verano.<br/><br/>Esta es una oferta que no puedes perderte. Con Brincolines acuáticos, podrás disfrutar de horas de diversión y refrescarte en el agua durante los días más calurosos del año. Invita a tus amigos a unirse a la diversión y obtén el tercer brincolín completamente gratis. ¿Qué más podrías pedir?<br/><br/>No pierdas la oportunidad de tener un verano inolvidable con esta increíble oferta. Ya sea que estés planeando una fiesta en la piscina o simplemente quieras disfrutar de un divertido día al aire libre, los Brincolines acuáticos son la forma perfecta de hacerlo. ¡Aprovecha esta promoción de verano y haz tus planes ahora!<br/><br/>', 77, 199, 327, 'content', NULL, NULL, NULL, '2023-06-17 06:50:16', '2023-06-17 06:50:37', NULL),
(238, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Laravel E-commerce', 'laravel-e-commerce-78msq', 'Sure, here is an example of Laravel code for setting up an e-commerce application:\n\n1. First, you\'ll need to create a new Laravel project, if you haven\'t already done so:\n\n```\ncomposer create-project --prefer-dist laravel/laravel ecommerce\n```\n\n2. Next, you\'ll need to add the necessary packages for handling e-commerce functionality:\n\n```\ncomposer require laravel/cashier\n```\n\n```\ncomposer require laravel/stripe\n```\n\n```\ncomposer require league/flysystem-aws-s3-v3 ~1.0\n```\n\n3. Configure your Stripe credentials in your .env file:\n\n```\nSTRIPE_KEY=your_stripe_key_here\nSTRIPE_SECRET=your_stripe_secret_here\n```\n\n4. Create a new controller for handling orders:\n\n```\nphp artisan make:controller OrdersController\n```\n\n5. In your OrdersController, create methods for handling different order-related tasks, such as creating a new order, updating an order, and deleting an order.\n\n6. Create a migration for an orders table:\n\n```\nphp artisan make:migration create_orders_table --create=orders\n```\n\n7. In the migration, define the columns for the orders table (such as order_id, customer_id, total_price, etc.)\n\n8. Run the migration to create the orders table:\n\n```\nphp artisan migrate\n```\n\n9. In your views directory, create views for displaying products, the shopping cart, and the checkout page.\n\n10. In your routes file, define the necessary routes for handling product display, adding to the cart, and checkout.\n\nThat\'s a basic example of how you could set up an e-commerce application using Laravel. Of course, you would need to customize this code based on your specific requirements, but hopefully this will give you a good starting point.', 28, 373, 401, 'code', NULL, NULL, NULL, '2023-06-17 07:22:55', '2023-06-17 07:22:55', NULL),
(239, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Trading', 'trading-0z5xu', 'Para crear una calculadora OTC (Over-The-Counter), se puede utilizar el lenguaje de programación Python y la librería PyQt5 para crear una interfaz de usuario gráfica. A continuación, se presenta un ejemplo básico de una calculadora OTC:\n\n```python\nimport sys\nfrom PyQt5.QtWidgets import QApplication, QWidget, QHBoxLayout, QVBoxLayout, QLabel, QLineEdit, QPushButton\n\nclass OTC_Calculator(QWidget):\n\n    def __init__(self):\n        super().__init__()\n        self.initUI()\n\n    def initUI(self):\n        # Crear los componentes de la interfaz gráfica\n        label_amount = QLabel(\"Monto:\")\n        label_rate = QLabel(\"Tasa:\")\n        label_days = QLabel(\"Días:\")\n        \n        self.amount_edit = QLineEdit()\n        self.rate_edit = QLineEdit()\n        self.days_edit = QLineEdit()\n        \n        self.result_label = QLabel(\"\")\n        \n        calculate_button = QPushButton(\"Calcular\")\n        calculate_button.clicked.connect(self.calculate)\n        \n        # Crear el layout de la interfaz gráfica\n        hbox1 = QHBoxLayout()\n        hbox1.addWidget(label_amount)\n        hbox1.addWidget(self.amount_edit)\n\n        hbox2 = QHBoxLayout()\n        hbox2.addWidget(label_rate)\n        hbox2.addWidget(self.rate_edit)\n\n        hbox3 = QHBoxLayout()\n        hbox3.addWidget(label_days)\n        hbox3.addWidget(self.days_edit)\n\n        hbox4 = QHBoxLayout()\n        hbox4.addWidget(calculate_button)\n\n        vbox = QVBoxLayout()\n        vbox.addLayout(hbox1)\n        vbox.addLayout(hbox2)\n        vbox.addLayout(hbox3)\n        vbox.addLayout(hbox4)\n        vbox.addWidget(self.result_label)\n        \n        self.setLayout(vbox)\n        \n        # Establecer algunas características de la ventana\n        self.setGeometry(300, 300, 400, 150)\n        self.setWindowTitle(\'Calculadora OTC\')\n\n    def calculate(self):\n        # Obtener los valores de los campos de entrada\n        amount = float(self.amount_edit.text())\n        rate = float(self.rate_edit.text())\n        days = int(self.days_edit.text())\n        \n        # Calcular el resultado de la fórmula OTC\n        result = amount * (1 + rate/100) ** (days/365)\n        \n        # Establecer el resultado en el campo de salida\n        self.result_label.setText(\"Resultado: {:.2f}\".format(result))\n\nif __name__ == \'__main__\':\n    app = QApplication(sys.argv)\n    ex = OTC_Calculator()\n    ex.show()\n    sys.exit(app.exec_())\n```\n\nEn este ejemplo, la calculadora OTC permite al usuario ingresar un monto, una tasa y un número de días, y luego calcular el resultado de la fórmula OTC. El resultado se muestra en un campo de texto.\n\nPara ejecutar este código, es necesario tener instalado Python y la librería PyQt5. Se puede guardar el código en un archivo con extensión \".py\" y ejecutarlo desde la terminal o desde un IDE de Python.', 26, 628, 654, 'code', NULL, NULL, NULL, '2023-06-17 07:32:38', '2023-06-17 07:32:38', NULL),
(240, 2, NULL, 20, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-m2oen', 'Looking for a luxurious women\'s watch? Look no further! Our elegant timepiece is perfect for the modern fashion-forward young woman. Stand out from the crowd and make a statement with this one-of-a-kind accessory. Whether you\'re going to work or enjoying a night on the town, this watch is sure to turn heads. Don\'t miss out on this must-have item for the trendy youth market. Order now and step up your style game today!', 75, 90, 165, 'content', NULL, NULL, NULL, '2023-06-17 07:54:33', '2023-06-17 07:54:33', NULL),
(241, 2, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-5gake', '<b>[Output-1]</b><br/>Opening shot of me sitting on a couch looking at my phone <br/><br/>Me: \"Guys, I just came up with the best prank ever! Are you ready for this?\" <br/><br/>Cut to a shot of me setting up a camera in a public place <br/><br/>Me: \"I\'m going to pretend to be a lost tourist and ask strangers for directions. But the directions I\'ll ask for are ridiculously impossible to find!\" <br/><br/>Quick montage of me asking strangers for directions and their reactions <br/><br/>Stranger 1: \"Yeah, just take a left at the purple unicorn and then right at the flying pig!\" <br/><br/>Cut to me struggling to find the imaginary landmarks <br/><br/>Me (whispering to the camera): \"This is hilarious, they have no idea!\" <br/><br/>Cut to me eventually giving up and turning back to the stranger <br/><br/>Me: \"Thanks for your help, but I think I\'ll just use my phone.\" <br/><br/>Stranger: \"Wait, was this a prank?!\" <br/><br/>Cut to me running away laughing <br/><br/>Me: \"Successful prank number one! Who\'s ready for the next one?\" <br/><br/>End shot of me winking at the camera and looking mischievous<br/><br/><br/><b>[Output-2]</b><br/>Hey guys, have you ever pulled a prank on your friend? Well, today I\'m going to show you one of my favorite pranks that will have you rolling on the floor laughing!<br/><br/>First, you\'ll need a plastic spider and a brave friend. Sneak up behind them, and place the spider on their shoulder. Then, quickly jump back and watch their reaction.<br/><br/>Now, here\'s where it gets really funny. As your friend starts freaking out, pretending to be terrified, you can\'t help but burst out laughing. The look on their face is priceless!<br/><br/>Remember, pranking your friends can be a lot of fun, but always make sure it\'s harmless and not too mean. Let\'s spread some laughter and joy on TikTok, one prank at a time! #prank #funny #spiderjoke #laughterchallenge #friendshipgoals<br/><br/><br/><b>[Output-3]</b><br/>Hey, TikTok fam! I have something exciting to share with you today. Do you guys love pulling pranks on your friends and family? Well, I have the perfect prank for you to try out.<br/><br/>It\'s called the \"invisible rope\" prank. Here\'s how it goes: <br/><br/>You and a few of your friends will stand on either side of the road as if you\'re holding a rope. Then, when a car approaches, you\'ll start pulling on the \"rope\" as if you\'re trying to stop the car from passing.<br/><br/>The driver will be completely confused as to how there\'s a rope blocking the road, but little do they know, it\'s all just a prank!<br/><br/>I\'ve tried this prank on my friends and it never fails to make them laugh. So, why not give it a try and see if you can fool some unsuspecting drivers?<br/><br/>Just make sure you and your friends stay safe and don\'t actually try to stop any cars from passing. Have fun, TikTok fam! #prank #invisiblerope #funnyvideos #tiktok<br/><br/><br/><b>[Output-4]</b><br/>Hey everyone, are you ready for a prank? I\'ve been planning this for a while and I can\'t wait to see their reaction! This prank is going to be next level. The key is to keep a straight face and act natural. I\'m going to need some help, so let\'s get started. <br/><br/>Okay, so here\'s the plan: we\'re going to pretend like we\'re going to play a harmless game, but we\'re actually going to switch out the regular cards with trick cards. These cards have crazy rules on them that will make the game so much more interesting! <br/><br/>They have no idea what they\'re in for! I can\'t wait to see their faces when they read the first card. Let\'s get everything ready and make sure we have everything we need. <br/><br/>Now, let\'s go! We\'re going to give them the surprise of their life! They\'ll never see it coming. <br/><br/>Watch the video to see how it all turns out! Trust me, it\'s going to be hilarious! Don\'t forget to like and comment if you enjoyed our prank! Thanks for watching!<br/><br/><br/><b>[Output-5]</b><br/>Hey, TikTok fam! Are you ready for some hilarious pranks? Today, we\'re going to talk all about مقلب - that\'s right, we\'re going to prank each other and have a blast doing it! <br/><br/>There are so many different ways to pull off a successful prank. You could fake a spider or snake, hide someone\'s phone or even add some tabasco to their food - now that\'s a spicy prank! <br/><br/>The best thing about pranks is how you can get creative with them. You can play pranks on your friends, family or even strangers on the street. Just make sure you do it in good spirit and don\'t hurt anyone\'s feelings! <br/><br/>So, what\'s the best prank you\'ve ever pulled off? Share your favorites in the comments below and let\'s get this prank party started! Don\'t forget to like this video and share it with your friends. Until next time, stay pranking, TikTok fam!<br/><br/><br/>', 42, 225, 1091, 'content', NULL, NULL, NULL, '2023-06-17 07:56:33', '2023-06-17 07:58:19', NULL),
(242, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'موقع مزادات', 'mokaa-mzadat-it8b7', 'يمكنك إنشاء موقع لبيع السيارات بالمزاد باستخدام لغة برمجة مثل PHP وقواعد البيانات مثل MySQL. يمكنك تصميم واجهة مستخدم بسيطة يمكن للمستخدمين البحث عن السيارات المتاحة للبيع وتحديد السعر الذي يرغبون في دفعه.\n\nيمكنك استخدام ميزات مثل تسجيل الدخول والتسجيل لتمكين المستخدمين من إنشاء حسابات ورصد عمليات البيع والمزادات التي يشاركون فيها. يمكنك أيضاً إدارة المتاجر وعرض الصور والتفاصيل الفنية للسيارات المعروضة للبيع.\n\nتحتاج إلى تحديد قواعد البيع بشكل واضح والزمن المحدد للمزاد. يمكنك إضافة ميزة الحصول على إشعارات لتنبيه المستخدمين عندما يتم زيادة القيمة على المنتج الذي يهمهم. كذلك يمكن اضافة خدمات المراجعة الفنية للسيارة، وخدمات التمويل في حال احتياج المستخدم للتمويل لشراء السيارة.', 40, 466, 506, 'code', NULL, NULL, NULL, '2023-06-17 07:59:54', '2023-06-17 07:59:54', NULL),
(243, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Rap Music Game', 'rap-music-game-rcupt', 'Alright, here\'s a basic game plan for a rap music game with 2 levels:\n\nLevel 1: Guess the Missing Rhyme\n1. The game will play a beat and a rap lyric.\n2. One word will be omitted from the rap lyric.\n3. The player\'s task is to fill in the missing word with a correct rhyming word.\n4. The player has a limited amount of time to answer, otherwise they lose a point.\n5. The player must accumulate a certain number of points to advance to level 2.\n\nLevel 2: Freestyle Battle\n1. The player will be presented with a beat and a topic.\n2. The player must come up with a rap verse on the topic within a set amount of time\n3. The player will then battle against the computer or another player.\n4. The player will choose a line from their rap to use in the battle.\n5. The computer or opponent will then respond with a line of their own.\n6. The battle will go back and forth until one player has run out of relevant lines.\n7. The winner is based on the audience\'s reaction to each player\'s lines.\n8. The player must win a certain number of battles to win the game.\n\nAdditional features:\n\n1. The game can have a tutorial mode for players unfamiliar with rap techniques such as rhyming and freestyling.\n2. The game can have different levels of difficulty: easy, medium, and hard.\n3. The game can have customizable settings such as beat style and tempo.\n4. The game can have social features that allow players to battle against each other online.', 30, 332, 362, 'code', NULL, NULL, NULL, '2023-06-17 08:20:07', '2023-06-17 08:20:07', NULL),
(244, 1, NULL, 10, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-ezkab', 'Estimado Luis,<br/><br/>¡Espero que te encuentres muy bien! Estoy escribiendo para contarte acerca de mi experiencia con el producto que me recomendaste. ¡Debo decir que estoy realmente impresionado!<br/><br/>Desde que comencé a utilizarlo, he notado una gran diferencia en la calidad de mi vida diaria. Contactarte fue la mejor decisión que pude haber tomado.<br/><br/>Quería enviarte este correo electrónico para expresar mi agradecimiento por tu recomendación y asegurarte que seguiré comprando en esta tienda gracias a tu excelente servicio.<br/><br/>¡Gracias de nuevo, Luis, y que tengas un excelente día!<br/><br/>Atentamente,<br/>[Nombre]', 45, 148, 193, 'content', NULL, NULL, NULL, '2023-06-17 08:37:43', '2023-06-17 08:37:43', NULL),
(245, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'header boostract', 'header-boostract-ywgay', 'I\'m not sure what you mean by \"star up.\" Could you please provide more context or clarify your request?', 24, 23, 47, 'code', NULL, NULL, NULL, '2023-06-17 08:39:35', '2023-06-17 08:39:35', NULL),
(246, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'header boostract', 'header-boostract-8tbyl', 'I\'m glad you\'re here! What can I help you with?', 23, 14, 37, 'code', NULL, NULL, NULL, '2023-06-17 08:39:43', '2023-06-17 08:39:43', NULL),
(247, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'header boostract', 'header-boostract-77ijo', 'I\'m sorry, I\'m not sure what you want me to do. Please provide more details or a specific task so I can assist you better.', 23, 30, 53, 'code', NULL, NULL, NULL, '2023-06-17 08:39:44', '2023-06-17 08:39:44', NULL),
(248, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'header', 'header-y6mji', 'To create a header with the color green, you can use HTML and CSS code. Here\'s an example:\n\nHTML:\n\n```html\n<header>\n  <h1>My Green Header</h1>\n</header>\n```\n\nCSS:\n\n```css\nheader {\n  background-color: green;\n}\n\nh1 {\n  color: white;\n}\n```\n\nThis code will create a header with a green background color and white text. You can customize the code further by changing the header and text size, font, and other properties.', 26, 106, 132, 'code', NULL, NULL, NULL, '2023-06-17 08:40:01', '2023-06-17 08:40:01', NULL),
(249, 1, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-mlbsv', 'When it comes to writing about artificial intelligence, one of the most common questions that come up is whether or not it is capitalized. The answer is that it depends on the context in which you are using the term.<br/><br/>In general, when you are referring to artificial intelligence as a field of study or an academic discipline, it should be capitalized. For example, if you were writing an article about the latest research in artificial intelligence, you would capitalize the term because you are using it as a noun.<br/><br/>On the other hand, when you are using artificial intelligence as an adjective to describe something, it is typically not capitalized. For instance, if you are talking about an artificial intelligence tool or a system that uses artificial intelligence, you would not capitalize the term, as it is describing something rather than being its proper name.<br/><br/>It is worth noting that there is some variation in how writers and publishers treat the capitalization of artificial intelligence. Some publications may choose to capitalize the term regardless of how it is used, while others may choose not to capitalize it at all.<br/><br/>In the end, the most important thing is to be consistent within your own writing. If you have chosen a specific style guide or publication that dictates whether or not to capitalize artificial intelligence, be sure to', 51, 250, 301, 'content', NULL, NULL, NULL, '2023-06-17 08:57:50', '2023-06-17 08:57:50', NULL),
(250, 2, NULL, 21, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-6yfvq', '\"Revolutionizing the Jewellery Industry: Discover the Magic of Diamond Tokenization\"', 49, 17, 66, 'content', NULL, NULL, NULL, '2023-06-17 09:08:55', '2023-06-17 09:08:55', NULL),
(251, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Diamond', 'diamond-triaz', 'Sure thing! Here\'s a code snippet that creates a polygon and rotates it using CSS animations:\n\nHTML:\n```html\n<div class=\"container\">\n  <div class=\"polygon\"></div>\n</div>\n```\n\nCSS:\n```css\n.container {\n  position: relative;\n  margin: 50px auto;\n  width: 200px;\n  height: 200px;\n}\n\n.polygon {\n  position: absolute;\n  top: 50%;\n  left: 50%;\n  transform: translate(-50%, -50%);\n  width: 100px;\n  height: 100px;\n  background: red;\n  clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);\n  animation: rotate 4s linear infinite;\n}\n\n@keyframes rotate {\n  from {\n    transform: translate(-50%, -50%) rotate(0deg);\n  }\n  to {\n    transform: translate(-50%, -50%) rotate(360deg);\n  }\n}\n```\n\nThis code defines a container that is centered on the page and a polygon shape (created with `clip-path`) that is positioned in the center of the container. The `animation` property is used to add a rotation effect that causes the polygon to rotate 360 degrees over a 4 second period.\n\nYou\'ll need to include the above code inside a `script` and `style` tag respectively within a HTML webpage to see this effect in action.', 34, 305, 339, 'code', NULL, NULL, NULL, '2023-06-17 09:10:10', '2023-06-17 09:10:10', NULL),
(252, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Diamond', 'diamond-mqnq4', 'Sure, here is an example of how you can create a diamond polygon in HTML, CSS and Javascript that spins around:\n\nHTML:\n\n```\n<div class=\"diamond\"></div>\n```\n\nCSS:\n\n```\n.diamond {\n  width: 100px;\n  height: 100px;\n  position: absolute;\n  top: 50%;\n  left: 50%;\n  transform: translate(-50%, -50%);\n  background: blue;\n  clip-path: polygon(50% 0, 100% 50%, 50% 100%, 0 50%);\n  animation: spin 2s linear infinite;\n}\n\n@keyframes spin {\n  from {\n    transform: rotate(0deg);\n  }\n  to {\n    transform: rotate(360deg);\n  }\n}\n```\n\nJavascript:\n\n```\n// No Javascript needed for this example.\n```\n\nIn this example, we create a diamond polygon using the `clip-path` property in CSS. We then use the `transform` property to position the diamond in the center of the screen. Finally, we use CSS animations to make the diamond spin around infinitely.', 35, 229, 264, 'code', NULL, NULL, NULL, '2023-06-17 09:10:39', '2023-06-17 09:10:39', NULL),
(253, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Diamond', 'diamond-2oyxa', 'Here is the HTML and CSS code for a diamond polygon that is turning around:\n\nHTML:\n```\n<div class=\"diamond\"></div>\n```\n\nCSS:\n```\n.diamond {\n  width: 100px;\n  height: 100px;\n  position: relative;\n  animation: spin-diamond 2s infinite linear;\n}\n\n.diamond:before,\n.diamond:after {\n  content: \"\";\n  position: absolute;\n  top: 0;\n  left: 0;\n  background-color: #000;\n}\n\n.diamond:before {\n  width: 50px;\n  height: 50px;\n  transform: rotate(45deg);\n}\n\n.diamond:after {\n  width: 50px;\n  height: 50px;\n  top: 50px;\n  transform: rotate(135deg);\n}\n\n@keyframes spin-diamond {\n  0% {\n    transform: rotate(0deg);\n  }\n  100% {\n    transform: rotate(360deg);\n  }\n}\n```\n\nJavaScript is not needed for this animation, just the HTML and CSS will suffice. The above code will create a diamond polygon that spins infinitely around.', 35, 237, 272, 'code', NULL, NULL, NULL, '2023-06-17 09:10:39', '2023-06-17 09:10:39', NULL),
(257, 2, NULL, 9, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-1w1ep', 'Dear valued customer,<br/><br/>We hope this email finds you well. As a token of our appreciation for your loyalty, we are excited to offer you a special discount on our products. <br/><br/>For a limited time only, enjoy 20% off your next purchase using the promo code JKD20 at checkout. <br/><br/>From skincare to fashion, we offer a wide range of high-quality products that we know you\'ll love. Take advantage of this exclusive offer and save on your favorite items! <br/><br/>Thank you again for being a valued customer. We look forward to providing you with exceptional service and quality products in the future. <br/><br/>Best Regards,<br/>[Your Name]', 37, 129, 166, 'content', NULL, NULL, NULL, '2023-06-17 10:37:41', '2023-06-17 10:37:41', NULL),
(258, 2, NULL, 62, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-ylyqb', 'Once upon a time, a group of friends who shared a passion for gaming decided to start their own gaming channel. It was a daunting task as they knew the market was saturated with gaming channels, but they had a secret weapon - their friendly personalities. They believed that creating a welcoming community for gamers would set them apart from the competition.<br/><br/>They began by creating content that was not only entertaining but also educational. They would play games and provide tips and tricks for their viewers. Their audience quickly grew as gamers appreciated the value they were providing. Additionally, their friendly demeanor and humor kept viewers engaged and coming back for more.<br/><br/>As they gained popularity, they began collaborating with other gaming channels and influencers. This allowed them to expand their reach and offer their audience new and exciting content. They also made sure to engage with their audience through social media and live streams. This helped them build a strong and loyal community of gamers who supported their channel.<br/><br/>Eventually, their hard work and dedication paid off. They were able to monetize their channel and turned their passion into a successful business. Today, they have millions of subscribers and continue to create content that entertains and educates their audience.<br/><br/>The success of this startup gaming channel is a testament to the power of a friendly', 41, 250, 291, 'content', NULL, NULL, NULL, '2023-06-17 10:38:29', '2023-06-17 10:38:29', NULL),
(260, 1, NULL, 61, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-arqvy', 'I am thrilled to share my success story with the loaning business. I was in dire need of financial assistance to kickstart my new venture but was struggling to find a reliable loaning firm. That\'s when I came across this fantastic loaning business, and I am delighted to say that it has been a game-changer for me and my business.<br/><br/>The process was easy and straightforward. The team members were very friendly and approachable, making me feel at ease throughout the loan application process. They were always available to answer any queries I had, providing me with all the necessary information and guidance I needed to make the best decision for my business.<br/><br/>Their loan packages were flexible and customizable, allowing me to select the one that suited me the best. The entire process was completed in a timely manner, and I received the loan quickly, which helped me to fund my business operations and take it to the next level.<br/><br/>Overall, I would highly recommend this loaning business to anyone looking for reliable financial assistance. They have played a significant role in my success, and I am eternally grateful to them for their support and guidance. Thank you for your services, and please keep up the excellent work!', 53, 240, 293, 'content', NULL, NULL, NULL, '2023-06-17 11:16:05', '2023-06-17 11:16:05', NULL),
(261, 2, NULL, 55, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-zxnh9', '1. \"Blindfolded Mystery Prank\" - Blindfold a friend and lead them to a mystery location for a surprise prank. See their hilarious reaction when the blindfold is removed!<br/><br/>2. \"Escape Room Challenge with a Twist\" - Take a group of friends to an escape room, but add in some unexpected challenges and pranks to keep them on their toes. Can they solve the mystery and escape in time?<br/><br/>3. \"Ultimate Fun Challenge\" - Create a series of fun challenges for friends to compete in. The catch? Each challenge is a mystery until they begin and they must improvise on the spot.<br/><br/>4. \"Haunted House Prank\" - Set up a fake haunted house and invite friends to experience it. Add unexpected twists and turns for a hilarious prank.<br/><br/>5. \"Mystery Box Challenge\" - Fill a box with random items and have friends blindly choose one. Each item represents a challenge or task they must complete to win the ultimate prize.<br/><br/>6. \"Office Mystery Prank\" - Set up a mystery prank in the office, involving hidden clues and tricky puzzles. See how well your coworkers can work together to solve it.<br/><br/>7. \"Escape the Room Mystery\" - Create an elaborate escape room scenario,', 40, 250, 292, 'content', NULL, NULL, NULL, '2023-06-17 12:13:12', '2023-06-17 18:17:57', NULL),
(262, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'python ai', 'python-ai-tznvy', 'Sure! Here is some example code for an AI chatbot in Python:\n\n```python\nimport random\n\nresponses = {\n  \"Hey\": [\"Hello!\", \"Hi there!\", \"Hey!\"],\n  \"How are you?\": [\"I\'m fine, thanks for asking.\", \"I\'m doing well, how are you?\", \"I\'m great, thanks!\"],\n  \"What\'s your name?\": [\"I\'m a chatbot, you can call me Robo.\", \"My name is Robo, nice to meet you.\", \"I don\'t really have a name, but you can call me whatever you like.\"],\n  \"What do you like to do?\": [\"I like to answer questions and help people.\", \"I enjoy chatting with people like you!\", \"I\'m happiest when I\'m helping others.\"],\n  \"Goodbye\": [\"Goodbye!\", \"See you later!\", \"Take care!\"]\n}\n\ndef chat():\n  print(\"Hi there, I\'m a chatbot. What\'s your name?\")\n  name = input()\n  print(\"Hi \" + name + \", how can I help you today?\")\n  \n  while True:\n    user_input = input().lower()\n\n    if user_input in responses:\n      # Randomly select a response from the list of possible responses\n      print(random.choice(responses[user_input]))\n    else:\n      print(\"I\'m sorry, I don\'t understand. Can you please rephrase your question?\")\n  \nchat()\n```\n\nThis code defines a dictionary (`responses`) that maps possible user inputs to a list of possible responses. The `chat()` function starts by greeting the user and asking their name. It then enters a loop that repeatedly prompts the user for input and provides a response using the dictionary of possible responses. If user input is not recognized, the chatbot asks the user to rephrase their question.', 31, 375, 406, 'code', NULL, NULL, NULL, '2023-06-17 12:18:11', '2023-06-17 12:18:11', NULL),
(263, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-a8bs1', 'Sure! Here\'s an example contact form code using HTML, CSS, and JS:\n\nHTML code:\n```\n<form id=\"contact-form\">\n  <div class=\"form-group\">\n    <label for=\"name\">Name:</label>\n    <input type=\"text\" id=\"name\" name=\"name\" required>\n  </div>\n  <div class=\"form-group\">\n    <label for=\"email\">Email:</label>\n    <input type=\"email\" id=\"email\" name=\"email\" required>\n  </div>\n  <div class=\"form-group\">\n    <label for=\"message\">Message:</label>\n    <textarea id=\"message\" name=\"message\" rows=\"5\" required></textarea>\n  </div>\n  <button type=\"submit\">Submit</button>\n</form>\n```\n\nCSS code:\n```\n.form-group {\n  margin-bottom: 20px;\n}\n\nlabel {\n  display: inline-block;\n  margin-bottom: 5px;\n}\n\ninput[type=\"text\"],\ninput[type=\"email\"],\ntextarea {\n  padding: 10px 15px;\n  border-radius: 3px;\n  border: none;\n  background-color: #f2f2f2;\n  width: 100%;\n}\n\nbutton[type=\"submit\"] {\n  background-color: #4CAF50;\n  color: white;\n  padding: 10px 20px;\n  border: none;\n  border-radius: 3px;\n  cursor: pointer;\n}\n\nbutton[type=\"submit\"]:hover {\n  background-color: #3e8e41;\n}\n```\n\nJS code:\n```\n// get the form element\nconst form = document.getElementById(\'contact-form\');\n\n// add an event listener for form submission\nform.addEventListener(\'submit\', function(event) {\n  event.preventDefault(); // prevent default form submission\n\n  // get form data\n  const formData = new FormData(this);\n\n  fetch(\'/path-to-your-server-side-script\', {\n    method: \'POST\',\n    body: formData\n  })\n    .then(response => {\n      if (response.ok) {\n        alert(\'Thanks for contacting us! We will get back to you soon.\');\n        form.reset();\n      } else {\n        alert(\'Oops! Something went wrong. Please try again later.\');\n      }\n    })\n    .catch(error => {\n      console.error(error);\n      alert(\'Oops! Something went wrong. Please try again later.\');\n    });\n});\n```\n\nNote that in the JS code, you\'ll need to replace `/path-to-your-server-side-script` with the actual path to your server-side script that handles form submission.', 31, 529, 560, 'code', NULL, NULL, NULL, '2023-06-17 13:30:44', '2023-06-17 13:30:44', NULL),
(264, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'python', 'python-8sp7q', 'Sure, here is some Python code for web scraping using the Beautiful Soup library:\n\n```python\nimport requests\nfrom bs4 import BeautifulSoup\n\nurl = \"https://www.example.com\"\nr = requests.get(url)\n\nsoup = BeautifulSoup(r.content)\n\n# Get all the links on the page\nlinks = soup.find_all(\'a\')\nfor link in links:\n    print(link.get(\'href\'))\n\n# Get all the images on the page\nimages = soup.find_all(\'img\')\nfor image in images:\n    print(image.get(\'src\'))\n```\n\nThis code fetches the HTML content of the given URL, and then uses Beautiful Soup to parse the HTML. It then finds all the links and images on the page, and prints out their respective URLs or source URLs. You can modify this code to suit your needs, depending on what specific content you want to scrape from a website.', 27, 176, 203, 'code', NULL, NULL, NULL, '2023-06-17 13:39:36', '2023-06-17 13:39:36', NULL),
(265, 1, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-upcjo', 'As travel becomes more accessible and affordable, the world is opening up for adventurous travellers. With so many beautiful and interesting countries to explore, it can be difficult to decide where to visit first. From ancient ruins to pristine beaches, here are some of the best countries to visit for an unforgettable travel experience.<br/><br/>Thailand<br/>Thailand is a popular destination for good reason. Known as the land of smiles, visitors are greeted with a welcoming spirit and delicious food. The popular cities of Bangkok and Chiang Mai offer a mix of modern and traditional delights. For a more relaxing getaway, head to the stunning Thai islands for crystal clear waters and sandy beaches.<br/><br/>Japan<br/>Japan is a fascinating country that combines a rich cultural heritage with cutting-edge modernity. From cherry blossoms to colourful Shinto shrines, visitors can experience the best of Japan in Kyoto and Tokyo. The country\'s unique cuisine is also a must-try, from delicious ramen noodles to delicate sushi.<br/><br/>Peru<br/>Peru is a country of natural and cultural wonders, boasting one of the world\'s most iconic archeological sites: Machu Picchu. Other popular attractions include Lake Titicaca and the Nazca Lines. For the adventurous traveller, Peru offers incredible opportunities for hiking and', 49, 250, 299, 'content', NULL, NULL, NULL, '2023-06-17 13:40:26', '2023-06-17 13:40:26', NULL),
(266, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-9i9ib', 'Sure! Here is an example code for a basic customer information form using HTML, CSS, and JavaScript:\n\nHTML code:\n```html\n<form>\n  <label for=\"name\">Name:</label>\n  <input type=\"text\" id=\"name\" name=\"name\" required><br>\n\n  <label for=\"email\">Email:</label>\n  <input type=\"email\" id=\"email\" name=\"email\" required><br>\n\n  <label for=\"phone\">Phone:</label>\n  <input type=\"tel\" id=\"phone\" name=\"phone\" required><br>\n\n  <label for=\"message\">Message:</label>\n  <textarea id=\"message\" name=\"message\" rows=\"4\" cols=\"50\"></textarea><br>\n\n  <button type=\"submit\">Submit</button>\n</form>\n```\n\nCSS code:\n```css\nform {\n  display: flex;\n  flex-direction: column;\n  align-items: center;\n}\n\nlabel, input, textarea {\n  margin: 10px 0;\n}\n\ninput, textarea {\n  padding: 5px;\n}\n\nbutton {\n  background-color: #4CAF50;\n  color: white;\n  font-size: 16px;\n  padding: 10px;\n  border: none;\n  border-radius: 5px;\n  cursor: pointer;\n}\n\nbutton:hover {\n  background-color: #3e8e41;\n}\n```\n\nJavaScript code:\n```javascript\nconst form = document.querySelector(\'form\');\nconst nameInput = document.querySelector(\'#name\');\nconst emailInput = document.querySelector(\'#email\');\nconst phoneInput = document.querySelector(\'#phone\');\nconst messageInput = document.querySelector(\'#message\');\n\nform.addEventListener(\'submit\', (e) => {\n  e.preventDefault();\n  console.log(`Name: ${nameInput.value}`);\n  console.log(`Email: ${emailInput.value}`);\n  console.log(`Phone: ${phoneInput.value}`);\n  console.log(`Message: ${messageInput.value}`);\n  alert(\'Form submitted successfully!\');\n  form.reset();\n});\n```\n\nThis form includes name, email, phone, and message input fields, as well as a submit button. The CSS styles the form to be centered and have some basic styling. The JavaScript code logs the form data to the console and triggers an alert when the form is submitted, as well as reseting the form inputs. Note that this code only provides an example and it should be properly tested and modified according to the specific needs of the project.', 31, 501, 532, 'code', NULL, NULL, NULL, '2023-06-17 13:47:15', '2023-06-17 13:47:15', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(267, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-ymzgi', 'Sure, here\'s an example of a customer information form using HTML, CSS, and JavaScript:\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n	<title>Customer Information Form</title>\n	<style>\n		form {\n			margin: 50px auto;\n			max-width: 500px;\n			padding: 20px;\n			background-color: #f2f2f2;\n			border-radius: 5px;\n			box-shadow: 0px 0px 10px #888888;\n		}\n\n		fieldset {\n			border: none;\n			margin: 0;\n			padding: 0;\n		}\n\n		label {\n			display: block;\n			margin-bottom: 10px;\n			font-weight: bold;\n		}\n\n		input[type=\"text\"], input[type=\"email\"], select {\n			width: 100%;\n			padding: 10px;\n			margin-bottom: 20px;\n			border-radius: 5px;\n			border: none;\n			background-color: #eee;\n			box-shadow: inset 0px 0px 5px #888888;\n		}\n\n		input[type=\"submit\"] {\n			background-color: #4CAF50;\n			color: white;\n			padding: 10px 20px;\n			border: none;\n			border-radius: 5px;\n			cursor: pointer;\n			transition: background-color 0.3s;\n			margin-bottom: 20px;\n		}\n\n		input[type=\"submit\"]:hover {\n			background-color: #3e8e41;\n		}\n\n		.error-msg {\n			color: red;\n			margin: 5px 0;\n			font-size: 0.8em;\n			font-weight: bold;\n		}\n	</style>\n</head>\n<body>\n	<form id=\"customer-info-form\">\n		<fieldset>\n			<legend>Customer Information</legend>\n\n			<label for=\"name\">Name*</label>\n			<input type=\"text\" id=\"name\" name=\"name\" required>\n\n			<label for=\"email\">Email Address*</label>\n			<input type=\"email\" id=\"email\" name=\"email\" required>\n\n			<label for=\"phone\">Phone Number</label>\n			<input type=\"text\" id=\"phone\" name=\"phone\">\n\n			<label for=\"address\">Address</label>\n			<input type=\"text\" id=\"address\" name=\"address\">\n\n			<label for=\"city\">City</label>\n			<input type=\"text\" id=\"city\" name=\"city\">\n\n			<label for=\"state\">State/Province</label>\n			<input type=\"text\" id=\"state\" name=\"state\">\n\n			<label for=\"country\">Country*</label>\n			<select id=\"country\" name=\"country\" required>\n				<option value=\"\" selected disabled>Select Country</option>\n				<option value=\"usa\">USA</option>\n				<option value=\"canada\">Canada</option>\n				<option value=\"mexico\">Mexico</option>\n			</select>\n\n			<input type=\"submit\" value=\"Submit\">\n			<div id=\"error-message\"></div>\n		</fieldset>\n	</form>\n\n	<script>\n		const form = document.getElementById(\'customer-info-form\');\n		const errorMessage = document.getElementById(\'error-message\');\n\n		form.addEventListener(\'submit\', e => {\n			e.preventDefault();\n\n			const name = form.name.value.trim();\n			const email = form.email.value.trim();\n			const phone = form.phone.value.trim();\n			const address = form.address.value.trim();\n			const city = form.city.value.trim();\n			const state = form.state.value.trim();\n			const country = form.country.value.trim();\n\n			if (name === \'\' || email === \'\' || country === \'\') {\n				errorMessage.innerHTML = \'Please fill in all required fields.\';\n				return;\n			}\n\n			// Do something with the form data (e.g. submit to server)\n\n			form.reset();\n			errorMessage.innerHTML = \'\';\n			alert(\'Form submitted successfully!\');\n		});\n	</script>\n</body>\n</html>\n```\n\nThis form has several fields for the customer\'s information, including name, email, phone number, address, city, state/province, and country. It also includes a submit button at the bottom.\n\nThe form has some basic styling to make it look visually appealing using CSS. It also has some JavaScript code to validate the form data before submitting it. If any required fields are missing, an error message will be displayed and the form will not be submitted. Otherwise, the form data will be submitted and the form will be reset.', 31, 955, 986, 'code', NULL, NULL, NULL, '2023-06-17 13:47:37', '2023-06-17 13:47:37', NULL),
(268, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-2xa85', 'Sure! Here\'s an example for a basic contact form using HTML, CSS, and JS:\n\nHTML code:\n\n```\n<form id=\"contact-form\" method=\"post\">\n\n    <label for=\"name\">Name:</label>\n    <input type=\"text\" name=\"name\" id=\"name\" placeholder=\"Your name\" required>\n\n    <label for=\"email\">Email:</label>\n    <input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Your email address\" required>\n\n    <label for=\"message\">Message:</label>\n    <textarea name=\"message\" id=\"message\" placeholder=\"Your message\" required></textarea>\n\n    <button type=\"submit\">Submit</button>\n\n</form>\n```\n\nCSS code:\n\n```\nform {\n    max-width: 600px;\n    margin: 0 auto;\n    display: flex;\n    flex-direction: column;\n}\n\nlabel, input, textarea {\n    margin-top: 10px;\n    margin-bottom: 20px;\n}\n\nlabel {\n    font-weight: bold;\n}\n\ninput, textarea {\n    padding: 10px;\n}\n\ntextarea {\n    resize: vertical;\n}\n\nbutton {\n    padding: 10px 20px;\n    background-color: #4CAF50;\n    color: white;\n    border: none;\n    cursor: pointer;\n}\n\nbutton:hover {\n    background-color: #3e8e41;\n}\n```\n\nJS code:\n\n```\nconst form = document.querySelector(\"#contact-form\");\n\nform.addEventListener(\"submit\", function(event) {\n    event.preventDefault();\n\n    const name = document.querySelector(\"#name\").value;\n    const email = document.querySelector(\"#email\").value;\n    const message = document.querySelector(\"#message\").value;\n\n    const data = { name, email, message };\n\n    fetch(form.action, {\n        method: \"POST\",\n        headers: {\n            \"Content-Type\": \"application/json\"\n        },\n        body: JSON.stringify(data)\n    })\n    .then(response => alert(\"Thanks for contacting us!\"))\n    .catch(error => alert(\"Oops! Something went wrong.\"));\n});\n```\n\nPlease note that this example assumes that you have a server-side script that can handle the form submission. The `fetch` function sends the form data using JSON format to the server-side script. You also need to set the `action` attribute of the form element to the URL of your server-side script.', 32, 485, 517, 'code', NULL, NULL, NULL, '2023-06-17 13:52:26', '2023-06-17 13:52:26', NULL),
(269, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-2ndhb', 'Sure! Here is an example of a website contact us form using HTML, CSS, and JavaScript:\n\n\nHTML code:\n\n```\n<form id=\"contact-form\">\n  <div class=\"form-group\">\n    <label for=\"name\">Name:</label>\n    <input type=\"text\" class=\"form-control\" id=\"name\" required>\n  </div>\n  <div class=\"form-group\">\n    <label for=\"email\">Email address:</label>\n    <input type=\"email\" class=\"form-control\" id=\"email\" required>\n  </div>\n  <div class=\"form-group\">\n    <label for=\"message\">Message:</label>\n    <textarea class=\"form-control\" rows=\"5\" id=\"message\" required></textarea>\n  </div>\n  <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n</form>\n```\n\nCSS code:\n\n```\n.form-group {\n  margin-bottom: 20px;\n}\n\nlabel {\n  display: block;\n  margin-bottom: 5px;\n}\n\ntextarea {\n  resize: none;\n}\n\n.btn {\n  display: block;\n  margin-top: 20px;\n}\n```\n\nJavaScript code:\n\n```\nconst form = document.getElementById(\"contact-form\");\nconst name = document.getElementById(\"name\");\nconst email = document.getElementById(\"email\");\nconst message = document.getElementById(\"message\");\n\nform.addEventListener(\"submit\", function(event) {\n  event.preventDefault();\n  \n  if (name.value.trim() === \"\") {\n    alert(\"Please enter your name\");\n    name.focus();\n    return false;\n  }\n  \n  if (email.value.trim() === \"\") {\n    alert(\"Please enter your email address\");\n    email.focus();\n    return false;\n  }\n  \n  const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,5}$/;\n  if (!regex.test(email.value.trim())) {\n    alert(\"Please enter a valid email address\");\n    email.focus();\n    return false;\n  }\n  \n  if (message.value.trim() === \"\") {\n    alert(\"Please enter your message\");\n    message.focus();\n    return false;\n  }\n  \n  // Code to submit the form data to the server goes here\n  \n  alert(\"Thank you for contacting us!\");\n  form.reset();\n});\n```\n\nThis form includes basic validation for the name, email, and message fields. You can modify the CSS according to your website styling and adjust the JavaScript validation as per your requirement.', 32, 507, 539, 'code', NULL, NULL, NULL, '2023-06-17 13:52:27', '2023-06-17 13:52:27', NULL),
(270, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-vfwiv', 'Sure, here\'s how you can create a simple contact us form using HTML, CSS, and JavaScript:\n\n```\n<!DOCTYPE html>\n<html>\n<head>\n	<title>Contact Us Form</title>\n	<style>\n		body {\n			font-family: Arial, sans-serif;\n			background-color: #eee;\n		}\n		form {\n			background-color: #fff;\n			padding: 20px;\n			max-width: 500px;\n			margin: auto;\n			box-shadow: 0 0 10px rgba(0,0,0,0.2);\n			border-radius: 5px;\n		}\n		input[type=text], textarea {\n			width: 100%;\n			padding: 8px;\n			border-radius: 5px;\n			border: none;\n			margin-bottom: 10px;\n			resize: none;\n		}\n		input[type=submit] {\n			background-color: #4CAF50;\n			color: #fff;\n			padding: 10px 20px;\n			border: none;\n			border-radius: 5px;\n			cursor: pointer;\n			transition: background-color 0.2s;\n		}\n		input[type=submit]:hover {\n			background-color: #3e8e41;\n		}\n	</style>\n</head>\n<body>\n	<form>\n		<label for=\"name\">Name:</label>\n		<input type=\"text\" id=\"name\" name=\"name\" required>\n\n		<label for=\"email\">Email:</label>\n		<input type=\"text\" id=\"email\" name=\"email\" required>\n\n		<label for=\"message\">Message:</label>\n		<textarea id=\"message\" name=\"message\" required></textarea>\n\n		<input type=\"submit\" value=\"Submit\">\n	</form>\n\n	<script>\n		const form = document.querySelector(\'form\');\n		const nameInput = document.querySelector(\'#name\');\n		const emailInput = document.querySelector(\'#email\');\n		const messageInput = document.querySelector(\'#message\');\n\n		form.addEventListener(\'submit\', (event) => {\n			event.preventDefault();\n			alert(\'Name: \' + nameInput.value + \'\\nEmail: \' + emailInput.value + \'\\nMessage: \' + messageInput.value);\n			form.reset();\n		});\n	</script>\n</body>\n</html>\n```\n\nThis code will create a simple contact us form with fields for name, email, and message. When the user submits the form, it will display an alert with the values entered in the form fields. The form is styled using CSS to give it a professional look and feel.', 32, 536, 568, 'code', NULL, NULL, NULL, '2023-06-17 13:52:27', '2023-06-17 13:52:27', NULL),
(271, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-mxisp', 'Sure, here\'s an example of a simple website contact form using HTML, CSS, and JavaScript:\n\nHTML:\n```\n<form id=\"contact-form\">\n  <div class=\"form-group\">\n    <label for=\"name\">Name*</label>\n    <input type=\"text\" name=\"name\" id=\"name\" required>\n  </div>\n  <div class=\"form-group\">\n    <label for=\"email\">Email*</label>\n    <input type=\"email\" name=\"email\" id=\"email\" required>\n  </div>\n  <div class=\"form-group\">\n    <label for=\"message\">Message*</label>\n    <textarea name=\"message\" id=\"message\" required></textarea>\n  </div>\n  <button type=\"submit\">Submit</button>\n</form>\n```\n\nCSS:\n```\n.form-group {\n  margin-bottom: 20px;\n}\n\nlabel {\n  display: block;\n  font-weight: bold;\n  margin-bottom: 5px;\n}\n\ninput[type=\"text\"],\ninput[type=\"email\"],\ntextarea {\n  padding: 10px;\n  border: 1px solid #ccc;\n  border-radius: 5px;\n  width: 100%;\n}\n\nbutton[type=\"submit\"] {\n  padding: 10px 20px;\n  background-color: #007bff;\n  color: #fff;\n  border: none;\n  border-radius: 5px;\n  cursor: pointer;\n}\n```\n\nJavaScript:\n```\nconst contactForm = document.getElementById(\'contact-form\');\nconst nameInput = document.getElementById(\'name\');\nconst emailInput = document.getElementById(\'email\');\nconst messageInput = document.getElementById(\'message\');\n\ncontactForm.addEventListener(\'submit\', (e) => {\n  e.preventDefault();\n\n  const name = nameInput.value.trim();\n  const email = emailInput.value.trim();\n  const message = messageInput.value.trim();\n\n  // validate inputs\n  if (!name || !email || !message) {\n    return alert(\'Please fill in all required fields.\');\n  }\n\n  // send data to server\n  const formData = new FormData(contactForm);\n\n  fetch(\'/send-message\', {\n    method: \'POST\',\n    body: formData\n  })\n  .then(response => response.json())\n  .then(data => {\n    alert(\'Message sent successfully!\');\n    contactForm.reset();\n  })\n  .catch(error => alert(\'There was an error sending your message. Please try again later.\'));\n});\n```\n\nNote that in this example, the form data would be sent to a server-side script at the `/send-message` URL. You would need to create this server-side script yourself in order to receive and handle the form data.', 32, 542, 574, 'code', NULL, NULL, NULL, '2023-06-17 13:55:57', '2023-06-17 13:55:57', NULL),
(272, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-l5gax', 'Sure, here\'s an example of how you could create a basic contact form using HTML, CSS and JavaScript:\n\nHTML code:\n```\n<form id=\"contact-form\">\n  <label for=\"name\">Name:</label>\n  <input type=\"text\" id=\"name\" name=\"name\" required>\n  <label for=\"email\">Email:</label>\n  <input type=\"email\" id=\"email\" name=\"email\" required>\n  <label for=\"message\">Message:</label>\n  <textarea id=\"message\" name=\"message\" required></textarea>\n  <button type=\"submit\">Send</button>\n</form>\n\n<div id=\"status-message\"></div>\n```\n\nCSS code:\n```\nform {\n  display: flex;\n  flex-direction: column;\n}\n\nlabel {\n  font-weight: bold;\n  margin-bottom: 5px;\n}\n\ninput, textarea {\n  padding: 10px;\n  margin-bottom: 20px;\n  border-radius: 5px;\n  border: 1px solid #ccc;\n}\n\nbutton {\n  background-color: #4CAF50;\n  color: white;\n  padding: 10px;\n  border: none;\n  border-radius: 5px;\n  cursor: pointer;\n  transition: background-color 0.3s;\n}\n\nbutton:hover {\n  background-color: #3e8e41;\n}\n```\n\nJavaScript code:\n```\nconst form = document.getElementById(\'contact-form\');\nconst statusMessage = document.getElementById(\'status-message\');\n\nform.addEventListener(\'submit\', (event) => {\n  event.preventDefault();\n  const name = document.getElementById(\'name\').value;\n  const email = document.getElementById(\'email\').value;\n  const message = document.getElementById(\'message\').value;\n\n  fetch(\'your-email-script-url\', {\n    method: \'POST\',\n    headers: {\n      \'Content-Type\': \'application/json\'\n    },\n    body: JSON.stringify({ name, email, message })\n  })\n  .then(response => {\n    statusMessage.innerHTML = \"Thanks for getting in touch!\";\n    form.reset();\n  })\n  .catch(error => {\n    statusMessage.innerHTML = \"Oops! Something went wrong. Please try again later.\";\n  });\n});\n```\n\nThis form uses JavaScript to send the form data to a server-side script (specified in the `fetch` function), which would then process and send the email. You would need to replace \"your-email-script-url\" with the URL of your actual email sending script. Note that this is just a basic example and you would need to add server-side validation and security measures to prevent spam and ensure the form data is valid and secure.', 32, 536, 568, 'code', NULL, NULL, NULL, '2023-06-17 13:55:57', '2023-06-17 13:55:57', NULL),
(273, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-566wk', 'Sure, here are the steps to create a contact us form using HTML, CSS, and JavaScript:\n\n1. Firstly, create a new HTML file and name it \'contact-us.html\'.\n\n2. Inside the \'body\' tag, create a \'form\' tag with the \'method\' attribute set to \'post\' and \'action\' attribute set to the URL where the form data will be submitted.\n\n```\n<form method=\"post\" action=\"submit-form.php\">\n  <!-- form elements go here -->\n</form>\n```\n\n3. Inside the form tag, add the form elements such as \'input\' fields for name, email, and message, and a \'textarea\' field for the message body.\n\n```\n<label for=\"name\">Name:</label>\n<input type=\"text\" id=\"name\" name=\"name\" required>\n\n<label for=\"email\">Email:</label>\n<input type=\"email\" id=\"email\" name=\"email\" required>\n\n<label for=\"message\">Message:</label>\n<textarea id=\"message\" name=\"message\" required></textarea>\n```\n\n4. Add a submit button to the form.\n\n```\n<button type=\"submit\">Submit</button>\n```\n\n5. Next, add CSS styles to make the form look good and user-friendly.\n\n```\nform {\n  max-width: 500px;\n  margin: 0 auto;\n}\n\nlabel, input, textarea {\n  display: block;\n  margin-bottom: 10px;\n  width: 100%;\n}\n\ninput, textarea {\n  padding: 10px;\n  border-radius: 5px;\n  border: 1px solid #ccc;\n}\n\nbutton[type=\"submit\"] {\n  background-color: #4CAF50;\n  border: none;\n  color: white;\n  padding: 10px 20px;\n  text-align: center;\n  text-decoration: none;\n  display: inline-block;\n  font-size: 16px;\n  border-radius: 5px;\n  cursor: pointer;\n}\n```\n\n6. Finally, add JavaScript code to validate the form data before submitting it.\n\n```\nconst form = document.querySelector(\'form\');\nconst nameInput = document.querySelector(\'#name\');\nconst emailInput = document.querySelector(\'#email\');\nconst messageInput = document.querySelector(\'#message\');\n\nform.addEventListener(\'submit\', (event) => {\n  event.preventDefault();\n\n  const formData = {\n    name: nameInput.value,\n    email: emailInput.value,\n    message: messageInput.value\n  };\n\n  if (formData.name === \'\' || formData.email === \'\' || formData.message === \'\') {\n    alert(\'Please fill in all fields.\');\n  } else {\n    // submit the form data here using AJAX or fetch API\n    form.submit();\n  }\n});\n```\n\nThat\'s it! You now have a fully functional contact us form using HTML, CSS, and JavaScript.', 32, 577, 609, 'code', NULL, NULL, NULL, '2023-06-17 13:55:58', '2023-06-17 13:55:58', NULL),
(274, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'landing page', 'landing-page-tq0ja', 'Sure, here\'s a basic landing page code for your new payment processing startup:\n\n```\n<!DOCTYPE html>\n<html>\n  <head>\n    <title>Process Payments with ease - PaymentX</title>\n    <meta name=\"description\" content=\"PaymentX helps you process your payments with ease. Sign up now and get started!\">\n  </head>\n  <body>\n    <nav>\n      <a href=\"#features\">Features</a>\n      <a href=\"#pricing\">Pricing</a>\n      <a href=\"#signup\">Sign Up</a>\n    </nav>\n    <header>\n      <h1>PaymentX</h1>\n      <p>Process Your Payments with Ease</p>\n    </header>\n    <section id=\"features\">\n      <h2>Features</h2>\n      <ul>\n        <li>Secure Payment Processing</li>\n        <li>Fraud Protection</li>\n        <li>Customizable Checkout Forms</li>\n        <li>No Hidden Fees</li>\n        <li>24/7 Customer Support</li>\n      </ul>\n    </section>\n    <section id=\"pricing\">\n      <h2>Pricing</h2>\n      <ul>\n        <li>Starter - $19/month</li>\n        <li>Business - $49/month</li>\n        <li>Enterprise - Call for Pricing</li>\n      </ul>\n    </section>\n    <section id=\"signup\">\n      <h2>Sign Up Now</h2>\n      <form>\n        <label for=\"name\">Name:</label>\n        <input type=\"text\" id=\"name\" name=\"name\" required>\n        <label for=\"email\">Email:</label>\n        <input type=\"email\" id=\"email\" name=\"email\" required>\n        <label for=\"password\">Password:</label>\n        <input type=\"password\" id=\"password\" name=\"password\" required>\n        <button type=\"submit\">Sign Up</button>\n      </form>\n    </section>\n    <footer>\n      <ul>\n        <li><a href=\"#\">Terms of Service</a></li>\n        <li><a href=\"#\">Privacy Policy</a></li>\n        <li><a href=\"#\">Contact Us</a></li>\n      </ul>\n      <p>&copy; PaymentX 2021</p>\n    </footer>\n  </body>\n</html>\n```\n\nThis landing page consists of a header, a navigation bar, three sections (Features, Pricing, and Sign Up), and a footer. The Features section lists the benefits of using PaymentX, the Pricing section shows the different pricing packages, and the Sign Up section has a form for users to sign up for your payment processing service.\n\nYou can customize this code to suit your startup\'s design and branding. Good luck with your new startup!', 38, 593, 631, 'code', NULL, NULL, NULL, '2023-06-17 14:02:34', '2023-06-17 14:02:34', NULL),
(275, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'website', 'website-v6yf1', 'Sure, here is a simple example of a website home page for a self podcasting website using HTML, CSS, and JS:\n\nHTML Code:\n\n```\n<!DOCTYPE html>\n<html>\n  <head>\n    <title>Self Podcasting</title>\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n  </head>\n  <body>\n    <header>\n      <h1>Self Podcasting</h1>\n      <nav>\n        <ul>\n          <li><a href=\"#\">Home</a></li>\n          <li><a href=\"#\">Episodes</a></li>\n          <li><a href=\"#\">About</a></li>\n        </ul>\n      </nav>\n    </header>\n    <main>\n      <div id=\"jumbotron\">\n        <h2>Welcome to Self Podcasting</h2>\n        <p>Keep up with all of your favorite podcasts or start your own today!</p>\n      </div>\n      <div id=\"content\">\n        <div class=\"post\">\n          <img src=\"image1.jpg\">\n          <h3>Episode 1: Getting Started</h3>\n          <p>Join us as we explore the ins and outs of starting your own podcast.</p>\n        </div>\n        <div class=\"post\">\n          <img src=\"image2.jpg\">\n          <h3>Episode 2: Finding Your Niche</h3>\n          <p>Discover how to find your niche and create a successful podcast.</p>\n        </div>\n        <div class=\"post\">\n          <img src=\"image3.jpg\">\n          <h3>Episode 3: Building Your Audience</h3>\n          <p>Learn how to build and engage your audience for maximum impact.</p>\n        </div>\n      </div>\n    </main>\n    <footer>\n      <p>&copy; 2021 Self Podcasting. All rights reserved.</p>\n    </footer>\n    <script src=\"script.js\"></script>\n  </body>\n</html>\n```\n\nCSS Code:\n\n```\nbody {\n  font-family: Arial, sans-serif;\n  margin: 0;\n  padding: 0;\n}\n\nheader {\n  background-color: #333;\n  color: #fff;\n  display: flex;\n  justify-content: space-between;\n  align-items: center;\n  padding: 1rem;\n}\n\nnav ul {\n  list-style: none;\n  display: flex;\n  gap: 1rem;\n  margin: 0;\n  padding: 0;\n}\n\nnav li a {\n  color: #fff;\n  text-decoration: none;\n  transition: color 0.3s ease-in-out;\n}\n\nnav li a:hover {\n  color: #ccc;\n}\n\nmain {\n  max-width: 1000px;\n  margin: 0 auto;\n}\n\n#jumbotron {\n  background-image: url(\'jumbotron.jpg\');\n  background-size: cover;\n  background-position: center;\n  color: #fff;\n  text-align: center;\n  padding: 5rem 0;\n  margin-bottom: 2rem;\n}\n\n#jumbotron h2 {\n  font-size: 3rem;\n  margin-bottom: 2rem;\n}\n\n#content {\n  display: grid;\n  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));\n  gap: 2rem;\n}\n\n.post {\n  border: 1px solid #ccc;\n  padding: 1rem;\n}\n\n.post img {\n  max-width: 100%;\n}\n\n.post h3 {\n  margin: 1rem 0;\n}\n\nfooter {\n  background-color: #333;\n  color: #fff;\n  text-align: center;\n  padding: 1rem;\n}\n```\n\nJS Code:\n\n```\n// This is where your JS code can go if you need it for anything\n```\n\nThis will give you a basic layout with a header, main content section, and footer, as well as some basic styling to get you started. You\'ll need to replace the image sources with your own images, and update the episode titles and descriptions as needed. You can also add additional content sections or features as needed.', 44, 865, 909, 'code', NULL, NULL, NULL, '2023-06-17 14:07:10', '2023-06-17 14:07:10', NULL),
(276, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'nav', 'nav-7i61k', 'Here\'s the code to add two columns with a 1px cap using CSS:\n\n```\n<style>\n    .wrapper {\n        display: flex;\n        justify-content: space-between;\n        border-top: 1px solid black;\n        border-bottom: 1px solid black;\n    }\n    \n    .column {\n        width: 50%;\n        display: flex;\n        align-items: center;\n        justify-content: center;\n        text-align: center;\n        border-left: 1px solid black;\n        border-right: 1px solid black;\n    }\n    \n    .column:first-child {\n        border-left: none;\n    }\n    \n    .column:last-child {\n        border-right: none;\n    }\n</style>\n\n<div class=\"wrapper\">\n    <div class=\"column\">Column 1</div>\n    <div class=\"column\">Column 2</div>\n</div>\n```\n\nYou can adjust the width of the columns and the color of the border to fit your needs.', 29, 203, 232, 'code', NULL, NULL, NULL, '2023-06-17 14:08:32', '2023-06-17 14:08:32', NULL),
(277, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'php', 'php-pzmvt', 'Sure, what kind of AI platform are you looking for? Are you looking for a pre-built AI platform or do you want to build a custom solution? Also, what specific functionalities are you looking for in this platform?', 24, 44, 68, 'code', NULL, NULL, NULL, '2023-06-17 14:09:41', '2023-06-17 14:09:41', NULL),
(278, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'php', 'php-ylilt', 'Great, what kind of AI platform are you looking for? There are many different types of AI platforms out there, each with their own advantages and limitations. Some popular options include chatbot platforms, machine learning platforms, and natural language processing platforms. Do you have a specific use case in mind that you want to build an AI platform for?', 24, 68, 92, 'code', NULL, NULL, NULL, '2023-06-17 14:09:43', '2023-06-17 14:09:43', NULL),
(279, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'php', 'php-apebl', 'Great! What do you need help with in terms of setting up an ecommerce website? I can assist you with the development of the website, choosing a platform, payment gateway integration, and much more.', 25, 40, 65, 'code', NULL, NULL, NULL, '2023-06-17 14:10:05', '2023-06-17 14:10:05', NULL),
(280, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'php', 'php-t5v3q', 'Okay, I can definitely help you with that. What would you like to achieve in terms of ecommerce? Do you need help building an online store, setting up payment gateways, integrating with shipping carriers, or perhaps creating a custom checkout process? Let me know what you need and I\'ll do my best to assist you.', 25, 65, 90, 'code', NULL, NULL, NULL, '2023-06-17 14:10:07', '2023-06-17 14:10:07', NULL),
(281, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'php', 'php-aizx4', 'Sure! Here are the basic steps to set up a basic e-commerce website using Gull:\n\n1. Install Gull and set up a basic template that includes an e-commerce page.\n\n2. Set up a database to store your product information. You can use MySQL or a similar database management system.\n\n3. Create pages to display your products, including images, descriptions, and pricing.\n\n4. Implement a shopping cart system that allows your users to add products to their cart and check out.\n\n5. Integrate a payment gateway, such as PayPal or Stripe, to accept payments from your customers.\n\n6. Set up a shipping system and calculate shipping costs based on the weight and location of the package.\n\n7. Create an order management system that allows you to track and manage orders, process refunds and cancellations, and update inventory levels.\n\n8. Implement security measures to protect user information and prevent fraud.\n\n9. Test your website thoroughly to identify and fix any bugs or issues.\n\n10. Launch your website and begin marketing your products to attract customers!', 30, 209, 239, 'code', NULL, NULL, NULL, '2023-06-17 14:10:32', '2023-06-17 14:10:32', NULL),
(282, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'website', 'website-emjr8', 'Sure, let\'s get started. \n\nFirst, let\'s create the HTML structure for the home page. \n\n```html\n<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title>My Self Podcasting Website</title>\n  </head>\n  <body>\n    <header>\n      <nav>\n        <ul>\n          <li><a href=\"#\">Home</a></li>\n          <li><a href=\"#\">About</a></li>\n          <li><a href=\"#\">Episodes</a></li>\n        </ul>\n      </nav>\n    </header>\n    <main>\n      <section class=\"slider\">\n        <div class=\"slide\">\n          <img src=\"image1.jpg\" alt=\"Slider Image 1\" />\n        </div>\n        <div class=\"slide\">\n          <img src=\"image2.jpg\" alt=\"Slider Image 2\" />\n        </div>\n        <div class=\"slide\">\n          <img src=\"image3.jpg\" alt=\"Slider Image 3\" />\n        </div>\n      </section>\n      <section class=\"related-content\">\n        <h2>Related Content</h2>\n        <div class=\"content\">\n          <div class=\"card\">\n            <a href=\"#\">\n              <img src=\"related-content1.jpg\" alt=\"Related Content 1\" />\n              <h3>Related Content 1 Title</h3>\n              <p>Related Content 1 Description</p>\n            </a>\n          </div>\n          <div class=\"card\">\n            <a href=\"#\">\n              <img src=\"related-content2.jpg\" alt=\"Related Content 2\" />\n              <h3>Related Content 2 Title</h3>\n              <p>Related Content 2 Description</p>\n            </a>\n          </div>\n          <div class=\"card\">\n            <a href=\"#\">\n              <img src=\"related-content3.jpg\" alt=\"Related Content 3\" />\n              <h3>Related Content 3 Title</h3>\n              <p>Related Content 3 Description</p>\n            </a>\n          </div>\n        </div>\n      </section>\n    </main>\n  </body>\n</html>\n```\n\nNext, let\'s add some CSS to style the page.\n\n```css\nbody {\n  margin: 0;\n  font-family: Arial, sans-serif;\n}\n\nheader {\n  background-color: #333;\n  color: #fff;\n  padding: 10px;\n}\n\nnav ul {\n  margin: 0;\n  padding: 0;\n  list-style: none;\n}\n\nnav li {\n  display: inline-block;\n  margin-right: 20px;\n}\n\nnav a {\n  color: #fff;\n  text-decoration: none;\n}\n\nnav a:hover {\n  text-decoration: underline;\n}\n\n.slider {\n  position: relative;\n  height: 500px;\n  overflow: hidden;\n}\n\n.slide {\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 100%;\n  height: 100%;\n}\n\n.slide img {\n  height: 100%;\n  width: 100%;\n  object-fit: cover;\n}\n\n.related-content {\n  padding: 20px;\n}\n\n.content {\n  display: flex;\n}\n\n.card {\n  width: 300px;\n  height: 400px;\n  margin-right: 20px;\n  border-radius: 5px;\n  overflow: hidden;\n  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);\n}\n\n.card img {\n  height: 200px;\n  width: 100%;\n  object-fit: cover;\n}\n\n.card h3 {\n  margin: 10px;\n}\n\n.card p {\n  margin: 10px;\n}\n```\n\nFinally, let\'s add the JavaScript code to create a slider for the images.\n\n```javascript\nconst slider = document.querySelector(\".slider\");\nconst slides = slider.children;\nconst slideCount = slides.length;\nlet currentSlide = 0;\n\nfunction showSlide(index) {\n  if (index < 0) {\n    index = slideCount - 1;\n  } else if (index >= slideCount) {\n    index = 0;\n  }\n  for (let i = 0; i < slideCount; i++) {\n    if (i === index) {\n      slides[i].style.display = \"block\";\n    } else {\n      slides[i].style.display = \"none\";\n    }\n  }\n  currentSlide = index;\n}\n\nshowSlide(currentSlide);\n\nsetInterval(function () {\n  showSlide(currentSlide + 1);\n}, 5000);\n```\n\nAnd that\'s it! You now have a simple website home page for a self podcasting website with a slider and related content, created using HTML, CSS, and JavaScript.', 44, 1030, 1074, 'code', NULL, NULL, NULL, '2023-06-17 14:13:13', '2023-06-17 14:13:13', NULL),
(283, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'website', 'website-xuadz', 'Sure, I can help you with that. Here is a simple website home page for a self podcasting website with slider images and related content using HTML, CSS, and JS:\n\nHTML Code:\n\n```\n<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\n    <title>Self Podcasting Website</title>\n    <link\n      rel=\"stylesheet\"\n      href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\"\n      integrity=\"sha384-DmY9XVnYAoewn1Nk2nFj4y3lcVwK/swUa/XhXpPkW1kiMPrCIW2Rs45bKk9gJQ7N\"\n      crossorigin=\"anonymous\"\n    />\n    <link rel=\"stylesheet\" href=\"style.css\" />\n  </head>\n  <body>\n    <!-- Navigation Bar -->\n    <nav class=\"navbar navbar-expand-md navbar-dark bg-dark sticky-top\">\n      <a class=\"navbar-brand\" href=\"#\">Self Podcast</a>\n      <button\n        class=\"navbar-toggler\"\n        type=\"button\"\n        data-toggle=\"collapse\"\n        data-target=\"#navbarResponsive\"\n      >\n        <span class=\"navbar-toggler-icon\"></span>\n      </button>\n      <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\n        <ul class=\"navbar-nav ml-auto\">\n          <li class=\"nav-item\">\n            <a class=\"nav-link\" href=\"#\">Home</a>\n          </li>\n          <li class=\"nav-item\">\n            <a class=\"nav-link\" href=\"#\">Episodes</a>\n          </li>\n          <li class=\"nav-item\">\n            <a class=\"nav-link\" href=\"#\">About</a>\n          </li>\n          <li class=\"nav-item\">\n            <a class=\"nav-link\" href=\"#\">Contact</a>\n          </li>\n        </ul>\n      </div>\n    </nav>\n\n    <!-- Slider -->\n    <div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-ride=\"carousel\">\n      <ol class=\"carousel-indicators\">\n        <li data-target=\"#carouselExampleIndicators\" data-slide-to=\"0\" class=\"active\"></li>\n        <li data-target=\"#carouselExampleIndicators\" data-slide-to=\"1\"></li>\n        <li data-target=\"#carouselExampleIndicators\" data-slide-to=\"2\"></li>\n      </ol>\n      <div class=\"carousel-inner\">\n        <div class=\"carousel-item active\">\n          <img src=\"https://source.unsplash.com/1600x900/?podcast\" class=\"d-block w-100\" alt=\"...\">\n          <div class=\"carousel-caption d-none d-md-block\">\n            <h5>Episode 1: Introduction</h5>\n            <p>A brief introduction to the Self Podcast.</p>\n          </div>\n        </div>\n        <div class=\"carousel-item\">\n          <img src=\"https://source.unsplash.com/1600x900/?microphone\" class=\"d-block w-100\" alt=\"...\">\n          <div class=\"carousel-caption d-none d-md-block\">\n            <h5>Episode 2: Finding your voice</h5>\n            <p>Learn how to find your authentic voice for your podcast.</p>\n          </div>\n        </div>\n        <div class=\"carousel-item\">\n          <img src=\"https://source.unsplash.com/1600x900/?recording\" class=\"d-block w-100\" alt=\"...\">\n          <div class=\"carousel-caption d-none d-md-block\">\n            <h5>Episode 3: Recording equipment</h5>\n            <p>Choosing the right recording equipment for your podcast.</p>\n          </div>\n        </div>\n      </div>\n      <a class=\"carousel-control-prev\" href=\"#carouselExampleIndicators\" role=\"button\" data-slide=\"prev\">\n        <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n        <span class=\"sr-only\">Previous</span>\n      </a>\n      <a class=\"carousel-control-next\" href=\"#carouselExampleIndicators\" role=\"button\" data-slide=\"next\">\n        <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n        <span class=\"sr-only\">Next</span>\n      </a>\n    </div>\n\n    <!-- Main Content -->\n    <div class=\"container-fluid padding\">\n      <div class=\"row welcome text-center\">\n        <div class=\"col-12\">\n          <h1 class=\"display-4\">Welcome to the Self Podcast</h1>\n        </div>\n        <div class=\"col-12\">\n          <hr />\n          <p class=\"lead\">\n            The Self Podcast is a podcast about self-improvement, personal development, and self-awareness. Join us as we explore different topics related to personal growth and share practical tips and insights to help you become the best version of yourself.\n          </p>\n        </div>\n      </div>\n    </div>\n\n    <!-- Related Content -->\n    <div class=\"container-fluid padding\">\n      <div class=\"row text-center padding\">\n        <div class=\"col-xs-12 col-sm-6 col-md-4\">\n          <img src=\"https://source.unsplash.com/600x600/?self-awareness\" alt=\"self-awareness\" />\n          <h3>Self-Awareness</h3>\n          <p>Learn how to become more self-aware and mindful of your thoughts and emotions to achieve greater success and happiness.</p>\n        </div>\n        <div class=\"col-xs-12 col-sm-6 col-md-4\">\n          <img src=\"https://source.unsplash.com/600x600/?productivity\" alt=\"productivity\" />\n          <h3>Productivity</h3>\n          <p>Discover strategies and techniques to improve your productivity and achieve more in less time.</p>\n        </div>\n        <div class=\"col-xs-12 col-sm-12 col-md-4\">\n          <img src=\"https://source.unsplash.com/600x600/?motivation\" alt=\"motivation\" />\n          <h3>Motivation</h3>\n          <p>Stay motivated and energized to pursue your goals and dreams with passion and enthusiasm.</p>\n        </div>\n      </div>\n    </div>\n\n    <!-- Footer -->\n    <footer>\n      <div class=\"container-fluid padding\">\n        <div class=\"row text-center\">\n          <div class=\"col-md-4\">\n            <img src=\"logo.png\" />\n            <hr class=\"light\" />\n            <p>Email us at info@selfpodcast.com</p>\n            <p>Call us at 555-555-5555</p>\n            <p>123 Main Street</p>\n            <p>New York, NY 10001</p>\n          </div>\n          <div class=\"col-md-4\">\n            <hr class=\"light\" />\n            <h5>Our Hours</h5>\n            <hr class=\"light\" />\n            <p>Monday to Friday: 9am - 5pm</p>\n            <p>Saturday and Sunday: Closed</p>\n          </div>\n          <div class=\"col-md-4\">\n            <hr class=\"light\" />\n            <h5>Connect With Us</h5>\n            <hr class=\"light\" />\n            <a href=\"#\"><i class=\"fab fa-facebook-square\"></i></a>\n            <a href=\"#\"><i class=\"fab fa-twitter-square\"></i></a>\n            <a href=\"#\"><i class=\"fab fa-instagram-square\"></i></a>\n            <a href=\"#\"><i class=\"fab fa-youtube-square\"></i></a>\n          </div>\n          <div class=\"col-12\">\n            <hr class=\"light-100\" />\n            <h5>&copy; selfpodcast.com</h5>\n          </div>\n        </div>\n      </div>\n    </footer>\n\n    <!-- JavaScript Libraries -->\n    <script\n      src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"\n      integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\"\n      crossorigin=\"anonymous\"\n    ></script>\n    <script\n      src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/esm/popper\"\n      integrity=\"sha384-OkYLfrvxlrBSXnHuFV7jqGZe+eRFx/14jG7tt2ZvqhtC7G1LKtTI00mao/Af9ud2\"\n      crossorigin=\"anonymous\"\n    ></script>\n    <script\n      src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"\n      integrity=\"sha384-OgVRvuATP1kdLJr6sZUPtFzGgHYiKPF99PyI6f6+pQUivt4eYAVRToxinM4LOwEy\"\n      crossorigin=\"anonymous\"\n    ></script>\n  </body>\n</html>\n```\n\nCSS Code:\n\n```\n/* Navigation Bar */\n.navbar {\n  background-color: #3d3d3d;\n}\n\n.navbar-brand {\n  color: #ffffff;\n}\n\n.nav-link {\n  color: #ffffff;\n}\n\n/* Slider */\n.carousel-caption {\n  background-color: rgba(255, 255, 255, 0.7);\n  padding: 20px;\n}\n\n.carousel-caption h5 {\n  color: #000000;\n}\n\n.carousel-caption p {\n  color: #000000;\n}\n\n/* Main Content */\n.welcome {\n  margin-top: 100px;\n}\n\n.padding {\n  padding-bottom: 3rem;\n}\n\n.display-4 {\n  font-weight: bold;\n}\n\n.lead {\n  font-size: 1.2rem;\n}\n\n/* Related Content */\n.padding {\n  padding-top: 3rem;\n}\n\n.col-xs-12,\n.col-sm-6,\n.col-md-4 {\n  padding: 0.5rem;\n}\n\n.padding img {\n  margin-top: 1rem;\n  margin-bottom: 1rem;\n}\n\n/* Footer */\nfooter {\n  background-color: #3d3d3d;\n  color: #ffffff;\n  padding-top: 3rem;\n}\n\nhr.light {\n  border-top: 1px solid #ffffff;\n}\n\nhr.light-100 {\n  border-top: 1px solid #d9d9d9;\n}\n\n.col-md-4 {\n  text-align: center;\n}\n\n.col-md-4 img {\n  margin-bottom: 1rem;\n}\n\nfooter a {\n  color: #ffffff;\n}\n\nfooter a:hover {\n  color: #d9d9d9;\n}\n\nh5 {\n  font-size: 1.2rem;\n  font-weight: bold;\n}\n```\n\nJS Code:\n\n```\n// Initialize the Bootstrap carousel\n$(\'.carousel\').carousel()\n```\n\nNote: Don\'t forget to include the relevant image files and font awesome icons. You can use any image you like for the slider and related content. Also, make sure to replace the placeholder texts with your own content.', 44, 2402, 2446, 'code', NULL, NULL, NULL, '2023-06-17 14:14:45', '2023-06-17 14:14:45', NULL),
(284, 2, NULL, 2, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-abwjr', '<b>[Output-1]</b><br/>1. Believing in a Higher Power: How to Stay in Faith<br/>2. The Power of Believing: What Jesus Can Do for You<br/>3. Faith and Miracles: How Jesus Can Change Your Life<br/>4. The Importance of Trust: How to Keep Your Faith Strong in Difficult Times<br/>5. The Simple Truth: Believing in Jesus <br/>6. Unwavering Faith: Tips on Staying Committed to Your Spiritual Path <br/>7. Discovering the Miraculous Power of Jesus: A Personal Journey<br/>8. The Gift of Faith: How Trusting in Jesus Can Transform Your Life<br/>9. Keep the Faith: Encouragement and Support for Christians<br/>10. The Power of Prayer in Strengthening Your Faith in Jesus.<br/><br/><br/><b>[Output-2]</b><br/>1. 5 Simple Ways to Stay in Faith, Even When It\'s Hard<br/><br/>2. How Trusting in Jesus Can Help You Overcome Any Challenge<br/><br/>3. The Power of Believing that Jesus Can Do Everything<br/><br/>4. From Doubt to Faith: How to Keep Your Belief Strong in Tough Times<br/><br/>5. Discovering the Miracle of Faith in Jesus<br/><br/>6. 10 Inspirational Tips for Staying Connected to Your Faith<br/><br/>7. Exploring the Wonders of Faith and Trust in Jesus<br/><br/>8. How to Let Jesus Take Control and Lead You to Success<br/><br/>9. The Beauty of Believing in Jesus: A Journey of Faith and Hope<br/><br/>10. From Fear to Faith: How to Overcome Your Worries with the Help of Jesus.<br/><br/><br/><b>[Output-3]</b><br/>1. \"10 Ways to Strengthen Your Faith and Trust in Jesus\"<br/>2. \"The Power of Believing: How Jesus Can Help You Through Any Struggle\"<br/>3. \"Faith over Fear: Finding Courage in Jesus\' Promises\"<br/>4. \"The Miracles of Jesus: How They Can Inspire Your Faith Today\"<br/>5. \"From Doubt to Devotion: A Personal Journey of Trusting in Jesus\"<br/>6. \"The Importance of Prayer in Staying Grounded in Faith\"<br/>7. \"Trusting God\'s Plan: Lessons from the Life of Jesus\"<br/>8. \"A Beginner\'s Guide to Building a Strong Relationship with Jesus\"<br/>9. \"How to Encourage Others in Their Faith through Jesus\' Teachings\"<br/>10. \"The Difference Jesus Can Make in Your Life: Stories of Transformation and Healing\".<br/><br/><br/><b>[Output-4]</b><br/>1. \"5 Ways to Stay Faithful in Challenging Times: Lessons from Jesus\"<br/>2. \"The Power of Belief: How Trusting in Jesus Can Change Your Life\"<br/>3. \"Discovering the Unimaginable: How Jesus Can Do All Things\"<br/>4. \"Faith in Action: Stories of People Who Trusted Jesus and Overcame\"<br/>5. \"Overcoming Doubt: How to Keep Your Faith in Jesus Strong\"<br/>6. \"The Unprecedented Strength of Jesus: Exploring His Miracles\"<br/>7. \"Foundations of Faith: Why Trusting in Jesus is Essential for Spiritual Growth\"<br/>8. \"How to Find Comfort and Guidance Through Jesus\' Words\"<br/>9. \"The Power of Prayer: How Connecting with Jesus Can Transform Your Life\"<br/>10. \"The Joy of Trusting in Jesus: Lessons from Those Who Have Found Peace in Faith\"<br/><br/><br/><b>[Output-5]</b><br/>1. \"Why Trusting in Jesus Helps You Stay in Faith During Tough Times\"<br/>2. \"The Power of Believing in Jesus: How it Can Make a Difference in Your Life\"<br/>3. \"Faith Beyond Limits: How to Keep Trusting in Jesus Despite the Circumstances\"<br/>4. \"In Jesus We Trust: How to Cultivate a Stronger Faith and Relationship with God\"<br/>5. \"The Miracle-Working Power of Jesus: How to Tap into His Unlimited Potential\"<br/>6. \"Living Life with Faith: The Benefits of Putting Your Trust in Jesus\"<br/>7. \"The Ultimate Source of Hope: How Jesus Can Help You Overcome Any Obstacle\"<br/>8. \"Trusting in Jesus: A Guide to Maintaining a Strong Faith Through Life\'s Ups and Downs\"<br/>9. \"Seeking Strength in Belief: How to Find Encouragement through Jesus\"<br/>10. \"The Comfort and Support of Jesus: How to Stay Strong in Your Faith No Matter What\".<br/><br/><br/>', 45, 852, 897, 'content', NULL, NULL, NULL, '2023-06-17 14:43:50', '2023-06-17 14:43:50', NULL),
(285, 2, NULL, 8, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-7jogh', 'Dear Arik Rahaman,<br/><br/>I hope this email finds you well. I am writing to confirm our collaboration with you as an influencer for our upcoming marketing campaign. We are thrilled to be working with you and we strongly believe that your online presence and influence will contribute significantly to the success of our brand.<br/><br/>We are confident that this collaboration will be a great opportunity for both of us to reach a wider audience and bring more exposure to our products. We are excited to see the content you will create for us, and we cannot wait to work with you.<br/><br/>Thank you for partnering with us, and we look forward to working with you in the near future.<br/><br/>Best regards,<br/><br/>[Your Name]', 50, 138, 188, 'content', NULL, NULL, NULL, '2023-06-17 15:05:32', '2023-06-17 15:05:32', NULL),
(286, 2, NULL, 32, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-cbpvp', 'Trusting in Jesus during tough times can provide the strength and comfort needed to overcome any obstacle. Whether you are sick or struggling financially, having faith in God can give you the hope you need to persevere. Jesus taught his followers to trust in him, even when times get tough. He has promised to never leave us nor forsake us. Consequently, when you put your faith in Jesus Christ, you experience a heightened sense of purpose and direction. You feel like you have a friend walking alongside you. So no matter how dire your circumstances may seem, trust in Jesus. His peace that surpasses all understanding will guard your heart and mind through Christ Jesus. The power of his love and his unwavering commitment to you will keep you in faith, pushing you towards victory.', 59, 156, 215, 'content', NULL, NULL, NULL, '2023-06-17 15:13:11', '2023-06-17 15:13:11', NULL),
(287, 2, NULL, 32, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-qb6cs', 'It can be a challenge to maintain faith when faced with difficult circumstances. However, there are ways to keep trusting in Jesus and have faith beyond limits. Here are five points to consider. Firstly, try to focus on the positive aspects of your situation and look for the blessings in disguise. Secondly, seek support from your Christian community and surround yourself with like-minded people who can offer encouragement and prayers. Thirdly, deepen your relationship with God through prayer and reading the Bible, and ask for guidance and strength during hard times. Fourthly, try to see challenges as opportunities for growth and learning, and trust that God has a plan for your life. Finally, remember to surrender your worries and concerns to Jesus, and trust in His love and grace. Having faith beyond limits may not be easy, but with these five points in mind, it is possible to maintain trust in Jesus despite any circumstances.', 68, 161, 238, 'content', NULL, NULL, NULL, '2023-06-17 15:15:36', '2023-06-17 16:00:20', NULL),
(288, 1, NULL, 37, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-xsxxc', 'Hello Diego! Thank you for your message. When I ran into Miguel, he was just waiting for the bus to the airport. My friend was returning from the US and I wanted to give her a warm welcome. But since Miguel and I hadn\'t seen each other in a long time, I decided to invite him for an ice cream at a nearby Italian bar. We had a wonderful time together and shared our summer stories. Plus, the ice cream was delicious! In the end, I lost track of time and had to take a taxi to the airport. It was expensive but worth it. Since we both probably have holidays in Christmas, I thought of coming to Barcelona during that time. What do you think? See you soon, regards.', 214, 149, 363, 'content', NULL, NULL, NULL, '2023-06-17 15:16:49', '2023-06-17 15:16:49', NULL);
INSERT INTO `projects` (`id`, `user_id`, `folder_id`, `template_id`, `custom_template_id`, `model_name`, `title`, `slug`, `content`, `prompts`, `completion`, `words`, `content_type`, `resolution`, `audio_file`, `text_to_speech_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(289, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'form', 'form-6esuq', 'Sure! Here\'s a basic contact form you can use as a starting point:\n\n```HTML\n<form action=\"submit-form.php\" method=\"post\">\n  <label for=\"name\">Name:</label>\n  <input type=\"text\" id=\"name\" name=\"name\" required>\n  \n  <label for=\"email\">Email:</label>\n  <input type=\"email\" id=\"email\" name=\"email\" required>\n  \n  <label for=\"subject\">Subject:</label>\n  <input type=\"text\" id=\"subject\" name=\"subject\" required>\n  \n  <label for=\"message\">Message:</label>\n  <textarea id=\"message\" name=\"message\" required></textarea>\n  \n  <button type=\"submit\">Send</button>\n</form>\n```\n\nThis creates a form with input fields for name, email, subject, and message, as well as a submit button. The `required` attribute is included on each field to ensure that the user provides all the necessary information. \n\nThe `action` attribute on the `form` tag specifies where the form data should be sent when the user submits it, and the `method` attribute specifies the HTTP request method (in this case, POST).\n\nYou\'ll need to create a `submit-form.php` file to handle the form submission and send the email or save the data as needed. There are many different ways to do this depending on your server-side technology, so I won\'t include that code here.', 26, 301, 327, 'code', NULL, NULL, NULL, '2023-06-17 15:33:33', '2023-06-17 15:33:33', NULL),
(290, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Sql', 'sql-dgyfo', 'Sure, here\'s an example code for selecting data from two tables using JOIN and INNER JOIN:\n\n```\nSELECT t1.column1, t2.column2\nFROM table1 t1\nJOIN table2 t2\nON t1.id = t2.table1_id\n```\n\nIn this example, \"table1\" and \"table2\" are the names of the two tables being selected from. The \"JOIN\" keyword specifies that we want to join both tables based on a common column, which in this case is \"id\" from table1 and \"table1_id\" from table2. \n\nThe \"t1\" and \"t2\" aliases are used to simplify the syntax when referring to column names. \n\nThe SELECT statement specifies which columns we want to retrieve from the two tables. In this example, we are selecting \"column1\" from table1 and \"column2\" from table2. \n\nThis code will return a result set that contains the selected columns for all rows where the join condition is true. The INNER JOIN only returns rows where there is a matching row in both tables - i.e., if there is no match in either table for a given row, that row will not be included in the result set.', 32, 250, 282, 'code', NULL, NULL, NULL, '2023-06-17 16:25:18', '2023-06-17 16:25:18', NULL),
(291, 1, NULL, NULL, NULL, 'gpt-3.5-turbo', 'Python Django', 'python-django-lozdq', 'Here\'s a simple Python class for an Image Upload Model that you can use as a reference:\n\n```python\nimport uuid\nfrom django.db import models\n\ndef image_upload_path(instance, filename):\n    # Generate a unique filename\n    ext = filename.split(\'.\')[-1]\n    filename = f\'{uuid.uuid4().hex}.{ext}\'\n\n    # Return the full upload path\n    return f\'{instance.__class__.__name__}/{filename}\'\n\nclass ImageUpload(models.Model):\n    caption = models.CharField(max_length=255, blank=True, null=True)\n    image = models.ImageField(upload_to=image_upload_path)\n    created_at = models.DateTimeField(auto_now_add=True)\n    updated_at = models.DateTimeField(auto_now=True)\n\n    def __str__(self):\n        return self.caption or self.image.name\n```\n\nIn this example, an uploaded image will be saved in a subdirectory based on the model\'s class name and with a unique filename generated by `uuid.uuid4().hex`. The `caption` field is optional and can be used to store a description or title for the image. The `created_at` and `updated_at` fields will automatically store timestamps for when the model instance was created or last updated. \n\nYou can customize this model further by adding additional fields or methods to suit your needs. Keep in mind that you will need to run `python manage.py makemigrations` and `python manage.py migrate` to apply changes to your database schema.', 25, 295, 320, 'code', NULL, NULL, NULL, '2023-06-17 16:38:29', '2023-06-17 16:38:29', NULL),
(292, 1, NULL, 4, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-iiftg', 'Ciao Bella! If you\'re planning to visit Italy, you better be prepared to indulge in some of the most delicious and mouth-watering dishes in the world. The country is known for its exquisite cuisine and has been attracting foodies for centuries; from pasta to pizza, gelato to espresso, the choices are endless. In this blog post, we\'ll take you on a gastronomical journey through the heart of Italy, revealing the top dishes that any food lover must try. So, whether you have a sweet tooth or are a lover of all things savory, sit back, grab a glass of wine, and let\'s dig into what to eat in Italy.', 59, 134, 193, 'content', NULL, NULL, NULL, '2023-06-17 16:57:49', '2023-06-17 16:57:49', NULL),
(293, 1, NULL, 7, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-e1v7k', 'Az olaszországi utazásokat gyakran az isteni ételek és csodás kávézók miatt keresik az emberek. Az ország a gasztronómiai élmények kedvelőinek elképesztő ízorgiát kínál. Ha szereted az olasz konyhát, akkor látogass el Rómába, Firenzébe vagy Nápolyba, és kóstolj meg egy igazi pizzát, pastát vagy tiramisut. A friss tengeri herkentyűk és vastag sajtok is rajongókat számlálnak. Az olasz ételek és az ínycsiklandozó édességek minden ízlelőbimbódat kényeztetni fogják az utazásod során. Az olasz élmények varázslatos élményeket jelentenek.', 61, 223, 284, 'content', NULL, NULL, NULL, '2023-06-17 17:02:07', '2023-06-17 17:02:07', NULL),
(294, 2, NULL, 4, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-rxaek', 'Hello, foodies! If you\'re someone who loves to experiment with food and cooking, a mixer grinder is a must-have appliance in your kitchen. It can grind, blend, and mix all your ingredients to perfection, taking your culinary skills to the next level. And when it comes to the best mixer grinder in India, there are so many great options to choose from. Whether you\'re a professional chef or a regular home cook, a high-quality mixer grinder can make your life a lot easier. So, let\'s dive right in and explore the top mixer grinders that are ruling the Indian market right now!', 51, 123, 174, 'content', NULL, NULL, NULL, '2023-06-17 18:29:05', '2023-06-17 18:29:05', NULL),
(295, 2, NULL, 15, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-mhajj', 'Attention couples! Say hello to the latest phone from Apple - the iPhone 14! With its sleek design, advanced camera features, and lightning-fast processing speed, your mobile experience will be taken to a whole new level. Keep your love on display with crystal-clear Facetime calls and capture every special moment with ease. Don\'t miss out on the chance to elevate your digital life together. Order your new iPhone 14 now and stay connected with your significant other like never before! ❤️???? #Apple #iPhone14 #CoupleGoals #StayConnected #UpgradeNow', 64, 115, 179, 'content', NULL, NULL, NULL, '2023-06-17 18:37:54', '2023-06-17 18:37:54', NULL),
(296, 2, NULL, 8, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-qjt97', 'Dear Hasan,<br/><br/>Thank you for choosing our ecommerce platform for your shipping needs! We are delighted to confirm that your order has been received and is being processed. <br/><br/>Rest assured that we will do everything in our power to ensure that your shipping experience is as seamless and hassle-free as possible. If you have any questions or concerns along the way, please don\'t hesitate to let us know.<br/><br/>We look forward to serving you!<br/><br/>Best regards,<br/>[Your Name]', 48, 91, 139, 'content', NULL, NULL, NULL, '2023-06-17 18:43:44', '2023-06-17 18:43:44', NULL),
(297, 2, NULL, 1, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-cth6h', 'Noodles - Enjoy a Delightful Meal!<br/><br/>If you are looking for a quick and easy meal that is both delicious and filling, then look no further than noodles! Noodles are a staple food in many cultures around the world and have been enjoyed for centuries. They are made from a variety of ingredients, such as wheat, rice, and buckwheat, and can be prepared in countless ways.<br/><br/>One of the great things about noodles is their versatility. They can be served hot or cold, mixed with an assortment of sauces, vegetables, and meats, or simply enjoyed as a soup. Noodles can also be cooked to your preference - ranging from soft and chewy to firm and springy.<br/><br/>One particularly popular dish is ramen noodles, which originated in Japan. Ramen is a soup-based dish that typically includes noodles, broth, vegetables, and meat. It is often served in restaurants and is considered a delicious and comforting meal.<br/><br/>Another type of noodles that is gaining in popularity is instant noodles. These pre-packaged noodles are a quick and convenient solution for those short on time or on a tight budget. Although they are not as healthy as homemade noodles, they are a tasty and satisfying alternative.<br/><br/>Of course, noodles are not just limited', 47, 250, 297, 'content', NULL, NULL, NULL, '2023-06-17 19:11:24', '2023-06-17 19:11:24', NULL),
(298, 1, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-gaxmm', '¡Hola, chicos y chicas! ¿Alguna vez se han preguntado cómo surgieron las pollerías en el Perú? Pues hoy les voy a contar un poquito de su historia.<br/><br/>Resulta que todo empezó en los años 50, cuando un hombre llamado Roger Schuler llegó al Perú desde Suiza y decidió abrir una pequeña pollería en el distrito de San Isidro. La receta de su pollo a la brasa era tan buena, que rápidamente se hizo famosa y empezó a expandirse a otras partes del país.<br/><br/>Actualmente, las pollerías son una de las principales opciones de comida rápida en el Perú. Ya sea en restaurantes grandes o en pequeños locales en la calle, siempre encontramos un delicioso pollo a la brasa a nuestro alcance.<br/><br/>Así que ya saben, la próxima vez que vayan a una pollería en el Perú, recuerden que detrás de ese delicioso pollo hay una historia interesante y divertida de cómo llegó a ser parte de la cultura gastronómica peruana.<br/><br/>¡Espero que les haya', 49, 250, 299, 'content', NULL, NULL, NULL, '2023-06-17 19:20:53', '2023-06-17 19:20:53', NULL),
(299, 1, NULL, 53, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-2sbyu', '¡Hola, Tiktokers! Hoy quiero hablarles sobre un tema muy interesante: la historia de las pollerías en el Perú. ¿Alguna vez se han preguntado cómo surgió esta deliciosa tradición?<br/><br/>Pues resulta que la historia de las pollerías se remonta a la época de la colonia, cuando los españoles llegaron a nuestro país y trajeron consigo el pollo. Pero fue recién en la década de los 50s que se popularizó la venta de pollo asado en las calles de Lima.<br/><br/>Fue entonces cuando surgió la primera pollería, conocida como \"La Granja Azul\". A partir de ahí, la idea se propagó rápidamente por todo el país y se convirtió en un negocio próspero para muchas familias peruanas.<br/><br/>Hoy en día, las pollerías son un ícono de nuestra gastronomía. Ofrecen una gran variedad de platos, desde el clásico pollo a la brasa hasta las deliciosas guarniciones como la papa a la huancaína o el arroz con', 49, 250, 299, 'content', NULL, NULL, NULL, '2023-06-17 19:21:13', '2023-06-17 19:21:13', NULL),
(300, 2, NULL, 6, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-h85f7', '<b>[Output-1]</b><br/>1. #BestRestaurantsInRome<br/>2. #RomeEats<br/>3. #FoodieFinds<br/>4. #ItalianCuisine<br/>5. #DeliciousDining<br/>6. #LocalFlavors<br/>7. #MustVisitRestaurants<br/>8. #HiddenGems<br/>9. #FoodieHeaven<br/>10. #FriendlyFoodSpots<br/><br/><br/><b>[Output-2]</b><br/>1. #RomeEats <br/>2. #FoodieRome <br/>3. #TopRestaurantsRome <br/>4. #DineLikeALocal <br/>5. #RomeFoodTour <br/>6. #DiscoverRomeFood <br/>7. #DeliciousRome <br/>8. #ItalianCuisine <br/>9. #RomeFoodies <br/>10. #CulinaryAdventure.<br/><br/><br/>', 38, 159, 197, 'content', NULL, NULL, NULL, '2023-06-17 19:23:18', '2023-06-17 19:23:18', NULL),
(301, 1, NULL, 29, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-17', 'untitled-project-2023-06-17-zupmy', 'Looking for reliable software solutions for your business? Look no further than our website! Explore our wide range of user-friendly software options designed to optimize your operations and improve efficiency. From accounting to inventory management, we have all your business needs covered. Visit us today!', 42, 52, 94, 'content', NULL, NULL, NULL, '2023-06-17 19:25:55', '2023-06-17 19:25:55', NULL),
(302, 1, NULL, 35, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-19', 'untitled-project-2023-06-19-2hn8g', '1. AirStride<br/>2. FlexFuel<br/>3. GlideEase<br/>4. JumpStart<br/>5. SwiftStep<br/>6. AirStream<br/>7. SprintBoost<br/>8. GlideFit<br/>9. StepUp<br/>10. RunFlow.', 39, 50, 89, 'content', NULL, NULL, NULL, '2023-06-19 10:06:32', '2023-06-19 10:06:32', NULL),
(303, 2, NULL, 31, NULL, 'gpt-3.5-turbo', 'Untitled Project - 2023-06-19', 'untitled-project-2023-06-19-ey6ju', 'Are you craving sandy shores and crystal-clear waters for your next holiday? Look no further than Africa, where the continent is home to some of the most beautiful beaches in the world.<br/><br/>Starting with the east, Zanzibar, an archipelago off the coast of Tanzania, boasts some of the most stunning beaches in all of Africa. Its beaches are known for their white sands and turquoise waters, providing an idyllic paradise for tourists. Visitors can also enjoy a range of water activities such as snorkeling and diving, or simply relax and soak in the sun.<br/><br/>Further down the coastline, Mozambique offers a tropical haven for those looking to escape the hustle and bustle of city life. The country\'s beaches are lined with palm trees and provide the ultimate relaxation spot in the midst of luxurious resorts and small fishing villages. The coral reefs off the coast make for excellent snorkeling and diving spots, where visitors can witness the vibrant marine life.<br/><br/>On the opposite side of the continent, the beaches of Mauritius offer a unique blend of Indian, African, and European culture. With its turquoise waters and pristine beaches, it\'s no wonder that this tropical paradise is a popular destination for honeymooners and families alike. Activities such as swimming with dolphins and indul', 54, 250, 304, 'content', NULL, NULL, NULL, '2023-06-19 10:23:22', '2023-06-19 10:23:22', NULL),
(304, 2, NULL, NULL, NULL, 'gpt-3.5-turbo', 'ecom site', 'ecom-site-3s3gq', 'Here is a basic template for an e-commerce website using HTML, CSS, and JavaScript:\n\nHTML:\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n	<title>E-commerce Site</title>\n	<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n</head>\n<body>\n	<header>\n		<h1>E-commerce Site</h1>\n	</header>\n	<nav>\n		<ul>\n			<li><a href=\"#\">Home</a></li>\n			<li><a href=\"#\">Shop</a></li>\n			<li><a href=\"#\">About Us</a></li>\n			<li><a href=\"#\">Contact</a></li>\n		</ul>\n	</nav>\n	<main>\n		<section class=\"featured-products\">\n			<h2>Featured Products</h2>\n			<div class=\"products\">\n				<div class=\"product\">\n					<img src=\"product1.jpg\" alt=\"Product 1\">\n					<h3>Product 1</h3>\n					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n					<button>Add to Cart</button>\n				</div>\n				<div class=\"product\">\n					<img src=\"product2.jpg\" alt=\"Product 2\">\n					<h3>Product 2</h3>\n					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n					<button>Add to Cart</button>\n				</div>\n				<div class=\"product\">\n					<img src=\"product3.jpg\" alt=\"Product 3\">\n					<h3>Product 3</h3>\n					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n					<button>Add to Cart</button>\n				</div>\n			</div>\n		</section>\n		<section class=\"categories\">\n			<h2>Categories</h2>\n			<ul>\n				<li><a href=\"#\">Category 1</a></li>\n				<li><a href=\"#\">Category 2</a></li>\n				<li><a href=\"#\">Category 3</a></li>\n				<li><a href=\"#\">Category 4</a></li>\n			</ul>\n		</section>\n		<section class=\"recently-viewed\">\n			<h2>Recently Viewed</h2>\n			<div class=\"products\">\n				<div class=\"product\">\n					<img src=\"product4.jpg\" alt=\"Product 4\">\n					<h3>Product 4</h3>\n					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n					<button>Add to Cart</button>\n				</div>\n				<div class=\"product\">\n					<img src=\"product5.jpg\" alt=\"Product 5\">\n					<h3>Product 5</h3>\n					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n					<button>Add to Cart</button>\n				</div>\n				<div class=\"product\">\n					<img src=\"product6.jpg\" alt=\"Product 6\">\n					<h3>Product 6</h3>\n					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n					<button>Add to Cart</button>\n				</div>\n			</div>\n		</section>\n	</main>\n	<footer>\n		<p>&copy; E-commerce Site 2021</p>\n	</footer>\n</body>\n</html>\n```\n\nCSS:\n\n```css\nbody {\n	margin: 0;\n	padding: 0;\n	font-family: Arial, sans-serif;\n}\n\nheader, nav, main, footer {\n	display: block;\n}\n\nheader {\n	background-color: #f2f2f2;\n	padding: 20px;\n}\n\nh1 {\n	margin: 0;\n}\n\nnav ul {\n	margin: 0;\n	padding: 0;\n	list-style: none;\n	background-color: #333;\n}\n\nnav li {\n	display: inline-block;\n	padding: 10px;\n}\n\nnav a {\n	color: #fff;\n	text-decoration: none;\n}\n\n.main {\n	display: flex;\n	flex-wrap: wrap;\n}\n\n.featured-products {\n	flex: 1;\n	padding: 20px;\n}\n\n.featured-products h2 {\n	margin-top: 0;\n}\n\n.products {\n	display: flex;\n	flex-wrap: wrap;\n}\n\n.product {\n	flex: 1;\n	margin: 10px;\n	padding: 10px;\n	background-color: #f2f2f2;\n}\n\n.product img {\n	max-width: 100%;\n	margin-bottom: 10px;\n}\n\n.product h3 {\n	margin: 0;\n	font-size: 22px;\n}\n\n.product p {\n	margin: 10px 0;\n}\n\n.product button {\n	background-color: #333;\n	color: #fff;\n	padding: 10px;\n	border: none;\n	cursor: pointer;\n}\n\n.product button:hover {\n	background-color: #666;\n}\n\n.categories {\n	flex: 1;\n	padding: 20px;\n}\n\n.categories h2 {\n	margin-top: 0;\n}\n\n.categories ul {\n	margin: 0;\n	padding: 0;\n	list-style: none;\n}\n\n.categories li {\n	margin: 10px 0;\n}\n\n.categories a {\n	color: #333;\n	text-decoration: none;\n}\n\n.recently-viewed {\n	flex: 1;\n	padding: 20px;\n}\n\n.recently-viewed h2 {\n	margin-top: 0;\n}\n\n.recently-viewed .products {\n	display: flex;\n	flex-wrap: wrap;\n}\n\n.recently-viewed .product {\n	flex: 1;\n	margin: 10px;\n	padding: 10px;\n	background-color: #f2f2f2;\n}\n\nfooter {\n	background-color: #333;\n	color: #fff;\n	padding: 10px;\n	text-align: center;\n}\n```\n\nJavaScript (for adding items to the cart):\n\n```javascript\n// Select the Add to Cart buttons\nconst buttons = document.querySelectorAll(\'button\');\n\n// Add click event listeners to each button\nbuttons.forEach(button => {\n  button.addEventListener(\'click\', addToCart);\n});\n\n// Function to add item to cart\nfunction addToCart(event) {\n  const button = event.target; // Get the clicked button\n  const product = button.closest(\'.product\'); // Get the product element\n  const title = product.querySelector(\'h3\').textContent; // Get the product title\n  const price = product.querySelector(\'p\').textContent; // Get the product price\n  const imageSrc = product.querySelector(\'img\').src; // Get the product image source\n  \n  // Create a new cart item\n  const newItem = {\n    title: title,\n    price: price,\n    imageSrc: imageSrc,\n    quantity: 1\n  }\n  \n  // Check if item is already in cart\n  for (let i = 0; i < cart.length; i++) {\n    if (cart[i].title === title) {\n      cart[i].quantity++;\n      return;\n    }\n  }\n  \n  // Add item to cart\n  cart.push(newItem);\n}\n```', 27, 1459, 1486, 'code', NULL, NULL, NULL, '2023-06-19 10:29:24', '2023-06-19 10:29:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prompts`
--

CREATE TABLE `prompts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_group_id` int(11) DEFAULT NULL COMMENT 'if null -> custom template',
  `template_id` int(11) DEFAULT NULL,
  `prompts` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_users`
--

CREATE TABLE `subscribed_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_histories`
--

CREATE TABLE `subscription_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_package_id` int(11) NOT NULL,
  `old_subscription_package_id` int(11) DEFAULT NULL,
  `old_word_balance` bigint(20) NOT NULL DEFAULT 0,
  `new_word_balance` bigint(20) NOT NULL DEFAULT 0,
  `total_word_balance` bigint(20) NOT NULL DEFAULT 0,
  `old_image_balance` bigint(20) NOT NULL DEFAULT 0,
  `new_image_balance` bigint(20) NOT NULL DEFAULT 0,
  `total_image_balance` bigint(20) NOT NULL DEFAULT 0,
  `old_s2t_balance` bigint(20) NOT NULL DEFAULT 0,
  `new_s2t_balance` bigint(20) NOT NULL DEFAULT 0,
  `total_s2t_balance` bigint(20) NOT NULL DEFAULT 0,
  `old_t2s_balance` bigint(20) NOT NULL DEFAULT 0,
  `new_t2s_balance` bigint(20) NOT NULL DEFAULT 0,
  `total_t2s_balance` bigint(20) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_details` longtext DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_histories`
--

INSERT INTO `subscription_histories` (`id`, `user_id`, `subscription_package_id`, `old_subscription_package_id`, `old_word_balance`, `new_word_balance`, `total_word_balance`, `old_image_balance`, `new_image_balance`, `total_image_balance`, `old_s2t_balance`, `new_s2t_balance`, `total_s2t_balance`, `old_t2s_balance`, `new_t2s_balance`, `total_t2s_balance`, `price`, `payment_method`, `payment_details`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, 0, 1000, 0, 0, 10, 0, 0, 2, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2023-05-29 17:45:30', '2023-05-29 17:45:30', NULL),
(2, 2, 2, 1, 1000, 1000, 2000, 0, 10, 10, 0, 2, 2, 0, 0, 0, 20, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-05-29 17:51:39', '2023-05-29 17:51:39', NULL),
(3, 2, 9, 2, 406, 30000, 30406, 4, 100, 104, 1, 20, 21, 0, 0, 0, 100, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-05 10:49:05', '2023-06-05 10:49:05', NULL),
(4, 3, 1, NULL, 0, 1000, 0, 0, 10, 0, 0, 2, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2023-06-05 21:06:14', '2023-06-05 21:06:14', NULL),
(5, 3, 3, 1, 1000, 1000, 2000, 0, 10, 10, 0, 2, 2, 0, 0, 0, 25, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-05 21:09:04', '2023-06-05 21:09:04', NULL),
(6, 2, 2, 9, -1948, 1000, -948, 104, 10, 114, 21, 2, 23, 0, 0, 0, 20, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-10 14:35:34', '2023-06-10 14:35:34', NULL),
(7, 2, 3, 2, -948, 1000, 52, 114, 10, 124, 23, 2, 25, 0, 0, 0, 25, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-10 14:46:05', '2023-06-10 14:46:05', NULL),
(8, 2, 9, 3, -42, 30000, 29958, 124, 100, 224, 25, 20, 45, 0, 0, 0, 100, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-10 15:56:00', '2023-06-10 15:56:00', NULL),
(9, 2, 5, 9, 25046, 10000, 35046, 215, 10, 225, 45, 10, 55, 0, 0, 0, 25, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-12 00:00:58', '2023-06-12 00:00:58', NULL),
(10, 4, 1, NULL, 0, 1000, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2023-06-16 18:39:29', '2023-06-16 18:39:29', NULL),
(11, 5, 1, NULL, 0, 1000, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2023-06-17 01:37:06', '2023-06-17 01:37:06', NULL),
(12, 2, 6, 5, 617, 30000, 30617, 216, 100, 316, 55, 20, 75, 0, 0, 0, 30, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-17 06:06:56', '2023-06-17 06:06:56', NULL),
(13, 2, 6, 6, 7238, 30000, 37238, 316, 100, 416, 75, 20, 95, 0, 0, 0, 30, 'stripe', '\"{\\\"status\\\":\\\"Success\\\"}\"', NULL, '2023-06-19 10:31:20', '2023-06-19 10:31:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_packages`
--

CREATE TABLE `subscription_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `openai_model_id` int(11) NOT NULL,
  `package_type` varchar(191) NOT NULL DEFAULT 'monthly' COMMENT 'starter/monthly/yearly/lifetime',
  `price` double NOT NULL DEFAULT 0,
  `total_words_per_month` bigint(20) NOT NULL DEFAULT 0,
  `total_images_per_month` bigint(20) NOT NULL DEFAULT 0,
  `total_speech_to_text_per_month` bigint(20) NOT NULL DEFAULT 0,
  `total_text_to_speech_per_month` bigint(20) NOT NULL DEFAULT 0,
  `speech_to_text_filesize_limit` bigint(20) NOT NULL DEFAULT -1,
  `allow_images` tinyint(4) NOT NULL DEFAULT 0,
  `allow_ai_code` tinyint(4) NOT NULL DEFAULT 0,
  `allow_speech_to_text` tinyint(4) NOT NULL DEFAULT 0,
  `allow_ai_chat` tinyint(4) NOT NULL DEFAULT 0,
  `allow_text_to_speech` tinyint(4) NOT NULL DEFAULT 0,
  `allow_custom_templates` tinyint(2) NOT NULL DEFAULT 0,
  `show_open_ai_model` tinyint(2) NOT NULL DEFAULT 1,
  `has_live_support` tinyint(4) NOT NULL DEFAULT 0,
  `has_free_support` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `other_features` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_packages`
--

INSERT INTO `subscription_packages` (`id`, `title`, `description`, `slug`, `openai_model_id`, `package_type`, `price`, `total_words_per_month`, `total_images_per_month`, `total_speech_to_text_per_month`, `total_text_to_speech_per_month`, `speech_to_text_filesize_limit`, `allow_images`, `allow_ai_code`, `allow_speech_to_text`, `allow_ai_chat`, `allow_text_to_speech`, `allow_custom_templates`, `show_open_ai_model`, `has_live_support`, `has_free_support`, `is_featured`, `is_active`, `other_features`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Starter', 'Get started with our starter package', 'starter', 6, 'starter', 0, 1000, 10, 2, 0, 2, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, NULL, '2023-05-29 14:41:02', '2023-06-17 19:20:55', NULL),
(2, 'Standard', 'Get started with our standard package', 'starter-1685364314', 2, 'monthly', 20, 1000, 10, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, NULL, '2023-05-29 16:45:14', '2023-06-17 19:20:56', NULL),
(3, 'Premium', 'Get started with our premium package', 'starter-1685364314-1685364367', 4, 'monthly', 25, 1000, 10, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, NULL, '2023-05-29 16:46:07', '2023-06-17 19:20:57', NULL),
(4, 'Standard', 'Get started with our standard package', 'starter-1685364314-1685364438', 5, 'yearly', 20, 1000, 10, 2, 0, 2, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, NULL, '2023-05-29 16:47:18', '2023-06-17 19:21:01', NULL),
(5, 'Premium', 'Get started with our premium package', 'starter-1685364314-1685364367-1685364444', 5, 'yearly', 25, 10000, 10, 10, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, NULL, '2023-05-29 16:47:24', '2023-06-17 19:21:01', NULL),
(6, 'Commercial', 'Get started with our commercial package', 'starter-1685364314-1685364367-1685364444-1685364452', 5, 'yearly', 30, 30000, 100, 20, 0, 20, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, NULL, '2023-05-29 16:47:32', '2023-06-17 19:21:02', NULL),
(7, 'Standard', 'Get started with our standard package', 'starter-1685364314-1685364438-1685364544', 5, 'lifetime', 50, 1000, 10, 2, 0, 2, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, NULL, '2023-05-29 16:49:04', '2023-06-17 19:21:05', NULL),
(8, 'Premium', 'Get started with our premium package', 'starter-1685364314-1685364367-1685364444-1685364550', 5, 'lifetime', 75, 10000, 10, 10, 0, 2, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, NULL, '2023-05-29 16:49:10', '2023-06-17 19:21:06', NULL),
(9, 'Commercial', 'Get started with our commercial package', 'starter-1685364314-1685364367-1685364444-1685364452-1685364555', 6, 'lifetime', 100, 30000, 100, 20, 0, 20, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, NULL, '2023-05-29 16:49:15', '2023-06-17 19:21:06', NULL),
(10, 'New Package', 'Get started with our new package', 'new-package-1686504315', 5, 'lifetime', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, '2023-06-11 21:25:15', '2023-06-11 21:25:26', NULL),
(11, 'New Package', 'Get started with our new package', 'new-package-1686505914', 5, 'monthly', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, '2023-06-11 21:51:54', '2023-06-11 21:54:00', NULL),
(12, 'New Package', 'Get started with our new package', 'new-package-1686504315-1686505946', 5, 'monthly', 500, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, NULL, '2023-06-11 21:52:26', '2023-06-17 13:11:51', NULL),
(13, 'New Package', 'Get started with our new package', 'new-package-1686506077', 5, 'monthly', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, NULL, '2023-06-11 21:54:37', '2023-06-17 04:26:24', NULL),
(14, 'New Package', 'Get started with our new package', 'new-package-1687003338', 5, 'monthly', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, '2023-06-17 16:02:18', '2023-06-17 18:14:05', NULL),
(15, 'New Package', 'Get started with our new package', 'new-package-1687011237', 5, 'monthly', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, '2023-06-17 18:13:57', '2023-06-17 18:14:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_package_templates`
--

CREATE TABLE `subscription_package_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_package_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_package_templates`
--

INSERT INTO `subscription_package_templates` (`id`, `subscription_package_id`, `template_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(21, 1, 21, NULL, NULL),
(22, 1, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 1, 24, NULL, NULL),
(25, 1, 25, NULL, NULL),
(26, 1, 26, NULL, NULL),
(27, 1, 27, NULL, NULL),
(28, 1, 28, NULL, NULL),
(29, 1, 29, NULL, NULL),
(30, 1, 30, NULL, NULL),
(45, 1, 45, NULL, NULL),
(46, 1, 46, NULL, NULL),
(47, 1, 47, NULL, NULL),
(48, 1, 48, NULL, NULL),
(49, 1, 49, NULL, NULL),
(50, 1, 50, NULL, NULL),
(51, 1, 51, NULL, NULL),
(52, 1, 52, NULL, NULL),
(53, 1, 53, NULL, NULL),
(54, 1, 54, NULL, NULL),
(55, 1, 55, NULL, NULL),
(60, 1, 60, NULL, NULL),
(61, 1, 61, NULL, NULL),
(62, 1, 62, NULL, NULL),
(63, 1, 63, NULL, NULL),
(64, 2, 1, NULL, NULL),
(65, 2, 2, NULL, NULL),
(66, 2, 3, NULL, NULL),
(67, 2, 4, NULL, NULL),
(68, 2, 5, NULL, NULL),
(69, 2, 6, NULL, NULL),
(70, 2, 7, NULL, NULL),
(71, 2, 8, NULL, NULL),
(72, 2, 9, NULL, NULL),
(73, 2, 10, NULL, NULL),
(74, 2, 11, NULL, NULL),
(75, 2, 12, NULL, NULL),
(76, 2, 13, NULL, NULL),
(77, 2, 14, NULL, NULL),
(78, 2, 15, NULL, NULL),
(79, 2, 16, NULL, NULL),
(80, 2, 17, NULL, NULL),
(81, 2, 18, NULL, NULL),
(82, 2, 19, NULL, NULL),
(83, 2, 20, NULL, NULL),
(108, 2, 45, NULL, NULL),
(109, 2, 46, NULL, NULL),
(110, 2, 47, NULL, NULL),
(111, 2, 48, NULL, NULL),
(112, 2, 49, NULL, NULL),
(113, 2, 50, NULL, NULL),
(114, 2, 51, NULL, NULL),
(115, 2, 52, NULL, NULL),
(116, 2, 53, NULL, NULL),
(117, 2, 54, NULL, NULL),
(118, 2, 55, NULL, NULL),
(119, 2, 56, NULL, NULL),
(120, 2, 57, NULL, NULL),
(121, 2, 58, NULL, NULL),
(122, 2, 59, NULL, NULL),
(123, 2, 60, NULL, NULL),
(124, 2, 61, NULL, NULL),
(125, 2, 62, NULL, NULL),
(126, 2, 63, NULL, NULL),
(127, 3, 1, NULL, NULL),
(128, 3, 2, NULL, NULL),
(129, 3, 3, NULL, NULL),
(130, 3, 4, NULL, NULL),
(131, 3, 5, NULL, NULL),
(132, 3, 6, NULL, NULL),
(133, 3, 7, NULL, NULL),
(134, 3, 8, NULL, NULL),
(135, 3, 9, NULL, NULL),
(136, 3, 10, NULL, NULL),
(137, 3, 11, NULL, NULL),
(138, 3, 12, NULL, NULL),
(139, 3, 13, NULL, NULL),
(140, 3, 14, NULL, NULL),
(141, 3, 15, NULL, NULL),
(142, 3, 16, NULL, NULL),
(143, 3, 17, NULL, NULL),
(144, 3, 18, NULL, NULL),
(145, 3, 19, NULL, NULL),
(146, 3, 20, NULL, NULL),
(147, 3, 21, NULL, NULL),
(148, 3, 22, NULL, NULL),
(149, 3, 23, NULL, NULL),
(150, 3, 24, NULL, NULL),
(151, 3, 25, NULL, NULL),
(152, 3, 26, NULL, NULL),
(153, 3, 27, NULL, NULL),
(154, 3, 28, NULL, NULL),
(155, 3, 29, NULL, NULL),
(156, 3, 30, NULL, NULL),
(157, 3, 31, NULL, NULL),
(158, 3, 32, NULL, NULL),
(159, 3, 33, NULL, NULL),
(160, 3, 34, NULL, NULL),
(161, 3, 35, NULL, NULL),
(162, 3, 36, NULL, NULL),
(163, 3, 37, NULL, NULL),
(164, 3, 38, NULL, NULL),
(165, 3, 39, NULL, NULL),
(166, 3, 40, NULL, NULL),
(167, 3, 41, NULL, NULL),
(168, 3, 42, NULL, NULL),
(169, 3, 43, NULL, NULL),
(170, 3, 44, NULL, NULL),
(171, 3, 45, NULL, NULL),
(172, 3, 46, NULL, NULL),
(173, 3, 47, NULL, NULL),
(174, 3, 48, NULL, NULL),
(175, 3, 49, NULL, NULL),
(176, 3, 50, NULL, NULL),
(177, 3, 51, NULL, NULL),
(178, 3, 52, NULL, NULL),
(179, 3, 53, NULL, NULL),
(180, 3, 54, NULL, NULL),
(181, 3, 55, NULL, NULL),
(182, 3, 56, NULL, NULL),
(183, 3, 57, NULL, NULL),
(184, 3, 58, NULL, NULL),
(185, 3, 59, NULL, NULL),
(186, 3, 60, NULL, NULL),
(187, 3, 61, NULL, NULL),
(188, 3, 62, NULL, NULL),
(189, 3, 63, NULL, NULL),
(190, 4, 1, NULL, NULL),
(191, 4, 2, NULL, NULL),
(192, 4, 3, NULL, NULL),
(193, 4, 4, NULL, NULL),
(194, 4, 5, NULL, NULL),
(195, 4, 6, NULL, NULL),
(196, 4, 7, NULL, NULL),
(197, 4, 8, NULL, NULL),
(198, 4, 9, NULL, NULL),
(199, 4, 10, NULL, NULL),
(200, 4, 11, NULL, NULL),
(201, 4, 12, NULL, NULL),
(202, 4, 13, NULL, NULL),
(203, 4, 14, NULL, NULL),
(204, 4, 15, NULL, NULL),
(205, 4, 16, NULL, NULL),
(206, 4, 17, NULL, NULL),
(207, 4, 18, NULL, NULL),
(208, 4, 19, NULL, NULL),
(209, 4, 20, NULL, NULL),
(210, 4, 45, NULL, NULL),
(211, 4, 46, NULL, NULL),
(212, 4, 47, NULL, NULL),
(213, 4, 48, NULL, NULL),
(214, 4, 49, NULL, NULL),
(215, 4, 50, NULL, NULL),
(216, 4, 51, NULL, NULL),
(217, 4, 52, NULL, NULL),
(218, 4, 53, NULL, NULL),
(219, 4, 54, NULL, NULL),
(220, 4, 55, NULL, NULL),
(221, 4, 56, NULL, NULL),
(222, 4, 57, NULL, NULL),
(223, 4, 58, NULL, NULL),
(224, 4, 59, NULL, NULL),
(225, 4, 60, NULL, NULL),
(226, 4, 61, NULL, NULL),
(227, 4, 62, NULL, NULL),
(228, 4, 63, NULL, NULL),
(229, 5, 1, NULL, NULL),
(230, 5, 2, NULL, NULL),
(231, 5, 3, NULL, NULL),
(232, 5, 4, NULL, NULL),
(233, 5, 5, NULL, NULL),
(234, 5, 6, NULL, NULL),
(235, 5, 7, NULL, NULL),
(236, 5, 8, NULL, NULL),
(237, 5, 9, NULL, NULL),
(238, 5, 10, NULL, NULL),
(239, 5, 11, NULL, NULL),
(240, 5, 12, NULL, NULL),
(241, 5, 13, NULL, NULL),
(242, 5, 14, NULL, NULL),
(243, 5, 15, NULL, NULL),
(244, 5, 16, NULL, NULL),
(245, 5, 17, NULL, NULL),
(246, 5, 18, NULL, NULL),
(247, 5, 19, NULL, NULL),
(248, 5, 20, NULL, NULL),
(249, 5, 21, NULL, NULL),
(250, 5, 22, NULL, NULL),
(251, 5, 23, NULL, NULL),
(252, 5, 24, NULL, NULL),
(253, 5, 25, NULL, NULL),
(254, 5, 26, NULL, NULL),
(255, 5, 27, NULL, NULL),
(256, 5, 28, NULL, NULL),
(257, 5, 29, NULL, NULL),
(258, 5, 30, NULL, NULL),
(259, 5, 31, NULL, NULL),
(260, 5, 32, NULL, NULL),
(261, 5, 33, NULL, NULL),
(262, 5, 34, NULL, NULL),
(263, 5, 35, NULL, NULL),
(264, 5, 36, NULL, NULL),
(265, 5, 37, NULL, NULL),
(266, 5, 38, NULL, NULL),
(267, 5, 39, NULL, NULL),
(268, 5, 40, NULL, NULL),
(269, 5, 41, NULL, NULL),
(270, 5, 42, NULL, NULL),
(271, 5, 43, NULL, NULL),
(272, 5, 44, NULL, NULL),
(273, 5, 45, NULL, NULL),
(274, 5, 46, NULL, NULL),
(275, 5, 47, NULL, NULL),
(276, 5, 48, NULL, NULL),
(277, 5, 49, NULL, NULL),
(278, 5, 50, NULL, NULL),
(279, 5, 51, NULL, NULL),
(280, 5, 52, NULL, NULL),
(281, 5, 53, NULL, NULL),
(282, 5, 54, NULL, NULL),
(283, 5, 55, NULL, NULL),
(284, 5, 56, NULL, NULL),
(285, 5, 57, NULL, NULL),
(286, 5, 58, NULL, NULL),
(287, 5, 59, NULL, NULL),
(288, 5, 60, NULL, NULL),
(289, 5, 61, NULL, NULL),
(290, 5, 62, NULL, NULL),
(291, 5, 63, NULL, NULL),
(292, 6, 1, NULL, NULL),
(293, 6, 2, NULL, NULL),
(294, 6, 3, NULL, NULL),
(295, 6, 4, NULL, NULL),
(296, 6, 5, NULL, NULL),
(297, 6, 6, NULL, NULL),
(298, 6, 7, NULL, NULL),
(299, 6, 8, NULL, NULL),
(300, 6, 9, NULL, NULL),
(301, 6, 10, NULL, NULL),
(302, 6, 11, NULL, NULL),
(303, 6, 12, NULL, NULL),
(304, 6, 13, NULL, NULL),
(305, 6, 14, NULL, NULL),
(306, 6, 15, NULL, NULL),
(307, 6, 16, NULL, NULL),
(308, 6, 17, NULL, NULL),
(309, 6, 18, NULL, NULL),
(310, 6, 19, NULL, NULL),
(311, 6, 20, NULL, NULL),
(312, 6, 21, NULL, NULL),
(313, 6, 22, NULL, NULL),
(314, 6, 23, NULL, NULL),
(315, 6, 24, NULL, NULL),
(316, 6, 25, NULL, NULL),
(317, 6, 26, NULL, NULL),
(318, 6, 27, NULL, NULL),
(319, 6, 28, NULL, NULL),
(320, 6, 29, NULL, NULL),
(321, 6, 30, NULL, NULL),
(322, 6, 31, NULL, NULL),
(323, 6, 32, NULL, NULL),
(324, 6, 33, NULL, NULL),
(325, 6, 34, NULL, NULL),
(326, 6, 35, NULL, NULL),
(327, 6, 36, NULL, NULL),
(328, 6, 37, NULL, NULL),
(329, 6, 38, NULL, NULL),
(330, 6, 39, NULL, NULL),
(331, 6, 40, NULL, NULL),
(332, 6, 41, NULL, NULL),
(333, 6, 42, NULL, NULL),
(334, 6, 43, NULL, NULL),
(335, 6, 44, NULL, NULL),
(336, 6, 45, NULL, NULL),
(337, 6, 46, NULL, NULL),
(338, 6, 47, NULL, NULL),
(339, 6, 48, NULL, NULL),
(340, 6, 49, NULL, NULL),
(341, 6, 50, NULL, NULL),
(342, 6, 51, NULL, NULL),
(343, 6, 52, NULL, NULL),
(344, 6, 53, NULL, NULL),
(345, 6, 54, NULL, NULL),
(346, 6, 55, NULL, NULL),
(347, 6, 56, NULL, NULL),
(348, 6, 57, NULL, NULL),
(349, 6, 58, NULL, NULL),
(350, 6, 59, NULL, NULL),
(351, 6, 60, NULL, NULL),
(352, 6, 61, NULL, NULL),
(353, 6, 62, NULL, NULL),
(354, 6, 63, NULL, NULL),
(355, 7, 1, NULL, NULL),
(356, 7, 2, NULL, NULL),
(357, 7, 3, NULL, NULL),
(358, 7, 4, NULL, NULL),
(359, 7, 5, NULL, NULL),
(360, 7, 6, NULL, NULL),
(361, 7, 7, NULL, NULL),
(362, 7, 8, NULL, NULL),
(363, 7, 9, NULL, NULL),
(364, 7, 10, NULL, NULL),
(365, 7, 11, NULL, NULL),
(366, 7, 12, NULL, NULL),
(367, 7, 13, NULL, NULL),
(368, 7, 14, NULL, NULL),
(369, 7, 15, NULL, NULL),
(370, 7, 16, NULL, NULL),
(371, 7, 17, NULL, NULL),
(372, 7, 18, NULL, NULL),
(373, 7, 19, NULL, NULL),
(374, 7, 20, NULL, NULL),
(375, 7, 45, NULL, NULL),
(376, 7, 46, NULL, NULL),
(377, 7, 47, NULL, NULL),
(378, 7, 48, NULL, NULL),
(379, 7, 49, NULL, NULL),
(380, 7, 50, NULL, NULL),
(381, 7, 51, NULL, NULL),
(382, 7, 52, NULL, NULL),
(383, 7, 53, NULL, NULL),
(384, 7, 54, NULL, NULL),
(385, 7, 55, NULL, NULL),
(386, 7, 56, NULL, NULL),
(387, 7, 57, NULL, NULL),
(388, 7, 58, NULL, NULL),
(389, 7, 59, NULL, NULL),
(390, 7, 60, NULL, NULL),
(391, 7, 61, NULL, NULL),
(392, 7, 62, NULL, NULL),
(393, 7, 63, NULL, NULL),
(394, 8, 1, NULL, NULL),
(395, 8, 2, NULL, NULL),
(396, 8, 3, NULL, NULL),
(397, 8, 4, NULL, NULL),
(398, 8, 5, NULL, NULL),
(399, 8, 6, NULL, NULL),
(400, 8, 7, NULL, NULL),
(401, 8, 8, NULL, NULL),
(402, 8, 9, NULL, NULL),
(403, 8, 10, NULL, NULL),
(404, 8, 11, NULL, NULL),
(405, 8, 12, NULL, NULL),
(406, 8, 13, NULL, NULL),
(407, 8, 14, NULL, NULL),
(408, 8, 15, NULL, NULL),
(409, 8, 16, NULL, NULL),
(410, 8, 17, NULL, NULL),
(411, 8, 18, NULL, NULL),
(412, 8, 19, NULL, NULL),
(413, 8, 20, NULL, NULL),
(414, 8, 21, NULL, NULL),
(415, 8, 22, NULL, NULL),
(416, 8, 23, NULL, NULL),
(417, 8, 24, NULL, NULL),
(418, 8, 25, NULL, NULL),
(419, 8, 26, NULL, NULL),
(420, 8, 27, NULL, NULL),
(421, 8, 28, NULL, NULL),
(422, 8, 29, NULL, NULL),
(423, 8, 30, NULL, NULL),
(424, 8, 31, NULL, NULL),
(425, 8, 32, NULL, NULL),
(426, 8, 33, NULL, NULL),
(427, 8, 34, NULL, NULL),
(428, 8, 35, NULL, NULL),
(429, 8, 36, NULL, NULL),
(430, 8, 37, NULL, NULL),
(431, 8, 38, NULL, NULL),
(432, 8, 39, NULL, NULL),
(433, 8, 40, NULL, NULL),
(434, 8, 41, NULL, NULL),
(435, 8, 42, NULL, NULL),
(436, 8, 43, NULL, NULL),
(437, 8, 44, NULL, NULL),
(438, 8, 45, NULL, NULL),
(439, 8, 46, NULL, NULL),
(440, 8, 47, NULL, NULL),
(441, 8, 48, NULL, NULL),
(442, 8, 49, NULL, NULL),
(443, 8, 50, NULL, NULL),
(444, 8, 51, NULL, NULL),
(445, 8, 52, NULL, NULL),
(446, 8, 53, NULL, NULL),
(447, 8, 54, NULL, NULL),
(448, 8, 55, NULL, NULL),
(449, 8, 56, NULL, NULL),
(450, 8, 57, NULL, NULL),
(451, 8, 58, NULL, NULL),
(452, 8, 59, NULL, NULL),
(453, 8, 60, NULL, NULL),
(454, 8, 61, NULL, NULL),
(455, 8, 62, NULL, NULL),
(456, 8, 63, NULL, NULL),
(457, 9, 1, NULL, NULL),
(458, 9, 2, NULL, NULL),
(459, 9, 3, NULL, NULL),
(460, 9, 4, NULL, NULL),
(461, 9, 5, NULL, NULL),
(462, 9, 6, NULL, NULL),
(463, 9, 7, NULL, NULL),
(464, 9, 8, NULL, NULL),
(465, 9, 9, NULL, NULL),
(466, 9, 10, NULL, NULL),
(467, 9, 11, NULL, NULL),
(468, 9, 12, NULL, NULL),
(469, 9, 13, NULL, NULL),
(470, 9, 14, NULL, NULL),
(471, 9, 15, NULL, NULL),
(472, 9, 16, NULL, NULL),
(473, 9, 17, NULL, NULL),
(474, 9, 18, NULL, NULL),
(475, 9, 19, NULL, NULL),
(476, 9, 20, NULL, NULL),
(477, 9, 21, NULL, NULL),
(478, 9, 22, NULL, NULL),
(479, 9, 23, NULL, NULL),
(480, 9, 24, NULL, NULL),
(481, 9, 25, NULL, NULL),
(482, 9, 26, NULL, NULL),
(483, 9, 27, NULL, NULL),
(484, 9, 28, NULL, NULL),
(485, 9, 29, NULL, NULL),
(486, 9, 30, NULL, NULL),
(487, 9, 31, NULL, NULL),
(488, 9, 32, NULL, NULL),
(489, 9, 33, NULL, NULL),
(490, 9, 34, NULL, NULL),
(491, 9, 35, NULL, NULL),
(492, 9, 36, NULL, NULL),
(493, 9, 37, NULL, NULL),
(494, 9, 38, NULL, NULL),
(495, 9, 39, NULL, NULL),
(496, 9, 40, NULL, NULL),
(497, 9, 41, NULL, NULL),
(498, 9, 42, NULL, NULL),
(499, 9, 43, NULL, NULL),
(500, 9, 44, NULL, NULL),
(501, 9, 45, NULL, NULL),
(502, 9, 46, NULL, NULL),
(503, 9, 47, NULL, NULL),
(504, 9, 48, NULL, NULL),
(505, 9, 49, NULL, NULL),
(506, 9, 50, NULL, NULL),
(507, 9, 51, NULL, NULL),
(508, 9, 52, NULL, NULL),
(509, 9, 53, NULL, NULL),
(510, 9, 54, NULL, NULL),
(511, 9, 55, NULL, NULL),
(512, 9, 56, NULL, NULL),
(513, 9, 57, NULL, NULL),
(514, 9, 58, NULL, NULL),
(515, 9, 59, NULL, NULL),
(516, 9, 60, NULL, NULL),
(517, 9, 61, NULL, NULL),
(518, 9, 62, NULL, NULL),
(519, 9, 63, NULL, NULL),
(520, 12, 1, NULL, NULL),
(521, 12, 2, NULL, NULL),
(522, 12, 3, NULL, NULL),
(523, 12, 4, NULL, NULL),
(524, 12, 5, NULL, NULL),
(525, 12, 6, NULL, NULL),
(526, 12, 7, NULL, NULL),
(527, 12, 8, NULL, NULL),
(528, 12, 9, NULL, NULL),
(529, 12, 10, NULL, NULL),
(530, 12, 11, NULL, NULL),
(531, 12, 12, NULL, NULL),
(532, 12, 13, NULL, NULL),
(533, 12, 14, NULL, NULL),
(534, 12, 15, NULL, NULL),
(535, 12, 16, NULL, NULL),
(536, 12, 17, NULL, NULL),
(537, 12, 18, NULL, NULL),
(538, 12, 19, NULL, NULL),
(539, 12, 20, NULL, NULL),
(540, 12, 64, NULL, NULL),
(541, 12, 21, NULL, NULL),
(542, 12, 22, NULL, NULL),
(543, 12, 23, NULL, NULL),
(544, 12, 24, NULL, NULL),
(545, 12, 25, NULL, NULL),
(546, 12, 26, NULL, NULL),
(547, 12, 27, NULL, NULL),
(548, 12, 28, NULL, NULL),
(549, 12, 29, NULL, NULL),
(550, 12, 30, NULL, NULL),
(551, 12, 65, NULL, NULL),
(552, 12, 66, NULL, NULL),
(553, 12, 67, NULL, NULL),
(554, 12, 68, NULL, NULL),
(555, 12, 31, NULL, NULL),
(556, 12, 32, NULL, NULL),
(557, 12, 33, NULL, NULL),
(558, 12, 34, NULL, NULL),
(559, 12, 35, NULL, NULL),
(560, 12, 36, NULL, NULL),
(561, 12, 37, NULL, NULL),
(562, 12, 38, NULL, NULL),
(563, 12, 39, NULL, NULL),
(564, 12, 40, NULL, NULL),
(565, 12, 41, NULL, NULL),
(566, 12, 42, NULL, NULL),
(567, 12, 43, NULL, NULL),
(568, 12, 44, NULL, NULL),
(569, 12, 69, NULL, NULL),
(570, 12, 45, NULL, NULL),
(571, 12, 46, NULL, NULL),
(572, 12, 47, NULL, NULL),
(573, 12, 48, NULL, NULL),
(574, 12, 49, NULL, NULL),
(575, 12, 50, NULL, NULL),
(576, 12, 51, NULL, NULL),
(577, 12, 52, NULL, NULL),
(578, 12, 53, NULL, NULL),
(579, 12, 54, NULL, NULL),
(580, 12, 55, NULL, NULL),
(581, 12, 56, NULL, NULL),
(582, 12, 57, NULL, NULL),
(583, 12, 58, NULL, NULL),
(584, 12, 59, NULL, NULL),
(585, 12, 60, NULL, NULL),
(586, 12, 61, NULL, NULL),
(587, 12, 62, NULL, NULL),
(588, 12, 63, NULL, NULL),
(589, 12, 70, NULL, NULL),
(590, 12, 71, NULL, NULL),
(591, 12, 72, NULL, NULL),
(592, 10, 1, NULL, NULL),
(593, 10, 2, NULL, NULL),
(594, 10, 3, NULL, NULL),
(595, 10, 4, NULL, NULL),
(596, 10, 5, NULL, NULL),
(597, 10, 6, NULL, NULL),
(598, 10, 7, NULL, NULL),
(599, 10, 13, NULL, NULL),
(600, 10, 63, NULL, NULL),
(601, 10, 70, NULL, NULL),
(602, 10, 71, NULL, NULL),
(603, 10, 72, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity` varchar(191) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `entity`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'google_login', '1', '2022-12-07 11:33:40', '2023-05-29 18:11:19', NULL),
(2, 'default_currency', 'usd', '2022-12-07 11:55:08', '2022-12-07 11:55:08', NULL),
(3, 'no_of_decimals', '2', '2022-12-07 11:55:08', '2022-12-07 11:55:08', NULL),
(4, 'truncate_price', '0', '2022-12-07 11:55:08', '2022-12-07 11:55:08', NULL),
(5, 'enable_multi_vendor', '0', '2022-12-25 11:00:08', '2023-02-18 13:56:54', NULL),
(6, 'default_admin_commission', '5', '2022-12-25 11:00:08', '2022-12-25 11:00:08', NULL),
(7, 'vendor_minimum_payout', '500', '2022-12-28 11:34:48', '2022-12-28 11:34:48', NULL),
(8, 'order_code_prefix', '#G-Store:', '2023-02-04 11:48:17', '2023-02-19 13:42:24', NULL),
(9, 'order_code_start', '1', '2023-02-04 11:48:17', '2023-02-04 11:51:38', NULL),
(10, 'system_title', 'Writebot - AI', '2023-02-05 11:48:44', '2023-06-05 08:57:57', NULL),
(11, 'title_separator', ':', '2023-02-05 11:48:44', '2023-02-05 11:48:44', NULL),
(12, 'site_address', 'Cecilia Chapman, 711-2880 Nulla St, Mankato Mississippi 96522', '2023-02-05 11:49:15', '2023-02-05 11:49:15', NULL),
(13, 'registration_with', 'email', '2023-02-18 14:10:22', '2023-02-18 14:10:22', NULL),
(14, 'registration_verification_with', 'disable', '2023-02-18 14:10:22', '2023-02-18 14:10:22', NULL),
(15, 'topbar_welcome_text', 'Welcome to our Organic store', '2023-02-20 11:41:46', '2023-02-20 11:41:46', NULL),
(16, 'topbar_email', 'groshop@support.com', '2023-02-20 11:41:46', '2023-02-20 11:41:46', NULL),
(17, 'topbar_location', 'Washington, New York, USA - 254230', '2023-02-20 11:41:46', '2023-02-20 11:41:46', NULL),
(18, 'navbar_logo', '1', '2023-02-20 11:41:46', '2023-03-12 09:04:45', NULL),
(19, 'navbar_categories', NULL, '2023-02-20 11:41:46', '2023-03-12 09:04:45', NULL),
(20, 'navbar_pages', '[\"1\"]', '2023-02-20 11:41:47', '2023-03-01 14:32:34', NULL),
(21, 'navbar_contact_number', '+80 157 058 4567', '2023-02-20 11:41:47', '2023-02-20 11:41:47', NULL),
(22, 'hero_sliders', '[{\"id\":106549,\"sub_title\":\"Genuine 100% Organic Products\",\"title\":\"Online Fresh Grocery Products\",\"text\":\"Assertively target market-driven intellectual capital with worldwide human capital holistic.\",\"image\":\"39\",\"link\":\"https:\\/\\/www.youtube.com\\/watch?v=mZ77D66ZYtw\"}]', '2023-02-20 16:36:00', '2023-03-01 13:33:57', NULL),
(24, 'top_category_ids', '[\"6\",\"5\",\"4\",\"3\",\"2\"]', '2023-02-25 14:29:10', '2023-02-25 14:29:10', NULL),
(25, 'featured_sub_title', 'Platform mindshare through effective infomediaries Dynamically implement.', '2023-02-25 15:18:46', '2023-02-25 15:18:46', NULL),
(26, 'featured_products_left', '[\"1\",\"2\",\"5\"]', '2023-02-25 15:18:46', '2023-02-26 09:38:23', NULL),
(27, 'featured_products_right', '[\"2\",\"3\",\"4\"]', '2023-02-25 15:18:46', '2023-02-25 17:53:03', NULL),
(28, 'featured_center_banner', '', '2023-02-25 15:18:46', '2023-02-25 16:01:42', NULL),
(29, 'featured_banner_link', 'http://enmart.work/products', '2023-02-25 15:23:47', '2023-02-25 15:23:47', NULL),
(30, 'trending_product_categories', '[\"5\",\"4\",\"3\"]', '2023-02-26 10:35:01', '2023-02-26 10:35:01', NULL),
(31, 'top_trending_products', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', '2023-02-26 10:35:01', '2023-03-08 17:10:00', NULL),
(32, 'banner_section_one_banners', '[]', '2023-02-26 11:44:06', '2023-03-12 08:54:15', NULL),
(33, 'best_deal_end_date', '03/31/2023', '2023-02-26 14:38:19', '2023-02-26 14:44:19', NULL),
(34, 'weekly_best_deals', '[\"1\",\"2\",\"4\",\"5\"]', '2023-02-26 14:38:19', '2023-02-26 14:53:35', NULL),
(35, 'best_deal_banner', '', '2023-02-26 14:38:19', '2023-02-26 14:38:19', NULL),
(36, 'best_deal_banner_link', NULL, '2023-02-26 14:38:19', '2023-02-26 14:38:19', NULL),
(37, 'banner_section_two_banner_one_link', NULL, '2023-02-26 15:11:59', '2023-02-26 15:11:59', NULL),
(38, 'banner_section_two_banner_one', '49', '2023-02-26 15:11:59', '2023-02-26 15:11:59', NULL),
(39, 'banner_section_two_banner_two_link', NULL, '2023-02-26 15:11:59', '2023-02-26 15:11:59', NULL),
(40, 'banner_section_two_banner_two', '50', '2023-02-26 15:11:59', '2023-02-26 15:11:59', NULL),
(41, 'client_feedback', '[{\"id\":854463,\"name\":\"Lawrence Schroth\",\"heading\":\"Fantastic Way to cut Your Writing\",\"designation\":\"Managing Director\",\"rating\":\"5\",\"review\":\"I can\\u2019t imagine my life without WriteBot It has changed the game for me. I can put in a sentence or two of a generic idea and WriteBot takes it in and in 30 seconds or less generates more every time I hit enter...\",\"image\":\"28\"},{\"id\":652109,\"name\":\"Bernard\",\"heading\":\"WriteBot is my Trusted Copy Friend\",\"designation\":\"Business Owner\",\"rating\":\"5\",\"review\":\"I\'ve used WriteBot for several months now, along with a half dozen other paid AI copy tools and this has outperformed all of them. They have more specialized tools than anyone else.\",\"image\":\"29\"},{\"id\":199682,\"name\":\"Patrick\",\"heading\":\"Great quality of output\",\"designation\":\"SEO Content Writer\",\"rating\":\"5\",\"review\":\"WriteBot is THE best!!! Been using it for copywriting especially for blog posts. Saves me so much time and mental energy. It\'s a worthwhile investment! Great quality of output better than any other tool.\",\"image\":\"31\"},{\"id\":494645,\"name\":\"Candy Roy\",\"heading\":\"You Love to Outsource to AI - it\\u2019s perfect!\",\"designation\":\"Social Media Manager\",\"rating\":\"5\",\"review\":\"Wouldn\'t you love to outsource (no pun intended) your copywriting to an AI - I do and did! with WriteBot. It will give your phenomenal content with the ultimate edge by using lots of scientific copywriting formulas.\",\"image\":\"30\"},{\"id\":624097,\"name\":\"Jesse Stoddard\",\"heading\":\"I find WriteBot to be an excellent tool\\u2026\",\"designation\":\"Content Marketer & Blogger\",\"rating\":\"5\",\"review\":\"I find WriteBot to be an excellent tool for speeding up our copywriting service. Far from \\\"replacing\\\" myself or any of my writers, WriteBot provides an essential tool for better assemble the finished product faster.\",\"image\":\"27\"}]', '2023-02-26 18:16:47', '2023-05-29 14:37:14', NULL),
(42, 'best_selling_products', '[\"1\",\"2\",\"3\"]', '2023-02-27 11:01:19', '2023-02-27 11:01:19', NULL),
(43, 'best_selling_banner', '', '2023-02-27 11:01:19', '2023-02-27 11:11:30', NULL),
(44, 'best_selling_banner_link', NULL, '2023-02-27 11:01:19', '2023-02-27 11:01:19', NULL),
(45, 'product_listing_categories', '[\"6\",\"5\",\"4\",\"3\",\"2\"]', '2023-02-27 11:47:35', '2023-02-27 11:47:35', NULL),
(46, 'footer_categories', NULL, '2023-03-01 09:33:33', '2023-03-12 08:59:31', NULL),
(47, 'quick_links', '[\"1\"]', '2023-03-01 09:33:33', '2023-05-29 15:19:32', NULL),
(48, 'footer_logo', '2', '2023-03-01 09:33:33', '2023-03-12 09:05:55', NULL),
(49, 'accepted_payment_banner', '3', '2023-03-01 09:33:33', '2023-03-12 09:05:55', NULL),
(50, 'copyright_text', '<p>© All Designed, Developed and <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAFXSURBVHgBjZE9S8NQGIXPexsdBGkXF6d0qHSopYKuUqUO4uA/UMFZOjqK7g79AaLi4CquLRIHBydTFbVoaVZBoRKQfiT39TZDLWma9EyXc+9zz/tBiNBrOq9PTmhFhqzatrxKTGv7LOC0284JRcH17FoDYN3vE8MIhRu5vC6l1gi6c5k/RRicNA0LjO+gO43oPhTuiRmHASaTcIpe2e+ZQl4QttTxp9N1Sq0WmvF4bJclMgy+VS91lXLgceBuDGI7+Vi+pI/51R0icdr/FPhSw7BAWPwPohvV5QWBNqWgo1S18tDzqZ4t9A45RMgVtDBnls1BT1WLWYwhcjjh94RkvIzBQtMcawgOnOZQLJ95a/PDqeeKoQZyPppkS5AbGODtOd753VO9mwFgU7C7HpTah2dqd7Za+oraYWkwEUzLySfjDaO68RtWrrDRlVhy21PH6dq1jRD9AULxiBLD039WAAAAAElFTkSuQmCC\" data-filename=\"love.png\" style=\"width: 15px;\"> by <b><a href=\"http://themetags.com/\" target=\"_blank\" style=\"\"><font color=\"#ff9c00\">ThemeTags</font></a></b></p>', '2023-03-01 09:49:42', '2023-05-29 18:02:19', NULL),
(51, 'product_page_widgets', '[]', '2023-03-01 13:35:08', '2023-03-12 08:56:25', NULL),
(52, 'product_page_banner_link', NULL, '2023-03-01 14:20:50', '2023-03-01 14:20:50', NULL),
(53, 'product_page_banner', '59', '2023-03-01 14:20:50', '2023-03-01 14:20:50', NULL),
(54, 'facebook_link', 'https://www.facebook.com/', '2023-03-01 14:45:01', '2023-03-01 14:45:01', NULL),
(55, 'twitter_link', 'https://twitter.com/', '2023-03-01 14:45:01', '2023-03-01 14:45:01', NULL),
(56, 'linkedin_link', 'https://www.linkedin.com/', '2023-03-01 14:45:01', '2023-03-01 14:45:01', NULL),
(57, 'youtube_link', 'https://www.youtube.com/', '2023-03-01 14:45:01', '2023-03-01 14:45:01', NULL),
(58, 'about_us', 'Explain to you how all this mistaken denouncing pleasure and praising pain was born and we will give you a complete account of the system, and expound the actual teachings.\n          \n          Mistaken denouncing pleasure and praising pain was born and we will give you complete account of the system expound.', '2023-03-01 14:46:33', '2023-03-01 14:46:33', NULL),
(59, 'about_intro_sub_title', '100% Organic Food Provide', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(60, 'about_intro_title', 'Be healthy & <br> eat fresh organic food', '2023-03-04 09:54:12', '2023-03-11 10:49:49', NULL),
(61, 'about_intro_text', 'Assertively target market lorem ipsum is simply free text available dolor sit amet, consectetur notted adipisicing elit sed do eiusmod tempor incididunt simply freeutation labore et dolore.', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(62, 'about_intro_mission', 'Continually transform virtual meta- methodologies. leverage existing alignments.', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(63, 'about_intro_vision', 'Continually transform virtual meta- methodologies. leverage existing alignments.', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(64, 'about_intro_quote', 'Assertively target market Lorem ipsum is simply free consectetur notted elit sed do eiusmod', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(65, 'about_intro_quote_by', 'George Scholll', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(66, 'about_intro_image', '60', '2023-03-04 09:54:12', '2023-03-04 09:54:12', NULL),
(67, 'about_popular_brand_ids', '[\"1\",\"2\"]', '2023-03-04 10:16:59', '2023-03-04 10:16:59', NULL),
(68, 'about_features_title', 'Our Working Ability', '2023-03-04 10:49:27', '2023-03-04 10:49:27', NULL),
(69, 'about_features_sub_title', 'Assertively target market lorem ipsum is simply free text available dolor incididunt simply free ut labore et dolore.', '2023-03-04 10:49:27', '2023-03-04 10:49:27', NULL),
(70, 'about_us_features', '[]', '2023-03-04 10:59:50', '2023-03-12 08:57:12', NULL),
(71, 'about_why_choose_sub_title', 'Why Choose Us', '2023-03-04 11:59:45', '2023-03-04 11:59:45', NULL),
(72, 'about_why_choose_title', 'We do not Buy from the <br> Open Market', '2023-03-04 11:59:45', '2023-03-04 11:59:45', NULL),
(73, 'about_why_choose_text', 'Compellingly fashion intermandated opportunities and multimedia based fnsparent e-business.', '2023-03-04 11:59:45', '2023-03-04 11:59:45', NULL),
(74, 'about_why_choose_banner', '62', '2023-03-04 11:59:45', '2023-03-04 11:59:45', NULL),
(75, 'about_us_why_choose_us', '[]', '2023-03-04 12:05:13', '2023-03-12 08:57:43', NULL),
(76, 'admin_panel_logo', '17', '2023-03-04 14:37:03', '2023-05-29 12:36:34', NULL),
(77, 'favicon', '13', '2023-03-04 14:37:03', '2023-05-29 16:43:38', NULL),
(78, 'invoice_thanksgiving', 'Thank you for shopping from our store and for your order. it is really awesome to have you as one of our paid users. We hope that you will be happy with Qlearly, if you ever have any questions, suggestions or concerns please do not hesitate to contact us.', '2023-03-07 12:04:15', '2023-03-07 12:09:20', NULL),
(79, 'navbar_logo_white', '15', '2023-05-29 12:34:46', '2023-05-29 12:34:46', NULL),
(80, 'navbar_logo_dark', '14', '2023-05-29 12:34:46', '2023-05-29 12:34:46', NULL),
(81, 'navbar_template_groups', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"7\"]', '2023-05-29 12:34:46', '2023-05-29 12:35:25', NULL),
(82, 'contact_email', 'admin@themetags.com', '2023-05-29 12:36:34', '2023-05-29 14:20:02', NULL),
(83, 'contact_phone', '540-907-0453', '2023-05-29 12:36:34', '2023-05-29 14:20:02', NULL),
(84, 'enable_maintenance_mode', '0', '2023-05-29 12:36:34', '2023-05-29 12:36:34', NULL),
(85, 'global_meta_title', NULL, '2023-05-29 12:36:34', '2023-05-29 12:36:34', NULL),
(86, 'global_meta_description', NULL, '2023-05-29 12:36:34', '2023-05-29 12:36:34', NULL),
(87, 'global_meta_keywords', NULL, '2023-05-29 12:36:34', '2023-05-29 12:36:34', NULL),
(88, 'global_meta_image', NULL, '2023-05-29 12:36:34', '2023-05-29 12:36:34', NULL),
(89, 'hero_title', 'Whatever You Need, Just Ask', '2023-05-29 12:47:17', '2023-05-29 12:49:47', NULL),
(90, 'hero_colorful_title', 'WriteBot  Has The Answers', '2023-05-29 12:47:17', '2023-05-29 12:47:17', NULL),
(91, 'hero_sub_title', 'Tell us what you want our WriteBot AI will create the marketing copy for you, It\'s that simple. AI blog writer that gives you more time to focus on the things you love.', '2023-05-29 12:47:17', '2023-05-29 12:56:23', NULL),
(92, 'hero_background_image', '8', '2023-05-29 12:47:17', '2023-05-29 12:47:17', NULL),
(93, 'hero_animated_image', '9', '2023-05-29 12:47:17', '2023-05-29 12:47:17', NULL),
(94, 'homepage_trusted_by_title', 'Trusted & Used by 1,245+ Companies', '2023-05-29 13:01:27', '2023-05-29 13:01:44', NULL),
(95, 'homepage_trusted_by_images', '22,21,20,19,18,26,23,24,25', '2023-05-29 13:01:27', '2023-05-29 13:01:27', NULL),
(96, 'how_it_works_1_title', 'Select Template', '2023-05-29 13:05:33', '2023-05-29 13:05:33', NULL),
(97, 'how_it_works_1_sub_title', 'Select template first that you want to generate content', '2023-05-29 13:05:33', '2023-05-29 13:05:33', NULL),
(98, 'how_it_works_1_short_description', 'Learn why businesses everywhere are leveraging AI to create sales and marketing campaigns for faster, more sustainable growth.', '2023-05-29 13:05:33', '2023-05-29 13:19:49', NULL),
(99, 'how_it_works_1_features', 'Select the personalized template,\r\nWrite the prompt or context that you want to generate,\r\nGenerate product descriptions', '2023-05-29 13:05:33', '2023-05-29 13:20:51', NULL),
(100, 'how_it_works_1_btn_title', 'Select Your Template', '2023-05-29 13:05:33', '2023-05-29 13:05:33', NULL),
(101, 'how_it_works_1_btn_link', 'https://writebot.themetags.com/dashboard/templates', '2023-05-29 13:05:33', '2023-05-29 13:05:33', NULL),
(102, 'how_it_works_1_image', '11', '2023-05-29 13:05:33', '2023-05-29 13:05:33', NULL),
(103, 'how_it_works_2_title', 'Write Your Prompt or Context', '2023-05-29 13:05:33', '2023-05-29 13:07:49', NULL),
(104, 'how_it_works_2_sub_title', 'Enter a few sentences about your brand and products', '2023-05-29 13:05:33', '2023-05-29 13:07:49', NULL),
(105, 'how_it_works_2_short_description', 'Increase the quality of your output by working with Chat by WriteBot prebuilt prompts. This helps you guide our software to better content and Choose from emails, social posts, long-form blog posts, and more!', '2023-05-29 13:05:33', '2023-05-29 13:28:43', NULL),
(106, 'how_it_works_2_features', 'Write or select WriteBot prebuilt prompts, \r\nPrompts include helpful commands for generateing purfect content,\r\nGenerate personalized copy for sales outreach', '2023-05-29 13:05:33', '2023-05-29 13:25:49', NULL),
(107, 'how_it_works_2_btn_title', 'Write Prompts', '2023-05-29 13:05:33', '2023-05-29 13:07:49', NULL),
(108, 'how_it_works_2_btn_link', 'https://writebot.themetags.com/dashboard/templates/blog-section', '2023-05-29 13:05:33', '2023-05-29 13:07:49', NULL),
(109, 'how_it_works_2_image', '12', '2023-05-29 13:05:33', '2023-05-29 13:07:49', NULL),
(110, 'how_it_works_3_title', 'Select Advance Option & Generate', '2023-05-29 13:05:33', '2023-05-29 13:13:27', NULL),
(111, 'how_it_works_3_sub_title', 'Multiple options for each campaign that you’re working on', '2023-05-29 13:05:33', '2023-05-29 13:12:29', NULL),
(112, 'how_it_works_3_short_description', 'Experience the full power of an AI content generator that delivers premium results in seconds. Get better results in a fraction of the time.', '2023-05-29 13:05:33', '2023-05-29 13:29:31', NULL),
(113, 'how_it_works_3_features', 'Scrape websites for public data,\r\nGenerate personalized copy for sales outreach,\r\nSummarize YouTube videos into key bullet points', '2023-05-29 13:05:33', '2023-05-29 13:30:22', NULL),
(114, 'how_it_works_3_btn_title', 'Chose Advance Options', '2023-05-29 13:05:33', '2023-05-29 13:11:40', NULL),
(115, 'how_it_works_3_btn_link', 'https://writebot.themetags.com/dashboard/templates/blog-section', '2023-05-29 13:05:33', '2023-05-29 13:11:40', NULL),
(116, 'how_it_works_3_image', '10', '2023-05-29 13:05:33', '2023-05-29 13:11:40', NULL),
(117, 'how_it_works_4_title', 'Edit, Polish, and Publish', '2023-05-29 13:05:33', '2023-05-29 13:13:27', NULL),
(118, 'how_it_works_4_sub_title', 'Just copy and paste the work into your CMS for publishing', '2023-05-29 13:05:33', '2023-05-29 13:11:40', NULL),
(119, 'how_it_works_4_short_description', 'Use WriteBot editor to rewrite paragraphs and polish up sentences. Then, just copy and paste the work into your CMS for publishing.', '2023-05-29 13:05:33', '2023-05-29 13:34:10', NULL),
(120, 'how_it_works_4_features', 'Edit Polish  and Publish with Ease using WriteBot,\r\nGenerate high-converting copy for all your campaigns,\r\nNo software can be a silver-bullet solution for any business', '2023-05-29 13:05:33', '2023-05-29 13:35:20', NULL),
(121, 'how_it_works_4_btn_title', 'Copy and Publish', '2023-05-29 13:05:33', '2023-05-29 13:15:12', NULL),
(122, 'how_it_works_4_btn_link', 'https://writebot.themetags.com/dashboard/templates/blog-section', '2023-05-29 13:05:33', '2023-05-29 13:15:12', NULL),
(123, 'how_it_works_4_image', '2', '2023-05-29 13:05:33', '2023-05-29 13:11:40', NULL),
(124, 'feature_image_1_title', 'We Provide Useful Template that Helps Your Business', '2023-05-29 13:40:57', '2023-05-29 13:40:57', NULL),
(125, 'feature_image_1_short_description', 'This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', '2023-05-29 13:40:57', '2023-05-29 13:40:57', NULL),
(126, 'feature_image_1_image', '7', '2023-05-29 13:40:57', '2023-05-29 13:40:57', NULL),
(127, 'feature_image_2_title', 'Write Content', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(128, 'feature_image_2_image', '5', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(129, 'feature_image_3_title', 'Generate AI Images', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(130, 'feature_image_3_image', '4', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(131, 'feature_image_4_title', 'Generate Code', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(132, 'feature_image_4_image', '3', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(133, 'feature_image_5_title', 'Speech to Text Generate', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(134, 'feature_image_5_image', '6', '2023-05-29 13:40:57', '2023-05-29 13:42:30', NULL),
(135, 'cta_colored_title', 'Let\'s Try! Ready to level-up?', '2023-05-29 14:11:00', '2023-05-29 14:13:34', NULL),
(136, 'cta_heading_title', 'Start Your 30-Day Free Trial', '2023-05-29 14:11:00', '2023-05-29 14:11:00', NULL),
(137, 'cta_short_description', 'Write 10x faster, engage your audience, & never struggle with the blank page again.', '2023-05-29 14:11:00', '2023-05-29 14:11:00', NULL),
(138, 'cta_btn_title', 'Get Started - It\'s Free', '2023-05-29 14:11:00', '2023-05-29 14:11:00', NULL),
(139, 'cta_btn_link', NULL, '2023-05-29 14:11:00', '2023-05-29 14:11:00', NULL),
(140, 'cta_features', '2000 free words per month, \r\nNo credit card is required,\r\n90+ content types to explore', '2023-05-29 14:11:00', '2023-05-29 14:12:15', NULL),
(141, 'login_leftbar_title', 'Check Out What Our Customers are <br> Saying', '2023-05-29 16:26:10', '2023-05-29 17:15:21', NULL),
(142, 'login_leftbar_colored_title', '(10,000+ 5 Star Reviews)', '2023-05-29 16:26:10', '2023-05-29 17:15:21', NULL),
(143, 'login_rightbar_title', 'Get Started with 10,000 Free Words', '2023-05-29 16:26:10', '2023-05-29 17:15:21', NULL),
(144, 'login_rightbar_sub_title', 'No credit card required!', '2023-05-29 16:26:10', '2023-05-29 17:15:21', NULL),
(145, 'enable_recaptcha', '0', '2023-05-29 16:26:10', '2023-05-29 16:26:10', NULL),
(146, 'enable_paypal', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(147, 'paypal_sandbox', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(148, 'enable_stripe', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(149, 'enable_paytm', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(150, 'enable_razorpay', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(151, 'enable_iyzico', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(152, 'iyzico_sandbox', '1', '2023-05-29 17:50:42', '2023-05-29 17:50:42', NULL),
(153, 'facebook_login', '1', '2023-05-29 18:11:19', '2023-05-29 18:11:19', NULL),
(154, 'affiliate_commission', '10', '2023-06-02 11:14:34', '2023-06-02 11:14:44', NULL),
(155, 'minimum_withdrawal_amount', '10', '2023-06-02 11:14:34', '2023-06-02 11:14:44', NULL),
(156, 'enable_affiliate_continuous_commission', '1', '2023-06-02 11:14:34', '2023-06-02 11:14:34', NULL),
(157, 'affiliate_payout_payment_methods', '[\"bank_payment\",\"paypal\"]', '2023-06-02 11:14:34', '2023-06-02 11:14:34', NULL),
(158, 'enable_affiliate_system', '1', '2023-06-02 11:14:34', '2023-06-02 11:14:52', NULL),
(159, 'default_creativity', '1', '2023-06-05 09:22:25', '2023-06-05 09:22:25', NULL),
(160, 'default_tone', 'Friendly', '2023-06-05 09:22:25', '2023-06-05 09:22:25', NULL),
(161, 'default_number_of_results', '1', '2023-06-05 09:22:25', '2023-06-05 09:22:25', NULL),
(162, 'default_max_result_length', '250', '2023-06-05 09:22:25', '2023-06-05 09:22:25', NULL),
(163, 'ai_filter_bad_words', NULL, '2023-06-05 09:22:25', '2023-06-05 09:22:25', NULL),
(164, 'default_open_ai_model', 'gpt-3.5-turbo', '2023-06-05 09:22:25', '2023-06-05 09:22:25', NULL),
(165, 'enable_cookie_consent', '1', '2023-06-07 17:15:27', '2023-06-07 17:16:13', NULL),
(166, 'cookie_consent_text', '<p><font color=\"#636363\">This Cookie Policy explains how WriteBot (\"we,\" \"us,\" or \"our\") uses cookies and similar tracking technologies when you visit our website<a href=\"https://writebot.themetags.com/\" target=\"_blank\"> </a><a href=\"https://writebot.themetags.com/\" target=\"_blank\">https://writebot.themetags.com/</a><a href=\"https://writebot.themetags.com/\" target=\"_blank\"> </a>(\"Website\"). This policy applies to all users of our Website.</font><br></p>', '2023-06-07 17:15:27', '2023-06-07 17:17:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'WriteBot', '2023-05-29 15:10:42', '2023-05-29 15:10:42', NULL),
(3, 'OpenAI', '2023-05-29 15:10:51', '2023-05-29 15:10:51', NULL),
(4, 'ContentGenerator', '2023-05-29 15:11:00', '2023-05-29 15:11:00', NULL),
(5, 'SaaSPlatform', '2023-05-29 15:11:10', '2023-05-29 15:11:10', NULL),
(6, 'AIWritingAssistant', '2023-05-29 15:11:23', '2023-05-29 15:11:23', NULL),
(7, 'AiChat', '2023-05-29 15:12:13', '2023-05-29 15:12:13', NULL),
(8, 'AiChat', '2023-05-29 15:12:14', '2023-05-29 15:12:14', NULL),
(9, 'AiImage', '2023-05-29 15:12:31', '2023-05-29 15:12:31', NULL),
(10, 'ChatGpt', '2023-05-29 15:12:47', '2023-05-29 15:12:47', NULL),
(11, 'ContentMarketing', '2023-05-29 15:13:17', '2023-05-29 15:13:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_group_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` bigint(20) DEFAULT NULL,
  `total_words_generated` bigint(20) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `template_group_id`, `name`, `slug`, `code`, `description`, `fields`, `icon`, `total_words_generated`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Blog Section', 'blog-section', 'blog-section', 'Write a blog section with the key points of your article', '\"[{        \\\"label\\\": \\\"Title of the blog\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"        }},{        \\\"label\\\": \\\"What are the main points you want to cover?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"key_points\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. dosa, biriyani, tandoori chicken\\\"        }}]\"', NULL, 29831, 1, '2023-05-29 12:29:18', '2023-06-17 19:11:24', NULL),
(2, 1, 'Blog Ideas', 'blog-ideas', 'blog-ideas', 'Generate blog ideas for your next post', '\"[{\\t\\\"label\\\": \\\"About what is your blog post?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"\\t}}]\"', NULL, 4968, 1, '2023-05-29 12:29:18', '2023-06-17 14:43:50', NULL),
(3, 1, 'Blog Title', 'blog-title', 'blog-title', 'Generate blog title for your next post', '\"[{\\t\\\"label\\\": \\\"About what is your blog post?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"\\t}}]\"', NULL, 2127, 1, '2023-05-29 12:29:18', '2023-06-17 01:07:03', NULL),
(4, 1, 'Blog Intro', 'blog-intro', 'blog-intro', 'Generate blog intro for your next post', '\"[{        \\\"label\\\": \\\"Title of the blog\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"        }},{        \\\"label\\\": \\\"About what is your blog post?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"\\\"        }}]\"', NULL, 367, 1, '2023-05-29 12:29:18', '2023-06-17 18:29:05', NULL),
(5, 1, 'Blog Conclusion', 'blog-conclusion', 'blog-conclusion', 'Generate blog conclusion for your next post', '\"[{        \\\"label\\\": \\\"Title of the blog\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"        }},{        \\\"label\\\": \\\"About what is your blog post?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"\\\"        }}]\"', NULL, 655, 1, '2023-05-29 12:29:18', '2023-06-11 23:57:53', NULL),
(6, 1, 'Blog Tags', 'blog-tags', 'blog-tags', 'Generate blog tags for your next post', '\"[{        \\\"label\\\": \\\"About what is your blog post?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"        }}]\"', NULL, 3044, 1, '2023-05-29 12:29:18', '2023-06-17 19:23:18', NULL),
(7, 1, 'Blog Summary', 'blog-summary', 'blog-summary', 'Generate blog summary for your next post', '\"[{        \\\"label\\\": \\\"About what is your blog post?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"        }}]\"', NULL, 2087, 1, '2023-05-29 12:29:18', '2023-06-17 17:02:07', NULL),
(8, 2, 'Confirmation Email', 'confirmation-email', 'confirmation-email', NULL, '\"[{        \\\"label\\\": \\\"What is recipient name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Ryan Toland\\\"        }},{        \\\"label\\\": \\\"About what is your email?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Signing up to a web app\\\"        }}]\"', NULL, 584, 1, '2023-05-29 12:29:18', '2023-06-17 18:43:44', NULL),
(9, 2, 'Discount Email', 'discount-email', 'discount-email', NULL, '\"[{\\t\\\"label\\\": \\\"About what is your email?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Get discount on first purchase (of product name\\/from company name)\\\"\\t}}]\"', NULL, 166, 1, '2023-05-29 12:29:18', '2023-06-17 10:37:41', NULL),
(10, 2, 'Testimonial Email', 'testimonial-email', 'testimonial-email', NULL, '\"[{\\t\\\"label\\\": \\\"What is recipient name?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Ryan Toland\\\"\\t}},{\\t\\\"label\\\": \\\"About what is your email?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. For serving the company with sincerity\\\"\\t}}]\"', NULL, 365, 1, '2023-05-29 12:29:18', '2023-06-17 08:37:43', NULL),
(11, 2, 'Promotional Email', 'promotional-email', 'promotional-email', NULL, '\"[{\\t\\\"label\\\": \\\"What is recipient name?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Ryan Toland\\\"\\t}},{\\t\\\"label\\\": \\\"About what is your email?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. For serving the company with sincerity\\\"\\t}}]\"', NULL, 243, 1, '2023-05-29 12:29:18', '2023-06-12 12:34:46', NULL),
(12, 2, 'Follow Up Email', 'follow-up-email', 'follow-up-email', NULL, '\"[{\\t\\\"label\\\": \\\"About what is your email?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Following up after an interview\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(13, 3, 'Discount Promotion', 'discount-promotion', 'discount-promotion', NULL, '\"[{\\t\\\"label\\\": \\\"What is title for the promotion?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"title\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Get exclusive discounts on Eid occasion\\\"\\t}},{\\t\\\"label\\\": \\\"About what is the discount?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Get discount on first purchase (of product name\\/from company name)\\\"\\t}}]\"', NULL, 603, 1, '2023-05-29 12:29:18', '2023-06-17 06:50:37', NULL),
(14, 3, 'Social Media Bio', 'social-media-bio', 'social-media-bio', NULL, '\"[{\\t\\\"label\\\": \\\"What are the main points you want to cover?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"key_points\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Entrepreneur, Writer, Photographer\\\"\\t}}]\"', NULL, 6462, 1, '2023-05-29 12:29:18', '2023-06-17 10:49:28', NULL),
(15, 3, 'Facebook Ads', 'facebook-ads', 'facebook-ads', NULL, '\"[{        \\\"label\\\": \\\"Who is your targetted audiences?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"audience\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Children, Couple\\\"        }},{        \\\"label\\\": \\\"What is the name of the product?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. iPhone 14 Pro\\\"        }},{        \\\"label\\\": \\\"Product Description\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"description\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type product description\\\"        }}]\"', NULL, 1541, 1, '2023-05-29 12:29:18', '2023-06-17 18:37:54', NULL),
(16, 3, 'Instagram Captions', 'instagram-captions', 'instagram-captions', NULL, '\"[{        \\\"label\\\": \\\"About what is your instagram post?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Travelling the world\\\"        }}]\"', NULL, 228, 1, '2023-05-29 12:29:18', '2023-06-11 20:18:22', NULL),
(17, 3, 'Social Media Post', 'social-media-post', 'social-media-post', NULL, '\"[{\\t\\\"label\\\": \\\"About what is your post?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Travelling the world\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(18, 3, 'Event Promotion', 'event-promotion', 'event-promotion', NULL, '\"[{        \\\"label\\\": \\\"Title of the event\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Celebration of victory day\\\"        }},{        \\\"label\\\": \\\"About what is your event?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type short description about the event\\\"        }}]\"', NULL, 915, 1, '2023-05-29 12:29:18', '2023-06-17 00:57:10', NULL),
(19, 3, 'Google Ads Headlines', 'google-ads-headlines', 'google-ads-headlines', NULL, '\"[{\\t\\\"label\\\": \\\"Who is your targetted audience?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"audience\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Children, Couple\\\"\\t}},{\\t\\\"label\\\": \\\"What is the name of the product?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. iPhone 14 Pro\\\"\\t}},{\\t\\\"label\\\": \\\"Product Description\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"description\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type product description\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(20, 3, 'Google Ads Description', 'google-ads-description', 'google-ads-description', NULL, '\"[{\\t\\\"label\\\": \\\"Who is your targetted audience?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"audience\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Children, Couple\\\"\\t}},{\\t\\\"label\\\": \\\"What is the name of the product?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. iPhone 14 Pro\\\"\\t}},{\\t\\\"label\\\": \\\"Product Description\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"description\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type product description\\\"\\t}}]\"', NULL, 165, 1, '2023-05-29 12:29:18', '2023-06-17 07:54:33', NULL),
(21, 4, 'Youtube Video Title', 'youtube-video-title', 'youtube-video-title', NULL, '\"[{        \\\"label\\\": \\\"About what is the video?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the video\\\"        }}]\"', NULL, 410, 1, '2023-05-29 12:29:18', '2023-06-17 09:08:55', NULL),
(22, 4, 'Youtube Video Description', 'youtube-video-description', 'youtube-video-description', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the video?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the video\\\"\\t}}]\"', NULL, 319, 1, '2023-05-29 12:29:18', '2023-06-12 00:53:42', NULL),
(23, 4, 'Youtube Video Tag Generator', 'youtube-video-tag-generator', 'youtube-video-tag-generator', NULL, '\"[{        \\\"label\\\": \\\"About what is the video?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the video\\\"        }}]\"', NULL, 125, 1, '2023-05-29 12:29:18', '2023-06-16 21:57:46', NULL),
(24, 5, 'Website FAQ', 'website-faq', 'website-faq', NULL, '\"[{        \\\"label\\\": \\\"About what is the FAQ?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(25, 5, 'Website FAQ Answers', 'website-faq-answers', 'website-faq-answers', NULL, '\"[{\\t\\\"label\\\": \\\"What is the question?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"question\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Do we provide support for 24\\/7?\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(26, 5, 'Website Review', 'website-review', 'website-review', NULL, '\"[{\\t\\\"label\\\": \\\"What is the name of the product?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. iPhone 14 Pro\\\"\\t}},{\\t\\\"label\\\": \\\"Product Description\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"description\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type product description\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(27, 5, 'Website Title', 'website-title', 'website-title', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the website?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the website\\\"\\t}}]\"', NULL, 2762, 1, '2023-05-29 12:29:18', '2023-06-17 03:57:53', NULL),
(28, 5, 'Website Meta Tags', 'website-meta-tags', 'website-meta-tags', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the website?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the website\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(29, 5, 'Website Meta Description', 'website-meta-description', 'website-meta-description', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the website?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the website\\\"\\t}}]\"', NULL, 1521, 1, '2023-05-29 12:29:18', '2023-06-17 19:25:55', NULL),
(30, 5, 'Website About Us', 'website-about-us', 'website-about-us', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the website?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the website\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(31, 6, 'Article Generator', 'article-generator', 'article-generator', NULL, '\"[{        \\\"label\\\": \\\"Title of the article\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"        }},{        \\\"label\\\": \\\"What are the main points you want to cover?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"key_points\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. dosa, biriyani, tandoori chicken\\\"        }}]\"', NULL, 525081, 1, '2023-05-29 12:29:18', '2023-06-19 10:23:22', NULL),
(32, 6, 'Paragraph Generator', 'paragraph-generator', 'paragraph-generator', NULL, '\"[{\\t\\\"label\\\": \\\"Title of the paragraph\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"title\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. best restaurants in LA to eat indian foods\\\"\\t}},{\\t\\\"label\\\": \\\"What are the main points you want to cover?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"key_points\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. dosa, biriyani, tandoori chicken\\\"\\t}}]\"', NULL, 2943, 1, '2023-05-29 12:29:18', '2023-06-17 16:00:20', NULL),
(33, 6, 'Content Rewriter', 'content-rewriter', 'content-rewriter', NULL, '\"[{        \\\"label\\\": \\\"What would you like to rewrite?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"contents\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type your content here to rewrite\\\"        }},{        \\\"label\\\": \\\"What are the main points you want to cover?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"key_points\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. key point 1, key point 2\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(34, 6, 'Product Description', 'product-description', 'product-description', NULL, '\"[{\\t\\\"label\\\": \\\"What is the name of the product?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. iPhone 14 Pro\\\"\\t}}]\"', NULL, 572, 1, '2023-05-29 12:29:18', '2023-06-17 06:48:08', NULL),
(35, 6, 'Product Name Generator', 'product-name-generator', 'product-name-generator', NULL, '\"[{\\t\\\"label\\\": \\\"Product Description\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"description\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type product description\\\"\\t}}]\"', NULL, 3546, 1, '2023-05-29 12:29:18', '2023-06-19 10:06:32', NULL),
(36, 6, 'Product Summarize Text', 'product-summarize-text', 'product-summarize-text', NULL, '\"[{\\t\\\"label\\\": \\\"What is the name of the product?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"name\\\",\\t\\t\\\"type\\\": \\\"text\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. iPhone 14 Pro\\\"\\t}},{\\t\\\"label\\\": \\\"Product Description\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"description\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type product description\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(37, 6, 'Grammar Checker', 'grammar-checker', 'grammar-checker', NULL, '\"[{        \\\"label\\\": \\\"Type content you would like to check grammar\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"contents\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type your content here to check grammar\\\"        }}]\"', NULL, 363, 1, '2023-05-29 12:29:18', '2023-06-17 15:16:49', NULL),
(38, 6, 'Creative Story', 'creative-story', 'creative-story', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(39, 6, 'Startup Name Generator', 'startup-name-generator', 'startup-name-generator', NULL, '\"[{\\t\\\"label\\\": \\\"Start Up Description\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"description\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type start up description\\\"\\t}}]\"', NULL, 711, 1, '2023-05-29 12:29:18', '2023-06-17 00:07:00', NULL),
(40, 6, 'Pros & Cons', 'pros-cons', 'pros-cons', NULL, '\"[{        \\\"label\\\": \\\"What is the topic?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"topic\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Using mobile phone\\\"        }}]\"', NULL, 594, 1, '2023-05-29 12:29:18', '2023-06-17 06:45:42', NULL),
(41, 6, 'Job Description', 'job-description', 'job-description', NULL, '\"[{        \\\"label\\\": \\\"What is the job position?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"position\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. What is the position of the job?\\\"        }},{        \\\"label\\\": \\\"What are the core requirements?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"requirements\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type requirements for the position\\\"        }}]\"', NULL, 309, 1, '2023-05-29 12:29:18', '2023-06-05 13:34:02', NULL),
(42, 6, 'Rejection Letter', 'rejection-letter', 'rejection-letter', NULL, '\"[{        \\\"label\\\": \\\"What is recipient name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Ryan Toland\\\"        }},{        \\\"label\\\": \\\"About what is the rejection letter?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Rejection letter of the job application for the position of software engineer\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(43, 6, 'Offer Letter', 'offer-letter', 'offer-letter', NULL, '\"[{        \\\"label\\\": \\\"What is recipient name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Ryan Toland\\\"        }},{        \\\"label\\\": \\\"About what is the offer letter?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Offer letter of the job for the position of software engineer\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(44, 6, 'Promotion Letter', 'promotion-letter', 'promotion-letter', NULL, '\"[{        \\\"label\\\": \\\"What is recipient name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Ryan Toland\\\"        }},{        \\\"label\\\": \\\"What was the previous position?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"previous_position\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Junior executive\\\"        }},{        \\\"label\\\": \\\"What is the new position?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"new_position\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Executive\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(45, 7, 'Motivational Quote', 'motivational-quote', 'motivational-quote', NULL, '\"[{        \\\"label\\\": \\\"About what you want to generate motivational quote?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Emotional breakdown, economical breakdown, career issue\\\"        }}]\"', NULL, 2594, 1, '2023-05-29 12:29:18', '2023-06-17 11:00:58', NULL),
(46, 7, 'Song Lyrics', 'song-lyrics', 'song-lyrics', NULL, '\"[{        \\\"label\\\": \\\"Title of the song and name of the singer\\/writer\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. 500 miles by Hedy West\\\"        }}]\"', NULL, 1354, 1, '2023-05-29 12:29:18', '2023-06-12 09:08:37', NULL),
(47, 7, 'Short Story', 'short-story', 'short-story', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(48, 7, 'Wedding Quote', 'wedding-quote', 'wedding-quote', NULL, '\"[{        \\\"label\\\": \\\"What are the key points?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"key_points\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Love, Forever, Soulmate\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(49, 7, 'Birthday Wish Quote', 'birthday-wish-quote', 'birthday-wish-quote', NULL, '\"[{\\t\\\"label\\\": \\\"What are the key points?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"key_points\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Long live, happy\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(50, 8, 'Story Outline', 'story-outline', 'story-outline', NULL, '\"[{        \\\"label\\\": \\\"About what is the story?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the story\\\"        }}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(51, 8, 'Story Title & Subtitle', 'story-title-subtitle', 'story-title-subtitle', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(52, 8, 'Story Ideas', 'story-ideas', 'story-ideas', NULL, '\"[{        \\\"label\\\": \\\"What are the key points?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"key_points\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Benefit of new AI technologies\\\"        }}]\"', NULL, 1127, 1, '2023-05-29 12:29:18', '2023-06-10 15:25:34', NULL),
(53, 9, 'TikTok Video Script', 'tiktok-video-script', 'tiktok-video-script', NULL, '\"[{\\t\\\"label\\\": \\\"What are the key points?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"key_points\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Fun, prank, popular tune\\\"\\t}}]\"', NULL, 4489, 1, '2023-05-29 12:29:18', '2023-06-17 19:21:13', NULL),
(54, 9, 'TikTok Video Caption', 'tiktok-video-caption', 'tiktok-video-caption', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the video?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the video\\\"\\t}}]\"', NULL, 239, 1, '2023-05-29 12:29:18', '2023-06-12 07:20:54', NULL),
(55, 9, 'Video Ideas', 'video-ideas', 'video-ideas', NULL, '\"[{\\t\\\"label\\\": \\\"What are the key points?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"key_points\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"e.g. Fun, prank, popular tune\\\"\\t}}]\"', NULL, 1313, 1, '2023-05-29 12:29:18', '2023-06-17 18:17:57', NULL),
(56, 10, 'Instagram Story Ideas', 'instagram-story-ideas', 'instagram-story-ideas', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 2001, 1, '2023-05-29 12:29:18', '2023-06-16 20:21:47', NULL),
(57, 10, 'Instagram Post Ideas', 'instagram-post-ideas', 'instagram-post-ideas', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 0, 1, '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(58, 10, 'Instagram Reel Ideas', 'instagram-reel-ideas', 'instagram-reel-ideas', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 295, 1, '2023-05-29 12:29:18', '2023-06-11 20:07:48', NULL),
(59, 10, 'Instagram Hashtag', 'instagram-hashtag', 'instagram-hashtag', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 368, 1, '2023-05-29 12:29:18', '2023-06-17 19:14:55', NULL),
(60, 11, 'Career', 'career', 'career', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 752, 1, '2023-05-29 12:29:18', '2023-06-12 00:03:32', NULL),
(61, 11, 'Business', 'business', 'business', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 1561, 1, '2023-05-29 12:29:18', '2023-06-17 11:16:05', NULL),
(62, 11, 'Start up', 'start-up', 'start-up', NULL, '\"[{\\t\\\"label\\\": \\\"About what is the story?\\\",\\t\\\"is_required\\\": true,\\t\\\"field\\\":\\t{\\t\\t\\\"name\\\": \\\"about\\\",\\t\\t\\\"type\\\": \\\"textarea\\\",\\t\\t\\\"placeholder\\\": \\\"Type description of the story\\\"\\t}}]\"', NULL, 5379, 1, '2023-05-29 12:29:18', '2023-06-17 10:38:29', NULL),
(63, 11, 'Matrimonial Website', 'matrimonial-website', 'matrimonial-website', NULL, '\"[{        \\\"label\\\": \\\"What are partners name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. Bride: Tanu, Bridegroom: Manu\\\"        }},{        \\\"label\\\": \\\"Description of their journey\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the story\\\"        }}]\"', NULL, 476, 1, '2023-05-29 12:29:18', '2023-06-10 13:35:50', NULL),
(64, 3, 'Twitter Post', 'twitter-post', 'twitter-post', NULL, '\"[{        \\\"label\\\": \\\"About what is your post?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"e.g. Going to watch the champions league final\\\"        }}]\"', NULL, 0, 1, '2023-06-07 17:02:42', '2023-06-07 17:02:42', NULL),
(65, 5, 'Website Terms And Conditions', 'website-terms-and-conditions', 'website-terms-and-conditions', NULL, '\"[{        \\\"label\\\": \\\"What is your website title?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"Type title of the website\\\"        }}]\"', NULL, 0, 1, '2023-06-07 17:02:42', '2023-06-07 17:02:42', NULL),
(66, 5, 'Website Privacy Policy', 'website-privacy-policy', 'website-privacy-policy', NULL, '\"[{        \\\"label\\\": \\\"What is your website title?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"Type title of the website\\\"        }}]\"', NULL, 0, 1, '2023-06-07 17:02:42', '2023-06-07 17:02:42', NULL),
(67, 5, 'Vision of the Company', 'vision-of-the-company', 'vision-of-the-company', NULL, '\"[{        \\\"label\\\": \\\"What is your company name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"Type name of the company\\\"        }},{        \\\"label\\\": \\\"What is your company about?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"Type about of the company\\\"        }}]\"', NULL, 0, 1, '2023-06-07 17:02:42', '2023-06-07 17:02:42', NULL),
(68, 5, 'Mission of the Company', 'mission-of-the-company', 'mission-of-the-company', NULL, '\"[{        \\\"label\\\": \\\"What is your company name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"Type name of the company\\\"        }},{        \\\"label\\\": \\\"What is your company about?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"about\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"Type about of the company\\\"        }}]\"', NULL, 0, 1, '2023-06-07 17:02:42', '2023-06-07 17:02:42', NULL),
(69, 6, 'Academic Essay', 'academic-essay', 'academic-essay', NULL, '\"[{        \\\"label\\\": \\\"Title of the essay\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"e.g. The Newspaper\\\"        }}]\"', NULL, 0, 1, '2023-06-07 17:02:42', '2023-06-07 17:02:42', NULL),
(70, 12, 'Blog Post SEO Meta Description', 'blog-post-seo-meta-description', 'blog-post-seo-meta-description', NULL, '\"[{        \\\"label\\\": \\\"What is your blog title?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"title\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"\\\"        }},{        \\\"label\\\": \\\"Description of your blog\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"description\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the blog\\\"        }}]\"', NULL, 0, 1, '2023-06-11 16:42:16', '2023-06-11 16:42:16', NULL),
(71, 12, 'Home Page SEO Meta Description', 'home-page-seo-meta-description', 'home-page-seo-meta-description', NULL, '\"[{        \\\"label\\\": \\\"What is your website branding name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"\\\"        }},{        \\\"label\\\": \\\"Description of your website\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"description\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the website\\\"        }}]\"', NULL, 0, 1, '2023-06-11 16:42:16', '2023-06-11 16:42:16', NULL),
(72, 12, 'Product Page SEO Meta Description', 'product-page-seo-meta-description', 'product-page-seo-meta-description', NULL, '\"[{        \\\"label\\\": \\\"What is your product name?\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"name\\\",                \\\"type\\\": \\\"text\\\",                \\\"placeholder\\\": \\\"\\\"        }},{        \\\"label\\\": \\\"Description of your product\\\",        \\\"is_required\\\": true,        \\\"field\\\":        {                \\\"name\\\": \\\"description\\\",                \\\"type\\\": \\\"textarea\\\",                \\\"placeholder\\\": \\\"Type description of the product\\\"        }}]\"', NULL, 0, 1, '2023-06-11 16:42:16', '2023-06-11 16:42:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_groups`
--

CREATE TABLE `template_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `template_groups`
--

INSERT INTO `template_groups` (`id`, `name`, `slug`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Blog Contents', 'blog-contents', 'book-open', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(2, 'Email Templates', 'email-templates', 'mail', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(3, 'Social Media', 'social-media', 'share-2', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(4, 'Videos', 'videos', 'video', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(5, 'Website Contents', 'website-contents', 'monitor', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(6, 'General Contents', 'general-contents', 'file-text', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(7, 'Fun or Quote', 'fun-or-quote', 'tv', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(8, 'Medium', 'medium', 'code', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(9, 'TikTok', 'tiktok', 'film', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(10, 'Instagram', 'instagram', 'instagram', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(11, 'Success Story', 'success-story', 'smile', '2023-05-29 12:29:18', '2023-05-29 12:29:18', NULL),
(12, 'SEO Tools', 'seo-tools', 'file-text', '2023-06-11 16:42:16', '2023-06-11 16:42:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_usages`
--

CREATE TABLE `template_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `custom_template_id` int(11) DEFAULT NULL,
  `total_used_words` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `template_usages`
--

INSERT INTO `template_usages` (`id`, `user_id`, `template_id`, `custom_template_id`, `total_used_words`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 53, NULL, 528, '2023-06-07 17:16:51', '2023-06-07 17:16:51', NULL),
(2, 1, 0, 1, 225, '2023-06-07 17:25:07', '2023-06-07 17:25:07', NULL),
(3, 2, 1, NULL, 1276, '2023-06-10 08:52:50', '2023-06-10 08:52:50', NULL),
(4, 2, 21, NULL, 59, '2023-06-10 11:29:22', '2023-06-10 11:29:22', NULL),
(5, 1, 1, NULL, 1571, '2023-06-10 11:39:10', '2023-06-10 11:39:10', NULL),
(6, 1, 2, NULL, 1078, '2023-06-10 12:18:58', '2023-06-10 12:18:58', NULL),
(7, 2, 31, NULL, 1632, '2023-06-10 13:31:03', '2023-06-10 13:31:03', NULL),
(8, 2, 31, NULL, 1926, '2023-06-10 13:32:09', '2023-06-10 13:32:09', NULL),
(9, 2, 10, NULL, 172, '2023-06-10 13:33:33', '2023-06-10 13:33:33', NULL),
(10, 1, 63, NULL, 292, '2023-06-10 13:35:11', '2023-06-10 13:35:11', NULL),
(11, 1, 63, NULL, 476, '2023-06-10 13:35:50', '2023-06-10 13:35:50', NULL),
(12, 2, 46, NULL, 1081, '2023-06-10 13:35:58', '2023-06-10 13:35:58', NULL),
(13, 2, 1, NULL, 2439, '2023-06-10 14:04:52', '2023-06-10 14:04:52', NULL),
(14, 2, 1, NULL, 4751, '2023-06-10 14:06:00', '2023-06-10 14:06:00', NULL),
(15, 2, 1, NULL, 7748, '2023-06-10 14:06:46', '2023-06-10 14:06:46', NULL),
(16, 2, 1, NULL, 10703, '2023-06-10 14:09:53', '2023-06-10 14:09:53', NULL),
(17, 2, 1, NULL, 13592, '2023-06-10 14:10:32', '2023-06-10 14:10:32', NULL),
(18, 2, 1, NULL, 16192, '2023-06-10 14:11:16', '2023-06-10 14:11:16', NULL),
(19, 2, 1, NULL, 19229, '2023-06-10 14:11:55', '2023-06-10 14:11:55', NULL),
(20, 2, 1, NULL, 21448, '2023-06-10 14:12:25', '2023-06-10 14:12:25', NULL),
(21, 2, 1, NULL, 24175, '2023-06-10 14:12:58', '2023-06-10 14:12:58', NULL),
(22, 2, 1, NULL, 26807, '2023-06-10 14:13:30', '2023-06-10 14:13:30', NULL),
(23, 1, 31, NULL, 4344, '2023-06-10 14:17:44', '2023-06-10 14:17:44', NULL),
(24, 1, 31, NULL, 6714, '2023-06-10 14:18:11', '2023-06-10 14:18:11', NULL),
(25, 1, 31, NULL, 9135, '2023-06-10 14:18:41', '2023-06-10 14:18:41', NULL),
(26, 1, 31, NULL, 11626, '2023-06-10 14:19:08', '2023-06-10 14:19:08', NULL),
(27, 1, 31, NULL, 14003, '2023-06-10 14:19:39', '2023-06-10 14:19:39', NULL),
(28, 1, 31, NULL, 16497, '2023-06-10 14:20:05', '2023-06-10 14:20:05', NULL),
(29, 1, 31, NULL, 18768, '2023-06-10 14:20:31', '2023-06-10 14:20:31', NULL),
(30, 1, 31, NULL, 20970, '2023-06-10 14:20:55', '2023-06-10 14:20:55', NULL),
(31, 1, 31, NULL, 23388, '2023-06-10 14:21:21', '2023-06-10 14:21:21', NULL),
(32, 1, 31, NULL, 26036, '2023-06-10 14:21:48', '2023-06-10 14:21:48', NULL),
(33, 1, 31, NULL, 28658, '2023-06-10 14:22:19', '2023-06-10 14:22:19', NULL),
(34, 1, 31, NULL, 31496, '2023-06-10 14:23:02', '2023-06-10 14:23:02', NULL),
(35, 1, 31, NULL, 33811, '2023-06-10 14:23:27', '2023-06-10 14:23:27', NULL),
(36, 1, 31, NULL, 36311, '2023-06-10 14:23:59', '2023-06-10 14:23:59', NULL),
(37, 1, 31, NULL, 38896, '2023-06-10 14:24:25', '2023-06-10 14:24:25', NULL),
(38, 1, 31, NULL, 41219, '2023-06-10 14:24:52', '2023-06-10 14:24:52', NULL),
(39, 1, 31, NULL, 43945, '2023-06-10 14:25:28', '2023-06-10 14:25:28', NULL),
(40, 1, 31, NULL, 46478, '2023-06-10 14:26:06', '2023-06-10 14:26:06', NULL),
(41, 1, 31, NULL, 48994, '2023-06-10 14:26:34', '2023-06-10 14:26:34', NULL),
(42, 1, 31, NULL, 51524, '2023-06-10 14:27:05', '2023-06-10 14:27:05', NULL),
(43, 1, 31, NULL, 54067, '2023-06-10 14:27:38', '2023-06-10 14:27:38', NULL),
(44, 1, 31, NULL, 56236, '2023-06-10 14:28:00', '2023-06-10 14:28:00', NULL),
(45, 1, 31, NULL, 58657, '2023-06-10 14:28:32', '2023-06-10 14:28:32', NULL),
(46, 1, 31, NULL, 61612, '2023-06-10 14:29:02', '2023-06-10 14:29:02', NULL),
(47, 1, 31, NULL, 64170, '2023-06-10 14:29:27', '2023-06-10 14:29:27', NULL),
(48, 1, 31, NULL, 66402, '2023-06-10 14:29:51', '2023-06-10 14:29:51', NULL),
(49, 1, 31, NULL, 68702, '2023-06-10 14:30:17', '2023-06-10 14:30:17', NULL),
(50, 1, 31, NULL, 71281, '2023-06-10 14:30:49', '2023-06-10 14:30:49', NULL),
(51, 1, 31, NULL, 73364, '2023-06-10 14:31:12', '2023-06-10 14:31:12', NULL),
(52, 1, 31, NULL, 76229, '2023-06-10 14:31:45', '2023-06-10 14:31:45', NULL),
(53, 1, 31, NULL, 78472, '2023-06-10 14:32:13', '2023-06-10 14:32:13', NULL),
(54, 1, 31, NULL, 81026, '2023-06-10 14:32:39', '2023-06-10 14:32:39', NULL),
(55, 1, 31, NULL, 83551, '2023-06-10 14:33:10', '2023-06-10 14:33:10', NULL),
(56, 1, 31, NULL, 86570, '2023-06-10 14:33:49', '2023-06-10 14:33:49', NULL),
(57, 1, 31, NULL, 88863, '2023-06-10 14:34:26', '2023-06-10 14:34:26', NULL),
(58, 1, 31, NULL, 91411, '2023-06-10 14:34:56', '2023-06-10 14:34:56', NULL),
(59, 1, 31, NULL, 93598, '2023-06-10 14:35:23', '2023-06-10 14:35:23', NULL),
(60, 1, 31, NULL, 95977, '2023-06-10 14:35:49', '2023-06-10 14:35:49', NULL),
(61, 1, 31, NULL, 98413, '2023-06-10 14:36:17', '2023-06-10 14:36:17', NULL),
(62, 1, 31, NULL, 100875, '2023-06-10 14:36:57', '2023-06-10 14:36:57', NULL),
(63, 1, 31, NULL, 103193, '2023-06-10 14:37:23', '2023-06-10 14:37:23', NULL),
(64, 1, 27, NULL, 35, '2023-06-10 14:37:37', '2023-06-10 14:37:37', NULL),
(65, 1, 31, NULL, 105981, '2023-06-10 14:37:55', '2023-06-10 14:37:55', NULL),
(66, 1, 31, NULL, 107989, '2023-06-10 14:38:22', '2023-06-10 14:38:22', NULL),
(67, 1, 31, NULL, 110452, '2023-06-10 14:38:53', '2023-06-10 14:38:53', NULL),
(68, 1, 31, NULL, 112680, '2023-06-10 14:39:20', '2023-06-10 14:39:20', NULL),
(69, 1, 31, NULL, 115207, '2023-06-10 14:39:46', '2023-06-10 14:39:46', NULL),
(70, 1, 31, NULL, 117635, '2023-06-10 14:40:15', '2023-06-10 14:40:15', NULL),
(71, 1, 31, NULL, 120076, '2023-06-10 14:40:42', '2023-06-10 14:40:42', NULL),
(72, 1, 31, NULL, 122753, '2023-06-10 14:41:09', '2023-06-10 14:41:09', NULL),
(73, 1, 31, NULL, 125262, '2023-06-10 14:41:37', '2023-06-10 14:41:37', NULL),
(74, 1, 31, NULL, 127420, '2023-06-10 14:42:01', '2023-06-10 14:42:01', NULL),
(75, 1, 31, NULL, 129925, '2023-06-10 14:42:31', '2023-06-10 14:42:31', NULL),
(76, 1, 31, NULL, 132346, '2023-06-10 14:43:02', '2023-06-10 14:43:02', NULL),
(77, 1, 31, NULL, 134598, '2023-06-10 14:43:27', '2023-06-10 14:43:27', NULL),
(78, 1, 31, NULL, 137061, '2023-06-10 14:43:56', '2023-06-10 14:43:56', NULL),
(79, 1, 31, NULL, 139449, '2023-06-10 14:44:23', '2023-06-10 14:44:23', NULL),
(80, 1, 31, NULL, 141854, '2023-06-10 14:45:01', '2023-06-10 14:45:01', NULL),
(81, 1, 31, NULL, 144019, '2023-06-10 14:45:26', '2023-06-10 14:45:26', NULL),
(82, 1, 31, NULL, 146415, '2023-06-10 14:45:55', '2023-06-10 14:45:55', NULL),
(83, 1, 31, NULL, 148869, '2023-06-10 14:46:20', '2023-06-10 14:46:20', NULL),
(84, 2, 31, NULL, 148963, '2023-06-10 14:46:35', '2023-06-10 14:46:35', NULL),
(85, 1, 31, NULL, 151494, '2023-06-10 14:46:53', '2023-06-10 14:46:53', NULL),
(86, 1, 31, NULL, 154088, '2023-06-10 14:47:31', '2023-06-10 14:47:31', NULL),
(87, 1, 31, NULL, 156559, '2023-06-10 14:48:04', '2023-06-10 14:48:04', NULL),
(88, 1, 31, NULL, 158831, '2023-06-10 14:48:34', '2023-06-10 14:48:34', NULL),
(89, 1, 31, NULL, 161379, '2023-06-10 14:49:12', '2023-06-10 14:49:12', NULL),
(90, 1, 31, NULL, 163797, '2023-06-10 14:49:35', '2023-06-10 14:49:35', NULL),
(91, 1, 31, NULL, 166109, '2023-06-10 14:50:01', '2023-06-10 14:50:01', NULL),
(92, 1, 31, NULL, 168923, '2023-06-10 14:50:55', '2023-06-10 14:50:55', NULL),
(93, 1, 31, NULL, 171436, '2023-06-10 14:51:22', '2023-06-10 14:51:22', NULL),
(94, 1, 31, NULL, 174187, '2023-06-10 14:51:49', '2023-06-10 14:51:49', NULL),
(95, 1, 31, NULL, 176795, '2023-06-10 14:52:18', '2023-06-10 14:52:18', NULL),
(96, 1, 31, NULL, 179600, '2023-06-10 14:52:46', '2023-06-10 14:52:46', NULL),
(97, 1, 31, NULL, 182046, '2023-06-10 14:53:37', '2023-06-10 14:53:37', NULL),
(98, 1, 31, NULL, 184569, '2023-06-10 14:54:04', '2023-06-10 14:54:04', NULL),
(99, 1, 31, NULL, 187550, '2023-06-10 14:54:42', '2023-06-10 14:54:42', NULL),
(100, 1, 31, NULL, 190057, '2023-06-10 14:55:18', '2023-06-10 14:55:18', NULL),
(101, 1, 31, NULL, 192282, '2023-06-10 14:56:09', '2023-06-10 14:56:09', NULL),
(102, 1, 31, NULL, 194669, '2023-06-10 14:56:53', '2023-06-10 14:56:53', NULL),
(103, 1, 31, NULL, 197124, '2023-06-10 14:57:46', '2023-06-10 14:57:46', NULL),
(104, 1, 31, NULL, 199535, '2023-06-10 14:58:18', '2023-06-10 14:58:18', NULL),
(105, 1, 31, NULL, 201958, '2023-06-10 14:59:08', '2023-06-10 14:59:08', NULL),
(106, 1, 31, NULL, 204425, '2023-06-10 14:59:39', '2023-06-10 14:59:39', NULL),
(107, 1, 31, NULL, 206953, '2023-06-10 15:00:13', '2023-06-10 15:00:13', NULL),
(108, 1, 31, NULL, 209894, '2023-06-10 15:01:06', '2023-06-10 15:01:06', NULL),
(109, 1, 31, NULL, 212195, '2023-06-10 15:01:38', '2023-06-10 15:01:38', NULL),
(110, 1, 31, NULL, 214718, '2023-06-10 15:02:05', '2023-06-10 15:02:05', NULL),
(111, 1, 31, NULL, 217234, '2023-06-10 15:02:37', '2023-06-10 15:02:37', NULL),
(112, 1, 31, NULL, 219477, '2023-06-10 15:03:04', '2023-06-10 15:03:04', NULL),
(113, 1, 31, NULL, 222043, '2023-06-10 15:03:37', '2023-06-10 15:03:37', NULL),
(114, 1, 31, NULL, 224434, '2023-06-10 15:04:06', '2023-06-10 15:04:06', NULL),
(115, 1, 31, NULL, 227015, '2023-06-10 15:04:39', '2023-06-10 15:04:39', NULL),
(116, 1, 31, NULL, 229489, '2023-06-10 15:05:18', '2023-06-10 15:05:18', NULL),
(117, 1, 31, NULL, 231894, '2023-06-10 15:05:49', '2023-06-10 15:05:49', NULL),
(118, 1, 31, NULL, 234294, '2023-06-10 15:06:26', '2023-06-10 15:06:26', NULL),
(119, 1, 31, NULL, 236892, '2023-06-10 15:07:00', '2023-06-10 15:07:00', NULL),
(120, 1, 31, NULL, 239425, '2023-06-10 15:07:35', '2023-06-10 15:07:35', NULL),
(121, 1, 31, NULL, 241608, '2023-06-10 15:08:06', '2023-06-10 15:08:06', NULL),
(122, 1, 31, NULL, 244103, '2023-06-10 15:08:38', '2023-06-10 15:08:38', NULL),
(123, 1, 31, NULL, 246523, '2023-06-10 15:09:06', '2023-06-10 15:09:06', NULL),
(124, 1, 31, NULL, 249036, '2023-06-10 15:09:34', '2023-06-10 15:09:34', NULL),
(125, 1, 31, NULL, 251450, '2023-06-10 15:10:06', '2023-06-10 15:10:06', NULL),
(126, 1, 31, NULL, 253905, '2023-06-10 15:10:35', '2023-06-10 15:10:35', NULL),
(127, 1, 31, NULL, 256561, '2023-06-10 15:11:23', '2023-06-10 15:11:23', NULL),
(128, 1, 31, NULL, 259132, '2023-06-10 15:11:55', '2023-06-10 15:11:55', NULL),
(129, 1, 31, NULL, 261335, '2023-06-10 15:12:23', '2023-06-10 15:12:23', NULL),
(130, 1, 31, NULL, 263850, '2023-06-10 15:12:53', '2023-06-10 15:12:53', NULL),
(131, 1, 31, NULL, 266306, '2023-06-10 15:13:26', '2023-06-10 15:13:26', NULL),
(132, 1, 31, NULL, 268817, '2023-06-10 15:13:58', '2023-06-10 15:13:58', NULL),
(133, 1, 31, NULL, 271213, '2023-06-10 15:14:27', '2023-06-10 15:14:27', NULL),
(134, 1, 31, NULL, 273682, '2023-06-10 15:15:04', '2023-06-10 15:15:04', NULL),
(135, 1, 31, NULL, 276218, '2023-06-10 15:15:50', '2023-06-10 15:15:50', NULL),
(136, 1, 31, NULL, 278634, '2023-06-10 15:16:23', '2023-06-10 15:16:23', NULL),
(137, 1, 31, NULL, 281332, '2023-06-10 15:16:57', '2023-06-10 15:16:57', NULL),
(138, 1, 31, NULL, 283811, '2023-06-10 15:17:27', '2023-06-10 15:17:27', NULL),
(139, 1, 31, NULL, 286417, '2023-06-10 15:18:09', '2023-06-10 15:18:09', NULL),
(140, 1, 31, NULL, 289097, '2023-06-10 15:18:42', '2023-06-10 15:18:42', NULL),
(141, 1, 31, NULL, 291875, '2023-06-10 15:19:19', '2023-06-10 15:19:19', NULL),
(142, 1, 31, NULL, 294152, '2023-06-10 15:19:49', '2023-06-10 15:19:49', NULL),
(143, 1, 31, NULL, 296451, '2023-06-10 15:20:20', '2023-06-10 15:20:20', NULL),
(144, 1, 31, NULL, 298689, '2023-06-10 15:20:49', '2023-06-10 15:20:49', NULL),
(145, 1, 31, NULL, 301334, '2023-06-10 15:21:37', '2023-06-10 15:21:37', NULL),
(146, 1, 31, NULL, 303662, '2023-06-10 15:22:07', '2023-06-10 15:22:07', NULL),
(147, 1, 31, NULL, 306311, '2023-06-10 15:22:44', '2023-06-10 15:22:44', NULL),
(148, 1, 31, NULL, 308520, '2023-06-10 15:23:11', '2023-06-10 15:23:11', NULL),
(149, 1, 31, NULL, 310948, '2023-06-10 15:23:40', '2023-06-10 15:23:40', NULL),
(150, 1, 31, NULL, 313432, '2023-06-10 15:24:09', '2023-06-10 15:24:09', NULL),
(151, 1, 31, NULL, 315846, '2023-06-10 15:24:40', '2023-06-10 15:24:40', NULL),
(152, 1, 31, NULL, 318406, '2023-06-10 15:25:19', '2023-06-10 15:25:19', NULL),
(153, 1, 52, NULL, 1127, '2023-06-10 15:25:34', '2023-06-10 15:25:34', NULL),
(154, 1, 31, NULL, 320646, '2023-06-10 15:25:56', '2023-06-10 15:25:56', NULL),
(155, 1, 31, NULL, 323247, '2023-06-10 15:26:32', '2023-06-10 15:26:32', NULL),
(156, 1, 31, NULL, 325716, '2023-06-10 15:27:02', '2023-06-10 15:27:02', NULL),
(157, 1, 31, NULL, 328176, '2023-06-10 15:27:38', '2023-06-10 15:27:38', NULL),
(158, 1, 31, NULL, 330380, '2023-06-10 15:28:08', '2023-06-10 15:28:08', NULL),
(159, 1, 31, NULL, 332698, '2023-06-10 15:28:36', '2023-06-10 15:28:36', NULL),
(160, 1, 31, NULL, 335528, '2023-06-10 15:29:15', '2023-06-10 15:29:15', NULL),
(161, 1, 31, NULL, 335833, '2023-06-10 15:29:37', '2023-06-10 15:29:37', NULL),
(162, 1, 31, NULL, 338172, '2023-06-10 15:29:51', '2023-06-10 15:29:51', NULL),
(163, 1, 14, NULL, 531, '2023-06-10 15:30:23', '2023-06-10 15:30:23', NULL),
(164, 1, 31, NULL, 340716, '2023-06-10 15:30:23', '2023-06-10 15:30:23', NULL),
(165, 1, 31, NULL, 343051, '2023-06-10 15:30:53', '2023-06-10 15:30:53', NULL),
(166, 1, 31, NULL, 345977, '2023-06-10 15:31:48', '2023-06-10 15:31:48', NULL),
(167, 1, 31, NULL, 348372, '2023-06-10 15:32:23', '2023-06-10 15:32:23', NULL),
(168, 1, 31, NULL, 350890, '2023-06-10 15:32:55', '2023-06-10 15:32:55', NULL),
(169, 1, 31, NULL, 353422, '2023-06-10 15:33:32', '2023-06-10 15:33:32', NULL),
(170, 1, 31, NULL, 355486, '2023-06-10 15:33:59', '2023-06-10 15:33:59', NULL),
(171, 1, 31, NULL, 357917, '2023-06-10 15:34:28', '2023-06-10 15:34:28', NULL),
(172, 1, 31, NULL, 360229, '2023-06-10 15:34:58', '2023-06-10 15:34:58', NULL),
(173, 1, 31, NULL, 362605, '2023-06-10 15:35:31', '2023-06-10 15:35:31', NULL),
(174, 1, 31, NULL, 364868, '2023-06-10 15:35:56', '2023-06-10 15:35:56', NULL),
(175, 1, 31, NULL, 367461, '2023-06-10 15:36:29', '2023-06-10 15:36:29', NULL),
(176, 1, 31, NULL, 369951, '2023-06-10 15:36:58', '2023-06-10 15:36:58', NULL),
(177, 1, 31, NULL, 372644, '2023-06-10 15:37:36', '2023-06-10 15:37:36', NULL),
(178, 1, 31, NULL, 375327, '2023-06-10 15:38:09', '2023-06-10 15:38:09', NULL),
(179, 1, 31, NULL, 377903, '2023-06-10 15:38:40', '2023-06-10 15:38:40', NULL),
(180, 1, 31, NULL, 380194, '2023-06-10 15:39:07', '2023-06-10 15:39:07', NULL),
(181, 1, 31, NULL, 382792, '2023-06-10 15:39:33', '2023-06-10 15:39:33', NULL),
(182, 1, 31, NULL, 385078, '2023-06-10 15:40:01', '2023-06-10 15:40:01', NULL),
(183, 1, 31, NULL, 387608, '2023-06-10 15:40:33', '2023-06-10 15:40:33', NULL),
(184, 1, 31, NULL, 390064, '2023-06-10 15:41:02', '2023-06-10 15:41:02', NULL),
(185, 1, 31, NULL, 392453, '2023-06-10 15:41:26', '2023-06-10 15:41:26', NULL),
(186, 1, 31, NULL, 394900, '2023-06-10 15:41:55', '2023-06-10 15:41:55', NULL),
(187, 1, 31, NULL, 397093, '2023-06-10 15:42:22', '2023-06-10 15:42:22', NULL),
(188, 1, 31, NULL, 399458, '2023-06-10 15:42:49', '2023-06-10 15:42:49', NULL),
(189, 1, 31, NULL, 402071, '2023-06-10 15:43:21', '2023-06-10 15:43:21', NULL),
(190, 1, 31, NULL, 404641, '2023-06-10 15:43:48', '2023-06-10 15:43:48', NULL),
(191, 1, 31, NULL, 407140, '2023-06-10 15:44:16', '2023-06-10 15:44:16', NULL),
(192, 1, 31, NULL, 409531, '2023-06-10 15:44:42', '2023-06-10 15:44:42', NULL),
(193, 1, 31, NULL, 412144, '2023-06-10 15:45:18', '2023-06-10 15:45:18', NULL),
(194, 1, 31, NULL, 414423, '2023-06-10 15:45:44', '2023-06-10 15:45:44', NULL),
(195, 1, 31, NULL, 416930, '2023-06-10 15:46:12', '2023-06-10 15:46:12', NULL),
(196, 1, 31, NULL, 419576, '2023-06-10 15:46:41', '2023-06-10 15:46:41', NULL),
(197, 1, 31, NULL, 422124, '2023-06-10 15:47:16', '2023-06-10 15:47:16', NULL),
(198, 1, 31, NULL, 424648, '2023-06-10 15:48:07', '2023-06-10 15:48:07', NULL),
(199, 1, 31, NULL, 427030, '2023-06-10 15:48:35', '2023-06-10 15:48:35', NULL),
(200, 1, 31, NULL, 429740, '2023-06-10 15:49:02', '2023-06-10 15:49:02', NULL),
(201, 1, 31, NULL, 432005, '2023-06-10 15:49:35', '2023-06-10 15:49:35', NULL),
(202, 1, 31, NULL, 434671, '2023-06-10 15:50:07', '2023-06-10 15:50:07', NULL),
(203, 1, 31, NULL, 436979, '2023-06-10 15:50:30', '2023-06-10 15:50:30', NULL),
(204, 1, 31, NULL, 439590, '2023-06-10 15:50:59', '2023-06-10 15:50:59', NULL),
(205, 1, 31, NULL, 442220, '2023-06-10 15:51:25', '2023-06-10 15:51:25', NULL),
(206, 1, 31, NULL, 444544, '2023-06-10 15:51:47', '2023-06-10 15:51:47', NULL),
(207, 1, 31, NULL, 447132, '2023-06-10 15:52:24', '2023-06-10 15:52:24', NULL),
(208, 1, 31, NULL, 449408, '2023-06-10 15:54:42', '2023-06-10 15:54:42', NULL),
(209, 1, 31, NULL, 451894, '2023-06-10 15:55:06', '2023-06-10 15:55:06', NULL),
(210, 1, 31, NULL, 454392, '2023-06-10 15:55:31', '2023-06-10 15:55:31', NULL),
(211, 1, 31, NULL, 457052, '2023-06-10 15:56:08', '2023-06-10 15:56:08', NULL),
(212, 1, 31, NULL, 459525, '2023-06-10 15:56:37', '2023-06-10 15:56:37', NULL),
(213, 1, 31, NULL, 462401, '2023-06-10 15:57:14', '2023-06-10 15:57:14', NULL),
(214, 1, 31, NULL, 465029, '2023-06-10 15:57:45', '2023-06-10 15:57:45', NULL),
(215, 1, 31, NULL, 467322, '2023-06-10 15:58:45', '2023-06-10 15:58:45', NULL),
(216, 1, 31, NULL, 469847, '2023-06-10 16:00:40', '2023-06-10 16:00:40', NULL),
(217, 1, 31, NULL, 472543, '2023-06-10 16:01:16', '2023-06-10 16:01:16', NULL),
(218, 1, 31, NULL, 475039, '2023-06-10 16:01:50', '2023-06-10 16:01:50', NULL),
(219, 1, 31, NULL, 477599, '2023-06-10 16:02:20', '2023-06-10 16:02:20', NULL),
(220, 1, 31, NULL, 480222, '2023-06-10 16:05:07', '2023-06-10 16:05:07', NULL),
(221, 1, 31, NULL, 482883, '2023-06-10 16:05:46', '2023-06-10 16:05:46', NULL),
(222, 1, 31, NULL, 485541, '2023-06-10 16:06:24', '2023-06-10 16:06:24', NULL),
(223, 1, 31, NULL, 488111, '2023-06-10 16:06:58', '2023-06-10 16:06:58', NULL),
(224, 1, 31, NULL, 490843, '2023-06-10 16:07:30', '2023-06-10 16:07:30', NULL),
(225, 1, 31, NULL, 493294, '2023-06-10 16:08:00', '2023-06-10 16:08:00', NULL),
(226, 1, 31, NULL, 495630, '2023-06-10 16:08:31', '2023-06-10 16:08:31', NULL),
(227, 1, 31, NULL, 498371, '2023-06-10 16:09:15', '2023-06-10 16:09:15', NULL),
(228, 1, 31, NULL, 500799, '2023-06-10 16:09:55', '2023-06-10 16:09:55', NULL),
(229, 1, 31, NULL, 503208, '2023-06-10 16:10:41', '2023-06-10 16:10:41', NULL),
(230, 1, 31, NULL, 505618, '2023-06-10 16:11:13', '2023-06-10 16:11:13', NULL),
(231, 1, 31, NULL, 508365, '2023-06-10 16:11:47', '2023-06-10 16:11:47', NULL),
(232, 1, 31, NULL, 510604, '2023-06-10 16:12:16', '2023-06-10 16:12:16', NULL),
(233, 1, 31, NULL, 512984, '2023-06-10 16:12:48', '2023-06-10 16:12:48', NULL),
(234, 1, 31, NULL, 515510, '2023-06-10 16:13:17', '2023-06-10 16:13:17', NULL),
(235, 1, 31, NULL, 518023, '2023-06-10 16:13:54', '2023-06-10 16:13:54', NULL),
(236, 1, 31, NULL, 520434, '2023-06-10 16:14:25', '2023-06-10 16:14:25', NULL),
(237, 1, 0, 1, 674, '2023-06-11 13:19:54', '2023-06-11 13:19:54', NULL),
(238, 1, 0, 1, 1358, '2023-06-11 13:21:27', '2023-06-11 13:21:27', NULL),
(239, 2, 14, NULL, 623, '2023-06-11 14:30:21', '2023-06-11 14:30:21', NULL),
(240, 2, 14, NULL, 754, '2023-06-11 14:30:41', '2023-06-11 14:30:41', NULL),
(241, 2, 15, NULL, 138, '2023-06-11 15:24:07', '2023-06-11 15:24:07', NULL),
(242, 1, 1, NULL, 27118, '2023-06-11 17:31:54', '2023-06-11 17:31:54', NULL),
(243, 1, 7, NULL, 1286, '2023-06-11 17:41:48', '2023-06-11 17:41:48', NULL),
(244, 2, 2, NULL, 1366, '2023-06-11 17:46:02', '2023-06-11 17:46:02', NULL),
(245, 1, 56, NULL, 291, '2023-06-11 17:51:58', '2023-06-11 17:51:58', NULL),
(246, 1, 56, NULL, 591, '2023-06-11 17:52:27', '2023-06-11 17:52:27', NULL),
(247, 1, 2, NULL, 2007, '2023-06-11 17:54:29', '2023-06-11 17:54:29', NULL),
(248, 1, 21, NULL, 122, '2023-06-11 18:43:16', '2023-06-11 18:43:16', NULL),
(249, 1, 21, NULL, 194, '2023-06-11 18:43:36', '2023-06-11 18:43:36', NULL),
(250, 1, 21, NULL, 344, '2023-06-11 18:44:08', '2023-06-11 18:44:08', NULL),
(251, 2, 35, NULL, 105, '2023-06-11 18:54:23', '2023-06-11 18:54:23', NULL),
(252, 2, 35, NULL, 450, '2023-06-11 18:54:44', '2023-06-11 18:54:44', NULL),
(253, 2, 35, NULL, 913, '2023-06-11 18:55:11', '2023-06-11 18:55:11', NULL),
(254, 2, 35, NULL, 1030, '2023-06-11 18:57:25', '2023-06-11 18:57:25', NULL),
(255, 2, 35, NULL, 1144, '2023-06-11 18:57:59', '2023-06-11 18:57:59', NULL),
(256, 2, 35, NULL, 1257, '2023-06-11 18:58:18', '2023-06-11 18:58:18', NULL),
(257, 2, 35, NULL, 1370, '2023-06-11 18:59:02', '2023-06-11 18:59:02', NULL),
(258, 2, 35, NULL, 1484, '2023-06-11 18:59:31', '2023-06-11 18:59:31', NULL),
(259, 1, 53, NULL, 821, '2023-06-11 19:10:22', '2023-06-11 19:10:22', NULL),
(260, 2, 58, NULL, 295, '2023-06-11 20:07:48', '2023-06-11 20:07:48', NULL),
(261, 2, 16, NULL, 228, '2023-06-11 20:18:22', '2023-06-11 20:18:22', NULL),
(262, 2, 59, NULL, 71, '2023-06-11 20:43:51', '2023-06-11 20:43:51', NULL),
(263, 2, 31, NULL, 520991, '2023-06-11 20:46:05', '2023-06-11 20:46:05', NULL),
(264, 1, 2, NULL, 2300, '2023-06-11 21:22:09', '2023-06-11 21:22:09', NULL),
(265, 1, 8, NULL, 257, '2023-06-11 21:38:25', '2023-06-11 21:38:25', NULL),
(266, 1, 2, NULL, 2591, '2023-06-11 21:45:00', '2023-06-11 21:45:00', NULL),
(267, 1, 15, NULL, 341, '2023-06-11 23:56:35', '2023-06-11 23:56:35', NULL),
(268, 1, 5, NULL, 655, '2023-06-11 23:57:53', '2023-06-11 23:57:53', NULL),
(269, 2, 3, NULL, 1415, '2023-06-12 00:01:17', '2023-06-12 00:01:17', NULL),
(270, 2, 53, NULL, 1082, '2023-06-12 00:01:47', '2023-06-12 00:01:47', NULL),
(271, 2, 60, NULL, 752, '2023-06-12 00:03:32', '2023-06-12 00:03:32', NULL),
(272, 2, 22, NULL, 319, '2023-06-12 00:53:42', '2023-06-12 00:53:42', NULL),
(273, 2, 53, NULL, 1372, '2023-06-12 01:06:02', '2023-06-12 01:06:02', NULL),
(274, 2, 45, NULL, 168, '2023-06-12 01:07:13', '2023-06-12 01:07:13', NULL),
(275, 1, 14, NULL, 879, '2023-06-12 02:04:49', '2023-06-12 02:04:49', NULL),
(276, 2, 2, NULL, 2893, '2023-06-12 02:12:12', '2023-06-12 02:12:12', NULL),
(277, 2, 31, NULL, 521296, '2023-06-12 03:03:13', '2023-06-12 03:03:13', NULL),
(278, 1, 1, NULL, 27415, '2023-06-12 04:21:19', '2023-06-12 04:21:19', NULL),
(279, 1, 7, NULL, 1468, '2023-06-12 04:51:57', '2023-06-12 04:51:57', NULL),
(280, 1, 18, NULL, 312, '2023-06-12 05:15:48', '2023-06-12 05:15:48', NULL),
(281, 1, 18, NULL, 624, '2023-06-12 05:17:10', '2023-06-12 05:17:10', NULL),
(282, 2, 1, NULL, 27712, '2023-06-12 05:44:12', '2023-06-12 05:44:12', NULL),
(283, 2, 1, NULL, 28023, '2023-06-12 06:46:27', '2023-06-12 06:46:27', NULL),
(284, 2, 56, NULL, 881, '2023-06-12 06:56:07', '2023-06-12 06:56:07', NULL),
(285, 2, 56, NULL, 1016, '2023-06-12 06:56:22', '2023-06-12 06:56:22', NULL),
(286, 1, 54, NULL, 123, '2023-06-12 07:20:36', '2023-06-12 07:20:36', NULL),
(287, 1, 54, NULL, 239, '2023-06-12 07:20:54', '2023-06-12 07:20:54', NULL),
(288, 2, 27, NULL, 91, '2023-06-12 07:22:19', '2023-06-12 07:22:19', NULL),
(289, 2, 31, NULL, 521798, '2023-06-12 07:49:01', '2023-06-12 07:49:01', NULL),
(290, 2, 31, NULL, 522447, '2023-06-12 07:50:30', '2023-06-12 07:50:30', NULL),
(291, 1, 7, NULL, 1647, '2023-06-12 07:52:30', '2023-06-12 07:52:30', NULL),
(292, 2, 2, NULL, 3180, '2023-06-12 07:54:52', '2023-06-12 07:54:52', NULL),
(293, 1, 59, NULL, 193, '2023-06-12 08:06:22', '2023-06-12 08:06:22', NULL),
(294, 1, 59, NULL, 271, '2023-06-12 08:06:49', '2023-06-12 08:06:49', NULL),
(295, 1, 59, NULL, 368, '2023-06-12 08:06:56', '2023-06-12 08:06:56', NULL),
(296, 2, 0, 1, 1637, '2023-06-12 08:26:40', '2023-06-12 08:26:40', NULL),
(297, 2, 15, NULL, 493, '2023-06-12 08:27:24', '2023-06-12 08:27:24', NULL),
(298, 2, 15, NULL, 669, '2023-06-12 08:30:18', '2023-06-12 08:30:18', NULL),
(299, 2, 15, NULL, 860, '2023-06-12 08:30:32', '2023-06-12 08:30:32', NULL),
(300, 1, 46, NULL, 1354, '2023-06-12 09:08:37', '2023-06-12 09:08:37', NULL),
(301, 1, 0, 2, 243, '2023-06-12 09:17:01', '2023-06-12 09:17:01', NULL),
(302, 1, 0, 1, 1881, '2023-06-12 09:20:48', '2023-06-12 09:20:48', NULL),
(303, 2, 0, 1, 2089, '2023-06-12 09:30:15', '2023-06-12 09:30:15', NULL),
(304, 1, 0, 1, 2352, '2023-06-12 09:39:06', '2023-06-12 09:39:06', NULL),
(305, 2, 27, NULL, 245, '2023-06-12 09:39:26', '2023-06-12 09:39:26', NULL),
(306, 2, 27, NULL, 388, '2023-06-12 09:41:57', '2023-06-12 09:41:57', NULL),
(307, 2, 6, NULL, 293, '2023-06-12 09:43:46', '2023-06-12 09:43:46', NULL),
(308, 2, 6, NULL, 706, '2023-06-12 09:44:03', '2023-06-12 09:44:03', NULL),
(309, 1, 0, 1, 2640, '2023-06-12 09:46:53', '2023-06-12 09:46:53', NULL),
(310, 1, 0, 1, 2928, '2023-06-12 09:47:26', '2023-06-12 09:47:26', NULL),
(311, 1, 0, 1, 2928, '2023-06-12 09:47:33', '2023-06-12 09:47:33', NULL),
(312, 1, 56, NULL, 1298, '2023-06-12 09:53:04', '2023-06-12 09:53:04', NULL),
(313, 1, 14, NULL, 1046, '2023-06-12 09:54:35', '2023-06-12 09:54:35', NULL),
(314, 1, 61, NULL, 306, '2023-06-12 10:01:17', '2023-06-12 10:01:17', NULL),
(315, 2, 2, NULL, 3468, '2023-06-12 10:36:34', '2023-06-12 10:36:34', NULL),
(316, 1, 31, NULL, 522799, '2023-06-12 11:57:35', '2023-06-12 11:57:35', NULL),
(317, 2, 11, NULL, 243, '2023-06-12 12:34:46', '2023-06-12 12:34:46', NULL),
(318, 1, 1, NULL, 28320, '2023-06-16 17:40:58', '2023-06-16 17:40:58', NULL),
(319, 1, 1, NULL, 28320, '2023-06-16 17:41:13', '2023-06-16 17:41:13', NULL),
(320, 2, 55, NULL, 439, '2023-06-16 17:53:27', '2023-06-16 17:53:27', NULL),
(321, 2, 2, NULL, 3693, '2023-06-16 18:29:06', '2023-06-16 18:29:06', NULL),
(322, 2, 31, NULL, 523101, '2023-06-16 19:46:10', '2023-06-16 19:46:10', NULL),
(323, 2, 56, NULL, 1588, '2023-06-16 20:07:07', '2023-06-16 20:07:07', NULL),
(324, 2, 39, NULL, 155, '2023-06-16 20:09:58', '2023-06-16 20:09:58', NULL),
(325, 1, 31, NULL, 523399, '2023-06-16 20:13:38', '2023-06-16 20:13:38', NULL),
(326, 1, 53, NULL, 1661, '2023-06-16 20:16:23', '2023-06-16 20:16:23', NULL),
(327, 2, 61, NULL, 604, '2023-06-16 20:16:43', '2023-06-16 20:16:43', NULL),
(328, 2, 14, NULL, 1183, '2023-06-16 20:20:10', '2023-06-16 20:20:10', NULL),
(329, 2, 56, NULL, 1880, '2023-06-16 20:21:08', '2023-06-16 20:21:08', NULL),
(330, 2, 56, NULL, 2001, '2023-06-16 20:21:47', '2023-06-16 20:21:47', NULL),
(331, 1, 15, NULL, 1033, '2023-06-16 20:44:47', '2023-06-16 20:44:47', NULL),
(332, 2, 15, NULL, 1206, '2023-06-16 20:47:52', '2023-06-16 20:47:52', NULL),
(333, 2, 15, NULL, 1362, '2023-06-16 20:48:05', '2023-06-16 20:48:05', NULL),
(334, 2, 23, NULL, 125, '2023-06-16 21:57:46', '2023-06-16 21:57:46', NULL),
(335, 2, 1, NULL, 28624, '2023-06-16 22:20:45', '2023-06-16 22:20:45', NULL),
(336, 2, 1, NULL, 28928, '2023-06-16 22:21:21', '2023-06-16 22:21:21', NULL),
(337, 2, 1, NULL, 29235, '2023-06-16 22:22:00', '2023-06-16 22:22:00', NULL),
(338, 2, 7, NULL, 1803, '2023-06-16 22:22:06', '2023-06-16 22:22:06', NULL),
(339, 2, 27, NULL, 445, '2023-06-16 23:10:01', '2023-06-16 23:10:01', NULL),
(340, 2, 29, NULL, 85, '2023-06-16 23:10:37', '2023-06-16 23:10:37', NULL),
(341, 2, 39, NULL, 257, '2023-06-17 00:05:05', '2023-06-17 00:05:05', NULL),
(342, 2, 39, NULL, 375, '2023-06-17 00:05:35', '2023-06-17 00:05:35', NULL),
(343, 2, 39, NULL, 476, '2023-06-17 00:05:54', '2023-06-17 00:05:54', NULL),
(344, 2, 39, NULL, 607, '2023-06-17 00:06:23', '2023-06-17 00:06:23', NULL),
(345, 2, 39, NULL, 711, '2023-06-17 00:07:00', '2023-06-17 00:07:00', NULL),
(346, 1, 53, NULL, 1942, '2023-06-17 00:21:57', '2023-06-17 00:21:57', NULL),
(347, 2, 31, NULL, 524010, '2023-06-17 00:31:07', '2023-06-17 00:31:07', NULL),
(348, 2, 3, NULL, 1615, '2023-06-17 00:55:28', '2023-06-17 00:55:28', NULL),
(349, 2, 18, NULL, 915, '2023-06-17 00:57:10', '2023-06-17 00:57:10', NULL),
(350, 2, 3, NULL, 1853, '2023-06-17 01:06:32', '2023-06-17 01:06:32', NULL),
(351, 2, 3, NULL, 2127, '2023-06-17 01:07:03', '2023-06-17 01:07:03', NULL),
(352, 2, 14, NULL, 1615, '2023-06-17 03:06:14', '2023-06-17 03:06:14', NULL),
(353, 2, 14, NULL, 2617, '2023-06-17 03:07:56', '2023-06-17 03:07:56', NULL),
(354, 2, 27, NULL, 594, '2023-06-17 03:12:01', '2023-06-17 03:12:01', NULL),
(355, 2, 29, NULL, 186, '2023-06-17 03:13:09', '2023-06-17 03:13:09', NULL),
(356, 2, 29, NULL, 298, '2023-06-17 03:14:04', '2023-06-17 03:14:04', NULL),
(357, 2, 29, NULL, 384, '2023-06-17 03:14:37', '2023-06-17 03:14:37', NULL),
(358, 2, 31, NULL, 524476, '2023-06-17 03:14:40', '2023-06-17 03:14:40', NULL),
(359, 2, 29, NULL, 481, '2023-06-17 03:14:49', '2023-06-17 03:14:49', NULL),
(360, 2, 29, NULL, 599, '2023-06-17 03:15:08', '2023-06-17 03:15:08', NULL),
(361, 2, 29, NULL, 753, '2023-06-17 03:15:47', '2023-06-17 03:15:47', NULL),
(362, 2, 27, NULL, 727, '2023-06-17 03:16:04', '2023-06-17 03:16:04', NULL),
(363, 2, 29, NULL, 871, '2023-06-17 03:16:53', '2023-06-17 03:16:53', NULL),
(364, 2, 29, NULL, 1004, '2023-06-17 03:17:36', '2023-06-17 03:17:36', NULL),
(365, 2, 29, NULL, 1186, '2023-06-17 03:18:06', '2023-06-17 03:18:06', NULL),
(366, 2, 29, NULL, 1312, '2023-06-17 03:18:46', '2023-06-17 03:18:46', NULL),
(367, 2, 29, NULL, 1427, '2023-06-17 03:19:10', '2023-06-17 03:19:10', NULL),
(368, 2, 53, NULL, 2241, '2023-06-17 03:20:36', '2023-06-17 03:20:36', NULL),
(369, 2, 61, NULL, 930, '2023-06-17 03:22:33', '2023-06-17 03:22:33', NULL),
(370, 2, 61, NULL, 1268, '2023-06-17 03:23:27', '2023-06-17 03:23:27', NULL),
(371, 2, 62, NULL, 300, '2023-06-17 03:26:07', '2023-06-17 03:26:07', NULL),
(372, 2, 27, NULL, 843, '2023-06-17 03:28:19', '2023-06-17 03:28:19', NULL),
(373, 2, 27, NULL, 970, '2023-06-17 03:30:33', '2023-06-17 03:30:33', NULL),
(374, 2, 27, NULL, 1133, '2023-06-17 03:31:50', '2023-06-17 03:31:50', NULL),
(375, 2, 27, NULL, 1290, '2023-06-17 03:32:29', '2023-06-17 03:32:29', NULL),
(376, 2, 27, NULL, 1466, '2023-06-17 03:32:52', '2023-06-17 03:32:52', NULL),
(377, 2, 27, NULL, 1638, '2023-06-17 03:33:47', '2023-06-17 03:33:47', NULL),
(378, 2, 27, NULL, 1853, '2023-06-17 03:36:02', '2023-06-17 03:36:02', NULL),
(379, 2, 27, NULL, 2025, '2023-06-17 03:42:10', '2023-06-17 03:42:10', NULL),
(380, 2, 27, NULL, 2112, '2023-06-17 03:43:17', '2023-06-17 03:43:17', NULL),
(381, 2, 27, NULL, 2268, '2023-06-17 03:44:37', '2023-06-17 03:44:37', NULL),
(382, 2, 35, NULL, 1913, '2023-06-17 03:45:49', '2023-06-17 03:45:49', NULL),
(383, 2, 35, NULL, 2385, '2023-06-17 03:46:38', '2023-06-17 03:46:38', NULL),
(384, 2, 35, NULL, 2733, '2023-06-17 03:47:49', '2023-06-17 03:47:49', NULL),
(385, 2, 35, NULL, 3103, '2023-06-17 03:48:47', '2023-06-17 03:48:47', NULL),
(386, 2, 35, NULL, 3457, '2023-06-17 03:50:02', '2023-06-17 03:50:02', NULL),
(387, 2, 27, NULL, 2437, '2023-06-17 03:56:41', '2023-06-17 03:56:41', NULL),
(388, 2, 27, NULL, 2605, '2023-06-17 03:57:22', '2023-06-17 03:57:22', NULL),
(389, 2, 27, NULL, 2762, '2023-06-17 03:57:53', '2023-06-17 03:57:53', NULL),
(390, 2, 6, NULL, 1065, '2023-06-17 04:04:53', '2023-06-17 04:04:53', NULL),
(391, 2, 6, NULL, 1712, '2023-06-17 04:05:41', '2023-06-17 04:05:41', NULL),
(392, 2, 6, NULL, 2153, '2023-06-17 04:07:56', '2023-06-17 04:07:56', NULL),
(393, 2, 6, NULL, 2340, '2023-06-17 04:08:52', '2023-06-17 04:08:52', NULL),
(394, 2, 6, NULL, 2847, '2023-06-17 04:09:28', '2023-06-17 04:09:28', NULL),
(395, 2, 62, NULL, 1955, '2023-06-17 04:31:25', '2023-06-17 04:31:25', NULL),
(396, 2, 62, NULL, 3534, '2023-06-17 04:35:18', '2023-06-17 04:35:18', NULL),
(397, 2, 62, NULL, 5088, '2023-06-17 04:36:52', '2023-06-17 04:36:52', NULL),
(398, 2, 2, NULL, 3905, '2023-06-17 04:45:48', '2023-06-17 04:45:48', NULL),
(399, 1, 40, NULL, 295, '2023-06-17 06:44:06', '2023-06-17 06:44:06', NULL),
(400, 1, 40, NULL, 594, '2023-06-17 06:45:42', '2023-06-17 06:45:42', NULL),
(401, 1, 34, NULL, 572, '2023-06-17 06:48:08', '2023-06-17 06:48:08', NULL),
(402, 2, 2, NULL, 4071, '2023-06-17 06:49:02', '2023-06-17 06:49:02', NULL),
(403, 1, 13, NULL, 276, '2023-06-17 06:50:16', '2023-06-17 06:50:16', NULL),
(404, 1, 13, NULL, 603, '2023-06-17 06:50:37', '2023-06-17 06:50:37', NULL),
(405, 2, 20, NULL, 165, '2023-06-17 07:54:33', '2023-06-17 07:54:33', NULL),
(406, 2, 53, NULL, 2508, '2023-06-17 07:56:33', '2023-06-17 07:56:33', NULL),
(407, 2, 53, NULL, 2800, '2023-06-17 07:57:13', '2023-06-17 07:57:13', NULL),
(408, 2, 53, NULL, 3891, '2023-06-17 07:58:19', '2023-06-17 07:58:19', NULL),
(409, 1, 10, NULL, 365, '2023-06-17 08:37:43', '2023-06-17 08:37:43', NULL),
(410, 1, 31, NULL, 524777, '2023-06-17 08:57:50', '2023-06-17 08:57:50', NULL),
(411, 2, 21, NULL, 410, '2023-06-17 09:08:55', '2023-06-17 09:08:55', NULL),
(412, 2, 32, NULL, 190, '2023-06-17 10:09:57', '2023-06-17 10:09:57', NULL),
(413, 2, 14, NULL, 2735, '2023-06-17 10:18:40', '2023-06-17 10:18:40', NULL),
(414, 2, 14, NULL, 3294, '2023-06-17 10:19:54', '2023-06-17 10:19:54', NULL),
(415, 2, 14, NULL, 3974, '2023-06-17 10:22:26', '2023-06-17 10:22:26', NULL),
(416, 2, 14, NULL, 4843, '2023-06-17 10:33:53', '2023-06-17 10:33:53', NULL),
(417, 2, 9, NULL, 166, '2023-06-17 10:37:41', '2023-06-17 10:37:41', NULL),
(418, 2, 62, NULL, 5379, '2023-06-17 10:38:29', '2023-06-17 10:38:29', NULL),
(419, 2, 14, NULL, 5438, '2023-06-17 10:39:59', '2023-06-17 10:39:59', NULL),
(420, 2, 14, NULL, 5963, '2023-06-17 10:43:50', '2023-06-17 10:43:50', NULL),
(421, 2, 14, NULL, 6462, '2023-06-17 10:49:28', '2023-06-17 10:49:28', NULL),
(422, 2, 45, NULL, 1167, '2023-06-17 10:54:35', '2023-06-17 10:54:35', NULL),
(423, 2, 45, NULL, 1941, '2023-06-17 10:58:49', '2023-06-17 10:58:49', NULL),
(424, 2, 45, NULL, 2594, '2023-06-17 11:00:58', '2023-06-17 11:00:58', NULL),
(425, 1, 61, NULL, 1561, '2023-06-17 11:16:05', '2023-06-17 11:16:05', NULL),
(426, 2, 55, NULL, 729, '2023-06-17 12:13:12', '2023-06-17 12:13:12', NULL),
(427, 1, 1, NULL, 29534, '2023-06-17 13:40:26', '2023-06-17 13:40:26', NULL),
(428, 2, 32, NULL, 354, '2023-06-17 14:32:05', '2023-06-17 14:32:05', NULL),
(429, 2, 2, NULL, 4968, '2023-06-17 14:43:50', '2023-06-17 14:43:50', NULL),
(430, 2, 8, NULL, 445, '2023-06-17 15:05:32', '2023-06-17 15:05:32', NULL),
(431, 2, 32, NULL, 569, '2023-06-17 15:13:11', '2023-06-17 15:13:11', NULL),
(432, 2, 32, NULL, 798, '2023-06-17 15:15:36', '2023-06-17 15:15:36', NULL),
(433, 1, 37, NULL, 363, '2023-06-17 15:16:49', '2023-06-17 15:16:49', NULL),
(434, 2, 32, NULL, 1016, '2023-06-17 15:32:39', '2023-06-17 15:32:39', NULL),
(435, 2, 32, NULL, 1230, '2023-06-17 15:38:58', '2023-06-17 15:38:58', NULL),
(436, 2, 32, NULL, 1475, '2023-06-17 15:41:59', '2023-06-17 15:41:59', NULL),
(437, 2, 32, NULL, 1683, '2023-06-17 15:42:48', '2023-06-17 15:42:48', NULL),
(438, 2, 32, NULL, 1889, '2023-06-17 15:44:14', '2023-06-17 15:44:14', NULL),
(439, 2, 32, NULL, 2111, '2023-06-17 15:46:28', '2023-06-17 15:46:28', NULL),
(440, 2, 32, NULL, 2405, '2023-06-17 15:49:43', '2023-06-17 15:49:43', NULL),
(441, 2, 32, NULL, 2705, '2023-06-17 15:51:06', '2023-06-17 15:51:06', NULL),
(442, 2, 32, NULL, 2943, '2023-06-17 16:00:20', '2023-06-17 16:00:20', NULL),
(443, 1, 4, NULL, 193, '2023-06-17 16:57:49', '2023-06-17 16:57:49', NULL),
(444, 1, 7, NULL, 2087, '2023-06-17 17:02:07', '2023-06-17 17:02:07', NULL),
(445, 2, 55, NULL, 1021, '2023-06-17 18:17:25', '2023-06-17 18:17:25', NULL),
(446, 2, 55, NULL, 1313, '2023-06-17 18:17:57', '2023-06-17 18:17:57', NULL),
(447, 2, 4, NULL, 367, '2023-06-17 18:29:05', '2023-06-17 18:29:05', NULL),
(448, 2, 15, NULL, 1541, '2023-06-17 18:37:54', '2023-06-17 18:37:54', NULL),
(449, 2, 8, NULL, 584, '2023-06-17 18:43:44', '2023-06-17 18:43:44', NULL),
(450, 2, 1, NULL, 29831, '2023-06-17 19:11:24', '2023-06-17 19:11:24', NULL),
(451, 1, 53, NULL, 4190, '2023-06-17 19:20:53', '2023-06-17 19:20:53', NULL),
(452, 1, 53, NULL, 4489, '2023-06-17 19:21:13', '2023-06-17 19:21:13', NULL),
(453, 2, 6, NULL, 3044, '2023-06-17 19:23:18', '2023-06-17 19:23:18', NULL),
(454, 1, 29, NULL, 1521, '2023-06-17 19:25:55', '2023-06-17 19:25:55', NULL),
(455, 1, 35, NULL, 3546, '2023-06-19 10:06:32', '2023-06-19 10:06:32', NULL),
(456, 2, 31, NULL, 525081, '2023-06-19 10:23:22', '2023-06-19 10:23:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer',
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email_or_otp_verified` tinyint(4) NOT NULL DEFAULT 0,
  `verification_code` varchar(191) DEFAULT NULL,
  `new_email_verification_code` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `user_balance` double NOT NULL DEFAULT 0,
  `referral_code` varchar(255) DEFAULT NULL,
  `num_of_clicks` int(11) NOT NULL DEFAULT 0,
  `referred_by` int(11) DEFAULT NULL,
  `is_commission_calculated` tinyint(2) NOT NULL DEFAULT 1,
  `subscription_package_id` int(11) DEFAULT NULL,
  `this_month_used_words` bigint(20) NOT NULL DEFAULT 0,
  `this_month_available_words` bigint(20) NOT NULL DEFAULT 0,
  `total_used_words` bigint(20) NOT NULL DEFAULT 0,
  `this_month_used_images` bigint(20) NOT NULL DEFAULT 0,
  `this_month_available_images` bigint(20) NOT NULL DEFAULT 0,
  `total_used_images` bigint(20) NOT NULL DEFAULT 0,
  `this_month_used_s2t` bigint(20) NOT NULL DEFAULT 0,
  `this_month_available_s2t` bigint(20) NOT NULL DEFAULT 0,
  `total_used_s2t` bigint(20) NOT NULL DEFAULT 0,
  `this_month_used_t2s` bigint(20) NOT NULL DEFAULT 0,
  `this_month_available_t2s` bigint(20) NOT NULL DEFAULT 0,
  `total_used_t2s` bigint(20) NOT NULL DEFAULT 0,
  `is_banned` tinyint(4) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `user_type`, `name`, `email`, `phone`, `email_or_otp_verified`, `verification_code`, `new_email_verification_code`, `password`, `remember_token`, `provider_id`, `avatar`, `postal_code`, `user_balance`, `referral_code`, `num_of_clicks`, `referred_by`, `is_commission_calculated`, `subscription_package_id`, `this_month_used_words`, `this_month_available_words`, `total_used_words`, `this_month_used_images`, `this_month_available_images`, `total_used_images`, `this_month_used_s2t`, `this_month_available_s2t`, `total_used_s2t`, `this_month_used_t2s`, `this_month_available_t2s`, `total_used_t2s`, `is_banned`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'admin', 'Robert Hoover', 'admin@themetags.com', 'admin@themetags.com', 0, NULL, NULL, '$2y$10$PpTccFY8L3NRJ0AObhW6/eBl0n44Y.iowm6lLAmTRZdeeYwrZjTiW', NULL, NULL, '30', NULL, 0, NULL, 0, NULL, 1, NULL, 0, 0, 551017, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, '2023-05-29 12:05:57', NULL, '2023-06-19 10:06:32', NULL),
(2, NULL, 'customer', 'Mark Kidney', 'customer@themetags.com', '2177338882', 1, NULL, NULL, '$2y$10$vZpCy4oAlQVi85LUiHp73eT6rJhGFezkTm4fLaBOM/CZsxaoHjgKy', NULL, NULL, '32', NULL, 2.5, '2kOnLJBxbQ', 2, NULL, 1, 6, 0, 37238, 96762, 0, 416, 24, 0, 95, 1, 0, 0, 0, 0, '2023-05-29 17:45:30', '2023-05-29 17:45:30', '2023-06-19 10:31:20', NULL),
(3, NULL, 'customer', 'Joe Richard', 'aminul@themetags.com', '991324232123', 1, NULL, NULL, '$2y$10$RNfm2z3zh6jni/CqEPw0vOXwFdr6Ytm7GsGrNmYJiTEv1kdAYjCiy', NULL, NULL, NULL, NULL, 0, NULL, 0, 2, 0, 3, 0, 2000, 0, 0, 10, 0, 0, 2, 0, 0, 0, 0, 0, '2023-06-05 21:06:14', '2023-06-05 21:06:14', '2023-06-12 10:15:28', NULL),
(4, NULL, 'customer', 'Slope', 'musica.08888@gmail.com', '345346564564', 1, NULL, NULL, '$2y$10$IDqLg8U1Jvy5yFh4/oOGRuf7wYn9SZ5TGAfEhVb.AB9rrbJrIc8S.', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 1, 0, 1000, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, '2023-06-16 18:39:29', '2023-06-16 18:39:29', '2023-06-16 18:39:29', NULL),
(5, NULL, 'customer', 'mora', 'mora@mora.com', '+201213012312', 1, NULL, NULL, '$2y$10$QrsVp1IOwEwbFocQbCxjpuWlfmS0APc2PTHsCq6YyD0V.89XF93gC', NULL, NULL, NULL, NULL, 0, '5vCaInYXBq', 0, NULL, 0, 1, 413, 587, 413, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, '2023-06-17 01:37:06', '2023-06-17 01:37:06', '2023-06-17 13:14:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliate_earnings`
--
ALTER TABLE `affiliate_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payout_accounts`
--
ALTER TABLE `affiliate_payout_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_chats`
--
ALTER TABLE `ai_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_chat_categories`
--
ALTER TABLE `ai_chat_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_chat_messages`
--
ALTER TABLE `ai_chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_localizations`
--
ALTER TABLE `blog_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_messages`
--
ALTER TABLE `contact_us_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_templates`
--
ALTER TABLE `custom_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_template_categories`
--
ALTER TABLE `custom_template_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_templates`
--
ALTER TABLE `favorite_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localizations`
--
ALTER TABLE `localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_managers`
--
ALTER TABLE `media_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `open_ai_models`
--
ALTER TABLE `open_ai_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_localizations`
--
ALTER TABLE `page_localizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prompts`
--
ALTER TABLE `prompts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_histories`
--
ALTER TABLE `subscription_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_packages`
--
ALTER TABLE `subscription_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_package_templates`
--
ALTER TABLE `subscription_package_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_groups`
--
ALTER TABLE `template_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_usages`
--
ALTER TABLE `template_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliate_earnings`
--
ALTER TABLE `affiliate_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_payout_accounts`
--
ALTER TABLE `affiliate_payout_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_chats`
--
ALTER TABLE `ai_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ai_chat_categories`
--
ALTER TABLE `ai_chat_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ai_chat_messages`
--
ALTER TABLE `ai_chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_localizations`
--
ALTER TABLE `blog_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `contact_us_messages`
--
ALTER TABLE `contact_us_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_templates`
--
ALTER TABLE `custom_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_template_categories`
--
ALTER TABLE `custom_template_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorite_templates`
--
ALTER TABLE `favorite_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `localizations`
--
ALTER TABLE `localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2343;

--
-- AUTO_INCREMENT for table `media_managers`
--
ALTER TABLE `media_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `open_ai_models`
--
ALTER TABLE `open_ai_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `page_localizations`
--
ALTER TABLE `page_localizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `prompts`
--
ALTER TABLE `prompts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_histories`
--
ALTER TABLE `subscription_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscription_packages`
--
ALTER TABLE `subscription_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `subscription_package_templates`
--
ALTER TABLE `subscription_package_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `template_groups`
--
ALTER TABLE `template_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `template_usages`
--
ALTER TABLE `template_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
