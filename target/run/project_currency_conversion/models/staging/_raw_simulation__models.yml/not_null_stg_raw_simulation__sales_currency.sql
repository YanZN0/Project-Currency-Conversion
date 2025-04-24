select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select currency
from RAW.RAW_SIMULATION.stg_raw_simulation__sales
where currency is null




    ) dbt_internal_test
