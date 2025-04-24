select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select currency
from RAW.RAW_SIMULATION.int_sales_with_exchange_rates
where currency is null




    ) dbt_internal_test
