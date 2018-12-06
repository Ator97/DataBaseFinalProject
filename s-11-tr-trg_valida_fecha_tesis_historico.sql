--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Trigger que valida que la fecha de tesis_historico sea valida
create or replace trigger trg_valida_fecha_tesis_historico
before insert on tesis_historico
for each row
begin
    if :new.FECHA_MODIFICAICON > sysdate then
        raise_application_error(-20001,'La fecha introducida es mayor que la fecha actual.');
    end if;
end;
/
show errors
--Agregar mas cosas al trigger.