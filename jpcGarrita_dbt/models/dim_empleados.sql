{{ config(materialized='table', schema='dimensional') }}

SELECT
    empleado_id AS empleado_key,
    emp_nombre AS nombre,
    emp_apellidos AS apellidos,
    UPPER(CONCAT(emp_nombre, ' ', emp_apellidos)) AS nombre_completo,
    emp_dni AS dni,
    emp_email AS email,
    emp_telefono AS telefono,
    emp_puesto AS puesto,
    tienda_id AS tienda_key, 
    activo
FROM staging.empleados
WHERE empleado_id IS NOT NULL