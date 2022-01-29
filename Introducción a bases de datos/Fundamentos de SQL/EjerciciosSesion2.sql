USE tienda;

SHOW KEYS FROM venta;

# INNER JOIN

SHOW KEYS FROM empleado;
SHOW KEYS FROM puesto;

SELECT * 
FROM empleado
JOIN puesto
	ON empleado.id_puesto = puesto.id_puesto;
    
SELECT * 
FROM empleado AS e
JOIN puesto AS p
	ON e.id_puesto = p.id_puesto;

SELECT id_empleado, e.nombre AS nombre_empleado, apellido_paterno, apellido_materno, rfc,
	p.id_puesto, p.nombre AS nombre_puesto, salario
FROM empleado AS e
JOIN puesto AS p
	ON e.id_puesto = p.id_puesto;
    
# LEft JOIN

SELECT *
FROM puesto AS p
LEFT JOIN empleado AS e
ON p.id_puesto = e.id_puesto;

# RIGHT JOIN

SELECT *
FROM puesto AS p
RIGHT JOIN empleado AS e
ON p.id_puesto = e.id_puesto;

SELECT *
FROM empleado AS e
LEFT JOIN puesto AS p
ON p.id_puesto = e.id_puesto;

# ¿Cuál es el nombre de los empleados que realizaron cada venta?
DESCRIBE venta;

SELECT e.nombre 
FROM empleado AS e
INNER JOIN venta AS v
ON e.id_empleado = v.id_empleado;

DESCRIBE articulo;

# ¿Cuál es el nombre de los artículos que se han vendido?

SELECT v.id_venta, a.nombre
FROM articulo AS a
INNER JOIN venta AS v
ON a.id_articulo = v.id_articulo;

# ¿Cuál es el total de cada venta?
SELECT v.clave, sum(a.precio) AS precio
FROM articulo AS a
JOIN venta AS v
ON a.id_articulo = v.id_articulo
GROUP BY v.clave;

# Vistas
CREATE VIEW venta_articulo_396 AS 
(SELECT v.id_venta, v.clave, a.id_articulo, a.nombre, a.precio, a.iva, v.id_empleado, v.fecha
FROM venta AS v
INNER JOIN articulo AS a
ON v.id_articulo = a.id_articulo);

SELECT *
FROM venta_articulo_396;

SELECT clave, ROUND(SUM(precio), 2) AS total
FROM venta_articulo_396
GROUP BY clave;

SELECT clave, COUNT(*) AS total
FROM venta_articulo_396
GROUP BY clave
ORDER BY total DESC;

SELECT clave, ROUND(SUM(precio), 2) AS total
FROM venta_articulo_396
GROUP BY clave;

SELECT clave, nombre
FROM venta_articulo_396
ORDER BY clave ASC;

SELECT clave, GROUP_CONCAT(nombre, ' / ') AS productos, ROUND(SUM(precio), 2) AS total
FROM venta_articulo_396
GROUP BY clave;

# AÑADE A TODOS LOS NOMBRES DE TUS VISTAS EL SUFIJO _<tu identificador>. Por ejemplo mi_vista_hermosa_123.
# Obtener el puesto de un empleado. 
describe empleado;
describe puesto;
CREATE VIEW puestos_empleados_396 AS (
SELECT e.nombre AS nombre_empleado, p.nombre AS nombre_puesto
FROM empleado AS e
INNER JOIN puesto AS p
ON e.id_puesto = p.id_puesto);

# Saber qué artículos ha vendido cada empleado.
DESCRIBE venta;
CREATE VIEW articulo_empleado_396 AS (
SELECT vE.id_venta, vE.nombre AS nombre_empleado, a.nombre AS nombre_articulo
FROM (
SELECT v.id_venta, e.nombre, v.id_articulo
FROM venta AS v
INNER JOIN empleado AS e
ON v.id_empleado = e.id_empleado) AS vE
INNER JOIN articulo AS a
ON vE.id_articulo = a.id_articulo);

SELECT * FROM articulo_empleado_396;

# Saber qué puesto ha tenido más ventas.
describe puesto;

SELECT p.puesto, v.id_venta
FROM puesto AS p
INNER JOIN venta AS v
ON e.id_puesto = v.id_puesto;





