



select
    sale_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.stg_raw_simulation__sales
where sale_id is not null
group by sale_id
having count(*) > 1
