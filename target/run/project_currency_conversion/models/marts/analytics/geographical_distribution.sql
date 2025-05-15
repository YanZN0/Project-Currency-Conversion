
  create or replace   view RAW.RAW_SIMULATION.geographical_distribution

   as (


WITH stores AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.int__stores_metrics
),

sales AS (
    SELECT *
    FROM RAW.RAW_SIMULATION.fct_sales__finance_metrics_usd
),

store_sales_by_state_and_city AS (
    SELECT
        st.store_city,
        st.state,
        COUNT(s.sale_id) AS total_sales,
        ROUND(SUM(s.total_value)) AS revenue_generated

    FROM stores st
    LEFT JOIN sales s ON st.store_id = s.store_id
    GROUP BY st.store_city, st.state
)

SELECT * FROM store_sales_by_state_and_city
  );
