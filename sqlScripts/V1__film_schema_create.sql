-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema created_from_script_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema created_from_script_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `created_from_script_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `created_from_script_test` ;

-- -----------------------------------------------------
-- Table `created_from_script_test`.`account_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`account_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `role_UNIQUE` (`role` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `role_id` INT NULL DEFAULT NULL,
  `banned` BIT(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  INDEX `role_id_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `created_from_script_test`.`account_role` (`id`) ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `banned` BIT(1) NOT NULL DEFAULT b'0',
  `likeness` INT NULL DEFAULT '0',
  `message` VARCHAR(45) NULL DEFAULT NULL,
  `film_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  INDEX `account_id_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `account_id`
    FOREIGN KEY (`account_id`)
    REFERENCES `created_from_script_test`.`account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`comment_liked_by`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`comment_liked_by` (
  `comment_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  INDEX `account_id_fk_l_idx` (`account_id` ASC) VISIBLE,
  INDEX `comment_id_fk_l_idx` (`comment_id` ASC) VISIBLE,
  CONSTRAINT `account_id_fk_l`
    FOREIGN KEY (`account_id`)
    REFERENCES `created_from_script_test`.`account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_id_fk_l`
    FOREIGN KEY (`comment_id`)
    REFERENCES `created_from_script_test`.`comment` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`participant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film_actors` (
  `film_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  INDEX `participant_id_fk_idx` (`participant_id` ASC) VISIBLE,
  CONSTRAINT `film_id_fk`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk`
    FOREIGN KEY (`participant_id`)
    REFERENCES `created_from_script_test`.`participant` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film_directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film_directors` (
  `film_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  INDEX `film_id_fk_idx` (`film_id` ASC) VISIBLE,
  INDEX `participant_id_fk_idx` (`participant_id` ASC) VISIBLE,
  CONSTRAINT `film_id_fk_d`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_d`
    FOREIGN KEY (`participant_id`)
    REFERENCES `created_from_script_test`.`participant` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `genre_UNIQUE` (`genre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film_genre` (
  `film_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  INDEX `film_id_fk_g_idx` (`film_id` ASC) VISIBLE,
  INDEX `genre_id_fk_g_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `film_id_fk_g`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `genre_id_fk_g`
    FOREIGN KEY (`genre_id`)
    REFERENCES `created_from_script_test`.`genre` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film_idea_authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film_idea_authors` (
  `film_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  INDEX `participant_id_fk_p_idx` (`participant_id` ASC) VISIBLE,
  INDEX `film_id_fk_p_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `film_id_fk_a`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_a`
    FOREIGN KEY (`participant_id`)
    REFERENCES `created_from_script_test`.`participant` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film_producers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film_producers` (
  `film_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  INDEX `participant_id_fk_p_idx` (`participant_id` ASC) VISIBLE,
  INDEX `film_id_fk_p_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `film_id_fk_p`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_p`
    FOREIGN KEY (`participant_id`)
    REFERENCES `created_from_script_test`.`participant` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`film_writers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`film_writers` (
  `film_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  INDEX `participant_id_fk_w_idx` (`participant_id` ASC) VISIBLE,
  INDEX `film_id_fk_w_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `film_id_fk_w`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participant_id_fk_w`
    FOREIGN KEY (`participant_id`)
    REFERENCES `created_from_script_test`.`participant` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `created_from_script_test`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `created_from_script_test`.`rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `atmosphere` INT NULL DEFAULT NULL,
  `plot` INT NULL DEFAULT NULL,
  `acting` INT NULL DEFAULT NULL,
  `ideas` INT NULL DEFAULT NULL,
  `artistic` INT NULL DEFAULT NULL,
  `fun` INT NULL DEFAULT NULL,
  `film_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `film_id_fk_r_idx` (`film_id` ASC) VISIBLE,
  INDEX `account_id_fk_r_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `account_id_fk_r`
    FOREIGN KEY (`account_id`)
    REFERENCES `created_from_script_test`.`account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `film_id_fk_r`
    FOREIGN KEY (`film_id`)
    REFERENCES `created_from_script_test`.`film` (`id`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
