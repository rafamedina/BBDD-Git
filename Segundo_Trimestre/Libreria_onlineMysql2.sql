-- Creación de la base de datos
CREATE DATABASE libreria_online;

-- Conexión a la base de datos
USE libreria_online;

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    direccion TEXT
);

-- Tabla autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla libros
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

-- Tabla libro_autor
CREATE TABLE libro_autor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    CONSTRAINT fk_libro FOREIGN KEY (id_libro) REFERENCES libros(id_libro) ON DELETE CASCADE,
    CONSTRAINT fk_autor FOREIGN KEY (id_autor) REFERENCES autores(id_autor) ON DELETE CASCADE
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE SET NULL
);

-- Tabla detalles_pedidos
CREATE TABLE detalles_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_libro INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    CONSTRAINT fk_libro_detalle FOREIGN KEY (id_libro) REFERENCES libros(id_libro) ON DELETE CASCADE
);

-- Inserción de datos
-- Tabla clientes
INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Juan Perez', 'juan.perez@email.com', '123456789', 'Calle Falsa 123'),
('Maria Garcia', 'maria.garcia@email.com', '987654321', 'Avenida Siempreviva 456');

-- Tabla categorias
INSERT INTO categorias (nombre) VALUES
('Ficción'),
('No-Ficción'),
('Educación'),
('Ciencia');

-- Tabla autores
INSERT INTO autores (nombre) VALUES
('Gabriel García Márquez'),
('Isaac Asimov'),
('J.K. Rowling'),
('Carl Sagan');

-- Tabla libros
INSERT INTO libros (titulo, precio, stock, id_categoria) VALUES
('Cien Años de Soledad', 19.99, 10, 1),
('Fundación', 15.50, 15, 2),
('Harry Potter', 20.00, 8, 1),
('El Cosmos de Sagan', 16.50, 5, 4);

-- Tabla libro_autor
INSERT INTO libro_autor (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Consultas requeridas



begin;
create view insertpedidos 
as select d.id_pedido, l.id_libro, l.titulo, (l.stock - d.cantidad) as stock_actualizado, (d.cantidad * l.precio) as Precio_total 
from detalles_pedidos d join libros l on d.id_libro = l.id_libro;


SELECT * from insertpedidos;

commit; 
 

  

/*
DELIMITER $$

CREATE FUNCTION calcular_precio_final()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE precio_final INT;

    -- Calcula la suma de la columna 'Precio_total' desde la vista 'insertpedidos'
    SELECT COALESCE(SUM(Precio_total), 0)
    INTO precio_final
    FROM insertpedidos;

    RETURN precio_final;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER Horas_totales
AFTER INSERT ON detalles_pedidos
FOR EACH ROW
BEGIN
    -- Actualiza el stock del libro basado en la cantidad del detalle del pedido
    UPDATE libros
    SET stock = stock - NEW.cantidad
    WHERE id_libro = NEW.id_libro;
END$$

DELIMITER ;
*/
DELIMITER $$

CREATE TRIGGER Calcular_Subtotal_Before_Insert
BEFORE INSERT ON detalles_pedidos
FOR EACH ROW
BEGIN
    -- Calcular el subtotal antes de insertar el detalle
    SET NEW.subtotal = (SELECT l.precio * NEW.cantidad
                        FROM libros l
                        WHERE l.id_libro = NEW.id_libro);
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER Calcular_Total_Pedido
AFTER INSERT ON detalles_pedidos
FOR EACH ROW
BEGIN
    -- Actualizar el total del pedido en la tabla pedidos
    UPDATE pedidos
    SET total = (SELECT COALESCE(SUM(dp.subtotal), 0)
                 FROM detalles_pedidos dp
                 WHERE dp.id_pedido = NEW.id_pedido)
    WHERE id_pedido = NEW.id_pedido;
END$$

DELIMITER ;


INSERT INTO pedidos(id_cliente, fecha, total) 
VALUES (1, '2024-12-15', 0); 

INSERT INTO detalles_pedidos(id_pedido, id_libro, cantidad) 
VALUES (1, 1, 3); 



SELECT * FROM detalles_pedidos WHERE id_detalle = 1;

SELECT * FROM pedidos WHERE id_pedido = 1;

SELECT l.id_libro, l.titulo FROM libros l JOIN libro_autor la ON l.id_libro = la.id_libro WHERE la.id_libro IS NULL;

SELECT p.id_pedido, c.nombre AS cliente, l.titulo AS libro, dp.cantidad, dp.subtotal FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN detalles_pedidos dp ON p.id_pedido = dp.id_pedido
JOIN libros l ON dp.id_libro = l.id_libro;
