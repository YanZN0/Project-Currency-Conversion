{{ config(
    tags=["KPI"]
) }}


WITH customers AS (
    SELECT *
    FROM {{ ref('dim__customers') }}
),

products AS (

    SELECT *
    FROM {{ ref("dim__products") }}
),

sales AS (

    SELECT *
    FROM {{ ref("fct__sales") }}
),

base AS (
    SELECT
        c.customer_id,
        c.total_spend,
        c.total_customer_orders,
        c.customer_vip,
        p.product_category

    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    LEFT JOIN products p ON s.product_id = p.product_id
),

most_purchased_category AS (
    SELECT
        customer_vip,
        product_category,
        COUNT(*) AS category_purchase

    FROM base
    GROUP BY customer_vip, product_category
),

ranked_categories AS (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY customer_vip
            ORDER BY product_category
        ) AS rank_categories

    FROM most_purchased_category
    QUALIFY rank_categories = 1
),

behavior_vip_or_non_vip AS (
    SELECT

        c.customer_vip,

        ROUND(SUM(c.total_spend) / SUM(c.total_customer_orders)) AS average_ticket,
        ROUND(AVG(c.total_customer_orders)) AS frequency

    FROM customers c
    GROUP BY c.customer_vip
)

SELECT
    b.customer_vip,
    b.average_ticket,
    b.frequency,
    rk.product_category AS most_purchased_category
FROM behavior_vip_or_non_vip b
LEFT JOIN ranked_categories rk ON b.customer_vip = rk.customer_vip
