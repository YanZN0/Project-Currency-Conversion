select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select customer_phone
from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_phone is null




    ) dbt_internal_test
