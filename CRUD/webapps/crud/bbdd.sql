CREATE TABLE IF NOT EXISTS `Mortal_kombat_prehistorico`.`depredadores` (
  `CodDep` INT NOT NULL,
  `NomDep` VARCHAR(45) NOT NULL,
  `FamDep` VARCHAR(45) NOT NULL,
  `LocDep` VARCHAR(45) NOT NULL,
  `TempDep` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(45) NOT NULL,
  `Dieta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodDep`))
  
 CREATE TABLE IF NOT EXISTS `Mortal_kombat_prehistorico`.`defensores` (
  `CodDef` INT NOT NULL,
  `NomDef` VARCHAR(45) NOT NULL,
  `FamDef` VARCHAR(45) NOT NULL,
  `LocDef` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Enemigos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodDef`)) 
