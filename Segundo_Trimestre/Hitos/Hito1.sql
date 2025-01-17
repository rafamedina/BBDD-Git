DROP DATABASE If exists Teatro;
CREATE DATABASE IF NOT EXISTS Teatro;
USE Teatro;

-- Tabla Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(9) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

-- Tabla Pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    total FLOAT(9,2),
    forma_pago VARCHAR(100) NOT NULL,
    fecha_alquiler DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    Estado_pedido ENUM('Alquilado', 'Devuelto') DEFAULT 'Alquilado'
);

-- Tabla Categorías
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla Productos
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio FLOAT(9,2),
    stock INT
);

-- Tabla Detalles de los pedidos
CREATE TABLE IF NOT EXISTS detalles_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    precio_unitario FLOAT(9,2),
    subtotal FLOAT(9,2),
    cantidad INT,
    id_pedido INT,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Clientes-Pedidos (Relación N:M)
CREATE TABLE IF NOT EXISTS clientes_pedidos (
    id_cliente INT,
    id_pedido INT,
    PRIMARY KEY (id_cliente, id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Categorías-Productos (Relación N:M)
CREATE TABLE IF NOT EXISTS categorias_productos (
    id_categoria INT,
    id_producto INT,
    PRIMARY KEY (id_categoria, id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Envios
CREATE TABLE IF NOT EXISTS envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    fecha_envio DATE NOT NULL,
    direccion_envio VARCHAR(255) NOT NULL,
    transportista VARCHAR(100),
    estado_envio ENUM('Pendiente', 'En tránsito', 'Entregado') DEFAULT 'Pendiente',
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido) 
        ON DELETE CASCADE ON UPDATE CASCADE
);


