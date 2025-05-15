
  create or replace   view RAW.RAW_SIMULATION.customer_repeat_rate

   as (



WITH customers AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.dm__customers_metrics
),

percentage_of_repeat_customer_purchase AS (
    SELECT

        round(
            count_if(total_customer_orders > 1) * 1.0 / count(*) * 100,
            2
        ) AS repeat_customer_rate_percentage

    FROM customers
)

SELECT * FROM percentage_of_repeat_customer_purchase
  );
