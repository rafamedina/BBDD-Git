DROP database tema5;

Create database IF NOT EXISTS tema5;

use tema5;

CREATE TABLE IF NOT EXISTS tabla1(
DNI CHAR(9) PRIMARY KEY ,
Nombre VARCHAR(50)
) ENGINE = InnoDB; #especificamos el motor

#ALTER TABLE tabla1 engine = InnoDB; #CAMBIO DE MOTOR (POSIBLE PREGUNTA)
#ALTER TABLE tabla1 engine = MyISAM;

CREATE TABLE IF NOT EXISTS Tabla2(
idtabla1 int primary key,
fk_tabla2 char(9)
) engine = InnoDB;

show table status like 'tabla1'; #PONER EL NOMBRE DE LA TABLA CON COMILLAS
show table status like 'tabla2'; #PONER EL NOMBRE DE LA TABLA CON COMILLAS

ALTER TABLE tabla2 add constraint FK_tabla1_tabla2 foreign key(fk_tabla2) references tabla1(DNI);
desc tabla2;

