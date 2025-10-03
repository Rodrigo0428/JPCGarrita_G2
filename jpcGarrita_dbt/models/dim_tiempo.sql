{{ config(materialized='table', schema='dimensional') }}

WITH dates AS (
    SELECT generate_series('2020-01-01'::date, '2030-12-31'::date, '1 day'::interval) AS fecha
)
SELECT
    fecha,
    EXTRACT(YEAR FROM fecha) AS año,
    EXTRACT(MONTH FROM fecha) AS mes,
    EXTRACT(DAY FROM fecha) AS dia,
    EXTRACT(QUARTER FROM fecha) AS trimestre,
    EXTRACT(WEEK FROM fecha) AS semana,
    CASE WHEN EXTRACT(DOW FROM fecha) IN (0,6) THEN 'Fin de Semana' ELSE 'Día Laborable' END AS tipo_dia
FROM dates