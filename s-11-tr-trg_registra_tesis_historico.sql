--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Trigger que valida que la fecha de tesis_historico sea valida
create or replace trigger trg_registra_tesis_historico
after update of STATUS_TESIS_ID on tesis
for each row
declare
    v_tesis_historico number(8,0);
begin
    select TESIS_HIS_SEQ.nextval into v_tesis_historico from dual;
    insert into tesis_historico(TESIS_HISTORICO_ID, FECHA_MODIFICAICON,
        STATUS_TESIS_ID, TESIS_ID) 
    values(v_tesis_historico, sysdate, :new.status_tesis_id,:new.tesis_id);
end;
/
show errors