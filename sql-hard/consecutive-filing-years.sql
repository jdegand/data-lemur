WITH turbotax_filings_cte AS (
  SELECT
    user_id,
    EXTRACT(YEAR FROM filing_date) AS filing_year,
    LAG(EXTRACT(YEAR FROM filing_date)) OVER (
      PARTITION BY user_id 
      ORDER BY filing_date) AS previous_year,
    LEAD(EXTRACT(YEAR FROM filing_date)) OVER (
      PARTITION BY user_id 
      ORDER BY filing_date) AS following_year
  FROM filed_taxes
  WHERE LOWER(product) LIKE 'turbotax%'
)
SELECT DISTINCT user_id
FROM turbotax_filings_cte
WHERE (previous_year = filing_year - 1 AND following_year = filing_year + 1)
ORDER BY user_id;
