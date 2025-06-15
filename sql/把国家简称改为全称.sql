UPDATE dim_country
SET country = CASE country
  WHEN 'US' THEN 'United States'
  WHEN 'CN' THEN 'China'
  WHEN 'GB' THEN 'United Kingdom'
  WHEN 'FR' THEN 'France'
  -- ...（其余国家省略）
  WHEN NULL THEN 'Unknown Country'
  ELSE country
END;