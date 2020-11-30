-- -----------------------------------------------------
-- Table `mydb`.`pecas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecas` (
  `idpecas` INT NOT NULL AUTO_INCREMENT,
  `tipoPeca` VARCHAR(45) NOT NULL,
  `nomePeca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpecas`),
  UNIQUE INDEX `nomePeca_UNIQUE` (`nomePeca` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caracteristica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Caracteristica` (
  `idCaracteristica` INT NOT NULL AUTO_INCREMENT,
  `nomeCaracteristica1` VARCHAR(45) NULL,
  `nomeCaracteristica2` VARCHAR(45) NULL,
  `nomeCaracteristica3` VARCHAR(45) NULL,
  `nomeCaracteristica4` VARCHAR(45) NULL,
  `nomeCaracteristica5` VARCHAR(45) NULL,
  PRIMARY KEY (`idCaracteristica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Possui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Possui` (
  `FK_idPeca` INT NOT NULL,
  `FK_idCaracteristica` INT NOT NULL,
  `valorCaracteristica1` VARCHAR(45),
  `valorCaracteristica2` FLOAT(3),
  `valorCaracteristica3` VARCHAR(45),
  `valorCaracteristica4` INT,
  `valorCaracteristica5` INT,
  INDEX `fk_Possui_2_idx` (`FK_idCaracteristica` ASC),
  CONSTRAINT `fk_Possui_1`
    FOREIGN KEY (`FK_idPeca`)
    REFERENCES `pecas` (`idpecas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Possui_2`
    FOREIGN KEY (`FK_idCaracteristica`)
    REFERENCES `Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- --------------------------------------
--          i3-9350KF

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","i3-9350KF");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES (1, 1, 4, 4.60, "FCLGA 1151", 91, 8);

-- --------------------------------------

--          i5-9350KF

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","i5-9400F");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES (11, 11, 6, 4.10, "FCLGA 1151", 65, 9);

-- --------------------------------------

-- --------- EXEMPLO ABAIXO: ------------

--          *NOME DA PEÇA*

-- INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador", /* nome entre aspas, modificar aqui --->*/"");
-- INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
-- VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
-- INSERT INTO Possui
/*
* AVISO PORRA:
* OS 2 (DOIS) PRIMEIROS VALORES DO 'INSERT INTO Possui' PRECISAM *SEMPRE*
* SEREM MODIFICADOS, (no caso o 2, 2). ELES REPRESENTAM O ID DAS PEÇAS QUE ESTÃO SENDO REFERENCIADAS
* EXEMPLO: O I3 TEM ID = 1, POR ISSO COLOCA 'VALUES (1, 1, ***, "*******", **, *)
*/
-- VALUES /*valores da peça, modificar aqui TUDO*/ (2, 2, 6, 4.10, "FCLGA 1151", 65, 9);

-- samir zz, se tu errar essa porra, eu vo te mata.
-- --------------------------------------

-- ----------- FIM EXEMPLO --------------


--          i3-7100

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","i3-7100");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES (21, 21, 4, 3.90 , "FCLGA 1151", 51, 3);

--           i3-8100

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i3-8100");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES (31, 31, 4, 3.60 , "FCLGA 1151", 65, 6 );

--           i5-7400

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i5-7400");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 41, 41, 4, 3.00 , "FCLGA 1151", 65, 6 );

--           i5-8400

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i5-8400");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 51, 51, 6, 2.80  , "FCLGA 1151", 65, 9 );

--           i5-9600K

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","  i5-9600K");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 61, 61, 6,  3.70, "FCLGA 1151", 65, 9 );


--          i7-7700K

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i7-7700K");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 71, 71, 8, 4.20, "FCLGA 1151", 91, 8 );

--          i7-8700

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i7-8700");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 81, 81, 12, 3.20, "FCLGA 1151", 65, 12 );

--          i7-8700K

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i7-8700K");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 91, 91, 12, 3.70, "FCLGA 1151", 95, 12 );

--          i7-9700F

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador"," i7-9700F");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 101, 101, 8, 3.00, "FCLGA 1151", 65, 12 );

--          Celeron G5900

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","Celeron G5900");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 111, 111, 2, 3.40 , "FCLGA 1200", 58, 2 );

--          Pentium® Gold G6500T

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","Pentium® Gold G6500T");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 121, 121, 4, 3.50 , "FCLGA 1200", 35 , 4 );

--          Core™2 Duo E8400

INSERT INTO pecas (tipoPeca, nomePeca) VALUES ("Processador","Core™2 Duo E8400");
INSERT INTO Caracteristica (nomeCaracteristica1, nomeCaracteristica2, nomeCaracteristica3, nomeCaracteristica4, nomeCaracteristica5)
VALUES ("Thread", "Clock", "Soquete", "TDP", "Cache");
INSERT INTO Possui
VALUES ( 131, 131, 2 , 3.00 , "FCLGA 1200", 65 , 6 );
