

WITH customers AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.dim__customers
),

ltv AS (
    SELECT
        customer_id,
        customer_name,
        total_spend as customer_ltv
    FROM customers
)

select * from ltv
