select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




with child as (
    select sale_id as from_field
    from RAW.RAW_SIMULATION.stg_raw_simulation__exchange_rates
    where sale_id is not null
),

parent as (
    select sale_id as to_field
    from RAW.RAW_SIMULATION.stg_raw_simulation__sales
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null




    ) dbt_internal_test
