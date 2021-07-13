-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema prueba_plan_ok
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prueba_plan_ok
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prueba_plan_ok` DEFAULT CHARACTER SET utf8 ;
USE `prueba_plan_ok` ;

-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `curso` VARCHAR(45) NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`profesores` (
  `id_profesor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `id_curso` INT NOT NULL,
  PRIMARY KEY (`id_profesor`),
  INDEX `id_curso` (`id_curso` ASC),
  CONSTRAINT `id_curso_foreign`
    FOREIGN KEY (`id_curso`)
    REFERENCES `prueba_plan_ok`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`asignaturas` (
  `id_asignatura` INT NOT NULL AUTO_INCREMENT,
  `asignatura` VARCHAR(45) NULL,
  PRIMARY KEY (`id_asignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`rel_asignaturas_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`rel_asignaturas_cursos` (
  `id_asignatura` INT NOT NULL,
  `id_curso` INT NOT NULL,
  INDEX `id_asignatura` (`id_asignatura` ASC),
  INDEX `id_curso` (`id_curso` ASC),
  CONSTRAINT `fore_id_asignatura_1`
    FOREIGN KEY (`id_asignatura`)
    REFERENCES `prueba_plan_ok`.`asignaturas` (`id_asignatura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fore_id_curso_1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `prueba_plan_ok`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`clases` (
  `id_clase` INT NOT NULL AUTO_INCREMENT,
  `clase` VARCHAR(45) NULL,
  PRIMARY KEY (`id_clase`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`rel_clases_profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`rel_clases_profesores` (
  `id_profesor` INT NOT NULL,
  `id_clase` INT NOT NULL,
  `id_asignatura` INT NOT NULL,
  INDEX `id_profesor` (`id_profesor` ASC),
  INDEX `id_clase` (`id_clase` ASC),
  INDEX `id_asignatura` (`id_asignatura` ASC),
  CONSTRAINT `fore_id_profesor_1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `prueba_plan_ok`.`profesores` (`id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fore_id_clase`
    FOREIGN KEY (`id_clase`)
    REFERENCES `prueba_plan_ok`.`clases` (`id_clase`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fore_id_asignatura_2`
    FOREIGN KEY (`id_asignatura`)
    REFERENCES `prueba_plan_ok`.`asignaturas` (`id_asignatura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`rel_asignaturas_profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`rel_asignaturas_profesores` (
  `id_asignatura` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  INDEX `id_asignatura` (`id_asignatura` ASC),
  INDEX `id_profesor` (`id_profesor` ASC),
  CONSTRAINT `fore_id_asignatura_3`
    FOREIGN KEY (`id_asignatura`)
    REFERENCES `prueba_plan_ok`.`asignaturas` (`id_asignatura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fore_id_profesor_2`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `prueba_plan_ok`.`profesores` (`id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`horarios` (
  `id_horario` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATETIME NULL,
  `fecha_fin` DATETIME NULL,
  `id_profesor` INT NULL,
  PRIMARY KEY (`id_horario`),
  INDEX `id_profesor` (`id_profesor` ASC),
  CONSTRAINT `fore_id_profesor_3`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `prueba_plan_ok`.`profesores` (`id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`alumnos` (
  `id_alumno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_alumno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`matriculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`matriculas` (
  `id_matricula` INT NOT NULL AUTO_INCREMENT,
  `id_curso` INT NOT NULL,
  `id_alumno` INT NOT NULL,
  PRIMARY KEY (`id_matricula`),
  INDEX `id_curso` (`id_curso` ASC),
  INDEX `id_alumno` (`id_alumno` ASC),
  CONSTRAINT `fore_id_curso_2`
    FOREIGN KEY (`id_curso`)
    REFERENCES `prueba_plan_ok`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fore_id_alumno`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `prueba_plan_ok`.`alumnos` (`id_alumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba_plan_ok`.`rel_matriculas_asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`rel_matriculas_asignaturas` (
  `id_matricula` INT NULL,
  `id_asignatura` INT NULL,
  INDEX `id_matricula` (`id_matricula` ASC),
  INDEX `id_asignatura` (`id_asignatura` ASC),
  CONSTRAINT `fore_id_matricula`
    FOREIGN KEY (`id_matricula`)
    REFERENCES `prueba_plan_ok`.`matriculas` (`id_matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fore_id_asignatura_4`
    FOREIGN KEY (`id_asignatura`)
    REFERENCES `prueba_plan_ok`.`asignaturas` (`id_asignatura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `prueba_plan_ok` ;

-- -----------------------------------------------------
-- Placeholder table for view `prueba_plan_ok`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`view1` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `prueba_plan_ok`.`view2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`view2` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `prueba_plan_ok`.`view3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba_plan_ok`.`view3` (`id` INT);

-- -----------------------------------------------------
-- View `prueba_plan_ok`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prueba_plan_ok`.`view1`;
USE `prueba_plan_ok`;


-- -----------------------------------------------------
-- View `prueba_plan_ok`.`view2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prueba_plan_ok`.`view2`;
USE `prueba_plan_ok`;


-- -----------------------------------------------------
-- View `prueba_plan_ok`.`view3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prueba_plan_ok`.`view3`;
USE `prueba_plan_ok`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`cursos` (`id_curso`, `curso`) VALUES (1, 'NodeJs');
INSERT INTO `prueba_plan_ok`.`cursos` (`id_curso`, `curso`) VALUES (2, 'PHP');
INSERT INTO `prueba_plan_ok`.`cursos` (`id_curso`, `curso`) VALUES (3, 'JavaScript');

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`profesores`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`profesores` (`id_profesor`, `nombre`, `id_curso`) VALUES (1, 'Jean Carlos', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`asignaturas`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`asignaturas` (`id_asignatura`, `asignatura`) VALUES (1, 'Programacion');

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`rel_asignaturas_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`rel_asignaturas_cursos` (`id_asignatura`, `id_curso`) VALUES (1, 1);
INSERT INTO `prueba_plan_ok`.`rel_asignaturas_cursos` (`id_asignatura`, `id_curso`) VALUES (1, 2);
INSERT INTO `prueba_plan_ok`.`rel_asignaturas_cursos` (`id_asignatura`, `id_curso`) VALUES (1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`clases`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`clases` (`id_clase`, `clase`) VALUES (1, 'Fundamentos de programacion');

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`rel_clases_profesores`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`rel_clases_profesores` (`id_profesor`, `id_clase`, `id_asignatura`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`rel_asignaturas_profesores`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`rel_asignaturas_profesores` (`id_asignatura`, `id_profesor`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`horarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`horarios` (`id_horario`, `fecha_inicio`, `fecha_fin`, `id_profesor`) VALUES (1, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`alumnos`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`alumnos` (`id_alumno`, `nombre`) VALUES (1, 'Josue');
INSERT INTO `prueba_plan_ok`.`alumnos` (`id_alumno`, `nombre`) VALUES (2, 'Carmen');

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`matriculas`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`matriculas` (`id_matricula`, `id_curso`, `id_alumno`) VALUES (1, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prueba_plan_ok`.`rel_matriculas_asignaturas`
-- -----------------------------------------------------
START TRANSACTION;
USE `prueba_plan_ok`;
INSERT INTO `prueba_plan_ok`.`rel_matriculas_asignaturas` (`id_matricula`, `id_asignatura`) VALUES (1, 1);

COMMIT;

