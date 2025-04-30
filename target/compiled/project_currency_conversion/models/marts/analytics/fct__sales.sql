with sales as (
    select *
    from RAW.RAW_SIMULATION.int__sales_with_exchange_rates
),


sales_with_metrics_usd as (
    select
            sale_id,
            sale_date,
            customer_id,
            product_id,
            store_id,
            product_unit_price,
            quantity_ordered,
            original_total_value,
            currency as of_currency,
            total_value_usd,
            conversion_date

    from sales
)

select * from sales_with_metrics_usd
