USE sistemaAlmacenamiento

GO
CREATE PROCEDURE consultarTipoProfesion
AS 
BEGIN


SELECT idProfesion,nombreProfesion FROM tipoProfesion 

END
GO
--- Tipo permiso
GO
CREATE PROCEDURE consultarTipoPermiso
AS 
BEGIN

SELECT idPermiso,tipoPermiso FROM permiso 
END
GO--- Tipo Usuario
GO
ALTER PROCEDURE consultarTipoUsuario
AS 
BEGIN
SELECT idInformacionU,concat(nombreUsuario,+' '+ apellidoUsuario )as nombreUsuario FROM informacionUsuario
--SELECT I.idInformacionU, (I.nombreUsuario + '  ' + I.apellidoUsuario) as NombreAtleta FROM  informacionUsuario I
END
GO

SELECT idFederacion,nombreFederacion FROM federacionAsociacion
exec consultarTipoUsuario