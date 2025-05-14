select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select customer_vip
from RAW.RAW_SIMULATION.dim__customers
where customer_vip is null




    ) dbt_internal_test
