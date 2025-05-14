

WITH sales AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.fct_sales__finance_metrics_usd
),

sales_by_day AS (
    SELECT
        DATE_TRUNC('day', sale_date) AS sale_date,
        COUNT(DISTINCT sale_id) AS sales_by_day,
        ROUND(AVG(total_value)) AS average_ticket
    FROM sales
    GROUP BY sale_date
)

SELECT * FROM sales_by_day
ORDER BY sale_date
