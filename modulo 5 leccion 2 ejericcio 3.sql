CREATE TABLE bandas
(
    nombre character varying(50),
    pais character varying(50)
);

insert into bandas (nombre, pais) values ('Kraftwerk', 'Alemania');
insert into bandas (nombre, pais) values ('Los prisioneros', 'Chile');
insert into bandas (nombre, pais) values ('KMFDM', 'Alemania');
insert into bandas (nombre, pais) values ('Muse', 'UK');
insert into bandas (nombre, pais) values ('The Chemical Brothers', 'UK');
insert into bandas (nombre, pais) values ('TOOL', 'USA');
insert into bandas (nombre, pais) values ('The Beatles', 'UK');
insert into bandas (nombre, pais) values ('Modeselektor', 'Alemania');

SELECT * FROM bandas;


CREATE TABLE bandas_discos
(
    nombre_disco character varying(50),
    nombre_banda character varying(50),
    anio_disco integer
);

insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Kraftwerk', 'Computer World', 1981);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Kraftwerk', 'The Man Machine', 1978);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Los prisioneros', 'La cultura de la basura', 1987);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Los prisioneros', 'Corazones', 1990);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('KMFDM', 'NIHIL', 1995);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('KMFDM', 'XTORT', 1996);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('KMFDM', 'ADIOS', 1999);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Muse', 'Showbiz', 1999);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Muse', 'Origin of symmetry', 2001);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Muse', 'Black holes and Revelations', 2006);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Chemical Brothers', 'Surrender', 1999);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Chemical Brothers', 'Born in the echoes', 2015);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Chemical Brothers', 'No Geography', 2019);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('TOOL', 'Aenima', 1996);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('TOOL', 'Lateralus', 2001);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('TOOL', 'Fear Inoculum', 2019);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Beatles', 'Rubber Soul', 1965);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Beatles', 'Revolver', 1966);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Beatles', 'Abbey Road', 1969);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Modeselektor', 'Hello Mom!', 2005);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Modeselektor', 'Monkeytown', 2011);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Modeselektor', 'Who Else', 2019);

SELECT * FROM bandas_discos;
--lista de bandad no alemanas desde el 2000 en adelante
SELECT * FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE b.pais <> 'Alemania' AND bd.anio_disco>=2000;

--lista de discos mas recientes de las bandas inglesas que terminan en "S"
SELECT * FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE b.pais = 'UK' AND b.nombre ILIKE '%S';

--lista de bandas alemanas con almenos una letra K en su nombre y que tengan discos publicados de 1999 en adelante

SELECT b.nombre, bd.anio_disco FROM bandas AS b
JOIN bandas_discos  AS bd
ON b.nombre = bd.nombre_banda
WHERE b.pais = 'Alemania' AND b.nombre ILIKE '%K%' AND bd.anio_disco>=1999
GROUP BY b.nombre, bd.anio_disco;

-- alistar todas las bandas y el numero de discos registrados
SELECT b.nombre, COUNT(bd.nombre_disco) FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
GROUP BY b.nombre;

--mostrar todos los años enque todas las bandas sacaron discos ordenar la lista por años
SELECT b.nombre, bd.anio_disco FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
ORDER BY bd.anio_disco ASC;

--LISTAR TODAS LAS BANDAS QUE TIENEN UN DISCO CON NOMBRE EMPEZANDO CON A.LISTAR EL NOMBRE DE LA BANDA Y EL DISCO
SELECT nombre_banda, nombre_disco FROM bandas_discos
WHERE nombre_disco ILIKE 'A%'

--listar todas las bandas que tengan discos con mas de una palabra. LISTAR EL NOMBRE DE LA BANDA Y EL DISCO
SELECT b.nombre, bd.nombre_disco FROM bandas AS b
JOIN bandas_discos AS bd
ON b.nombre = bd.nombre_banda
WHERE position(' ' in bd.nombre_disco)>0
ORDER BY b.nombre, bd.nombre_disco;

--listar todas las bandas que tengan discos con mas de una palabra. LISTAR EL NOMBRE DE LA BANDA Y la cantidad de discos
SELECT b.nombre, COUNT(bd.nombre_disco) FROM bandas AS b
JOIN bandas_discos AS bd
ON b.nombre = bd.nombre_banda
WHERE position(' ' in bd.nombre_disco)>0
GROUP BY b.nombre;