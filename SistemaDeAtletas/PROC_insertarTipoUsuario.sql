USE sistemaAlmacenamiento

GO
CREATE PROCEDURE PROC_insertarTipoUsuario

@nombreUsuario varchar(40) ,
@apellidoUsuario varchar(40) ,
@edad int ,
@correoElectronico varchar (60) ,
@direccion varchar (100) ,
@telefono varchar (10) ,
@estado  varchar (2),
@idProfesion int 

AS BEGIN 
INSERT INTO informacionUsuario 
(nombreUsuario,apellidoUsuario,edad,correoElectronico,direccion,telefono,estado,idProfesion)
VALUES
(@nombreUsuario,@apellidoUsuario,@edad,@correoElectronico,@direccion,@telefono,@estado,@idProfesion)
END
GO