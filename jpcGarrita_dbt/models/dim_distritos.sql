{{ config(materialized='table', schema='dimensional') }}

SELECT
    distrito_id AS distrito_key,
    dis_nombre AS nombre_distrito,
    UPPER(provincia) AS provincia,
    ubigeo
FROM staging.distritos
WHERE distrito_id IS NOT NULL