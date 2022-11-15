USE sistemaAlmacenamiento

GO
CREATE PROCEDURE SA_InsertFoA

@nombreFederacion varchar (60),
@estado varchar(2),
@direccion varchar (30)

AS BEGIN
INSERT INTO federacionAsociacion (nombreFederacion,estado,direccion) VALUES (@nombreFederacion,@estado,@direccion)

END
GO

SELECT * FROM federacionAsociacion
SELECT idFederacion,nombreFederacion,estado,direccion FROM federacionAsociacion