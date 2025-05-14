select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select customer_vip
from RAW.RAW_SIMULATION.vip_or_non_vip_customer_behavior
where customer_vip is null




    ) dbt_internal_test
