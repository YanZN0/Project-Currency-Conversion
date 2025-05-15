
  create or replace   view RAW.RAW_SIMULATION.dm__stores_metrics

   as (
    WITH stores AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__stores_metrics
),

stores_metrics_joined AS (

    SELECT

        store_id,
        store_name,
        store_city,
        state,
        total_sales_store,
        total_revenue_store_usd,
        average_sale_value_usd,
        first_sale,
        last_sale

    FROM stores
)

SELECT * FROM stores_metrics_joined
  );
