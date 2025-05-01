{{
    config(
      materialized = 'incremental',
      unique_key = 'product_id',
      incremental_strategy = 'merge'
    )
}}

WITH source AS (
    SELECT *
    FROM {{ ref('stg_raw_simulation__products') }}

),

metrics AS (

    SELECT
        p.product_id,
        p.product_name,
        p.product_price,
        p.product_category,
        COUNT(s.sale_id) AS total_sales_count,
        SUM(total_value_usd) AS total_revenue_usd,
        ROUND(total_revenue_usd / total_sales_count, 2) AS average_sale_value_usd,
        MIN(s.sale_date) AS first_sale_product,
        MAX(s.sale_date) AS last_sale_product

    FROM source p
    LEFT JOIN {{ ref('int__sales_with_exchange_rates') }} s ON p.product_id = s.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.product_price,
        p.product_category

)

SELECT * FROM metrics

{% if is_incremental() %}

    WHERE last_sale_product > (
        SELECT MAX(last_sale_product)
        FROM {{ this }}
        WHERE product_id = metrics.product_id
    )
{% endif %}
