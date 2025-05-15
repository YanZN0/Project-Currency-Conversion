
    
    

with all_values as (

    select
        currency as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.sales_by_currency
    group by currency

)

select *
from all_values
where value_field not in (
    'BRL','USD','MXN','EUR'
)


