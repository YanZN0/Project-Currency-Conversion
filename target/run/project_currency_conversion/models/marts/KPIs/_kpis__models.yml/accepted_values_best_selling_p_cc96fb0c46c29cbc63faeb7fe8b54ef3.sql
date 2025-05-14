select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




with all_values as (

    select
        ranking_type as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.best_selling_products_by_category
    group by ranking_type

)

select *
from all_values
where value_field not in (
    'REVENUE','ORDERS'
)




    ) dbt_internal_test
