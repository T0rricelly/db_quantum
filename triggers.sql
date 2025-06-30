/*Before Insert area_asignada*/
DROP TRIGGER IF EXISTS `quantum`.`area_asignada_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `quantum`.`area_asignada_BEFORE_INSERT` BEFORE INSERT ON `area_asignada` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM area_asignada WHERE nombre = NEW.nombre) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El area ya existe en la base de datos.';
    END IF;
DELIMITER ;

/*Before Insert arl*/
DROP TRIGGER IF EXISTS `quantum`.`arl_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `quantum`.`arl_BEFORE_INSERT` BEFORE INSERT ON `arl` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM arl WHERE nombre = NEW.nombre) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El arl ya existe en la base de datos.';
    END IF;
DELIMITER ;

/*Before Update asistencia*/
DROP TRIGGER IF EXISTS asistencia_BEFORE_UPDATE;
DELIMITER $$
CREATE TRIGGER asistencia_BEFORE_UPDATE
BEFORE UPDATE ON asistencia
FOR EACH ROW
BEGIN
  IF OLD.fecha < CURDATE() THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No se puede modificar asistencia de fechas anteriores.';
  END IF;
END$$
DELIMITER ;
/*Before Insert asistencia*/
DROP TRIGGER IF EXISTS `quantum`.`asistencia_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`asistencia_BEFORE_INSERT` BEFORE INSERT ON `asistencia` FOR EACH ROW
BEGIN
   DECLARE registros INT;

  IF NEW.hora_ingreso IS NOT NULL THEN
    SELECT COUNT(*) INTO registros
    FROM asistencia
    WHERE id_usuario = NEW.id_usuario
      AND fecha = NEW.fecha
      AND hora_ingreso IS NOT NULL;

    IF registros > 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Ya existe un registro de ingreso para este usuario en esta fecha.';
    END IF;
  END IF;
  
  IF NEW.hora_salida IS NOT NULL THEN
    SELECT COUNT(*) INTO registros
    FROM asistencia
    WHERE id_usuario = NEW.id_usuario
      AND fecha = NEW.fecha
      AND hora_salida IS NOT NULL;

    IF registros > 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Ya existe un registro de salida para este usuario en esta fecha.';
    END IF;
  END IF;

END$$
DELIMITER ;


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

/*Before Insert contrato*/
DROP TRIGGER IF EXISTS contrato_BEFORE_INSERT;
DELIMITER $$
CREATE TRIGGER contrato_BEFORE_INSERT
BEFORE INSERT ON contrato
FOR EACH ROW
BEGIN
  IF EXISTS (
    SELECT 1 FROM contrato
    WHERE fecha_inicio = NEW.fecha_inicio
      AND valor = NEW.valor
      AND id_tipo_contrato = NEW.id_tipo_contrato
  ) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Este contrato ya existe.';
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

/*Before insert estado_permiso*/
DROP TRIGGER IF EXISTS `quantum`.`estado_permiso_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_permiso_BEFORE_INSERT` BEFORE INSERT ON `estado_permiso` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_permiso WHERE tipo_estado = NEW.tipo_estado) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado del perimso ya existe en la base de datos.';
    END IF;
END$$
DELIMITER ;

/*Before insert estado_rol*/
DROP TRIGGER IF EXISTS `quantum`.`estado_rol_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`estado_rol_BEFORE_INSERT` BEFORE INSERT ON `estado_rol` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM estado_rol WHERE tipo = NEW.tipo) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de estado del rol ya existe en la base de datos.';
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

/*Before insert horario*/
DROP TRIGGER IF EXISTS `quantum`.`horario_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`horario_BEFORE_INSERT` BEFORE INSERT ON `horario` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM horario WHERE hora_ingreso = NEW.hora_ingreso and hora_salida=NEW.hora_salida) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de horario ya esta registrado en la base de datos';
    END IF;
END$$
DELIMITER ;



/*Before insert jornada*/
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


/*Before insert permiso*/

DROP TRIGGER IF EXISTS `quantum`.`permiso_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`permiso_BEFORE_INSERT` BEFORE INSERT ON `permiso` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM permiso WHERE id_soporte = NEW.id_soporte) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El soporte proporcionado ya esta registrado en la base de datos';
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

/*Before insert rol_usuario*/
DROP TRIGGER IF EXISTS `quantum`.`soporte_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`soporte_BEFORE_INSERT` BEFORE INSERT ON `soporte` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM soporte WHERE url = NEW.url) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La URL ya esta registrada en la base de datos';
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

/*Before insert tipo_soporte*/ 
DROP TRIGGER IF EXISTS `quantum`.`tipo_soporte_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`tipo_soporte_BEFORE_INSERT` BEFORE INSERT ON `tipo_soporte` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM tipo_soporte WHERE tipo_soporte = NEW.tipo_soporte) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de soporte ya esta registrado en la base de datos';
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
                                        numero_documento=NEW.numero_documento or 
                                        direccion = NEW.direccion or 
                                        numero_celular=new.numero_celular or 
                                        numero_documento=new.numero_documento) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario ya esta registrado en la base de datos';
    END IF;
END$$


/*Before insert usuario_permiso*/ 
DROP TRIGGER IF EXISTS `quantum`.`usuario_permiso_BEFORE_INSERT`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`usuario_permiso_BEFORE_INSERT` BEFORE INSERT ON `usuario_permiso` FOR EACH ROW
BEGIN
IF EXISTS (SELECT * FROM usuario_permiso WHERE id_permiso=new.id_permiso) THEN
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este registro ya esta existe en la base de datos';
    END IF;
END$$
DELIMITER ;
/*--------------------------------------------------------------*/
/*--------------------------------------------------------------*/
/*--------------------------------------------------------------*/
/*Hacer la trazabilidad con el estado con update*/

DROP TRIGGER IF EXISTS `quantum`.`permiso_AFTER_UPDATE`;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER = CURRENT_USER TRIGGER `quantum`.`permiso_AFTER_UPDATE` AFTER UPDATE ON `permiso` FOR EACH ROW
BEGIN
  IF OLD.id_estado_permiso <> NEW.id_estado_permiso THEN
    INSERT INTO usuario_permiso(trazabilidad,fecha)
    VALUES (CONCAT("Antes:",OLD.id_estado_permiso," Ahora: ",NEW.id_estado_permiso), CURDATE());
  END IF;
END$$
DELIMITER ;

 /*Hacer la trazabilidad con el estado con insert*/
DROP TRIGGER IF EXISTS permiso_AFTER_INSERT;
DELIMITER $$
CREATE TRIGGER permiso_AFTER_INSERT
AFTER INSERT ON permiso
FOR EACH ROW
BEGIN
  INSERT INTO usuario_permiso (trazabilidad, fecha, id_usuario, id_permiso)
  VALUES ('Permiso creado', CURDATE(), (SELECT id_usuario FROM usuario WHERE id_contrato = NEW.id_estado_permiso LIMIT 1), NEW.id);
END$$
DELIMITER ;

