CREATE DATABASE GestionViajes
USE [GestionViajes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[asignacionId] [int] IDENTITY(1,1) NOT NULL,
	[distancia] [decimal](4, 2) NOT NULL,
	[colaboradorId] [int] NOT NULL,
	[sucursalId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_asignacionId] PRIMARY KEY CLUSTERED 
(
	[asignacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colaboradores](
	[colaboradorId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[identidad] [varchar](13) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
	[correo] [varchar](120) NOT NULL,
	[direccion] [varchar](250) NOT NULL,
	[estado] [tinyint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_colaboradorId] PRIMARY KEY CLUSTERED 
(
	[colaboradorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_correo_Colaboradores] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_identidad_Colaboradores] UNIQUE NONCLUSTERED 
(
	[identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleViajes](
	[viajeId] [int] NOT NULL,
	[colaboradorId] [int] NOT NULL,
	[distancia] [decimal](10, 2) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rolId] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](50) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_rolId] PRIMARY KEY CLUSTERED 
(
	[rolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[sucursalId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[direccion] [varchar](250) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_sucursalId] PRIMARY KEY CLUSTERED 
(
	[sucursalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportistas](
	[transportistaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[identidad] [varchar](13) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
	[correo] [varchar](120) NOT NULL,
	[tarifa] [decimal](10, 2) NOT NULL,
	[estado] [tinyint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_transportistaId] PRIMARY KEY CLUSTERED 
(
	[transportistaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_correo_Transportistas] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_identidad_Transportistas] UNIQUE NONCLUSTERED 
(
	[identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[identidad] [varchar](13) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
	[correo] [varchar](120) NOT NULL,
	[contraseña] [varchar](120) NOT NULL,
	[rolId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_usuarioId] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_correo_Usuarios] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_identidad_Usuarios] UNIQUE NONCLUSTERED 
(
	[identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[viajeId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[usuarioId] [int] NOT NULL,
	[sucursalId] [int] NOT NULL,
	[transportistaId] [int] NOT NULL,
	[tarifa] [decimal](10, 2) NOT NULL,
	[distanciaTotal] [decimal](10, 2) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_viajeId] PRIMARY KEY CLUSTERED 
(
	[viajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaciones] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Asignaciones] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Colaboradores] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[Colaboradores] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Colaboradores] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[DetalleViajes] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[DetalleViajes] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Sucursales] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Sucursales] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Transportistas] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[Transportistas] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Transportistas] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Viajes] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Viajes] ADD  DEFAULT (getdate()) FOR [updateAt]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [FK_Colaboradores_Asignaciones] FOREIGN KEY([colaboradorId])
REFERENCES [dbo].[Colaboradores] ([colaboradorId])
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [FK_Colaboradores_Asignaciones]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [FK_Sucursales_Asignaciones] FOREIGN KEY([sucursalId])
REFERENCES [dbo].[Sucursales] ([sucursalId])
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [FK_Sucursales_Asignaciones]
GO
ALTER TABLE [dbo].[DetalleViajes]  WITH CHECK ADD  CONSTRAINT [FK_Colaboradores_DetalleViajes] FOREIGN KEY([colaboradorId])
REFERENCES [dbo].[Colaboradores] ([colaboradorId])
GO
ALTER TABLE [dbo].[DetalleViajes] CHECK CONSTRAINT [FK_Colaboradores_DetalleViajes]
GO
ALTER TABLE [dbo].[DetalleViajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_DetalleViajes] FOREIGN KEY([viajeId])
REFERENCES [dbo].[Viajes] ([viajeId])
GO
ALTER TABLE [dbo].[DetalleViajes] CHECK CONSTRAINT [FK_Viajes_DetalleViajes]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Usuarios] FOREIGN KEY([rolId])
REFERENCES [dbo].[Roles] ([rolId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Roles_Usuarios]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Sucursales_Viajes] FOREIGN KEY([sucursalId])
REFERENCES [dbo].[Sucursales] ([sucursalId])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Sucursales_Viajes]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Transportistas_Viajes] FOREIGN KEY([transportistaId])
REFERENCES [dbo].[Transportistas] ([transportistaId])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Transportistas_Viajes]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Viajes] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[Usuarios] ([usuarioId])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Usuarios_Viajes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_ASIGNACIONES]
AS
BEGIN
    SELECT 
        C.nombre AS colaborador,
        S.nombre AS sucursal,
        A.distancia
    FROM 
        Asignaciones AS A
    INNER JOIN 
        Colaboradores AS C ON A.colaboradorId = C.colaboradorId
    INNER JOIN 
        Sucursales AS S ON A.sucursalId = S.sucursalId
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_COLABORADOR_POR_SUCURSAL]
    @colaboradorId INT,
    @sucursalId INT
