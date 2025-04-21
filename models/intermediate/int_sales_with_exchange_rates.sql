{{
    config(
      materialized = 'incremental',
      unique_key = 'sale_id',
      incremental_strategy = 'merge'
    )
}}


WITH applying_exchange_rates AS (
    SELECT
        s.sale_id,
        s.sale_date,
        s.currency,
        ROUND(sale_total_value, 2) AS sale_total_value,
        CASE
            WHEN s.currency = 'BRL' THEN ROUND(s.sale_total_value * 5.81, 2)
            WHEN s.currency = 'MXN' THEN ROUND(s.sale_total_value * 19.71, 2)
            WHEN s.currency = 'EUR' THEN ROUND(s.sale_total_value * 0.87, 2)
            WHEN s.currency = 'USD' THEN s.sale_total_value
        END AS total_value_usd,

        CURRENT_DATE AS data_conversion

    FROM {{ ref('stg_raw_simulation__sales') }} s
    LEFT JOIN {{ ref('stg_raw_simulation__exchange_rates') }} e
        ON s.currency = e.currency
)

{% if is_incremental() %}
  where s.sale_id not in (select sale_id from {{ this }})
{% endif %}

SELECT * FROM applying_exchange_rates
