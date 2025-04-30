


WITH source AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.stg_raw_simulation__stores
),

metrics AS (

    SELECT
        s.store_id,
        s.store_name,
        s.store_city,
        s.state,
        COUNT(e.sale_id) AS total_sales_store,
        SUM(e.total_value_usd) AS total_revenue_store_usd,
        ROUND(total_revenue_store_usd / total_sales_store, 2) AS average_sale_value_usd,
        MIN(e.sale_date) AS first_sale,
        MAX(e.sale_date) AS last_sale

    FROM source s
    LEFT JOIN RAW.RAW_SIMULATION.int__sales_with_exchange_rates e ON s.store_id = e.store_id
    GROUP BY
        s.store_id,
        s.store_name,
        s.store_city,
        s.state
)

SELECT * FROM metrics




    WHERE last_sale > (
        SELECT MAX(last_sale)
        FROM RAW.RAW_SIMULATION.int__stores_metrics
        WHERE store_id = metrics.store_id
    )
