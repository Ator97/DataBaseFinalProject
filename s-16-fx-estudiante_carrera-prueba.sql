--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Valida el correcto funcionamiento de la funcion estudiante_carrera
set serveroutput on
begin
    dbms_output.put_line(estudiante_carrera_fx(1));
end;
/
show errors