select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




select
    customer_vip as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.vip_or_non_vip_customer_behavior
where customer_vip is not null
group by customer_vip
having count(*) > 1




    ) dbt_internal_test
