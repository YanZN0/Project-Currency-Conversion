



        create or replace transient table RAW.RAW_SIMULATION.int_sales_with_exchange_rates
         as
        (


WITH applying_exchange_rates AS (
    SELECT

        s.sale_id,
        s.sale_date,
        s.customer_id,
        s.product_id,
        s.store_id,
        s.product_unit_price,
        s.quantity_ordered,
        ROUND(sale_total_value, 2) AS original_total_value,
        s.currency,
        CASE
            WHEN s.currency = 'BRL' THEN ROUND(s.sale_total_value / 5.68, 2)
            WHEN s.currency = 'MXN' THEN ROUND(s.sale_total_value / 19.63, 2)
            WHEN s.currency = 'EUR' THEN ROUND(s.sale_total_value / 0.88, 2)
            WHEN s.currency = 'USD' THEN s.sale_total_value
        END AS total_value_usd,

        CURRENT_DATE AS rate_date

    FROM RAW.RAW_SIMULATION.stg_raw_simulation__sales s
    LEFT JOIN RAW.RAW_SIMULATION.stg_raw_simulation__exchange_rates e
        ON s.currency = e.currency


)


SELECT *
FROM applying_exchange_rates


        );
