

WITH orders_per_day AS (
SELECT 
    date_date,
    COUNT(DISTINCT orders_id) AS Total_transactions,
    ROUND(SUM(revenue),0) AS Total_revenue,
    ROUND(SUM(operational_margin),0) AS Operational_Margin,
    ROUND(SUM(purchase_cost),0) AS Total_purchase_cost,
    ROUND(SUM(quantity),0) AS quantity,
    ROUND(SUM(margin),0) AS margin,
    ROUND(sum(shipping_fee),0) AS Total_shipping_fees,
    ROUND(SUM(log_cost),0) AS Total_log_costs,
    ROUND(SUM(ship_cost),0) AS ship_cost,
    SUM(quantity) AS Total_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
)

SELECT 
    date_date,
    Total_transactions,
    Total_revenue,
    Operational_Margin,
    Total_purchase_cost,
    Quantity,
    Margin,
    Total_shipping_fees,
    Total_log_costs,
    Ship_cost,
    Total_sold,
    ROUND(Total_revenue / NULLIF(Total_transactions, 0),2) AS Average_basket
FROM orders_per_day
ORDER BY date_date DESC
