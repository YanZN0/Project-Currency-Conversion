{{ config(
    tags=["KPI"]
) }}

WITH customers AS (
    SELECT *
    FROM {{ ref('dm__customers_metrics') }}
),

ltv AS (
    SELECT
        customer_id,
        customer_name,
        total_spend AS customer_ltv
    FROM customers
)

SELECT * FROM ltv
