--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Funcion que regresa una cadena formateada conn los datos principales del alumno.
create or replace function estudiante_carrera_fx(
    v_estudiante_id number)
    return varchar2
is
    v_nombre estudiante.nombre%type;
    v_ap_paterno estudiante.ap_paterno%type;
    v_ap_materno estudiante.ap_materno%type;
    v_numero_cuenta estudiante.numero_cuenta%type;
    v_nombre_carrera carrera.nombre%type;
    v_datos_formateados varchar2(3000);
begin
    select e.nombre, e.ap_paterno, e.ap_materno, e.numero_cuenta, c.nombre 
        into v_nombre, v_ap_paterno, v_ap_materno, v_numero_cuenta, v_nombre_carrera
    from estudiante e, carrera c
    where e.estudiante_id = v_estudiante_id
    and c.carrera_id = e.carrera_id;

    v_datos_formateados := 'El alumno ' || v_nombre || ' ' || v_ap_paterno || ' ' || 
    v_ap_materno || ' con numero de cuenta ' || v_numero_cuenta || ' pertenece a la carrera ' 
    || v_nombre_carrera;
    
    return v_datos_formateados;
end;
/
show errors