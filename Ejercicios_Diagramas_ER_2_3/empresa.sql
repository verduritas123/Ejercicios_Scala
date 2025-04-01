CREATE TABLE Clientes (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    direccion TEXT,
    fecha_nacimiento DATE
);

CREATE TABLE Proveedores (
    nif VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    direccion TEXT
);

CREATE TABLE Productos (
    codigo VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100),
    precio_unitario DECIMAL(10,2),
    proveedor_nif VARCHAR(20),
    FOREIGN KEY (proveedor_nif) REFERENCES Proveedores(nif)
);
USE Productos;
CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    cliente_dni VARCHAR(20),
    producto_codigo VARCHAR(50),
    cantidad INT,
    fecha_compra DATE,
    FOREIGN KEY (cliente_dni) REFERENCES Clientes(dni),
    FOREIGN KEY (producto_codigo) REFERENCES Productos(codigo)
);
