WITH columns_rename AS (
    SELECT
        "id" AS mapping_id,
        "cliente_id" AS customer_id,
        "produto_id" AS product_id

    FROM {{ source('RAW_SIMULATION', 'MAPEAMENTO_CLIENTE_PRODUTO') }}

)

SELECT * FROM columns_rename