AS
BEGIN
    SELECT 
        C.colaboradorId, 
        C.nombre, 
        A.distancia
    FROM 
        Colaboradores AS C 
    INNER JOIN 
        Asignaciones AS A ON C.colaboradorId = A.colaboradorId
    WHERE 
        C.colaboradorId = @colaboradorId AND A.sucursalId = @sucursalId
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_COLABORADORES]
AS
BEGIN
    SELECT colaboradorId, nombre, identidad, telefono, correo, direccion FROM Colaboradores
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_COLABORADORES_POR_SUCURSAL]
    @sucursalId INT
AS
BEGIN
    SELECT 
        C.colaboradorId, C.nombre, A.distancia 
    FROM 
        Asignaciones AS A
    INNER JOIN 
        Colaboradores AS C ON A.colaboradorId = C.colaboradorId
    WHERE 
        A.sucursalId = @sucursalId
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_SUCURSALES]
AS
BEGIN
    SELECT sucursalId, nombre, direccion FROM Sucursales
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_TRANSPORTISTA]
    @transportistaId INT
AS
BEGIN
    SELECT 
        transportistaId,
        nombre,
        tarifa
    FROM
        Transportistas
    WHERE
        transportistaId = @transportistaId
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_TRANSPORTISTAS]
AS
BEGIN
    SELECT 
        transportistaId,
        nombre,
        tarifa 
    FROM 
        Transportistas
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_USUARIO]
    @usuarioId INT
AS
BEGIN

    SELECT U.usuarioId , U.nombre, R.rol
    FROM Usuarios AS U 
    INNER JOIN Roles AS R ON U.rolId = R.rolId
    WHERE U.usuarioId = @usuarioId;

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_USUARIOS]
AS
BEGIN
    SELECT 
        U.nombre, 
        U.identidad, 
        U.identidad,
        U.correo,
        R.rol 
    FROM Usuarios AS U
    INNER JOIN Roles AS R ON U.rolId = R.rolId
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_VIAJES]
AS
BEGIN
    SELECT 
        C.nombre AS colaborador,
        S.nombre AS sucursal,
        T.nombre AS transportista,
        T.tarifa,
        DV.distancia
    FROM 
        Viajes AS V
    INNER JOIN 
        Sucursales AS S ON V.sucursalId = S.sucursalId
    INNER JOIN
        Transportistas AS T ON V.transportistaId = T.transportistaId
    INNER JOIN
        DetalleViajes AS DV ON V.viajeId = DV.viajeId
    INNER JOIN
        Colaboradores AS C ON DV.colaboradorId = C.colaboradorId
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LOGIN_USUARIO]
    @correo VARCHAR(120),
    @contraseña VARCHAR(120)
