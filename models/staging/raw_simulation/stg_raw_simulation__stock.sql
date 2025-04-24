WITH columns_rename AS (
    SELECT
        "produto_id" AS product_id,
        "loja_id" AS store_id,
        "quantidade" AS quantity_available

    FROM {{ source('RAW_SIMULATION', 'ESTOQUE') }}

)

SELECT * FROM columns_rename
