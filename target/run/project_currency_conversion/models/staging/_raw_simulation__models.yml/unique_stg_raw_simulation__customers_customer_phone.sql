select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




select
    customer_phone as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_phone is not null
group by customer_phone
having count(*) > 1




    ) dbt_internal_test
