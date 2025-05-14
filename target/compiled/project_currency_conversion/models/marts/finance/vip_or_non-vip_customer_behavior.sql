


WITH customers AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.dim__customers
),

products AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.dim__products
),

sales AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.fct__sales
),

is_vip AS (
    SELECT *
    FROM customers
    WHERE customer_vip = 'FALSE'
)

select * from is_vip
