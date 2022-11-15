USE sistemaAlmacenamiento

GO
ALTER PROCEDURE PROC_UsuarioConsultor
@idPermiso integer,
@idInformacionU integer
AS BEGIN
INSERT INTO usuarioConsultor (idPermiso,idInformacionU,estadoP) VALUES (@idPermiso,@idInformacionU,'A')
END
GO

UPDATE usuarioConsultor set estadoP = 'B' Where idUsuario = 7

--SELECT * FROM usuarioConsultor
--DELETE FROM usuarioConsultor WHERE idUsuario between  1 and  6
