select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select original_total_value
from RAW.RAW_SIMULATION.fct__sales
where original_total_value is null




    ) dbt_internal_test
