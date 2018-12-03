--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creación de sinónimos.

grant select on VAGU_proy_admin.ESTUDIANTE to VAGU_proy_invitado;
grant select on VAGU_proy_admin.ESTUDIANTE_INSCRITO to VAGU_proy_invitado;
grant select on VAGU_proy_admin.PROFESOR to VAGU_proy_invitado;
grant select on VAGU_proy_admin.PROFESOR_ASIGNATURA to VAGU_proy_invitado;
grant select on VAGU_proy_admin.PROFESOR_CARRERA to VAGU_proy_invitado;
grant select on VAGU_proy_admin.PROFESOR_ADMINISTRADOR to VAGU_proy_invitado;


create or replace synonym estudiante for VAGU_proy_admin.ESTUDIANTE;
create or replace synonym ESTUDIANTE_INSCRITO for VAGU_proy_admin.ESTUDIANTE_INSCRITO;
create or replace synonym PROFESOR for VAGU_proy_admin.PROFESOR;
create or replace synonym PROFESOR_ASIGNATURA for VAGU_proy_admin.PROFESOR_ASIGNATURA;
create or replace synonym PROFESOR_CARRERA for VAGU_proy_admin.PROFESOR_CARRERA;
create or replace synonym PROFESOR_ADMINISTRADOR for VAGU_proy_admin.PROFESOR_ADMINISTRADOR;


declare
cursor cur_table_name is
    SELECT table_name
    FROM user_tables;
begin
    for r in cur_table_name loop
        execute immediate 'create or replace synonym XX_' || r || ' for ' || 'r';
    end loop;
end;
/


