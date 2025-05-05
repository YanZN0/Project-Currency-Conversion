
  create or replace   view RAW.RAW_SIMULATION.dim__products

   as (
    WITH products AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__products_metrics
),

products_metrics_joined AS (
    SELECT

        product_id,
        product_name,
        product_price,
        product_category,
        total_sales_count,
        total_revenue_usd,
        average_sale_value_usd,
        first_sale_product,
        last_sale_product

    FROM products
)

SELECT * FROM products_metrics_joined
  );
