--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creacion y asignacion de usuarios


--Creamos usuario administrdor


--Creamos el usuario VAGU_proy_admin
CREATE USER VAGU_proy_admin IDENTIFIED BY VAGUpa
DEFAULT  TABLESPACE USERS
quota 1024m on users;

GRANT CREATE SESSION TO VAGU_proy_admin;

--Creamos el rol administador con los perminos necesarios para administrar
CREATE ROLE VAGU_proy_admin_rol;

-- Asignamos al rol permisos
GRANT 	
	CREATE TABLE
	,CREATE VIEW
	,CREATE SYNONYM
	,CREATE SEQUENCE
	,CREATE TRIGGER
	,CREATE PROCEDURE
TO VAGU_proy_admin_rol;

GRANT VAGU_proy_admin_rol TO VAGU_proy_admin

--Creamos al usuario invitado 

--Creamos el usuario VAGU_proy_invitado
CREATE USER VAGU_proy_invitado IDENTIFIED BY VAGUpi
DEFAULT  TABLESPACE USERS
quota 1024m on users;

GRANT CREATE SESSION TO VAGU_proy_invitado;
