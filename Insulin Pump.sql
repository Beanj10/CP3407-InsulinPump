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
-- Table `mydb`.`insulin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`insulin` (
  `Insulin` INT NOT NULL,
  `Blood_Sugar` INT NOT NULL,
  `Log_Insulin` INT NOT NULL,
  PRIMARY KEY (`Insulin`),
  INDEX `fk_insulin_sensor_idx` (`Blood_Sugar` ASC) VISIBLE,
  INDEX `fk_insulin_insulin1_idx` (`Log_Insulin` ASC) VISIBLE,
  CONSTRAINT `fk_insulin_sensor`
    FOREIGN KEY (`Blood_Sugar`)
    REFERENCES `mydb`.`sensor` (`Sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insulin_insulin1`
    FOREIGN KEY (`Log_Insulin`)
    REFERENCES `mydb`.`insulin` (`Insulin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pump`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pump` (
  `Pump` INT NOT NULL,
  `Pump_Insulin` INT NOT NULL,
  PRIMARY KEY (`Pump`),
  INDEX `fk_pump_insulin1_idx` (`Pump_Insulin` ASC) VISIBLE,
  CONSTRAINT `fk_pump_insulin1`
    FOREIGN KEY (`Pump_Insulin`)
    REFERENCES `mydb`.`insulin` (`Insulin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
