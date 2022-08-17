-- Ejercicio U5
-- Crea  tres tablas que permitan administrar la información de una comercializadora. 
-- Incluye el número de campos que consideres pertinentes. Ingresa 7 registros a cada
--  tabla  y realiza los siguientes consulta:
-- Dos consultas empleando el comando join para dos tablas
-- Dos consultas empleando el comando cross join para dos tablas



CREATE DATABASE negocioJoin;
USE negocioJoin;

-- Primera tabla Clientes
CREATE TABLE IF NOT EXISTS negocioJoin.cliente (
    idCliente INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nombreClinete VARCHAR(50) UNIQUE,
    apellidoPaterno VARCHAR(40),
    apellidoMaterno VARCHAR(40),
    Telefono VARCHAR(30)
);
INSERT INTO cliente VALUES (0, 'Marco', 'Jaramillo', 'Castro', '6643111577');
INSERT INTO cliente VALUES (0, 'Martha' , 'Villa' , 'Perez' ,'664399504');
INSERT INTO cliente VALUES (0, 'Andrea' , 'Gomez' , 'Valdez' , '6648554775');

SELECT * FROM cliente;

-- Segunda Tabla Pedidos 
CREATE TABLE IF NOT EXISTS negocioJoin.ventas (
    idVenta INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    idCliente INT,
    descripcion VARCHAR(40),
    fecha DATE,
    FOREIGN KEY (idCliente)
        REFERENCES cliente (idCliente)
);
INSERT INTO ventas VALUES (0, 3 ,'disco duro ssd 250G', '2019-02-05');
INSERT INTO ventas VALUES (0, 2 ,'RAM 8Gb', '2017-01-08');
INSERT INTO ventas VALUES (0, 1 ,'Monitor hp 21', '2017-05-03');
INSERT INTO ventas VALUES (0, 3,'Mouse inalambrico', '2022-08-04');
INSERT INTO ventas VALUES (0, 2,'Tecclado mecanico mxcd', '2021-06-08');

SELECT * FROM ventas;

select * from ventas inner join cliente  on ventas.idCliente ;
select * from cliente inner join ventas  on cliente.Telefono ;

select * from ventas cross join cliente;
select cliente.nombreClinete, cliente.Telefono, ventas.descripcion from ventas cross join cliente;