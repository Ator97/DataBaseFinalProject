--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Ejemplo de tabla externa, cargamos dos catalogos.

connect sys as sysdba


prompt creando el directorio /tmp/bases en caso de no existir
!mkdir -p /tmp/bases

prompt copiando el archivo csv a /tmp/proy_bases
!cp empleado_ext.csv /tmp/proy_bases
prompt cambiando permisos
!chmod 777 /tmp/proy_bases

create or replace directory tmp_dir as '/tmp/proy_bases';
grant read, write on directory tmp_dir to VAGU_proy_admin;
grant read on directory tmp_dir to VAGU_proy_invitado;


--
--ANTIGÜAMENTE SE POSEÍA UN SISTEMA QUE MANTENIA UN ARCHIVO
--DE TEXTO QUE CONTENÍA EL SALARIO DE TODOS LOS PROFESORES DE
--ASIGNATURA, LA ADMINISTRACION, HA OPTADO DE MOMENTO MANTENER ESTE
--ARCHIVO DE FORMA EXTERNA
--



CREATE TABLE SALARIO_PROFESOR_ASIGNATURA( --CATALOGO DE SALARIOS
  PROFESOR_ASIGNATURA_ID  NUMBER(6,0)  NOT NULL,
  SALARIO_MENSUAL         NUMBER(7,2)  NOT NULL,
)
organization external (
--En oracle existen 2 tipos de drivers para parsear el archivo: -- oracle_loader y oracle_datapump
type oracle_loader
default directory tmp_dir
    access parameters (
        records delimited by newline
        badfile tmp_dir:'salario_profesor_asignatura.log'
        logfile tmp_dir:'salario_profesor_asignatura.log'
        fields terminated by ','
        lrtrim
        missing field values are null
        (
        DIA_SEMANA_ID,DESCRIPCION
        )
)
    location ('salario_profesor_asignatura.csv')
)
reject limit unlimited;
;