select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select currency
from RAW.RAW_SIMULATION.sales_by_currency
where currency is null




    ) dbt_internal_test
