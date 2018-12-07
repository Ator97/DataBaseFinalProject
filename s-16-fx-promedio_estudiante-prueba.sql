--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Valida el correcto funcionamiento de la funcion promedio_estudiante
set serveroutput on
begin
    dbms_output.put_line(promedio_estudiante_fx('CARIN','SCORTON','LEWTON'));
end;
/