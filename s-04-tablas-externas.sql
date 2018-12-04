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

