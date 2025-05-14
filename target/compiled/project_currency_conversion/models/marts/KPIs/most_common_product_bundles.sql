

WITH sales AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.fct__sales
),


customers as (
  select *
  from RAW.RAW_SIMULATION.dim__customers
),


top_products_per_customer AS (
    SELECT
            c.customer_id,
            c.customer_name,
            ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY COUNT(*) DESC) as rank_products_purchased,
            s.product_id


    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name, s.product_id
    qualify rank_products_purchased <= 2
),

product_pairs AS (
    SELECT
        a.customer_id,
        a.customer_name,
        LEAST(a.product_id, b.product_id) AS product_1,
        GREATEST(a.product_id, b.product_id) AS product_2
    FROM top_products_per_customer a
    JOIN top_products_per_customer b
        ON a.customer_id = b.customer_id
        AND a.product_id <> b.product_id
    WHERE a.product_id < b.product_id
)
SELECT DISTINCT *
FROM product_pairs
