DROP DATABASE IF EXISTS quantum;
CREATE DATABASE quantum;
USE quantum;

-- Tablas fuertes
CREATE TABLE tipo_soporte(
	id TINYINT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_soporte VARCHAR(100)
);

CREATE TABLE tipo_documento(
	id TINYINT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_documento VARCHAR(100)
);

CREATE TABLE tipo_comprobante(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_comprobante VARCHAR(100)
);
CREATE TABLE tipo_permiso (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_permiso VARCHAR(50)
);
CREATE TABLE tipo_contrato (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_contrato VARCHAR(50)
);
CREATE TABLE estado_contrato(
	id TINYINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    estado VARCHAR(50)
);
CREATE TABLE estado_permiso (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_estado VARCHAR(12)
);
CREATE TABLE estado_rol (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(10)
);
CREATE TABLE estado_civil (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(30)
);
CREATE TABLE jornada (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_jornada VARCHAR (255)
);
CREATE TABLE arl (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);
CREATE TABLE rh (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rh VARCHAR(10)
);
CREATE TABLE rol (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);
CREATE TABLE area_asignada (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);
CREATE TABLE eps (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);
CREATE TABLE soporte (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_tipo_soporte TINYINT,
    url VARCHAR(255)
);

CREATE TABLE horario (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hora_ingreso TIME(6),
    hora_salida TIME(6)
);
CREATE TABLE parentesco (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_parentesco VARCHAR(30)
);
-- Tablas Debiles
CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido_1 VARCHAR(100),
    apellido_2 VARCHAR(100),
    direccion VARCHAR(100) UNIQUE,
    numero_celular BIGINT(10) UNIQUE,
    numero_documento INT UNIQUE,
    contrasena  varchar(500),
    id_contacto_emergencia INT,
    id_contrato INT,
    id_tipo_estado_civil TINYINT(3),
    id_tipo_documento TINYINT(3),
    id_grupo_sanguineo TINYINT(3),
    id_arl TINYINT(3),
    id_eps TINYINT(3),
    id_turno TINYINT(3)
);

CREATE TABLE contrato (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fecha_inicio DATE,
    valor INT,
    id_tipo_contrato TINYINT(3),
    id_estado_contrato TINYINT,
    id_horario INT
);
CREATE TABLE turno (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hora_ingreso TIME(6),
    hora_salida TIME(6),
    id_jornada TINYINT(3)
);
CREATE TABLE grupo_sanguineo (
	id TINYINT(3) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    grupo_sanguineo CHAR(3),
    id_rh TINYINT(3)
);
CREATE TABLE Rol_Usuario (
	id_rol TINYINT(3),
    id_usuario INT(11),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_estado_rol TINYINT(3),
    id_area TINYINT(3),
    PRIMARY KEY (id_rol, id_usuario)
);
CREATE TABLE contacto_emergencia (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_contacto VARCHAR(100),
    apellido_1 VARCHAR(100),
    apellido_2 VARCHAR(100),
    numero_celular BIGINT(19),
    id_tipo_parentesco TINYINT(3),
    id_grupo_sanguineo TINYINT(3)
);
CREATE TABLE permiso (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha DATE,
    dias TINYINT(3),
    fecha_solicitud DATE,
    id_estado_permiso TINYINT(3),
    id_tipo_permiso TINYINT(3),
    id_soporte INT
);
CREATE TABLE usuario_permiso(
	id int primary key auto_increment,
    trazabilidad varchar(300),
    fecha date,
    id_usuario int,
    id_permiso int
);
CREATE TABLE comprobante(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_permiso INT,
    id_tipo_comprobante INT
);
CREATE TABLE asistencia(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha DATE,
    hora_ingreso TIME(6),
    hora_salida TIME(6),
    id_usuario INT
);
CREATE TABLE reporte (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hora_ingreso TIME(6),
    hora_salida TIME(6),
    id_usuario INT
);
ALTER TABLE contrato 
ADD CONSTRAINT fk_tipo_contrato
FOREIGN KEY (id_tipo_contrato)
REFERENCES tipo_contrato(id);

ALTER TABLE contrato 
ADD CONSTRAINT fk_estado_contrato
FOREIGN KEY (id_estado_contrato)
REFERENCES estado_contrato(id);

