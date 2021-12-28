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

insert into `sex`(`name`) values ('male'), ('female');


insert into `family_tree`(name, lastname, middle_name, birth_date, death_date, place_of_death, sex, place_of_birth ) values 
	('Sasha','ND','Ivanovich','2000-08-07','2010-05-07','Львів','male','Ужгород'),
	('Галя','ЛЯЛЯ','Лялялівна','2000-10-07','2000-12-07','Ужгород','female','Ужгород');

insert into `family_tree`(name, lastname, middle_name, birth_date, death_date, place_of_death, family_tree_id, sex, place_of_birth ) values 
	('Данило','Геній','Андрійович','2000-06-07','2000-09-07','Чернівці',3,'male','Ужгород'),
	('Мирослав','Eagle','Eye','2005-05-07','2008-05-07','Київ',4,'male','Львів'),
	('Марія','Геній','Абрикосівна','2001-05-07','2003-05-07','Жмеринка',5,'female','Львів'),
	('Ірина','Кооператив','КУКУ','2000-05-10','2000-05-08','Львів',6,'female','Київ');

insert into `family_companion`(name, lastname, middle_name, birth_date, death_date, place_of_death, marriage_date, family_tree_id, sex, place_of_birth, credit_card_number ) values 
	('Ірина','Кооператив','КУКУ','2000-05-10','2000-05-08','Ужгород','2005-05-07',1,'male','Львів','735895389'),
	('Марія','Геній','Абрикосівна','2001-05-07','2003-05-07','Ужгород','2005-09-07',2,'male','Львів','245353'),
	('Мирослав','Eagle','Eye','2005-05-07','2008-05-07','Ужгород','2005-05-09',3,'male','Львів','64758688'),
	('Данило','Геній','Андрійович','2000-06-07','2000-09-07','Ужгород','2005-05-08',4,'female','Львів','3675866755'),
	('Галя','ЛЯЛЯ','Лялялівна','2000-10-07','2000-12-07','Ужгород','2005-05-06',5,'female','Львів','4635786'),
	('Sasha','ND','Ivanovich','2000-08-07','2010-05-07','Львів','2005-05-07',6,'female','Львів','46376976');

insert into `family_jewelry`(name, expected_value, max_value, min_value, code ) values
('Coin',12,23,1,'A12345GH'),
('Crown',23,50,12,'M12345GH'),
('Ring',35,55,3,'A12345GT'),
('Sauron ring',10,50,5,'Z12345GH'),
('Flag',12,23,4,'Z12345YH');

insert into `family_has_jewelry`(family_tree_id, jewelry_id) values
(1,1),
(2,3),
(3,2),
(4,5),
(5,4);

