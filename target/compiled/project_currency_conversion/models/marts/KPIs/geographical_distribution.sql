

with stores as (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__stores_metrics
),

sales AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.fct__sales
),


store_sales_by_state_and_city AS (
    SELECT
        st.store_city,
        st.state,
        COUNT(s.sale_id) as total_sales,
        ROUND(SUM(s.total_value)) as revenue_generated


    FROM stores st
    LEFT JOIN sales s ON st.store_id = s.store_id
    GROUP BY  st.store_city, st.state
)


SELECT * FROM store_sales_by_state_and_city
