DROP TABLE IF EXISTS `saved_clothes`;
CREATE TABLE IF NOT EXISTS `saved_clothes` (
  `name` varchar(100) NOT NULL,
  `skin` longtext NOT NULL,
  `owner` varchar(150) NOT NULL,
  PRIMARY KEY (`name`)
);
