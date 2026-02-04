WITH shipping AS (
    SELECT
        orders_id,
        ROUND(SUM(shipping_fee),2) as shipping_fee, 
        ROUND(SUM(logcost),2) as log_cost, 
        ROUND(SUM(ship_cost),2) as ship_cost
    FROM {{ ref('stg_raw__ship') }}
    GROUP BY orders_id
)

SELECT
    o.orders_id, 
    o.date_date,
    ROUND(SUM(o.revenue),2) as revenue, 
    SUM(o.quantity) as quantity, 
    ROUND(SUM(o.purchase_cost),2) as purchase_cost, 
    ROUND(SUM(o.margin),2) as margin,
    ROUND((o.margin + s.shipping_fee -s. log_cost - s.ship_cost),2) as operational_margin
FROM 
{{ ref('int_orders_margin') }} as o
JOIN 
shipping as s
    ON o.orders_id = s.orders_id
GROUP BY 
    o.orders_id, 
    o.date_date,
    o.margin,
    s.shipping_fee,
    s.log_cost,
    s.ship_cost
ORDER BY o.orders_id DESC
