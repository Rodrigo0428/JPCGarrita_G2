{{ config(materialized='table', schema='dimensional') }}

SELECT
    producto_id AS producto_key,
    pro_nombre AS nombre_producto,
    pro_descripcion AS descripcion,
    marca_id AS marca_key,        
    categoria_id AS categoria_key,
    genero,
    color,
    talla,
    material,
    estado,
    actualizado_en,
    stock
FROM staging.productos
WHERE producto_id IS NOT NULL