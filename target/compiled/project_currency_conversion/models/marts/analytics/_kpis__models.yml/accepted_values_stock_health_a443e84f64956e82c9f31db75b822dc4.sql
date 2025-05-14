



with all_values as (

    select
        stock_status as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.stock_health
    group by stock_status

)

select *
from all_values
where value_field not in (
    'OK','ZERO_STOCK','NEGATIVE_STOCK'
)
