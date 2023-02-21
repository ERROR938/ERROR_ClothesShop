CREATE TABLE IF NOT EXISTS `saved_clothes` (
  `name` varchar(100) NOT NULL,
  `skin` longtext NOT NULL,
  `owner` varchar(150) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;