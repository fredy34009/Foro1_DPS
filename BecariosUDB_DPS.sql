create database becarios;
use becarios;

create table alumno(
id int primary key auto_increment not null,
nombres VARCHAR(50) not null,
apellidos VARCHAR(50) not null,
correo_electronico VARCHAR(100),
dui varchar(10) not null,
carnet varchar(8) not null unique,
fecha_nacimiento date not null,
fecha_ingreso date not null
);
create table profesor(
id int primary key auto_increment not null,
nombres VARCHAR(50) not null,
apellidos VARCHAR(50) not null,
correo_electronico VARCHAR(100),
dui varchar(10) not null,
fecha_nacimiento date not null,
fecha_ingreso date not null
);
create table materia(
id int primary key auto_increment not null,
nombre_materia varchar(50) not null,
descripcion varchar(100) not null
);
create table asignatura(
id int primary key auto_increment not null,
id_profesor int not null,
id_materia int not null,
FOREIGN KEY (id_profesor) REFERENCES profesor(id),
FOREIGN KEY (id_materia) REFERENCES materia(id)
);

create table tipo_evaluacion(
id int primary key auto_increment not null,
nombre_evaluacion varchar(50) not null
);

create table evaluacion (
id int primary key auto_increment not null,
id_asignatura int not null,
id_tipo_evaluacion int not null,
fecha_evaluacion date not null,
FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
FOREIGN KEY (id_tipo_evaluacion) REFERENCES tipo_evaluacion(id)
);
create table nota(
id int primary key auto_increment not null,
id_evaluacion INT not null,
id_alumno INT not null,
nota DECIMAL(5,2),
FOREIGN KEY (id_evaluacion) REFERENCES evaluacion(id),
FOREIGN KEY (id_alumno) REFERENCES alumno(id)
);

INSERT INTO alumno VALUES (1,'Fredy Antonio','Alfaro Santos','fredy@gmail.com','05318869-5','AS231934','1996-03-01','2023-01-15')
,(2,'Cristian Noe','Bautista Ramirez','crstnnoe@gmail.com','06316889-4','BR231456','1998-10-16','2023-01-15')
,(3,'Alicia Marisol','Raymundo Cruz','aliciaraymundo@gmail.com','06878845-2','RC231825','2000-07-10','2023-01-15')
,(4,'Ruth Sarai','Sanchez Benitez','sarai@gmail.com','06454524-0','SB232112','2001-10-12','2023-01-15')
,(5,'Edgar Arnulfo','Nieto Segura','arnulfoedgar@gmail.com','05121754-3','NS231452','1998-01-11','2023-01-15');

INSERT INTO profesor VALUES (1,'German Lisandro','Hernandez Hernandez','hernandezg@gmail.com','03124521-9','1990-12-10','2015-10-01')
,(2,'Jose Kevin','Pacheco Perez','pachecoperes@gmail.com','04723155-4','1985-05-14','2010-06-01')
,(3,'Manuel de Jesus','Flores Peraza','manuelflores@gmail.com','03451254-2','1980-01-12','2009-01-01')
,(4,'Juan Jose','Melgar Medrano','medranojuan@gmail.com','03121858-7','1982-08-02','2009-01-01')
,(5,'Andrea Jazmin','Andrade Rodriguez','andrearodriguez@gmail.com','03145451-0','1990-07-05','2016-06-02');

INSERT INTO materia VALUES (1,'Administracion de Servicios en la nube','Administracion de Servicios en la nube Azure')
,(2,'Servidores en Plataformas Propietarias','Configuracion de servidores')
,(3,'Desarrollo de Aplicaciones con Web Frameworks','Desarrollo de Aplicaciones con Web Frameworks enLenguaje JAVA')
,(4,'Diseño y Programacion de Sotfware Multiplataforma','Diseño y Programacion de Sotfware Multiplataforma basado en React-Native')
,(5,'Desarrollo de Aplicaciones Web Con Software Interp','Orientado al Lenguaje PHP');

INSERT INTO tipo_evaluacion VALUES (1,'Escrita (Parcial)'),(2,'Investigacion'),(3,'Laboratorio'),(4,'Seminario'),(5,'Virtual');
INSERT INTO asignatura VALUES (1,1,3),(2,2,2),(3,3,1),(4,4,4),(5,5,5);
INSERT INTO evaluacion VALUES (1,1,2,'2024-02-20'),(2,2,1,'2024-03-21'),(3,3,3,'2024-02-15'),(4,4,5,'2024-01-30'),(5,5,4,'2024-02-25');
INSERT INTO nota VALUES (1,1,2,8.00),(2,2,1,7.50),(3,3,4,9.50),(4,1,3,7.00),(5,5,5,8.00);