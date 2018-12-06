--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Regresa el promedio del estudiante solicitado.
create or replace function promedio_estudiante(
    v_estudiante_id number) 
    return number;
is
    v_promedio number;
begin
    select avg(ei.calificacion) into v_promedio
    from estudiante e, estudiante_inscrito ei
    where e.estudiante_id = v_estudiante_id
    and ei.estudiante_id = e.estudiante_id
    group by e.estudiante_id;

    return v_promedio;
end;
/