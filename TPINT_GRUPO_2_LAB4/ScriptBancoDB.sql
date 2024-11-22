Create schema `bancoDB` default character set utf8 collate utf8_bin;

USE BancoDB;



CREATE TABLE provincias (
    idProvincia int primary key auto_increment,
    provincia varchar(50) unique not null
);

CREATE TABLE localidades (
    idLocalidad int primary key auto_increment,
    idProvincia int  not null,
    localidad varchar(50) unique not null,
    
    foreign key (idProvincia) references provincias(idProvincia)
);
CREATE TABLE nacionalidades (
    idNacionalidad int primary key auto_increment,
    nacionalidad varchar(30) unique not null
);

CREATE TABLE tiposUsuarios (
    idTipoUsuario int primary key auto_increment,
    tipoUsuario varchar(20) UNIQUE
);

CREATE TABLE tiposCuentas (
    idTipoCuenta int primary key auto_increment,
    tipoCuenta varchar(25) UNIQUE
);

CREATE TABLE tiposMovimientos (
    idTipoMovimiento int primary key auto_increment,
    tipoMovimiento varchar(25) UNIQUE
);

CREATE TABLE usuarios (
    idUsuario int primary key auto_increment,
    nombreUsuario varchar(50) UNIQUE NOT NULL,
    contrasenia varchar(20) NOT NULL,
    tipoUsuario int NOT NULL,
    estadoUsuario bit DEFAULT 1, -- 1 es activo, 0 baja lÃ³gica
    
    FOREIGN KEY (tipoUsuario) REFERENCES tiposUsuarios(idTipoUsuario)
    
);



-- inserts

INSERT INTO nacionalidades (nacionalidad) VALUES
('Argentina'),
('Boliviana'),
('Brasilera'),
('Chilena'),
('Paraguaya'),
('Peruana'),
('Venezolana'),
('Uruguaya');


INSERT INTO provincias ( provincia) VALUES
('Buenos Aires'),
('Ciudad autonoma de Buenos Aires'),
('Catamarca'),
('Chaco'),
('Chubut'),
('Córdoba'),
('Corrientes'),
('Entre Ríos'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuquén'),
('Río Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santa Fe'),
('Santiago del Estero'),
('Tierra del Fuego'),
('Tucumán');

INSERT INTO localidades (idProvincia, localidad) VALUES
(1, 'La Plata'), (1, 'Mar del Plata'),
(2, 'Capital Federal'),
(3, 'San Fernando del Valle de Catamarca'), (3, 'Belén'),
(4, 'Resistencia'), (4, 'Barranqueras'),
(5, 'Rawson'), (5, 'Trelew'),
(6, 'Córdoba'), (6, 'Villa Carlos Paz'),
(7, 'Corrientes'), (7, 'Goya'),
(8, 'Paraná¡'), (8, 'Concordia'),
(9, 'Formosa'), (9, 'Clorinda'),
(10, 'San Salvador de Jujuy'), (10, 'Palpalá'),
(11, 'Santa Rosa'), (11, 'General Pico'),
(12, 'La Rioja'), (12, 'Chilecito'),
(13, 'Mendoza'), (13, 'San Rafael'),
(14, 'Posadas'), (14, 'Oberá¡'),
(15, 'Neuquén'), (15, 'San Martín de los Andes'),
(16, 'Viedma'), (16, 'Bariloche'),
(17, 'Salta'), (17, 'Cafayate'),
(18, 'San Juan'), (18, 'Caucete'),
(19, 'San Luis'), (19, 'Villa Mercedes'),
(20, 'Río Gallegos'), (20, 'Caleta Olivia'),
(21, 'Santa Fe'), (21, 'Rosario'),
(22, 'Santiago del Estero'), (22, 'La Banda'),
(23, 'Ushuaia'), (23, 'Río Grande'),
(24, 'San Miguel de Tucumán'), (24, 'Concepción');


INSERT INTO tiposUsuarios (tipoUsuario) VALUES
('Administrador'),
('Cliente');


INSERT INTO tiposCuentas (tipoCuenta) VALUES
('Caja de Ahorro'),
('Cuenta Corriente');

INSERT INTO tiposMovimientos (tipoMovimiento) VALUES
('Alta de Cuenta'),
('Alta de Préstamo'),
('Pago de Préstamo'),
('Transferencia Acreditada'),
('Transferencia Debitada');





CREATE TABLE clientes (
    idCliente int primary key auto_increment,
    idUsuario int NOT NULL,
    dni varchar(10) UNIQUE NOT NULL,
    cuil varchar(15) UNIQUE NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    email varchar(100) NOT NULL unique,
    telefono varchar(15) NOT NULL,
    sexo char(1) NOT NULL,
    idNacionalidad int NOT NULL,
    fechaNacimiento date NOT NULL,
    direccion varchar(100) NOT NULL,
    idProvincia int NOT NULL,
    idLocalidad int NOT NULL,
    estado bit DEFAULT 1,
    
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idNacionalidad) REFERENCES nacionalidades(idNacionalidad),
    FOREIGN KEY (idProvincia) REFERENCES provincias(idProvincia),
    FOREIGN KEY (idLocalidad) REFERENCES localidades(idLocalidad)
);

