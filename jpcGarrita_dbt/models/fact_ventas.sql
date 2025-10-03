{{ config(materialized='table', schema='dimensional') }}

WITH venta_items AS (
    SELECT
        vi.item_id,
        vi.venta_id,
        vi.producto_id,
        v.tienda_id,
        v.empleado_id,
        v.cliente_id,
        vi.cantidad,
        vi.descuento,
        vi."subtotalItem",
        vi.total_linea,
        v."fechaVenta",
        v."metodoPago",
        v.estado,
        v.subtotal AS total_venta_subtotal,
        v.impuestos,
        v.total AS total_venta_total
    FROM staging.ventas v
    JOIN staging.ventaItems vi ON v.venta_id = vi.venta_id
    WHERE v.venta_id IS NOT NULL
)

SELECT
    v.venta_id AS venta_key,
    v.producto_id AS producto_key,
    v.tienda_id AS tienda_key,
    v.cliente_id AS cliente_key,
    v.empleado_id AS empleado_key,
    EXTRACT(YEAR FROM v."fechaVenta") AS año,
    EXTRACT(MONTH FROM v."fechaVenta") AS mes,
    EXTRACT(DAY FROM v."fechaVenta") AS dia,
    v."metodoPago",
    v.estado,
    v.cantidad AS cantidad_vendida,
    v.descuento AS descuento_aplicado,
    v."subtotalItem" AS subtotal_linea,
    v.total_linea AS total_linea,
    v.total_venta_subtotal AS subtotal_venta,
    v.impuestos AS impuestos_venta,
    v.total_venta_total AS total_venta,
    v."fechaVenta" AS fecha_completa
FROM venta_items v
WHERE v.venta_id IS NOT NULL