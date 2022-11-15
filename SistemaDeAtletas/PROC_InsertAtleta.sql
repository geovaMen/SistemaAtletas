USE sistemaAlmacenamiento
--DROP PROCEDURE PROC_InsertAtleta
GO
CREATE PROCEDURE PROC_InsertAtleta
@nombreAtleta varchar (30) ,
@apellidoAtleta varchar (30) ,
@fechaNacimiento VARCHAR(20) ,
@edad int ,
@Direccion varchar (40) ,
@telefono varchar (10) ,
@peso varchar (10) ,
@estatura varchar (10) ,
@TipoSangre varchar (2) ,
@medicamentoNoTolerables nvarchar (200) ,
@tipoLineaDeportiva varchar(20) ,
@idFederacion int

AS BEGIN
INSERT INTO informacionAtleta 
(nombreAtleta,apellidoAtleta,fechaNacimiento,edad,Direccion,telefono,peso,estatura,TipoSangre,medicamentoNoTolerables,tipoLineaDeportiva,idFederacion)
VALUES
(@nombreAtleta,@apellidoAtleta,@fechaNacimiento,@edad,@Direccion,@telefono,@peso,@estatura,@TipoSangre,@medicamentoNoTolerables,@tipoLineaDeportiva,@idFederacion)
END
GO

SELECT * FROM informacionAtleta