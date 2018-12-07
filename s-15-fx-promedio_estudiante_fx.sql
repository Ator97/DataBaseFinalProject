--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Regresa el promedio del estudiante solicitado.
create or replace function promedio_estudiante_fx(
    v_nombre varchar2, v_ap_paterno varchar2, v_ap_materno varchar2)
    return number
is
    v_promedio number;
begin
    select avg(ei.calificacion) into v_promedio
    from estudiante e, estudiante_inscrito ei
    where ei.estudiante_id = e.estudiante_id
    and e.nombre = v_nombre
    and e.ap_paterno = v_ap_paterno
    and e.ap_materno = v_ap_materno
    group by e.estudiante_id;
    return v_promedio;
end;
/
show errors