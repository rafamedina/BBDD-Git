CREATE DATABASE actividad_rma;
use actividad_rma;

CREATE TABLE EMPLEADO_RMA(
DNI char(9) Primary key,
nombre VARCHAR(50),
apellido VARCHAR(50)
);

CREATE INDEX idx_nombre on EMPLEADO_RMA(nombre);
CREATE INDEX idx_apellido on EMPLEADO_RMA(apellido);

INSERT INTO EMPLEADO_RMA (DNI, nombre, apellido) VALUES
('123456789', 'Juan', 'Pérez'),
('987654321', 'Ana', 'Gómez'),
('456789123', 'Luis', 'Martínez'),
('789123456', 'Marta', 'López'),
('321654987', 'Carlos', 'Fernández'),
('654987321', 'Lucía', 'Hernández'),
('159753486', 'Elena', 'Sánchez'),
('753486159', 'Pablo', 'Ramírez'),
('258369147', 'Sara', 'Ortiz'),
('369147258', 'David', 'Morales');

SELECT * FROM EMPLEADO_RMA;

EXPLAIN SELECT * 
FROM EMPLEADO_RMA 
WHERE nombre = 'Juan';


EXPLAIN SELECT * FROM EMPLEADO_RMA WHERE nombre = 'Juan' AND apellido = 'Pérez';

SELECT * FROM EMPLEADO_RMA WHERE DNI = '987654321';

SHOW INDEX FROM EMPLEADO_RMA;

DROP INDEX idx_nombre on EMPLEADO_RMA;
DROP INDEX idx_apellido on EMPLEADO_RMA;

ANALYZE TABLE EMPLEADO_RMA;

OPTIMIZE TABLE EMPLEADO_RMA;

SET PROFILING = 1;
EXPLAIN SELECT * FROM EMPLEADO_RMA WHERE nombre = 'Juan' AND apellido = 'Pérez';



SHOW PROFILES;

CHECK TABLE EMPLEADO_RMA;

