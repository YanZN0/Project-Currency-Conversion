



        create or replace transient table RAW.RAW_SIMULATION.dim__exchange_rates
         as
        (with exchange_rates as (

    select *
    from RAW.RAW_SIMULATION.int__sales_with_exchange_rates

),

exchange_rates_separation as (

    select

        currency as of_currency,

        'USD' as to_currency,

        ROUND(original_total_value / total_value_usd, 2) as exchange_rate_used,

        CURRENT_DATE as exchange_rate_date

    from exchange_rates

)

select * from exchange_rates_separation
        );
