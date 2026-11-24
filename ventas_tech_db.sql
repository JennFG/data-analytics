/* ===================================================================================

   M3. PRE-ENTREGABLE N°3: SCRIPT SQL PARA ESQUEMA NORMALIZADO Y DATOS INICIALES
   Alumna: Jennifer Flores | Curso: Data Analytics | Comision: 91095 | Fecha: Nov-2026

   =================================================================================== */

--- SECCION 0: CREAR Y USAR BASE DE DATOS

--- DROP DATABASE

USE master;
DROP DATABASE IF EXISTS Ventas_Tech_DB;

--- CREATE DATABASE

CREATE DATABASE Ventas_Tech_DB;

---USE DATABASE

USE Ventas_Tech_DB;


--- SECCION 1: DROP TABLES

------------- DROP ----------------

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;


--- SECCION 2: CREATE TABLES

------------ CREATE ---------------

--- TABLA CATEGORIAS

CREATE TABLE Categorias(
	id_categoria        int          NOT NULL PRIMARY KEY,
    nombre_categoria    varchar(50)  NOT NULL,
    descripcion         varchar(200) 
);

--- TABLA CLIENTES

CREATE TABLE Clientes(
    id_cliente          int          NOT NULL PRIMARY KEY,
    nombre              varchar(100) NOT NULL,
    email               varchar(100) UNIQUE,
    ciudad              varchar(50),
    fecha_registro      date         NOT NULL
);

--- TABLA PRODUCTOS

CREATE TABLE Productos(
    id_producto         int          NOT NULL PRIMARY KEY,
    nombre_producto     varchar(100) NOT NULL,
    id_categoria        int NOT NULL FOREIGN KEY REFERENCES Categorias(id_categoria),
    precio              decimal(10,2) NOT NULL,
    stock               int          DEFAULT(0),
    activo              bit          DEFAULT(1)
);

--- TABLA VENTAS

CREATE TABLE Ventas(
    id_venta            int          NOT NULL PRIMARY KEY,
    id_cliente          int NOT NULL FOREIGN KEY REFERENCES Clientes(id_cliente),
    id_producto         int NOT NULL FOREIGN KEY REFERENCES Productos(id_producto),
    cantidad            int          NOT NULL,
    precio_unitario     decimal(10,2) NOT NULL,
    fecha_venta         date         NOT NULL
);


--- SECCION 3: INSERT DATA

------------ INSERT ---------------

--- INSERT CATEGORIAS

INSERT INTO Categorias (id_categoria, nombre_categoria, descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');

--- INSERT CLIENTES

INSERT INTO Clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');


--- INSERT PRODUCTOS

INSERT INTO Productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);


--- INSERT VENTAS

INSERT INTO Ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');


--- SECCION 4: VALIDACION

------------ SELECT ---------------

SELECT * FROM Categorias;   -- esperado: 4 filas
SELECT * FROM Clientes;     -- esperado: 5 filas
SELECT * FROM Productos;    -- esperado: 6 filas
SELECT * FROM Ventas;       -- esperado: 10 filas