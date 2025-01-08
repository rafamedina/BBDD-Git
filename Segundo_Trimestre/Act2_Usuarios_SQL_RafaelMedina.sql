use escuela;
-- Crear un usuario llamado 'Estudiante' con una contraseña y limitaciones.
CREATE USER 'Estudiante' IDENTIFIED BY "estudiante123" 
WITH MAX_QUERIES_PER_HOUR 100 MAX_USER_CONNECTIONS 50;
-- Este comando crea al usuario 'Estudiante', le asigna una contraseña
-- y limita sus consultas a 100 por hora y sus conexiones simultáneas a 50.

-- Otorgar permisos de SELECT e INSERT al usuario 'Estudiante' en todas las bases de datos y tablas.
GRANT SELECT, INSERT ON *.* TO "Estudiante";
-- Este comando permite a 'Estudiante' leer (SELECT) y agregar datos (INSERT)
-- en cualquier base de datos y tabla del servidor.

-- Crear un usuario llamado 'Alumno' con una contraseña.
CREATE USER "Alumno" IDENTIFIED BY "alumno123";
-- Este comando crea al usuario 'Alumno' con la contraseña indicada.

-- Otorgar permisos de SELECT y UPDATE al usuario 'Alumno' en todas las tablas de la base de datos 'escuela'.
GRANT SELECT, UPDATE ON escuela.* TO "Alumno";
-- Este comando permite a 'Alumno' leer datos (SELECT) y modificarlos (UPDATE) 
-- en cualquier tabla dentro de la base de datos 'escuela'.

-- Cambiar el nombre del usuario 'Estudiante' a 'usuario_estudiante'.
RENAME USER 'Estudiante' TO 'usuario_estudiante';
-- Este comando cambia el nombre del usuario para que sea más descriptivo.

-- Eliminar el usuario 'Alumno' del sistema.
DROP USER "Alumno";
-- Este comando borra al usuario 'Alumno' y elimina todos sus permisos.

-- Crear un usuario llamado 'profesor' con una contraseña.
CREATE USER "profesor" IDENTIFIED BY "profesor123";
-- Este comando crea un usuario llamado 'profesor' con la contraseña indicada.

-- Otorgar permisos de SELECT, INSERT y UPDATE al usuario 'profesor' en la tabla 'alumno' de la base de datos 'escuela'.
GRANT SELECT, INSERT, UPDATE ON escuela.alumno TO profesor;
-- Este comando permite a 'profesor' leer, insertar y actualizar datos en la tabla 'alumno'.

-- Otorgar permisos específicos de UPDATE solo sobre la columna 'nombre' en la tabla 'alumno'.
GRANT UPDATE (nombre) ON escuela.alumno TO "profesor";
-- Este comando permite a 'profesor' modificar únicamente la columna 'nombre' en la tabla 'alumno'.

-- Revocar los permisos de UPDATE en la columna 'nombre' de la tabla 'alumno'.
REVOKE UPDATE (nombre) ON escuela.alumno FROM "profesor";
-- Este comando quita al usuario 'profesor' el permiso para modificar la columna 'nombre'.

-- Mostrar los permisos asignados al usuario 'profesor'.
SHOW GRANTS FOR "profesor";
-- Este comando muestra todos los permisos que actualmente tiene el usuario 'profesor'.

-- Crear un rol llamado 'consulta_total'.
CREATE ROLE "consulta_total";
-- Los roles agrupan permisos para que sean más fáciles de gestionar.

-- Dar permisos de SELECT al rol 'consulta_total' en todas las tablas de la base de datos 'escuela'.
GRANT SELECT ON escuela.* TO "consulta_total";
-- Este comando asigna al rol 'consulta_total' la capacidad de leer datos de todas las tablas de 'escuela'.

-- Crear un rol llamado 'gestor_datos'.
CREATE ROLE "gestor_datos";
-- Este comando crea un rol que se usará para gestionar datos.

-- Dar permisos de INSERT, UPDATE y DELETE al rol 'gestor_datos' en la tabla 'alumno'.
GRANT INSERT, UPDATE, DELETE ON escuela.alumno TO "gestor_datos";
-- Este comando permite que los usuarios con este rol puedan gestionar (agregar, modificar, eliminar)
-- los datos de la tabla 'alumno'.

-- Asignar el rol 'consulta_total' al usuario 'usuario_estudiante'.
GRANT "consulta_total" TO "usuario_estudiante";
-- Esto le da al usuario los permisos definidos en el rol 'consulta_total'.

-- Asignar el rol 'gestor_datos' al usuario 'profesor'.
GRANT "gestor_datos" TO "profesor";
-- Esto le da al usuario 'profesor' los permisos definidos en el rol 'gestor_datos'.

-- Establecer el rol por defecto 'consulta_total' para 'usuario_estudiante'.
SET DEFAULT ROLE "consulta_total" TO "usuario_estudiante";
-- Este comando define que los permisos de 'consulta_total' se activarán automáticamente 
-- cada vez que 'usuario_estudiante' inicie sesión.

-- Crear un usuario llamado 'invitado'.
CREATE USER "invitado";
-- Este comando crea un usuario sin contraseña para casos temporales o de menor acceso.

-- Dar permisos de SELECT al usuario 'invitado' en todas las tablas de la base de datos 'escuela'.
GRANT SELECT ON escuela.* TO "invitado";
-- Esto permite al usuario 'invitado' solo leer datos en 'escuela'.

-- Dar permisos de INSERT al usuario 'invitado' en todas las tablas de la base de datos 'escuela'.
GRANT INSERT ON escuela.* TO "invitado";
-- Esto permite al usuario 'invitado' agregar datos en las tablas de 'escuela'.

-- Mostrar los permisos asignados al usuario 'invitado'.
SHOW GRANTS FOR "invitado";
-- Este comando muestra los permisos actuales de 'invitado'.

-- Crear un usuario llamado 'supervisor' con una contraseña y restricciones.
CREATE USER 'supervisor' IDENTIFIED BY '12345678' 
WITH MAX_QUERIES_PER_HOUR 200 MAX_USER_CONNECTIONS 10 PASSWORD EXPIRE;
-- Este comando crea un usuario 'supervisor' con límites de consultas, conexiones simultáneas
-- y fuerza el cambio de contraseña en el primer inicio de sesión.

-- Mostrar los permisos asignados al usuario 'root' en localhost.
SHOW GRANTS FOR 'root'@'localhost';
-- Esto muestra los privilegios asignados al usuario administrador 'root'.

-- Consultar permisos globales desde la tabla 'mysql.user'.
SELECT User, Host, Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv, Drop_priv 
FROM mysql.user;
-- Este comando muestra los permisos globales básicos asignados a todos los usuarios.

-- Consultar permisos por base de datos desde la tabla 'mysql.db'.
SELECT User, Host, Db, Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv, Drop_priv, Grant_priv 
FROM mysql.db;
-- Este comando muestra los permisos específicos asignados por base de datos.

-- Consultar permisos por tabla desde la tabla 'mysql.tables_priv'.
SELECT User, Host, Db, Table_name, Table_priv, Column_priv 
FROM mysql.tables_priv;
-- Este comando muestra los permisos asignados por tabla.

-- Consultar permisos por columna desde la tabla 'mysql.columns_priv'.
SELECT User, Host, Db, Table_name, Column_name, Column_priv 
FROM mysql.columns_priv;
-- Este comando muestra los permisos específicos asignados por columna.

