



with all_values as (

    select
        custumer_vip as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.int__customers_metrics
    group by custumer_vip

)

select *
from all_values
where value_field not in (
    'TRUE','FALSE'
)
