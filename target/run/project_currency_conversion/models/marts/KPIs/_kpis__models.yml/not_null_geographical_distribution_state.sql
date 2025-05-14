select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select state
from RAW.RAW_SIMULATION.geographical_distribution
where state is null




    ) dbt_internal_test
