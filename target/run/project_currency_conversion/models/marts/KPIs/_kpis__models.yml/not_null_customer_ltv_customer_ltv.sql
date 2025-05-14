select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select customer_ltv
from RAW.RAW_SIMULATION.customer_ltv
where customer_ltv is null




    ) dbt_internal_test
