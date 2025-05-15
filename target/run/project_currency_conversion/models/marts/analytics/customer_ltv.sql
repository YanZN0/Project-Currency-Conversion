
  create or replace   view RAW.RAW_SIMULATION.customer_ltv

   as (


WITH customers AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.dm__customers_metrics
),

ltv AS (
    SELECT
        customer_id,
        customer_name,
        total_spend AS customer_ltv
    FROM customers
)

SELECT * FROM ltv
  );
