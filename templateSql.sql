SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS scores;


SET NAMES utf8;

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` time NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `scores` WRITE;


INSERT INTO `scores` (`id`, `username`, `score`, `time`, `createdAt`)
VALUES
	(1,'Johnson B','12000','12:00:00','2015-04-06 11:10:38');

UNLOCK TABLES;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';

SET FOREIGN_KEY_CHECKS = 1; 