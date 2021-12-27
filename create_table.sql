-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_lab_7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_lab_7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_lab_7` DEFAULT CHARACTER SET utf8 ;
USE `db_lab_7` ;

DROP TABLE IF EXISTS `family_companion`;
DROP TABLE IF EXISTS `family_tree`;
DROP TABLE IF EXISTS `family_has_jewelry`;
DROP TABLE IF EXISTS `sex`;
DROP TABLE IF EXISTS `family_jewelry`;
-- -----------------------------------------------------
-- Table `db_lab_7`.`family_companion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lab_7`.`family_companion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NULL,
  `death_date` DATE NULL,
  `place_of_death` VARCHAR(45) NULL,
  `marriage_date` DATE NULL,
  `family_tree_id` INT NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `place_of_birth` VARCHAR(45) NULL,
  `credit_card_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_lab_7`.`family_tree`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lab_7`.`family_tree` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NULL,
  `death_date` DATE NULL,
  `place_of_death` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NOT NULL,
  `place_of_birth` VARCHAR(45) NULL,
  `family_tree_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_lab_7`.`sex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lab_7`.`sex` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_lab_7`.`family_has_jewelry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lab_7`.`family_has_jewelry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `family_tree_id` INT NOT NULL,
  `jewelry_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_lab_7`.`family_jewelry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lab_7`.`family_jewelry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `expected_value` INT NOT NULL,
  `max_value` INT NOT NULL,
  `min_value` INT NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

