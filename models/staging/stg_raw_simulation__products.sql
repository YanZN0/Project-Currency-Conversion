WITH columns_rename AS (
    SELECT
        "produto_id" AS product_id,
        "nome" AS product_name,
        "categoria" AS product_category,
        "preco" AS product_price

    FROM {{ source('RAW_SIMULATION', 'PRODUTOS') }}

),

transforming_invalid_values AS (
    SELECT
        product_id,
        product_name,
        product_price,
        CASE
            WHEN product_category = 'Roupaz' THEN 'Roupas'
            WHEN product_category = 'roupas' THEN 'Roupas'
            ELSE product_category
        END AS product_category

    FROM columns_rename
)

SELECT * FROM transforming_invalid_values
