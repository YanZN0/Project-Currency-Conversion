{{ config(
    tags=["KPI"]
) }}

WITH stock AS (
    SELECT *
    FROM {{ ref('stg_raw_simulation__stock') }}
),

stock_levels AS (

    SELECT
        product_id,
        store_id,
        quantity_available,
        CASE
            WHEN quantity_available = 0 THEN 'ZERO_STOCK'
            WHEN quantity_available < 0 THEN 'NEGATIVE_STOCK'
            ELSE 'OK'
        END as stock_status

    FROM stock
)

select * from stock_levels
