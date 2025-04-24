-- back compat for old kwarg name

  begin;











    merge into RAW.RAW_SIMULATION.int_sales_with_exchange_rates as DBT_INTERNAL_DEST
        using RAW.RAW_SIMULATION.int_sales_with_exchange_rates__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.sale_id = DBT_INTERNAL_DEST.sale_id))


    when matched then update set
        "SALE_ID" = DBT_INTERNAL_SOURCE."SALE_ID","SALE_DATE" = DBT_INTERNAL_SOURCE."SALE_DATE","ORIGINAL_TOTAL_VALUE" = DBT_INTERNAL_SOURCE."ORIGINAL_TOTAL_VALUE","CURRENCY" = DBT_INTERNAL_SOURCE."CURRENCY","TOTAL_VALUE_USD" = DBT_INTERNAL_SOURCE."TOTAL_VALUE_USD","DATE_CONVERSION" = DBT_INTERNAL_SOURCE."DATE_CONVERSION"


    when not matched then insert
        ("SALE_ID", "SALE_DATE", "ORIGINAL_TOTAL_VALUE", "CURRENCY", "TOTAL_VALUE_USD", "DATE_CONVERSION")
    values
        ("SALE_ID", "SALE_DATE", "ORIGINAL_TOTAL_VALUE", "CURRENCY", "TOTAL_VALUE_USD", "DATE_CONVERSION")

;
    commit;
