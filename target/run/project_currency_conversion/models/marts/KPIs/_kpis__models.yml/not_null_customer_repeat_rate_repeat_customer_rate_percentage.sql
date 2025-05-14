select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select repeat_customer_rate_percentage
from RAW.RAW_SIMULATION.customer_repeat_rate
where repeat_customer_rate_percentage is null




    ) dbt_internal_test
