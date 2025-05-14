select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select total_revenue_usd
from RAW.RAW_SIMULATION.dim__products
where total_revenue_usd is null




    ) dbt_internal_test
