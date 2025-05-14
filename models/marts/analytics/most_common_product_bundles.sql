{{ config(
    tags=["KPI"]
) }}

WITH sales AS (

    SELECT *
    FROM {{ ref("fct__sales") }}
),

customers AS (
    SELECT *
    FROM {{ ref('dim__customers') }}
),

top_products_per_customer AS (
    SELECT
        c.customer_id,
        c.customer_name,
        s.product_id,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY COUNT(*) DESC
        ) AS rank_products_purchased

    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name, s.product_id
    QUALIFY rank_products_purchased <= 2
),

product_pairs AS (
    SELECT
        a.customer_id,
        a.customer_name,
        LEAST(a.product_id, b.product_id) AS product_1,
        GREATEST(a.product_id, b.product_id) AS product_2
    FROM top_products_per_customer a
    INNER JOIN top_products_per_customer b
    ON a.customer_id = b.customer_id AND a.product_id <> b.product_id
    WHERE a.product_id < b.product_id
)

SELECT DISTINCT *
FROM product_pairs
