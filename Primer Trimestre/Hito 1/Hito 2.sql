/*
Hito 2 1T
Bases de datos
Docente: David Valbuena Segura
Año: 2024
*/



-- Crear base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de clientes
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    telefono VARCHAR(15)
);

-- Tabla de productos
CREATE TABLE IF NOT EXISTS producto (
    id_producto VARCHAR(5) PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(8, 2),
    stock INT,
    minimo INT
);

-- Tabla de facturas
CREATE TABLE IF NOT EXISTS factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    estado_pago ENUM('pagada', 'pendiente') NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabla de detalles de facturas
CREATE TABLE IF NOT EXISTS detalle (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    id_producto VARCHAR(5),
    unidades INT,
    precio DECIMAL(8, 2),
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);


-- Insertar datos en la tabla cliente
INSERT INTO cliente (nombre, direccion, ciudad, telefono) VALUES
('Delgado Perez Marisa', 'Calle Mayor 1', 'Madrid', '600123456'),
('Rosa Perez Delgado', 'Avenida Sol 20', 'Barcelona', '601987654'),
('Juan Gomez Lopez', 'Calle Luna 10', 'Madrid', '602765432'),
('Ana Maria Ruiz', 'Calle Estrella 15', 'Sevilla', '603567890'),
('Luis Martinez', 'Calle Olivo 30', 'Valencia', '604345678'),
('Sofia Garcia', 'Avenida Mar 8', 'Madrid', '605234567'),
('Carlos Sanz', 'Calle Fuego 12', 'Granada', '606876543'),
('Marina Jimenez', 'Avenida Rio 25', 'Barcelona', '607345678'),
('Fernando Torres', 'Plaza Sol 3', 'Malaga', '608123789'),
('Isabel Lopez', 'Calle Luna 40', 'Madrid', '609876432'),
('Patricia Ruiz', 'Avenida Norte 18', 'Bilbao', '610234123'),
('Ricardo Torres', 'Calle Sur 5', 'Barcelona', '611987123'),
('Carmen Morales', 'Calle Sol 11', 'Valencia', '612876543'),
('Marta Romero', 'Calle Este 8', 'Madrid', '613345123'),
('Antonio Fernandez', 'Calle Oeste 9', 'Sevilla', '614234321'),
('Laura Dominguez', 'Avenida Luz 13', 'Zaragoza', '615123765'),
('Javier Delgado', 'Calle Mar 33', 'Madrid', '616876345'),
('Lucia Rios', 'Calle Fuego 12', 'Barcelona', '617234987'),
('Pablo Herrera', 'Avenida Olivo 20', 'Sevilla', '618567890'),
('Monica Sanchez', 'Plaza Mayor 45', 'Madrid', '619876123');

-- Insertar datos en la tabla producto
INSERT INTO producto (id_producto, descripcion, precio, stock, minimo) VALUES
('BAB5', 'Batería AAA', 5.50, 15, 10),
('BAF4', 'Batería AA', 4.00, 8, 5),
('CAB1', 'Cable USB', 3.75, 50, 20),
('CAR7', 'Cargador rápido', 15.00, 5, 3),
('CHA3', 'Cargador inalámbrico', 20.00, 4, 2),
('FUN1', 'Funda protectora', 7.00, 25, 10),
('AUR2', 'Auriculares', 9.50, 30, 15),
('HDD5', 'Disco duro externo', 50.00, 6, 2),
('SDC3', 'Tarjeta SD 32GB', 12.00, 60, 25),
('SSD1', 'SSD 256GB', 55.00, 3, 1),
('PWR2', 'Power Bank', 25.00, 12, 5),
('CBB2', 'Cable HDMI', 8.00, 45, 20),
('ADP3', 'Adaptador USB-C', 5.00, 18, 10),
('MIC4', 'Micrófono', 18.50, 20, 10),
('SPK5', 'Altavoz Bluetooth', 22.00, 7, 3),
('MON8', 'Monitor 24"', 120.00, 2, 1),
('KEY6', 'Teclado inalámbrico', 15.00, 10, 4),
('MOU4', 'Ratón óptico', 10.00, 28, 12),
('TBL7', 'Tablet 10"', 200.00, 4, 2),
('STL9', 'Estabilizador', 35.00, 8, 3);

