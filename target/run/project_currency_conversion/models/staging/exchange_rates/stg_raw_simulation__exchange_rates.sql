
  create or replace   view RAW.RAW_SIMULATION.stg_raw_simulation__exchange_rates
  
   as (
    WITH columns_renamed AS (
    SELECT

        original_total_value,
        currency,
        total_value_usd,
        date_conversion

    FROM RAW.RAW_SIMULATION.EXCHANGE_RATES

)

SELECT * FROM columns_renamed
  );

