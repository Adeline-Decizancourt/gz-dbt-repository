WITH sales_margin AS (

SELECT
    *,
    ROUND(quantity*purchase_price,2) as purchase_cost,
    ROUND(revenue - (quantity*purchase_price),2) as margin,
FROM 
{{ ref('stg_raw__sales')}}
JOIN 
{{ ref('stg_raw__product')}}
USING (products_id)
)

SELECT *,
    {{margin_percent ("margin", "revenue")}} as margin_percent, 
FROM sales_margin

