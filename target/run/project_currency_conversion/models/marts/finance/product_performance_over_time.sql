



        create or replace transient table RAW.RAW_SIMULATION.product_performance_over_time
         as
        (

WITH products AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.dim__products
),

sales AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.fct__sales
),

revenue_and_unit_month AS (
    SELECT
        p.product_id,
        p.product_name,
        DATE_TRUNC('month', s.sale_date) as month,
        SUM(s.quantity_ordered) as total_unit_per_month,
        ROUND(SUM(s.total_value)) as revenue_generated_per_month

    FROM products p
    LEFT JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name, DATE_TRUNC('month', s.sale_date)

),

revenue_and_unit_week AS (
    SELECT
        p.product_id,
        p.product_name,
        DATE_TRUNC('week', s.sale_date) as week,
        SUM(s.quantity_ordered) as total_unit_per_week,
        ROUND(SUM(s.total_value)) as revenue_generated_per_week

    FROM products p
    LEFT JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name, DATE_TRUNC('week', s.sale_date)

)

SELECT
    product_id,
    product_name,
    month as date,
    total_unit_per_month as total_unit_sold,
    revenue_generated_per_month as total_revenue_generated,
    'MONTH' as period_type
FROM revenue_and_unit_month
ORDER BY date, product_id



UNION ALL

SELECT
    product_id,
    product_name,
    week as date,
    total_unit_per_week as total_unit_sold,
    revenue_generated_per_week as total_revenue_generated,
    'WEEK' as period_type
FROM revenue_and_unit_week

ORDER BY date, product_id
        );
