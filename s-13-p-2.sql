--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Revisar todas las tesis en las que un profesor de asignatura ha sido sinodal

create or replace procedure profesor_sinodal is 
 
cursor c_imparticion is  
    select p.rfc, p.nombre nombre_profesor, p.ap_paterno, 
        t.nombre nombre_tesis
    from profesor p
    join  PROFESOR_ASIGNATURA pa
    on p.profesor_id = pa.profesor_id
    join TESIS_SINODAL ts
    on pa.profesor_id = ts.sinodal_id
    join tesis t
    on ts.tesis_id = t.tesis_id
    order by p.rfc;
begin 
    for r in c_imparticion loop 
            dbms_output.put_line('El profesor:' ||r.nombre_profesor|| ' ' ||r.ap_paterno|| ' ha sido sinodal en : ' || r.nombre_tesis); 
    end loop; 
end;
/

