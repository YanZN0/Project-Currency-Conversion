



select
    store_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__stock
where store_id is not null
group by store_id
having count(*) > 1