ALTER TABLE contrato 
ADD CONSTRAINT fk_horario
FOREIGN KEY (id_horario)
REFERENCES horario(id);

ALTER TABLE turno
ADD CONSTRAINT fk_id_jornada
FOREIGN KEY (id_jornada)
REFERENCES jornada(id);

ALTER TABLE grupo_sanguineo
ADD CONSTRAINT fk_id_rh
FOREIGN KEY (id_rh)
REFERENCES rh(id);

ALTER TABLE  Rol_Usuario 
ADD CONSTRAINT fk_id_rol_estado_usuario
FOREIGN KEY (id_estado_rol)
REFERENCES estado_rol(id);

ALTER TABLE  Rol_Usuario 
ADD CONSTRAINT fk_id_rol_Usuario
FOREIGN KEY (id_rol)
REFERENCES rol(id);

ALTER TABLE  Rol_Usuario 
ADD CONSTRAINT fk_id_area
FOREIGN KEY (id_area)
REFERENCES area_asignada(id);

ALTER TABLE  Rol_Usuario 
ADD CONSTRAINT fk_id_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id);

ALTER TABLE contacto_emergencia 
ADD CONSTRAINT fk_id_tipo_parentesco
FOREIGN KEY (id_tipo_parentesco)
REFERENCES parentesco(id);

ALTER TABLE contacto_emergencia 
ADD CONSTRAINT fk_id_grupo_sanguineo
FOREIGN KEY (id_grupo_sanguineo)
REFERENCES grupo_sanguineo(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_contacto_emergencia
FOREIGN KEY (id_contacto_emergencia)
REFERENCES contacto_emergencia(id);

ALTER TABLE usuario  
ADD CONSTRAINT fk_id_contrato
FOREIGN KEY (id_contrato)
REFERENCES contrato(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_tipo_estado_civil
FOREIGN KEY (id_tipo_estado_civil)
REFERENCES estado_civil(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_tipo_documento
FOREIGN KEY (id_tipo_documento)
REFERENCES tipo_documento(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_grupo_sanguineo_usuario 
FOREIGN KEY (id_grupo_sanguineo)
REFERENCES grupo_sanguineo(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_arl_usuario 
FOREIGN KEY (id_arl)
REFERENCES arl(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_eps_usuario 
FOREIGN KEY (id_eps)
REFERENCES eps(id);

ALTER TABLE usuario 
ADD CONSTRAINT fk_id_turno_usuario 
FOREIGN KEY (id_turno)
REFERENCES turno(id);

ALTER TABLE permiso 
ADD CONSTRAINT fk_id_tipo_permiso
FOREIGN KEY (id_tipo_permiso)
REFERENCES tipo_permiso(id);

ALTER TABLE permiso
ADD CONSTRAINT fk_id_estado_permiso
FOREIGN KEY (id_estado_permiso)
REFERENCES estado_permiso(id);

ALTER TABLE permiso
ADD CONSTRAINT fk_id_soporte
FOREIGN KEY (id_soporte)
REFERENCES soporte(id);

ALTER TABLE usuario_permiso
ADD CONSTRAINT fk_id_usuario_permiso
FOREIGN KEY (id_usuario)
REFERENCES usuario(id);

ALTER TABLE usuario_permiso
ADD CONSTRAINT fk_id_permiso
FOREIGN KEY (id_permiso)
REFERENCES permiso(id);

ALTER TABLE comprobante
ADD CONSTRAINT fk_id_permiso_comprobante
FOREIGN KEY (id_permiso)
REFERENCES permiso(id);

ALTER TABLE comprobante
ADD CONSTRAINT fk_id_tipo_comprobante
FOREIGN KEY (id_tipo_comprobante)
REFERENCES tipo_comprobante(id);

ALTER TABLE asistencia
ADD CONSTRAINT fk_id_usuario_asistencia
FOREIGN KEY (id_usuario)
REFERENCES usuario(id);

ALTER TABLE reporte
ADD CONSTRAINT fk_id_usuario_reporte
FOREIGN KEY (id_usuario)
REFERENCES usuario(id);

ALTER TABLE soporte
ADD CONSTRAINT fk_id_tipo_soporte
FOREIGN KEY (id_tipo_soporte)
REFERENCES tipo_soporte(id);