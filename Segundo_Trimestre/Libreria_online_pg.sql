º-- Tabla clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    direccion TEXT
);

-- Tabla autores
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla categorias
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla libros
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK(precio > 0),
    stock INT NOT NULL CHECK(stock >= 0),
    id_categoria INT REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

-- Tabla libro_autor
CREATE TABLE libro_autor (
    id_libro INT REFERENCES libros(id_libro) ON DELETE CASCADE,
    id_autor INT REFERENCES autores(id_autor) ON DELETE CASCADE,
    PRIMARY KEY (id_libro, id_autor)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente) ON DELETE SET NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10, 2) NOT NULL CHECK(total >= 0)
);

-- Tabla detalles_pedidos
CREATE TABLE detalles_pedidos (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_libro INT REFERENCES libros(id_libro) ON DELETE CASCADE,
    cantidad INT NOT NULL CHECK(cantidad > 0),
    subtotal NUMERIC(10, 2) NOT NULL CHECK(subtotal >= 0)
);
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

-- 1. Listado de Libros con Autores y Categorías
SELECT libros.titulo AS libro,autores.nombre AS autor, categorias.nombre AS categoria FROM libros
JOIN libro_autor ON libros.id_libro = libro_autor.id_libro
JOIN autores ON libro_autor.id_autor = autores.id_autor
JOIN categorias ON libros.id_categoria = categorias.id_categoria;

-- 2. Clientes con Pedidos Realizados
SELECT clientes.nombre AS cliente, SUM(pedidos.total) AS total_pedidos FROM clientes JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente GROUP BY clientes.nombre;

-- 3. Stock Crítico
SELECT titulo AS libro, stock FROM libros WHERE stock <= 5;

-- 4. Total de Pedidos por Cliente
SELECT clientes.nombre AS cliente, COUNT(pedidos.id_pedido) AS numero_pedidos FROM clientes JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente GROUP BY clientes.nombre;


BEGIN;

INSERT INTO pedidos (id_cliente, fecha, total) VALUES
(1, '2024-12-15', 0);

SELECT * FROM pedidos;
SELECT * FROM libros;

INSERT INTO detalles_pedidos (id_pedido, id_libro, cantidad, subtotal) VALUES
(1, 1, 1, 19.99);

INSERT INTO detalles_pedidos (id_pedido, id_libro, cantidad, subtotal) VALUES
(1, 2, 2, 15.50 * 2);

UPDATE libros SET stock = stock - 1 WHERE id_libro = 1;
UPDATE libros SET stock = stock - 2 WHERE id_libro = 2;

SELECT * FROM libros;

COMMIT;

BEGIN;

INSERT INTO pedidos (id_cliente, fecha, total) VALUES
(1, '2024-12-15', 0);

INSERT INTO detalles_pedidos (id_pedido, id_libro, cantidad, subtotal) VALUES
(2, 4, 6, 6 * 16.50);

ROLLBACK;

SELECT * FROM detalles_pedidos;
