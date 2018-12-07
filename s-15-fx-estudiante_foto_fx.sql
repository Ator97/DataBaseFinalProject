--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Realiza la busqueda y regresa la foto asociada a un estudiante.
create or replace function estudiante_foto_fx(
    v_estudiante_id number)
    return blob
is
    v_estudiante_fotografia blob;
begin
    select e.fotografia into v_estudiante_fotografia
    from estudiante e
    where e.estudiante_id = v_estudiante_id;
    
    return v_estudiante_fotografia;
end;
/
show errors