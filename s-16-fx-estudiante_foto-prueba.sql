--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Realiza la validacion de la funcion estudiante_foto.
set serveroutput on
declare
    v_foto blob default null;
begin
    v_foto := estudiante_foto_fx(1);
    if v_foto is null then
        dbms_output.put_line('Se localizo la foto del estudiante.');
    else
        dbms_output.put_line('No se lozalizo la foto del estudiante.');
    end if;
end;
/