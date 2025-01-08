
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


-- 1. Mostrar los nombres de los productos convertidos a mayúsculas.
SELECT upper(nombre_producto) from Productos;

-- 2. Obtener el nombre de los clientes sustituyendo la letra a por un asterisco (*).
SELECT REPLACE(nombre_cliente, 'a', '*') AS nombre_modificado FROM Clientes;

-- 3. Mostrar los primeros 5 caracteres de cada nombre de producto.
SELECT LEFT(nombre_producto, 5) AS primeros_caracteres FROM Productos;

-- 4. Listar las categorías de producto en orden inverso alfabético, pero solo mostrando el nombre al revés.
SELECT REVERSE(nombre_categoria) AS nombre_reverso FROM Categorias ORDER BY nombre_categoria DESC;

-- 5. Calcular el precio de cada producto redondeado al entero más cercano.
SELECT nombre_producto, round(precio) AS precio_redondeado from Productos;

-- 6. Mostrar la longitud del nombre de cada cliente.
SELECT nombre_cliente, char_length(nombre_cliente) as cantidad_letras from clientes;

-- 7.  Extraer el año de la fecha de pedido para todos los pedidos.
select id_cliente, id_producto, YEAR(fecha_pedido) as Año_pedido from Pedidos;

-- 8.  Calcular la diferencia en días entre la fecha de pedido y la fecha de entrega de cada pedido.
SELECT id_pedido, DATEDIFF(fecha_entrega, fecha_pedido) AS dias_diferencia FROM Pedidos;

-- 9. Mostrar el nombre de los clientes con la primera letra en mayúscula y las demás en minúscula.
SELECT CONCAT(UPPER(LEFT(nombre_cliente, 1)), LOWER(SUBSTRING(nombre_cliente, 2))) AS nombre_capitalizado FROM Clientes;

-- 10.  Concatenar el nombre del producto con su medida, separados por un guion (-).
SELECT CONCAT(nombre_producto, "-", medida) AS productoMedida from Productos;

-- 11.  Mostrar solo el nombre en mayúsculas de los clientes que viven en ciudades cuyo nombre termina con una vocal.
SELECT UPPER(nombre_cliente) AS nombre_mayus FROM Clientes WHERE ciudad REGEXP '[aeiou]$';

-- 12.  Reemplazar las letras "a" en los nombres de producto por el símbolo @.
SELECT REPLACE(nombre_producto, 'a', '@') AS nombre_modificado FROM Productos;

-- 13.  Convertir la fecha de pedido al formato "DD/MM/YYYY".
SELECT DATE_FORMAT(fecha_pedido, '%d/%m/%Y') AS fecha_formateada FROM Pedidos;

-- 14.  Calcular el precio de cada producto multiplicado por 1.21 (añadiendo IVA).
SELECT nombre_producto, precio * 1.21 as precioIva from productos;

-- 15.  Mostrar las 3 primeras letras de las categorías.
SELECT LEFT(nombre_categoria, 3) as primeraletracategoria from categorias;

-- 16.  Listar los nombres de productos que contengan exactamente 10 caracteres.
SELECT nombre_producto from productos where char_length(nombre_producto) = 10;

-- 17.  Extraer el nombre del cliente junto al cargo entre paréntesis en la misma columna.
SELECT CONCAT(nombre_cliente, ' (', cargo, ')') AS cliente_Cargo FROM Clientes;

-- 18.  Mostrar el número de teléfono de los clientes con guiones en lugar de espacios en blanco.
SELECT REPLACE(telefono, ' ', '-') AS telefono_formateado FROM Clientes;

-- 19.  Obtener la parte del nombre del cliente antes del primer espacio en blanco.
SELECT SUBSTRING_INDEX(nombre_cliente, ' ', 1) AS primer_nombre FROM Clientes;

-- 20.  Calcular el día de la semana en que se realizó cada pedido.
SELECT DAYNAME(fecha_pedido) AS dia_semana FROM Pedidos;