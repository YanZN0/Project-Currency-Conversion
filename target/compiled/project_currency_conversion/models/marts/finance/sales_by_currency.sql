

with sales as (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__sales_with_exchange_rates
),

total_values_by_currency AS (
    SELECT

        currency,
        ROUND(SUM(original_total_value)) as total_sold_by_currency,

    FROM sales s
    GROUP BY currency
),

sale_total_value AS (
    SELECT

            SUM(total_sold_by_currency) as value_total

    FROM total_values_by_currency
),

sales_by_currency AS (
    SELECT

        tvc.currency,
        tvc.total_sold_by_currency,
        ROUND( tvc.total_sold_by_currency * 100 / stv.value_total, 2 ) || '%' AS percentage_of_foreign_exchange_exposure

    FROM sale_total_value stv
    JOIN total_values_by_currency tvc
)

SELECT * FROM sales_by_currency
ORDER BY percentage_of_foreign_exchange_exposure DESC
