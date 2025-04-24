select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select customer_date_of_birth
from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_date_of_birth is null




    ) dbt_internal_test
