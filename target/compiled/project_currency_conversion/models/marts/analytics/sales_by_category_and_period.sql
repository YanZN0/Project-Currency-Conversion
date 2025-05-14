

sales AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.fct_sales__finance_metrics_usd
),


strategic_analysis as (
    SELECT
        p.product_category,
        DATE_TRUNC('month', s.sale_date) as month,
        CASE
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (12,1,2) THEN 'SUMMER'
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (3,4,5) THEN 'FALL'
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (6,7,8) THEN 'WINTER'
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (9,10,11) THEN 'SPRING'
            ELSE NULL
        END as station,

        SUM(ROUND(s.total_value)) as total_revenue_by_month,
        COUNT(s.sale_id) as total_sales_by_month


    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.product_category, DATE_TRUNC('month', s.sale_date), station
)

SELECT * FROM strategic_analysis
