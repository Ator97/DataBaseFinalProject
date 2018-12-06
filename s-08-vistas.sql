--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creacion de vistas

--
--Se requiere conocer el listado de calificaciones de todos los alumnos
--
CREATE OR REPLACE VIEW PROMEDIO_ESTUDIANTE AS
	SELECT E.NUMERO_CUENTA,E.NOMBRE NOMBRE_ESTUDIANTE,C.NUM_GRUPO,
		A.NOMBRE,A.CREDITOS,EI.CALIFICACION
	FROM ESTUDIANTE E
	JOIN ESTUDIANTE_INSCRITO EI
	ON E.ESTUDIANTE_ID = EI.ESTUDIANTE_ID
	JOIN CURSO C
	ON C.CURSO_ID = EI.CURSO_ID
	JOIN ASIGNATURA A
	ON A.ASIGNATURA_ID = C.ASIGNATURA_ID;


--
--Conocer el numero de  alumnos registrados en todos los cursos del 
--semestre actual, mostrar: el numero, nombre asignatura,
--numero de grupo y nombre del profesor (con apelllidos) y su rfc
--

--Mapa de relaciones--

--estudiante_inscrito(estudiante_id, curso_id)
--curso(num_grupo,asignatura_id,horario_id,profesor_id,semestre_id)
--	asignatura(asignatuda_id,clave,nombre,creditos,plan_estudios_id)
--		plan_estudios(plan_estudios_id,anio,clave)
--profesor(profesor_id,nombre,ap_paterno,ap_materno)
--semestre(semestre_id,anio,periodo)
CREATE OR REPLACE VIEW  NUM_ALUMNOS_POR_CURSO AS 
	SELECT C.CURSO_ID, COUNT(*) NUM_ALUMNOS, C.NUM_GRUPO, A.NOMBRE NOM_ASIGNATURA,
		P.NOMBRE, P.AP_PATERNO, P.AP_MATERNO, P.RFC
	FROM ESTUDIANTE_INSCRITO EI
	JOIN CURSO C
	ON EI.CURSO_ID = C.CURSO_ID
	JOIN PROFESOR P
	ON P.PROFESOR_ID = C.PROFESOR_ID
	JOIN ASIGNATURA A
	ON A.ASIGNATURA_ID = C.ASIGNATURA_ID
	JOIN CURSO_SEMESTRE CS
	ON CS.CURSO_ID = C.CURSO_ID
	WHERE CS.SEMESTRE_ID = (SELECT MAX(SEMESTRE_ID) FROM SEMESTRE)
	GROUP BY C.CURSO_ID, C.NUM_GRUPO, A.NOMBRE,P.NOMBRE, 
		P.AP_PATERNO, P.AP_MATERNO, P.RFC;

SELECT * FROM NUM_ALUMNOS_POR_CURSO;
--
--Conocer el numero de alumnos totales que posee un 
--plan de estudios por carrera
--mostrasr: clave_plan, carrera, total_alumnos, hacer disticion 
--si esta titutlado o no.
--

--Mapa de las relaciones--

--	estudiante(estudiante_id,carrera_id,plan_estudios_id,cedula)
--	carrera(carrera_id,nonbre, clave)
--	plan_estudios(plan_estudios_id,clave)
CREATE OR REPLACE VIEW TITULACION_ESTUDIANTES AS
	SELECT Q1.CLAVE, Q1.NOMBRE, Q1.NO_TITULADOS, Q2.TITULADOS
	FROM (
		SELECT PE.CLAVE, C.NOMBRE, COUNT(*) AS NO_TITULADOS
		FROM ESTUDIANTE E
		JOIN CARRERA C
		ON C.CARRERA_ID = E.CARRERA_ID
		JOIN PLAN_ESTUDIOS PE
		ON PE.PLAN_ESTUDIOS_ID = E.PLAN_ESTUDIOS_ID
		WHERE E.CEDULA_PROFESIONAL IS NULL
		GROUP BY PE.CLAVE, C.NOMBRE ) Q1
	LEFT JOIN (
		SELECT PE.CLAVE, C.NOMBRE, COUNT(*) AS TITULADOS
		FROM ESTUDIANTE E
		JOIN CARRERA C
		ON C.CARRERA_ID = E.CARRERA_ID
		JOIN PLAN_ESTUDIOS PE
		ON PE.PLAN_ESTUDIOS_ID = E.PLAN_ESTUDIOS_ID
		WHERE E.CEDULA_PROFESIONAL IS NOT NULL
		GROUP BY PE.CLAVE, C.NOMBRE ) Q2
	ON Q1.NOMBRE = Q2.NOMBRE
	AND Q1.CLAVE = Q2.CLAVE;

SELECT * FROM TITULACION_ESTUDIANTES;


