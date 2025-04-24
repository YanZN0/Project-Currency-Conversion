


WITH applying_exchange_rates AS (
    SELECT

        s.sale_id,
        s.sale_date,
        ROUND(sale_total_value, 2) AS original_total_value,
        s.currency,
        CASE
            WHEN s.currency = 'BRL' THEN ROUND(s.sale_total_value * 5.81, 2)
            WHEN s.currency = 'MXN' THEN ROUND(s.sale_total_value * 19.71, 2)
            WHEN s.currency = 'EUR' THEN ROUND(s.sale_total_value * 0.87, 2)
            WHEN s.currency = 'USD' THEN s.sale_total_value
        END AS total_value_usd,

        CURRENT_DATE AS date_conversion

    FROM RAW.RAW_SIMULATION.stg_raw_simulation__sales s
    LEFT JOIN RAW.RAW_SIMULATION.stg_raw_simulation__exchange_rates e
        ON s.currency = e.currency


)


SELECT *
FROM applying_exchange_rates


      where sale_id not in (select sale_id from RAW.RAW_SIMULATION.int_sales_with_exchange_rates)
