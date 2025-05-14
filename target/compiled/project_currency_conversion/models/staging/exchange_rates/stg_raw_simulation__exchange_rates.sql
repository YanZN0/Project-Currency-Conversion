WITH columns_renamed AS (
    SELECT

        original_total_value,
        currency,
        total_value_usd,
        date_conversion

    FROM RAW.RAW_SIMULATION.EXCHANGE_RATES

)

SELECT * FROM columns_renamed