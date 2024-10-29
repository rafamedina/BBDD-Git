create database if not exists delincuentesesp; /*creamos la tabla*/
use delincuentesesp; /*seleccionamos la Base de datos delincuentes para trabajar con ella*/
create table if not exists BANDAS(
	IdBanda int auto_increment Primary key, /*creamos la primary key con un autoincrement para que vaya sumando segun se vayan incluyendo*/
	ciudad varchar(30)  Not null, /* varchar es para decir la cantidad de valores que se pueden escribir, es decir ciudad varchar(30) quiere decir que pueden escribir hasta 30 caracteres seguidos*/
	Nombre varchar(30) Not null,
	Codigo_postal varchar(6) Not null); /*creamos los distintos atributos de la tabla "Bandas", especificando el varchar y que sea not null*/

create table if not exists MIEMBROS(
	DNI varchar(9) primary key not null,
	Nombre varchar(30) Not null,
	Apellido varchar(30) Not null,
	IdBanda int,
	Jefe varchar(30),
	foreign key (IdBanda) references BANDAS(IdBanda) on delete cascade); /*especificamos que la foreign key idBanda es la misma que la idBanda de "BANDAS"*/

create table if not exists DELITOS_COMETIDOS(
	IdDelito int auto_increment Primary Key,
	tipo_delito varchar(70) Not null,
	fecha_delito datetime Not null); /*datetime es para fechas*/

create table if not exists VICTIMAS(
	DNI varchar(9) primary key not null,
	Nombre varchar(30) Not null,
	Apellido varchar(30) Not null,
	Edad varchar(3) Not null,
	Sexo varchar(6) Not null,
	Direccion varchar(50) Not null);

CREATE TABLE IF NOT EXISTS COMETER (
	DNI VARCHAR(9) NOT NULL, 
	IdDelito INT NOT NULL,  
	Primary key (DNI, IdDelito),  /*especificamos las Primary Keys, lo he hecho en otra linea porque tiene 2*/
	foreign key (DNI) references MIEMBROS(DNI) on delete cascade, /*especificamos que la foreign key DNI es la misma que la DNI de "MIEMBROS"*/
	foreign key (IdDelito) references DELITOS_COMETIDOS(IdDelito) on delete cascade /*especificamos que la foreign key IdDelito es la misma que la IdDelito de "DELITOS_COMETIDOS"*/
);

CREATE TABLE IF NOT EXISTS AFECTAR (
	DNI VARCHAR(9) NOT NULL,
	IdDelito INT NOT NULL,
	Primary key (DNI, IdDelito), /*especificamos las Primary Keys, lo he hecho en otra linea porque tiene 2*/
	foreign key (DNI) references VICTIMAS(DNI) on delete cascade, /*especificamos que la foreign key DNI es la misma que la DNI de "VICTIMAS"*/
	foreign key (IdDelito) references DELITOS_COMETIDOS(IdDelito) on delete cascade /*especificamos que la foreign key IdDelito es la misma que la IdDelito de "DELITOS_COMETIDOS"*/
);

INSERT INTO BANDAS (ciudad, Nombre, Codigo_postal)
VALUES 
('Madrid', 'Los Chunguitos', '28001'),
('Barcelona', 'Los Jovenes', '08002');

INSERT ignore INTO MIEMBROS (DNI, Nombre, Apellido, IdBanda, Jefe)
VALUES 
('12345678A', 'Carlos', 'García', 1, 'Jefe'),
('87654321B', 'María', 'López', 1, 'Miembro'),
('45612378C', 'Pedro', 'Fernández', 2, 'Jefe'),
('32165498D', 'Ana', 'Martínez', 2, 'Miembro');

INSERT INTO DELITOS_COMETIDOS (tipo_delito, fecha_delito)
VALUES 
('Robo a mano armada', '2023-08-14 15:30:00'),
('Tráfico de drogas', '2023-09-05 20:00:00');

INSERT ignore INTO VICTIMAS (DNI, Nombre, Apellido, Edad, Sexo, Direccion)
VALUES 
('11223344X', 'Juan', 'Pérez', '30', 'Hombre', 'Arte herreriano 8, Getafe'),
('55667788Y', 'Laura', 'Sánchez', '25', 'Mujer', 'Mario Vargas Llosa 32, Parla');

INSERT ignore INTO COMETER (DNI, IdDelito)
VALUES 
('12345678A', 1),  
('45612378C', 2);

INSERT ignore INTO AFECTAR (DNI, IdDelito)
VALUES 
('11223344X', 1), 
('55667788Y', 2);

Select * from BANDAS; -- Mostrar la tabla Bandas
Select Nombre from Miembros; -- seleccionar los nombres de la tabla MIEMBROS
Select B.IdBanda,B.ciudad,B.Nombre AS NombreBanda,B.Codigo_postal,M.DNI,M.Nombre AS NombreMiembro,M.Apellido,M.Jefe FROM BANDAS B JOIN MIEMBROS M ON B.IdBanda = M.IdBanda;
Select IdDelito, Tipo_delito, Fecha_delito FROM DELITOS_COMETIDOS WHERE Fecha_delito; -- Delitos cometidos con sus fechas
Select Nombre, Ciudad FROM BANDAS ORDER BY Ciudad, Nombre; -- obtener las bandas y su ciudad
SELECT B.IdBanda, B.Nombre AS NombreBanda, M.DNI, M.Nombre AS NombreMiembro FROM BANDAS B JOIN MIEMBROS M ON B.IdBanda = M.IdBanda; -- utilizamos join para enlazar el id de la banda con 
