select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select total_customers_orders
from RAW.RAW_SIMULATION.dim__customers
where total_customers_orders is null




    ) dbt_internal_test
