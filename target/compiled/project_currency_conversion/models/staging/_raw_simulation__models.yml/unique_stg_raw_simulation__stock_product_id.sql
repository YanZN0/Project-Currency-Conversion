



select
    product_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__stock
where product_id is not null
group by product_id
having count(*) > 1
