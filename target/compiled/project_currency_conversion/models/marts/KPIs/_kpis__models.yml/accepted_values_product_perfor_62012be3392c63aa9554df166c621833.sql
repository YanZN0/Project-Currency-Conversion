



with all_values as (

    select
        period_type as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.product_performance_over_time
    group by period_type

)

select *
from all_values
where value_field not in (
    'MONTH','WEEK'
)
