
-- Tabla Plato
CREATE TABLE platos (
    id_plato SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK(precio > 0)
);

-- Tabla Ingrediente
CREATE TABLE ingredientes (
    id_ingrediente SERIAL PRIMARY KEY,
    nombre_ingrediente VARCHAR(100) NOT NULL
);

-- Tabla Plato_Ingrediente (Relación muchos a muchos)
CREATE TABLE platos_ingredientes (
    id_plato INT NOT NULL REFERENCES platos(id_plato) ON DELETE CASCADE,
    id_ingrediente INT NOT NULL REFERENCES ingredientes(id_ingrediente) ON DELETE CASCADE,
    PRIMARY KEY (id_plato, id_ingrediente)
);

-- Inserción de datos en la tabla Platos
INSERT INTO platos (nombre, categoria, precio) VALUES
('Sopa de Risas y Lágrimas', 'Entrante', 5.99),
('Tortilla de la Abuela Marciana', 'Principal', 9.99),
('Pastel Intergaláctico de Chocolate', 'Postre', 3.99),
('Cóctel del Unicornio Resfriado', 'Bebida', 4.99);

-- Inserción de datos en la tabla Ingredientes
INSERT INTO ingredientes (nombre_ingrediente) VALUES
('Harina'),
('Huevos'),
('Leche Galáctica'),
('Azúcar Estelar'),
('Chocolate Oscuro'),
('Fresas Mágicas'),
('Queso Espacial'),
('Hierbas Finas'),
('Polvo de Asteroides'),
('Lágrimas de Cebolla'),
('Hielo Polar');

-- Inserción de datos en la tabla Platos_Ingredientes
INSERT INTO platos_ingredientes (id_plato, id_ingrediente) VALUES
(1, 1), (1, 8), (1, 10), -- Ingredientes de Sopa de Risas y Lágrimas
(2, 2), (2, 7), (2, 9), -- Ingredientes de Tortilla de la Abuela Marciana
(3, 5), (3, 3), (3, 4), -- Ingredientes de Pastel Intergaláctico de Chocolate
(4, 6), (4, 3), (4, 11); -- Ingredientes de Cóctel del Unicornio Resfriado


-- 1. Ver el menú completo con precios.

SELECT nombre, precio from platos;

--2. Listar los ingredientes de un plato específico.

SELECT p.nombre ,i.nombre_ingrediente from platos p join platos_ingredientes pl on pl.id_plato=p.id_plato join ingredientes i on pl.id_ingrediente = i.id_ingrediente;

--3. Encentrar el plato más caro usando una subconsulta.

SELECT * FROM platos WHERE precio = (SELECT MAX(precio) FROM platos);


--4. Encontrar el plato más barato usando la cláusula LIMIT.

SELECT * FROM platos ORDER BY precio ASC LIMIT 1;


--5. Encontrar el plato con más ingredientes.

SELECT p.nombre FROM platos p
JOIN platos_ingredientes pl ON p.id_plato = pl.id_plato GROUP BY p.id_plato, p.nombre ORDER BY COUNT(pl.id_ingrediente) DESC LIMIT 1;


--6. Calcular el costo promedio de los platos en cada categoría.

--7. Buscar platos que contengan leche, chocolate o fresas.

--8. Encontrar los platos que tienen más de dos ingredientes y con un coste superior a 5 euros.

--9. Encontrar los platos principales con más de dos ingredientes.

--10. Insertar un nuevo plato llamado &quot;Ensalada de Estrellas Fugaces&quot; en la categoría &quot;Entrante&quot;, con un precio de $7.50.

--11. Inserta en la tabla ingrediente tres ingredientes de tu invención para la nueva “Ensalada de Estrellas Fugaces”.

--12. Asigna los tres nuevos ingredientes a tu nueva ensalada.

--13. Insertar tres platos nuevos de la categoría &quot;Postre&quot; con nombres curiosos. Recuerda asignarles ingredientes.
--14. Aumentar el precio del plato &quot;Pastel Intergaláctico de Chocolate&quot; en un 10%.
--15. Actualiza la categoría del plato &quot;Cóctel del Unicornio Resfriado&quot; de &quot;Bebida&quot; a &quot;Postre Líquido&quot;.
--16. Cambia el nombre del ingrediente &quot;Esencia de Sol&quot; a &quot;Extracto de Sal&quot;.
--17. Incrementa en $1.00 el precio de todos los platos de la categoría &quot;Principal&quot;.
--18. Asigna el ingrediente &quot;Toques de Fantasía&quot; a todos los platos de la categoría &quot;Postre&quot;.
