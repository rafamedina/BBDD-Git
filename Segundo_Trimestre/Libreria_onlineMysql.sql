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
-- 1. Listado de Libros con Autores y Categorías
SELECT libros.titulo AS libro, autores.nombre AS autor, categorias.nombre AS categoria
FROM libros
JOIN libro_autor ON libros.id_libro = libro_autor.id_libro
JOIN autores ON libro_autor.id_autor = autores.id_autor
JOIN categorias ON libros.id_categoria = categorias.id_categoria;

-- 2. Clientes con Pedidos Realizados
SELECT clientes.nombre AS cliente, SUM(pedidos.total) AS total_pedidos FROM clientes JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente GROUP BY clientes.nombre;

-- 3. Stock Crítico
SELECT titulo AS libro, stock FROM libros WHERE stock <= 5;

-- 4. Total de Pedidos por Cliente
SELECT clientes.nombre AS cliente, COUNT(pedidos.id_pedido) AS numero_pedidos FROM clientes JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente GROUP BY clientes.nombre;

Select * from clientes;

begin;

insert into pedidos( id_cliente,fecha,total) values
(1, '2024-12-15', 0);

select * from pedidos;
select * from libros;

insert into detalles_pedidos (id_pedido,id_libro,cantidad,subtotal) values
(1, 1, 1, 19.99);

insert into detalles_pedidos (id_pedido,id_libro,cantidad,subtotal) values
(1, 2, 2, 15.50 * 2);

update libros  set stock = stock -1 where id_libro = 1;
update libros  set stock = stock -2 where id_libro = 2;

select * from libros;

commit;

begin;

insert into pedidos( id_cliente,fecha,total) values
(1, '2024-12-15', 0);

insert into detalles_pedidos (id_pedido,id_libro,cantidad,subtotal) values
(2, 4, 6, 6 * 16.50);

rollback;

select * from detalles_pedidos;









begin;
create view insertpedidos 
as select d.id_pedido, l.id_libro, l.titulo, (l.stock - d.cantidad) as stock_actualizado, (d.cantidad * l.precio) as Precio_total 
from detalles_pedidos d join libros l on d.id_libro = l.id_libro;


SELECT * from insertpedidos;

commit; 
 



















