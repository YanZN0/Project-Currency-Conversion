
    
    

select
    product_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.int__products_metrics
where product_id is not null
group by product_id
having count(*) > 1


