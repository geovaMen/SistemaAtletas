CREATE DATABASE sistemaAlmacenamiento

use sistemaAlmacenamiento
-- ya esta 
-- tabla de nombre de asociacion o federacion

CREATE TABLE federacionAsociacion(              ----YA----
idFederacion int identity (1,1) primary key,
nombreFederacion varchar (60) not null,
estado varchar(2),
direccion varchar (30) not null
)
select * from federacionAsociacion
-- drop table permiso
-- drop table usuario

-- tabla de permisos al sistema
CREATE TABLE permiso(                                            ----YA----
idPermiso int identity (1,1) primary key,
tipoPermiso varchar (20) not null,
estadoPermiso varchar (2),
)
--DROP TABLE examenRealizado
CREATE TABLE examenRealizado(
idRegistro int identity (1,1) primary key,
motivoExamen varchar (100) not null, --Motivo examen, pruebas, sintomas, malestar, dolores,enfermedad, lesion
fechaExamen VARCHAR(20) NOT NULL, -- se tomara la validez de 6 meses de vigencia
nombreExamenMedico varchar (50) not null, --orina, hematologia,grupo sanguineo, etc
urlExamenMedico varchar (200) not null -- se almacenara la url del examen medico alojado en la nube
)
--DELETE FROM tipoProfesion where idProfesion = 6
--select * from tipoProfesion
-- ya esta 
CREATE TABLE tipoProfesion(                ----YA----
idProfesion int identity (1,1) primary key,
nombreProfesion varchar (100) not null, -- psicologo, nutricionista, digitalizador, medico, fisioperapista, dentista, etc
estadoProfesion varchar (2) not null
)

--SELECT * FROM informacionUsuario
-- ya esta 
CREATE TABLE informacionUsuario(               ----YA----
idInformacionU  int identity (1,1) primary key,
nombreUsuario varchar(40) not null,
apellidoUsuario varchar(40) not null,
edad int not null,
correoElectronico varchar (60) not null,
direccion varchar (100) not null,
telefono varchar (10) not null,
estado  varchar (2),
idProfesion int not null,

foreign key (idProfesion) references tipoProfesion(idProfesion)
)

-- tabla de usuarios en el cog
ALTER TABLE usuarioConsultor ADD estadoP char (1) 
CREATE TABLE usuarioConsultor (    ----YA----
idUsuario int identity (1,1) primary key, -- usuario que ingresa al sistema y realizar la consulta, y llena el expediente

idPermiso int not null,
idInformacionU int not null,

foreign key (idPermiso)  references permiso(idPermiso),
foreign key (idInformacionU)  references informacionUsuario(idInformacionU)
)
SELECT * FROM usuarioConsultor
SELECT * FROM permiso
SELECT * FROM informacionUsuario



-- CONSULTAR GRID DE PERMISOS
SELECT U.idUsuario,P.tipoPermiso, (I.nombreUsuario + ' '+ I.apellidoUsuario) AS nombreP, U.estadoP
FROM (usuarioConsultor U 
INNER JOIN 
permiso P ON U.idPermiso = P.idPermiso )
INNER JOIN
informacionUsuario I ON U.idInformacionU = I.idInformacionU

--SELECT FROM informacionUsuario I  , I.nombreUsuario 

-- registro de informacion personal del atleta
ALTER TABLE informacionAtleta add fecha_Creacion Datetime Default GetDate()
ALTER TABLE informacionAtleta ALTER COLUMN fechaNacimiento VARCHAR(20) NOT NULL

-- ya esta 
SELECT A.nombreAtleta, A.apellidoAtleta,A.fechaNacimiento, A.edad,A.peso,A.estatura,A.TipoSangre,A.Direccion,
A.telefono, F.nombreFederacion,A.tipoLineaDeportiva, A.medicamentoNoTolerables FROM informacionAtleta A INNER JOIN 
federacionAsociacion F ON A.idFederacion = F.idFederacion

