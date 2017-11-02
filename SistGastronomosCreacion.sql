/*
Proyecto base de datos 2018-1.
En este apartado se crea la base de datos para el sistema gastronomo, asi como las tablas correspondientes.
Para la creación de la base de datos se requiere estar en la base de datos master.
Realizado por:
	-Hernández Bravo David Gustavo
	-Ramirez Nuñez Daniel
*/

--Creacion de la base de datos SISTEMA_GASTRONOMOS
use master
go

create database SISTEMA_GASTRONOMOS
go

use SISTEMA_GASTRONOMOS
go

--Se verifica que estemos en la base de datos creada.
select db_name()
go

--Se crean las tablas de nuestra base de datos
create table platillos(
idplatillo varchar(10) not null primary key,
nombreplatillo varchar(20) not null
)
go

create table socios(
idsocio varchar(10) not null primary key,
nombresocio varchar(30) not null,
peso float,
ingreso date not null
)
go

create table gustan(
idplatillo varchar(10) not null,
idsocio varchar(10) not null,
foreign key(idplatillo) references platillos(idplatillo),
foreign key(idsocio) references socios(idsocio)
)
go

create table horario(
idhorario int not null primary key,
nomhorario varchar(15) not null
)
go

create table sirven(
idplatillo varchar(10) not null,
idhorario int not null,
foreign key(idplatillo) references platillos(idplatillo),
foreign key(idhorario) references horario(idhorario)
)
go

create table ingredientes(
iding varchar(10) not null primary key,
nombreing varchar(10) not null
)
go

create  table hechos(
idplatillo varchar(10) not null,
iding varchar(10) not null,
foreign key(idplatillo) references platillos(idplatillo),
foreign key(iding) references ingredientes(iding)
)
go

create table temporada(
idtemp int not null primary key,
nombretemp varchar(10) not null
)
go

create table son(
idtemp int not null,
iding varchar(10) not null,
foreign key(idtemp) references temporada(idtemp),
foreign key(iding) references ingredientes(iding)
)
go
