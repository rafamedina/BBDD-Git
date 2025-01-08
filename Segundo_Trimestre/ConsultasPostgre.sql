-- Obtener los nombres de los productos con todas las vocales reemplazadas por asteriscos *.
SELECT REGEXP_REPLACE(nombre_producto, '[aeiouAEIOU]', '*', 'g') AS nombre_modificado FROM Productos;


-- Mostrar la fecha de pedido en el formato "YYYY-MM-DD".
SELECT TO_CHAR(fecha_pedido, 'YYYY-MM-DD') AS fecha_formateada FROM Pedidos;


-- Extraer el mes y día de la fecha de entrega.
SELECT EXTRACT(MONTH FROM fecha_entrega) AS mes, EXTRACT(DAY FROM fecha_entrega) AS dia FROM Pedidos;


-- Calcular el precio de cada producto redondeado hacia abajo al entero más cercano.
SELECT nombre_producto, FLOOR(precio) AS precio_redondeado_abajo FROM Productos;


-- Listar los nombres de los clientes que contienen la letra "o".
SELECT nombre_cliente FROM Clientes WHERE nombre_cliente ILIKE '%o%';


-- Mostrar los nombres de los productos ordenados por longitud (de más corto a más largo).
SELECT nombre_producto FROM Productos ORDER BY LENGTH(nombre_producto);


-- Concatenar el nombre del cliente y su ciudad, separados por una coma.
SELECT CONCAT(nombre_cliente, ', ', ciudad) AS cliente_ciudad FROM Clientes;


-- Mostrar solo las 3 últimas letras de los nombres de las categorías.
SELECT RIGHT(nombre_categoria, 3) AS ultimas_tres_letras FROM Categorias;


-- Obtener el precio promedio de todos los productos de cada categoría.
SELECT c.nombre_categoria, AVG(p.precio) AS precio_promedio FROM Productos p JOIN Categorias c ON p.id_categoria = c.id_categoria GROUP BY c.nombre_categoria;


-- Mostrar los nombres de productos cuya longitud sea mayor a 6 caracteres.
SELECT nombre_producto FROM Productos WHERE LENGTH(nombre_producto) > 6;


-- Obtener la fecha de pedido más reciente y más antigua.
SELECT MAX(fecha_pedido) AS fecha_mas_reciente, MIN(fecha_pedido) AS fecha_mas_antigua FROM Pedidos;


-- Determinar si el precio de los productos es divisible por 10.
SELECT nombre_producto, precio, (precio % 10 = 0) AS divisible_por_10 FROM Productos;


-- Mostrar los nombres de los productos en mayúsculas si el precio es mayor a 20, y en minúsculas en caso contrario.
SELECT CASE WHEN precio > 20 THEN UPPER(nombre_producto) ELSE LOWER(nombre_producto) END AS nombre_modificado FROM Productos;


-- Extraer las iniciales del nombre de los clientes.
SELECT CONCAT(SUBSTRING(nombre_cliente FROM 1 FOR 1), '.') AS inicial FROM Clientes;


-- Calcular el precio total (precio * cantidad) de cada pedido (supongamos un campo cantidad agregado).
SELECT p.nombre_producto, ped.cantidad, (p.precio * ped.cantidad) AS precio_total FROM Pedidos ped JOIN Productos p ON ped.id_producto = p.id_producto;


-- Contar cuántos productos están registrados en cada categoría.
SELECT c.nombre_categoria, COUNT(p.id_producto) AS total_productos FROM Productos p JOIN Categorias c ON p.id_categoria = c.id_categoria GROUP BY c.nombre_categoria;


-- Mostrar el número de pedidos realizados por cada cliente.
SELECT c.nombre_cliente, COUNT(p.id_pedido) AS total_pedidos FROM Clientes c JOIN Pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre_cliente;


-- Crear un alias para el nombre de cada producto que lo combine con su ID (e.g., "1 - Televisor").
SELECT CONCAT(id_producto, ' - ', nombre_producto) AS alias_producto FROM Productos;


-- Mostrar los clientes cuyo número de teléfono contiene el dígito "7".
SELECT nombre_cliente, telefono FROM Clientes WHERE telefono LIKE '%7%';


-- Mostrar los productos que tienen un precio entre 10 y 100.
SELECT nombre_producto, precio FROM Productos WHERE precio BETWEEN 10 AND 100;




