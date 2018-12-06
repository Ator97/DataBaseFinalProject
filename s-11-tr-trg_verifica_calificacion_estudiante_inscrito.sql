--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Trigger que valida la calificacion de los estudiantes.
create or replace trigger trg_verifica_calificacion_estudiante_inscrito
before insert or update on estudiante_inscrito
for each row
begin
    if :new.CALIFICACION > 10 then
        :new.CALIFICACION := 10;
    elsif :new.CALIFICACION < 5 then
        :new.CALIFICACION := 5;
    end if;
end;
/
show errors
--Agregar mas cosas.