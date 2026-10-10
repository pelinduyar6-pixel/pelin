-- Reflex Haber Pro 3.4.2 | 10 Ekim 2026
-- MySQL/MariaDB tablo yapisi. phpMyAdmin'de kendi veritabaninizi secip ice aktarin.
-- Tablo/kayit silmez. Yonetici, parola, API anahtari ve ornek haber icermez.
-- Ice aktarma sonrasi /kurulum.php uzerinden yonetici hesabinizi olusturun.
-- Mevcut rh6_ tablolarini donusturmez; uygulama guncellemesini kullanin.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS `rh6_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `target_url` varchar(1000) DEFAULT NULL,
  `placement` varchar(30) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `code` text DEFAULT NULL,
  `device` varchar(20) NOT NULL DEFAULT 'all',
  `priority` int(11) NOT NULL DEFAULT 0,
  `starts_at` varchar(19) DEFAULT NULL,
  `ends_at` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_agencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `endpoint` varchar(1000) NOT NULL,
  `format` varchar(10) NOT NULL DEFAULT 'rss',
  `auth` varchar(10) NOT NULL DEFAULT 'none',
  `items_path` varchar(150) DEFAULT NULL,
  `mapping` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `interval_minutes` int(11) NOT NULL DEFAULT 30,
  `next_run_at` varchar(19) DEFAULT NULL,
  `last_run_at` varchar(19) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `import_status` varchar(20) NOT NULL DEFAULT 'draft',
  `max_items` int(11) NOT NULL DEFAULT 5,
  `ai_seo` int(11) NOT NULL DEFAULT 0,
  `last_message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_agency_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `guid_hash` varchar(64) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`guid_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_agency_runs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `created_at` varchar(19) NOT NULL,
  `imported` int(11) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_agenda_health` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `message` varchar(500) DEFAULT NULL,
  `checked_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_id` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_agenda_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_hash` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `sources` text NOT NULL,
  `source_count` int(11) NOT NULL DEFAULT 1,
  `first_seen` varchar(19) NOT NULL,
  `last_seen` varchar(19) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `topic_hash` (`topic_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rh6_comments_article` (`news_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(190) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'new',
  `note` text DEFAULT NULL,
  `created_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_daily_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `news_id` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`,`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_feed_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `guid_hash` varchar(64) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_id` (`source_id`,`guid_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_live_views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `viewed_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rh6_live_views_time` (`viewed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_live_visitors` (
  `visitor` varchar(64) NOT NULL,
  `page_route` varchar(500) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `kind` varchar(12) NOT NULL,
  `last_seen` int(11) NOT NULL,
  PRIMARY KEY (`visitor`),
  KEY `rh6_live_visitors_time` (`last_seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind` varchar(20) NOT NULL,
  `created_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_module_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `summary` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `created_at` varchar(19) NOT NULL,
  `updated_at` varchar(19) NOT NULL,
  `ends_at` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `summary` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `kind` varchar(20) NOT NULL DEFAULT 'article',
  `video_url` varchar(1000) DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `published_at` varchar(19) DEFAULT NULL,
  `created_at` varchar(19) NOT NULL,
  `updated_at` varchar(19) NOT NULL,
  `is_breaking` int(11) NOT NULL DEFAULT 0,
  `is_headline` int(11) NOT NULL DEFAULT 0,
  `is_top` int(11) NOT NULL DEFAULT 0,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `is_box` int(11) NOT NULL DEFAULT 0,
  `allow_comments` int(11) NOT NULL DEFAULT 1,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `is_demo` int(11) NOT NULL DEFAULT 0,
  `focus_keyword` varchar(150) NOT NULL DEFAULT '',
  `video_file` varchar(1000) DEFAULT NULL,
  `source_url` varchar(1000) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `pdf_file` varchar(1000) DEFAULT NULL,
  `embed_code` text DEFAULT NULL,
  `seo_autofill` int(11) NOT NULL DEFAULT 1,
  `migration_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `rh6_news_migration` (`migration_key`),
  KEY `rh6_news_published` (`status`,`published_at`,`id`),
  KEY `rh6_news_category` (`category_id`,`status`,`published_at`),
  KEY `rh6_news_kind` (`kind`,`status`,`published_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_news_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `feed_url` varchar(1000) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `interval_minutes` int(11) NOT NULL DEFAULT 60,
  `next_run_at` varchar(19) DEFAULT NULL,
  `last_run_at` varchar(19) DEFAULT NULL,
  `import_status` varchar(20) NOT NULL DEFAULT 'draft',
  `max_items` int(11) NOT NULL DEFAULT 5,
  `active` int(11) NOT NULL DEFAULT 1,
  `last_message` varchar(500) DEFAULT NULL,
  `agenda_enabled` int(11) NOT NULL DEFAULT 1,
  `ai_seo` int(11) NOT NULL DEFAULT 0,
  `source_kind` varchar(20) NOT NULL DEFAULT 'auto',
  `fetch_full` int(11) NOT NULL DEFAULT 0,
  `schedule_mode` varchar(12) NOT NULL DEFAULT 'interval',
  `daily_time` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rh6_sources_due` (`active`,`next_run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `body` text DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_poll_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `visitor_hash` varchar(64) NOT NULL,
  `choice` int(11) NOT NULL,
  `created_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`visitor_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_reactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `visitor_hash` varchar(64) NOT NULL,
  `kind` varchar(20) NOT NULL,
  `created_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_id` (`news_id`,`visitor_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_social_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `platform` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(1000) NOT NULL,
  `remote_id` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_error` varchar(500) DEFAULT NULL,
  `created_at` varchar(19) NOT NULL,
  `updated_at` varchar(19) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_id` (`news_id`,`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_source_runs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `created_at` varchar(19) NOT NULL,
  `imported` int(11) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rh6_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'author',
  `active` int(11) NOT NULL DEFAULT 1,
  `public_profile` int(11) NOT NULL DEFAULT 0,
  `bio` text DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `is_demo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