AS
BEGIN
    DECLARE @usuarioId INT;
    DECLARE @nombre VARCHAR(60);
    DECLARE @rol VARCHAR(60);

    IF EXISTS (SELECT * FROM Usuarios WHERE correo = @correo AND contraseña = @contraseña)
    BEGIN

        SELECT @usuarioId = usuarioId, @nombre = U.nombre, @rol = R.rol
        FROM Usuarios AS U 
        INNER JOIN Roles AS R ON U.rolId = R.rolId
        WHERE U.correo = @correo;

        SELECT 'Bienvenido(a), ' + @nombre AS msg, 1 as resp, @usuarioId AS usuarioId, @nombre AS nombre, @rol AS rol;
    END
    ELSE
    BEGIN
        SELECT 'Credenciales inválidas' AS msg, 0 as resp
    END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NUEVA_ASIGNACION]
    @colaboradorId INT,
    @sucursalId INT,
    @distancia DECIMAL(4,2)
AS
BEGIN

IF EXISTS (SELECT 1 FROM Asignaciones WHERE colaboradorId = @colaboradorId AND sucursalId = @sucursalId)
    BEGIN
        SELECT 'El colaborador ya tiene asignada esta sucursal' AS msg, 0 AS resp
    END;

ELSE IF @distancia <= 0 OR @distancia > 50
    BEGIN
        SELECT 'La distancia ingresada no es valida' AS msg, 0 AS resp
    END;
ELSE
    BEGIN
        INSERT INTO Asignaciones (distancia, colaboradorId, sucursalId, createdAt, updateAt)
        VALUES (@distancia, @colaboradorId, @sucursalId, GETDATE(), GETDATE());

        UPDATE Colaboradores
        SET updateAt = GETDATE()
        WHERE colaboradorId = @colaboradorId;

        SELECT 'La asignación se ha realizado correctamente.' AS msg, 1 AS resp;
    END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NUEVA_SUCURSAL]
    @nombre VARCHAR(100),
    @direccion VARCHAR(250)
AS
BEGIN
    INSERT INTO 
        Sucursales(nombre ,direccion, createdAt, updateAt)
    VALUES
        (@nombre, @direccion, GETDATE(), GETDATE())
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NUEVO_COLABORADOR]
    @nombre VARCHAR(100),
    @identidad VARCHAR(13),
    @telefono VARCHAR(13),
    @correo VARCHAR(120),
    @direccion VARCHAR(250)
AS
BEGIN
    INSERT INTO 
        Colaboradores(nombre, identidad, telefono, correo, direccion, estado, createdAt, updateAt)
    VALUES
        (@nombre, @identidad, @telefono, @correo, @direccion, 0, GETDATE(), GETDATE())
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NUEVO_TRANSPORTISTA]
    @nombre VARCHAR(100),
    @identidad VARCHAR(13),
    @telefono VARCHAR(13),
    @correo VARCHAR(120),
    @tarifa VARCHAR(250)
AS
BEGIN
    INSERT INTO 
        Transportistas(nombre, identidad, telefono, correo, tarifa, estado, createdAt, updateAt)
    VALUES
        (@nombre, @identidad, @telefono, @correo, @tarifa, 0, GETDATE(), GETDATE())
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NUEVO_VIAJE]
    @distanciaTotal DECIMAL(10,2),
    @tarifa DECIMAL(10,2),
    @fecha DATETIME,
    @usuarioId INT,
    @transportistaId INT,
    @colaboradorId INT,
    @sucursalId INT,
    @distancia DECIMAL(10,2)
