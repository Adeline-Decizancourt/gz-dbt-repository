SELECT
    date_date,
    paid_source, 
    campaign_key, 
    campaign_name,
    ROUND(SUM(ads_cost),2) as ads_cost, 
    ROUND(SUM(impression),2) as impression, 
    ROUND(SUM(click),2) as click

FROM {{ ref('int_campaigns') }}
GROUP BY
    date_date, 
    paid_source, 
    campaign_key, 
    campaign_name
ORDER BY date DESC
