--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Valida el correcto funcionamiento de la funcion estudiante_carrera
begin
    select estudiante_carrera(1) as datos_alumno from dual;
end;
/