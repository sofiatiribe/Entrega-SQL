CREATE DATABASE retail_project;
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    edad INT CHECK (edad >= 18)
);
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2) CHECK (precio > 0)
);
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT CHECK (cantidad > 0)
	);
BEGIN;
INSERT INTO clientes (id_cliente, nombre, email, edad) VALUES (1, 'Juan Pérez', 'juan@email.com', 25);
INSERT INTO clientes (id_cliente, nombre, email, edad) VALUES (2, 'Soledad Lopez', 'soledadl@email.com', 30);
INSERT INTO clientes (id_cliente, nombre, email, edad) VALUES (3, 'Carlos Copa', 'c.copa@email.com', 78);
INSERT INTO clientes (id_cliente, nombre, email, edad) VALUES (4, 'Amelia Torres', 'amelia.torres@email.com', 65);
INSERT INTO clientes (id_cliente, nombre, email, edad) VALUES (5, 'Tristan Solar', 'tristan@email.com', 81);
INSERT INTO productos (id_producto, nombre, precio) VALUES (1, 'Aspiradora', 130000);
INSERT INTO productos (id_producto, nombre, precio) VALUES (2, 'Heladera', 2500000);
INSERT INTO productos (id_producto, nombre, precio) VALUES (3, 'Telefono fijo', 85000);
INSERT INTO productos (id_producto, nombre, precio) VALUES (4, 'Bicicleta de niño', 70000);
INSERT INTO productos (id_producto, nombre, precio) VALUES (5, 'Sofa', 650000);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad) VALUES (1, 1, 2, 1);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad) VALUES (2, 3, 1, 2);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad) VALUES (3, 2, 4, 1);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad) VALUES (4, 5, 5, 1);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad) VALUES (5, 4, 3, 3);
COMMIT;
UPDATE productos
SET precio = 150000
WHERE id_producto = 1;
DELETE FROM ventas
WHERE id_venta = 5;