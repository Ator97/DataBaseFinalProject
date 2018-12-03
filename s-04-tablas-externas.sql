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


CREATE TABLE DIA_SEMANA( --CATALOGO DIAS DE LA SEMANA
  DIA_SEMANA_ID NUMBER(1)     NOT NULL,
  DESCRIPCION   VARCHAR2(10)  NOT NULL,
  CONSTRAINT PK_DIA_SEMANA PRIMARY KEY (DIA_SEMANA_ID),
  CONSTRAINT CHK_DIA_SEMANA_ID
  CHECK (DIA_SEMANA_ID BETWEEN 1 AND 6) --LUNES A SÁBADO
)
organization external (
--En oracle existen 2 tipos de drivers para parsear el archivo: -- oracle_loader y oracle_datapump
type oracle_loader
default directory tmp_dir
    access parameters (
        records delimited by newline
        badfile tmp_dir:'dia_semana_bad.log'
        logfile tmp_dir:'dia_semana_suc.log'
        fields terminated by ','
        lrtrim
        missing field values are null
        (
        DIA_SEMANA_ID,DESCRIPCION
        )
)
    location ('dia_semana_ext.csv')
)
reject limit unlimited;
;

CREATE TABLE STATUS_TESIS(  --CATALOGO DE ESTATUS DE TESIS
  -- REGISTRADA,VALIDADA, CONCLUIDA CANCELADA,CON_CEDULA
  STATUS_TESIS_ID NUMBER(1,0)   NOT NULL,
  CLAVE           VARCHAR2(11)  NOT NULL,
  DESCRIPCION     VARCHAR2(55)  NOT NULL,
  CONSTRAINT PK_STATUS_TESIS PRIMARY KEY (STATUS_TESIS_ID)
)
organization external (
--En oracle existen 2 tipos de drivers para parsear el archivo: -- oracle_loader y oracle_datapump
type oracle_loader
default directory tmp_dir
    access parameters (
        records delimited by newline
        badfile tmp_dir:'status_tesis_bad.log'
        logfile tmp_dir:'status_tesis_suc.log'
        fields terminated by ','
        lrtrim
        missing field values are null
        (
       	STATUS_TESIS_ID,CLAVE,DESCRIPCION
        )
)
    location ('status_tesis_ext.csv')
)
reject limit unlimited;
;