-- Insertar datos en la tabla factura
INSERT INTO factura (fecha, estado_pago, id_cliente) VALUES
(CURDATE(), 'pagada', 1),
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'pendiente', 2),
(DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'pagada', 3),
(DATE_SUB(CURDATE(), INTERVAL 20 DAY), 'pendiente', 4),
(DATE_SUB(CURDATE(), INTERVAL 15 DAY), 'pagada', 5),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 'pendiente', 6),
(DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'pagada', 7),
(DATE_SUB(CURDATE(), INTERVAL 25 DAY), 'pendiente', 8),
(DATE_SUB(CURDATE(), INTERVAL 30 DAY), 'pagada', 9),
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 'pendiente', 10),
(DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'pagada', 11),
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'pendiente', 12),
(DATE_SUB(CURDATE(), INTERVAL 18 DAY), 'pagada', 13),
(DATE_SUB(CURDATE(), INTERVAL 14 DAY), 'pendiente', 14),
(DATE_SUB(CURDATE(), INTERVAL 22 DAY), 'pagada', 15),
(DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'pendiente', 16),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 'pagada', 17),
(DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'pendiente', 18),
(DATE_SUB(CURDATE(), INTERVAL 19 DAY), 'pagada', 19),
(DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'pendiente', 20);

-- Insertar datos en la tabla detalle
INSERT INTO detalle (id_factura, id_producto, unidades, precio) VALUES
(1, 'BAB5', 3, 5.50),
(1, 'CAB1', 2, 3.75),
(2, 'BAF4', 1, 4.00),
(3, 'CAR7', 1, 15.00),
(3, 'BAB5', 4, 5.50),
(4, 'CAB1', 5, 3.75),
(5, 'AUR2', 3, 9.50),
(6, 'SSD1', 1, 55.00),
(7, 'FUN1', 4, 7.00),
(8, 'SPK5', 2, 22.00),
(9, 'MIC4', 1, 18.50),
(10, 'MON8', 1, 120.00),
(11, 'CBB2', 6, 8.00),
(12, 'SDC3', 10, 12.00),
(13, 'PWR2', 2, 25.00),
(14, 'TBL7', 1, 200.00),
(15, 'MOU4', 5, 10.00),
(16, 'KEY6', 2, 15.00),
(17, 'HDD5', 1, 50.00),
(18, 'CHA3', 3, 20.00),
(19, 'ADP3', 4, 5.00),
(20, 'CAR7', 2, 15.00);


-- Actualizar el stock de algunos productos para que sea menor que el mínimo
UPDATE producto SET stock = 5 WHERE id_producto = 'BAB5';  -- mínimo es 10
UPDATE producto SET stock = 2 WHERE id_producto = 'BAF4';  -- mínimo es 5
UPDATE producto SET stock = 15 WHERE id_producto = 'CAB1'; -- mínimo es 20
UPDATE producto SET stock = 1 WHERE id_producto = 'SSD1';  -- mínimo es 3
UPDATE producto SET stock = 3 WHERE id_producto = 'TBL7';  -- mínimo es 5

INSERT INTO factura (id_factura, fecha, estado_pago, id_cliente)
VALUES (5000, CURDATE(), 'pagada', 1);


INSERT INTO detalle (id_factura, id_producto, unidades, precio) VALUES
(5000, 'BAB5', 3, 5.50),
(5000, 'CAB1', 2, 3.75),
(5000, 'BAF4', 1, 4.00);


-- 1. Obtén la información de todos los clientes de Madrid.

SELECT * FROM cliente WHERE ciudad = 'Madrid';

