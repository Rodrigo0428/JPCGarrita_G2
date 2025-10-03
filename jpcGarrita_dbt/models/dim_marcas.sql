{{ config(materialized='table', schema='dimensional') }}

SELECT
    marca_id AS marca_key,
    mar_nombre AS nombre_marca,
    mar_descripcion AS descripcion
FROM staging.marcas
WHERE marca_id IS NOT NULL