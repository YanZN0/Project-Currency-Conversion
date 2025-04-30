



with all_values as (

    select
        customer_vip as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.stg_raw_simulation__customers
    group by customer_vip

)

select *
from all_values
where value_field not in (
    'TRUE','FALSE'
)