-- 2. Obtén la información de todos los clientes que no son de Madrid.

SELECT * FROM cliente WHERE ciudad <> 'Madrid';

-- 3. Obtén la información de todos los clientes cuyo nombre comience con una de las letras entre B y G.

SELECT * FROM cliente WHERE nombre BETWEEN 'B' AND 'G';

-- 4. Obtén la información de todos los clientes cuyo nombre comience con la letra D.

SELECT * FROM cliente WHERE nombre LIKE 'D%';

-- 5. Obtén toda la información del producto con código BAB5.

SELECT * FROM producto WHERE id_producto = 'BAB5';

-- 6. Obtén una relación con los productos a reponer y el dinero que hay que invertir en reponerlo. Un producto necesita reposición si cumple la condición stock &lt; mínimo. Mostrar código, descripción, stock, unidades a reponer y dinero.

SELECT id_producto, descripcion, stock, (minimo - stock) AS unidades_reponer,(minimo - stock) * precio AS dinero_invertir
FROM producto
WHERE stock < minimo;


-- 7. Obtén todas las líneas de detalle de todas las facturas incluyendo también la descripción del artículo y el precio de la venta (unidades*precio). Deberás unir las tablas detalle y producto.

SELECT d.id_detalle, d.id_factura, d.id_producto, p.descripcion, d.unidades,d.precio, (d.unidades * d.precio) AS precio_venta
FROM detalle d
JOIN producto p ON d.id_producto = p.id_producto;


-- 8. Realiza una copia de la consulta 7 y establece un criterio para ver las líneas de detalle de la factura 5000.

SELECT d.id_detalle, d.id_factura, d.id_producto, p.descripcion, d.unidades, d.precio, (d.unidades * d.precio) AS precio_de_venta
FROM detalle d
JOIN producto p ON d.id_producto = p.id_producto
WHERE d.id_factura = 5000;


-- 9. Realiza una copia de la consulta 7 y establece un criterio para ver las ventas del artículo con código BAB5.

SELECT d.id_detalle, d.id_factura, d.id_producto, p.descripcion, d.unidades, d.precio, (d.unidades * d.precio) AS precio_de_venta
FROM detalle d
JOIN producto p ON d.id_producto = p.id_producto
WHERE d.id_producto = 'BAB5';

-- 10. Obtén una relación con todas las facturas incluyendo también el nombre y teléfono del cliente. Deberás unir las tablas factura y cliente.

SELECT f.id_factura, f.fecha, f.estado_pago, c.nombre, c.telefono
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente;

-- 11. Obtén una relación con todas las facturas incluyendo también el nombre y teléfono del cliente, así como el importe total de la factura (suma de unidades*precio para cada factura). Deberás unir las tablas cliente, factura y detalle.

SELECT f.id_factura, f.fecha, f.estado_pago, c.nombre, c.telefono, SUM(d.unidades * d.precio) AS importe_final
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN detalle d ON f.id_factura = d.id_factura
GROUP BY f.id_factura;

-- 12. Realizar una copia de la consulta 11 y establecer el siguiente criterio: sólo las facturas del cliente DELGADO PEREZ MARISA.

SELECT f.id_factura, f.fecha, f.estado_pago, c.nombre, c.telefono, SUM(d.unidades * d.precio) AS importe_final
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN detalle d ON f.id_factura = d.id_factura
WHERE c.nombre = 'Delgado Perez Marisa'
GROUP BY f.id_factura;

-- 13. Realizar una copia de la consulta 11 y establecer el siguiente criterio: sólo las facturas pagadas.

SELECT f.id_factura, f.fecha, f.estado_pago, c.nombre, c.telefono, SUM(d.unidades * d.precio) AS importe_final
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN detalle d ON f.id_factura = d.id_factura
WHERE f.estado_pago = 'pagada'
GROUP BY f.id_factura;

