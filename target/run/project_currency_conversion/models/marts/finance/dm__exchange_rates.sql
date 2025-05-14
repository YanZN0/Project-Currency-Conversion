
  create or replace   view RAW.RAW_SIMULATION.dm__exchange_rates
  
   as (
    WITH exchange_rates AS (

    SELECT *
    FROM RAW.RAW_SIMULATION.int__sales_with_exchange_rates

),

exchange_rates_separation AS (

    SELECT

        currency AS of_currency,

        'USD' AS to_currency,

        ROUND(original_total_value / total_value_usd, 2) AS exchange_rate_used,

        CURRENT_DATE AS exchange_rate_date

    FROM exchange_rates

)

SELECT * FROM exchange_rates_separation
  );

