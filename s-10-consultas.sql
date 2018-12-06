--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Scrip que realiza 3 querys a la base.

--Consulta 1
--Determinar el numero de cursos que imparte cada profesor
--agruparlos por profesor

select c.profesor_id, count(c.curso_id) as numero_profesores
from curso c, profesor p
where c.profesor_id = p.profesor_id
group by p.profesor_id
order by p.profesor_id asc;

-- Consulta 2
-- Determinar los datos del director de tesis de la primer tesis registrada en
-- la base de datos.
select p.*
from profesor p, profesor_carrera pc, tesis t
where pc.profesor_id = p.profesor_id
and t.director_tesis_id = pc.profesor_id
and t.fecha_registro = (select min(t.fecha_registro)
                        from tesis t
                        where t.director_tesis_id = pc.profesor_id);

-- Consulta 3
-- Determinar todos lo profesores que han impartido cursos
-- en el anio 2018, menos la profesora MARIA RODRIGEZ JUAREZ.
select p.nombre, p.ap_paterno, p.ap_materno, p.rfc, count(c.curso_id) as cursos_impartidos
from profesor p, curso c, curso_semestre sc, semestre s
where c.profesor_id = p.profesor_id
and sc.curso_id = c.curso_id
and sc.semestre_id = s.semestre_id
and s.anio = 2018
group by p.nombre, p.ap_paterno, p.ap_materno, p.rfc
minus
select p.nombre, p.ap_paterno, p.ap_materno, p.rfc, count(c.curso_id) as cursos_impartidos
from profesor p, curso c, curso_semestre sc, semestre s
where c.profesor_id = p.profesor_id
and sc.curso_id = c.curso_id
and sc.semestre_id = s.semestre_id
and s.anio = 2018
and p.nombre = 'MARIA'
and p.ap_paterno = 'RODRIGUEZ'
and p.ap_materno = 'JUAREZ'
group by p.nombre, p.ap_paterno, p.ap_materno, p.rfc;

--Consulta 4
select napc.*
from NUM_ALUMNOS_POR_CURSO napc
where napc.curso_id = (select max(num_alumnos)
                        from NUM_ALUMNOS_POR_CURSO);