-- MySQL Script generated by MySQL Workbench
-- 11/12/16 18:45:04
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sdbm
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sdbm` ;

-- -----------------------------------------------------
-- Schema sdbm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sdbm` DEFAULT CHARACTER SET cp1250 ;
USE `sdbm` ;

-- -----------------------------------------------------
-- Table `sdbm`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sdbm`.`user` ;

CREATE TABLE IF NOT EXISTS `sdbm`.`user` (
  `ID` VARCHAR(36) NOT NULL,
  `Login` VARCHAR(10) NOT NULL,
  `Email` TINYTEXT NULL DEFAULT NULL,
  `Pass` TINYTEXT NOT NULL,
  `X_CreateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsAdmin` TINYINT(1) NOT NULL DEFAULT '0',
  `IsBlocked` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;


-- -----------------------------------------------------
-- Table `sdbm`.`activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sdbm`.`activity` ;

CREATE TABLE IF NOT EXISTS `sdbm`.`activity` (
  `ID` VARCHAR(36) NOT NULL DEFAULT '',
  `UserID` VARCHAR(36) NOT NULL,
  `Blogs` INT(11) NOT NULL DEFAULT '0',
  `Comments` INT(11) NOT NULL DEFAULT '0',
  `LastActivity` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `UserID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_activity_user_idx` (`UserID` ASC),
  CONSTRAINT `fk_activity_user`
    FOREIGN KEY (`UserID`)
    REFERENCES `sdbm`.`user` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;


-- -----------------------------------------------------
-- Table `sdbm`.`blogtext`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sdbm`.`blogtext` ;

