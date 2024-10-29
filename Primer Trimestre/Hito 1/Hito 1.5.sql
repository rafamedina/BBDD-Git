CREATE DATABASE IF NOT EXISTS CrimenDB;
USE CrimenDB;

-- Crear la tabla BANDAS con clave primaria compuesta (IdBanda, Nombre)
CREATE TABLE IF NOT EXISTS BANDAS (
    IdBanda INT NOT NULL,
    Nombre VARCHAR(50),
    Ciudad VARCHAR(50),
    CodigoPostal VARCHAR(10),
    PRIMARY KEY (IdBanda)  -- Clave primaria compuesta
);

-- Crear la tabla MIEMBROS
CREATE TABLE IF NOT EXISTS MIEMBROS (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    IDJefe VARCHAR(15) NULL,
    IdBanda INT NOT NULL,
    FOREIGN KEY (IdBanda) REFERENCES BANDAS(IdBanda) ON DELETE CASCADE
);

-- Crear la tabla DELITOS
CREATE TABLE IF NOT EXISTS DELITOS (
    IdDelito INT PRIMARY KEY,
    TipoDelito VARCHAR(50),
    FechaDelito DATE,
    CiudadDelito VARCHAR(50),
    IdBanda INT NOT NULL,
    FOREIGN KEY (IdBanda) REFERENCES BANDAS(IdBanda) ON DELETE CASCADE
);

-- Crear la tabla VICTIMAS
CREATE TABLE IF NOT EXISTS VICTIMAS (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Direccion VARCHAR(100),
    Edad INT,
    Sexo varchar(6)
);

-- Crear la tabla intermedia para la relación N:M entre MIEMBROS y DELITOS
CREATE TABLE IF NOT EXISTS MIEMBROS_DELITOS (
    DNI VARCHAR(9),
    IdDelito INT,
    PRIMARY KEY (DNI, IdDelito),
    FOREIGN KEY (DNI) REFERENCES MIEMBROS(DNI) ON DELETE CASCADE,
    FOREIGN KEY (IdDelito) REFERENCES DELITOS(IdDelito) ON DELETE CASCADE
);

-- Crear la tabla intermedia para la relación N:M entre DELITOS y VÍCTIMAS
CREATE TABLE IF NOT EXISTS DELITOS_VICTIMAS (
    IdDelito INT,
    DNI VARCHAR(9),
    PRIMARY KEY (IdDelito, DNI),
    FOREIGN KEY (IdDelito) REFERENCES DELITOS(IdDelito) ON DELETE CASCADE,
    FOREIGN KEY (DNI) REFERENCES VICTIMAS(DNI) ON DELETE CASCADE
);

INSERT INTO BANDAS (IdBanda, Nombre, Ciudad, CodigoPostal) 
VALUES 
(3, 'Los Fantasmas', 'Valencia', '46001'),
(4, 'Los Dragones', 'Sevilla', '41001'),
(5, 'Los Lobos', 'Bilbao', '48001'),
(6, 'Los Escorpiones', 'Zaragoza', '50001');

INSERT INTO MIEMBROS (DNI, Nombre, Apellido, Jefe, IdBanda) 
VALUES 
('34567891E', 'Miguel', 'Sánchez', '12345678A', 1),   -- Miguel es miembro de Los Chicos Malos, liderado por Juan
('45678902F', 'Javier', 'López', '23456789B', 1),     -- Javier es subordinado de Carlos, también en Los Chicos Malos
('56789013G', 'Andrés', 'Martínez', NULL, 4),         -- Andrés es un miembro independiente de Los Dragones
('67890124H', 'Pedro', 'García', '56789013G', 4);     -- Pedro es subordinado de Andrés en Los Dragones

INSERT INTO DELITOS (IdDelito, TipoDelito, FechaDelito, CiudadDelito, IdBanda) 
VALUES 
(3, 'Extorsión', '2024-02-10', 'Valencia', 3),        -- Delito realizado por Los Fantasmas en Valencia
(4, 'Contrabando', '2023-11-20', 'Sevilla', 4),       -- Delito realizado por Los Dragones en Sevilla
(5, 'Vandalismo', '2024-01-05', 'Bilbao', 5),         -- Delito realizado por Los Lobos en Bilbao
(6, 'Robo de vehículos', '2023-12-15', 'Zaragoza', 6); -- Delito realizado por Los Escorpiones en Zaragoza

INSERT INTO VICTIMAS (DNI, Nombre, Apellido, Direccion, Edad, Sexo) 
VALUES 
('56789012F', 'Laura', 'García', 'Calle Mayor 10, Valencia', 28, 'F'),   -- Víctima de la extorsión
('67890123G', 'Ricardo', 'López', 'Avenida Central 23, Sevilla', 40, 'M'), -- Víctima del contrabando
('78901234H', 'María', 'Santos', 'Plaza Nueva 5, Bilbao', 32, 'F'),      -- Víctima del vandalismo
('89012345I', 'Fernando', 'Ruiz', 'Calle Real 18, Zaragoza', 50, 'M');   -- Víctima del robo de vehículos

INSERT INTO MIEMBROS_DELITOS (DNI, IdDelito) 
VALUES 
('34567891E', 3),  -- Miguel participó en el delito de extorsión
('45678902F', 4),  -- Javier participó en el contrabando
('56789013G', 5),  -- Andrés participó en el vandalismo
('67890124H', 6);  -- Pedro participó en el robo de vehículos

INSERT INTO DELITOS_VICTIMAS (IdDelito, DNI) 
VALUES 
(3, '56789012F'),  -- Laura fue víctima de la extorsión
(4, '67890123G'),  -- Ricardo fue víctima del contrabando
(5, '78901234H'),  -- María fue víctima del vandalismo
(6, '89012345I');  -- Fernando fue víctima del robo de vehículos
