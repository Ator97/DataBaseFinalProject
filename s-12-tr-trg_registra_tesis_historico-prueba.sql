--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     validador del trg_registra_tesis_historico 
begin
    update tesis set status_tesis_id = 2;
end;
/
show errors