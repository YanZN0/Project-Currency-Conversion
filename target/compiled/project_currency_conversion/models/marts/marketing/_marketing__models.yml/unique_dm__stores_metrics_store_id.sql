



select
    store_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.dm__stores_metrics
where store_id is not null
group by store_id
having count(*) > 1
