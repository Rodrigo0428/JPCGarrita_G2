{{ config(materialized='table', schema='dimensional') }}

SELECT
    tienda_id AS tienda_key,
    tie_nombre AS nombre_tienda,
    ruc,
    email,
    telefono,
    direccion,
    distrito_id AS distrito_key,
    canal,
    horario_atencion,
    activo,
    creado_en
FROM staging.tiendas
WHERE tienda_id IS NOT NULL