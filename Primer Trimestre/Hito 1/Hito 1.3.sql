Create database if not exists prueba;
use prueba; 

CREATE TABLE if not exists BANDAS(
IDBANDA INT AUTO_INCREMENT,
NOMBRE VARCHAR(15),
PRIMARY KEY (IDBANDA, NOMBRE),
PROVINCIA VARCHAR(15),
CONSTRAINT IDBANDA_UNICO UNIQUE (IDBANDA),
CONSTRAINT NOMBRE_UNICO UNIQUE (NOMBRE)
);

-- DROP TABLE MIEMBROS;

CREATE TABLE MIEMBROS(
JEFE VARCHAR(15) NULL,
NOMBRE_M VARCHAR(15),
NOMBRE_B VARCHAR(15),
APELLIDO_M VARCHAR(15),
DNI VARCHAR(15) PRIMARY KEY,
IDBANDA INT,
constraint fk_bandas FOREIGN KEY (IDBANDA,NOMBRE_B) REFERENCES BANDAS(IDBANDA,NOMBRE) ON DELETE CASCADE
);

create table if not exists DELITOS_COMETIDOS(
	IdDelito int auto_increment Primary Key,
	tipo_delito varchar(70) Not null,
	fecha_delito datetime Not null, /*datetime es para fechas*/
    cp varchar(5)
    );
INSERT INTO BANDAS (Nombre, provincia)
VALUES ('LOS CHANGOS','BARCELONA');    
    
INSERT INTO MIEMBROS (JEFE, NOMBRE_M, NOMBRE_B, APELLIDO_M, DNI)
VALUES 
('Carlos', 'Juan', 'LOS CHANGOS', 'Pérez', '12345678A');


INSERT INTO DELITOS_COMETIDOS (tipo_delito, fecha_delito, cp)
VALUES 
('Robo a mano armada', '2023-08-14 15:30:00', 28905),
('Tráfico de drogas', '2023-09-05 20:00:00', 29084);


INSERT INTO BANDAS (Nombre, provincia) VALUES ('LOS JOVENES','MADRID');
INSERT INTO BANDAS (Nombre, provincia) VALUES ('LOS JOVENES','MADRID');
select * from BANDAS;
select * from delitos_cometidos;
select * from miembros;
-- meter cp en delitos y enlazar mediante select
