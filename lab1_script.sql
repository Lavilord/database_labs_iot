-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_iot_borylo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_iot_borylo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_iot_borylo` DEFAULT CHARACTER SET utf8 ;
USE `lab_iot_borylo` ;

-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`city` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`street`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`street` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`country` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `city_name` VARCHAR(45) NULL,
  `street_name` VARCHAR(45) NULL,
  `country_name` VARCHAR(45) NULL,
  `age` INT NOT NULL,
  `passport_number` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_city_idx` (`city_name` ASC) VISIBLE,
  INDEX `fk_client_street1_idx` (`street_name` ASC) VISIBLE,
  INDEX `fk_client_country1_idx` (`country_name` ASC) VISIBLE,
  UNIQUE INDEX `passport_number_UNIQUE` (`passport_number` ASC) VISIBLE,
  CONSTRAINT `fk_client_city`
    FOREIGN KEY (`city_name`)
    REFERENCES `lab_iot_borylo`.`city` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_street1`
    FOREIGN KEY (`street_name`)
    REFERENCES `lab_iot_borylo`.`street` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_country1`
    FOREIGN KEY (`country_name`)
    REFERENCES `lab_iot_borylo`.`country` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`banc_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`banc_account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `account_number` VARCHAR(45) NOT NULL,
  `money_amount` FLOAT NOT NULL,
  `creation_date` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `account_number_UNIQUE` (`account_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`client_has_banc_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`client_has_banc_account` (
  `client_id` INT NOT NULL,
  `banc_account_id` INT NOT NULL,
  PRIMARY KEY (`banc_account_id`),
  INDEX `fk_client_has_banc_account_banc_account1_idx` (`banc_account_id` ASC) VISIBLE,
  INDEX `fk_client_has_banc_account_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_has_banc_account_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `lab_iot_borylo`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_has_banc_account_banc_account1`
    FOREIGN KEY (`banc_account_id`)
    REFERENCES `lab_iot_borylo`.`banc_account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  `weight` FLOAT NULL,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_country1_idx` (`country_name` ASC) VISIBLE,
  CONSTRAINT `fk_item_country1`
    FOREIGN KEY (`country_name`)
    REFERENCES `lab_iot_borylo`.`country` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_iot_borylo`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_iot_borylo`.`transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `banc_account_id` INT NOT NULL,
  `item_id` INT NULL,
  `another_banc_account_id` INT NULL,
  `date` DATE NULL,
  `amount` FLOAT NOT NULL,
  `commission` FLOAT NOT NULL,
  `country_name` VARCHAR(45) NULL,
  `street_name` VARCHAR(45) NULL,
  `city_name` VARCHAR(45) NULL,
  `item_price` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_client_has_banc_account1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_transaction_client_has_banc_account2_idx` (`banc_account_id` ASC) VISIBLE,
  INDEX `fk_transaction_item1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_transaction_banc_account1_idx` (`another_banc_account_id` ASC) VISIBLE,
  INDEX `fk_transaction_country1_idx` (`country_name` ASC) VISIBLE,
  INDEX `fk_transaction_street1_idx` (`street_name` ASC) VISIBLE,
  INDEX `fk_transaction_city1_idx` (`city_name` ASC) VISIBLE,
  INDEX `fk_transaction_item2_idx` (`item_price` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_client_has_banc_account1`
    FOREIGN KEY (`client_id`)
    REFERENCES `lab_iot_borylo`.`client_has_banc_account` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_client_has_banc_account2`
    FOREIGN KEY (`banc_account_id`)
    REFERENCES `lab_iot_borylo`.`client_has_banc_account` (`banc_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `lab_iot_borylo`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_banc_account1`
    FOREIGN KEY (`another_banc_account_id`)
    REFERENCES `lab_iot_borylo`.`banc_account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_country1`
    FOREIGN KEY (`country_name`)
    REFERENCES `lab_iot_borylo`.`country` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_street1`
    FOREIGN KEY (`street_name`)
    REFERENCES `lab_iot_borylo`.`street` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_city1`
    FOREIGN KEY (`city_name`)
    REFERENCES `lab_iot_borylo`.`city` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_item2`
    FOREIGN KEY (`item_price`)
    REFERENCES `lab_iot_borylo`.`item` (`price`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
