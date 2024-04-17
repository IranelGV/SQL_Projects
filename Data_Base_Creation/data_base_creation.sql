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
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city_providence` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip_postal_code` VARCHAR(45) NOT NULL,
  `customerscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sales_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sales_person` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `invoices_id` INT NOT NULL,
  `data` DATETIME NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `sales_person` VARCHAR(45) NULL,
  `customers_customer_id` INT NOT NULL,
  `sales_person_staff_id` INT NOT NULL,
  PRIMARY KEY (`invoices_id`),
  INDEX `fk_Invoices_customers1_idx` (`customers_customer_id` ASC) VISIBLE,
  INDEX `fk_Invoices_sales_person1_idx` (`sales_person_staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_sales_person1`
    FOREIGN KEY (`sales_person_staff_id`)
    REFERENCES `mydb`.`sales_person` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `cars_VIN` INT NOT NULL,
  `Manufacture` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `color` INT NOT NULL,
  `carscol` VARCHAR(45) NOT NULL,
  `customers_customer_id` INT NOT NULL,
  `Invoices_invoices_id` INT NOT NULL,
  PRIMARY KEY (`cars_VIN`),
  INDEX `fk_cars_customers_idx` (`customers_customer_id` ASC) VISIBLE,
  INDEX `fk_cars_Invoices1_idx` (`Invoices_invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_cars_customers`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_Invoices1`
    FOREIGN KEY (`Invoices_invoices_id`)
    REFERENCES `mydb`.`Invoices` (`invoices_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sales_person_has_customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sales_person_has_customers` (
  `sales_person_staff_id` INT NOT NULL,
  `customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`sales_person_staff_id`, `customers_customer_id`),
  INDEX `fk_sales_person_has_customers_customers1_idx` (`customers_customer_id` ASC) VISIBLE,
  INDEX `fk_sales_person_has_customers_sales_person1_idx` (`sales_person_staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_person_has_customers_sales_person1`
    FOREIGN KEY (`sales_person_staff_id`)
    REFERENCES `mydb`.`sales_person` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_person_has_customers_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
