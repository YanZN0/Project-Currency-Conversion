select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (




select
    currency as unique_field,
    count(*) as n_records

from RAW.RAW_SIMULATION.sales_by_currency
where currency is not null
group by currency
having count(*) > 1




    ) dbt_internal_test
