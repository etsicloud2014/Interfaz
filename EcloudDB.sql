SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `EcloudDB` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `EcloudDB` ;

-- -----------------------------------------------------
-- Table `EcloudDB`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `EcloudDB`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Tema` VARCHAR(45) NULL ,
  `Subtema` VARCHAR(45) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EcloudDB`.`Noticias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `EcloudDB`.`Noticias` (
  `idNoticias` INT NOT NULL AUTO_INCREMENT ,
  `Titulo` VARCHAR(45) NOT NULL ,
  `Fuente` VARCHAR(45) NULL ,
  `Fecha` VARCHAR(45) NULL ,
  `Link` VARCHAR(128) NOT NULL ,
  `Categoria_idCategoria` INT NOT NULL ,
  PRIMARY KEY (`idNoticias`) ,
  INDEX `fk_Noticias_Categoria` (`Categoria_idCategoria` ASC) ,
  CONSTRAINT `fk_Noticias_Categoria`
    FOREIGN KEY (`Categoria_idCategoria` )
    REFERENCES `EcloudDB`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EcloudDB`.`Usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `EcloudDB`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT ,
  `Nick` VARCHAR(45) NOT NULL ,
  `Pass` VARCHAR(45) NOT NULL ,
  `Nombre` VARCHAR(45) NULL ,
  `Apellido` VARCHAR(45) NULL ,
  `Admin` TINYINT(1) NULL ,
  `Correo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idUsuarios`) ,
  UNIQUE INDEX `Nick_UNIQUE` (`Nick` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EcloudDB`.`Usuarios_has_Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `EcloudDB`.`Usuarios_has_Categoria` (
  `Usuarios_idUsuarios` INT NOT NULL ,
  `Categoria_idCategoria` INT NOT NULL ,
  PRIMARY KEY (`Usuarios_idUsuarios`, `Categoria_idCategoria`) ,
  INDEX `fk_Usuarios_has_Categoria_Categoria1` (`Categoria_idCategoria` ASC) ,
  INDEX `fk_Usuarios_has_Categoria_Usuarios1` (`Usuarios_idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuarios_has_Categoria_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios` )
    REFERENCES `EcloudDB`.`Usuarios` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria` )
    REFERENCES `EcloudDB`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
