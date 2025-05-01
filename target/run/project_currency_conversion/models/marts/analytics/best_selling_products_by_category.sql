



        create or replace transient table RAW.RAW_SIMULATION.best_selling_products_by_category
         as
        (with products as (

    select *
    from RAW.RAW_SIMULATION.dim__products
),

sales as (

    select *
    from RAW.RAW_SIMULATION.fct__sales

),


best_selling_products_by_category_revenue as (

    select

        p.product_id,
        p.product_name,
        p.product_category,
        total_revenue_usd,

        RANK() OVER (PARTITION BY p.product_category ORDER BY ROUND(p.total_revenue_usd, 2) DESC) as rank_products


    from products p
    qualify rank_products <= 5
),

best_selling_products_by_category_orders as (

    select

        p.product_id,
        p.product_name,
        p.product_category,
        total_sales_count,

        RANK() OVER (PARTITION BY p.product_category ORDER BY p.total_sales_count DESC) as rank_products

    from products p
    qualify rank_products <= 5
)

select

    product_id,
    product_name,
    product_category,
    ROUND(total_revenue_usd) as total_revenue_and_orders,
    rank_products,
    'REVENUE' as ranking_type

from best_selling_products_by_category_revenue

union all

select

    product_id,
    product_name,
    product_category,
    total_sales_count as total_sales,
    rank_products,
    'ORDERS' as ranking_type

from best_selling_products_by_category_orders
        );
