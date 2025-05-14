



with all_values as (

    select
        currency as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.fct__sales
    group by currency

)

select *
from all_values
where value_field not in (
    'USD'
)
