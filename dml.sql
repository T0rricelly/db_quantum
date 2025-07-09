USE `quantum`;

-- tablas fuertes

-- tipo_documento
CALL inserttipo_documento('Cédula de Ciudadanía');
CALL inserttipo_documento('Cédula de Extranjería');
CALL inserttipo_documento('Pasaporte');
CALL inserttipo_documento('Tarjeta de Identidad');

-- tipo_soporte

CALL inserttipo_soporte('Certificado médico');
CALL inserttipo_soporte('Comprobantes de Nacimiento');
CALL inserttipo_soporte('Documentación de Calamidad Doméstica');
CALL inserttipo_soporte('Solicitudes por Escrito');
CALL inserttipo_soporte('Documentos de Instituciones Educativas');
CALL inserttipo_soporte('Actas de Funcionarios Sindicales');
CALL inserttipo_soporte('Documentos de Autoridades Públicas');

-- tipo_permiso
CALL inserttipo_permiso('Vacaciones');
CALL inserttipo_permiso('Licencia Médica');
CALL inserttipo_permiso('Permiso Personal');
CALL inserttipo_permiso('Permiso de Estudio');

-- tipo_contrato
CALL inserttipo_contrato('Término indefinido');
CALL inserttipo_contrato('Término fijo');
CALL inserttipo_contrato('Obra o labor');
CALL inserttipo_contrato('Prestación de servicios');

-- estado_contrato
CALL insertestado_contrato('Activo');
CALL insertestado_contrato('Inactivo');
CALL insertestado_contrato('Terminado');
CALL insertestado_contrato('Cancelado');

-- estado_permiso
CALL insertestado_permiso('Pendiente');
CALL insertestado_permiso('Aprobado');
CALL insertestado_permiso('Rechazado');
CALL insertestado_permiso('Cancelado');
CALL insertestado_permiso('Devuelto');

-- estado_rol
CALL insertestado_rol('Activo');
CALL insertestado_rol('Inactivo');

-- estado_civil
CALL insertestado_civil('Soltero');
CALL insertestado_civil('Casado');
CALL insertestado_civil('Unión Libre');
CALL insertestado_civil('Divorciado');
CALL insertestado_civil('Viudo');

-- jornada
CALL insertjornada('Diurna');
CALL insertjornada('Nocturna');
CALL insertjornada('Mixta');

-- arl 
CALL insertarl('Positiva');
CALL insertarl('Sura');
CALL insertarl('Colmena');
CALL insertarl('Bolívar');

-- rh 
CALL insertrh('+');
CALL insertrh('-');


-- rol
CALL insertrol('Empleado');
CALL insertrol('Jefe');


-- area_asignada 
CALL insertArea_asig('Recursos Humanos');
CALL insertArea_asig('Desarrollo');
CALL insertArea_asig('Calidad');
CALL insertArea_asig('Finanzas');
CALL insertArea_asig('Logística');

-- eps
CALL inserteps('Sura');
CALL inserteps('Sanitas');
CALL inserteps('Compensar');
CALL inserteps('Coomeva');

-- soporte 
CALL insertsoporte(2,'http://www.minsalud.gov.co/certificado_medico.pdf');
CALL insertsoporte(3,'http://www.mineducacion.gov.co/justificante_estudio.pdf');
CALL insertsoporte(1,'http://www.gov.co/permiso_especial.pdf');

-- horario 
CALL inserthorario('08:00:00', '17:00:00');
CALL inserthorario('09:00:00', '18:00:00');
CALL inserthorario('07:00:00', '15:00:00');

-- parentesco 
CALL insertparentesco('Padre');
CALL insertparentesco('Madre');
CALL insertparentesco('Hermano');
CALL insertparentesco('Cónyuge');
CALL insertparentesco('Hijo');

-- tablas débiles

-- contrato 
CALL insertcontrato('2024-06-01', 2500000, 1, 1, 1);
CALL insertcontrato('2025-01-15', 1800000, 2, 1, 2);

-- turno 
CALL insertturno('08:00:00', '12:00:00', 1);
CALL insertturno('13:00:00', '18:00:00', 1);
CALL insertturno('22:00:00', '06:00:00', 2);

-- grupo_sanguineo 
CALL insertgrupo_sanguineo('A', 1);
CALL insertgrupo_sanguineo('O', 1);
CALL insertgrupo_sanguineo('B', 2);
CALL insertgrupo_sanguineo('AB', 2);


-- contacto_emergencia 
CALL insertcontacto_emergencia('Juan', 'Lotero', 'Moreno', 3112345678, 1, 1);
CALL insertcontacto_emergencia('Juan', 'Loteroooo', 'Moreno', 3112345677, 1, 1);
-- usuario 
CALL insertusuario(
    'Kevin',
    'Lotero',
    'Moreno',
    'Calle 123 #45-67, Pereira',
    3112345678,
    12345678,
    "",
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    1
);
CALL insertusuario(
    'Daniel',
    'Mendez',
    'Fontecha',
    'Calle 83 #80-72, Bogota',
    3077845979,
    1764538,
    456,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
);

CALL insertusuario(
    'Ana',
    'Ramírez',
    'Rodríguez',
    'Carrera 10 #20-30, Medellín',
    3129876543,
    87654321,
    123,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2
);

-- permiso
CALL insertpermiso('2025-06-10', 5, '2025-06-01', 1, 1,2);
CALL insertpermiso('2025-06-05', 2, '2025-05-30', 2, 2,1);

-- asistencia 
CALL insertasistencia(1);
CALL insertasistencia(2);
-- rol_usuario
CALL insertrol_usuario(1,2,'2024-07-01', '2025-07-01', 1, 1);
CALL insertrol_usuario(2,1,'2024-08-01', NULL, 1, 2);

-- insertusuario_permiso
CALL insertusuario_permiso(2,2);
CALL insertusuario_permiso(1,1);

