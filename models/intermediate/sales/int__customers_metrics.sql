with source as (
    select *
    from {{ ref('stg_raw_simulation__customers') }}

),


metrics as (
    select
        c.customer_id,
        c.customer_name,
        COUNT(s.sale_id) as total_customer_orders,
        ROUND(SUM(s.total_value_usd), 2) as total_spent,
        MIN(s.sale_date) as first_purchase,
        MAX(s.sale_date) as last_purchase,
        c.customer_vip
    from source c
    left join {{ ref('int__sales_with_exchange_rates') }} s ON c.customer_id = s.customer_id
    group by c.customer_id, c.customer_name, c.customer_vip
)

select * from metrics