SELECT A.nombreAtleta, A.apellidoAtleta,A.fechaNacimiento, A.edad,A.peso,A.estatura,A.TipoSangre,A.Direccion,
A.telefono, F.nombreFederacion,A.tipoLineaDeportiva, A.medicamentoNoTolerables FROM informacionAtleta A INNER JOIN 
federacionAsociacion F ON A.idFederacion = F.idFederacion
WHERE A.nombreAtleta
LIKE '%F%'



CREATE TABLE informacionAtleta(            ----YA----
idAtleta int identity (1,1) primary key,
nombreAtleta varchar (30) not null,
apellidoAtleta varchar (30) not null,
fechaNacimiento date not null,
edad int not  null,
Direccion varchar (40) not null,
telefono varchar (10) not null,
peso varchar (10) not null,
estatura varchar (10) not null,
TipoSangre varchar (2) not null,

medicamentoNoTolerables nvarchar (200) not null,
tipoLineaDeportiva varchar(20) not null,
idFederacion int not null,

foreign key (idFederacion) references federacionAsociacion(idFederacion)
)

-- DROP TABLE expedienteAtleta
-- asignar registro medico a un atleta
CREATE TABLE expedientesAtletas(
codigoExpediente int identity (1,1) primary key,
motivoAlmacenamiento varchar (40) not null,
horaRegistro VARCHAR (20) not null,
fechaRegistro VARCHAR(20)  not null,
motivoExamen varchar (100) not null, --Motivo examen, pruebas, sintomas, malestar, dolores,enfermedad, lesion
fechaExamen VARCHAR(20) NOT NULL, -- se tomara la validez de 6 meses de vigencia
nombreExamenMedico varchar (50) not null, --orina, hematologia,grupo sanguineo, etc
urlExamenMedico varchar (200) not null, -- se almacenara la url del examen medico alojado en la nube

-- campos foraneos
idAtleta int not null,
idUsuario int not null

foreign key (idAtleta) references informacionAtleta(idAtleta),
foreign key (idUsuario) references usuarioConsultor(idUsuario)
)
INSERT INTO expedientesAtletas values ('Motivo','08:20','11/08/2022','Pruebas Morfo','11/08/2022','Hematologia Completa','hematologiga',1,15)
INSERT INTO expedientesAtletas values ('Motivo','08:20','11/08/2022','Pruebas Morfo','11/08/2022','Hematologia Completa','hematologiga',1,16)
SELECT * FROM informacionUsuario

select * from usuarioConsultor
select * from expedientesAtletas
select * from informacionAtleta

SELECT (A.nombreAtleta+''+A.apellidoAtleta) as nombreAtleta, E.nombreExamenMedico, E.motivoExamen, E.motivoAlmacenamiento,E.urlExamenMedico,
E.fechaRegistro, E.fechaExamen FROM expedientesAtletas E 
INNER JOIN informacionAtleta A 
ON E.idAtleta = A.idAtleta WHERE A.idAtleta = 1

DROP TABLE expedienteAtleta(
idControl int identity (1,1) primary key,
motivoAlmacenamiento varchar (40) not null,
horaRegistro VARCHAR (20) not null,
fechaRegistro VARCHAR(20)  not null,

-- campos foraneos
idAtleta int not null,
idRegistro int not null,
idUsuario int not null

foreign key (idAtleta) references informacionAtleta(idAtleta),
foreign key (idRegistro) references examenRealizado(idRegistro),
foreign key (idUsuario) references usuarioConsultor(idUsuario)
)

SELECT * FROM usuarioConsultor
--DELETE FROM usuarioConsultor where idUsuario between 7 and 14
-- consultar nombre del atleta
SELECT idAtleta, (nombreAtleta +'  '+ apellidoAtleta) as nombre FROM informacionAtleta

-- Consultar Usuarios administradores
SELECT U.idUsuario,(I.nombreUsuario +' ' +I.apellidoUsuario)as nombreU FROM (informacionUsuario I
INNER JOIN usuarioConsultor U 
ON I.idInformacionU = U.idInformacionU)
INNER JOIN 
permiso P ON U.idPermiso = P.idPermiso
WHERE 
P.tipoPermiso = 'Administrador'