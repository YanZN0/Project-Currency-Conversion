select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




with all_values as (

    select
        customer_vip as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.int__customers_metrics
    group by customer_vip

)

select *
from all_values
where value_field not in (
    'TRUE','FALSE'
)




    ) dbt_internal_test
