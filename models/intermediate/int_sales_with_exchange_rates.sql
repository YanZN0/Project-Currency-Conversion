{{
    config(
      materialized = 'incremental',
      unique_key = 'sale_id',
      incremental_strategy = 'merge'
    )
}}




applying_exchange_rates as (
    select 
    s.sale_id,
    s.sale_date,
    s.sale_total_value,
    s.currency,
    CASE
        WHEN s.currency = 'BRL' THEN ROUND(s.sale_total_value * 5,697 )
        WHEN s.currency = 'BRL' THEN ROUND(s.sale_total_value * 5,697 )


    from ref{{ ('stg_raw_simulation__sales') }} s
    left join ref{{ ('stg_raw_simulation__exchange_rates') }} e
)