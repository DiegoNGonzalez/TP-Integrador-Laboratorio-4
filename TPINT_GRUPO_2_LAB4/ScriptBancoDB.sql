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
(8, 'Paraná'), (8, 'Concordia'),
(9, 'Formosa'), (9, 'Clorinda'),
(10, 'San Salvador de Jujuy'), (10, 'Palpalá'),
(11, 'Santa Rosa'), (11, 'General Pico'),
(12, 'La Rioja'), (12, 'Chilecito'),
(13, 'Mendoza'), (13, 'San Rafael'),
(14, 'Posadas'), (14, 'Oberá'),
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
('Caja de Ahorro Dolares'),
('Cuenta Corriente');

INSERT INTO tiposMovimientos (tipoMovimiento) VALUES
('Alta de Cuenta'),
('Alta de Préstamo'),
('Pago de Préstamo'),
('Transferencia Acreditada'),
('Transferencia Debitada');

INSERT INTO usuarios (nombreUsuario, contrasenia, tipoUsuario, estadoUsuario) VALUES
('admin', 'admin', 1, 1),
('cliente', 'cliente', 2, 1);



CREATE TABLE clientes (
	idCliente int primary key auto_increment,
    idUsuario int NOT NULL,
    dni varchar(10) UNIQUE NOT NULL,
    cuil varchar(15) UNIQUE NOT NULL,
    nombre varchar(15) NOT NULL,
    apellido varchar(25) NOT NULL,
    email varchar(40) NOT NULL,
    telefono varchar(15) NOT NULL,
    sexo char(1) NOT NULL,
    idNacionalidad int NOT NULL,
    fechaNacimiento date NOT NULL,
    direccion varchar(30) NOT NULL,
    idProvincia int NOT NULL,
    idLocalidad int NOT NULL,
    
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
    cbu varchar(22) UNIQUE NOT NULL,
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
