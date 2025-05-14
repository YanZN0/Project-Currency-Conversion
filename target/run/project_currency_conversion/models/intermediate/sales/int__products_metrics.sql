



        create or replace transient table RAW.RAW_SIMULATION.int__products_metrics
         as
        (

WITH source AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.stg_raw_simulation__products

),

metrics AS (

    SELECT
        p.product_id,
        p.product_name,
        p.product_price,
        p.product_category,
        COUNT(s.quantity_ordered) AS total_unit_sold,
        SUM(total_value_usd) AS total_revenue_usd,
        ROUND(total_revenue_usd / total_unit_sold, 2) AS average_sale_value_usd,
        MIN(s.sale_date) AS first_sale_product,
        MAX(s.sale_date) AS last_sale_product

    FROM source p
    LEFT JOIN RAW.RAW_SIMULATION.int__sales_with_exchange_rates s ON p.product_id = s.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.product_price,
        p.product_category

)

SELECT * FROM metrics


        );
