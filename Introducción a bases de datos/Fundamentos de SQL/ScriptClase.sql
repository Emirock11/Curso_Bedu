# Ver todas las bases de datos en mi servidor MySQL
SHOW DATABASES;

# Usar una de mis bases de datos
USE tienda;
USE classicmodels;

# Ver todas las tablas en esa base de datos
SHOW TABLES;

# Obtener información de una tabla
DESCRIBE articulo;
DESCRIBE empleado;
DESCRIBE puesto;
DESCRIBE venta;

#Consultas

SELECT * 
FROM empleado;

SELECT nombre 
FROM empleado;

SELECT * 
FROM empleado
WHERE apellido_paterno = 'Risom'; # Filtro

SELECT * 
FROM empleado
WHERE nombre = 'Cassey';

SELECT * 
FROM empleado
WHERE id_empleado = 10;

DESCRIBE empleado;

SELECT * 
FROM empleado
WHERE id_puesto > 100;

SELECT * 
FROM empleado
WHERE id_puesto >=100
	AND id_puesto <= 200;

SELECT * 
FROM empleado
WHERE id_puesto =100
	OR id_puesto = 200;

SELECT * 
FROM empleado
WHERE id_puesto IN (100, 200, 300);

# --------------   Actividad   -----------------

# nombre de los empleados con el puesto 4
SELECT nombre
FROM empleado
WHERE id_puesto = 4;

# Puestos con salario mayor a 10000
SELECT id_puesto
FROM puesto 
WHERE salario > 10000;

# Artículos que tienen un precio mayor a 1000 y un iva mayor a 100
SELECT nombre
FROM articulo
WHERE precio > 1000
	AND iva > 100;
    
# Ventas con artículos 135 o 963 y fueron hechas popr los empleados 835 o 369
SELECT id_venta
FROM venta
WHERE (id_articulo = 135 OR id_articulo = 963)
	AND (id_empleado = 835 OR id_empleado = 369);

SELECT id_venta
FROM venta
WHERE id_articulo IN (963, 135)
	AND id_empleado IN (369, 835);

SELECT *
FROM empleado
WHERE (id_empleado = 2 OR id_empleado = 3)
	AND id_puesto = 5
	AND (nombre = 'Anita' OR nombre = 'Belen');
    

# ORDER y LIMIT

SELECT * 
FROM puesto
ORDER BY salario DESC;  

SELECT * 
FROM puesto
ORDER BY salario ASC;    
    
SELECT * 
FROM empleado
ORDER BY id_puesto ASC
LIMIT 5;

SELECT * 
FROM empleado
LIMIT 5
OFFSET 5;

# --------------   Actividad   -----------------
# Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
describe puesto;
SELECT nombre
FROM puesto
ORDER BY salario DESC
LIMIT 5;


SELECT * FROM empleado;

SELECT * 
FROM empleado
WHERE nombre LIKE "m%"; # % representa 0, 1 o más caracteres

SELECT * 
FROM empleado
WHERE nombre LIKE "%a"; # Se puede utilizar en cualquier parte de la cadena

SELECT * 
FROM empleado
WHERE nombre LIKE "m%a";

SELECT * 
FROM empleado
WHERE nombre LIKE "M_losa"; # _ representa un caracter

SELECT * 
FROM empleado
WHERE nombre LIKE "M___a";


SELECT nombre
FROM articulo
WHERE nombre LIKE "%Pasta%";

SELECT nombre
FROM articulo
WHERE nombre LIKE "%Cannelloni%";

SELECT nombre
FROM articulo
WHERE nombre LIKE "%-%";

SELECT *
FROM empleado
WHERE id_puesto LIKE "7%";


# Funciones de agrupamiento

SELECT * 
FROM articulo;

SELECT AVG(precio)
FROM articulo;

SELECT COUNT(*) # Contar filas en un grupo
FROM articulo;

SELECT MAX(precio) AS precio_maximo
FROM articulo;

SELECT MIN(precio) AS precio_minimo
FROM articulo;

SELECT SUM(precio) AS suma_de_precios
FROM articulo;


SELECT SUM(precio) / COUNT(precio) AS promedio_precios,
MIN(precio) AS precio_minimo,
MAX(precio) AS precio_maximo
FROM articulo;

SELECT AVG(salario) AS promedio_salario
FROM puesto;

SELECT COUNT(*) AS productos_pasta
FROM articulo
WHERE nombre LIKE "%Pasta%";

SELECT MIN(salario) as salario_minimo,
MAX(salario) AS salario_maximo
FROM puesto;

SELECT SUM(salario) AS sumaSalarios
FROM puesto
ORDER BY id_puesto DESC
LIMIT 5;

SELECT nombre, SUM(precio) AS total
FROM articulo
GROUP BY nombre;

# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, COUNT(*) AS cantidad
FROM puesto
GROUP BY nombre;


SELECT nombre, SUM(salario) as total
FROM puesto
GROUP BY nombre
ORDER BY total DESC;

# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, COUNT(*) AS total_de_ventas
FROM venta
GROUP BY id_empleado;

# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, COUNT(*) AS total_de_ventas
FROM venta
GROUP BY id_articulo;
desc venta;

# Buscando todos los empleados que tienen el puesto de 'Junior Executive'
SELECT * FROM empleado;
SELECT * FROM puesto;

SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive';

SELECT *
FROM empleado
WHERE id_puesto IN (
	SELECT id_puesto
	FROM puesto
	WHERE nombre = 'Junior Executive'
);


# Subconsulta en cláusula FROM
SELECT clave, COUNT(*) AS cantidad
FROM venta
GROUP BY clave
ORDER BY cantidad DESC;

# Cuál es la cantidad mínima y máxima de cada artículo en cada venta
SELECT clave, id_articulo, COUNT(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY clave;

SELECT id_articulo, MIN(cantidad) AS min, MAX(cantidad) AS max
FROM (
	SELECT clave, id_articulo, COUNT(*) AS cantidad
	FROM venta
	GROUP BY clave, id_articulo
	ORDER BY clave
	) AS cantidad_de_articulos_vendidos
GROUP BY id_articulo
ORDER BY max DESC;

# Cuál es el nombre de los empleados cuyo sueldo es menos a 10000
desc empleado;
desc puesto;
desc venta;

SELECT id_puesto
FROM puesto
WHERE salario > 15000;

SELECT nombre
FROM empleado
WHERE id_puesto IN(
	SELECT id_puesto
	FROM puesto
	WHERE salario > 15000
);

SELECT id_empleado,  COUNT(*) AS cantidad
FROM venta
GROUP BY id_empleado
ORDER BY cantidad DESC;
# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT MIN(cantidad) AS min, MAX(cantidad) AS max
FROM (
	SELECT id_empleado,  COUNT(*) AS cantidad
	FROM venta
	GROUP BY id_empleado
	ORDER BY cantidad DESC
	) AS cantidad_max_y_min;

# ¿Cuál es el nombre del puesto de cada empleado?
SELECT empleado.nombre, puesto.nombre
FROM empleado, puesto
WHERE empleado.id_puesto = puesto.id_puesto;

SELECT *
FROM puesto;

SELECT *
FROM empleado;




