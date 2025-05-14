{{ config(
    tags=["KPI"]
) }}

WITH products AS (

    SELECT *
    FROM {{ ref("dm__products_metrics") }}
),

sales AS (

    SELECT *
    FROM {{ ref("fct_sales__finance_metrics_usd") }}
),

revenue_and_unit_month AS (
    SELECT
        p.product_id,
        p.product_name,
        DATE_TRUNC('month', s.sale_date) AS month,
        SUM(s.quantity_ordered) AS total_unit_per_month,
        ROUND(SUM(s.total_value)) AS revenue_generated_per_month

    FROM products p
    LEFT JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name, month

),

revenue_and_unit_week AS (
    SELECT
        p.product_id,
        p.product_name,
        DATE_TRUNC('week', s.sale_date) AS week,
        SUM(s.quantity_ordered) AS total_unit_per_week,
        ROUND(SUM(s.total_value)) AS revenue_generated_per_week

    FROM products p
    LEFT JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name, week

)

SELECT
    product_id,
    product_name,
    month AS date,
    total_unit_per_month AS total_unit_sold,
    revenue_generated_per_month AS total_revenue_generated,
    'MONTH' AS period_type
FROM revenue_and_unit_month

UNION ALL

SELECT
    product_id,
    product_name,
    week AS date,
    total_unit_per_week AS total_unit_sold,
    revenue_generated_per_week AS total_revenue_generated,
    'WEEK' AS period_type
FROM revenue_and_unit_week

ORDER BY date, product_id
