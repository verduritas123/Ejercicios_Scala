#DROP DATABASE EmpresaCamiones;
CREATE DATABASE EmpresaCamiones;

USE EmpresaCamiones;

CREATE TABLE Camionero(
	id_camionero INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(10),
    nombre VARCHAR (50),
    telf CHAR(10),
    direccion VARCHAR(200),
    salario CHAR(10),
    poblacion VARCHAR(50)
);

CREATE TABLE Paquete(
	id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR (300),
    destinatario CHAR(100),
    direccion VARCHAR(200)
);

CREATE TABLE Provincia(
	id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (30)
);
    
INSERT INTO Camionero (dni, nombre, telf, direccion, salario, poblacion) 
VALUES 
('12345678A', 'Carlos López', '600123456', 'Calle Mayor 10, Madrid', '2500', 'Madrid'),
('87654321B', 'Ana García', '611987654', 'Avenida Sol 25, Barcelona', '2700', 'Barcelona'),
('11223344C', 'Miguel Fernández', '622345678', 'Plaza del Centro 8, Valencia', '2600', 'Valencia'),
('44556677D', 'Laura Martínez', '633876543', 'Calle Gran Vía 5, Sevilla', '2800', 'Sevilla'),
('99887766E', 'David Sánchez', '644567890', 'Paseo del Prado 20, Bilbao', '2900', 'Bilbao');

INSERT INTO Provincia (nombre) 
VALUES 
('Madrid'),
('Barcelona'),
('Valencia'),
('Sevilla'),
('Bilbao');

#Ej Consultas
SELECT salario, direccion FROM camionero;
