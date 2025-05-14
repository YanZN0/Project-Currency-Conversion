{{ config(
    tags=["KPI"]
) }}

WITH customers AS (
    SELECT *
    FROM {{ ref('dim__customers') }}
),

ltv AS (
    SELECT
        customer_id,
        customer_name,
        total_spend AS customer_ltv
    FROM customers
)

SELECT * FROM ltv
