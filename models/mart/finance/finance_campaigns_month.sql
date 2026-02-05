SELECT
    EXTRACT(MONTH FROM date_date) AS datemonth, 
    SUM(ads_margin) AS ads_margin,
    ROUND(AVG(Average_basket),2) AS average_basket, 
    SUM(Operational_margin) AS Operational_margin,
    SUM(ads_cost) AS ads_cost, 
    SUM(impression) AS ads_impression,
    SUM(click) AS ads_clicks,
    SUM(quantity) AS quantity,
    SUM(Total_revenue) AS revenue,
    SUM(Total_purchase_cost) AS purchase_cost,
    SUM(margin) AS margin,
    SUM(Total_shipping_fees) AS shipping_fee,
    SUM(Total_log_costs) AS log_cost,
    SUM(ship_cost) AS ship_cost

FROM {{ ref('finance_campaigns_day') }}
GROUP BY datemonth
