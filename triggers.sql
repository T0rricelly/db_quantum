
/*Before Insert contacto_emergencia*/
DROP TRIGGER IF EXISTS `quantum`.`contacto_emergencia_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `quantum`.`contacto_emergencia_BEFORE_INSERT` BEFORE INSERT ON `contacto_emergencia` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM contacto_emergencia WHERE numero_celular = NEW.numero_celular) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El numero de celular ya existe en la base de datos.';
    END IF;
DELIMITER ;


/*Before Insert empleado*/
DROP TRIGGER IF EXISTS `quantum`.`empleado_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `quantum`.`empleado_BEFORE_INSERT` BEFORE INSERT ON `empleado` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM empleado WHERE direccion = NEW.direccion or 
numero_celular=new.numero_celular or 
numero_documento=new.numero_documento) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La direccion, numero de contacto o numero de documento ya estan registrados en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert Eps*/
DROP TRIGGER IF EXISTS `quantum`.`eps_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`eps_BEFORE_INSERT` BEFORE INSERT ON `eps` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM eps WHERE nombre = NEW.nombre) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La eps ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;

/**Before insert estado_civil*/
DROP TRIGGER IF EXISTS `quantum`.`estado_civil_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_civil_BEFORE_INSERT` BEFORE INSERT ON `estado_civil` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_civil WHERE tipo = NEW.tipo) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;

/*Before insert estado_contrato*/
DROP TRIGGER IF EXISTS `quantum`.`estado_contrato_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_contrato_BEFORE_INSERT` BEFORE INSERT ON `estado_contrato` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_contrato WHERE estado = NEW.estado) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado ya existe en la base de datos.';
    END IF;
END$$
DELIMITER ;


/*Before insert estado_jefe*/
DROP TRIGGER IF EXISTS `quantum`.`estado_jefe_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_jefe_BEFORE_INSERT` BEFORE INSERT ON `estado_jefe` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_jefe WHERE tipo = NEW.tipo) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado de jefe ya existe en la base de datos.';
    END IF;
END$$
DELIMITER ;


/*Before insert estado_permiso*/
DROP TRIGGER IF EXISTS `quantum`.`estado_permiso_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_permiso_BEFORE_INSERT` BEFORE INSERT ON `estado_permiso` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_permiso WHERE tipo_estado = NEW.tipo_estado) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado del permiso ya existe en la base de datos.';
    END IF;
END$$
DELIMITER ;


/*Before insert grupo sanguineo*/
DROP TRIGGER IF EXISTS `quantum`.`grupo_sanguineo_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`grupo_sanguineo_BEFORE_INSERT` BEFORE INSERT ON `grupo_sanguineo` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM grupo_sanguineo WHERE grupo_sanguineo = NEW.grupo_sanguineo) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El grupo sanguineo ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert*/