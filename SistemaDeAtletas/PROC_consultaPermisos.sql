USE sistemaAlmacenamiento

GO
CREATE PROCEDURE PROC_consultaPermisos
AS BEGIN
SELECT P.tipoPermiso, (I.nombreUsuario + ' '+ I.apellidoUsuario) AS nombreP,U. FROM (usuarioConsultor U 
INNER JOIN 
permiso P ON U.idPermiso = P.idPermiso )
INNER JOIN
informacionUsuario I ON U.idInformacionU = I.idInformacionU
END
GO

EXEC PROC_consultaPermisos