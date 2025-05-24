DROP DATABASE IF EXISTS quantum;
CREATE DATABASE quantum;
USE quantum;

-- Tablas fuertes
CREATE TABLE tipo_documento(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
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
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    estado VARCHAR(50)
);
CREATE TABLE estado_permiso (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_estado VARCHAR(12)
);
CREATE TABLE estado_jefe (
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
CREATE TABLE area_jefe (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);
CREATE TABLE eps (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);
CREATE TABLE soporte (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    url VARCHAR(255)
);

CREATE TABLE horario (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hora_ingreso TIME(6),
    hora_salida TIME(6)
);
CREATE TABLE parentesco (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_estado VARCHAR(30)
);
-- Tablas Debiles
CREATE TABLE contrato (
	id INTEGER(10),
	fecha_inicio DATE,
    valor INT,
    id_tipo_contrato TINYINT(3),
    id_estado_contrato INT,
    id_horario INT
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

CREATE TABLE turno (
	id TINYINT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hora_ingreso TIME(6),
    hora_salida TIME(6),
    id_jornada TINYINT(3)
);
ALTER TABLE turno
ADD CONSTRAINT fk_id_jornada
FOREIGN KEY (id_jornada)
REFERENCES jornada(id);

CREATE TABLE grupo_sanguineo (
	id TINYINT(3) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    grupo_sanguineo CHAR(3),
    id_rh TINYINT(3)
);
ALTER TABLE grupo_sanguineo
ADD CONSTRAINT fk_id_rh
FOREIGN KEY (id_rh)
REFERENCES rh(id);

CREATE TABLE jefe_area (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_estado_jefe TINYINT(3),
    id_area TINYINT(3)
);
ALTER TABLE jefe_area 
ADD CONSTRAINT fk_id_estado_jefe
FOREIGN KEY (id_estado_jefe)
REFERENCES estado_jefe(id);

ALTER TABLE jefe_area
ADD CONSTRAINT fk_id_area
FOREIGN KEY (id_area)
REFERENCES area_jefe(id);

CREATE TABLE contacto_emergencia (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_contacto VARCHAR(100),
    apellido_1 VARCHAR(100),
    apellido_2 VARCHAR(100),
    numero_celular BIGINT(19),
    id_tipo_parentesco TINYINT(3),
    id_grupo_sanguineo TINYINT(3)
);
ALTER TABLE contacto_emergencia 
ADD CONSTRAINT fk_id_tipo_parentesco
FOREIGN KEY (id_tipo_parentesco)
REFERENCES parentesco(id);

ALTER TABLE contacto_emergencia 
ADD CONSTRAINT fk_id_grupo_sanguineo
FOREIGN KEY (id_grupo_sanguineo)
REFERENCES grupo_sanguineo(id);

CREATE TABLE empleado (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido_1 VARCHAR(100),
    apellido_2 VARCHAR(100),
    direccion VARCHAR(100) UNIQUE,
    numero_celular BIGINT(10) UNIQUE,
    numero_documento INT UNIQUE,
    id_contacto_emergencia INT,
    id_contrato INT,
    id_tipo_estado_civil TINYINT(3),
    id_tipo_documento TINYINT(3),
    id_tipo_sangre TINYINT(3),
    id_arl TINYINT(3),
    id_eps TINYINT(3),
    id_area TINYINT(3),
    id_turno TINYINT(3),
    id_rol TINYINT(3)
);

CREATE TABLE permiso (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha DATE,
    dias TINYINT(3),
    fecha_solicitud DATE,
    id_estado_permiso TINYINT(3),
    id_jefe_area TINYINT(3),
    id_empleado INT,
    id_permiso TINYINT(3),
    id_soporte INT
);