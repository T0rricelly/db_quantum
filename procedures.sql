USE `quantum`;
DROP procedure IF EXISTS `insertArea_asig`;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`insertArea_asig`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertArea_asig`(

    IN nom VARCHAR(50)
    
)
BEGIN
	INSERT INTO area_asignada(nombre)
	VALUES (nom);
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `insertarl`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertarl`(

    IN nom VARCHAR(50)
    
)
BEGIN
	INSERT INTO arl(nombre)
	VALUES (nom);
END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertasistencia`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertasistencia`(

    IN f DATE,
    IN h_in TIME(6),
    IN h_sal TIME(6),
    IN f_emp INT(11)
    
)
BEGIN

	INSERT INTO asistencia(fecha, hora_ingreso, hora_salida, id_empleado)
	VALUES (f, h_in, h_sal, f_emp);
    
END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertcomprobante`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertcomprobante` (

	IN f_perm INT(11),
    IN f_t_comp INT(11)
    
)
BEGIN
	INSERT INTO comprobante (id_permiso, id_tipo_comprobante)
    VALUES (f_perm, f_t_comp);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertcontacto_emergencia`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertcontacto_emergencia`(

	IN nom_cont VARCHAR(100),
    IN ape_1 VARCHAR(100),
    IN ape_2 VARCHAR(100),
    IN num_cel BIGINT(19),
    IN f_t_paren TINYINT(3),
    IN f_g_san TINYINT(3)
    
)
BEGIN

	INSERT INTO contacto_emergencia (nombre_contacto, apellido_1, apellido_2, numero_celular, id_tipo_parentesco, id_grupo_sanguineo)
    VALUES (nom_cont, ape_1, ape_2, num_cel, f_t_paren, f_g_san);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertcontrato`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertcontrato`(

	IN fecha_inicio date,
    IN valor int(11),
    IN id_tipo_contrato tinyint(3),
    IN id_estado_contrato int(11),
    IN id_horario int(11)
    
)
BEGIN

	INSERT INTO contrato (fecha_inicio, valor, id_tipo_contrato, id_estado_contrato, id_horario)
    VALUES (fecha_inicio, valor, id_tipo_contrato, id_estado_contrato, id_horario);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertempleado`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertempleado`(

	IN nombre varchar(100), 
	IN apellido_1 varchar(100), 
	IN apellido_2 varchar(100), 
	IN direccion varchar(100), 
	IN numero_celular bigint(10), 
	IN numero_documento int(11), 
	IN id_contacto_emergencia int(11), 
	IN id_contrato int(11), 
	IN id_tipo_estado_civil tinyint(3), 
	IN id_tipo_documento tinyint(3), 
	IN id_grupo_sanguineo tinyint(3), 
	IN id_arl tinyint(3),
	IN id_eps tinyint(3),
	IN id_area_asignada tinyint(3), 
	IN id_turno tinyint(3), 
	IN id_rol tinyint(3)
    
)
BEGIN

	INSERT INTO empleado (nombre, apellido_1, apellido_2, direccion, numero_celular, numero_documento, id_contacto_emergencia, id_contrato, id_tipo_estado_civil, id_tipo_documento, id_grupo_sanguineo, id_arl, id_eps, id_area_asignada, id_turno, id_rol)
    VALUES (nombre, apellido_1, apellido_2, direccion, numero_celular, numero_documento, id_contacto_emergencia, id_contrato, id_tipo_estado_civil, id_tipo_documento, id_grupo_sanguineo, id_arl, id_eps, id_area_asignada, id_turno, id_rol);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `inserteps`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `inserteps`(

	IN nombre varchar(50)

)
BEGIN

	INSERT INTO eps (nombre)
    VALUES (nombre);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertestado_civil`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertestado_civil`(

	IN tipo varchar(30)

)
BEGIN

	INSERT INTO estado_civil (tipo)
    VALUES (tipo);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertestado_contrato`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertestado_contrato`(

	IN estado varchar(50)

)
BEGIN

	INSERT INTO estado_contrato (estado)
    VALUES (estado);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertestado_jefe`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertestado_jefe`(

	IN tipo varchar(10)

)
BEGIN

	INSERT INTO estado_jefe (tipo)
    VALUES (tipo);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertestado_permiso`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertestado_permiso`(

	IN tipo_estado varchar(12)

)
BEGIN

	INSERT INTO estado_permiso (tipo_estado)
    VALUES (tipo_estado);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertgrupo_sanguineo`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertgrupo_sanguineo`(

	IN grupo_sanguineo char(3),
    IN id_rh tinyint(3)

)
BEGIN

	INSERT INTO grupo_sanguineo (grupo_sanguineo, id_rh)
    VALUES (grupo_sanguineo, id_rh);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `inserthorario`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `inserthorario`(

	IN hora_ingreso time(6),
    IN hora_salida time(6)

)
BEGIN

	INSERT INTO horario (hora_ingreso, hora_salida)
    VALUES (hora_ingreso, hora_salida);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertjefe_area`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertjefe_area`(

	IN fecha_inicio date,
	IN fecha_fin date, 
	IN id_estado_jefe tinyint(3), 
	IN id_area tinyint(3)

)
BEGIN

	INSERT INTO jefe_area (fecha_inicio, fecha_fin, id_estado_jefe, id_area)
    VALUES (fecha_inicio, fecha_fin, id_estado_jefe, id_area);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertjornada`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertjornada`(

	IN tipo_jornada varchar(255)

)
BEGIN

	INSERT INTO jornada (tipo_jornada)
    VALUES (tipo_jornada);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertparentesco`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertparentesco`(

	IN tipo_estado varchar(30)

)
BEGIN

	INSERT INTO parentesco (tipo_estado)
    VALUES (tipo_estado);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertpermiso`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertpermiso`(

	IN fecha date,
	IN dias tinyint(3),
	IN fecha_solicitud date, 
	IN id_estado_permiso tinyint(3), 
	IN id_tipo_permiso tinyint(3), 
	IN id_jefe_area int(11), 
	IN id_empleado int(11), 
	IN id_soporte int(11)

)
BEGIN

	INSERT INTO permiso (fecha, dias, fecha_solicitud, id_estado_permiso, id_tipo_permiso, id_jefe_area, id_empleado, id_soporte)
    VALUES (fecha, dias, fecha_solicitud, id_estado_permiso, id_tipo_permiso, id_jefe_area, id_empleado, id_soporte);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertreporte`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertreporte`(

	IN hora_ingreso time(6), 
	IN hora_salida time(6), 
	IN id_empleado int(11)

)
BEGIN

	INSERT INTO reporte (hora_ingreso, hora_salida, id_empleado)
    VALUES (hora_ingreso, hora_salida, id_empleado);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertrh`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertrh`(

	IN rh varchar(10)

)
BEGIN

	INSERT INTO rh (rh)
    VALUES (rh);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertrol`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertrol`(

	IN nombre varchar(50)

)
BEGIN

	INSERT INTO rol (nombre)
    VALUES (nombre);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertsoporte`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertsoporte`(

	IN nombre varchar(100), 
	IN url varchar(255)

)
BEGIN

	INSERT INTO soporte (nombre, url)
    VALUES (nombre, url);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `inserttipo_comprobante`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `inserttipo_comprobante`(

	IN tipo_comprobante varchar(100)

)
BEGIN

	INSERT INTO tipo_comprobante (tipo_comprobante)
    VALUES (tipo_comprobante);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `inserttipo_contrato`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `inserttipo_contrato`(

	IN tipo_contrato varchar(50)

)
BEGIN

	INSERT INTO tipo_contrato (tipo_contrato)
    VALUES (tipo_contrato);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `inserttipo_documento`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `inserttipo_documento`(

	IN tipo_documento varchar(100)

)
BEGIN

	INSERT INTO tipo_documento (tipo_documento)
    VALUES (tipo_documento);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `inserttipo_permiso`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `inserttipo_permiso`(

	IN tipo_permiso varchar(50)

)
BEGIN

	INSERT INTO tipo_permiso (tipo_permiso)
    VALUES (tipo_permiso);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertturno`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertturno`(

	IN hora_ingreso time(6), 
	IN hora_salida time(6), 
	IN id_jornada tinyint(3)

)
BEGIN

	INSERT INTO turno (hora_ingreso, hora_salida, id_jornada)
    VALUES (hora_ingreso, hora_salida, id_jornada);

