SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS scores;


SET NAMES utf8;

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `scenario` int unsigned NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` time NOT NULL,
  `finished` boolean NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `scores` WRITE;


INSERT INTO `scores` (`id`, `scenario`, `username`, `time`, `finished`, `createdAt`)
VALUES
	(1,1,'Johnson B','12:00:00','1','2015-04-06 11:10:38');

UNLOCK TABLES;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';

SET FOREIGN_KEY_CHECKS = 1; 