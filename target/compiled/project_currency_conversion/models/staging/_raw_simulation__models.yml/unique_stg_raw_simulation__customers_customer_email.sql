



select
    customer_email as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_email is not null
group by customer_email
having count(*) > 1
