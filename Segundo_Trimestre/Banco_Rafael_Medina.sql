DROP DATABASE IF EXISTS Banco;
CREATE DATABASE IF NOT EXISTS Banco;
USE Banco;

-- Crear tabla de cuentas si no existe
CREATE TABLE IF NOT EXISTS cuentas (
    id_cuenta INT PRIMARY KEY, 
    nombre_cliente VARCHAR(50) NOT NULL,  
    saldo DECIMAL(10, 2) NOT NULL  
);

-- Crear tabla de auditoría si no existe
CREATE TABLE IF NOT EXISTS auditoria (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,  
    cuenta_id INT NOT NULL, 
    saldo_anterior DECIMAL(10, 2) NOT NULL,  
    saldo_actual DECIMAL(10, 2) NOT NULL,  
    fecha DATETIME NOT NULL, 
    FOREIGN KEY (cuenta_id) REFERENCES cuentas(id_cuenta)  
);

-- Insertar datos de ejemplo en la tabla de cuentas
INSERT INTO cuentas (id_cuenta, nombre_cliente, saldo) VALUES
(1, 'Juan Pérez', 1500.00),
(2, 'María López', 2500.00),
(3, 'Carlos Sánchez', 3000.00);

-- Insertar datos de ejemplo en la tabla de auditoría
INSERT INTO auditoria (cuenta_id, saldo_anterior, saldo_actual, fecha) VALUES
(1, 1500.00, 1400.00, '2025-01-22 10:00:00'),
(2, 2500.00, 2600.00, '2025-01-22 11:00:00'),
(3, 3000.00, 2900.00, '2025-01-22 12:00:00');

-- Crear una función que obtiene el saldo de una cuenta
DELIMITER $$
CREATE FUNCTION ObtenerSaldo(id_cuenta INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE saldo_actual DECIMAL(10, 2);  -- Variable para almacenar el saldo de la cuenta

    -- Obtener el saldo de la cuenta y asignarlo a la variable saldo_actual
    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE cuentas.id_cuenta = id_cuenta;

    -- Retornar el saldo obtenido
    RETURN saldo_actual;
END $$
DELIMITER ; 

-- Llamar a la función para obtener el saldo de la cuenta con id 1
SELECT ObtenerSaldo(1) AS SaldoCuenta1;

-- Crear un trigger que registre las actualizaciones de saldo en la tabla de auditoría
DELIMITER $$
CREATE TRIGGER RegistrarAuditoria 
AFTER UPDATE ON cuentas
FOR EACH ROW
BEGIN
    -- Insertar una nueva entrada en la tabla de auditoría cada vez que se actualice el saldo de una cuenta
    INSERT INTO auditoria (cuenta_id, saldo_anterior, saldo_actual, fecha)
    VALUES (NEW.id_cuenta, OLD.saldo, NEW.saldo, NOW());
END $$
DELIMITER ; 

/*
-- Comandos comentados de ejemplo para probar el trigger
SELECT * FROM cuentas;

SELECT * FROM auditoria;

-- Actualizar el saldo de la cuenta 1 y verificar la auditoría
UPDATE cuentas
SET saldo = 1200.00
WHERE id_cuenta = 1;

SELECT * FROM auditoria;
*/

-- Crear un procedimiento para realizar transferencias seguras entre cuentas
DELIMITER $$
CREATE PROCEDURE TransferenciaSegura(
    IN cuenta_origen INT,  -- Cuenta desde la que se realiza la transferencia
    IN cuenta_destino INT,  -- Cuenta a la que se transfiere el monto
    IN monto DECIMAL(10, 2)  -- Monto a transferir
)
BEGIN
    DECLARE saldo_origen DECIMAL(10, 2);  -- Variable para almacenar el saldo de la cuenta de origen
    DECLARE cuenta_existente INT;  -- Variable para verificar si la cuenta de destino existe

    -- Iniciar una transacción para asegurar la integridad de los datos
    START TRANSACTION;

    -- Validar que la cuenta de origen tiene suficiente saldo
    SELECT saldo INTO saldo_origen
    FROM cuentas
    WHERE id_cuenta = cuenta_origen;

    -- Si no se encuentra la cuenta de origen, generar un error
    IF saldo_origen IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuenta de origen no existe.';
    END IF;

    -- Si el saldo de la cuenta de origen es menor que el monto a transferir, generar un error
    IF saldo_origen < monto THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Saldo insuficiente en la cuenta de origen.';
    END IF;

    -- Validar que la cuenta de destino existe
    SELECT COUNT(*) INTO cuenta_existente
    FROM cuentas
    WHERE id_cuenta = cuenta_destino;

    -- Si la cuenta de destino no existe, generar un error
    IF cuenta_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuenta de destino no existe.';
    END IF;

    -- Realizar la transferencia: descontar el monto de la cuenta de origen
    UPDATE cuentas
    SET saldo = saldo - monto
    WHERE id_cuenta = cuenta_origen;

    -- Agregar el monto a la cuenta de destino
    UPDATE cuentas
    SET saldo = saldo + monto
    WHERE id_cuenta = cuenta_destino;

    -- Confirmar la transacción
    COMMIT;
END $$
DELIMITER ;

-- Comandos comentados de ejemplo para probar el procedimiento
/*
SELECT * FROM cuentas;

-- Llamar al procedimiento para realizar una transferencia de 500 a la cuenta 2
CALL TransferenciaSegura(1, 2, 500.00);

SELECT * FROM cuentas;

-- Verificar auditoría después de la transferencia
SELECT * FROM auditoria;
*/

-- Probar la transferencia segura y la auditoría
SELECT * FROM cuentas;

CALL TransferenciaSegura(1, 2, 500.00);

SELECT * FROM cuentas;

SELECT * FROM auditoria;

-- Intentar una transferencia con saldo insuficiente
CALL TransferenciaSegura(1, 2, 2000.00);

SELECT * FROM cuentas;

SELECT * FROM auditoria;


