WITH columns_rename AS (
    SELECT
        venda_id AS sale_id,
        data_venda AS sale_date,
        cliente_id AS customer_id,
        produto_id AS product_id,
        loja_id AS store_id,
        quantidade AS quantity_ordered,
        preco_unitario AS unit_price,
        valor_total AS total_value,
        moeda AS currency

    FROM {{ source('RAW_SIMULATION', 'VENDAS') }}

)

SELECT * FROM columns_rename
