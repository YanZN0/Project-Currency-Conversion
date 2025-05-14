select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select store_city
from RAW.RAW_SIMULATION.geographical_distribution
where store_city is null




    ) dbt_internal_test
