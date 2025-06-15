SELECT
  e.user_id,
  e.type,
  i.price_in_usd,
  d.date_key,
  c.country
FROM fact_events e
JOIN dim_item i ON e.item_id = i.id
JOIN dim_date d ON e.date = d.date_key
JOIN dim_country c ON e.country = c.country_id
WHERE e.type = 'purchase';