--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Valida el funcionamiento de trg_valida_sinodales_tesis
begin
    INSERT INTO TESIS_SINODAL (TESIS_SINODAL_ID,TESIS_ID,SINODAL_ID) VALUES (TESIS_SINODAL_SEQ.NEXTVAL,1,5);
end;
/
show errors