CREATE TABLE cuentas (
    idCuenta int primary key auto_increment,
    idcliente int NOT NULL,
    idTipoCuenta int NOT NULL,
    fechaCreacion date NOT NULL,
    numeroCuenta bigint UNIQUE NOT NULL,
    cbu bigint UNIQUE NOT NULL,
    saldo decimal(14, 2) NOT NULL default 10000.0,
    estadoCuenta bit DEFAULT 1,
    
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idTipoCuenta) REFERENCES tiposCuentas(idTipoCuenta),
    
    CONSTRAINT CHK_Saldo_Positivo CHECK(saldo>=0)
);


CREATE TABLE movimientos (
    idMovimiento  int primary key auto_increment,
    idCuenta int NOT NULL,
    idTipoMovimiento int NOT NULL,
    fechaMovimiento date NOT NULL,
    concepto varchar(50) NOT NULL,
    importeMovimiento decimal(14, 2) NOT NULL,
    
    FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta),
    FOREIGN KEY (idTipoMovimiento) REFERENCES tiposMovimientos(idTipoMovimiento)
);

CREATE TABLE prestamos (
    idPrestamo int primary key auto_increment,
    idCliente int NOT NULL,
    idCuenta int NOT NULL,
    fechaAltaPrestamo date NOT NULL,
    importePrestamoSolicitado decimal(14, 2) NOT NULL,
    importePrestamo decimal(14, 2) NOT NULL,
    mesesPlazo int NOT NULL,
    importeCuota decimal(14, 2) NOT NULL,
    cantidadCuotas int NOT NULL,
    EstadoPrestamo varchar(50) NOT NULL,
    
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idCuenta) REFERENCES cuentas(idcuenta)
    
);

CREATE TABLE cuotas (
    idCuota int primary key auto_increment,
    idPrestamo int NOT NULL,
    numeroCuota int NOT NULL,
    montoPagado decimal(14, 2) NULL,
    fechaPago date NULL,
    estadoPago bit DEFAULT 0, -- 0 sin pagar, 1 ya pagado
    
    FOREIGN KEY (idPrestamo) REFERENCES prestamos(idPrestamo)
);

INSERT INTO usuarios (nombreUsuario, contrasenia, tipoUsuario, estadoUsuario) VALUES
('admin', 'admin', 1, 1),
('cliente', 'cliente', 2, 1),
('ana.martinez', 'ana1234', 2, 1),
('carlos.perez', 'carlos1234', 2, 1),
('lucia.gomez', 'lucia1234', 2, 1),
('miguel.rodriguez', 'miguel1234', 2, 1),
('sofia.hernandez', 'sofia1234', 2, 1),
('diego.lopez', 'diego1234', 2, 1),
('maria.fernandez', 'maria1234', 2, 1),
('jorge.ruiz', 'jorge1234', 2, 1),
('laura.alvarez', 'laura1234', 2, 1),
('facundo.gimenez', 'facundo1234', 2, 1);

