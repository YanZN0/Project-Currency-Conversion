WITH columns_rename AS (
    SELECT
        venda_id            AS sale_id,
        data_venda          AS sale_date,
        cliente_id          AS customer_id,
        produto_id          AS product_id,
        loja_id             AS store_id,
        quantidade          AS quantity_ordered,
        preco_unitario      AS product_unit_price,
        valor_total         AS sale_total_value,
        moeda               AS currency

    FROM {{ source('RAW_SIMULATION', 'VENDAS') }}

),


adjusting_invalid_values as (
    select

        sale_id,
        sale_date,
        customer_id,
        product_id,
        store_id,
        quantity_ordered,
        ABS(product_unit_price) as product_unit_price,
        ABS(product_unit_price) * quantity_ordered as sale_total_value,
        currency

    from columns_rename
    where quantity_ordered > 0
)

SELECT * FROM adjusting_invalid_values
