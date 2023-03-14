CREATE SCHEMA ClubDeportivo;

USE ClubDeportivo;

CREATE TABLE Socios(
num_socio INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20),
apellido VARCHAR (20),
dni VARCHAR (20),
fk_codigo_deporte INTEGER
);

CREATE TABLE Deportes (
codigo INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20),
es_grupal VARCHAR (2)
);

ALTER TABLE Socios 
ADD FOREIGN KEY (fk_codigo_deporte) REFERENCES Deportes (codigo); 

INSERT INTO Deportes (nombre, es_grupal) 
VALUES
("futbol", "si"),
("tenis", "si"),
("basquet","si")
;


INSERT INTO Socios (nombre, apellido, dni, fk_codigo_deporte)
VALUES
("Camilo", "Sanz", "18.512.365-9", 2),
("Mia", "Troncoso", "18.512.565-9", 1),
("Sara", "Lobos", "11.412.565-9", 3),
("Fernando", "Troncoso", "18.112.565-2", 2),
("Matías", "Triviño", "7.512.565-9", 1),
("Mauricio", "Alvear", "8.512.565-9", 2),
("Clara", "Bravo", "18.235.565-1", 3)
;

#-----Lista completa de todos los socios---

SELECT * FROM Socios; 

#-----Lista completa de todos los deportes---

SELECT * FROM Deportes; 

#-----Lista completa de todos los socios que practican tenis---

SELECT nombre, apellido, dni FROM Socios WHERE fk_codigo_deporte =2;

#-----Cantidad de socios que practican fútbol---

SELECT count(fk_codigo_deporte) FROM Socios WHERE fk_codigo_deporte = 1; 


#----Entregar una tabla con la información de socios y deportes------

SELECT * FROM Socios JOIN Deportes ON Socios.fk_codigo_deporte = Deportes.codigo; 

SELECT Socios.nombre, Socios.apellido, Socios.dni, Deportes.nombre, Deportes.es_grupal FROM Socios JOIN Deportes ON Socios.fk_codigo_deporte = Deportes.codigo; 

SELECT Socios.nombre, Socios.apellido, Socios.dni, Deportes.nombre, Deportes.es_grupal FROM Socios JOIN Deportes ON Socios.fk_codigo_deporte = Deportes.codigo
ORDER BY apellido;

SELECT Socios.nombre, Socios.apellido, Socios.dni, Deportes.nombre, Deportes.es_grupal FROM Socios JOIN Deportes ON Socios.fk_codigo_deporte = Deportes.codigo
ORDER BY dni;

SELECT Socios.nombre, Socios.apellido, Socios.dni, Deportes.nombre, Deportes.es_grupal FROM Socios JOIN Deportes ON Socios.fk_codigo_deporte = Deportes.codigo
ORDER BY codigo;

SELECT Socios.nombre, Socios.apellido, Socios.dni, Deportes.nombre, Deportes.es_grupal FROM Socios JOIN Deportes ON Socios.fk_codigo_deporte = Deportes.codigo
ORDER BY codigo, apellido;

