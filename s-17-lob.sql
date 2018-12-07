--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     <breve descripción del contenido y propósito del archivo>
prompt Actualizando imagen de estudiante
prompt conectando como sys
connect sys as sysdba
prompt creando objeto DATA_DIR
create or replace directory data_dir as '/tmp/bd';
grant read,write on directory data_dir to VAGU_proy_admin;

Prompt conectando como usuario VAGU_proy_admin
connect VAGU_proy_admin

Prompt creando procedimiento para actualizar imagenes.
set serveroutput on
create or replace procedure p_actualiza_imagen is
    v_bfile bfile;
    v_src_offset number := 1;
    v_dest_offset number := 1;
    v_dest_blob blob;
    v_src_length number;
    v_dest_length number;
    v_nombre_archivo varchar2(1000);
    cursor cur_estudiante_foto is
        select numero_cuenta ,fotografia
        from estudiante;
begin
    for r in cur_estudiante_foto loop
        v_src_offset := 1;
        v_dest_offset := 1;
        dbms_output.put_line('Cargando imagen para '||r.numero_cuenta);
        v_nombre_archivo := 'img-'||r.numero_cuenta||'.jpg';
        v_bfile := bfilename('DATA_DIR', v_nombre_archivo);

        if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 then dbms_lob.open(
            v_bfile, dbms_lob.lob_readonly);
        else raise_application_error(-20001, 'El archivo '
            ||v_nombre_archivo
            ||' no existe en el directorio DATA_DIR'
            ||' o el archivo esta abierto');
        end if;

        select fotografia into v_dest_blob
        from estudiante
        where numero_cuenta = r.numero_cuenta
        for update;

        dbms_lob.loadblobfromfile(
            dest_lob => v_dest_blob,
            src_bfile => v_bfile,
            amount => dbms_lob.getlength(v_bfile),
            dest_offset => v_dest_offset,
            src_offset => v_src_offset);
        dbms_lob.close(v_bfile);
        v_src_length := dbms_lob.getlength(v_bfile);
        v_dest_length := dbms_lob.getlength(v_dest_blob);

        if v_src_length = v_dest_length then
            dbms_output.put_line('Escritura correcta, bytes escritos: '
                || v_src_length);
        else raise_application_error(-20002, 'Error al escribir datos.\n'
            || ' Se esperaba escribir '
            || v_src_length
            || ' Pero solo se escribio '
            || v_dest_length);
        end if;
    end loop;
end;
/
show errors