-- 14. Realizar una copia de la consulta 11 y establecer el siguiente criterio: sólo las facturas pendientes de pago.

SELECT f.id_factura, f.fecha, f.estado_pago, c.nombre, c.telefono, SUM(d.unidades * d.precio) AS importe_final
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN detalle d ON f.id_factura = d.id_factura
WHERE f.estado_pago = 'pendiente'
GROUP BY f.id_factura;

-- 15. Realizar una copia de la consulta 11 y establecer el siguiente criterio: facturas de septiembre.

SELECT factura.id_factura, factura.fecha, cliente.nombre, cliente.telefono,
       SUM(detalle.unidades * detalle.precio) AS importe_total
FROM factura
JOIN cliente ON factura.id_cliente = cliente.id_cliente
JOIN detalle ON factura.id_factura = detalle.id_factura
WHERE factura.fecha BETWEEN '2024-09-01' AND '2024-09-30'
GROUP BY factura.id_factura, factura.fecha, cliente.nombre, cliente.telefono;

-- 16. Realizar una copia de la consulta 11 y establecer el siguiente criterio: facturas con importe entre 10 y 20 euros.

SELECT f.id_factura, f.fecha, f.estado_pago, c.nombre, c.telefono, SUM(d.unidades * d.precio) AS importe_final
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN detalle d ON f.id_factura = d.id_factura
GROUP BY f.id_factura
HAVING importe_final BETWEEN 10 AND 20;

-- 17. Obtén el importe total de todas las facturas pagadas. Debe salir una sola cifra con la suma de los importes de todas las facturas.

SELECT SUM(d.unidades * d.precio) AS pagado_total
FROM factura f
JOIN detalle d ON f.id_factura = d.id_factura
WHERE f.estado_pago = 'pagada';

-- 18. Obtén el importe total de todas las facturas de ROSA PEREZ DELGADO.

SELECT SUM(d.unidades * d.precio) AS facturas_totales_de_Rosa
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN detalle d ON f.id_factura = d.id_factura
WHERE c.nombre = 'Rosa Perez Delgado';

-- 19. Obtén una relación de artículos junto a la suma de las unidades totales vendidas y el importe recaudado de dichas ventas.

SELECT p.id_producto, p.descripcion, SUM(d.unidades) AS unidades_totales, SUM(d.unidades * d.precio) AS importe_total_ventas
FROM detalle d
JOIN producto p ON d.id_producto = p.id_producto
GROUP BY p.id_producto;

-- 20. Obtén una relación de clientes junto con el número total de facturas que tiene cada uno (cuenta de facturas de cada cliente).

SELECT c.id_cliente, c.nombre, COUNT(f.id_factura) AS total_final_facturas
FROM cliente c
JOIN factura f ON c.id_cliente = f.id_cliente
GROUP BY c.id_cliente;

-- 21. Basándonos en el ejercicio 6, obtén el importe total a invertir en la reposición de artículos.

SELECT SUM((minimo - stock) * precio) AS total_inversion_reposicion
FROM producto
WHERE stock < minimo;

-- 22. Aumentar un 3% el precio del artículo BAF4.

UPDATE producto SET precio = precio * 1.03 WHERE id_producto = 'BAF4';
SELECT * FROM producto where id_producto='BAF4';

-- 23. Añade la factura 5010 con fecha de hoy.

INSERT INTO factura (id_factura, fecha, estado_pago, id_cliente)
VALUES (5010, CURDATE(), 'pendiente', 1);
SELECT * FROM factura where id_factura='5010';

-- 24. Borra la factura 5010.

DELETE FROM factura WHERE id_factura = 5010;
SELECT * FROM factura where id_factura='5010';

-- 25. Obtén la relación de productos junto al número de unidades vendidas de cada uno.

SELECT p.id_producto, p.descripcion, SUM(d.unidades) AS venta_de_unidades_total
FROM producto p
JOIN detalle d ON p.id_producto = d.id_producto
GROUP BY p.id_producto;


