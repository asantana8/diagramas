-- MySQL Script generated by MySQL Workbench
-- Thu Sep 15 20:02:52 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idCliente` INT NOT NULL,
  `NomeCliente` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  `Documento` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipes` (
  `idEquipes` INT NOT NULL,
  `NomeEquipe` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipes_has_Mecanicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipes_has_Mecanicos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipes_has_Mecanicos` (
  `Equipes_idEquipes` INT NOT NULL,
  `Mecanicos_idMecanicos` INT NOT NULL,
  PRIMARY KEY (`Equipes_idEquipes`, `Mecanicos_idMecanicos`),
  INDEX `fk_Equipes_has_Mecanicos_Mecanicos1_idx` (`Mecanicos_idMecanicos` ASC) VISIBLE,
  INDEX `fk_Equipes_has_Mecanicos_Equipes1_idx` (`Equipes_idEquipes` ASC) VISIBLE,
  CONSTRAINT `fk_Equipes_has_Mecanicos_Equipes1`
    FOREIGN KEY (`Equipes_idEquipes`)
    REFERENCES `mydb`.`Equipes` (`idEquipes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipes_has_Mecanicos_Mecanicos1`
    FOREIGN KEY (`Mecanicos_idMecanicos`)
    REFERENCES `mydb`.`Mecanicos` (`idMecanicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Especialidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Especialidades` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Especialidades` (
  `idEspecialidades` INT NOT NULL,
  `NomeEspecialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecanicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mecanicos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mecanicos` (
  `idMecanicos` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecanicos_has_Especialidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mecanicos_has_Especialidades` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mecanicos_has_Especialidades` (
  `Mecanicos_idMecanicos` INT NOT NULL,
  `Especialidades_idEspecialidades` INT NOT NULL,
  PRIMARY KEY (`Mecanicos_idMecanicos`, `Especialidades_idEspecialidades`),
  INDEX `fk_Mecanicos_has_Especialidades_Especialidades1_idx` (`Especialidades_idEspecialidades` ASC) VISIBLE,
  INDEX `fk_Mecanicos_has_Especialidades_Mecanicos1_idx` (`Mecanicos_idMecanicos` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanicos_has_Especialidades_Mecanicos1`
    FOREIGN KEY (`Mecanicos_idMecanicos`)
    REFERENCES `mydb`.`Mecanicos` (`idMecanicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanicos_has_Especialidades_Especialidades1`
    FOREIGN KEY (`Especialidades_idEspecialidades`)
    REFERENCES `mydb`.`Especialidades` (`idEspecialidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrdemServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrdemServico` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OrdemServico` (
  `idOrdemServico` INT NOT NULL,
  `DataEmissao` DATETIME NULL,
  `Status` VARCHAR(45) NULL,
  `DataConclusao` DATETIME NULL,
  `ValorServico` DECIMAL(10,2) NULL,
  `ValorMaoDeObra` DECIMAL(10,2) NULL,
  `ValorPecas` DECIMAL(10,2) NULL,
  `ValorInsumos` DECIMAL(10,2) NULL,
  `ValorTotal` DECIMAL(10,2) NULL,
  `Autorizacao` VARCHAR(1) NULL COMMENT 'S ou N',
  `Equipes_idEquipes` INT NOT NULL,
  `Veiculos_idVeiculos` INT NOT NULL,
  `Veiculos_Clientes_idCliente` INT NOT NULL,
  `TipoServico_idTipoServico` INT NOT NULL,
  `Pagamento_idPagamento` INT NOT NULL,
  PRIMARY KEY (`idOrdemServico`, `Equipes_idEquipes`, `Veiculos_idVeiculos`, `Veiculos_Clientes_idCliente`, `TipoServico_idTipoServico`, `Pagamento_idPagamento`),
  INDEX `fk_OrdemServico_Equipes1_idx` (`Equipes_idEquipes` ASC) VISIBLE,
  INDEX `fk_OrdemServico_Veiculos1_idx` (`Veiculos_idVeiculos` ASC, `Veiculos_Clientes_idCliente` ASC) VISIBLE,
  INDEX `fk_OrdemServico_TipoServico1_idx` (`TipoServico_idTipoServico` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServico_Equipes1`
    FOREIGN KEY (`Equipes_idEquipes`)
    REFERENCES `mydb`.`Equipes` (`idEquipes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Veiculos1`
    FOREIGN KEY (`Veiculos_idVeiculos` , `Veiculos_Clientes_idCliente`)
    REFERENCES `mydb`.`Veiculos` (`idVeiculos` , `Clientes_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_TipoServico1`
    FOREIGN KEY (`TipoServico_idTipoServico`)
    REFERENCES `mydb`.`TipoServico` (`idTipoServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrdemServico_has_Tipo_Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrdemServico_has_Tipo_Pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OrdemServico_has_Tipo_Pagamento` (
  `OrdemServico_idOrdemServico` INT NOT NULL,
  `OrdemServico_Equipes_idEquipes` INT NOT NULL,
  `OrdemServico_Veiculos_idVeiculos` INT NOT NULL,
  `OrdemServico_Veiculos_Clientes_idCliente` INT NOT NULL,
  `OrdemServico_TipoServico_idTipoServico` INT NOT NULL,
  `OrdemServico_Pagamento_idPagamento` INT NOT NULL,
  `Tipo_Pagamento_idTipoPagamento` INT NOT NULL,
  `DataPagamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `Parcelas` INT NULL DEFAULT 0,
  PRIMARY KEY (`OrdemServico_idOrdemServico`, `OrdemServico_Equipes_idEquipes`, `OrdemServico_Veiculos_idVeiculos`, `OrdemServico_Veiculos_Clientes_idCliente`, `OrdemServico_TipoServico_idTipoServico`, `OrdemServico_Pagamento_idPagamento`, `Tipo_Pagamento_idTipoPagamento`),
  INDEX `fk_OrdemServico_has_Tipo_Pagamento_Tipo_Pagamento1_idx` (`Tipo_Pagamento_idTipoPagamento` ASC) VISIBLE,
  INDEX `fk_OrdemServico_has_Tipo_Pagamento_OrdemServico1_idx` (`OrdemServico_idOrdemServico` ASC, `OrdemServico_Equipes_idEquipes` ASC, `OrdemServico_Veiculos_idVeiculos` ASC, `OrdemServico_Veiculos_Clientes_idCliente` ASC, `OrdemServico_TipoServico_idTipoServico` ASC, `OrdemServico_Pagamento_idPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServico_has_Tipo_Pagamento_OrdemServico1`
    FOREIGN KEY (`OrdemServico_idOrdemServico` , `OrdemServico_Equipes_idEquipes` , `OrdemServico_Veiculos_idVeiculos` , `OrdemServico_Veiculos_Clientes_idCliente` , `OrdemServico_TipoServico_idTipoServico` , `OrdemServico_Pagamento_idPagamento`)
    REFERENCES `mydb`.`OrdemServico` (`idOrdemServico` , `Equipes_idEquipes` , `Veiculos_idVeiculos` , `Veiculos_Clientes_idCliente` , `TipoServico_idTipoServico` , `Pagamento_idPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_has_Tipo_Pagamento_Tipo_Pagamento1`
    FOREIGN KEY (`Tipo_Pagamento_idTipoPagamento`)
    REFERENCES `mydb`.`Tipo_Pagamento` (`idTipoPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoServico` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoServico` (
  `idTipoServico` INT NOT NULL,
  `NomeServico` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoServico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo_Pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Pagamento` (
  `idTipoPagamento` INT NOT NULL,
  `FormaPagamento` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoPagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo_Pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Pessoa` (
  `idTipoPessoa` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Clientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`idTipoPessoa`, `Clientes_idCliente`),
  INDEX `fk_Tipo_Pessoa_Clientes1_idx` (`Clientes_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Tipo_Pessoa_Clientes1`
    FOREIGN KEY (`Clientes_idCliente`)
    REFERENCES `mydb`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veiculos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Veiculos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Veiculos` (
  `idVeiculos` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Placa` VARCHAR(45) NULL,
  `Clientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculos`, `Clientes_idCliente`),
  INDEX `fk_Veiculos_Clientes_idx` (`Clientes_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculos_Clientes`
    FOREIGN KEY (`Clientes_idCliente`)
    REFERENCES `mydb`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
