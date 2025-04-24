select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select sale_id
from RAW.RAW_SIMULATION.stg_raw_simulation__exchange_rates
where sale_id is null




    ) dbt_internal_test