INSERT INTO clientes (idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad, estado) VALUES
(2,37719580,'23-37719580-9','Franco','Cataldo','francocataldo7@gmail.com',47555680,'M',1,'1992-10-12','Libres del Sud 523',1,2,true),
(3, 32589746, '20-32589746-9', 'Ana', 'Martínez', 'ana.martinez@gmail.com', 1154327890, 'F', 2, '1988-04-15', 'Calle Siempre Viva 123', 2, 3, true),
(4, 40325987, '27-40325987-6', 'Carlos', 'Pérez', 'carlos.perez@gmail.com', 1123456789, 'M', 1, '1995-08-21', 'Av. Principal 456', 3, 4, true),
(5, 38451236, '27-38451236-9', 'Lucía', 'Gómez', 'lucia.gomez@gmail.com', 1145678901, 'F', 1, '1990-12-30', 'Diagonal Norte 789', 4, 5, true),
(6, 29674583, '20-29674583-6', 'Miguel', 'Rodríguez', 'miguel.rodriguez@gmail.com', 1156789012, 'M', 3, '1982-07-10', 'Calle Central 234', 5, 6, true),
(7, 34526789, '20-34526789-9', 'Sofía', 'Hernández', 'sofia.hernandez@gmail.com', 1134567890, 'F', 2, '1985-09-17', 'Pasaje Sur 567', 1, 2, true),
(8, 41234567, '27-41234567-6', 'Diego', 'López', 'diego.lopez@gmail.com', 1156789123, 'M', 3, '1997-05-25', 'Av. Libertador 789', 2, 3, true),
(9, 35678912, '20-35678912-4', 'María', 'Fernández', 'maria.fernandez@gmail.com', 1167890123, 'F', 1, '1991-11-09', 'Calle Oeste 123', 3, 4, true),
(10, 29876543, '20-29876543-6', 'Jorge', 'Ruiz', 'jorge.ruiz@gmail.com', 1143210987, 'M', 2, '1980-03-14', 'Pasaje Norte 456', 4, 5, true),
(11, 40789012, '27-40789012-5', 'Laura', 'Álvarez', 'laura.alvarez@gmail.com', 1123459087, 'F', 3, '1994-06-28', 'Diagonal Sur 789', 5, 6, true),
(12, 36985214, '27-36985214-7', 'Facundo', 'Giménez', 'facundo.gimenez@gmail.com', 1134210987, 'M', 1, '1992-02-18', 'Calle Este 345', 1, 2, true);

INSERT INTO cuentas (idCliente, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta) VALUES
(1, 1, '2024-11-13', 123456789, 987654321, 10000.0, true),
(2, 2, '2024-11-15', 223456789, 1122334455, 20000.0, true),
(2, 1, '2024-11-15', 223456788, 1122334456, 20000.0, true),
(3, 1, '2024-11-14', 323456789, 2233445566, 15000.0, true),
(4, 2, '2024-11-13', 423456789, 3344556677, 18000.0, true),
(5, 1, '2024-11-12', 523456789, 4455667788, 12000.0, true),
(6, 1, '2024-11-11', 623456789, 5566778899, 25000.0, true),
(7, 1, '2024-11-10', 723456789, 6677889900, 8000.0, true),
(8, 2, '2024-11-09', 823456789, 7788990011, 30000.0, true),
(9, 1, '2024-11-08', 923456789, 8899001122, 17000.0, true),
(10, 2, '2024-11-07', 1023456789, 9900112233, 22000.0, true),
(11, 2, '2024-11-06', 1123456789, 1001223344, 14000.0, true);

-- Movimientos para el cliente 3 (Ana Martínez)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(2, 1, '2024-11-13', 'Apertura de cuenta', 20000.00),
(2, 4, '2024-11-14', 'Transferencia recibida', 5000.00),
(2, 5, '2024-11-15', 'Transferencia enviada', -3000.00),
(2, 2, '2024-11-16', 'Préstamo otorgado', 15000.00),
(2, 3, '2024-11-17', 'Pago parcial de préstamo', -5000.00);

-- Movimientos para el cliente 4 (Carlos Pérez)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(3, 1, '2024-11-13', 'Apertura de cuenta', 15000.00),
(3, 4, '2024-11-14', 'Transferencia recibida', 3000.00),
(3, 5, '2024-11-15', 'Transferencia enviada', -2000.00),
(3, 2, '2024-11-16', 'Préstamo otorgado', 10000.00),
(3, 3, '2024-11-17', 'Pago parcial de préstamo', -3000.00);

