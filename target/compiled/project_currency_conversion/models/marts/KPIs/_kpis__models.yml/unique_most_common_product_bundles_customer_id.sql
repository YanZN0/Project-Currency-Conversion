



select
    customer_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.most_common_product_bundles
where customer_id is not null
group by customer_id
having count(*) > 1
