select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select total_value_usd
from RAW.RAW_SIMULATION.int_sales_with_exchange_rates
where total_value_usd is null




    ) dbt_internal_test
