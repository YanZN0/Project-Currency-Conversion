select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select ranking_type
from RAW.RAW_SIMULATION.best_selling_products_by_category
where ranking_type is null




    ) dbt_internal_test
