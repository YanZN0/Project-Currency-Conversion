select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select date
from RAW.RAW_SIMULATION.product_performance_over_time
where date is null




    ) dbt_internal_test
