USE sistemaAlmacenamiento

GO
CREATE PROCEDURE PROC_InsertarExamenesM
@motivoAlmacenamiento varchar (40),
@fechaRegistro VARCHAR(20),
@horaRegistro VARCHAR (20),
@motivoExamen varchar (100),
@fechaExamen VARCHAR(20),
@nombreExamenMedico varchar (50),
@urlExamenMedico varchar (200),
@idAtleta int,
@idUsuario int
AS BEGIN
INSERT INTO expedientesAtletas (motivoAlmacenamiento,horaRegistro,fechaRegistro,motivoExamen,fechaExamen,nombreExamenMedico,urlExamenMedico,idAtleta,idUsuario) 
VALUES (@motivoAlmacenamiento,@fechaRegistro,@horaRegistro,@motivoExamen,@fechaExamen,@nombreExamenMedico,@urlExamenMedico,@idAtleta,@idUsuario)


END
GO