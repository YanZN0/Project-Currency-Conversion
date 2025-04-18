WITH columns_renamed AS (
    SELECT
        sales_id AS sale_id,
        original_total_value,
        currency,
        total_value_usd,
        conversion_date

    FROM {{ source('RAW_SIMULATION', 'EXCHANGE_RATES') }}

)

SELECT * FROM columns_renamed
