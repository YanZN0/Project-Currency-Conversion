
  create or replace   view RAW.RAW_SIMULATION.sales_by_currency

   as (


WITH sales AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__sales_with_exchange_rates
),

total_values_by_currency AS (
    SELECT

        currency,
        ROUND(SUM(original_total_value)) AS total_sold_by_currency

    FROM sales
    GROUP BY currency
),

sale_total_value AS (
    SELECT

        SUM(total_sold_by_currency) AS value_total

    FROM total_values_by_currency
),

sales_by_currency AS (
    SELECT

        tvc.currency,
        tvc.total_sold_by_currency,
        ROUND(tvc.total_sold_by_currency * 100 / stv.value_total, 2) || '%' AS percentage_of_foreign_exchange_exposure

    FROM sale_total_value stv
    INNER JOIN total_values_by_currency tvc
)

SELECT * FROM sales_by_currency
ORDER BY percentage_of_foreign_exchange_exposure DESC
  );
