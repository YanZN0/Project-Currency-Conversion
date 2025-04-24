
  create or replace   view RAW.RAW_SIMULATION.stg_raw_simulation__customer_product_mapping

   as (
    WITH columns_rename AS (
    SELECT
        "id" AS mapping_id,
        "cliente_id" AS customer_id,
        "produto_id" AS product_id

    FROM RAW.RAW_SIMULATION.MAPEAMENTO_CLIENTE_PRODUTO

)

SELECT * FROM columns_rename
  );
