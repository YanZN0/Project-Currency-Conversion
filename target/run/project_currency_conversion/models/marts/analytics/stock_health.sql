
  create or replace   view RAW.RAW_SIMULATION.stock_health

   as (


WITH stock AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.stg_raw_simulation__stock
),

stock_levels AS (

    SELECT
        product_id,
        store_id,
        quantity_available,
        CASE
            WHEN quantity_available = 0 THEN 'ZERO_STOCK'
            WHEN quantity_available < 0 THEN 'NEGATIVE_STOCK'
            ELSE 'OK'
        END AS stock_status

    FROM stock
)

SELECT * FROM stock_levels
  );
