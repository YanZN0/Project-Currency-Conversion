
  create or replace   view RAW.RAW_SIMULATION.stg_raw_simulation__sales

   as (
    WITH columns_rename AS (
    SELECT
        venda_id AS sale_id,
        data_venda AS sale_date,
        cliente_id AS customer_id,
        produto_id AS product_id,
        loja_id AS store_id,
        quantidade AS quantity_ordered,
        preco_unitario AS product_unit_price,
        valor_total AS sale_total_value,
        moeda AS currency

    FROM RAW.RAW_SIMULATION.VENDAS

),

adjusting_invalid_values AS (
    SELECT

        sale_id,
        sale_date,
        customer_id,
        product_id,
        store_id,
        quantity_ordered,
        currency,
        ABS(product_unit_price) AS product_unit_price,
        ABS(product_unit_price) * quantity_ordered AS sale_total_value

    FROM columns_rename
    WHERE quantity_ordered > 0
)

SELECT * FROM adjusting_invalid_values
  );
