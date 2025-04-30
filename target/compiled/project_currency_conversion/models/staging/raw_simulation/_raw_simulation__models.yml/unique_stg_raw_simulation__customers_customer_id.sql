



select
    customer_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__customers
where customer_id is not null
group by customer_id
having count(*) > 1
