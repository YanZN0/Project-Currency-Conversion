
    
    

select
    currency as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.sales_by_currency
where currency is not null
group by currency
having count(*) > 1