-- Movimientos para el cliente 5 (Lucía Gómez)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(4, 1, '2024-11-13', 'Apertura de cuenta', 18000.00),
(4, 4, '2024-11-14', 'Transferencia recibida', 4000.00),
(4, 5, '2024-11-15', 'Transferencia enviada', -2500.00),
(4, 2, '2024-11-16', 'Préstamo otorgado', 20000.00),
(4, 3, '2024-11-17', 'Pago parcial de préstamo', -6000.00);

-- Movimientos para el cliente 6 (Miguel Rodríguez)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(5, 1, '2024-11-13', 'Apertura de cuenta', 12000.00),
(5, 4, '2024-11-14', 'Transferencia recibida', 2000.00),
(5, 5, '2024-11-15', 'Transferencia enviada', -1500.00),
(5, 2, '2024-11-16', 'Préstamo otorgado', 8000.00),
(5, 3, '2024-11-17', 'Pago parcial de préstamo', -2000.00);

-- Movimientos para el cliente 7 (Sofía Hernández)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(6, 1, '2024-11-13', 'Apertura de cuenta', 25000.00),
(6, 4, '2024-11-14', 'Transferencia recibida', 6000.00),
(6, 5, '2024-11-15', 'Transferencia enviada', -4000.00),
(6, 2, '2024-11-16', 'Préstamo otorgado', 18000.00),
(6, 3, '2024-11-17', 'Pago parcial de préstamo', -7000.00);

-- Movimientos para el cliente 8 (Diego López)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(7, 1, '2024-11-13', 'Apertura de cuenta', 8000.00),
(7, 4, '2024-11-14', 'Transferencia recibida', 3000.00),
(7, 5, '2024-11-15', 'Transferencia enviada', -2000.00),
(7, 2, '2024-11-16', 'Préstamo otorgado', 10000.00),
(7, 3, '2024-11-17', 'Pago parcial de préstamo', -5000.00);

-- Movimientos para el cliente 9 (María Fernández)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(8, 1, '2024-11-13', 'Apertura de cuenta', 30000.00),
(8, 4, '2024-11-14', 'Transferencia recibida', 8000.00),
(8, 5, '2024-11-15', 'Transferencia enviada', -5000.00),
(8, 2, '2024-11-16', 'Préstamo otorgado', 25000.00),
(8, 3, '2024-11-17', 'Pago parcial de préstamo', -9000.00);

-- Movimientos para el cliente 10 (Jorge Ruiz)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(9, 1, '2024-11-13', 'Apertura de cuenta', 17000.00),
(9, 4, '2024-11-14', 'Transferencia recibida', 2000.00),
(9, 5, '2024-11-15', 'Transferencia enviada', -1000.00),
(9, 2, '2024-11-16', 'Préstamo otorgado', 12000.00),
(9, 3, '2024-11-17', 'Pago parcial de préstamo', -4000.00);

-- Movimientos para el cliente 11 (Laura Álvarez)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(10, 1, '2024-11-13', 'Apertura de cuenta', 22000.00),
(10, 4, '2024-11-14', 'Transferencia recibida', 5000.00),
(10, 5, '2024-11-15', 'Transferencia enviada', -3000.00),
(10, 2, '2024-11-16', 'Préstamo otorgado', 15000.00),
(10, 3, '2024-11-17', 'Pago parcial de préstamo', -6000.00);

-- Movimientos para el cliente 12 (Facundo Giménez)
INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento) VALUES
(11, 1, '2024-11-13', 'Apertura de cuenta', 14000.00),
(11, 4, '2024-11-14', 'Transferencia recibida', 7000.00),
(11, 5, '2024-11-15', 'Transferencia enviada', -4000.00),
(11, 2, '2024-11-16', 'Préstamo otorgado', 20000.00),
(11, 3, '2024-11-17', 'Pago parcial de préstamo', -8000.00);

INSERT INTO prestamos (idCliente, idCuenta, fechaAltaPrestamo, importePrestamoSolicitado ,importePrestamo, mesesPlazo, importeCuota, cantidadCuotas, EstadoPrestamo)
VALUES
(2, 2, '2024-11-16', 5000.00 ,5000.00, 12, 450.00, 12, 'Activo'),
(3, 3, '2024-11-10', 5000.00 ,3000.00, 6, 500.00, 6, 'Pendiente'),
(4, 3, '2024-11-10', 5000.00, 3000.00, 6, 500.00, 6, 'Rechazado');

