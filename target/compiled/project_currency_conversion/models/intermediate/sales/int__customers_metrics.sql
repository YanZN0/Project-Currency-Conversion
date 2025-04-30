


WITH source AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.stg_raw_simulation__customers

),

metrics AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.customer_vip,
        COUNT(s.sale_id) AS total_customer_orders,
        SUM(s.total_value_usd) AS total_spend,
        MIN(s.sale_date) AS first_purchase,
        MAX(s.sale_date) AS last_purchase
    FROM source c
    LEFT JOIN RAW.RAW_SIMULATION.int__sales_with_exchange_rates s ON c.customer_id = s.customer_id
    WHERE s.sale_date IS NOT NULL
    GROUP BY c.customer_id, c.customer_name, c.customer_vip
)

SELECT * FROM metrics



    WHERE last_purchase > (
        SELECT MAX(last_purchase)
        FROM RAW.RAW_SIMULATION.int__customers_metrics
        WHERE customer_id = metrics.customer_id
    )
