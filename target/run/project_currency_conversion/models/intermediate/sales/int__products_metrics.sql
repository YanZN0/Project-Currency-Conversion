-- back compat for old kwarg name

  begin;











    merge into RAW.RAW_SIMULATION.int__products_metrics as DBT_INTERNAL_DEST
        using RAW.RAW_SIMULATION.int__products_metrics__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.product_id = DBT_INTERNAL_DEST.product_id))


    when matched then update set
        "PRODUCT_ID" = DBT_INTERNAL_SOURCE."PRODUCT_ID","PRODUCT_NAME" = DBT_INTERNAL_SOURCE."PRODUCT_NAME","PRODUCT_PRICE" = DBT_INTERNAL_SOURCE."PRODUCT_PRICE","PRODUCT_CATEGORY" = DBT_INTERNAL_SOURCE."PRODUCT_CATEGORY","TOTAL_UNIT_SOLD" = DBT_INTERNAL_SOURCE."TOTAL_UNIT_SOLD","TOTAL_REVENUE_USD" = DBT_INTERNAL_SOURCE."TOTAL_REVENUE_USD","AVERAGE_SALE_VALUE_USD" = DBT_INTERNAL_SOURCE."AVERAGE_SALE_VALUE_USD","FIRST_SALE_PRODUCT" = DBT_INTERNAL_SOURCE."FIRST_SALE_PRODUCT","LAST_SALE_PRODUCT" = DBT_INTERNAL_SOURCE."LAST_SALE_PRODUCT"


    when not matched then insert
        ("PRODUCT_ID", "PRODUCT_NAME", "PRODUCT_PRICE", "PRODUCT_CATEGORY", "TOTAL_UNIT_SOLD", "TOTAL_REVENUE_USD", "AVERAGE_SALE_VALUE_USD", "FIRST_SALE_PRODUCT", "LAST_SALE_PRODUCT")
    values
        ("PRODUCT_ID", "PRODUCT_NAME", "PRODUCT_PRICE", "PRODUCT_CATEGORY", "TOTAL_UNIT_SOLD", "TOTAL_REVENUE_USD", "AVERAGE_SALE_VALUE_USD", "FIRST_SALE_PRODUCT", "LAST_SALE_PRODUCT")

;
    commit;
