with products as (
    select *
    from RAW.RAW_SIMULATION.int__products_metrics
),

products_metrics_joined as (
    select

        product_id,
        product_price,
        product_category,
        total_sales_count,
        total_revenue_usd,
        average_sale_value_usd,
        first_sale_product,
        last_sale_product

    from products
)

select * from products_metrics_joined
