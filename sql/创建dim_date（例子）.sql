CREATE TABLE dim_date AS
SELECT DISTINCT
  date AS date_key,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  TO_CHAR(date, 'Month') AS month_name,
  EXTRACT(DAY FROM date) AS day
FROM fact_events;