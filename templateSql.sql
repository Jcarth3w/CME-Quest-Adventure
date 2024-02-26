SET FOREIGN_KEY_CHECKS = 0;

SET NAMES utf8;

DROP TABLE IF EXISTS `scores`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `scores` (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`scenario` int unsigned NOT NULL,
	`username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`time` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`finished` boolean NOT NULL,
	`createdAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `scores` WRITE;


INSERT INTO `scores` (`id`, `scenario`, `username`, `time`, `finished`, `createdAt`)
VALUES
	(1,1,'Johnson B','12:00:00','1','2015-04-06 11:10:38');

UNLOCK TABLES;


CREATE TABLE `users` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL UNIQUE,
	`password` VARCHAR(255) NOT NULL,
	`createdAt` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `users` WRITE;

INSERT INTO `users` (`id`, `username`, `password`, `createdAt`)
VALUES
	(1,'admin','$2y$10$33toCo77Uc4g8t7BnvX.cOBuyjBLlyA.N3IY/YsT1fHZJxa1Zop42','2015-04-06 11:10:38');

UNLOCK TABLES;

DELIMITER //

CREATE TRIGGER scores_BEFORE_INSERT
BEFORE INSERT ON scores
FOR EACH ROW
BEGIN
    SET NEW.createdAt = NOW();
END;
//

DELIMITER ;

UNLOCK TABLES;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';

SET FOREIGN_KEY_CHECKS = 1;