AS
BEGIN

    DECLARE @viajeId INT;
    DECLARE @fechaViaje DATETIME;
    DECLARE @estadoTransportista TINYINT;
    DECLARE @colaboradorNombre VARCHAR(60);

    SELECT @colaboradorNombre = nombre FROM Colaboradores WHERE colaboradorId = @colaboradorId;
    SELECT @fechaViaje = createdAt FROM Viajes WHERE fecha = CONVERT(DATETIME, CONVERT(VARCHAR(16), GETDATE(), 120));

    IF @distanciaTotal > 100.00
        BEGIN
            SELECT 'La distancia del viaje acumula mas de 100 km' AS msg, 0 AS resp
        END
    ELSE IF EXISTS ( SELECT 1 FROM DetalleViajes AS DV INNER JOIN Viajes AS V ON DV.viajeId = v.viajeId WHERE DV.colaboradorId = @colaboradorId AND CONVERT( DATE,V.fecha) =  CONVERT(DATE, @fecha))
        BEGIN
            SELECT 'El colaborador ' + @colaboradorNombre + ' ya ha realizado el viaje del dia.' AS msg, 0 as resp
        END
    ELSE IF EXISTS (SELECT 1 FROM Viajes WHERE createdAt = @fechaViaje)
        BEGIN

            SELECT @viajeId = viajeId FROM Viajes WHERE createdAt = @fechaViaje;

            INSERT INTO 
                DetalleViajes(viajeId, colaboradorId, distancia,  createdAt, updateAt)
            VALUES
                (@viajeId, @colaboradorId, @distancia, GETDATE(), GETDATE())

            UPDATE
                Transportistas
            SET
                estado = 1,
                updateAt = GETDATE()
            WHERE
                transportistaId = @transportistaId

            SELECT 'El viaje se ha registrado con exito' AS msg, 1 resp
        END
    ELSE
        BEGIN
            INSERT INTO 
                Viajes(fecha, usuarioId, sucursalId, transportistaId, tarifa, distanciaTotal, createdAt, updateAt)
            VALUES
                (CONVERT(DATETIME, CONVERT(VARCHAR(16), GETDATE(), 120)), @usuarioId, @sucursalId, @transportistaId, @tarifa, @distanciaTotal, CONVERT(DATETIME, CONVERT(VARCHAR(16), GETDATE(), 120)), GETDATE())
            
            SET @viajeId = SCOPE_IDENTITY()

            INSERT INTO 
                DetalleViajes(viajeId, colaboradorId, distancia, createdAt, updateAt)
            VALUES
                (@viajeId,  @colaboradorId, @distancia, GETDATE(), GETDATE())

            
            UPDATE
                Transportistas
            SET
                estado = 1,
                updateAt = GETDATE()
            WHERE
                transportistaId = @transportistaId

            SELECT 'El viaje se ha registrado con exito' AS msg, 1 resp
      END
END  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REPORTE]
    @transportistaId INT,
    @fechaInicio DATE,
    @fechaFinal DATE
AS
BEGIN
    SELECT 
        U.nombre AS usuario,
        S.nombre AS sucursal,
        T.nombre AS transportista,
        V.distanciaTotal,
        T.tarifa,
        CONVERT(DATE,V.fecha) AS fecha
    FROM 
        Viajes AS V
    INNER JOIN
        Usuarios AS U ON V.usuarioId = U.usuarioId
    INNER JOIN 
        Sucursales AS S ON V.sucursalId = S.sucursalId
    INNER JOIN
        Transportistas AS T ON V.transportistaId = T.transportistaId
    WHERE
        T.transportistaId = @transportistaId AND CONVERT(DATE, V.fecha) = @fechaInicio AND CONVERT(DATE, V.fecha) = @fechaFinal
END
GO


/*DATOS DE PRUEBA*/

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
INSERT INTO Usuarios (nombre, identidad, telefono, correo, contraseña, rolId, createdAt, updateAt) VALUES
('admin', '1111111111111', '11111111', 'admin@admin.com', 'admin', 1, GETDATE(), GETDATE()),
('Usuario 1', '4444444444444', '44444444', 'usuario1@example.com', 'password1', 4, GETDATE(), GETDATE()),
('Usuario 2', '5555555555555', '55555555', 'usuario2@example.com', 'password2', 4, GETDATE(), GETDATE()),
('Usuario 3', '6666666666666', '66666666', 'usuario3@example.com', 'password3', 4, GETDATE(), GETDATE());

-- Datos de prueba para la tabla Asignaciones
INSERT INTO Asignaciones (distancia, colaboradorId, sucursalId, createdAt, updateAt) VALUES
(10.2, 1, 1, GETDATE(), GETDATE()),
(8.5, 2, 2, GETDATE(), GETDATE()),
(12.3, 3, 3, GETDATE(), GETDATE());