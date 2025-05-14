select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select total_revenue_store
from RAW.RAW_SIMULATION.dim__stores
where total_revenue_store is null




    ) dbt_internal_test
