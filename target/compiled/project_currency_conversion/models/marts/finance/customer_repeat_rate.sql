


with source as (
  select *
  from RAW.RAW_SIMULATION.dim__customers
),

percentage_of_repeat_customer_purchase as (
  select

    round( count_if(total_customer_orders > 1) * 1.0 / count(*) * 100,
    2
    ) as repeat_customer_rate_percentage

  from source
)

select * from percentage_of_repeat_customer_purchase