DELIMITER //

CREATE PROCEDURE spAgregarCliente(
	-- CLIENTE
    IN dni varchar(10),
    IN cuil varchar(15),
    IN nombre VARCHAR(50),
    IN apellido VARCHAR(50),
    IN email varchar(100),
    IN telefono varchar(15),
    IN sexo char(1),
    IN idNacionalidad int,
    IN fechaNacimiento date,
    IN direccion varchar(100),
    IN idProvincia int,
    IN idLocalidad int,
    -- USUARIO
    IN nombreUsuario varchar(50),
    IN contrasenia varchar(20),
    IN tipoUsuario int
)
BEGIN
    DECLARE idUsuario BIGINT DEFAULT 0;

     -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- En caso de error, revertir la transacción
        ROLLBACK;

        -- Re-levantar el error para que sea capturado en Java
        RESIGNAL;
    END;

    -- Inicio de la transacción
    START TRANSACTION;

    -- Generamos el usuario
    INSERT INTO usuarios (nombreUsuario, contrasenia, tipoUsuario, estadoUsuario)
    VALUES (nombreUsuario,contrasenia,tipoUsuario,1);
    
    SET idUsuario = LAST_INSERT_ID();
    
    INSERT INTO clientes(idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad, estado)
    VALUES (idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad, estado);

    -- Confirmación de la transacción
    COMMIT;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE spBajaLogicaCliente(
    IN p_idCliente INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback en caso de error
        ROLLBACK;
    END;

    -- Inicio de la transacción
    START TRANSACTION;

    -- Baja lógica del cliente
    UPDATE clientes
    SET estado = 0
    WHERE idCliente = p_idCliente;

    -- Baja lógica de las cuentas del cliente
    UPDATE cuentas
    SET estadoCuenta = 0
    WHERE idCliente = p_idCliente;

    -- Baja lógica del usuario relacionado al cliente
    UPDATE usuarios
    SET estadoUsuario = 0
    WHERE idUsuario = (SELECT idUsuario FROM clientes WHERE idCliente = p_idCliente);

    -- Confirmación de la transacción
    COMMIT;
END //

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE spRealizarTransferencia(
    IN cbuDestino bigint,
    IN cbuOrigen bigint,
    IN importe DECIMAL(14, 2),
    IN concepto VARCHAR(50)
)
BEGIN
    DECLARE saldoOrigen DECIMAL(14, 2);
    DECLARE saldoDestiantario DECIMAL(14, 2);
	DECLARE idCuentaOrigen INT;
	DECLARE idCuentaDestino INT;
	DECLARE mensaje VARCHAR(255);
    -- manejo de errores
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
        -- Revertir la transacciÃ³n en caso de error
        ROLLBACK;

        -- Re-levantar el error para que sea capturado en la aplicaciÃ³n
        RESIGNAL;
    END;

    -- transaccion
    START TRANSACTION;

    -- Verificamos que cbuOrigen y cbuDestino no sean iguales
    IF cbuOrigen = cbuDestino THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuenta de origen y la cuenta de destino no pueden ser iguales';
    END IF;
    
    -- Verificamos que tenga saldo suficiente y exista la cuenta
	IF EXISTS (SELECT * FROM cuentas WHERE cbu = cbuOrigen AND estadoCuenta = 1) THEN
		SELECT saldo INTO saldoOrigen FROM cuentas WHERE cbu = cbuOrigen;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO EXISTE LA CUENTA ORIGEN';
	END IF;
    
	IF saldoOrigen IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO SE PUEDE REALIZAR LA TRANSFERENCIA, SALDO INSUFICIENTE';
	END IF;
	
	-- Verificamos si posee saldo suficiente para la transferencia.
	IF saldoOrigen - importe < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO SE PUEDE REALIZAR LA TRANSFERENCIA, SALDO INSUFICIENTE';
	END IF;

	IF NOT EXISTS (SELECT 1 FROM cuentas WHERE cbu = cbuDestino AND estadoCuenta = 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO EXISTE LA CUENTA DESTINO';
	END IF;

	-- Registramos el movimiento cbuOrigen
    SELECT idCuenta INTO idCuentaOrigen 
	FROM cuentas 
	WHERE cbu = cbuOrigen;
    
    INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento)
    VALUES(idCuentaOrigen, 5, NOW(), concepto, importe);
     
     -- Verificamos si se inserta alguna fila
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar el movimiento en la cuenta origen';
	END IF;
     
	-- Registramos el movimiento cbuDestino
	SELECT idCuenta, saldo 
	INTO idCuentaDestino, saldoDestiantario
	FROM cuentas 
	WHERE cbu = cbuDestino;
    
    INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento)
    VALUES(idCuentaDestino, 4, NOW(), concepto, importe);

	-- Verificamos si se inserta alguna fila
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar el movimiento en la cuenta destino';
	END IF;

	-- actualizacion saldo en cuenta origen. resta.
    UPDATE cuentas SET saldo = saldoOrigen - importe WHERE idCuenta = idCuentaOrigen;
    
    -- Verificamos si se actualiza saldo en origen
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontrÃ³ la cuenta origen para actualizar';
	END IF;
    
    
    -- actualizacion saldo en cuenta destino. suma.
    UPDATE cuentas SET saldo = saldoDestiantario + importe WHERE idCuenta = idCuentaDestino;
    
	-- Verificamos si se actualiza saldo en destino
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontrÃ³ la cuenta destino para actualizar';
	END IF;

    COMMIT;
