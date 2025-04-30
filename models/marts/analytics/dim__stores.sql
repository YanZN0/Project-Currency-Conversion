with stores as (
    select *
    from {{ ref('int__stores_metrics') }}
),

stores_metrics_joined as (

    select

        store_id,
        store_name,
        store_city,
        state,
        total_sales_store,
        total_revenue_store_usd,
        average_sale_value_usd,
        first_sale,
        last_sale

    from stores
)

select * from stores_metrics_joined
