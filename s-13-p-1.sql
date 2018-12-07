--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Revisamos cuantas veces un profesor ha impartid una clase

create or replace procedure p_imparticiones ( 
p_rfc in varchar2) is 
 
v_tipo_profesor varchar2(50) := 'profesor'; 
cursor c_imparticion is  
    select p.rfc,p.nombre,p.ap_paterno,p.tipo_profesor, 
        a.nombre nombre_asignatura, count(*) num_veces_impartidas 
    from profesor p 
    join curso c 
    on c.profesor_id = p.profesor_id 
    join asignatura a 
    on a.asignatura_id = c.asignatura_id 
    where rfc = p_rfc 
    group by p.rfc,p.nombre,p.ap_paterno,p.ap_materno,p.tipo_profesor, 
        a.clave,a.nombre; 
begin 
    for r in c_imparticion loop
        case v_tipo_profesor
            when 'D' then
                v_tipo_profesor := 'administrador'; 
            when 'C' then
                v_tipo_profesor := 'profesor de carrerra';
            when 'A' then
                v_tipo_profesor := 'profesor de asignatura';
        end case;
            dbms_output.put_line('El ' ||v_tipo_profesor || ':' ||r.nombre|| ' ' ||r.ap_paterno|| ' ha impartido ' || r.nombre_asignatura || 'n. veces: ' || r.num_veces_impartidas); 
    end loop; 
end; 
/

