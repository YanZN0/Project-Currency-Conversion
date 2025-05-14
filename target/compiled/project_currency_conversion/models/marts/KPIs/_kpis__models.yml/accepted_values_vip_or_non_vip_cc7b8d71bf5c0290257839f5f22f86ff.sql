



with all_values as (

    select
        most_purchased_category as value_field,
        count(*) as n_records

    from RAW.RAW_SIMULATION.vip_or_non_vip_customer_behavior
    group by most_purchased_category

)

select *
from all_values
where value_field not in (
    'Roupas','Eletrônicos','Brinquedos','Alimentos','Livros'
)
