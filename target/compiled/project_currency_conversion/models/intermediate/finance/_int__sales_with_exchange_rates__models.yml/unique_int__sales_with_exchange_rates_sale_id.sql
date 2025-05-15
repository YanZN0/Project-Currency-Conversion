
    
    

select
    sale_id as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.int__sales_with_exchange_rates
where sale_id is not null
group by sale_id
having count(*) > 1


