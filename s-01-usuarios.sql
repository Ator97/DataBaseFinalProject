--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creacion y asignacion de usuarios


--Creamos usuario administrdor


--Creamos el usuario VAGU_proy_admin
CREATE USER VAGU_proy_admin IDENTIFIED BY VAGUpa
DEFAULT TABLESPACE USERS
quota unlimited on users;

--Creamos el rol administador con los perminos necesarios para administrar
CREATE ROLE rol_admin;

-- Asignamos al rol permisos
GRANT 
	CREATE SESSION	
	,CREATE TABLE
	,CREATE VIEW
	,CREATE SYNONYM
	,CREATE SEQUENCE
	,CREATE TRIGGER
	,CREATE PROCEDURE
TO rol_admin;

GRANT rol_admin TO VAGU_proy_admin

--Creamos al usuario invitado 

--Creamos el usuario VAGU_proy_invitado
CREATE USER VAGU_proy_invitado IDENTIFIED BY VAGUpi
DEFAULT  TABLESPACE USERS
quota 0m on users;

--Creamos el rol invitado
CREATE ROLE rol_invitado;

-- Asignamos al rol permisos
GRANT 
	CREATE SESSION
TO rol_invitado;

GRANT rol_invitado TO VAGU_proy_invitado;