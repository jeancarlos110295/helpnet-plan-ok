SELECT 
	alumnos.nombre AS alumno, 
    asignaturas.asignatura, 
    notas.nota, 
    profesores.nombre AS profesor
FROM `alumnos`

JOIN matriculas on matriculas.id_alumno = alumnos.id_alumno
JOIN rel_matriculas_asignaturas on rel_matriculas_asignaturas.id_matricula = matriculas.id_matricula
JOIN asignaturas on asignaturas.id_asignatura = rel_matriculas_asignaturas.id_asignatura
JOIN notas ON notas.id_matricula = matriculas.id_matricula
JOIN profesores ON profesores.id_profesor = notas.id_profesor

WHERE alumnos.id_alumno = 1