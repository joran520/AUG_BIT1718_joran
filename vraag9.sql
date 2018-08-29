-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Vraag9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Vraag9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vraag9` DEFAULT CHARACTER SET utf8 ;
USE `Vraag9` ;

-- -----------------------------------------------------
-- Table `Vraag9`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vraag9`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `sex` ENUM('m', 'v', 'x') NOT NULL,
  `age_diagnosis` INT NOT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vraag9`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vraag9`.`Gene` (
  `idGene` INT NOT NULL,
  `location` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `description` CHAR(255) NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vraag9`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vraag9`.`mutation` (
  `idmutation` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `Gene_idGene` INT NOT NULL,
  PRIMARY KEY (`idmutation`),
  INDEX `fk_mutation_Gene1_idx` (`Gene_idGene` ASC),
  UNIQUE INDEX `location_UNIQUE` (`location` ASC),
  CONSTRAINT `fk_mutation_Gene1`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `Vraag9`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vraag9`.`Gene_has_Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vraag9`.`Gene_has_Patient` (
  `Gene_idGene` INT NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  `patient_gene_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Gene_idGene`, `Patient_idPatient`, `patient_gene_id`),
  INDEX `fk_Gene_has_Patient_Patient1_idx` (`Patient_idPatient` ASC),
  INDEX `fk_Gene_has_Patient_Gene_idx` (`Gene_idGene` ASC),
  CONSTRAINT `fk_Gene_has_Patient_Gene`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `Vraag9`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gene_has_Patient_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `Vraag9`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vraag9`.`mutation_has_Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vraag9`.`mutation_has_Patient` (
  `mutation_idmutation` INT NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  `patiënt_mutations` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mutation_idmutation`, `Patient_idPatient`, `patiënt_mutations`),
  INDEX `fk_mutation_has_Patient_Patient1_idx` (`Patient_idPatient` ASC),
  INDEX `fk_mutation_has_Patient_mutation1_idx` (`mutation_idmutation` ASC),
  CONSTRAINT `fk_mutation_has_Patient_mutation1`
    FOREIGN KEY (`mutation_idmutation`)
    REFERENCES `Vraag9`.`mutation` (`idmutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mutation_has_Patient_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `Vraag9`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