END$$

				/*UPDATES*/
                
DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `updatearea_asig`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `updatearea_asig` (

	IN id tinyint(3),
    IN nombre varchar(50)
    
)
BEGIN
	UPDATE area_asignada SET nombre=nombre WHERE id=id;
END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatearl`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatearl`(

	IN id tinyint(3),
    IN nombre varchar(50)
    
)
BEGIN
	UPDATE arl SET nombre=nombre WHERE id=id;
END$$


DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateasistencia`(

	IN id int(11),
    IN fecha date,
    IN hora_ingreso time(6), 
	IN hora_salida time(6), 
	IN id_empleado int(11)
)
BEGIN
	UPDATE asistencia SET fecha=fecha, hora_ingreso=hora_ingreso,hora_salida=hora_salida,id_empleado=id_empleado WHERE id=id;
END$$

DELIMITER ;


USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatecomprobante`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecomprobante`(

	IN id int(11),
    IN id_permiso int(11), 
	IN id_tipo_comprobante int(11)
)
BEGIN
	UPDATE comprobante SET id_permiso=id_permiso, id_tipo_comprobante=id_tipo_comprobante WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatecontacto_emergencia`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecontacto_emergencia`(

	IN id int(11),
    IN nombre_contacto varchar(100),
	IN apellido_1 varchar(100), 
	IN apellido_2 varchar(100), 
	IN numero_celular bigint(19), 
	IN id_tipo_parentesco tinyint(3), 
	IN id_grupo_sanguineo tinyint(3)
)
BEGIN
	UPDATE contacto_emergencia SET nombre_contacto=nombre_contacto, apellido_1=apellido_1,apellido_2=apellido_2, numero_celular=numero_celular, 
    id_tipo_parentesco=id_tipo_parentesco, id_grupo_sanguineo=id_grupo_sanguineo  WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatecontrato`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecontrato`(

	IN id int(11),
    IN fecha_inicio date, 
	IN valor int(11), 
	IN id_tipo_contrato tinyint(3), 
	IN id_estado_contrato int(11), 
	IN id_horario int(11)
)
BEGIN
	UPDATE contrato SET fecha_inicio=fecha_inicio, valor=valor,id_tipo_contrato=id_tipo_contrato, id_estado_contrato=id_estado_contrato, 
    id_horario=id_horario  WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateempleado`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateempleado`(

	IN id int(11), 
	IN nombre varchar(100), 
	IN apellido_1 varchar(100), 
	IN apellido_2 varchar(100), 
	IN direccion varchar(100), 
	IN numero_celular bigint(10), 
	IN numero_documento int(11), 
	IN id_contacto_emergencia int(11), 
	IN id_contrato int(11), 
	IN id_tipo_estado_civil tinyint(3), 
	IN id_tipo_documento tinyint(3), 
	IN id_grupo_sanguineo tinyint(3), 
	IN id_arl tinyint(3), 
	IN id_eps tinyint(3),
	IN id_area_asignada tinyint(3), 
	IN id_turno tinyint(3), 
	IN id_rol tinyint(3)
)
BEGIN
	UPDATE empleado SET 
    nombre=nombre,
    apellido_1=apellido_1,
    apellido_2=apellido_2,
    direccion=direccion,
    numero_celular=numero_celular, 
    numero_documento=numero_documento,
    id_contacto_emergencia=id_contacto_emergencia,
    id_contrato=id_contrato,
    id_tipo_estado_civil=id_tipo_estado_civil,
    id_tipo_documento=id_tipo_documento,
    id_grupo_sanguineo=id_grupo_sanguineo,
    id_arl=id_arl,
    id_eps=id_eps,
    id_area_asignada=id_area_asignada,
    id_turno=id_turno,
    id_rol=id_rol 
    WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateeps`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateeps`(

	IN id tinyint(3), 
	IN nombre varchar(50)
)
BEGIN
	UPDATE eps SET nombre=nombre WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateestado_civil`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateestado_civil`(

	IN id tinyint(3), 
	IN tipo varchar(30)
)
BEGIN
	UPDATE estado_civil SET tipo=tipo WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateestado_contrato`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateestado_contrato`(

	IN id tinyint, 
	IN estado varchar(30)
)
BEGIN
	UPDATE estado_contrato SET estado=estado WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateestado_jefe`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateestado_jefe`(

	IN id tinyint, 
	IN tipo varchar(10)
)
BEGIN
	UPDATE estado_jefe SET tipo=tipo WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateestado_permiso`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateestado_permiso`(

	IN id tinyint, 
	IN tipo_estado varchar(12)
)
BEGIN
	UPDATE estado_permiso SET tipo_estado=tipo_estado WHERE id=id;
END$$

DELIMITER ;
;
USE `quantum`;
DROP procedure IF EXISTS `updateestado_permiso`;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateestado_permiso`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updategrupo_sanguineo`(

	IN id tinyint, 
	IN grupo_sanguineo char(3), 
	IN id_rh tinyint(3)
)
BEGIN
	UPDATE grupo_sanguineo SET grupo_sanguineo=grupo_sanguineo,id_rh=id_rh WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatehorario`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatehorario`(

	IN id int(11),
	IN hora_ingreso time(6), 
	IN hora_salida time(6)
)
BEGIN
	UPDATE horario SET hora_ingreso=hora_ingreso,hora_salida=hora_salida WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatejefe_area`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatejefe_area`(

	IN id int(11),
	IN fecha_inicio date,
	IN fecha_fin date,
	IN id_estado_jefe tinyint(3), 
	IN id_area tinyint(3)
)
BEGIN
	UPDATE jefe_area SET fecha_inicio=fecha_inicio,fecha_fin=fecha_fin,id_estado_jefe=id_estado_jefe,id_area=id_area WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatejornada`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatejornada`(

	IN id tinyint(3),
	IN tipo_jornada varchar(255)
)
BEGIN
	UPDATE jornada SET tipo_jornada=tipo_jornada WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateparentesco`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateparentesco`(

	IN id tinyint(3),
	IN tipo_estado varchar(30)
)
BEGIN
	UPDATE parentesco SET tipo_estado=tipo_estado WHERE id=id;
END$$

DELIMITER ;
;
USE `quantum`;
DROP procedure IF EXISTS `updateparentesco`;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateparentesco`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepermiso`(

	IN id int(11),
	IN fecha date, 
	IN dias tinyint(3), 
	IN fecha_solicitud date, 
	IN id_estado_permiso tinyint(3), 
	IN id_tipo_permiso tinyint(3), 
	IN id_jefe_area int(11), 
	IN id_empleado int(11), 
	IN id_soporte int(11)
)
BEGIN
	UPDATE permiso SET 
    fecha=fecha,
    dias=dias,
    fecha_solicitud=fecha_solicitud,
    id_estado_permiso=id_estado_permiso,
    id_tipo_permiso=id_tipo_permiso,
    id_jefe_area=id_jefe_area,
    id_empleado=id_empleado,
    id_soporte=id_soporte
    WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatereporte`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatereporte`(

	IN id int(11),
	IN hora_ingreso time(6), 
	IN hora_salida time(6), 
	IN id_empleado int(11)
)
BEGIN
	UPDATE reporte SET hora_ingreso=hora_ingreso,hora_salida=hora_salida,id_empleado=id_empleado WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updaterh`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updaterh`(

	IN id tinyint(3),
	IN rh varchar(10)
)
BEGIN
	UPDATE rh SET rh=rh WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updaterol`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updaterol`(

	IN id tinyint(3),
	IN nombre varchar(50)
)
BEGIN
	UPDATE rol SET nombre=nombre WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatesoporte`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatesoporte`(

	IN id int(11), 
	IN nombre varchar(100), 
	IN url varchar(255)
)
BEGIN
	UPDATE soporte SET nombre=nombre,url=url WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatetipo_comprobante`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatetipo_comprobante`(

	IN id int(11),
	IN tipo_comprobante varchar(100)
)
BEGIN
	UPDATE tipo_comprobante SET tipo_comprobante=tipo_comprobante WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatetipo_contrato`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatetipo_contrato`(

	IN id tinyint(3),
	IN tipo_contrato varchar(50)
)
BEGIN
	UPDATE tipo_contrato SET tipo_contrato=tipo_contrato WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updatetipo_documento`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatetipo_documento`(

	IN id tinyint(3),
	IN tipo_documento varchar(100)
)
BEGIN
	UPDATE tipo_documento SET tipo_documento=tipo_documento WHERE id=id;
END$$

DELIMITER ;
;
USE `quantum`;
DROP procedure IF EXISTS `updatetipo_permiso`;

;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatetipo_permiso`(

	IN id tinyint(3),
	IN tipo_permiso varchar(50)
)
BEGIN
	UPDATE tipo_permiso SET tipo_permiso=tipo_permiso WHERE id=id;
END$$

DELIMITER ;
;

USE `quantum`;
DROP procedure IF EXISTS `quantum`.`updateturno`;
;

DELIMITER $$
USE `quantum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateturno`(

	IN id tinyint(3),
	IN hora_ingreso time(6), 
	IN hora_salida time(6), 
	IN id_jornada tinyint(3)
)
BEGIN
	UPDATE turno SET hora_ingreso=hora_ingreso,hora_salida=hora_salida, id_jornada=id_jornada WHERE id=id;
END$$

DELIMITER ;
;




