USE sistemaAlmacenamiento

GO
ALTER PROCEDURE proc_inProfesion

@nombreProfesion varchar (100) , -- psicologo, nutricionista, digitalizador, medico, fisioperapista, dentista, etc
@estadoProfesion varchar (2) 
AS BEGIN

IF NOT EXISTS (SELECT TOP(1) nombreProfesion  from tipoProfesion WHERE nombreProfesion = @nombreProfesion)
BEGIN

	INSERT INTO tipoProfesion (nombreProfesion,estadoProfesion) VALUES (@nombreProfesion,@estadoProfesion)

END
END
GO

select * from tipoProfesion
EXEC proc_inProfesion 'Secretaria','a'
SELECT TOP(1)   nombreProfesion  from tipoProfesion WHERE nombreProfesion = 'secretaria'