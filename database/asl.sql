-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ASL
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ASL` ;

-- -----------------------------------------------------
-- Schema ASL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ASL` DEFAULT CHARACTER SET utf8 ;
USE `ASL` ;

-- -----------------------------------------------------
-- Table `ASL`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ASL`.`role` ;

CREATE TABLE IF NOT EXISTS `ASL`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `ASL`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ASL`.`user` ;

CREATE TABLE IF NOT EXISTS `ASL`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(32) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `role_id`),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `ASL`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `email_UNIQUE` ON `ASL`.`user` (`email` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ASL`.`prediction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ASL`.`prediction` ;

CREATE TABLE IF NOT EXISTS `ASL`.`prediction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lettre` CHAR(1) NOT NULL,
  `score` FLOAT NOT NULL,
  `date` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `user_role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `user_role_id`),
  CONSTRAINT `fk_prediction_user1`
    FOREIGN KEY (`user_id` , `user_role_id`)
    REFERENCES `ASL`.`user` (`id` , `role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ASL`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `ASL`;
INSERT INTO `ASL`.`role` (`id`, `name`) VALUES (DEFAULT, 'admin');
INSERT INTO `ASL`.`role` (`id`, `name`) VALUES (DEFAULT, 'customer');

COMMIT;

