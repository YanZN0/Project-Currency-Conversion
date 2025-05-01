WITH products AS (

    SELECT *
    FROM {{ ref("dim__products") }}
),

sales AS (

    SELECT *
    FROM {{ ref('fct__sales') }}

),

best_selling_products_by_category_revenue AS (

    SELECT

        p.product_id,
        p.product_name,
        p.product_category,
        p.total_revenue_usd,

        RANK() OVER (
            PARTITION BY p.product_category
            ORDER BY ROUND(p.total_revenue_usd, 2) DESC) AS rank_products

    FROM products p
    QUALIFY rank_products <= 5
),

best_selling_products_by_category_orders AS (

    SELECT

        p.product_id,
        p.product_name,
        p.product_category,
        p.total_sales_count,

        RANK() OVER (
            PARTITION BY p.product_category
            ORDER BY p.total_sales_count DESC) AS rank_products

    FROM products p
    QUALIFY rank_products <= 5
)

SELECT

    product_id,
    product_name,
    product_category,
    ROUND(total_revenue_usd) AS total_revenue_and_orders,
    rank_products,
    'REVENUE' AS ranking_type

FROM best_selling_products_by_category_revenue

UNION ALL

SELECT

    product_id,
    product_name,
    product_category,
    total_sales_count AS total_sales,
    rank_products,
    'ORDERS' AS ranking_type

FROM best_selling_products_by_category_orders
