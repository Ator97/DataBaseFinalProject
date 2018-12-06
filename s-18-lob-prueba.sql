--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     <breve descripción del contenido y propósito del archivo>
Prompt copiando imagenes
!rm -rf /tmp/bd
!mkdir -p /tmp/bd
!chmod 777 /tmp/bd
!cp imagenes/img-* /tmp/bd
!chmod 755 /tmp/bd/img-*

Prompt invocando procedimiento
exec p_actualiza_imagen
commit;

Prompt Mostrando resultados
col nombre_archivo format a30
select libro_id,nombre_archivo,dbms_lob.getlength(imagen) as longitud_imagen
from libro_imagen;

Prompt Listo!