SELECT
	profesores.id_profesor,
    profesores.nombre as profesor,
    asignaturas.asignatura
FROM profesores

JOIN rel_asignaturas_profesores ON rel_asignaturas_profesores.id_profesor = profesores.id_profesor
JOIN asignaturas ON asignaturas.id_asignatura = rel_asignaturas_profesores.id_asignatura