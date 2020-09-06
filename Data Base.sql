-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`sensor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sensor` (
  `Sensor` INT NOT NULL,
  PRIMARY KEY (`Sensor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`needle assembly`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`needle assembly` (
  `Needle_ass` INT NOT NULL,
  PRIMARY KEY (`Needle_ass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pump`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pump` (
  `Pump` INT NOT NULL,
  `needle_ass` INT NOT NULL,
  PRIMARY KEY (`Pump`),
  INDEX `fk_pump_needle assembly1_idx` (`needle_ass` ASC) VISIBLE,
  CONSTRAINT `fk_pump_needle assembly1`
    FOREIGN KEY (`needle_ass`)
    REFERENCES `mydb`.`needle assembly` (`Needle_ass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`alarm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alarm` (
  `Alarm` INT NOT NULL,
  `Battery low` INT NULL,
  `Sensor failure` VARCHAR(45) NULL,
  `Pump failure` VARCHAR(45) NULL,
  `Delivery failure` VARCHAR(45) NULL,
  `Needle assembly removed` VARCHAR(45) NULL,
  `Insulin reservior removed` VARCHAR(45) NULL,
  `Low insulin level` VARCHAR(45) NULL,
  PRIMARY KEY (`Alarm`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`display`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`display` (
  `Display` INT NOT NULL,
  PRIMARY KEY (`Display`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`controller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`controller` (
  `ContolerId` INT NOT NULL,
  `Pump` INT NOT NULL,
  `Alarm` INT NOT NULL,
  `Display` INT NOT NULL,
  `Sensor` INT NOT NULL,
  PRIMARY KEY (`ContolerId`),
  INDEX `fk_controller_pump_idx` (`Pump` ASC) VISIBLE,
  INDEX `fk_controller_Alarm1_idx` (`Alarm` ASC) VISIBLE,
  INDEX `fk_controller_display1_idx` (`Display` ASC) VISIBLE,
  INDEX `fk_controller_sensor1_idx` (`Sensor` ASC) VISIBLE,
  CONSTRAINT `fk_controller_pump`
    FOREIGN KEY (`Pump`)
    REFERENCES `mydb`.`pump` (`Pump`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controller_Alarm1`
    FOREIGN KEY (`Alarm`)
    REFERENCES `mydb`.`alarm` (`Alarm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controller_display1`
    FOREIGN KEY (`Display`)
    REFERENCES `mydb`.`display` (`Display`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controller_sensor1`
    FOREIGN KEY (`Sensor`)
    REFERENCES `mydb`.`sensor` (`Sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
