--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Trigger que valida la calificacion de los estudiantes.
create or replace trigger trg_verifica_calificacion_estudiante_inscrito
before insert or update calificacion on estudiante_inscrito
for each row
begin
    if :new.calificacion > 10 then
        :new calificacion := 10;
    elsif :new.calificacion < 5 then
        :new.calificacion := 5;
    end if;
end;
--Agregar mas cosas.