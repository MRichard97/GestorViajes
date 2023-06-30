CREATE DATABASE GestionViajes
USE GestionViajes

CREATE TABLE Roles(
    rolId INT IDENTITY(1,1) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_rolId PRIMARY KEY(rolId)
)

CREATE TABLE Sucursales(
    sucursalId INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(250) NOT NULL,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_sucursalId PRIMARY KEY(sucursalId)
)

CREATE TABLE Transportistas(
    transportistaId INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    identidad VARCHAR(13) NOT NULL,
    telefono VARCHAR(13) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    tarifa DECIMAL(10,2) NOT NULL,
    estado TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_transportistaId PRIMARY KEY(transportistaId),
    CONSTRAINT UQ_correo_Transportistas UNIQUE(correo),
    CONSTRAINT UQ_identidad_Transportistas UNIQUE(identidad)
)

CREATE TABLE Colaboradores(
    colaboradorId INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    identidad VARCHAR(13) NOT NULL,
    telefono VARCHAR(13) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    direccion VARCHAR(250) NOT NULL,
    estado TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_colaboradorId PRIMARY KEY(colaboradorId),
    CONSTRAINT UQ_correo_Colaboradores UNIQUE(correo),
    CONSTRAINT UQ_identidad_Colaboradores UNIQUE(identidad)
)

CREATE TABLE Usuarios(
    usuarioId INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    identidad VARCHAR(13) NOT NULL,
    telefono VARCHAR(13) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    contrasena VARCHAR(120) NOT NULL,
    rolId INT NOT NULL,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_usuarioId PRIMARY KEY(usuarioId),
    CONSTRAINT FK_Roles_Usuarios FOREIGN KEY(rolId) REFERENCES Roles(rolId),
    CONSTRAINT UQ_correo_Usuarios UNIQUE(correo),
    CONSTRAINT UQ_identidad_Usuarios UNIQUE(identidad)
)

CREATE TABLE Asignaciones(
    asignacionId INT IDENTITY(1,1) NOT NULL,
    distancia DECIMAL(4,2) NOT NULL,
    colaboradorId INT NOT NULL,
    sucursalId INT NOT NULL,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_asignacionId PRIMARY KEY(asignacionId),
    CONSTRAINT FK_Colaboradores_Asignaciones FOREIGN KEY(colaboradorId) REFERENCES Colaboradores(colaboradorId),
    CONSTRAINT FK_Sucursales_Asignaciones FOREIGN KEY(sucursalId) REFERENCES Sucursales(sucursalId)
)

CREATE TABLE Viajes(
    viajeId INT IDENTITY(1,1) NOT NULL,
    fecha DATETIME NOT NULL,
    distancia DECIMAL(4,2) NOT NULL,
    transportistaId INT NOT NULL,
    usuarioId INT NOT NULL,
    asignacionId INT NOT NULL,
    createdAt DATETIME NOT NULL DEFAULT GETDATE(),
    updateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_viajeId PRIMARY KEY(viajeId),
    CONSTRAINT FK_Transportistas_Viajes FOREIGN KEY(transportistaId) REFERENCES Transportistas(transportistaId),
    CONSTRAINT FK_Usuarios_Viajes FOREIGN KEY(usuarioId) REFERENCES Usuarios(usuarioId),
    CONSTRAINT FK_Asignaciones_Viajes FOREIGN KEY(asignacionId) REFERENCES Asignaciones(asignacionId)
)

-- Datos de prueba para la tabla Roles
INSERT INTO Roles (rol, createdAt, updateAt) VALUES
('Administrador', GETDATE(), GETDATE()),
('Supervisor', GETDATE(), GETDATE()),
('Operador', GETDATE(), GETDATE()),
('Gerente de Tiendas', GETDATE(), GETDATE());


-- Datos de prueba para la tabla Sucursales
INSERT INTO Sucursales (nombre ,direccion, createdAt, updateAt) VALUES
('Sucursal 1', 'Dirección 1', GETDATE(), GETDATE()),
('Sucursal 2', 'Dirección 2', GETDATE(), GETDATE()),
('Sucursal 3', 'Dirección 3', GETDATE(), GETDATE());

-- Datos de prueba para la tabla Transportistas
INSERT INTO Transportistas (nombre, identidad, telefono, correo, tarifa, estado, createdAt, updateAt) VALUES
('Transportista 1', '0000000000000', '1234567890', 'transportista1@example.com', 10.5, 0, GETDATE(), GETDATE()),
('Transportista 2', '9999999999999', '9876543210', 'transportista2@example.com', 9.75, 1, GETDATE(), GETDATE()),
('Transportista 3', '8888888888888', '5555555555', 'transportista3@example.com', 8.99, 1, GETDATE(), GETDATE());

-- Datos de prueba para la tabla Colaboradores
INSERT INTO Colaboradores (nombre, identidad, telefono, correo, direccion, estado, createdAt, updateAt) VALUES
('Colaborador 1', '1111111111111', '1111111111', 'colaborador1@example.com', 'Dirección 1', 0, GETDATE(), GETDATE()),
('Colaborador 2', '2222222222222', '2222222222', 'colaborador2@example.com', 'Dirección 2', 1, GETDATE(), GETDATE()),
('Colaborador 3', '3333333333333', '3333333333', 'colaborador3@example.com', 'Dirección 3', 1, GETDATE(), GETDATE());

-- Datos de prueba para la tabla Usuarios
INSERT INTO Usuarios (nombre, identidad, telefono, correo, contrasena, rolId, createdAt, updateAt) VALUES
('admin', '1111111111111', '11111111', 'admin@admin.com', 'admin', 1, GETDATE(), GETDATE()),
('Usuario 1', '4444444444444', '44444444', 'usuario1@example.com', 'password1', 4, GETDATE(), GETDATE()),
('Usuario 2', '5555555555555', '55555555', 'usuario2@example.com', 'password2', 4, GETDATE(), GETDATE()),
('Usuario 3', '6666666666666', '66666666', 'usuario3@example.com', 'password3', 4, GETDATE(), GETDATE());

-- Datos de prueba para la tabla Asignaciones
INSERT INTO Asignaciones (distancia, colaboradorId, sucursalId, createdAt, updateAt) VALUES
(10.2, 1, 1, GETDATE(), GETDATE()),
(8.5, 2, 2, GETDATE(), GETDATE()),
(12.3, 3, 3, GETDATE(), GETDATE());

-- Datos de prueba para la tabla Viajes
INSERT INTO Viajes (fecha, distancia, transportistaId, usuarioId, asignacionId, createdAt, updateAt) VALUES
(GETDATE(), 15.2, 1, 2, 1, GETDATE(), GETDATE()),
(GETDATE(), 11.7, 2, 2, 2, GETDATE(), GETDATE()),
(GETDATE(), 9.8, 3, 3, 3, GETDATE(), GETDATE());


SELECT * FROM Viajes