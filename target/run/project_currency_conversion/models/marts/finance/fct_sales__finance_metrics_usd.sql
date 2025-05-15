
  create or replace   view RAW.RAW_SIMULATION.fct_sales__finance_metrics_usd

   as (
    WITH sales AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__sales_with_exchange_rates
),

sales_with_metrics_usd AS (
    SELECT
        sale_id,
        sale_date,
        customer_id,
        product_id,
        store_id,
        product_unit_price,
        quantity_ordered,
        'USD' AS currency,
        total_value_usd AS total_value,
        conversion_date

    FROM sales
)

SELECT * FROM sales_with_metrics_usd
  );
