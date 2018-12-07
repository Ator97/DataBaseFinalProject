--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Trigger que valida la calificacion de los estudiantes.
create or replace trigger trg_valida_sinodales_tesis
before insert or update of sinodal_id on tesis_sinodal
for each row
declare
    cursor cur_num_sinodales is
        select ts.tesis_id, count(*) as num_sinodales
        from tesis_sinodal ts, tesis t
        where ts.tesis_id = :new.tesis_id
        group by ts.tesis_id;
begin
    for r in cur_num_sinodales loop
        if r.num_sinodales > 5 then
            raise_application_error(-20001, 'No es posible agrear mas sinodales a esta tesis.');
        end if;
    end loop;
end;
/
show errors