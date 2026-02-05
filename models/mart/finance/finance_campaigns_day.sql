SELECT
    finance.date_date,
    operational_margin - ads_cost AS ads_margin,
    Average_basket, 
    Operational_margin,
    ads_cost,
    impression,
    click,
    quantity,
    Total_revenue,
    Total_purchase_cost,
    margin,
    Total_shipping_fees,
    Total_log_costs,
    ship_cost

FROM {{ ref('finance_days') }} finance
JOIN {{ ref('int_campaigns_day') }} campaign
ON finance.date_date = campaign.date_date