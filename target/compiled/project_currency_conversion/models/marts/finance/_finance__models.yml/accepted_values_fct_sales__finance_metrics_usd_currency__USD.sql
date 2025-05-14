



with all_values as (

    select
        currency as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.fct_sales__finance_metrics_usd
    group by currency

)

select *
from all_values
where value_field not in (
    'USD'
)
