--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Ejecutor de la base completa

--Eliminamos usuarios en caso de existir.
declare
 v_count number(1,0);
begin
	select count(*) into v_count
	from dba_users
	where username = 'VAGU_PROY_ADMIN'; 

	if v_count > 0 then
			dbms_output.put_line('Eliminando usuario existente');
			execute immediate 'drop user VAGU_proy_admin cascade';
	else
			dbms_output.put_line('El usuario VAGU_proy_admin no existe');

	end if;

	select count(*) into v_count
	from dba_users
	where username = 'VAGU_PROY_INVITADO'; 

	if v_count > 0 then
			dbms_output.put_line('Eliminando usuario existente');
			execute immediate 'drop user VAGU_proy_invitado cascade';
	else
			dbms_output.put_line('El usuario VAGU_proy_invitado no existe');

	end if;

end;
/

--Creamos ls usuarios.
@./s-01-usuarios.sql
Prompt Conectandose como VAGU_PROY_ADMIN
connect  VAGU_proy_admin;


@./s-02-entidades.sql
@./s-03-tablas-temporales.sql
@./s-04-tablas-externas.sql
@./s-05-secuencias.sql
@./s-06-indices.sql
@./s-07-sinonimos.sql
@./s-08-vistas.sql
@./s-09-carga-inicial.sql
--@./s-10-consultas.sql
--@./s-11-tr-compund.sql
--@./s-11-tr-rl_1.sql
--@./s-11-tr-rl_2.sql
--@./s-12-tr-compund-prueba.sql
--@./s-12-tr-rl_1-prueba.sql
--@./s-12-tr-rl_2-prueba.sql
--@./s-13-p-1.sql
--@./s-13-p-2.sql
--@./s-14-p-1-prueba.sql
--@./s-14-p-2-prueba.sql
--@./s-15-fx-1.sql
--@./s-15-fx-2.sql
--@./s-15-fx-3.sql
--@./s-16-fx-1-prueba.sql
--@./s-16-fx-2-prueba.sql
--@./s-16-fx-3-prueba.sql
--@./s-17-lob.sql
--@./s-18-lob-prueba.sql
