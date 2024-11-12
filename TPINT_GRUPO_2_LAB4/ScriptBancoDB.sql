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