
  create or replace   view RAW.RAW_SIMULATION.stg_raw_simlation__exchange_rates

   as (
    with columns_renamed as (
    select
            sales_id                    as sale_id,
            original_total_value        as original_total_value,
            currency                    as currency,
            total_value_usd             as total_value_usd,
            conversion_date             as conversion_date

    from RAW.RAW_SIMULATION.EXCHANGE_RATES

)

select * from columns_renamed
  );
