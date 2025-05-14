select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (






select product_1
from RAW.RAW_SIMULATION.most_common_product_bundles
where product_1 is null




    ) dbt_internal_test
