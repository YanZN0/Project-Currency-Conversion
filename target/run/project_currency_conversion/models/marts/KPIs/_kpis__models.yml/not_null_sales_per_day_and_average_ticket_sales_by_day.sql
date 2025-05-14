select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select sales_by_day
from RAW.RAW_SIMULATION.sales_per_day_and_average_ticket
where sales_by_day is null




    ) dbt_internal_test
