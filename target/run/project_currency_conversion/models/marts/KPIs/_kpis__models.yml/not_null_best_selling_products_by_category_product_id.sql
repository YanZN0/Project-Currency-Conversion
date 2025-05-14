select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select product_id
from RAW.RAW_SIMULATION.best_selling_products_by_category
where product_id is null




    ) dbt_internal_test
