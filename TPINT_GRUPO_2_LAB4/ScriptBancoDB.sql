CREATE DATABASE IF NOT EXISTS BancoDB;
USE BancoDB;
-- Tabla Usuarios
CREATE TABLE Usuarios (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(30) NOT NULL UNIQUE,
contraseña VARCHAR(255) NOT NULL,
activo BOOLEAN,
administrador BOOLEAN
);
-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    DNI VARCHAR(20) NOT NULL UNIQUE,
    CUIL VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    nacionalidad VARCHAR(50),
    fecha_nacimiento DATE,
    direccion VARCHAR(100),
    localidad VARCHAR(50),
    provincia VARCHAR(50),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20),
    activo BOOLEAN,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
-- Tabla Cuentas
CREATE TABLE Cuentas (
    id_cuenta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    tipo_cuenta ENUM('ahorro', 'corriente') NOT NULL,
    numero_cuenta VARCHAR(20) NOT NULL UNIQUE,
    CBU VARCHAR(22) NOT NULL UNIQUE,
    saldo DECIMAL(15,2) DEFAULT 10000.0,
    activo BOOLEAN,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT chk_saldo CHECK (saldo > 0)
);

-- Tabla Prestamos
CREATE TABLE Prestamos (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_cuenta INT NOT NULL,
    fecha_alta DATE NOT NULL,
    importe_pedido DECIMAL(15,2) NOT NULL,
    plazo_meses INT NOT NULL,
    importe_mensual DECIMAL(15,2) NOT NULL,
    cantidad_cuotas INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_cuenta) REFERENCES Cuentas(id_cuenta)
);

-- Tabla Cuotas
CREATE TABLE Cuotas (
    id_cuota INT PRIMARY KEY AUTO_INCREMENT,
    id_prestamo INT NOT NULL,
    numero_cuota INT NOT NULL,
    monto DECIMAL(15,2) NOT NULL,
    fecha_pago DATE,
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo)
);

-- Tabla Movimientos
CREATE TABLE Movimientos (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_cuenta INT NOT NULL,
    fecha DATE NOT NULL,
    detalle VARCHAR(100),
    importe DECIMAL(15,2) NOT NULL,
    tipo_movimiento ENUM('debito', 'credito') NOT NULL,
    FOREIGN KEY (id_cuenta) REFERENCES Cuentas(id_cuenta)
);