END$$

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spAgregarCuenta(
    IN sp_idcliente int,
	IN sp_idTipoCuenta int,
	IN sp_fechaCreacion date,
	IN sp_numeroCuenta bigint,
	IN sp_cbu bigint,
	IN sp_saldo float
)
BEGIN
    DECLARE idCuenta INT DEFAULT 0;

     -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- En caso de error, revertir la transacción
        ROLLBACK;

        -- Re-levantar el error para que sea capturado en Java
        RESIGNAL;
    END;

    -- Inicio de la transacción
    START TRANSACTION;
    
	-- Verificamos que el cliente existe
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE idCliente = sp_idCliente) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El cliente especificado no existe';
    END IF;

    -- Verificamos que el tipo de cuenta existe
    IF NOT EXISTS (SELECT 1 FROM tiposcuentas WHERE idTipoCuenta = sp_idTipoCuenta) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El tipo de cuenta especificado no existe';
    END IF;

    -- Verificamos que numeroCuenta y cbu sean únicos
    IF EXISTS (SELECT 1 FROM cuentas WHERE numeroCuenta = sp_numeroCuenta) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El número de cuenta ya está en uso';
    END IF;

    IF EXISTS (SELECT 1 FROM cuentas WHERE cbu = sp_cbu) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El CBU ya está en uso';
    END IF;
    
	-- Verificamos que el saldo no sea negativo o 0.
	IF sp_saldo <= 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL SALDO DEBE SER MAYOR A 0';
	END IF;
    
    -- Generamos la cuenta
    INSERT INTO cuentas (idcliente, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta)
    VALUES (sp_idcliente, sp_idTipoCuenta, sp_fechaCreacion, sp_numeroCuenta, sp_cbu, sp_saldo, 1);
    
	-- Verificamos si se registró la cuenta
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar la nueva cuenta';
	END IF;
    
    SET idCuenta = LAST_INSERT_ID();
    
	-- Registramos el movimiento de alta
    INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento)
    VALUES(idCuenta, 1, NOW(), 'Apertura de cuenta', sp_saldo);
    
	-- Verificamos si se registró el movimiento
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar el movimiento';
	END IF;
    
    -- Confirmación de la transacción
    COMMIT;
