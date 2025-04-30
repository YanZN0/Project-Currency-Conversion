select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select sale_total_value
from RAW.RAW_SIMULATION.stg_raw_simulation__sales
where sale_total_value is null




    ) dbt_internal_test