CREATE TABLE IF NOT EXISTS `sdbm`.`blogtext` (
  `ID` VARCHAR(36) NOT NULL,
  `UserID` VARCHAR(36) NOT NULL,
  `Title` TEXT NOT NULL,
  `Text` LONGTEXT NOT NULL,
  `Status` INT(11) NOT NULL DEFAULT '0',
  `X_CreateUser` VARCHAR(36) NULL DEFAULT NULL,
  `X_CreateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `UserID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_blogtext_user1_idx` (`UserID` ASC),
  CONSTRAINT `fk_blogtext_user1`
    FOREIGN KEY (`UserID`)
    REFERENCES `sdbm`.`user` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;


-- -----------------------------------------------------
-- Table `sdbm`.`blogcomment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sdbm`.`blogcomment` ;

CREATE TABLE IF NOT EXISTS `sdbm`.`blogcomment` (
  `ID` VARCHAR(36) NOT NULL,
  `Author` VARCHAR(36) NOT NULL,
  `BlogItemID` VARCHAR(36) NOT NULL,
  `Text` TEXT NOT NULL,
  `X_CreateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `Author`, `BlogItemID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_blogcomment_user1_idx` (`Author` ASC),
  INDEX `fk_blogcomment_blogtext1_idx` (`BlogItemID` ASC),
  CONSTRAINT `fk_blogcomment_user1`
    FOREIGN KEY (`Author`)
    REFERENCES `sdbm`.`user` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogcomment_blogtext1`
    FOREIGN KEY (`BlogItemID`)
    REFERENCES `sdbm`.`blogtext` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;

USE `sdbm` ;

-- -----------------------------------------------------
-- Placeholder table for view `sdbm`.`all_blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sdbm`.`all_blog` (`Title` INT, `Status` INT, `Login` INT, `Text` INT, `X_UpdateTime` INT, `X_RemoveTime` INT, `X_CreateUser` INT, `blogtext_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sdbm`.`all_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sdbm`.`all_comments` (`ID` INT, `BlogItemID` INT, `Author` INT, `Text` INT, `Time` INT, `Login` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sdbm`.`archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sdbm`.`archive` (`Title` INT, `Status` INT, `Login` INT, `Text` INT, `X_UpdateTime` INT, `X_RemoveTime` INT, `X_CreateUser` INT, `blogtext_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sdbm`.`blog_public`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sdbm`.`blog_public` (`Title` INT, `Status` INT, `Login` INT, `Text` INT, `X_UpdateTime` INT, `X_RemoveTime` INT, `X_CreateUser` INT, `blogtext_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sdbm`.`show_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sdbm`.`show_user` (`ID` INT, `Login` INT, `Pass` INT, `IsAdmin` INT, `IsBlocked` INT);

-- -----------------------------------------------------
-- View `sdbm`.`all_blog`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sdbm`.`all_blog` ;
DROP TABLE IF EXISTS `sdbm`.`all_blog`;
USE `sdbm`;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_blog` AS select `blogtext`.`Title` AS `Title`,`blogtext`.`Status` AS `Status`,`user`.`Login` AS `Login`,`blogtext`.`Text` AS `Text`,`blogtext`.`X_UpdateTime` AS `X_UpdateTime`,`blogtext`.`X_RemoveTime` AS `X_RemoveTime`,`blogtext`.`X_CreateUser` AS `X_CreateUser`,`blogtext`.`ID` AS `blogtext_id` from (`blogtext` join `user` on((`blogtext`.`X_CreateUser` = `user`.`ID`))) where isnull(`blogtext`.`X_RemoveTime`) order by `blogtext`.`X_UpdateTime` desc */;

-- -----------------------------------------------------
-- View `sdbm`.`all_comments`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sdbm`.`all_comments` ;
DROP TABLE IF EXISTS `sdbm`.`all_comments`;
USE `sdbm`;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_comments` AS select `blogcomment`.`ID` AS `ID`,`blogcomment`.`BlogItemID` AS `BlogItemID`,`blogcomment`.`Author` AS `Author`,`blogcomment`.`Text` AS `Text`,`blogcomment`.`X_CreateTime` AS `Time`,`user`.`Login` AS `Login` from (`blogcomment` join `user` on((`blogcomment`.`Author` = `user`.`ID`))) order by `blogcomment`.`X_CreateTime` desc */;

-- -----------------------------------------------------
-- View `sdbm`.`archive`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sdbm`.`archive` ;
DROP TABLE IF EXISTS `sdbm`.`archive`;
USE `sdbm`;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `archive` AS select `blogtext`.`Title` AS `Title`,`blogtext`.`Status` AS `Status`,`user`.`Login` AS `Login`,`blogtext`.`Text` AS `Text`,`blogtext`.`X_UpdateTime` AS `X_UpdateTime`,`blogtext`.`X_RemoveTime` AS `X_RemoveTime`,`blogtext`.`X_CreateUser` AS `X_CreateUser`,`blogtext`.`ID` AS `blogtext_id` from (`blogtext` join `user` on((`blogtext`.`X_CreateUser` = `user`.`ID`))) where (`blogtext`.`X_RemoveTime` is not null) order by `blogtext`.`Status` desc */;

-- -----------------------------------------------------
-- View `sdbm`.`blog_public`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sdbm`.`blog_public` ;
DROP TABLE IF EXISTS `sdbm`.`blog_public`;
USE `sdbm`;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `blog_public` AS select `all_blog`.`Title` AS `Title`,`all_blog`.`Status` AS `Status`,`all_blog`.`Login` AS `Login`,`all_blog`.`Text` AS `Text`,`all_blog`.`X_UpdateTime` AS `X_UpdateTime`,`all_blog`.`X_RemoveTime` AS `X_RemoveTime`,`all_blog`.`X_CreateUser` AS `X_CreateUser`,`all_blog`.`blogtext_id` AS `blogtext_id` from `all_blog` where (`all_blog`.`Status` = 1) */;

-- -----------------------------------------------------
-- View `sdbm`.`show_user`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sdbm`.`show_user` ;
DROP TABLE IF EXISTS `sdbm`.`show_user`;
USE `sdbm`;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_user` AS select `user`.`ID` AS `ID`,`user`.`Login` AS `Login`,`user`.`Pass` AS `Pass`,`user`.`IsAdmin` AS `IsAdmin`,`user`.`IsBlocked` AS `IsBlocked` from `user` */;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `sdbm`;

DELIMITER $$

USE `sdbm`$$
DROP TRIGGER IF EXISTS `sdbm`.`user_BEFORE_INSERT` $$
USE `sdbm`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW
BEGIN
SET new.ID = uuid();
END */$$


USE `sdbm`$$
DROP TRIGGER IF EXISTS `sdbm`.`user_AFTER_INSERT` $$
USE `sdbm`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`user_AFTER_INSERT` AFTER INSERT ON `user` FOR EACH ROW
BEGIN

INSERT INTO `sdbm`.`activity`
(`UserID`)
VALUES
(NEW.ID);

END */$$


USE `sdbm`$$
DROP TRIGGER IF EXISTS `sdbm`.`activity_BEFORE_INSERT` $$
USE `sdbm`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`activity_BEFORE_INSERT` BEFORE INSERT ON `activity` FOR EACH ROW
BEGIN
 SET new.ID = uuid();
END */$$


USE `sdbm`$$
DROP TRIGGER IF EXISTS `sdbm`.`blogtext_AFTER_INSERT` $$
USE `sdbm`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`blogtext_AFTER_INSERT` AFTER INSERT ON `blogtext` FOR EACH ROW
BEGIN
DECLARE x INT;
SET x = (SELECT COUNT(*) FROM BlogText WHERE BlogText.X_CreateUser = NEW.X_CreateUser);
UPDATE Activity SET Activity.Blogs = x, LastActivity = now() WHERE UserID =  NEW.X_CreateUser;
END */$$


USE `sdbm`$$
DROP TRIGGER IF EXISTS `sdbm`.`blogcomment_BEFORE_INSERT` $$
USE `sdbm`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`blogcomment_BEFORE_INSERT` BEFORE INSERT ON `blogcomment` FOR EACH ROW
BEGIN
SET new.ID = uuid();
END */$$


USE `sdbm`$$
DROP TRIGGER IF EXISTS `sdbm`.`blogcomment_AFTER_INSERT` $$
USE `sdbm`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`blogcomment_AFTER_INSERT` AFTER INSERT ON `blogcomment` FOR EACH ROW
BEGIN
DECLARE x INT;
SET x = (SELECT COUNT(*) FROM BlogComment WHERE Author = NEW.Author);
UPDATE Activity SET Activity.Comments = x, LastActivity = now() WHERE UserID =  NEW.Author;
END */$$


DELIMITER ;
