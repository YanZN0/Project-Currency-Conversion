



        create or replace transient table RAW.RAW_SIMULATION.sales_per_day_and_average_ticket
         as
        (

WITH sales AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.fct__sales
),


sales_by_day AS (
    SELECT
        DATE_TRUNC('day', sale_date) as sale_date,
        COUNT(DISTINCT sale_id) as sales_by_day,
        ROUND(AVG(total_value)) as average_ticket
    FROM sales
    GROUP BY sale_date
)

SELECT * FROM sales_by_day
ORDER BY sale_date
        );
