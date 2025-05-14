select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select total_value_usd
from RAW.RAW_SIMULATION.fct__sales
where total_value_usd is null




    ) dbt_internal_test
