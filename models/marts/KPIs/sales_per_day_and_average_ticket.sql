{{ config(
    tags=["KPI"]
) }}

WITH sales AS (

    SELECT *
    FROM {{ ref("fct__sales") }}
),


sales_by_day AS (
    SELECT
        DATE_TRUNC('day', sale_date) as sale_date,
        COUNT(DISTINCT sale_id) as sales_by_day,
        ROUND(AVG(total_value)) as average_ticket
    FROM sales
    GROUP BY sale_date
)

SELECT * FROM sales_by_day
ORDER BY sale_date
