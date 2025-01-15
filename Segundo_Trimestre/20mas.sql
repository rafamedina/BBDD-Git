drop database if exists supermercado;
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Supermercado;
USE Supermercado;

-- Tabla de Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    medida VARCHAR(50),
    precio DECIMAL(10, 2),
    id_categoria INT
);

-- Tabla de Categorías
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad VARCHAR(100),
    telefono VARCHAR(20),
    cargo VARCHAR(50)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    fecha_pedido DATE,
    fecha_entrega DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Insertar datos en Categorías
INSERT INTO Categorias (nombre_categoria) VALUES
('Electrónica'),
('Hogar'),
('Juguetes'),
('Alimentos'),
('Ropa');

-- Insertar datos en Productos
INSERT INTO Productos (nombre_producto, medida, precio, id_categoria) VALUES
('Televisor', '40 pulgadas', 399.99, 1),
('Lámpara', '15x30 cm', 29.99, 2),
('Muñeca', '30 cm', 19.99, 3),
('Cereal', '500 g', 3.49, 4),
('Camiseta', 'M', 9.99, 5);

-- Insertar datos en Clientes
INSERT INTO Clientes (nombre_cliente, ciudad, telefono, cargo) VALUES
('Ana Pérez', 'Madrid', '123 456 789', 'Gerente'),
('Luis Gómez', 'Barcelona', '987 654 321', 'Asistente'),
('María López', 'Sevilla', '555 666 777', 'Contador'),
('Pedro Ruiz', 'Valencia', '333 222 111', 'Director');

-- Insertar datos en Pedidos
INSERT INTO Pedidos (id_cliente, id_producto, fecha_pedido, fecha_entrega) VALUES
(1, 1, '2024-12-01', '2024-12-05'),
(2, 2, '2024-12-02', '2024-12-07'),
(3, 3, '2024-12-03', '2024-12-06'),
(4, 4, '2024-12-04', '2024-12-09');


-- Mostrar los nombres de los productos en minúsculas.
SELECT lower(nombre_producto) from productos;

-- Obtener el nombre de los clientes donde el nombre contenga exactamente dos palabras.
SELECT nombre_cliente FROM Clientes WHERE nombre_cliente LIKE '% %' AND nombre_cliente NOT LIKE '% % %';


-- Calcular el total de pedidos realizados en el año 2024.
SELECT count(id_pedido) AS pedidos_totales FROM pedidos where year(fecha_pedido) = 2024;

-- Listar los nombres de los productos cuyo precio sea mayor al promedio de todos los productos.
SELECT nombre_producto FROM Productos WHERE precio > (SELECT AVG(precio) FROM Productos);

-- Mostrar la fecha y hora actual con un formato personalizado "DD/MM/YYYY HH:MM".
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y %H:%i') AS fecha_hora_actual;

-- Obtener los nombres de los clientes ordenados por la última letra de su nombre.
SELECT nombre_cliente FROM Clientes ORDER BY RIGHT(nombre_cliente, 1);


-- Contar cuántos productos tienen precios superiores a 50.
SELECT nombre_producto, precio from productos where precio > 50;

-- Concatenar el nombre del producto y su precio, separados por un espacio.
SELECT CONCAT(nombre_producto, ' ', precio) AS producto_precio FROM Productos;

-- Mostrar los nombres de productos que no contengan ninguna vocal.
SELECT nombre_producto FROM Productos WHERE nombre_producto NOT REGEXP '[aeiouAEIOU]';


-- Calcular el precio total (precio * cantidad) para cada producto vendido y ordenarlo de mayor a menor.
SELECT p.nombre_producto, SUM(p.precio * 1) AS precio_total FROM  Pedidos ped JOIN  Productos p ON ped.id_producto = p.id_producto GROUP BY  p.id_producto ORDER BY precio_total DESC;

-- Mostrar los nombres de los clientes con las letras "e" y "a" reemplazadas por "*".
SELECT REPLACE(REPLACE(nombre_cliente, 'e', '*'), 'a', '*') AS cliente_modificado FROM Clientes;

-- Listar las categorías de productos que no tienen ningún producto asociado.
SELECT nombre_categoria FROM Categorias c LEFT JOIN Productos p ON c.id_categoria = p.id_categoria WHERE p.id_categoria IS NULL;

-- Mostrar el número total de días entre la fecha más antigua y la más reciente en la tabla de pedidos.
SELECT DATEDIFF(MAX(fecha_pedido), MIN(fecha_pedido)) AS dias_totales FROM Pedidos;

-- Obtener los productos que tienen precios redondeados al entero más cercano iguales a 20.
SELECT nombre_producto FROM Productos WHERE ROUND(precio) = 20;

-- Listar los pedidos realizados en un día lunes.
SELECT * FROM Pedidos WHERE DAYOFWEEK(fecha_pedido) = 2;

-- Mostrar las iniciales de cada cliente (primeras letras de su nombre y apellido).
SELECT CONCAT(LEFT(SUBSTRING_INDEX(nombre_cliente, ' ', 1), 1), LEFT(SUBSTRING_INDEX(nombre_cliente, ' ', -1), 1)) AS iniciales FROM Clientes;

-- Extraer las dos últimas letras del nombre de cada categoría y mostrar cuántas son "as".
SELECT nombre_categoria, RIGHT(nombre_categoria, 2) AS ultimas_letras FROM Categorias WHERE RIGHT(nombre_categoria, 2) = 'as';

-- Calcular el precio promedio por pedido (precio * cantidad / total de pedidos).
SELECT AVG(p.precio * 1) AS precio_promedio_por_pedido FROM Pedidos ped JOIN Productos p ON ped.id_producto = p.id_producto;

-- Mostrar los nombres de los productos en formato "Producto: nombre_producto, Precio: precio".
SELECT CONCAT('Producto: ', nombre_producto, ', Precio: ', precio) AS descripcion_producto FROM Productos;