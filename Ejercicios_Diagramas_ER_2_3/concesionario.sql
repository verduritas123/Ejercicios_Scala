#DROP DATABASE CONCESIONARIODB;
CREATE DATABASE CONCESIONARIODB;
USE CONCESIONARIODB;


CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(10) UNIQUE,
    nombre VARCHAR(50),
    telf CHAR(10),
    direccion VARCHAR(200),
    ciudad VARCHAR(50)
);
CREATE TABLE Coche (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(10) UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(10),
    color VARCHAR(50),
    precio DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Revisiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cambio_filtro BIT NOT NULL,
    cambio_aceite BIT NOT NULL,
    cambio_frenos BIT NOT NULL,
    otros TEXT,
    id_coche INT,
    FOREIGN KEY (id_coche) REFERENCES Coche(id)
);

INSERT INTO Cliente (dni, nombre, telf, direccion, ciudad) 
VALUES 
('12345678A', 'Carlos López', '600123456', 'Calle Mayor 10', 'Madrid'),
('87654321B', 'Ana García', '611987654', 'Avenida Sol 25', 'Barcelona'),
('11223344C', 'Miguel Fernández', '622345678', 'Plaza del Centro 8', 'Valencia'),
('44556677D', 'Laura Martínez', '633876543', 'Calle Gran Vía 5', 'Sevilla'),
('99887766E', 'David Sánchez', '644567890', 'Paseo del Prado 20', 'Bilbao');


INSERT INTO Coche (matricula, marca, modelo, color, precio, id_cliente) 
VALUES 
('1234ABC', 'Toyota', 'Corolla', 'Rojo', 20000.00, 1),
('5678DEF', 'Ford', 'Focus', 'Azul', 18000.00, 2),
('9101GHI', 'BMW', 'X5', 'Negro', 50000.00, 3),
('1121JKL', 'Honda', 'Civic', 'Blanco', 22000.00, 4),
('3141MNO', 'Audi', 'A3', 'Gris', 32000.00, 5);

INSERT INTO Revisiones(cambio_filtro ,cambio_aceite ,cambio_frenos, otros,id_coche) 
	VALUES
    (1,1,0,NULL,1),
    (1,0,0,NULL,4),
    (0,1,0,'PINTURA',3),
    (1,1,0,NULL,5),
    (1,1,1,'PINTURA',1);




#Ej Consultas
SELECT * FROM Coche;
SELECT * FROM Cliente;
SELECT * FROM Revisiones;



UPDATE Cliente
    SET ciudad="Cartagena"
    WHERE id IN ('1', '3'); 
