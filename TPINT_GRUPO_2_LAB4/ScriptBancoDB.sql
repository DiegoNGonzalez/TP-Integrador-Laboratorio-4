CREATE DATABASE IF NOT EXISTS BancoDB;

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
    estadoUsuario bit DEFAULT 1, -- 1 es activo, 0 baja lógica
    
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
('C�rdoba'),
('Corrientes'),
('Entre R�os'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuqu�n'),
('R�o Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santa Fe'),
('Santiago del Estero'),
('Tierra del Fuego'),
('Tucum�n');

INSERT INTO localidades (idProvincia, localidad) VALUES
(1, 'La Plata'), (1, 'Mar del Plata'),
(2, 'Capital Federal'),
(3, 'San Fernando del Valle de Catamarca'), (3, 'Bel�n'),
(4, 'Resistencia'), (4, 'Barranqueras'),
(5, 'Rawson'), (5, 'Trelew'),
(6, 'C�rdoba'), (6, 'Villa Carlos Paz'),
(7, 'Corrientes'), (7, 'Goya'),
(8, 'Paran�'), (8, 'Concordia'),
(9, 'Formosa'), (9, 'Clorinda'),
(10, 'San Salvador de Jujuy'), (10, 'Palpal�'),
(11, 'Santa Rosa'), (11, 'General Pico'),
(12, 'La Rioja'), (12, 'Chilecito'),
(13, 'Mendoza'), (13, 'San Rafael'),
(14, 'Posadas'), (14, 'Ober�'),
(15, 'Neuqu�n'), (15, 'San Mart�n de los Andes'),
(16, 'Viedma'), (16, 'Bariloche'),
(17, 'Salta'), (17, 'Cafayate'),
(18, 'San Juan'), (18, 'Caucete'),
(19, 'San Luis'), (19, 'Villa Mercedes'),
(20, 'R�o Gallegos'), (20, 'Caleta Olivia'),
(21, 'Santa Fe'), (21, 'Rosario'),
(22, 'Santiago del Estero'), (22, 'La Banda'),
(23, 'Ushuaia'), (23, 'R�o Grande'),
(24, 'San Miguel de Tucum�n'), (24, 'Concepci�n');


INSERT INTO tiposUsuarios (tipoUsuario) VALUES
('Administrador'),
('Cliente');


INSERT INTO tiposCuentas (tipoCuenta) VALUES
('Caja de Ahorro'),
('Caja de Ahorro D�lares'),
('Cuenta Corriente');

INSERT INTO tiposMovimientos (tipoMovimiento) VALUES
('Alta de Cuenta'),
('Alta de Pr�stamo'),
('Pago de Pr�stamo'),
('Transferencia Acreditada'),
('Transferencia Debitada');





CREATE TABLE clientes (
    idCliente int primary key auto_increment,
    idUsuario int NOT NULL,
    dni varchar(10) UNIQUE NOT NULL,
    cuil varchar(15) UNIQUE NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
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
('cliente', 'cliente', 2, 1);

INSERT INTO clientes (idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad, estado) VALUES
(2,37719580,23377195809,'Franco','Cataldo','francocataldo7@gmail.com',47555680,'M',1,'1992-10-12','Libres del Sud 523',1,2,true);

INSERT INTO cuentas (idCliente, idTipoCuenta, fechaCreacion, numeroCuenta, cbu, saldo, estadoCuenta) VALUES
(1, 1, '2024-11-13', 123456789, 987654321, 10000.0, true);

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
        -- En caso de error, revertir la transacci�n
        ROLLBACK;

        -- Re-levantar el error para que sea capturado en Java
        RESIGNAL;
    END;

    -- Inicio de la transacci�n
    START TRANSACTION;

    -- Generamos el usuario
    INSERT INTO usuarios (nombreUsuario, contrasenia, tipoUsuario, estadoUsuario)
    VALUES (nombreUsuario,contrasenia,tipoUsuario,1);
    
    SET idUsuario = LAST_INSERT_ID();
    
    INSERT INTO clientes(idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad, estado)
    VALUES (idUsuario, dni, cuil, nombre, apellido, email, telefono, sexo, idNacionalidad, fechaNacimiento, direccion, idProvincia, idLocalidad, estado);

    -- Confirmaci�n de la transacci�n
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

    -- Inicio de la transacci�n
    START TRANSACTION;

    -- Baja l�gica del cliente
    UPDATE clientes
    SET estado = 0
    WHERE idCliente = p_idCliente;

    -- Baja l�gica de las cuentas del cliente
    UPDATE cuentas
    SET estadoCuenta = 0
    WHERE idCliente = p_idCliente;

    -- Baja l�gica del usuario relacionado al cliente
    UPDATE usuarios
    SET estadoUsuario = 0
    WHERE idUsuario = (SELECT idUsuario FROM clientes WHERE idCliente = p_idCliente);

    -- Confirmaci�n de la transacci�n
    COMMIT;
END //

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE spRegistrarTransferencia(
    IN cbuDestino bigint,
    IN cbuOrigen bigint,
    IN importe DECIMAL(14, 2),
    IN concepto VARCHAR(50)
)
BEGIN
    
    DECLARE saldo DECIMAL(14, 2);
    
    -- manejo de errores
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
        -- Revertir la transacci�n en caso de error
        ROLLBACK;

        -- Re-levantar el error para que sea capturado en la aplicaci�n
        RESIGNAL;
    END;

    -- transacci�n
    START TRANSACTION;

    -- Verificamos que cbuOrigen y cbuDestino no sean iguales
    IF cbuOrigen = cbuDestino THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuenta de origen y la cuenta de destino no pueden ser iguales';
    END IF;
    
    -- Verificamos que tenga saldo suficiente y exista la cuenta
	IF EXISTS (SELECT 1 FROM cuentas WHERE cbu = cbuOrigen AND estadoCuenta = 1) THEN
		SELECT saldo INTO saldo FROM cuentas WHERE cbu = cbuOrigen;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO EXISTE LA CUENTA ORIGEN';
	END IF;


	-- Verificamos si posee saldo suficiente para la transferencia.
	IF saldo - importe < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO SE PUEDE REALIZAR LA TRANSFERENCIA, SALDO INSUFICIENTE';
	END IF;

	IF NOT EXISTS (SELECT 1 FROM cuentas WHERE cbu = cbuDestino AND estadoCuenta = 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO EXISTE LA CUENTA DESTINO';
	END IF;

	-- Registramos el movimiento cbuOrigen
    INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento)
    VALUES(cbuOrigen, 5, NOW(), concepto, importe);
     
     -- Verificamos si se insert� alguna fila
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar el movimiento en la cuenta origen';
	END IF;
     
	-- Registramos el movimiento cbuDestino
    INSERT INTO movimientos (idCuenta, idTipoMovimiento, fechaMovimiento, concepto, importeMovimiento)
    VALUES(cbuDestino, 4, NOW(), concepto, importe);

	-- Verificamos si se insert� alguna fila
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo registrar el movimiento en la cuenta destino';
	END IF;

	-- actualizacion saldo en cuenta origen. resta.
    UPDATE cuentas SET saldo = saldo - importe WHERE cbu = cbuOrigen;
    
    -- Verificamos si se actualiz� saldo en origen
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontr� la cuenta origen para actualizar';
	END IF;
    
    
    -- actualizacion saldo en cuenta destino. suma.
    UPDATE cuentas SET saldo = saldo + importe WHERE cbu = cbuDestino;
    
	-- Verificamos si se actualiz� saldo en destino
	IF ROW_COUNT() = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontr� la cuenta destino para actualizar';
	END IF;

    COMMIT;
END$$

DELIMITER ;
