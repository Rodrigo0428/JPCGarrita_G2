{{ config(materialized='table', schema='dimensional') }}

SELECT
    categoria_id AS categoria_key,
    cat_nombre AS nombre_categoria,
    cat_descripcion AS descripcion
FROM staging.categorias
WHERE categoria_id IS NOT NULL
