select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




select
    customer_email as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_email is not null
group by customer_email
having count(*) > 1




    ) dbt_internal_test