END //

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE spAprobarPrestamo(
    IN idCuentaDestino int,
    IN idPrestamoSolicitado int,
    IN importeTotal DECIMAL(14, 2),
    IN importeCuota DECIMAL(14, 2),
    IN cantCuotas int
)
BEGIN
	DECLARE i INT DEFAULT 1; -- Contador para el bucle
	DECLARE fechaCuota DATE;

    -- manejo de errores
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
        -- Revertir la transaccion en caso de error
        ROLLBACK;

        -- Re-levantar el error para que sea capturado en la aplicaciÃ³n
        RESIGNAL;
    END;

    -- transaccion
    START TRANSACTION;
		SET fechaCuota = curdate();
		-- Verificamos que exista la cuenta
		IF NOT EXISTS (SELECT * FROM cuentas WHERE idCuenta = idCuentaDestino AND estadoCuenta = 1) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe la cuenta';
		END IF;
        
        -- Verificamos que exista el prestamo
		IF NOT EXISTS (SELECT * FROM prestamos WHERE idPrestamo = idPrestamoSolicitado) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe el prestamo';
		END IF;
                
	    -- actualizar estado prestamo a Activo
        UPDATE prestamos SET EstadoPrestamo = 'Activo' WHERE idPrestamo = idPrestamoSolicitado;
    
		-- verificamos si se actualiza estado
		IF ROW_COUNT() = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo actualizar el estado del prestamo';
		END IF;
        
        
         -- actualizacion saldo en cuenta destino. suma.
		UPDATE cuentas SET saldo = saldo + importeTotal WHERE idCuenta = idCuentaDestino;
		
		-- Verificamos si se actualiza saldo en destino
		IF ROW_COUNT() = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo actualizar el saldo en cuenta';
		END IF;

		-- agregar movimiento	
		INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento)
		VALUES(idCuentaDestino, 2, CURDATE(), 'Prestamo aprobado', importeTotal);
		 
		-- Verificamos si se inserta alguna fila
		IF ROW_COUNT() = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar el movimiento en la cuenta origen';
		END IF;
           
		-- generar cuotas
        -- Bucle para insertar las cuotas
		WHILE i <= cantCuotas DO
			SET fechaCuota = DATE_ADD(fechaCuota, INTERVAL 1 MONTH); -- Incrementar un mes por cada cuota
			
            INSERT INTO cuotas (idPrestamo, numeroCuota, montoPagado, fechaPago, estadoPago)
			VALUES (idPrestamoSolicitado, i, importeCuota, fechaCuota, 0);
			
            SET i = i + 1;
            
			-- Verificamos si se inserta alguna fila
			IF ROW_COUNT() = 0 THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se generaron las cuotas correctamente';
			END IF;
            
		END WHILE;
        
    COMMIT;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE spPagarCuota(
    IN p_IdCuota INT,
    IN p_IdCuenta INT
)
BEGIN
    DECLARE v_MontoCuota DECIMAL(10,2);
    DECLARE v_IdTipoMovimiento INT;
    DECLARE v_SaldoCuenta DECIMAL(10,2);

    -- Obtenemos el monto de la cuota
    SELECT montoPagado
    INTO v_MontoCuota
    FROM Cuotas
    WHERE IdCuota = p_IdCuota;

    -- Validamos que la cuota no esté ya pagada
    IF EXISTS (
        SELECT 1
        FROM Cuotas
        WHERE idCuota = p_IdCuota AND estadoPago = 1
    ) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'La cuota ya está pagada';
    END IF;

    -- Obtenemos el saldo actual de la cuenta
    SELECT Saldo
    INTO v_SaldoCuenta
    FROM Cuentas
    WHERE idCuenta = p_IdCuenta;

    -- Validamos que haya suficiente saldo
    IF v_SaldoCuenta < v_MontoCuota THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Saldo insuficiente en la cuenta';
    END IF;

    -- Obtenemos el ID del tipo de movimiento para 'Pago de Préstamo'
    SELECT idTipoMovimiento
    INTO v_IdTipoMovimiento
    FROM tiposMovimientos
    WHERE tipoMovimiento = 'Pago de Préstamo';

   
    START TRANSACTION;

    -- Actualizamos el estado de la cuota a pagada
    UPDATE Cuotas
    SET estadoPago = 1
    WHERE idCuota = p_IdCuota;

    -- Descontamos el monto del saldo de la cuenta
    UPDATE Cuentas
    SET Saldo = Saldo - v_MontoCuota
    WHERE idCuenta = p_IdCuenta;

    -- Registramos el movimiento negativo en la cuenta
    INSERT INTO Movimientos (IdCuenta, idTipoMovimiento, importeMovimiento, Concepto, fechaMovimiento)
    VALUES (
        p_IdCuenta, 
        v_IdTipoMovimiento, 
        v_MontoCuota, 
        'Pago cuota préstamo', 
        NOW()
    );

    
    COMMIT;
END$$

DELIMITER ;