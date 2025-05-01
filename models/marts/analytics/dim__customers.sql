WITH customers AS (
    SELECT *
    FROM {{ ref('int__customers_metrics') }}
),

customers_metrics_joined AS (
    SELECT

        customer_id,
        customer_name,
        customer_vip,
        total_customer_orders,
        total_spend,
        first_purchase,
        last_purchase

    FROM customers
)

SELECT * FROM customers_metrics_joined
