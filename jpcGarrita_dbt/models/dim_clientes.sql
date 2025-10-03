{{ config(materialized='table', schema='dimensional') }}

SELECT
    cliente_id AS cliente_key,
    tipo_doc,
    nro_doc,
    cli_nombres AS nombres,
    cli_apellidos AS apellidos,
    UPPER(CONCAT(cli_nombres, ' ', cli_apellidos)) AS nombre_completo,
    cli_email AS email,
    cli_telefono AS telefono,
    cli_direccion AS direccion,
    distrito_id AS distrito_key,  
    creado_en
FROM staging.clientes
WHERE cliente_id IS NOT NULL