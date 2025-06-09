
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


/*Before Insert usuario*/
DROP TRIGGER IF EXISTS `quantum`.`usuario_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `quantum`.`usuario_BEFORE_INSERT` BEFORE INSERT ON `usuario` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM usuario WHERE direccion = NEW.direccion or 
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
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_jefe_BEFORE_INSERT` BEFORE INSERT ON `estado_rol` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_rol WHERE tipo = NEW.tipo) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado del rol ya existe en la base de datos.';
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


/*Before insert tipo_jornada*/
DROP TRIGGER IF EXISTS `quantum`.`jornada_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`jornada_BEFORE_INSERT` BEFORE INSERT ON `jornada` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM jornada WHERE tipo_jornada = NEW.tipo_jornada) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de jornada ya esta registrada en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert parentesco*/
DROP TRIGGER IF EXISTS `quantum`.`parentesco_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`parentesco_BEFORE_INSERT` BEFORE INSERT ON `parentesco` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM parentesco WHERE tipo_parentesco = NEW.tipo_parentesco) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de parentesco ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;

/*Before insert rh*/
DROP TRIGGER IF EXISTS `quantum`.`rh_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`rh_BEFORE_INSERT` BEFORE INSERT ON `rh` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM rh WHERE rh = NEW.rh) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de rh ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert rol*/
DROP TRIGGER IF EXISTS `quantum`.`rol_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`rol_BEFORE_INSERT` BEFORE INSERT ON `rol` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM rol WHERE nombre = NEW.nombre) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de rol ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert tipo_comprobante*/ 
DROP TRIGGER IF EXISTS `quantum`.`tipo_comprobante_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`tipo_comprobante_BEFORE_INSERT` BEFORE INSERT ON `tipo_comprobante` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM tipo_comprobante WHERE tipo_comprobante = NEW.tipo_comprobante) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de comprobante ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert tipo_contrato*/ 
DROP TRIGGER IF EXISTS `quantum`.`tipo_contrato_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`tipo_contrato_BEFORE_INSERT` BEFORE INSERT ON `tipo_contrato` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM tipo_contrato WHERE tipo_contrato = NEW.tipo_contrato) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de contrato ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert tipo_documento*/ 
DROP TRIGGER IF EXISTS `quantum`.`tipo_documento_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`tipo_documento_BEFORE_INSERT` BEFORE INSERT ON `tipo_documento` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM tipo_documento WHERE tipo_documento = NEW.tipo_documento) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de documento ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert tipo_permiso*/ 
DROP TRIGGER IF EXISTS `quantum`.`tipo_permiso_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`tipo_permiso_BEFORE_INSERT` BEFORE INSERT ON `tipo_permiso` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM tipo_permiso WHERE tipo_permiso = NEW.tipo_permiso) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de permiso ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert turno*/ 
DROP TRIGGER IF EXISTS `quantum`.`turno_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`turno_BEFORE_INSERT` BEFORE INSERT ON `turno` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM turno WHERE hora_ingreso = NEW.hora_ingreso AND hora_salida=NEW.hora_salida AND id_jornada=NEW.id_jornada) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El turno ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;


/*Before insert usuario*/ 
DROP TRIGGER IF EXISTS `quantum`.`usuario_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`usuario_BEFORE_INSERT` BEFORE INSERT ON `usuario` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM usuario WHERE nombre = NEW.nombre AND 
										apellido_1=NEW.apellido_1 AND 
                                        apellido_2=NEW.apellido_2 AND 
                                        direccion=NEW.direccion AND 
                                        numero_celular=NEW.numero_celular AND 
                                        numero_documento=NEW.numero_documento) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario ya esta registrado en la base de datos';
    END IF;
END$$