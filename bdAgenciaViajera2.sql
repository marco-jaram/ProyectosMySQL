    -- Aspecto 2: Crea una tabla que permita almacenar la información sobre una agencia de viajes. Incluye el número de campos que consideres pertinentes. Ingresa 5 registros y realiza las siguientes consultas:

-- - Dos consultas empleando Select  junto con la función variance y group by
-- - Dos consultas empleando Select  junto con la función stddev y group by
-- - Dos consultas empleando Select  junto con  múltiples columnas  para group by
-- - Dos consultas empleando Select  junto con la función having y group by

create database if not exists bdAgenciaViajera2;
 use bdAgenciaViajera2;
 create table if not exists bdAgenciaViajera2.paquetes
 (
id int not null unique auto_increment, 
nombrePaquete varchar(50) unique,
destino varchar(40),
incluye varchar(40),
dias varchar (10),
precio decimal(8,2)
 );
 -- agregando datos
insert into paquetes  values (0, 'Paquete Cancun',           'Cancun',           'Hotel y traslado',          '3',   8.473 );
insert into paquetes  values (0, 'Paquete Puerto Vallarta',  'Puerto Vallarta',  'Hotel',                     '4',   4.326 );
insert into paquetes  values (0, 'Paquete Huatulco',         'Huatulco',          'Hotel',                    '3',   8.259);
insert into paquetes  values (0, 'Paquete Mazatlan',         'Mazatlan',          'Hotel',                    '3',   8.363);
insert into paquetes  values (0, 'Paquete Acapulco',         'Acapulco',          'Hotel y comida',           '4',   4.349);
insert into paquetes  values (0, 'Paquete a Las Vegas',      'Las Vegas',         'Hotel traslado y comida',  '7',   9.249);

describe paquetes;
select * from paquetes;

select dias from paquetes group by dias;
-- Usando Varinace  y group by
select nombrePaquete, variance(dias) as 'Varinza en dias' from paquetes group by nombrePaquete;
select id, nombrePaquete, variance(precio) as 'Varinza en precios' from paquetes group by id, nombrePaquete;
-- Usando stddev y group by
select nombrePaquete, stddev(dias) as 'Desviacion en dias' from paquetes group by nombrePaquete;
select id, nombrePaquete, stddev(precio) as 'Desviacion en precios' from paquetes group by id, nombrePaquete;
-- Usando  múltiples columnas  para group by
select sum(precio), destino from paquetes group by destino;
select sum(precio), nombrePaquete from paquetes group by destino, nombrePaquete;
-- Usando  función having y group by
select count(id), destino from paquetes group by destino, nombrePaquete having count(id) <= 3;
select count(precio), destino from paquetes group by destino, nombrePaquete;


