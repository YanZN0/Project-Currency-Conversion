select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select customer_name
from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_name is null




    ) dbt_internal_test
