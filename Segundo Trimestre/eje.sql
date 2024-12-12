use escuela;
CREATE USER 'Estudiante' identified by "estudiante123"
WITH MAX_QUERIES_PER_HOUR 100 MAX_USER_CONNECTIONS 50;

GRANT SELECT, INSERT on *.* to "Estudiante";

CREATE USER "Alumno" identified by "alumno123";

GRANT SELECT, UPDATE on escuela.* to "Alumno";

RENAME USER 'Estudiante' TO 'usuario_estudiante';

Drop user "Alumno";


CREATE USER "profesor" identified by "profesor123";

GRANT SELECT, INSERT, UPDATE on escuela.alumno to profesor;

GRANT UPDATE (nombre) ON escuela.alumno TO "profesor";

revoke update (nombre) on escuela.alumno from "profesor";

SHOW GRANTS for "profesor";

CREATE role "consulta_total";
Grant select on escuela.* to "consulta_total";

CREATE role "gestor_datos";
Grant INSERT, UPDATE, DELETE on escuela.alumno to "gestor_datos";

GRANT "consulta_total" to "usuario_estudiante";

GRANT "gestor_datos" to "profesor";

SET DEFAULT ROLE "consulta_total" to "usuario_estudiante";

CREATE USER "invitado";

GRANT SELECT on escuela.* to "invitado";
GRANT INSERT on escuela.* to "invitado";

SHOW GRANTS FOR "invitado";

CREATE USER 'supervisor' IDENTIFIED BY '12345678' WITH MAX_QUERIES_PER_HOUR 200
MAX_USER_CONNECTIONS 10 PASSWORD EXPIRE;

SHOW GRANTS FOR 'root'@'localhost';
