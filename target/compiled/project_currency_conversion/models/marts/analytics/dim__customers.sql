with customers as (
    select *
    from RAW.RAW_SIMULATION.int__customers_metrics
),

customers_metrics_joined as (
    select

        customer_id,
        customer_name,
        customer_vip,
        total_customer_orders,
        total_spend,
        first_purchase,
        last_purchase

    from customers
)

select * from customers_metrics_joined
