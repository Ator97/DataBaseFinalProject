--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creación de sinónimos.


--


--Sinonimos publicos
create or replace public synonym estudiante for VAGU_proy_admin.ESTUDIANTE;
create or replace public synonym ESTUDIANTE_INSCRITO for VAGU_proy_admin.ESTUDIANTE_INSCRITO;
create or replace public synonym PROFESOR for VAGU_proy_admin.PROFESOR;


--Asignamos  sinonimos al  usuario invitado.
grant select on VAGU_proy_admin.PROFESOR_ASIGNATURA to VAGU_proy_invitado;
grant select on VAGU_proy_admin.PROFESOR_CARRERA to VAGU_proy_invitado;
grant select on VAGU_proy_admin.PROFESOR_ADMINISTRADOR to VAGU_proy_invitado;

create or replace synonym PROFESOR_ASIGNATURA_INV for VAGU_proy_admin.PROFESOR_ASIGNATURA;
create or replace synonym PROFESOR_CARRERA_INV for VAGU_proy_admin.PROFESOR_CARRERA;
create or replace synonym PROFESOR_ADMINISTRADOR_INV for VAGU_proy_admin.PROFESOR_ADMINISTRADOR;

create or replace public synonym XX_PROFESOR for VAGU_proy_admin.PROFESOR;


create or replace public synonym XX_CARRERA         for VAGU_proy_admin.CARRERA;
create or replace public synonym XX_PLAN_ESTUDIOS  	for VAGU_proy_admin.PLAN_ESTUDIOS;
create or replace public synonym XX_ASIGNATURA 	for VAGU_proy_admin.ASIGNATURA;
create or replace public synonym XX_DIA_SEMANA 	for VAGU_proy_admin.DIA_SEMANA;
create or replace public synonym XX_HORARIO for VAGU_proy_admin.HORARIO;
create or replace public synonym XX_SEMESTRE for VAGU_proy_admin.SEMESTRE;
create or replace public synonym XX_GRADO_ESTUDIOS for VAGU_proy_admin.GRADO_ESTUDIOS;
create or replace public synonym XX_PUESTO for VAGU_proy_admin.PUESTO;
create or replace public synonym XX_STATUS_TESIS for VAGU_proy_admin.STATUS_TESIS;
create or replace public synonym XX_PROFESOR for VAGU_proy_admin.PROFESOR;
create or replace public synonym XX_CURSO for VAGU_proy_admin.CURSO;
create or replace public synonym XX_PROFESOR_ASIGNATURA for VAGU_proy_admin.PROFESOR_ASIGNATURA;
create or replace public synonym XX_PROFESOR_CARRERA for VAGU_proy_admin.PROFESOR_CARRERA;
create or replace public synonym XX_PROFESOR_ADMINISTRADOR for VAGU_proy_admin.PROFESOR_ADMINISTRADOR;
create or replace public synonym XX_ESPECIALIDAD for VAGU_proy_admin.ESPECIALIDAD;
create or replace public synonym XX_TESIS for VAGU_proy_admin.TESIS;
create or replace public synonym XX_TESIS_HISTORICO for VAGU_proy_admin.TESIS_HISTORICO;
create or replace public synonym XX_ESTUDIANTE for VAGU_proy_admin.ESTUDIANTE;
create or replace public synonym XX_ESTUDIANTE_INSCRITO for VAGU_proy_admin.ESTUDIANTE_INSCRITO;
create or replace public synonym XX_PLAN_ESTUDIOS_CARRERA for VAGU_proy_admin.PLAN_ESTUDIOS_CARRERA;
create or replace public synonym XX_CARRERA_ASIGNATURA for VAGU_proy_admin.CARRERA_ASIGNATURA;
create or replace public synonym XX_CURSO_HORARIO for VAGU_proy_admin.CURSO_HORARIO;
create or replace public synonym XX_CURSO_SEMESTRE for VAGU_proy_admin.CURSO_SEMESTRE;
create or replace public synonym XX_TESIS_SINODAL for VAGU_proy_admin.TESIS_SINODAL;
create or replace public synonym XX_SALARIO_PROFESOR_ASIGNATURA for VAGU_proy_admin.SALARIO_PROFESOR_ASIGNATURA;
create or replace public synonym XX_ESPECIALIDAD_PROFESOR for VAGU_proy_admin.ESPECIALIDAD;
create or replace public synonym XX_PUESTO_PROFESOR for VAGU_proy_admin.PUESTO_PROFESOR;

