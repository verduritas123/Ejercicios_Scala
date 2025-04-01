#EJ1: BD INSTITUTO creada

#DROP DATABASE InstitutoDB;
CREATE DATABASE InstitutoDB;
USE InstitutoDB;
 
CREATE TABLE Profesores (
	id INT auto_increment,
    nombre VARCHAR (100) NOT NULL,
    direccion VARCHAR (300),
    dni CHAR (9) UNIQUE NOT NULL,
    telefono VARCHAR (9),
    primary key(id)
);

CREATE TABLE Modulo (
	id INT auto_increment,
    nombre VARCHAR (100) NOT NULL,
    codigo VARCHAR (10) NOT NULL,
    primary key(id)
);

CREATE TABLE Alumnos (
	id INT auto_increment,
    nombre VARCHAR (100)  NOT NULL,
    apellidos VARCHAR (300) NOT NULL,
    f_nac VARCHAR (16),
    num_exp VARCHAR (9) NOT NULL,
    primary key(id)
);

CREATE TABLE Matricula (
	id INT auto_increment,
    primary key(id),
    fk_id_modulo int,
    fk_id_alumno INT,
    foreign key(fk_id_modulo) REFERENCES Modulo(id),
    foreign key(fk_id_alumno) REFERENCES Alumnos(id)
);

CREATE TABLE Cursos(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    fk_id_delegado INT UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_id_delegado) REFERENCES Alumnos(id)
);
INSERT INTO Profesores (nombre, direccion, dni, telefono) 
VALUES 
('Carlos López', 'Calle Mayor 10, Madrid', '12345678A', '600123456'),
('Ana García', 'Avenida Sol 25, Barcelona', '87654321B', '611987654'),
('Miguel Fernández', 'Plaza del Centro 8, Valencia', '11223344C', '622345678');

 
INSERT INTO Modulo (nombre, codigo) VALUES ('Mates', '190'),('Lengua', '191'),('Cono', '198'),('Inglés', '180');

INSERT INTO Alumnos (nombre, apellidos, f_nac, num_exp) 
VALUES 
('Elena', 'Velázquez Veruras', '2000-06-15', 'EXP001'),
('David', 'Martínez Pérez', '1999-03-22', 'EXP002'),
('Laura', 'Sánchez Ruiz', '2001-09-10', 'EXP003');


INSERT INTO Matricula (fk_id_modulo, fk_id_alumno) 
VALUES 
(1, 1),  -- Elena en Matemáticas
(2, 1),  -- Elena en Física
(3, 2),  -- David en Programación
(1, 3),  -- Laura en Matemáticas
(3, 3);  -- Laura en Programación

INSERT INTO Cursos VALUES
(1,'Primero',3),
(2,'Segundo',1),
(3,'Tercero',2);


#Ej Consulta
DELETE FROM Matricula WHERE fk_id_alumno = (SELECT id FROM Alumnos WHERE nombre='Elena');
DELETE FROM Cursos WHERE fk_id_delegado = (SELECT id FROM Alumnos WHERE nombre='Elena');
DELETE FROM Alumnos WHERE nombre='Elena';




