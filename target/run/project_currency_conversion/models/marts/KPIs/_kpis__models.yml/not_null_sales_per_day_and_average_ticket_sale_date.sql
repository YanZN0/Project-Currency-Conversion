select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select sale_date
from RAW.RAW_SIMULATION.sales_per_day_and_average_ticket
where sale_date is null




    ) dbt_internal_test
