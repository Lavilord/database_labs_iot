-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema iot_lab_db_2
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Schema iot_lab_db_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iot_lab_db_2` DEFAULT CHARACTER SET utf8 ;
USE `iot_lab_db_2` ;


DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS bank_account;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS street;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;
-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`country` (
  `name` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`city` (
  `name` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_country1_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `iot_lab_db_2`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`street`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`street` (
  `name` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_street_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_street_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `iot_lab_db_2`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `age` INT NULL,
  `passport_number` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NULL,
  `street_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `passport_number_UNIQUE` (`passport_number` ASC) VISIBLE,
  INDEX `fk_client_street1_idx` (`street_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_street1`
    FOREIGN KEY (`street_id`)
    REFERENCES `iot_lab_db_2`.`street` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`bank_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`bank_account` (
  `money_amount` FLOAT NOT NULL,
  `creation_date` DATE NULL,
  `client_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `account_number` VARCHAR(45) NOT NULL,
  INDEX `fk_bank_account_client1_idx` (`client_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_bank_account_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `iot_lab_db_2`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  `weight` FLOAT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_country1_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `iot_lab_db_2`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_lab_db_2`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iot_lab_db_2`.`transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bank_account_id` INT NOT NULL,
  `commission` FLOAT NOT NULL,
  `item_id` INT NOT NULL,
  `transfer_amount` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_bank_account1_idx` (`bank_account_id` ASC) VISIBLE,
  INDEX `fk_transaction_item1_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_bank_account1`
    FOREIGN KEY (`bank_account_id`)
    REFERENCES `iot_lab_db_2`.`bank_account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `iot_lab_db_2`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO country (name) VALUES
	('Ukraine'), ('USA'), ('UK'),('France'),('Spain'),
    ('Croatia'),('Poland'),('Germany'),('Japan'),('Malaysia'),('China');

INSERT INTO city (name, country_id) VALUES
	('Lviv',1),('Kyiv',1),('London',3),('Austin',2),('Tokyo',9),('Warsaw',7),
    ('Paris',4),('Zagreb',6),('Munich',8),('Peking',11);
    
INSERT INTO street (name, city_id) VALUES
	('Шевченка',1),('Перемоги',2),('Slim Shady',3),('Wall-street',4),('Anime',5),('Пекарська',7),
    ('Ковальська',6),('Нова',9),('Стара',8),('Молода',10);
    
INSERT INTO client (name, lastname,age,passport_number,street_id) VALUES
	('Oleksandr','Borylo','18','02442784287','1'),('Myroslav','Pronyshyn','18','24784826','2'),('Mykhailo','Polniy','19','13141424224','3'),
    ('Maria','Martsiv','19','31133131','4'),('Danylo','Zhybryd','17','466462626','5'),('Yaroslav','Klochnyk','30','57753246','6'),
    ('Zenoviy','Veres','32','462446575','7'),('Petro','Petrovych','25','35646575','8'),
    ('Taras','Shevchenko','34','353655573','9'),('Android','Google','1','364753522','10');
    
INSERT INTO bank_account (client_id,money_amount, account_number) VALUES
	(1,13223,'34636436'),(2,3524646,'533535513231'),(3,353663,'24346436'),(4,23,'353636343'),(5,1.5,'353366'),
    (6,3436,'243522364'),(7,2.1,'322366'),(8,4323,'53254346'),(9,3553,'32523546'),(10,353235,'3467754777457'),
    (1,333,'3235522464'),(2,322664,'353251353'),(3,4,'32343346436225'),(4,534636,'353243'),(3,3444,'235465754');

INSERT INTO item(name,price,country_id) VALUES
	('toy',12,1),('robot',13242,2),('printer',223,3),('laptop',123323523,4),('pc',2355,6),('keyboard',2324,10),
    ('mouse',122,5),('headphones',12334,3),('lamp',122,11),('apple',12,1),('tomato',13,2),('potato',123,9);
    
INSERT INTO transaction(bank_account_id,item_id,commission,transfer_amount) VALUES
	(1,1,2,323),(2,4,23,24242),(3,4,2442,4242422),(5,6,6565,4432),(3,2,354466,54346),(5,4,234535,35446),
    (7,8,464647,35535),(7,5,6263578,3443634),(1,2,35364,3645577),(8,9,43357,44754775);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
