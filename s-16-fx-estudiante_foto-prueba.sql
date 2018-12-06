--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Realiza la validacion de la funcion estudiante_foto.
set serveroutput on
begin
    select estudiante_foto(1) as foto_estudiante from dual;
end;
/