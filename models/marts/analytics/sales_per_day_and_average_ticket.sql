{{ config(
    tags=["KPI"]
) }}

WITH sales AS (

    SELECT *
    FROM {{ ref("fct__sales") }}
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
