CREATE DATABASE actividad_rma;
use actividad_rma;

CREATE TABLE EMPLEADO_RMA(
DNI char(9) Primary key,
nombre VARCHAR(50),
apellido VARCHAR(50)
);


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



