/*INSERT*/ 
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
    
    IN f_USU INT(11)
    
)
BEGIN

	INSERT INTO asistencia(fecha, hora_ingreso, hora_salida, id_usuario)
	VALUES (now(), now(), now(), f_USU);
    
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
DROP procedure IF EXISTS `insertusuario`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertusuario`(

	IN nombre varchar(100), 
	IN apellido_1 varchar(100), 
	IN apellido_2 varchar(100), 
	IN direccion varchar(100), 
	IN numero_celular bigint(10), 
	IN numero_documento int(11), 
    IN pas varchar(500),
	IN id_contacto_emergencia int(11), 
	IN id_contrato int(11), 
	IN id_tipo_estado_civil tinyint(3), 
	IN id_tipo_documento tinyint(3), 
	IN id_grupo_sanguineo tinyint(3), 
	IN id_arl tinyint(3),
	IN id_eps tinyint(3),
	IN id_turno tinyint(3)
    
)
BEGIN

	INSERT INTO usuario (nombre, apellido_1, apellido_2, direccion, numero_celular, numero_documento,contrasena, id_contacto_emergencia, id_contrato, id_tipo_estado_civil, id_tipo_documento, id_grupo_sanguineo, id_arl, id_eps, id_turno)
    VALUES (nombre, apellido_1, apellido_2, direccion, numero_celular, numero_documento,AES_ENCRYPT(pas,'123'), id_contacto_emergencia, id_contrato, id_tipo_estado_civil, id_tipo_documento, id_grupo_sanguineo, id_arl, id_eps, id_turno);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertusuario_permiso`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertusuario_permiso` (

	IN trazabilidad varchar(300),
	IN id_usuario int(11),
	IN id_permiso int(11)
    
)
BEGIN
	INSERT INTO usuario_permiso (trazabilidad, fecha, id_usuario, id_permiso)
    VALUES (trazabilidad, now(), id_usuario, id_permiso);
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
DROP procedure IF EXISTS `insertestado_rol`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertestado_rol`(

	IN tipo varchar(10)

)
BEGIN

	INSERT INTO estado_rol (tipo)
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
DROP procedure IF EXISTS `insertrol_usuario`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertrol_usuario`(
	IN id_rol tinyint(3),
	IN id_usuario int(11),
	IN fecha_inicio date,
	IN fecha_fin date, 
	IN id_estado_rol tinyint(3), 
	IN id_area tinyint(3)

)
BEGIN

	INSERT INTO rol_usuario
    VALUES (id_rol,id_usuario,fecha_inicio, fecha_fin, id_estado_rol, id_area);

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

	IN tipo_parentesco varchar(30)

)
BEGIN

	INSERT INTO parentesco (tipo_parentesco)
    VALUES (tipo_parentesco);

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
	IN id_soporte int(11)

)
BEGIN

	INSERT INTO permiso (fecha, dias, fecha_solicitud, id_estado_permiso, id_tipo_permiso, id_soporte)
    VALUES (fecha, dias, fecha_solicitud, id_estado_permiso, id_tipo_permiso, id_soporte);

END$$

DELIMITER ;

USE `quantum`;
DROP procedure IF EXISTS `insertreporte`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `insertreporte`(

	IN hora_ingreso time(6), 
	IN hora_salida time(6), 
	IN id_usuario int(11)

)
BEGIN

	INSERT INTO reporte (hora_ingreso, hora_salida, id_usuario)
    VALUES (hora_ingreso, hora_salida, id_usuario);

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
DELIMITER ;


/*====================================== UPDATES ====================================*/
                
                
/* updatearea_asig */

DROP PROCEDURE IF EXISTS `updatearea_asig`;
DELIMITER $$
CREATE PROCEDURE `updatearea_asig`(
	IN p_id TINYINT(3),
	IN p_nombre VARCHAR(50)
)
BEGIN
	UPDATE area_asignada 
	SET nombre = p_nombre 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatearl */

DROP PROCEDURE IF EXISTS `updatearl`;
DELIMITER $$
CREATE PROCEDURE `updatearl`(
	IN p_id TINYINT(3),
	IN p_nombre VARCHAR(50)
)
BEGIN
	UPDATE arl 
	SET nombre = p_nombre 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateasistencia */

DROP PROCEDURE IF EXISTS `updateasistencia`;
DELIMITER $$
CREATE PROCEDURE `updateasistencia`(
	IN p_id INT(11),
	IN p_fecha DATE,
	IN p_hora_ingreso TIME(6), 
	IN p_hora_salida TIME(6), 
	IN p_id_usuario INT(11)
)
BEGIN
	UPDATE asistencia 
	SET fecha = p_fecha, 
		hora_ingreso = p_hora_ingreso,
		hora_salida = p_hora_salida,
		id_usuario = p_id_usuario 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatecomprobante */

DROP PROCEDURE IF EXISTS `updatecomprobante`;
DELIMITER $$
CREATE PROCEDURE `updatecomprobante`(
	IN p_id INT(11),
	IN p_id_permiso INT(11), 
	IN p_id_tipo_comprobante INT(11)
)
BEGIN
	UPDATE comprobante 
	SET id_permiso = p_id_permiso, 
		id_tipo_comprobante = p_id_tipo_comprobante 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatecontacto_emergencia */

DROP PROCEDURE IF EXISTS `updatecontacto_emergencia`;
DELIMITER $$
CREATE PROCEDURE `updatecontacto_emergencia`(
	IN p_id INT(11),
	IN p_nombre_contacto VARCHAR(100),
	IN p_apellido_1 VARCHAR(100), 
	IN p_apellido_2 VARCHAR(100), 
	IN p_numero_celular BIGINT(19), 
	IN p_id_tipo_parentesco TINYINT(3), 
	IN p_id_grupo_sanguineo TINYINT(3)
)
BEGIN
	UPDATE contacto_emergencia 
	SET nombre_contacto = p_nombre_contacto, 
		apellido_1 = p_apellido_1,
		apellido_2 = p_apellido_2, 
		numero_celular = p_numero_celular, 
		id_tipo_parentesco = p_id_tipo_parentesco, 
		id_grupo_sanguineo = p_id_grupo_sanguineo  
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatecontrato*/

DROP PROCEDURE IF EXISTS `updatecontrato`;
DELIMITER $$
CREATE PROCEDURE `updatecontrato`(
	IN p_id INT(11),
	IN p_fecha_inicio DATE, 
	IN p_valor INT(11), 
	IN p_id_tipo_contrato TINYINT(3), 
	IN p_id_estado_contrato INT(11), 
	IN p_id_horario INT(11)
)
BEGIN
	UPDATE contrato 
	SET fecha_inicio = p_fecha_inicio, 
		valor = p_valor,
		id_tipo_contrato = p_id_tipo_contrato, 
		id_estado_contrato = p_id_estado_contrato, 
		id_horario = p_id_horario  
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateusuario*/

DROP PROCEDURE IF EXISTS `updateusuario`;
DELIMITER $$
CREATE PROCEDURE `updateusuario`(
	IN p_id INT(11), 
	IN p_nombre VARCHAR(100), 
	IN p_apellido_1 VARCHAR(100), 
	IN p_apellido_2 VARCHAR(100), 
	IN p_direccion VARCHAR(100), 
	IN p_numero_celular BIGINT(10), 
	IN p_numero_documento INT(11), 
    IN p_contrasena varchar(500),
	IN p_id_contacto_emergencia INT(11), 
	IN p_id_contrato INT(11), 
	IN p_id_tipo_estado_civil TINYINT(3), 
	IN p_id_tipo_documento TINYINT(3), 
	IN p_id_grupo_sanguineo TINYINT(3), 
	IN p_id_arl TINYINT(3), 
	IN p_id_eps TINYINT(3),
	IN p_id_turno TINYINT(3)
)
BEGIN
	UPDATE usuario 
	SET nombre = p_nombre,
		apellido_1 = p_apellido_1,
		apellido_2 = p_apellido_2,
		direccion = p_direccion,
		numero_celular = p_numero_celular, 
		numero_documento = p_numero_documento,
        contrasena=p_contrasena,
		id_contacto_emergencia = p_id_contacto_emergencia,
		id_contrato = p_id_contrato,
		id_tipo_estado_civil = p_id_tipo_estado_civil,
		id_tipo_documento = p_id_tipo_documento,
		id_grupo_sanguineo = p_id_grupo_sanguineo,
		id_arl = p_id_arl,
		id_eps = p_id_eps,
		id_turno = p_id_turno
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateeps*/

DROP PROCEDURE IF EXISTS `updateeps`;
DELIMITER $$
CREATE PROCEDURE `updateeps`(
	IN p_id TINYINT(3), 
	IN p_nombre VARCHAR(50)
)
BEGIN
	UPDATE eps 
	SET nombre = p_nombre 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateestado_civil */

DROP PROCEDURE IF EXISTS `updateestado_civil`;
DELIMITER $$
CREATE PROCEDURE `updateestado_civil`(
	IN p_id TINYINT(3), 
	IN p_tipo VARCHAR(30)
)
BEGIN
	UPDATE estado_civil 
	SET tipo = p_tipo 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateestado_contrato */

DROP PROCEDURE IF EXISTS `updateestado_contrato`;
DELIMITER $$
CREATE PROCEDURE `updateestado_contrato`(
	IN p_id TINYINT, 
	IN p_estado VARCHAR(30)
)
BEGIN
	UPDATE estado_contrato 
	SET estado = p_estado 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateestado_rol_usuario */

DROP PROCEDURE IF EXISTS `updateestado_rol_usuario`;
DELIMITER $$
CREATE PROCEDURE `updateestado_rol_usuario`(
	IN p_id TINYINT, 
	IN p_tipo VARCHAR(10)
)
BEGIN
	UPDATE estado_rol_usuario 
	SET tipo = p_tipo 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateestado_permiso */

DROP PROCEDURE IF EXISTS `updateestado_permiso`;
DELIMITER $$
CREATE PROCEDURE `updateestado_permiso`(
	IN p_id TINYINT, 
	IN p_tipo_estado VARCHAR(12)
)
BEGIN
	UPDATE estado_permiso 
	SET tipo_estado = p_tipo_estado 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updategrupo_sanguineo */

DROP PROCEDURE IF EXISTS `updategrupo_sanguineo`;
DELIMITER $$
CREATE PROCEDURE `updategrupo_sanguineo`(
	IN p_id TINYINT, 
	IN p_grupo_sanguineo CHAR(3), 
	IN p_id_rh TINYINT(3)
)
BEGIN
	UPDATE grupo_sanguineo 
	SET grupo_sanguineo = p_grupo_sanguineo,
		id_rh = p_id_rh 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatehorario */

DROP PROCEDURE IF EXISTS `updatehorario`;
DELIMITER $$
CREATE PROCEDURE `updatehorario`(
	IN p_id INT(11),
	IN p_hora_ingreso TIME(6), 
	IN p_hora_salida TIME(6)
)
BEGIN
	UPDATE horario 
	SET hora_ingreso = p_hora_ingreso,
		hora_salida = p_hora_salida 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updaterol_usuario_area */

DROP PROCEDURE IF EXISTS `updaterol_usuario_area`;
DELIMITER $$
CREATE PROCEDURE `updaterol_usuario`(
	IN p_id_rol INT(11),
    IN p_id_usuario int(11),
	IN p_fecha_inicio DATE,
	IN p_fecha_fin DATE,
	IN p_id_estado_rol TINYINT(3), 
	IN p_id_area TINYINT(3)
)
BEGIN
	UPDATE rol_usuario_area 
	SET fecha_inicio = p_fecha_inicio,
		fecha_fin = p_fecha_fin,
		id_estado_rol = p_id_estado_rol,
		id_area = p_id_area 
	WHERE id_rol = p_id_rol and id_usuario = p_id_usuario;
END$$
DELIMITER ;


/* updatejornada */

DROP PROCEDURE IF EXISTS `updatejornada`;
DELIMITER $$
CREATE PROCEDURE `updatejornada`(
	IN p_id TINYINT(3),
	IN p_tipo_jornada VARCHAR(255)
)
BEGIN
	UPDATE jornada 
	SET tipo_jornada = p_tipo_jornada 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateparentesco */

DROP PROCEDURE IF EXISTS `updateparentesco`;
DELIMITER $$
CREATE PROCEDURE `updateparentesco`(
	IN p_id TINYINT(3),
	IN p_tipo_parentesco VARCHAR(30)
)
BEGIN
	UPDATE parentesco 
	SET tipo_parentesco = p_tipo_parentesco
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatepermiso */

DROP PROCEDURE IF EXISTS `updatepermiso`;
DELIMITER $$
CREATE PROCEDURE `updatepermiso`(
	IN p_id INT(11),
	IN p_fecha DATE, 
	IN p_dias TINYINT(3), 
	IN p_fecha_solicitud DATE, 
	IN p_id_estado_permiso TINYINT(3), 
	IN p_id_tipo_permiso TINYINT(3), 
	IN p_id_soporte INT(11)
)
BEGIN
	UPDATE permiso 
	SET fecha = p_fecha,
		dias = p_dias,
		fecha_solicitud = p_fecha_solicitud,
		id_estado_permiso = p_id_estado_permiso,
		id_tipo_permiso = p_id_tipo_permiso,
		id_soporte = p_id_soporte
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatereporte */

DROP PROCEDURE IF EXISTS `updatereporte`;
DELIMITER $$
CREATE PROCEDURE `updatereporte`(
	IN p_id INT(11),
	IN p_hora_ingreso TIME(6), 
	IN p_hora_salida TIME(6), 
	IN p_id_usuario INT(11)
)
BEGIN
	UPDATE reporte 
	SET hora_ingreso = p_hora_ingreso,
		hora_salida = p_hora_salida,
		id_usuario = p_id_usuario 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updaterh */

DROP PROCEDURE IF EXISTS `updaterh`;
DELIMITER $$
CREATE PROCEDURE `updaterh`(
	IN p_id TINYINT(3),
	IN p_rh VARCHAR(10)
)
BEGIN
	UPDATE rh 
	SET rh = p_rh 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updaterol */

DROP PROCEDURE IF EXISTS `updaterol`;
DELIMITER $$
CREATE PROCEDURE `updaterol`(
	IN p_id TINYINT(3),
	IN p_nombre VARCHAR(50)
)
BEGIN
	UPDATE rol 
	SET nombre = p_nombre 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatesoporte */

DROP PROCEDURE IF EXISTS `updatesoporte`;
DELIMITER $$
CREATE PROCEDURE `updatesoporte`(
	IN p_id INT(11), 
	IN p_nombre VARCHAR(100), 
	IN p_url VARCHAR(255)
)
BEGIN
	UPDATE soporte 
	SET nombre = p_nombre,
		url = p_url 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatetipo_comprobante */

DROP PROCEDURE IF EXISTS `updatetipo_comprobante`;
DELIMITER $$
CREATE PROCEDURE `updatetipo_comprobante`(
	IN p_id INT(11),
	IN p_tipo_comprobante VARCHAR(100)
)
BEGIN
	UPDATE tipo_comprobante 
	SET tipo_comprobante = p_tipo_comprobante 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatetipo_contrato */

DROP PROCEDURE IF EXISTS `updatetipo_contrato`;
DELIMITER $$
CREATE PROCEDURE `updatetipo_contrato`(
	IN p_id TINYINT(3),
	IN p_tipo_contrato VARCHAR(50)
)
BEGIN
	UPDATE tipo_contrato 
	SET tipo_contrato = p_tipo_contrato 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatetipo_documento */

DROP PROCEDURE IF EXISTS `updatetipo_documento`;
DELIMITER $$
CREATE PROCEDURE `updatetipo_documento`(
	IN p_id TINYINT(3),
	IN p_tipo_documento VARCHAR(100)
)
BEGIN
	UPDATE tipo_documento 
	SET tipo_documento = p_tipo_documento 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updatetipo_permiso */

DROP PROCEDURE IF EXISTS `updatetipo_permiso`;
DELIMITER $$
CREATE PROCEDURE `updatetipo_permiso`(
	IN p_id TINYINT(3),
	IN p_tipo_permiso VARCHAR(50)
)
BEGIN
	UPDATE tipo_permiso 
	SET tipo_permiso = p_tipo_permiso 
	WHERE id = p_id;
END$$
DELIMITER ;


/* updateturno */

DROP PROCEDURE IF EXISTS `updateturno`;
DELIMITER $$
CREATE PROCEDURE `updateturno`(
	IN p_id TINYINT(3),
	IN p_hora_ingreso TIME(6), 
	IN p_hora_salida TIME(6), 
	IN p_id_jornada TINYINT(3)
)
BEGIN
	UPDATE turno 
	SET hora_ingreso = p_hora_ingreso,
		hora_salida = p_hora_salida,
		id_jornada = p_id_jornada 
	WHERE id = p_id;
END$$
DELIMITER ;


/*updateusuario_permiso*/

USE `quantum`;
DROP procedure IF EXISTS `updateusuario_permiso`;

DELIMITER $$
USE `quantum`$$
CREATE PROCEDURE `updateusuario_permiso` (
	IN p_id int,
	IN p_trazabilidad varchar(300),
	IN p_fecha date, 
	IN p_id_usuario int(11),
	IN p_id_permiso int(11)
    
)
BEGIN
	UPDATE usuario_permiso
    SET trazabilidad=p_trazabilidad, 
		fecha=p_fecha,
		id_usuario=p_id_usuario,
        id_permiso=p_id_permiso
	WHERE id = p_id;
END$$

DELIMITER ;




