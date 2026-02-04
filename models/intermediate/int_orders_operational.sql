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
    s.orders_id, o.date_date,
    ROUND((o.margin + shipping_fee - log_cost-ship_cost),2) as operational_margin
FROM 
{{ ref('int_orders_margin') }} as o
JOIN 
shipping as s
USING (orders_id)
ORDER BY orders_id DESC