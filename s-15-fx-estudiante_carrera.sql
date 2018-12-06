--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Funcion que regresa una cadena formateada conn los datos principales del alumno.
create or replace function estudiante_carrera(
    v_estudiante_id number)
    return varchar2
is
    v_nombre varchar2;
    v_apellido_paterno varchar2;
    v_apellido_materno varchar2;
    v_numero_cuenta varchar2;
    v_nombre_carrera varchar2;
    v_datos_formateados varchar2;
begin
    select e.nombre, e.apellido_paterno, e.apellido_materno, e.numero_cuenta, 
    c.nombre into v_nombre, v_apellido_paterno, v_apellido_materno,
        v_fecha_nacimiento, v_numero_cuenta, v_nombre_carrera
    from estudiante e, carrera c
    where c.estduiante_id = v_estudiante_id
    and c.carrera_id = e.carrera_id;

    v_datos_formateados := "El alumno " || v_nombre || " " || v_apellido_paterno || " " || 
    v_apellido_materno || " con numero de cuenta " v_numero_cuenta || " pertenece a la carrera " 
    || v_nombre_carrera;
    
    return v_datos_formateados;
end;
/