select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select store_id
from RAW.RAW_SIMULATION.dim__stores
where store_id is null




    ) dbt_internal_test
